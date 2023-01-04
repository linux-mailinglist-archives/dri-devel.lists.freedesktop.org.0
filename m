Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 117BD65DB09
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 18:17:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A38D10E5D8;
	Wed,  4 Jan 2023 17:17:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0B0D10E5D2
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jan 2023 17:17:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 37C71617C2;
 Wed,  4 Jan 2023 17:17:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E9BFC433F0;
 Wed,  4 Jan 2023 17:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672852634;
 bh=flCRzPb0Fn/y+JbT6SPfEuNtl01OMb1WGCSQgr8q+sE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YIkzxo70Qhk/3IV9GhD0kIAbJPcx9Piiij1rPPyZlOw3UsVv4PxKwBfWtoDopSUB1
 RyXmRTIZAZKIskE9hWQdA83+hu2WAkVPv2mruhTF3QakpYDhHmN0VuhtoJoKBRaOw+
 kCdgI0PU3c/ydAWT84HAUPygbhiTcuMhQvddCLgu6eT992YDnIDl6H783KBNFEsgie
 d2h4O8/cKulJhmy2ulRYGS0+WI5CrrZ+o61YnRBiCwym5n1SBMldAWRNAGiIdH4pxY
 3/pnr8qk7C47nilEnTYZoNydhwUiWkXidDUWtNxsGdaRRe+shlqSBR4wIyBtcAvVn+
 f58Es7zvTtWwQ==
Date: Wed, 4 Jan 2023 17:17:07 +0000
From: Lee Jones <lee@kernel.org>
To: Miaoqian Lin <linmq006@gmail.com>
Subject: Re: [PATCH] backlight: backlight: Fix doc for
 backlight_device_get_by_name
Message-ID: <Y7W0k8bQMH7cRbo8@google.com>
References: <20221215071902.424005-1-linmq006@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221215071902.424005-1-linmq006@gmail.com>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 15 Dec 2022, Miaoqian Lin wrote:

> backlight_put() has been dropped, we should call put_device() to drop
> the reference taken by backlight_device_get_by_name().
> 
> Fixes: 0f6a3256fd81 ("backlight: backlight: Drop backlight_put()")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>  drivers/video/backlight/backlight.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks

-- 
Lee Jones [李琼斯]
