Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6020A8617F5
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 17:31:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4632E10EC60;
	Fri, 23 Feb 2024 16:31:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kO2AX4SW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B8C310EC61
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 16:31:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4920E63575;
 Fri, 23 Feb 2024 16:31:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CB7FC43142;
 Fri, 23 Feb 2024 16:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708705872;
 bh=9KObiyXeBDrFMyADFic1+zEVpdJvGxx+oX+zDNIjVi8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kO2AX4SWo1L3W2khLMFbuzILafe1Zbp5P4pYVZSAzZhKDlUp03DU+7qOFFvERY50t
 HfiOMJlGJkuHonfrOEx2wCkPIVRyNk/9X/FGQGgvOh4eiA3Pe5wQ1GYWBxSKKDHEQU
 4aLTISzXtUNUsFHvtqUFAU+UJ0SKlHlWa3DnqBKLeSHhw3vbqMR7sXKvUZKc0xvBEI
 LI4+dgQrDC7NgvveeQqrog/oxyBwx6FbNt5zIiBrECpHyAn6UIvEroeQHnK65Gbv9e
 ZrYwXjzIe35YQi/qcwFdWKwueVr0KzecCqlQolIV7XQTdVusXlJDB6mmkV2IdZaSaP
 N2RGIxmBhMe9A==
Date: Fri, 23 Feb 2024 16:31:08 +0000
From: Lee Jones <lee@kernel.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>, Luca Weiss <luca@z3ntu.xyz>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 0/4] Ensure all backlight drivers zero the
 properties structure
Message-ID: <20240223163108.GL1666215@google.com>
References: <20240220153532.76613-1-daniel.thompson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240220153532.76613-1-daniel.thompson@linaro.org>
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

On Tue, 20 Feb 2024, Daniel Thompson wrote:

> [Sorry for the RESEND so soon... embarrassingly I got Lee's e-mail
> address wrong the first time!]
> 
> Luca Weiss recently shared a patch to zero the properties structure for
> lm3630a... and shortly afterwards I realized I should probably scan for
                                      ^

> a similar class of errors in other drivers.
> 
> Results follow in the next four patches (they could all be one patch but
> for the fact there are different Fixes: tags)!
> 
> Daniel Thompson (4):
>   backlight: da9052: Fully initialize backlight_properties during probe
                             ^
>   backlight: lm3639: Fully initialize backlight_properties during probe
                             ^
>   backlight: lp8788: Fully initialize backlight_properties during probe
                             ^
>   backlight: mp3309c: Fully initialize backlight_properties during probe
                              ^

I think you may have the wrong locale set mate! :)

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

-- 
Lee Jones [李琼斯]
