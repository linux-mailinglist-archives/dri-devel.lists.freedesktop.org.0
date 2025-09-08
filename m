Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8598B48D98
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 14:34:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 520E610E504;
	Mon,  8 Sep 2025 12:34:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="K0tO+RKv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F1810E504
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 12:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1757334842;
 bh=C5fSnNKxeY3RHoKZlxT9QiIlEbKodP31EJG0RmKqlQE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=K0tO+RKvONw47Vb6DcOEq59vOaCyXmscg2CA4ZtFGWOr+kOsn4z5I6Y/5nye3nj5x
 LIQkCsADIKbTfKmWxugl7PUUoE9k9GjU9lG1U/TNHHiQyEpODpCLEtTWaC8t08F2mA
 NnY19Wqro/E/f0txJMaaq/7V795XW556Rj5x9EMcQBbPeczz/5llghCZkN3fKWwKpS
 wjyc2NZCzrswtqgj+5E4Ez+IyKbPzRI7BMpLdHC29gq5MkPbzDAEHq/CYCtltk/kJB
 4MWA28eIrhWlADVINLGFtj3ZOwWeuLeaVQL+j+0AZ2aJMPiO/uQiIIH63uvoWvsRHY
 sW/q6swCEb7zA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8847717E0199;
 Mon,  8 Sep 2025 14:34:01 +0200 (CEST)
Message-ID: <c03e55a0-0d82-4e07-86cc-9738066df45b@collabora.com>
Date: Mon, 8 Sep 2025 14:34:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 05/10] mailbox: add MediaTek GPUEB IPI mailbox
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Jassi Brar <jassisinghbrar@gmail.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20250905-mt8196-gpufreq-v1-0-7b6c2d6be221@collabora.com>
 <20250905-mt8196-gpufreq-v1-5-7b6c2d6be221@collabora.com>
 <27159dc0-96f1-4d99-bf5e-cda0f9c7d307@collabora.com>
 <7865698.EvYhyI6sBW@workhorse>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <7865698.EvYhyI6sBW@workhorse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Il 08/09/25 14:05, Nicolas Frattaroli ha scritto:
> On Monday, 8 September 2025 12:06:01 Central European Summer Time AngeloGioacchino Del Regno wrote:
>> Il 05/09/25 12:23, Nicolas Frattaroli ha scritto:
>>> The MT8196 SoC uses an embedded MCU to control frequencies and power of
>>> the GPU. This controller is referred to as "GPUEB".
>>>
>>> It communicates to the application processor, among other ways, through
>>> a mailbox.
>>>
>>> The mailbox exposes one interrupt, which appears to only be fired when a
>>> response is received, rather than a transaction is completed. For us,
>>> this means we unfortunately need to poll for txdone.
>>>
>>> The mailbox also requires the EB clock to be on when touching any of the
>>> mailbox registers.
>>>
>>> Add a simple driver for it based on the common mailbox framework.
>>>
>>> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
>>
>> Only a few nits in this, check below.
>>
>> [...]
>>> +
>>> +static int mtk_gpueb_mbox_send_data(struct mbox_chan *chan, void *data)
>>> +{
>>> +	struct mtk_gpueb_mbox *ebm = dev_get_drvdata(chan->mbox->dev);
>>> +	unsigned int *num = chan->con_priv;
>>> +	int i;
>>
>> int i, j;
>>
>>> +	u32 *values = data;
>>> +
>>> +	if (*num >= ebm->v->num_channels)
>>> +		return -ECHRNG;
>>> +
>>> +	if (!ebm->v->channels[*num].no_response &&
>>> +	    atomic_read(&ebm->rx_status[*num]))
>>> +		return -EBUSY;
>>> +
>>> +	writel(BIT(*num), ebm->mbox_ctl + MBOX_CTL_IRQ_CLR);
>>> +
>>> +	/*
>>> +	 * We don't want any fancy nonsense, just write the 32-bit values in
>>> +	 * order. memcpy_toio/__iowrite32_copy don't work here, because fancy.
>>> +	 */
>>> +	for (i = 0; i < ebm->v->channels[*num].tx_len; i += 4) {
>>
>> Just use an additional `j` index, so that you can avoid division.
> 
> The `/ 4` division here is equivalent to a `>> 2` which comes free with
> almost every instruction on arm64, I don't think having two separate
> indices makes the code any clearer?

> Unless I misunderstand how you'd
> want me to use j here.
> 
> Like this?
> 
>    j = 0;
>    for (i = 0; i < ebm->v->channels[*num].tx_len; i += 4) {
>      writel(values[j++], ebm->mbox_mmio + ebm->v->channels[*num].tx_offset + i);
>    }
> 
> This makes the relationship between the values index and i less clear. (And
> in my rendition, assumes the reader knows how postincrement works, but I
> think assuming people know C is fine.)

I guess assuming people know that compilers will auto-optimize that is okay then.

> 
>> [...]
>>
>>> +
>>> +	ebm->clk = devm_clk_get_enabled(ebm->dev, NULL);
>>> +	if (IS_ERR(ebm->clk))
>>> +		return dev_err_probe(ebm->dev, PTR_ERR(ebm->clk),
>>> +				     "Failed to get 'eb' clock\n");
>>> +
>>> +	ebm->mbox_mmio = devm_platform_ioremap_resource_byname(pdev, "mbox");
>>
>> I'd say that "chan" and "ctl" are more descriptive as resource names, but then,
>> do we really need to search by name?
> 
> In the binding, it was proposed to change "mbox" to something like "data",
> which is fine by me, and to drop the "mbox" prefix of "ctl".
> 

Heh, didn't see that comment. data and ctl are also fine for me, go with those :-)

>>
>> Doing that by index is also an option, as you can write the MMIO names and their
>> full description in the bindings instead.
> 
> Yeah in the driver I think I'll switch to doing indices until some second
> compatible forces us to actually rely on names because it adds a bunch of
> other ranges.
> 
>> [...]
> 
> thanks for the feedback, assume that anything I didn't directly respond
> to will be fixed in the next revision.

Perfect.

Cheers,
Angelo

