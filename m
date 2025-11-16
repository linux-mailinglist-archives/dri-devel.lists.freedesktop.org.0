Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FA3C60FB3
	for <lists+dri-devel@lfdr.de>; Sun, 16 Nov 2025 04:51:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 701B510E058;
	Sun, 16 Nov 2025 03:51:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=yeah.net header.i=@yeah.net header.b="fSwfVd6n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC2D10E058
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Nov 2025 03:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
 s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
 Content-Type; bh=95kFSsLKyE4ALNC5FIjf+7ESIXBQpMSorE7EunEryYI=;
 b=fSwfVd6notXp0m5r0Dq8cVrJOOuYLd6b2UJZuvYz5mnJGxTELZm0MvmdjRAhv+
 tSxORf1Qcx/0zNLFrlLusMJMG3sChZJsnf9hlvtOE9dNhdwm+cQ+MPykuBC/JcYe
 cqGfqv/oL5Ox3jc7XmZG65g8VjnvHDbp26btXRsV7I3DI=
Received: from dragon (unknown [])
 by gzsmtp3 (Coremail) with SMTP id M88vCgDndQ2kSRlp1YYSAg--.50067S3;
 Sun, 16 Nov 2025 11:48:55 +0800 (CST)
Date: Sun, 16 Nov 2025 11:48:52 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, l.stach@pengutronix.de,
 shengjiu.wang@gmail.com, perex@perex.cz, tiwai@suse.com,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH v7 6/7] arm64: dts: imx8mp: Add hdmi parallel audio
 interface node
Message-ID: <aRlJpAUV9nfl2Afv@dragon>
References: <20250923053001.2678596-1-shengjiu.wang@nxp.com>
 <20250923053001.2678596-7-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923053001.2678596-7-shengjiu.wang@nxp.com>
X-CM-TRANSID: M88vCgDndQ2kSRlp1YYSAg--.50067S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUeXo7DUUUU
X-Originating-IP: [117.82.150.42]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiOAccgWkZSafRNQAA3Y
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

On Tue, Sep 23, 2025 at 01:30:00PM +0800, Shengjiu Wang wrote:
> The HDMI TX Parallel Audio Interface (HTX_PAI) is a bridge between the
> Audio Subsystem to the HDMI TX Controller.
> 
> Shrink register map size of hdmi_pvi to avoid overlapped hdmi_pai device.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied, thanks!

