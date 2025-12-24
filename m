Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7108CDC9CF
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 16:00:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1353A10FAD5;
	Wed, 24 Dec 2025 15:00:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="MPfKQr+2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E48010FAD5
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 15:00:21 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-37bb8bef4cdso57159481fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 07:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1766588420; x=1767193220; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+VotDjDGwrSy++mMVTEfhBltHueShcKJfP8HrsLcqqs=;
 b=MPfKQr+2ynGfjWfvsOwbQMoeDLfR9bBZTaOETazerkGhX07cxHiz28ADP9+K+kW7NF
 Ztmx4EE/lmuMRtNduZiPVsri4Prv/mZy0Hz/wSUgSY6hBjb9NPKoI/EJ5mVIhkEPafM1
 MSaglGsXcAFrbjR8JYAOJlSNNcxtXMgzElmhJnfLy/LiF0Qe+UCPN5AUqLz0ogUZ4J0Y
 1exUfzMSSYc1ow8w4e9MPl3vAjKGhcfic1hA4+qRK6V+ftrDcNCJopvvMOwefLc1K9EU
 wUuOxKSvOAM9uE4oCq8LM43PSjhWwDQIHkoxATDb1/FM01mvFceGio+Ut+H8RYKQXmKC
 D2lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766588420; x=1767193220;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+VotDjDGwrSy++mMVTEfhBltHueShcKJfP8HrsLcqqs=;
 b=vrbaAonK2sHIk3uZzcClmESpD+ff7r+oEWtEJNBewKDZYMEP8eS5bfDlicrlGNVlB0
 NFlMxXewDENFc9Qn4qsinQub6WR9Xw5Zj+YxXBezJoMdnkuINvRos3TMnaUWjlLZmFn6
 sJZtgQ6B9j3Xz21H6ABTwK9FABBE2gPwEmV/TMUws59fOyXqdUH8UIOh1SCD9ZrQSYyJ
 EruUcWdXyPqJy8b6R59vUtwGSCrLzyHWvvzRHrFUfaElNIBkNbqLCxzpU4+tVDyKY7oU
 PXJkdO1rZFG8PVj9dTuVg5G5jU7hWXYl9bfBlL6VEnspSWtUdaWTe2nmQBdoAbv0rFSm
 Qyhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkPasP6+x3W5Jyc8mSoQmX294OgGlubCTY8y70Ce96DxjPUoGUQQ+tT/5rOxDfvHBpo5dvjQFbPU0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0fszK4nYunuZxnI0yAccGEmCuV9IYYocabognMMgBMy5DYzen
 y88IDteVC4El2GzyhTzub8wc1JaaiCDxTnWe3ItO8uvX0TgZp7uCk4SPn+KoV7TuS3NhqDOiG5i
 Bq3a3oofPOZKaAUfpJsQGUpYfIm/RkKjDy5AwlsNmLw==
X-Gm-Gg: AY/fxX4tu3lLG/wKL25GQnfAQNlerwvi4DYk8Zq33atgcDUNlNd2c8zCSkeTE1K09u/
 7OnC3/VZV7RorzF6V+eAnIrKr43+gMhe1oUMfg/8a6gXhkFNHwJmY2xlE4lx+zq4yyr+iioAKLS
 IhOtS6EzS5t30+Li/7KQrFplEscq+T/+yfM2bq0zZSzBUVpF9Hrs2TVdBtcxsTVkWHn1zvUgkrF
 3APWj+QlaMbbpwd9h6EOAHZO2pz3hXoQVMvMqc2BBws9wXvdEexCj2bPVOj4oIgzrzFwc6R9jFp
 pqEQMwdjg1Q2NWnOhRPA/ARE/jJ/
X-Google-Smtp-Source: AGHT+IEY4terFFfT3m/yvNBOxpR07bNvu0VxNYVLrTFNZFhSTLAl6A2ZhWcpu+mDMsOePnj/FyvOQzhiynl01nwslsE=
X-Received: by 2002:a05:651c:31d6:b0:37f:e22c:5ddb with SMTP id
 38308e7fff4ca-381216b9300mr59739561fa.38.1766588419743; Wed, 24 Dec 2025
 07:00:19 -0800 (PST)
MIME-Version: 1.0
References: <20251105101134.82064-1-marco.crivellari@suse.com>
In-Reply-To: <20251105101134.82064-1-marco.crivellari@suse.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 24 Dec 2025 16:00:08 +0100
X-Gm-Features: AQt7F2q8oqON58GYql7t0ISPihh3Qp9rUC350VEE9YRWde48dDlVG3qTTYoJsb4
Message-ID: <CAAofZF7Nd6GJH5Au3qhwFv-i4h2QwnxBRuVkjATf_QM1tNquzA@mail.gmail.com>
Subject: Re: [PATCH] drm/vc4: hdmi: replace use of system_wq with
 system_percpu_wq
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Michal Hocko <mhocko@suse.com>, Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 5, 2025 at 11:11=E2=80=AFAM Marco Crivellari
<marco.crivellari@suse.com> wrote:
> [...]
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Gentle ping.

Thanks!

--=20

Marco Crivellari

L3 Support Engineer
