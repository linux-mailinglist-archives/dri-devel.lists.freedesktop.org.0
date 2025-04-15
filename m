Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E3CA895EC
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 10:02:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 781A610E674;
	Tue, 15 Apr 2025 08:02:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jRyoas2/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4782110E674
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 08:02:09 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-30effbfaf61so57200151fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 01:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744704127; x=1745308927; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oEP9rni+HPtFUecXYpSc7d877m22l1NQuJbMRjFTHY4=;
 b=jRyoas2/MoXluNWi13+IF40t9AeTE30rCbK+OQpN3EFt5yuypBTkWqY5dSuE1azAvd
 nhmprCxGssw6SKeGWD6KtmI51AENqoX+VELoG4m5XumqKsgqa4Up8ZCeNx7Sp0oufoR7
 wJ8jVv8qGRyRdRnhfUDq1SsPInFmaVYl5a065jPAyIJLSvJsPh1otxiHrttnWQQkU/Aa
 7WpvHfkV0eBqRON57jlAlJkQ1n0GV9KACNrvbo9OleYxeSdOMTX2FQnYqZ5amAbAdNWB
 xcX2fLNgLYmogD//Ipt3H9nkhGrkzfyHMj5nWMxzzgL98vGyNZR8tB9xo2kOVMN+s1Gb
 oR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744704127; x=1745308927;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oEP9rni+HPtFUecXYpSc7d877m22l1NQuJbMRjFTHY4=;
 b=Nf1XV7xg9nBLucs6zxjR3/W8AhpNd1OCfUIMOKZ4oZYeR37CrD5p/8+ds3OGQ+QRhu
 fnz/Lc4EF5VXJMm26UnDqU8QGOkc19MfESXxAxQ9k6TpzGluPdKDsszstPRmZ64sdsUT
 9Nz4asnBK2HabEo21raQSMnX6BxIGQW9bSlLHPeb0CP6rEy+cnFJkmujxmUaCuZ7TZP5
 qDkBnN8pR1KmnYXiuJuBkaLzMd77Ul6wIPdXEorCW1lkC1TA/yENHmlYckypYJyKSMIb
 9XUavpsHInEsyngvrRaRgsSTrF/FgK8YYKV/ozsaPdBgYG+RV2pd+zUKenYERz2OdJ8j
 McmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSN27bkgL0vpEqQFS8CwKMmv7qmyeu77a2nLXmQcoVSRrwD4Fu6gCnVvBZb/0OHGSkpPFsxa87aio=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOpxKfob/rz+UlZEd7cDOqGN8sZDPT4sq3qIxJWWlsy1W0VGCp
 7y1UR1P9np8eUTew2W776DbOpSaZRujhaJcVf3hR+7LeODo1m2KZLcidAbnQFez/fN9CPX48n4J
 kxpk0OSgbrBg/22bFuzR3WeY4JXlCrGen4jrITg==
X-Gm-Gg: ASbGncu+xwWEvXqNG2iCYJsC8cqw/2PUKqBGce8Yw0jUJODj16+nGWsFB6mCm2+weMP
 TH34x4QiaTmTsqEQ/suLtgcwo2QSS3u9Da30fo7l28xrIOJ8kBlWk2MKMvA6r6pXMnk/1/igi8I
 2rzjU4lDdgr7MZiUnstrfmDg==
X-Google-Smtp-Source: AGHT+IGvwutFyLX9Bb5seSiQwkJQ59W66bNTBlQIEGpJEd0Q/se9VhKkzK0oCbRzEiZy9LcBhbBGbivtcnsPVljK2/0=
X-Received: by 2002:a2e:7214:0:b0:30b:e73e:e472 with SMTP id
 38308e7fff4ca-31071ce6ee2mr6688871fa.14.1744704127547; Tue, 15 Apr 2025
 01:02:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250401-b4-drm-panel-mass-driver-convert-v1-0-cdd7615e1f93@redhat.com>
 <20250401-b4-drm-panel-mass-driver-convert-v1-2-cdd7615e1f93@redhat.com>
In-Reply-To: <20250401-b4-drm-panel-mass-driver-convert-v1-2-cdd7615e1f93@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 10:01:55 +0200
X-Gm-Features: ATxdqUEOaEBEBYE-tkHN1WoFieXREPv4a0_F4MeFEiy73pmQAz2OT6XbexJWBW0
Message-ID: <CACRpkdZg-MNFc4k2g+j0QfBjzD4a3scmjOKtRBSr4_FtFYuCTA@mail.gmail.com>
Subject: Re: [PATCH 02/10] panel/arm-versatile: Use the refcounted allocation
 in place of devm_kzalloc()
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Joel Selvaraj <jo@jsfamily.in>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Tue, Apr 1, 2025 at 7:05=E2=80=AFPM Anusha Srivatsa <asrivats@redhat.com=
> wrote:

> Move to using the new API devm_drm_panel_alloc() to allocate the
> panel.
>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
