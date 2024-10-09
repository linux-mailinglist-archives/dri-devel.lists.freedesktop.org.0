Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E3F9969BC
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 14:15:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1895110E29C;
	Wed,  9 Oct 2024 12:15:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="pQD90ZKa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82AC910E29C
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 12:15:27 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-e28ee55190aso1543452276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2024 05:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1728476126; x=1729080926;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OuVN1M6bgeATUn/64hNmgkiXZcNncOEw3XxOlbpzawQ=;
 b=pQD90ZKaPx3snqQMvA+SbSzChxihLumU0DL+Ml5xSEnKUt9uC/F13tYPKBa34L5RnT
 EX318h8M2EiapellYbyy6p9v+3AGKdulGlnCJE68FyRjM6P3P9IifrokGBpHRa6vFZ8Y
 TKkDWn7pJ5gdtklrQ+LxGlzvKT0+mnC9u5mNQInE40MIdgOlRtSCjlgf1yCw4ldebA3y
 cCQjQuLXlT8xPqD8cC4YIrL+obu3aymKaM1R/tVsACMmn7nA4E8fGZ/nS70qe5JnF15R
 GokbDgWrqdLIt/cqEc1UkG3+uQdPetSDVpTD4ZbgappJHzKAd52elUNWS4AUfecB+llg
 Pm+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728476126; x=1729080926;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OuVN1M6bgeATUn/64hNmgkiXZcNncOEw3XxOlbpzawQ=;
 b=WuPQfKRmwlKLQF6WF3rL+5neWUFpg9QklfVG/uvBeISftz/VEG2M20UTFUMaA2e5m5
 1sSqFxF/n57pg5jMhc4HunxfzlAxtY8qs1r6U446+cs+Q1q+vDHIWg4TA7z7gdq2oe3j
 Z8JCY/ytnLPOVywXV0prYszv6/TytnnQEwdCfWFr0C74cf19/gAU3T5gceNT28f4oX+p
 OIgFnejhpTEjKMZAj7ZNn9FxEZWTdHphdXNP/f2FxDiuZgTK5s8MJ4I+1UYO/sK7iAst
 3nUIafv+NZeMyegoVqvZ8Ytps3f4YxzTP1OhBTEkiRNQ/G8IPcoEC+90C45ZlImu2yJy
 tCeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVF5yMxYDP0f+E8UoMYphafL+3piMszAPwSOODjgob6b1sNc4x6epBP57G+WrSikNO2wa9shHRoRV4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmXzxPHT1L8pEHwCmGE7sFDza90FusvwROaFXHQMSLv2N66bP8
 lHmKHbIZe1mGoEF6d5fFcSgf2ZukjU4onztjgxNOv7zJfKCCLUPAzYpESpQsKd9yIhJ/4ED8IYm
 doHZNiRmtdGoSntpNCsBK1JyiUuIWy3Y+WoIXgg==
X-Google-Smtp-Source: AGHT+IGH+mPZtcgiLwSwbLF6aVPi7xFylmQ8QnKfsrWUsP9o6sUsqNVzV0h22XmrQX/xE0hPvIi9MxOp5CYfizjtFnk=
X-Received: by 2002:a05:6902:1387:b0:e26:2bbd:29db with SMTP id
 3f1490d57ef6-e28fe38d0cbmr1933904276.33.1728476126456; Wed, 09 Oct 2024
 05:15:26 -0700 (PDT)
MIME-Version: 1.0
References: <20241008-drm-vc4-fixes-v1-0-9d0396ca9f42@raspberrypi.com>
In-Reply-To: <20241008-drm-vc4-fixes-v1-0-9d0396ca9f42@raspberrypi.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 9 Oct 2024 13:15:10 +0100
Message-ID: <CAPY8ntDFbGzPAOXZ=C80R=ymM6LGewua+xnWOY5JNbDxTP7bag@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm/vc4: 3 minor fixes from mismatched
 drm_dev_[enter|exit] calls
To: Maxime Ripard <mripard@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 8 Oct 2024 at 17:44, Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> These are 3 fixes noted from Marek's report that he was seeing lock
> held issues.
> The place he had noticed was actually triggered due to an incorrect
> change to a conditional, but also a further place was noted where
> it was possible to leave the function without calling drm_dev_exit.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Applied to drm-misc-next.

> ---
> Dave Stevenson (3):
>       drm/vc4: Match drm_dev_enter and exit calls in vc4_hvs_lut_load
>       drm/vc4: Match drm_dev_enter and exit calls in vc4_hvs_atomic_flush
>       drm/vc4: Correct generation check in vc4_hvs_lut_load
>
>  drivers/gpu/drm/vc4/vc4_hvs.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> ---
> base-commit: 2c34a5464007c45142af009d13c668b0630ef9c0
> change-id: 20241008-drm-vc4-fixes-4aceb259455c
>
> Best regards,
> --
> Dave Stevenson <dave.stevenson@raspberrypi.com>
>
