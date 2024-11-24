Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C23979D766F
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2024 18:13:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35E5210E595;
	Sun, 24 Nov 2024 17:13:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="CC6YhPBw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay.smtp-ext.broadcom.com (saphodev.broadcom.com
 [192.19.144.205])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 852DE10E595
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2024 17:13:00 +0000 (UTC)
Received: from mail-lvn-it-01.lvn.broadcom.net
 (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
 by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id D5873C0003DF;
 Sun, 24 Nov 2024 09:04:18 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com D5873C0003DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
 s=dkimrelay; t=1732467858;
 bh=TZ8qOE/XqYn1Gd4w7RJwWC23NJRYMRGt0LB85msJiVk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CC6YhPBwNLt4PRNumYAlfcntCLC9Cm60GwLC588IMtQvrs4cnvDZA9n200E2S0aat
 olwEW+v+c5bIPWyIdpu0TJnEMETBaGvm5LLe25Dfakde2KuEfFMat/5Xc+VgDEamZe
 h9ACM54VoLuWzIFbn6uVKDCSbPU0Lpgo2TxZciYM=
Received: from fainelli-desktop.igp.broadcom.net
 (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 568D018041CAC6;
 Sun, 24 Nov 2024 09:04:18 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maxime Ripard <mripard@kernel.org>,
 =?iso-8859-1?b?TWHtcmE=?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 35/36] arm64: dts: broadcom: Add display pipeline
 support to BCM2712
Date: Sun, 24 Nov 2024 09:04:18 -0800
Message-ID: <20241124170418.710763-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241025-drm-vc4-2712-support-v2-35-35efa83c8fc0@raspberrypi.com>
References: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com>
 <20241025-drm-vc4-2712-support-v2-35-35efa83c8fc0@raspberrypi.com>
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

On Fri, 25 Oct 2024 18:16:06 +0100, Dave Stevenson <dave.stevenson@raspberrypi.com> wrote:
> Adds the HVS and associated hardware blocks to support the HDMI
> and writeback connectors on BCM2712 / Pi5.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian
