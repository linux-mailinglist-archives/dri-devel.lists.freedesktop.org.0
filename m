Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D05BAAEE7
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 03:58:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE8210E029;
	Tue, 30 Sep 2025 01:58:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="q8IN8iDb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com
 [91.218.175.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74B7710E029
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 01:58:10 +0000 (UTC)
Message-ID: <d2ab96e7-40f7-4dcb-85f1-dd3024ba7155@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1759197488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Oswx+yAu7W+VHUXh80D3KG07B2o0dkYKBF4UV0d0w0c=;
 b=q8IN8iDbmbEeHdRqavnOtP60BN4brZ9pcdOjsfI6nymdmYzME8koLPsqi9foZNedrhVqZK
 NjRRgF9+ElYFJtbO1387IH9ybogTTssr1BAcP6a7KdZLEVICDxNRij7yAePUe+D8p4NtFF
 m9cMTXZ11RgI37ujd3p2o3QLah2Jc24=
Date: Tue, 30 Sep 2025 09:57:58 +0800
MIME-Version: 1.0
Subject: Re: [v3,2/2] accel: Add Arm Ethos-U NPU driver
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Robin Murphy <robin.murphy@arm.com>, Steven Price <steven.price@arm.com>,
 Daniel Stone <daniel@fooishbar.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20250926-ethos-v3-2-6bd24373e4f5@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20250926-ethos-v3-2-6bd24373e4f5@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

Hi,

On 2025/9/27 04:00, Rob Herring (Arm) wrote:


[...]

> +
> +/**
> + * struct ethosu_device - Ethosu device
> + */
> +struct ethosu_device {
> +	/** @base: Base drm_device. */
> +	struct drm_device base;
> +
> +	/** @iomem: CPU mapping of the registers. */
> +	void __iomem *regs;
> +
> +	void __iomem *sram;
> +	struct gen_pool *srampool;
> +	dma_addr_t sramphys;
> +
> +	struct clk *core_clk;
> +	struct clk *apb_clk;
> +
> +	int irq;
> +
> +	bool coherent;
> +


The 'coherent' member is not get used on anywhere.


Best Regards,
Sui

-- 
Best regards,
Sui

