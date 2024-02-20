Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C2285C1B1
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 17:48:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B15B10E4F6;
	Tue, 20 Feb 2024 16:48:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=z3ntu.xyz header.i=@z3ntu.xyz header.b="Dwn4aPsb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B847410E4F6
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 16:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=s1;
 t=1708447695; bh=5ug8sqZ+EHeY/Ph1ShtPeGnxemtNhiuWDUEotTR3KbY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Dwn4aPsbZsQRT1WJnxBrccDOUgprF5FMg2ktiHYYTN8QG8nxZv1bv49yD4ztyBEnh
 5fMVkzfktOXRlelEl8s1KXR90QZzCXsZc+n6QbEZdb3QAqPmAy0xn5GJDLqyNnw9Ro
 3e5CAMNm6IG9zCX8iVjfeLUCWA1PIzdH4DuCgKqQ=
From: Luca Weiss <luca@z3ntu.xyz>
To: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 0/4] Ensure all backlight drivers zero the
 properties structure
Date: Tue, 20 Feb 2024 17:48:14 +0100
Message-ID: <2007720.tdWV9SEqCh@g550jk>
In-Reply-To: <20240220153532.76613-1-daniel.thompson@linaro.org>
References: <20240220153532.76613-1-daniel.thompson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

On Dienstag, 20. Februar 2024 16:35:23 CET Daniel Thompson wrote:
> [Sorry for the RESEND so soon... embarrassingly I got Lee's e-mail
> address wrong the first time!]
> 
> Luca Weiss recently shared a patch to zero the properties structure for
> lm3630a... and shortly afterwards I realized I should probably scan for
> a similar class of errors in other drivers.

Thanks for fixing the other drivers! Was definitely a fun one to debug :)

> 
> Results follow in the next four patches (they could all be one patch but
> for the fact there are different Fixes: tags)!
> 
> Daniel Thompson (4):
>   backlight: da9052: Fully initialize backlight_properties during probe
>   backlight: lm3639: Fully initialize backlight_properties during probe
>   backlight: lp8788: Fully initialize backlight_properties during probe
>   backlight: mp3309c: Fully initialize backlight_properties during probe
> 
>  drivers/video/backlight/da9052_bl.c | 1 +
>  drivers/video/backlight/lm3639_bl.c | 1 +
>  drivers/video/backlight/lp8788_bl.c | 1 +
>  drivers/video/backlight/mp3309c.c   | 1 +
>  4 files changed, 4 insertions(+)
> 
> 
> base-commit: b401b621758e46812da61fa58a67c3fd8d91de0d
> --
> 2.43.0
> 
> 




