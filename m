Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B32613C9DA8
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 13:21:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A805F6E5A4;
	Thu, 15 Jul 2021 11:20:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F09576E5A4
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 11:20:55 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id u1so7325880wrs.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 04:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=VujR+RG/xHuDo2Jj/n++B3DGmrisPobQrMRb6HDhkOU=;
 b=Euo25SnUR8y/xIH4wZ+DcBaGxBPQdJAkAKhJE4pxtSQ99ChleOcLf06Un+9H72r4/W
 0Rdp+KzRiHnC4dxDzncSwz3ZK83TxdLTEmqhEJAOonY8qUKU6sTBOIrKn4xg4IkvdHyN
 RVh1eL77hG8P3t7j6V/AX8csFP68dbqj+Evgcr5Cd3fK3Q9kD+UVv/Iim7S/FilKL0qR
 QrfpmNiy+8JLGFO5jSw0YUyOJ+a9nQLG/yZWMCz9CC2rzO5SsvKV9s0E8hX4s6DekW0F
 16XHqtkeLFg9AR7jRSBS7PZWCfbEHTZBYVghenVLdz0ccgcIm3a5baL5uw21FhZCVHZq
 nzrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=VujR+RG/xHuDo2Jj/n++B3DGmrisPobQrMRb6HDhkOU=;
 b=QUQI8/Fnx+LKVL4Rg4xWDPW5JpDmVOQ7s4RQJ4He+qkEi4imm/n/nxWXmYVTfNN516
 sG9PLKvH0I92sxjg1pGrh6X3IbfWLxv85Ns/43tAvjsQha0kaOf+msLsQZWIe+Bv9wJ7
 fbGhHnCL1BcBELpnNmWScweYWZR3zAW4YRUjoGV5mLFDK/KdAyRmz90dqSH2LwVwkSO0
 rX/AToxepttsKF1UA3yk0AX+QRVC09uFasReOYOtzESOqXltOasarUJvUwM3IM8FDjFy
 A2Hy4xYN3BcQ9bdyLzub9tN8HVr+I7unu9DIyKsauOQ8kjviY9lwm3rarLpylUpcl6Lv
 FVmA==
X-Gm-Message-State: AOAM531X9kdXHwPp8kPjSu+73PwXu9Xj5g6BIqTW2u5rHcwmh5b1rAkx
 sA7reZSEqe4/Msv3xgUYQqWdKg==
X-Google-Smtp-Source: ABdhPJyYTHhMv+lyjlzAvNZqFRBCgFbp4UAevLihRGGlZhdmskEj4ptYiSpmCOauw85Ayb65udVA0w==
X-Received: by 2002:a05:6000:154c:: with SMTP id
 12mr4921083wry.393.1626348054686; 
 Thu, 15 Jul 2021 04:20:54 -0700 (PDT)
Received: from google.com ([109.180.115.218])
 by smtp.gmail.com with ESMTPSA id x8sm6171255wrt.93.2021.07.15.04.20.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jul 2021 04:20:54 -0700 (PDT)
Date: Thu, 15 Jul 2021 12:20:52 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] backlight: ktd253: Stabilize backlight
Message-ID: <YPAaFMC62hApTG9g@google.com>
References: <20210604063201.3235245-1-linus.walleij@linaro.org>
 <CACRpkdbacfR52__8ZuwWV3B56w1KTvhOKe2_7OiVdPoLXrWbnQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdbacfR52__8ZuwWV3B56w1KTvhOKe2_7OiVdPoLXrWbnQ@mail.gmail.com>
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
Cc: Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, newbyte@disroot.org,
 Stephan Gerhold <stephan@gerhold.net>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 13 Jul 2021, Linus Walleij wrote:

> On Fri, Jun 4, 2021 at 8:34 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> 
> > Remove interrupt disablement during backlight setting. It is
> > way to dangerous and makes platforms instable by having it
> > miss vblank IRQs leading to the graphics derailing.
> >
> > The code is using ndelay() which is not available on
> > platforms such as ARM and will result in 32 * udelay(1)
> > which is substantial.
> >
> > Add some code to detect if an interrupt occurs during the
> > tight loop and in that case just redo it from the top.
> >
> > Fixes: 5317f37e48b9 ("backlight: Add Kinetic KTD253 backlight driver")
> > Cc: Stephan Gerhold <stephan@gerhold.net>
> > Reported-by: newbyte@disroot.org
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Hm it seems this patch did not make it into v5.14-rc1, could it be applied
> as a fix for the -rc:s?

Ah, it was sent late in the cycle, so I postponed it.

> Shall I resend it with Daniel's ACK?

Yes please.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
