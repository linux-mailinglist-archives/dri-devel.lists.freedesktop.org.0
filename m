Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DF8500DFD
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 14:47:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B90210E67E;
	Thu, 14 Apr 2022 12:47:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B9A8D10E67E
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 12:47:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F6D3139F;
 Thu, 14 Apr 2022 05:47:30 -0700 (PDT)
Received: from [10.1.32.20] (e122027.cambridge.arm.com [10.1.32.20])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D2D2A3F70D;
 Thu, 14 Apr 2022 05:47:27 -0700 (PDT)
Message-ID: <b6509465-b7c7-0e66-071a-be85793cce58@arm.com>
Date: Thu, 14 Apr 2022 13:47:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v6 1/2] dt-bindings: Add DT schema for Arm Mali Valhall GPU
Content-Language: en-GB
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Nick Fan <Nick.Fan@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20220414025023.11516-1-Nick.Fan@mediatek.com>
 <ee2f0819-8c9e-4160-c4ae-fb4ad0da3f3b@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <ee2f0819-8c9e-4160-c4ae-fb4ad0da3f3b@collabora.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, alyssa.rosenzweig@collabora.com,
 wenst@chromium.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/04/2022 12:51, AngeloGioacchino Del Regno wrote:
> Il 14/04/22 04:50, Nick Fan ha scritto:
>> Add devicetree schema for Arm Mali Valhall GPU
>>
>> Define a compatible string for the Mali Valhall GPU
>> for MediaTek's SoC platform.
>>
>> Signed-off-by: Nick Fan <Nick.Fan@mediatek.com>
> 
> Hello Nick,
> Unfortunately, this binding is completely wrong.

I think that's unfair, although there is room for improvement.

> First of all, there's no arm,mali-valhall driver upstream - this will be
> managed
> by panfrost later, yes, but right now there's no support.

We need a binding agreed upon before support can be added.

> Then, you're also setting opp-microvolt in a way that will never (or, at
> least,
> not anytime soon) be supported by the upstream driver, as it manages
> only one
> supply for devfreq scaling.

The mt8183 binding (already in tree) is very similar. The binding also
should be describing the hardware not what the driver supports. There
are indeed limitations in Panfrost for supporting multiple supplies, but
that's something that needs improving in the driver not a reason to
block a (presumably correct) description of the hardware. I can't
comments on whether the specifics of the mt8192 are correct.

> Besides, please don't push bindings that have no upstream driver,
> especially if
> these are for downstream drivers requiring proprietary components, while a
> completely open source implementation is in the works.

More constructively, Alyssa has already posted a patch (as part of the
series adding driver support) which would extend the existing Bifrost
bindings to (pre-CSF) Valhall:

https://lore.kernel.org/dri-devel/20220211202728.6146-2-alyssa.rosenzweig@collabora.com/

I'm not sure I see the point of having a separate binding document for
Valhall considering the (pre-CSF) hardware is the same from the kernel
perspective.

Thanks,

Steve
