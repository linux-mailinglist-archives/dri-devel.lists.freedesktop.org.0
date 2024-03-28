Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9703D88FE3E
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 12:41:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D3541123D4;
	Thu, 28 Mar 2024 11:41:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Mwwfk5BR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3002C1123CC
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 11:41:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 74F7C6066C;
 Thu, 28 Mar 2024 11:41:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72B79C433F1;
 Thu, 28 Mar 2024 11:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711626096;
 bh=TY9UdTz3r/g/8VoI8unboOjtiBgPLji8N1MUYjw9Drc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Mwwfk5BRZF/2X+CIdxwFIXcyxaxEIIU3PRZH/lFenk/+rSm7CyDbxXjfT7gVPA8kB
 yLvTrVO3+wK9AHJhJxaJmEfVDR7f/rY2qZjN9Vcmxhw0Y6Zj1tLbggrbMxSpA+NUnN
 GBb5M7aGp+jX0cwUzVXZsC2Kb2v2xlgen2neBv0T9pVq7o0ppVj3D8V7EkTecFy9Nf
 t6MrZr/HJwS2mIX6S9ke+zfeUpqxdiASAo37YQCbAYHgXCUAnMlKxEqRh4q2Z9c9CL
 XlC5OkOMeu8o4hPzU4AUHP7qBAFZduH8XH17KYKxiBoLFQLZH40SF5MWoyJ7BpDmJZ
 dTNrwGp5eIGsQ==
Date: Thu, 28 Mar 2024 11:41:31 +0000
From: Lee Jones <lee@kernel.org>
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 0/2] video: backlight: constify struct class usage
Message-ID: <20240328114131.GB13211@google.com>
References: <20240305-class_cleanup-backlight-v1-0-c0e15cc25be1@marliere.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240305-class_cleanup-backlight-v1-0-c0e15cc25be1@marliere.net>
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

On Tue, 05 Mar 2024, Ricardo B. Marliere wrote:

> This is a simple and straight forward cleanup series that aims to make the
> class structures in backlight constant. This has been possible since 2023
> [1].
> 
> [1]: https://lore.kernel.org/all/2023040248-customary-release-4aec@gregkh/
> 
> Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
> ---
> Ricardo B. Marliere (2):
>       video: backlight: make backlight_class constant
>       video: backlight: lcd: make lcd_class constant
> 
>  drivers/video/backlight/backlight.c | 29 ++++++++++++++++-------------
>  drivers/video/backlight/lcd.c       | 23 +++++++++++++----------
>  2 files changed, 29 insertions(+), 23 deletions(-)

No longer apply.

Please rebase on top of v6.9-rc1 or for-backlight-next.

-- 
Lee Jones [李琼斯]
