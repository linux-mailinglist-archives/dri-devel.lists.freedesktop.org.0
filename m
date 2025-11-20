Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAD2C71BB1
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 02:54:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3EC710E6C8;
	Thu, 20 Nov 2025 01:53:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=yeah.net header.i=@yeah.net header.b="FsX4dyzI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14AD010E6C6
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 01:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
 s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
 Content-Type; bh=B13YSSVdzv+A9HSJEV6haxN1uEpuGwZCWegPWDkjWo0=;
 b=FsX4dyzILs5Mz6P4OxTN0CZ6a8W+QrZGfT4i9E3mD9Dv8c2Wr9s1GER+09vuSz
 Dpxgn8PQ5E00Q20Pwiw2acWxvlUkmrX6TRLNIYoPBDhFIob5/fYH1Bbh6yxBhp5B
 1fnjOh6XPpG1UEzIw76l7HjPslGkMFtm4wD6UPJer8H7w=
Received: from dragon (unknown [])
 by gzsmtp2 (Coremail) with SMTP id Ms8vCgCnHTeLdB5pzrRhAg--.10170S3;
 Thu, 20 Nov 2025 09:53:18 +0800 (CST)
Date: Thu, 20 Nov 2025 09:53:15 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Marek Vasut <marek.vasut@mailbox.org>,
	Liviu Dudau <liviu.dudau@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>,
 "Jiyu Yang (OSS)" <jiyu.yang@oss.nxp.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Sebastian Reichel <sre@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Steven Price <steven.price@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Xianzhong Li <xianzhong.li@nxp.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev
Subject: Re: [PATCH v4 2/2] arm64: dts: imx95: Describe Mali G310 GPU
Message-ID: <aR50iy_FWk6PqAUg@dragon>
References: <20251102160927.45157-1-marek.vasut@mailbox.org>
 <20251102160927.45157-2-marek.vasut@mailbox.org>
 <aRnBqgzeotfrdNmy@dragon>
 <c85e39b6-4e5b-4bbc-b1b6-7f910c8f06d8@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c85e39b6-4e5b-4bbc-b1b6-7f910c8f06d8@mailbox.org>
X-CM-TRANSID: Ms8vCgCnHTeLdB5pzrRhAg--.10170S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUnzV1UUUUU
X-Originating-IP: [117.82.150.42]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNg4ih2kedI5lUAAA3l
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

On Wed, Nov 19, 2025 at 06:00:55PM +0100, Marek Vasut wrote:
> On 11/16/25 1:20 PM, Shawn Guo wrote:
> > On Sun, Nov 02, 2025 at 05:09:07PM +0100, Marek Vasut wrote:
> > > The instance of the GPU populated in i.MX95 is the G310, describe this
> > > GPU in the DT. Include dummy GPU voltage regulator and OPP tables.
> > 
> > The commit log seems need an update for the regulator part?
> The patch seems to be already in next, but if it can be somehow respun, I
> can do that ?

Hmm, okay, just take it as a protest that DTS shouldn't have been
applied by GPU subsystem, @Liviu ;)

Shawn

