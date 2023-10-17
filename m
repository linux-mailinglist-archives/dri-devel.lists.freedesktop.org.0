Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 808B57CC0EE
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 12:47:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EB2310E2C0;
	Tue, 17 Oct 2023 10:46:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8594110E2C0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 10:46:54 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 1E1FF66072ED;
 Tue, 17 Oct 2023 11:46:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1697539613;
 bh=43RqoOrp7C9YDJYiZ/6Y2gmR3yeEBUCIjOC3q2aGqy0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VYYkhGiy37nSyJaxRJT4IxzWUww80wgKI0eXZKU7PLdK461OI7knxjxDYuTQwl729
 XLk3IFqwJ9wQcoFcoYAxLtACTj3RVfrSZhHMt64oiL0YmaNdxFQfbTpBR7zciqGlyn
 HUOyD1N/5OF3b/S3D+O4uOCcTOLvPQe1WWDsIRLp1HZ4s13cgfl66xA9fdLuerIOgS
 00bDFsopHT2dR35lDFx6ivP3NDg6Zn2pSNm4Jjbd4ljBZzPZrWyodJNLq0x//MVnRc
 IYmE1lLsbnw1TNHNzmEMMlvGxAVr9r+xNjP26ZUyNyipPxd6ZKxaBwo9jQ+3HFWg7h
 DkUuqsYgYzWWA==
Message-ID: <f9c9f496-3da4-4780-b4e3-742f24e18765@collabora.com>
Date: Tue, 17 Oct 2023 12:46:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 15/16] dt-bindings: display: mediatek: split: add
 compatible for MT8195
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Moudy Ho <moudy.ho@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20231012084037.19376-1-moudy.ho@mediatek.com>
 <20231012084037.19376-16-moudy.ho@mediatek.com>
 <a05a7fb0-2de8-4d59-af8b-41b5a19de927@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <a05a7fb0-2de8-4d59-af8b-41b5a19de927@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 16/10/23 18:21, Krzysztof Kozlowski ha scritto:
> On 12/10/2023 10:40, Moudy Ho wrote:
>> Add compatible string and GCE property for MT8195 SPLIT, of
>> which is operated by MDP3.
>>
>> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
>> ---
> 
> After feedback from Angelo:
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

