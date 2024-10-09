Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA99996E72
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 16:43:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 824C110E75F;
	Wed,  9 Oct 2024 14:43:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QvSSIvCO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DDAF10E75F
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 14:43:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 10BD9A4313E;
 Wed,  9 Oct 2024 14:43:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB5A9C4CEC3;
 Wed,  9 Oct 2024 14:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728485013;
 bh=XpufhfIwBFzW0DRqV9iSYAuW1EUgE4gZ9XDPghDF980=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=QvSSIvCO0QBVSIjf7t8Xr9t4a7X9q+hgEezm/Qt+NGcOrNios7XHAEGgeHB9Cn7zU
 d2MBFPEnEFayBmHt8gQc+iZxKsyAZWs4Pp384RAij5d2dQRW1O0YruwZKLPUAWohVU
 BD8+g8aG3NVAZLClu+tjZahTj3g7x6FC3IjHZ1e+q3a1YD86NS57JX2m0z0MIFyXiM
 A4XtOYgfqlFFZJD8kmNCAxeKiYkqhc32BCyUbwG7v2meLWf6Q0W1WXuzMDiEB74VCa
 v3GYa6sTXSdoiGU0K2o06HcdJeukCmsYw2NYxrX7Skvzrd0z+35zjRMbG/RAMJmXUA
 aJUIuefm7ediA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com, 
 hdegoede@redhat.com, linux@treblig.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240919232758.639925-1-linux@treblig.org>
References: <20240919232758.639925-1-linux@treblig.org>
Subject: Re: (subset) [PATCH] backlight: Remove notifier
Message-Id: <172848501143.600706.12618555351534391287.b4-ty@kernel.org>
Date: Wed, 09 Oct 2024 15:43:31 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
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

On Fri, 20 Sep 2024 00:27:58 +0100, linux@treblig.org wrote:
> backlight_register_notifier and backlight_unregister_notifier have
> been unused since
>   commit 6cb634d0dc85 ("ACPI: video: Remove code to unregister acpi_video
> backlight when a native backlight registers")
> 
> With those not being called, it means that the backlight_notifier
> list is always empty.
> 
> [...]

Applied, thanks!

[1/1] backlight: Remove notifier
      commit: 5461f3fd74a89757f95f351eb0bc26aafc2a2e91

--
Lee Jones [李琼斯]

