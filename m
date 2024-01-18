Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C28C83184A
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 12:16:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3823810E77C;
	Thu, 18 Jan 2024 11:15:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0B9810E760;
 Thu, 18 Jan 2024 11:15:29 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-50eaabc36bcso15176533e87.2; 
 Thu, 18 Jan 2024 03:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705576468; x=1706181268; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9VE+k6l54CWKcwOP4zGe/Sl1ruOg42q4FivpaiWmeH4=;
 b=RAj+XcYx9zt66Sjn3TrtEI5h9NPz26G8EA3H2scxjitJnk92Snf8F7nEozSsaM8Ydk
 svYCzrBKtYNE3rBzV+sJNZ/hytk6mrwRdR51BM+xZkGH6InnYHzN/Ti/FtqlzEOvgk+V
 W4P1OytUr8ZExuf9t+97inkzxEhGTvTuIOUnM+FrOYw8wYj64bQUXosuBhNaKtS0zcpI
 yeEkV8+BWLa7rqvTYyibh5faRF9dbgZ5diDUXjuozsDvvwvDIwHcBpbDl3lTvfT+1lT6
 k7hkJpKoqN+w4ACbFjV91VxNGiY/bvoLDEarvNORNl0TtlmL8Oiw3Em/FE9Jp8xJjD2C
 ZErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705576468; x=1706181268;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9VE+k6l54CWKcwOP4zGe/Sl1ruOg42q4FivpaiWmeH4=;
 b=B9Zdbu5A1Y5laTSV7r5Gn0ChXUtRs9tNBJfJZx5g2zaaUWOxfyCebl9skL/OjNLH90
 783huGjjHCZlIgn6kxYfl7nTOQBsmqjNWQKPXWn7L4n7Kely7YSPZ7zLR2wVVh1fhWcY
 qFNqUiU3975huimjEPsZircPJmmt8dcH+aVw+LWnuDCOPJsopDWbCYUWaOm1nixzkeoe
 0jrHyW0pKhhSwWHqbVTeqycF1iJ8Pjsx7/W6cEq2d3ckdOEi1Q2IS1Bt1InD3wTxneaN
 ZZPfwPKgRF2xuAxifnm6f6/ryNg+Ooed8tiLM3zt4du/mwKOQWedOYpGUHF/z/cJbHYd
 TPrw==
X-Gm-Message-State: AOJu0YxjAqHWQeVhd0zI/bQfeuF2uiK9b82mnph5qBVNWDT3XsA9G+57
 0426jMlwpvgWGmIuSBbVjJQ7zaSpHqjns3vRmU8wM503ZJAbA6VEF+aEXfQtL2q67aq82J4Ieuv
 pSnPCr/XxIxpsbXZeRgbmMn4lMrw=
X-Google-Smtp-Source: AGHT+IGOekbppaoWwtk6ccGkeyMaF+QoO4HCmiuvByTKTlT9lg50wbR2VnXSzaFKEIzE7zcwlzczulK9pp0kkERFa9s=
X-Received: by 2002:a05:6512:2813:b0:50e:d3dc:2645 with SMTP id
 cf19-20020a056512281300b0050ed3dc2645mr499069lfb.87.1705576467890; Thu, 18
 Jan 2024 03:14:27 -0800 (PST)
MIME-Version: 1.0
References: <20240117031212.1104034-1-nunes.erico@gmail.com>
 <20240117031212.1104034-2-nunes.erico@gmail.com>
 <CAKGbVbsydzXyKuhN8VyW9zYwuOMWzvz192WKKReHVX1XCnuXGQ@mail.gmail.com>
In-Reply-To: <CAKGbVbsydzXyKuhN8VyW9zYwuOMWzvz192WKKReHVX1XCnuXGQ@mail.gmail.com>
From: Erico Nunes <nunes.erico@gmail.com>
Date: Thu, 18 Jan 2024 12:14:15 +0100
Message-ID: <CAK4VdL2PnWTZ+M2eQqF22+VuF-YGKb_WjG=168BcuBDqD8+9kA@mail.gmail.com>
Subject: Re: [PATCH v1 1/6] drm/lima: fix devfreq refcount imbalance for job
 timeouts
To: Qiang Yu <yuq825@gmail.com>
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
Cc: Daniel Vetter <daniel@ffwll.ch>, lima@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, anarsoul@gmail.com,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 18, 2024 at 2:36=E2=80=AFAM Qiang Yu <yuq825@gmail.com> wrote:
>
> So this is caused by same job trigger both done and timeout handling?
> I think a better way to solve this is to make sure only one handler
> (done or timeout) process the job instead of just making lima_pm_idle()
> unique.

It's not very clear to me how to best ensure that, with the drm_sched
software timeout and the irq happening potentially at the same time.
I think patch 4 in this series describes and covers the most common
case that this would be hit. So maybe now this patch could be dropped
in favour of just that one.
But since this was a bit hard to reproduce and I'm not sure the issue
is entirely covered by that, I just decided to keep this small change
as it prevented all the stack trace reproducers I was able to come up
with.

Erico
