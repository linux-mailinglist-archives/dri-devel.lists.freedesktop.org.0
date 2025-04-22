Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA3BA95ABD
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 03:56:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4EEE10E4C9;
	Tue, 22 Apr 2025 01:56:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=yeah.net header.i=@yeah.net header.b="ccggECoI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1237 seconds by postgrey-1.36 at gabe;
 Tue, 22 Apr 2025 01:56:41 UTC
Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5184110E0AC
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 01:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
 s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
 Content-Type; bh=sgqQbcC4Ac0v2YdyZ7o/7PpW2o0/Jn3QFWS121gTOFM=;
 b=ccggECoIV5cjU/T7WXevp9cZmZ2ebAt/jWpnx2F7PCBHiz0MlPgvTLRPf+JRMj
 e2nQVZFfsvKxaG4mYNBWi5c5rSU1jjqptuZ/UbgjinMSXg5qKGSczsBVgmgfkrdt
 gWdYZlVA9U2i4iedmoBpO9qjSvak3/kuD7TtP5oJO6zUM=
Received: from dragon (unknown [])
 by gzsmtp1 (Coremail) with SMTP id Mc8vCgB3b06h7wZoBuypAw--.471S3;
 Tue, 22 Apr 2025 09:23:48 +0800 (CST)
Date: Tue, 22 Apr 2025 09:23:45 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Andrej Picej <andrej.picej@norik.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, marex@denx.de,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, upstream@lists.phytec.de
Subject: Re: [PATCH v7 3/3] arm64: dts: imx8mm-phyboard-polis-peb-av-10: Set
 lvds-vod-swing
Message-ID: <aAbvobSqxSLt+uFC@dragon>
References: <20241216085410.1968634-1-andrej.picej@norik.com>
 <20241216085410.1968634-4-andrej.picej@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216085410.1968634-4-andrej.picej@norik.com>
X-CM-TRANSID: Mc8vCgB3b06h7wZoBuypAw--.471S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUcTmhUUUUU
X-Originating-IP: [114.216.210.34]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRI3ZWgGsHT8JwAAs4
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

On Mon, Dec 16, 2024 at 09:54:10AM +0100, Andrej Picej wrote:
> Set custom differential output voltage for LVDS, to fulfill requirements
> of the connected display. LVDS differential voltage for data-lanes and
> clock output has to be between 200 mV and 600 mV.
> Driver sets 200 Ohm near-end termination by default.
> 
> Signed-off-by: Andrej Picej <andrej.picej@norik.com>

Applied, thanks!

