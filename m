Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BFC84B76B
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 15:08:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E59BD10EE2C;
	Tue,  6 Feb 2024 14:08:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=yeah.net header.i=@yeah.net header.b="VRZjkAx7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-177131.yeah.net (mail-177131.yeah.net [123.58.177.131])
 by gabe.freedesktop.org (Postfix) with ESMTP id 47B4710EAE7
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 10:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
 s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
 Content-Type; bh=q24x/RFrKCeMLCH08rssYKYmdKI2I63/f28Ucs3/8Sk=;
 b=VRZjkAx7dRfh7UWzGVQzWOM3rp4cy9+xqhAHRvNQR89H715iKPznpbtzs7Zx4P
 mmEFpz6vO/OKXIxiOtzqGx4h+L1sj9FOX8bb057AOBdA3D0KORaXcA2Qhkhi5i8Z
 9CDzntl873fOCGHUrWR+YXtotFvPKFJyr9jliIKclYDt0=
Received: from dragon (unknown [183.213.196.254])
 by smtp1 (Coremail) with SMTP id ClUQrADn6+xzC8JlI3j+Ag--.15990S3;
 Tue, 06 Feb 2024 18:35:33 +0800 (CST)
Date: Tue, 6 Feb 2024 18:35:31 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Yannic Moog <y.moog@phytec.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Primoz Fiser <primoz.fiser@norik.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 upstream@lists.phytec.de
Subject: Re: [PATCH RFC for upstream 4/4] arm64: defconfig: enable i.MX8MP
 ldb bridge
Message-ID: <ZcILc05xove6D92V@dragon>
References: <20240126-wip-y-moog-phytec-de-upstream-pollux-lvds-v1-0-8ec5b48eec05@phytec.de>
 <20240126-wip-y-moog-phytec-de-upstream-pollux-lvds-v1-4-8ec5b48eec05@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240126-wip-y-moog-phytec-de-upstream-pollux-lvds-v1-4-8ec5b48eec05@phytec.de>
X-CM-TRANSID: ClUQrADn6+xzC8JlI3j+Ag--.15990S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU4pBTUUUUU
X-Originating-IP: [183.213.196.254]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiDwd8ZVnxccILPgABs+
X-Mailman-Approved-At: Tue, 06 Feb 2024 14:08:39 +0000
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

On Fri, Jan 26, 2024 at 09:57:26AM +0100, Yannic Moog wrote:
> Enable the i.MX8MP LDB driver used for display support of the i.MX8MP
> LVDS interface.
> 
> Signed-off-by: Yannic Moog <y.moog@phytec.de>

Applied, thanks!

