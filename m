Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A876744C7
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 22:38:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A979610E073;
	Thu, 19 Jan 2023 21:38:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2094310E26A
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 21:38:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7ACD161D84;
 Thu, 19 Jan 2023 21:38:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB3EEC433EF;
 Thu, 19 Jan 2023 21:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674164324;
 bh=FQJpoqxB6OaO61PvKyPRMDj1dmn+wD7csP9DHZDao1Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oM6m0WwBPsUWLaDpmDqxpqLwFwJQr0g2vnqyvRQ8PLnZvtZQshzk8GZa/qFTfOkc7
 2Ed9CgwtStzfPTesAmGmg+1CrFAdEqcVXehS/NdoHWgWgOGlQO7moagoYDGdi6b+R6
 EAyPCr352T35mGNsPlQivTjAHIgrGVAFgWikOupsxBd1eVIFe50nrhDfPtod11wrjd
 Rjwlx23za76bHDQoRt36xnIZZS4NlVWOBbF96B44b9we8dXbdKm0+gKEm2X6UTW4PI
 Zznzy3JnY6gR4JGCkCc8Z0Y7q2BaxnZnKuqaL7O19SFI1+xP59D3nmtSvoiLo7SpaT
 mOt7eHuRbtRqg==
Date: Thu, 19 Jan 2023 21:38:39 +0000
From: Lee Jones <lee@kernel.org>
To: Stephen Kitt <steve@sk2.org>
Subject: Re: [PATCH RESEND 2/4] backlight: arcxcnn: Use backlight helper
Message-ID: <Y8m4X1pB5h6sryFl@google.com>
References: <20230106164856.1453819-3-steve@sk2.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230106164856.1453819-3-steve@sk2.org>
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

On Fri, 06 Jan 2023, Stephen Kitt wrote:

> Instead of retrieving the backlight brightness in struct
> backlight_properties manually, and then checking whether the backlight
> should be on at all, use backlight_get_brightness() which does all
> this and insulates this from future changes.
> 
> Signed-off-by: Stephen Kitt <steve@sk2.org>
> ---
>  drivers/video/backlight/arcxcnn_bl.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Applied, thanks

-- 
Lee Jones [李琼斯]
