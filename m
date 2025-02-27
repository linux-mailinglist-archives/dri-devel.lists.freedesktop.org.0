Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E08A48A01
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 21:40:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C457B10EB8B;
	Thu, 27 Feb 2025 20:40:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="Y6udNiAu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3D4810EB7C
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 20:40:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1CF6E10382D2E; Thu, 27 Feb 2025 21:40:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1740688817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E8ACEuyNDLYUMJdsnlbLhn6wugLzJDUc8NzlV6FztT8=;
 b=Y6udNiAuASjGCPGlDzD77fbQ7ezJlJ4K2/iMpZltQjf5aZffExkoSZB9KKYv+95Fqsvb/q
 nkcIXtTK3MtOF6SVtekIt7nyeVCsrq9VfxTci6Bk5cCyBlisvdNPb4m75jYpY4Nbfvu0e7
 hscqaePaHkjchYcwSAhQGqPLEM2hNUjUK8UuzxowRAh+n7LGWtmOx8Sgij+43mgyc0HCcd
 r5j/Iba2E2z0zKQ8hmy0egAmG4CyyDuVEVMZ2mr0BDYploZQkWcf1WPvy9xtBpWmy51zPn
 GUWOnK6CDK4QJNhOi+zneKlA73/eQPbBb4015Y2mAjzdchoIDwnfBpUpX96JDg==
Message-ID: <53b63cbd-612f-4da2-a957-ab7adbdc3802@denx.de>
Date: Thu, 27 Feb 2025 21:22:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] dt-bindings: reset: imx95-gpu-blk-ctrl: Document
 Freescale i.MX95 GPU reset
To: Frank Li <Frank.li@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-2-marex@denx.de>
 <Z8ChTqXdQCbSTJCy@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <Z8ChTqXdQCbSTJCy@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
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

On 2/27/25 6:30 PM, Frank Li wrote:

[...]

>> +examples:
>> +  - |
>> +    reset-controller@4d810000 {
>> +        compatible = "fsl,imx95-gpu-blk-ctrl";
>> +        reg = <0x0 0x4d810000 0x0 0xc>;
> 
> No sure if it pass dt_binding_check, I remember default 32bit address
> reg = <0x4d810000 0xc>
> 
>> +        clocks = <&scmi_clk IMX95_CLK_GPUAPB>;
> 
> suppose you missed dt-binding include file for IMX95_CLK_GPUAPB
Sigh, I knew I forgot something before sending this series out, thanks.

But we have a bit of a problem here, the IMX95_CLK_GPUAPB macro is 
defined in a header in arch/arm64/boot/dts:

arch/arm64/boot/dts/freescale/imx95-clock.h:#define IMX95_CLK_GPUAPB 
               (IMX95_CCM_NUM_CLK_SRC + 42)

Shouldn't this header be moved into dt-bindings/ ?

I can use fixed number 83 to reference the GPUAPB clock in this binding 
document until this is solved, even if that's not a nice thing.
