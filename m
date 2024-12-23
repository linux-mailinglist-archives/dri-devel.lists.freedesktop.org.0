Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 830829FADA1
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 12:22:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA63E10E3B4;
	Mon, 23 Dec 2024 11:22:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="OncdMRtO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [IPv6:2a01:4f8:201:9162::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5893010E3B4
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 11:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1734952961;
 bh=iG8LVexyiQx0FY+OVsLXWZDFMOKx4KXIDEnoHn8PVCc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OncdMRtOPQul8mFceA4kqNvG1Nosls31I4H5l2aqGVpNXuThnqD8QYT8WBnsBzpV1
 jFsO6JdeEskOsoao8+wdbzYOQnA/R9nLn0GS640D206NSmCmU+d73PILoI9w5GviHv
 1EpZYqSOHdAN9EUwB3qXCju5J+7dvF6QCTQb8TtvcRuGxeCPftp5hwKUS7ixadndDU
 DIbHRaVCG0wTx/AmGjjy6wD10gPsw3qbWMv25FhZTiaeKERSZM0m5jcWEmaX3k0JPv
 BSZ43MSv8nuao169UsDtJpuonRtY4zlvs7JPMhzFFlOv8f9PmR1fk/ldA3BG4nc+Tv
 rcpZ+4p0lqjNA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A520417E366D;
 Mon, 23 Dec 2024 12:22:40 +0100 (CET)
Message-ID: <d7a8cb14-ce81-4f1d-9f64-a29348776170@collabora.com>
Date: Mon, 23 Dec 2024 12:22:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/33] dt-bindings: display: mediatek: Add binding for
 MT8195 HDMI-TX v2
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, ck.hu@mediatek.com,
 jitao.shi@mediatek.com, jie.qiu@mediatek.com, junzhi.zhao@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 dmitry.baryshkov@linaro.org
References: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
 <20241217154345.276919-8-angelogioacchino.delregno@collabora.com>
 <rsnyljmkdf7i74bkrlf5nesp2sa3n6xcnzsqao4znmczjpfyq2@dsakz56s4ypt>
 <9a75e88c-d90d-4ea8-b5c3-6d056d4f0498@collabora.com>
 <425fd1b0-fcba-4547-81f6-84acee5ce7f4@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <425fd1b0-fcba-4547-81f6-84acee5ce7f4@kernel.org>
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

Il 21/12/24 21:22, Krzysztof Kozlowski ha scritto:
> On 19/12/2024 11:54, AngeloGioacchino Del Regno wrote:
>>> hdmi@
>>>
>>> Best regards,
>>> Krzysztof
>>>
>>
>> Thanks for the great review krzk.
>>
>> I was wondering if it'd be more straightforward to just send the bindings in a
>> different series, instead of sending another batch of 33 (actually, 34, because
>> I forgot one commit adding the DDC binding, ugh!) patches...
>>
>> CK, any objections?
> Maybe just wait few more days for other people's review and then send v4
> of everything? You can split the bindings separately, although there is
> a risk we will get confused or we will forgot why they got separated.
> 
> Best regards,
> Krzysztof

Yeah okay, I didn't think I'd have to fix anything in the v3, but apparently I
was wrong and need to push a v4 anyway, so.. whatever.. :-)

Thanks btw

Cheers ... and happy holidays!
Angelo
