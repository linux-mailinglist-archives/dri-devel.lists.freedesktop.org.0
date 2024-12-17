Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F6C9F56F2
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 20:37:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E897310E647;
	Tue, 17 Dec 2024 19:37:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="LurlS7pO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com
 [192.19.144.207])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B44510E647
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 19:37:40 +0000 (UTC)
Received: from mail-lvn-it-01.lvn.broadcom.net
 (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
 by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 7BF77C00151E;
 Tue, 17 Dec 2024 11:37:39 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 7BF77C00151E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
 s=dkimrelay; t=1734464259;
 bh=13tm4e989tqq0diiIo8jbHoyqxNRWqqmhlqQUjJMQKg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LurlS7pOu94HygNHDSLoy1C73amFoAZ9gU+cXj7dvC0ogbBuqjVOPmZhiJMcC6RNQ
 8sN10uBBTXPUg23OtU6UEt7LuVcXHkZld+OZDDKZz53us+mjeABbSIWXrSjx64oa3H
 UK4jg1CXPoXcVu8EyPIGpNni/HnqGo61cZyP10oM=
Received: from fainelli-desktop.igp.broadcom.net
 (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id EF09B18041CAC6;
 Tue, 17 Dec 2024 11:37:38 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Eric Anholt <eric@anholt.net>,
 =?iso-8859-1?b?TWHtcmE=?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Doug Berger <opendmb@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>,
 Stefan Wahren <wahrenst@gmx.net>
Cc: Florian Fainelli <f.fainelli@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 7/7] arm64: dts: broadcom: Remove intc controller on
 BCM2712.
Date: Tue, 17 Dec 2024 11:37:38 -0800
Message-ID: <20241217193738.901055-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241212-dt-bcm2712-fixes-v3-7-44a7f3390331@raspberrypi.com>
References: <20241212-dt-bcm2712-fixes-v3-0-44a7f3390331@raspberrypi.com>
 <20241212-dt-bcm2712-fixes-v3-7-44a7f3390331@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Florian Fainelli <f.fainelli@gmail.com>

On Thu, 12 Dec 2024 18:36:34 +0000, Dave Stevenson <dave.stevenson@raspberrypi.com> wrote:
> The brcm,bcm2836-l1-intc controller isn't used on this platform.
> It is used on 32-bit kernels for the smp_boot_secondary hook, but
> BCM2712 can't run a 32-bit kernel.
> 
> Remove the node.
> 
> Fixes: e1417095a139 ("arm64: dts: broadcom: Add firmware clocks and power nodes to Pi5 DT")
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian
