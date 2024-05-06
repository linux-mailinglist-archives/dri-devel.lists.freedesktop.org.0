Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8FB8BCC79
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 12:57:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C40610EF6A;
	Mon,  6 May 2024 10:57:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="H9zbk/XA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8542F10EF6A
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 10:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1714993020;
 bh=X2NzglRsxYEgR27bOlIO3yydggeqp11lrTPWCFdKpY0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=H9zbk/XAZ/2DHUMgiAMu8VSJv0zpRMVlMYmkN+a0gGmvIS1wpR8SVqAOQ+pPu2pbg
 znIR0b7JnrWRLD2zl7chGIC5Z6Vq6d72sYYuV0XVCrlVz2Two0ojARXYz7uOLElEML
 kn1sc8EW89SVM1tYxf3Y96BnMyB3XIuEYBpzrpVrnvnWFBswLMorZLCIRI9NWxBpoJ
 HLdGd/1fiYwUxfoTRi+i0P1ekhKpzpTlHBpcMYbOzEUyWcny755o+W3TziWpNgBv3C
 NWWSxG8zdTxBrpP+Pl7JSZKnQL9lSxwahltQi5EpNX9oyZExta3bcDjyjgraEmFU97
 I4iG6AP/yCpcQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0BA97378020D;
 Mon,  6 May 2024 10:56:58 +0000 (UTC)
Message-ID: <50be68dc-b86a-4334-9f83-43c6fda2c271@collabora.com>
Date: Mon, 6 May 2024 12:56:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] drm/mediatek: Add support for OF graphs
To: Michael Walle <mwalle@kernel.org>,
 Alexandre Mergnat <amergnat@baylibre.com>, chunkuang.hu@kernel.org
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 matthias.bgg@gmail.com, shawn.sung@mediatek.com, yu-chang.lee@mediatek.com,
 ck.hu@mediatek.com, jitao.shi@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 wenst@chromium.org, kernel@collabora.com
References: <20240409120211.321153-1-angelogioacchino.delregno@collabora.com>
 <1fc23530-89ba-4e36-9e9a-a1289f56a9bc@baylibre.com>
 <608fdbde-ad06-45ec-9771-18aa9f002f2d@collabora.com>
 <D12H4GDJJEUF.1Y91H9RMUIX20@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <D12H4GDJJEUF.1Y91H9RMUIX20@kernel.org>
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

Il 06/05/24 12:02, Michael Walle ha scritto:
> Hi Angelo,
> 
> On Tue Apr 30, 2024 at 1:33 PM CEST, AngeloGioacchino Del Regno wrote:
>>>> This series was tested on MT8195 Cherry Tomato and on MT8395 Radxa
>>>> NIO-12L with both hardcoded paths, OF graph support and partially
>>>> hardcoded paths (meaning main display through OF graph and external
>>>> display hardcoded, because of OVL_ADAPTOR).
>>>
>>> Is that make sense for you to add the DTS changes of these boards into this serie ?
>>> I asked because, IMHO, that could help to understand the serie.
>>>
>>
>> Yes and no... but I imagine that you're asking this because you're trying to
>> prepare something with a different SoC+board(s) combination :-)
>>
>> In that case, I'm preventively sorry because what follows here is not 100%
>> perfectly tidy yet as I didn't mean to send the devicetree commits upstream
>> before this series got picked....
>>
>> ... but there you go - I'm sure that you won't mind and that the example will
>> be more than good enough for you.
> 
> I've tested this series with the DSI0 output and it works. Nice! No
> need for my DSI0 patch for the MT8395 anymore.
> 
> But I can't get it to work with the DisplayPort output, that is the
> dp_intf1/dp_tx interface. I don' know how the pipeline have to look
> like. The functional spec seems to be ambiguous on this. The text
> seem to refer to the second vdosys but there is also a diagram where
> you can use the first vdosys and dsc0. If you have any pointers for
> me, I'm all ears :)
> 


The problem with this is that you need DDP_COMPONENT_DRM_OVL_ADAPTOR... which is
a software thing and not HW, so that can't be described in devicetree.

The only thing this series won't deal with is exactly that.

It's relatively easy, though, to add support for the OVL_ADAPTOR... as it would
be just a matter of checking if any of the components in the pipeline contain a
compatible that is in the OVL_ADAPTOR compatible list.

I'll try to add that up today, let's see what I can do.

Cheers,
Angelo
