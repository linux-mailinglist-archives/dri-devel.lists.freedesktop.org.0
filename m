Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA529A0BAE3
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 16:02:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C1CB10E6CF;
	Mon, 13 Jan 2025 15:02:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="fDDmtoSR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E10C10E6CF
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 15:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1736780532;
 bh=265nxCvfezAfbeFJCqIxtN+G127kPTOrMaQzfRcCeTw=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=fDDmtoSRqvFFanYJ+9hrkU5K8pqVSZaQY9ILmB2R/vsT7dM5wg62BnS/GX5Kb8Q6M
 r5/pdhN3/E9R6cLarWc9UrAnZW1PxpykoFZZXvdFZB0MOo6qEhFf8GHfB1uN8C553T
 ACL3doGqdTFwT44EftkKQSgTbjNTPG7Z+EP28A803YgHUSMuMV6lCy8MCq3jNmhnrF
 VNCqHxSqSd9qz6NxLEwzI1s1vVkn2ZUZzjLANVJ//BP3hGaDMh/xj+PLz+NEGQXsvE
 v1Ekfk/BFHaj+cFOK3MuHo3DXS9OM18L0/LyLKNPHKgdQYO1GTACE/23LY5X4qwuzN
 S8QpoJAolaLJw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 7869917E0E64;
 Mon, 13 Jan 2025 16:02:11 +0100 (CET)
Message-ID: <a6d18d83-a485-4e5b-aac4-181550a4cd46@collabora.com>
Date: Mon, 13 Jan 2025 16:02:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/mediatek/hdmi: Use
 syscon_regmap_lookup_by_phandle_args
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250112134708.46100-1-krzysztof.kozlowski@linaro.org>
 <516d16e3-6fc6-49ba-a0ce-f451b65a6c1a@collabora.com>
 <fef6b198-d916-4b71-86ed-0cbdd55cb3c4@linaro.org>
 <fcf8ebde-46c9-406e-b4d9-933623a9786b@collabora.com>
 <e64ab0c7-25da-449e-abd2-e4c70dee3041@linaro.org>
 <48e4def6-3d40-4cbe-8008-a299869342b0@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <48e4def6-3d40-4cbe-8008-a299869342b0@linaro.org>
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

Il 13/01/25 15:31, Krzysztof Kozlowski ha scritto:
> On 13/01/2025 15:27, Krzysztof Kozlowski wrote:
>> On 13/01/2025 14:58, AngeloGioacchino Del Regno wrote:
>>> Il 13/01/25 14:05, Krzysztof Kozlowski ha scritto:
>>>> On 13/01/2025 13:41, AngeloGioacchino Del Regno wrote:
>>>>> Il 12/01/25 14:47, Krzysztof Kozlowski ha scritto:
>>>>>> Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
>>>>>> syscon_regmap_lookup_by_phandle() combined with getting the syscon
>>>>>> argument.  Except simpler code this annotates within one line that given
>>>>>> phandle has arguments, so grepping for code would be easier.
>>>>>>
>>>>>> There is also no real benefit in printing errors on missing syscon
>>>>>> argument, because this is done just too late: runtime check on
>>>>>> static/build-time data.  Dtschema and Devicetree bindings offer the
>>>>>> static/build-time check for this already.
>>>>>>
>>>>>
>>>>> I agree with this change but can you please rebase it over [1]?
>>>>>
>>>>> The same code got migrated to mtk_hdmi_common.c instead :-)
>>>>>
>>>>> [1]:
>>>>> https://lore.kernel.org/r/20250108112744.64686-1-angelogioacchino.delregno@collabora.com
>>>> My is 2-patch cleanup, your is 34 patch rework and new features with
>>>> existing build reports, so rebase is not reasonable. It would make this
>>>> 2-patch cleanup wait for many cycles.
>>>>
>>> If adding the `#include <linux/bitfield.h>` line to a file would take
>>> *many cycles*, that'd be a bit weird, wouldn't it? :-)
>> It's not about include, it is about rebase. If I rebase on 34-patchset,
>> that's my dependency and this work cannot be merged before yours is.
>>
>> And yours already have kbuild reports, so there will be v5, maybe v6 etc.
> 
> 
> Although "NO!!!! No more huge patch bombs to
> linux-kernel@vger.kernel.org people!" was removed, but its spirit is
> kind of still valid and requesting to rebase cleanups on top of patch
> bombs with new features is just not reasonable.
> 

I understand Krzysztof, but since my 34-patchset should be ready and I don't
expect to send any v6 for how it is right now, your patch would make it
necessary to send yet another patchbomb on my side... we're kind-of in the
same situation here, and I feel like we're making a big issue out of something
that should not really be a problem.

I'm sorry about this situation, and I feel like this doesn't really depend
on me, as much as it doesn't really depend on you... let's just see what CK
thinks about this, or else, I don't know how to make this easier on all of
us - me, you and the maintainer.

If it felt like me being rude in any way, that wasn't my intention, btw.

I can offer to rebase this patch on my own keeping your authorship, if that
makes things easier.

Cheers,
Angelo
