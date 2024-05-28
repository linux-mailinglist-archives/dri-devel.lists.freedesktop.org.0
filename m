Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4444F8D188F
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 12:27:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EFD610E676;
	Tue, 28 May 2024 10:27:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="qo0ABDpD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94E3010E676
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 10:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1716892018;
 bh=ShbB0egsqc+viF42q6rsRBuCb+8DgZ4kwsWT9hgU0u8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=qo0ABDpDeGyeb5AM6CvxMAHNti9En+O5JJ7JH2bf5Kz7yu4heP+HUSyNzNLBu9l4v
 r6G+r6Xjl5Q34vGGu+TXIib93qalmPg7v5r7lyS330vgVmLB7adu2KP8H+lX7rrfIu
 zJzxuXF37jfduvnRfRK/e8nQU1J25bdFgPMWSPOB7M3qUfMJFNBYvZoUeVe2eDL7OI
 IhiyY4tRqs1ePuvCQhmrTEcAjzVzMjtN3LeaZzlImY/eHCHvRfjLs4jdpNhm0HiC1L
 MeJYVO6vs3cdX8W6jVn4un+D6X7h+XF5EW/FG6J2SfjzNJDaYpsv4bglD9wNkfq/7P
 tdkzEA4zshBBg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id D4030378215E;
 Tue, 28 May 2024 10:26:56 +0000 (UTC)
Message-ID: <430cf0a6-4d8c-4819-8a95-d436eb044eec@collabora.com>
Date: Tue, 28 May 2024 12:26:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: mailbox: Add mediatek,gce-props.yaml
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
 "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 =?UTF-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?=
 <Jason-ch.Chen@mediatek.com>, =?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?=
 <Shawn.Sung@mediatek.com>, =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?=
 <Nancy.Lin@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "fshao@chromium.org" <fshao@chromium.org>
References: <20240124011459.12204-1-jason-jh.lin@mediatek.com>
 <20240124011459.12204-2-jason-jh.lin@mediatek.com>
 <f91d3ac1-0a7d-4ca2-bf0f-c5e471c2f6bb@collabora.com>
 <2a2a939c9cb56de0383ec3e42db9bcf8e8518775.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <2a2a939c9cb56de0383ec3e42db9bcf8e8518775.camel@mediatek.com>
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

Il 26/05/24 17:04, Jason-JH Lin (林睿祥) ha scritto:
> Hi Angelo, Jassi,
> 
> Could you help me apply this series?
> Thanks!
> 

That's not me, it's Jassi - green light from me, btw.

Cheers,
Angelo

> Regards,
> Jason-JH.Lin
> 
> On Wed, 2024-01-24 at 09:57 +0100, AngeloGioacchino Del Regno wrote:
>> Il 24/01/24 02:14, Jason-JH.Lin ha scritto:
>>> Add mediatek,gce-props.yaml for common GCE properties that is used
>>> for
>>> both mailbox providers and consumers. We place the common property
>>> "mediatek,gce-events" in this binding currently.
>>>
>>> The property "mediatek,gce-events" is used for GCE event ID
>>> corresponding
>>> to a hardware event signal sent by the hardware or a software
>>> driver.
>>> If the mailbox providers or consumers want to manipulate the value
>>> of
>>> the event ID, they need to know the specific event ID.
>>>
>>> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
>>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>>
>> Reviewed-by: AngeloGioacchino Del Regno <
>> angelogioacchino.delregno@collabora.com>
>>
> 


