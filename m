Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7E6218874
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 15:06:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F3D6E8C2;
	Wed,  8 Jul 2020 13:06:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D2396E8C2
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 13:06:38 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id w3so3024542wmi.4
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jul 2020 06:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=oLDzCYJWqSNQ9M1Ha7TNoiTF86yo/dq5RVgwN+Hsw1U=;
 b=njp2qXt1BaQ9kGGg90luhkLagzFxxSHWZIvLMjW4ava2YlPKpTyY1GIKzjAH7bLwrS
 inHWc6CpR96XN/KM/jhpCmu0rpF5hbLSxq6FrbQCw8CSjwSUKgNw/feC5qcZDyfd6kdm
 fqSSom5qrymbjRD5NGi9tFXYrB0um5EGRsT7zjfn39+/2jyEmUdHDgiIOKUutaNemg3E
 qbkBmJquE063NY/LDkwIVbVwAS96Wuup42pGE5Y/2UWyC6zfXwBQ6x+GdBXbbsspgbBD
 3/0a5CUliPqvgIRb2V8+iVZj3YdbZrXEgme8zlejZWv+NQ9TSPXNC3LTdveW3kJXoBBB
 VEVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oLDzCYJWqSNQ9M1Ha7TNoiTF86yo/dq5RVgwN+Hsw1U=;
 b=s8drQR5j29wsYbcn92JaFWR87MHu3k28bS7KcK16bPD1eqvtclcPiqbT56BHoTZKE1
 mA9R0uSJOD64HjCqbJWQAMPKwLKob/WYMoWLquFxKdwDfp1MkubOmqEYZwdGVSW9bhA2
 P3LDIeAtrZRfq0X+wdWD4c7rAU9OxTE+tlRySnwTD+ZxZ1ssF2A/Wdxb2R6OKf56oegE
 thN0T6WTcUVsI02vA0uBygcE6SKuTXbB5A0YuL75wnhHIiMVEGCqC9B4Sp1r3eKIVFGp
 57V+2u1WENiQR9f0wMzWOP0p8/soNtTva2SIPOGAlw6kT05PYOW70jR16QXbPAsnPjvS
 5tZQ==
X-Gm-Message-State: AOAM533caMXQRtLUt8ae7/69lUQbGLa7vmXuBvgNBGgGog/4z+usIk0n
 wFb7fGzrOGDf3xIzvsYHdnLG0Q==
X-Google-Smtp-Source: ABdhPJycffceCLL7aGQilAq3ooqxDBsNO0dVSgTCtQTuz32w5GffuQpcf1XdckbErcpZYECigf7F+A==
X-Received: by 2002:a1c:81d3:: with SMTP id c202mr9208740wmd.54.1594213596871; 
 Wed, 08 Jul 2020 06:06:36 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id z10sm6072444wrm.21.2020.07.08.06.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2020 06:06:36 -0700 (PDT)
Date: Wed, 8 Jul 2020 14:06:34 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/1] video: backlight: sky81452-backlight: Fix some
 kerneldoc issues
Message-ID: <20200708130634.5tttrzlq2zfx7uho@holly.lan>
References: <20200708130419.3445042-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200708130419.3445042-1-lee.jones@linaro.org>
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, Gyungoh Yoo <jack.yoo@skyworksinc.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 08, 2020 at 02:04:19PM +0100, Lee Jones wrote:
> Firstly, all lines must begin with a '*'.  Secondly, arg descriptions
> must be spelt correctly, so fix misspelling of 'gpioD_enable' and
> 'short_detecTion_threshold'
> 
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/video/backlight/sky81452-backlight.c:46: warning: bad line:                 If it is not defined, default name is lcd-backlight.
>  drivers/video/backlight/sky81452-backlight.c:64: warning: Function parameter or member 'gpiod_enable' not described in 'sky81452_bl_platform_data'
>  drivers/video/backlight/sky81452-backlight.c:64: warning: Function parameter or member 'short_detection_threshold' not described in 'sky81452_bl_platform_data'
> 
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: Gyungoh Yoo <jack.yoo@skyworksinc.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
