Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7B28BCFE2
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 16:18:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 264A910E516;
	Mon,  6 May 2024 14:18:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="qZNk2uVI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4858B10EBE2
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 14:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1715005106;
 bh=Vi05QVSG3iatwDAILN86QUEWJ3fE0RrPn+kvsUCWGws=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=qZNk2uVI+pZGR3kmAAkImZwSLKE9T+TahIUXH14Y7DA0Pnhl54iALE4oXsJK4KjMq
 l3djJ5Ie/y8OAuQJelPxMxPTHk/toXDpEj+cBGquJK5jnoHgZg5RTsXXrsN8/rXtmA
 0FTxMdNRP/UOBcTJ2JRvdnjmqjOIM9FXNe35X/pyLiOiQi3u98e+N5EiyRLdbb4qzo
 lvVgqpKVoTWeQ39JSe9EJUrwwbL7iP3bIzwK3o2nZNR+xPMAXap5I7bNRijl+zO/e+
 ICB9MvXQkAU51lwau8PqYmHqQMG+Le3wdbXBgrYcFS14L6RxnoinEbMJ2PeTQb+zs0
 zNGjrTFn187Kw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4BD99378020D;
 Mon,  6 May 2024 14:18:25 +0000 (UTC)
Message-ID: <2e3e49ff-8ace-498b-b2d0-54500e6f1e70@collabora.com>
Date: Mon, 6 May 2024 16:18:24 +0200
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
 <50be68dc-b86a-4334-9f83-43c6fda2c271@collabora.com>
 <1b8fa907-b48f-4ebe-bc17-3de1d7c0d062@collabora.com>
 <D12LA0QKEFRQ.68TZEVQZ7FJB@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <D12LA0QKEFRQ.68TZEVQZ7FJB@kernel.org>
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

Il 06/05/24 15:17, Michael Walle ha scritto:
> Hi Angelo,
> 
> On Mon May 6, 2024 at 1:22 PM CEST, AngeloGioacchino Del Regno wrote:
>>> The problem with this is that you need DDP_COMPONENT_DRM_OVL_ADAPTOR... which is
>>> a software thing and not HW, so that can't be described in devicetree.
>>>
>>> The only thing this series won't deal with is exactly that.
>>
>> Sorry, no, I got confused.
>>
>> The series *does* already deal with that, as the pipeline is built before the check
>> for OVL_ADAPTOR components, so that will get probed.
> 
> Are you sure? Because who is actually adding the OVL_ADAPTOR to the
> path? It looks like your patch will walk the graph and add all the
> components according to their compatible string. And since the
> OVL_ADAPTOR is virtual and doesn't have a node..
> 

I shouldn't look at code while having a flu.

	if (mtk_drm_find_mmsys_comp(private, DDP_COMPONENT_DRM_OVL_ADAPTOR)) {

...but yes nothing adds the mmsys_comp for OVL_ADAPTOR.

Needs to be addressed, will do that asap.
