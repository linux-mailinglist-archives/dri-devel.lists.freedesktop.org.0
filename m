Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3518310EA2
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 18:27:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47FC06E06E;
	Fri,  5 Feb 2021 17:27:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2E6F6E06E
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 17:27:22 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id d16so8486800wro.11
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Feb 2021 09:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=57hN2GX2fOmK+gi5nUMMd3VUYxIsCMVyNsJ1zMHUCgA=;
 b=HxlCgBlXEaOOwp9QsrAyntne/NLlgcwb+PaWsf6FekqUouVdtmCp5xpegyeoAKkaiB
 LbzeHxTNcVo8oQyYSOl8VUd0n0+6la7PBheXurlT56YCdE2WhiUv85LoMoCDh7mxazVi
 I7steKukPuRwA1EZPzp6M/gc16KBPVfaFmhBXrm29qk7gn5KURd4ikmF4yqqNgYeaxjK
 FUgHonZezv+xiOcIl/srY0ljJrN9/eulrHiLDSg9BYKwHMGMMtmE0kcmUGNjolflluwd
 TRggIRsQpd6BWbFKalZR5LZkwWdilB5EJbEztSS5H1Ilo3KMqZuERBq+lhBaLjdzHoFX
 kd4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=57hN2GX2fOmK+gi5nUMMd3VUYxIsCMVyNsJ1zMHUCgA=;
 b=OicoA2ddfgk9nZ9EHiOycW1rbINsNV+6Vt09guqMD5mfN10L1iQtwm4IpnkjCHEoWt
 nc/wo17vFkqY5zvE6/Hilijv06H1e75cWYfIWrG0n9ep42eHN8WB2cuTKEQKvFdt9toh
 m7t65d950060jIm3ibasLrQEC63JqBxinT13CnWFYg4xS0smEoV2rgy7AFlSNvJHFVou
 vt3IrqE4oBlpF/UwwylQAbrn/bw+iUtkpWFiMuTvSZl5fLchKM7z1Yplqgv0yfdYP0u4
 99BlRHF+GhJ3C8iBfLPzx504oQEh9Y5nxiJJV/kFgfjb6dXlQ5lvkgPfF2CasnHH6WfJ
 DWQA==
X-Gm-Message-State: AOAM5323qOUdQd/Dlfeh8Xc2F+5bSHCTupADH+A2PK6Fz9o54cUZlSxm
 0fYgs6vhEfFe48dRIw2EiqXFZA==
X-Google-Smtp-Source: ABdhPJwymMag1NOdNFfpMXGX+ftO0p0ZoXIn53dcF5zegOZ2s6HCCXiZtUnouftLPa/0rP1MZENGCQ==
X-Received: by 2002:adf:d20c:: with SMTP id j12mr6109084wrh.407.1612546041456; 
 Fri, 05 Feb 2021 09:27:21 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id f3sm10227354wme.26.2021.02.05.09.27.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 09:27:20 -0800 (PST)
Date: Fri, 5 Feb 2021 17:27:18 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] backlight: ktd253: Bring up in a known state
Message-ID: <20210205172718.dajtb5yc3haatz3z@maple.lan>
References: <20210126213200.14366-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210126213200.14366-1-linus.walleij@linaro.org>
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
Cc: Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 26, 2021 at 10:32:00PM +0100, Linus Walleij wrote:
> The KTD253 backlight might already be on when the driver
> is probed: then we don't really know what the current
> ratio is and all light intensity settings will be off
> relative to what it was at boot.
> 
> To fix this, bring up the backlight OFF then move it to
> the default backlight from there so we know the state.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Hmnnn... horid, since the backlight will flicker during boot,
but I recall that this bit of hardware is pretty horid anyway
so it is not easily avoided.

Therefore, slightly grudgingly,
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
