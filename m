Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE128A45C11
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 11:44:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93CA210E8B9;
	Wed, 26 Feb 2025 10:44:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="U5FQXFP/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A13710E8B9
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 10:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1740566660;
 bh=eNYaagGBQl3zI4PG/iw1/+t9855oK/Pqf/7j9jiqRWg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=U5FQXFP/5o25fTSqQ0Okey4UykTudRi0qQ7P8qymo77inRkdD/U+d9xv+5nNtxrSX
 24uakRMkjyasTEvwf4YvO3IPgBI7E2ReaQVYYbRcGGI3oMed3HTVqUkThm0QiQ3iH5
 8S4s4fmUijpB5GH/IFg/o15X2fX/hOnIzKBP5mqNf4OYDBsmh1wGt0QUhHs5J91L6n
 xzIAJwCdJsO1lKq0z5cWNQ67al1Hrpc90icq0YPZmC5bZTnxyvATwp2UsL/MHUBWz/
 mWfjY3gHNbk31sowpKkr6WRVdKD35P6Nd8yFBoYcSdjOfpy4WdlBsQuViN3xMl9Luy
 UIlgFnqKzUAiw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id AE57317E0605;
 Wed, 26 Feb 2025 11:44:19 +0100 (CET)
Message-ID: <ca325a7f-fdcf-4561-9e5b-8153ca7b8f0e@collabora.com>
Date: Wed, 26 Feb 2025 11:44:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: display: mediatek: dsc: Add MT8188 compatible
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 pablo.sun@mediatek.com, Rob Herring <robh@kernel.org>
References: <20250218090427.20318-1-angelogioacchino.delregno@collabora.com>
 <CAL_Jsq+4+=3ccuwa1whv+UQ56H6ueia4Mqy2z73M-5D15zZw=Q@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAL_Jsq+4+=3ccuwa1whv+UQ56H6ueia4Mqy2z73M-5D15zZw=Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Il 21/02/25 18:08, Rob Herring ha scritto:
> On Tue, Feb 18, 2025 at 3:04 AM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Add compatible for Display Stream Compression (DSC) IP found in
>> the display controller of the MT8188 SoC.
>>
>> This IP is fully compatible with the one found on MT8195.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../devicetree/bindings/display/mediatek/mediatek,dsc.yaml     | 3 +++
>>   1 file changed, 3 insertions(+)
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>


CK, please don't forget to pick this patch :-)

Cheers,
Angelo
