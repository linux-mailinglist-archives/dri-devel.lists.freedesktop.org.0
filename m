Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EEB88E6B0
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 15:41:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D3310FD3D;
	Wed, 27 Mar 2024 14:41:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GEi97qAG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C1A110FD42
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 14:41:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id EEB34CE250F;
 Wed, 27 Mar 2024 14:41:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEF28C433C7;
 Wed, 27 Mar 2024 14:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711550504;
 bh=J5RwImEVko3XXHlw0U1eaYiyHIrUU00GRqnsbrUSwkU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GEi97qAGxxDSmBrAC7IzOexogPNDn/APGkN2rJ8itsCq9qcKcloXZLBGX8Zp7MhvS
 uzL/ceINB5eQySXzxrejzkVO2pP2dgOUKcimaZ9/WttzaMS/S9Bf76agvM+wLteZMm
 0LMrYtpO/2v6FS329OVSVLfisw4akytslQpZOEms1ufa9mfCaCI4Zx2VZTePxe+Nki
 ySQYif7aCvXM4ca+9/xXRdeEM7YgV1AREFYvzmUORz/8wTnNY10cJSl0Iayh6fJbq5
 LWwvWWFmQNGs4nlakh2UFyBvm1Mgj2XlTh3459Ib/ZsqZi/vr16EKkqpUkLF1bNc2g
 fSP5XRbH0L4yA==
Date: Wed, 27 Mar 2024 14:41:39 +0000
From: Lee Jones <lee@kernel.org>
To: daniel.thompson@linaro.org, jingoohan1@gmail.com, deller@gmx.de,
 andy@kernel.org, geert@linux-m68k.org, dan.carpenter@linaro.org,
 sam@ravnborg.org, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 0/6] backlight: Remove struct
 backlight_properties.fb_blank
Message-ID: <20240327144139.GT13211@google.com>
References: <20240319093915.31778-1-tzimmermann@suse.de>
 <171155045756.1586093.3975287359071936779.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <171155045756.1586093.3975287359071936779.b4-ty@kernel.org>
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

On Wed, 27 Mar 2024, Lee Jones wrote:

> On Tue, 19 Mar 2024 10:37:19 +0100, Thomas Zimmermann wrote:
> > The field fb_blank in struct backlight_properties has been marked for
> > removal. Remove it in favor of the power and state fields.
> > 
> > Patches 1 to 5 prepare several backlight drivers. They remove fb_blank
> > or replace driver code with existing helpers.
> > 
> > Patch 6 removes fb_blank from backlight core and drivers. This resolves
> > another dependency between backlight nad fbdev.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/6] auxdisplay: ht16k33: Replace use of fb_blank with backlight helper
>       commit: 7f17d16ea8b470e068bf53835bf05a995bc445db
> [2/6] backlight: omap1: Remove unused struct omap_backlight_config.set_power
>       commit: 06239b0914ad09e3f051f5f36280206f09533622
> [3/6] backlight: omap1: Replace FB_BLANK_ states with simple on/off
>       commit: c42cf539bed201cb774c65b8963faf7aaf5633f7
> [4/6] fbdev: omap2/omapfb: Replace use of fb_blank with backlight helpers
>       commit: fa10b6597b12a384357f422bb160d2833d2bba22
> [5/6] staging: fbtft: Remove reference to fb_blank
>       commit: d126df04320d4d82bc85273b8af89ea0a22565d3
> [6/6] backlight: Remove fb_blank from struct backlight_properties
>       commit: 95342cdb3f438d378f48e4db188aa217b9b0a66e

Sent for build testing.  I'll report back once complete.

-- 
Lee Jones [李琼斯]
