Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2B9A10445
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 11:34:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 950AB10E0FD;
	Tue, 14 Jan 2025 10:34:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="PAr4UV16";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DC0C10E0FD
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 10:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1736850851;
 bh=qUqYy7fkSdDaUvFWkfpRjthLn6gX435QSqPDwCVPKug=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PAr4UV16xhWm3cx/nG/FQDVlQ4ovWkkHh6Kd2VsAII4+r+8etUMy8Tp+rxKQ5LmqV
 TlpEU95v1gR055hTXaBxImEV4w5WQ1AKdkxr5z9njhGQPnag2mh+0PLA9mAI5m61Cx
 jtIeNrZgQqbtVxtxJWWUDnNwqtK49LJmnypm7ZzUnxNGQtYr5QcszUSuKk9ZAilJUn
 rUg0AfdryyxdAsm5S8YE+OL7sBGKXyDmV8/YVHqhnd+tvTbgC6C6p4KJq9KQcr+8kN
 QXP7pq+84BE+GymbdDweObFhRLZ6BAeuyQ7au9vtF/BD4g4H5C8RyTEt7q5cSaIDr8
 yEru4t8zk52Qw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 31FA917E0DB7;
 Tue, 14 Jan 2025 11:34:10 +0100 (CET)
Message-ID: <eef2ead1-e9d7-4f9c-8aca-fa84da3e2210@collabora.com>
Date: Tue, 14 Jan 2025 11:34:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/12] dt-bindings: display: mediatek: add EXDMA yaml for
 MT8196
To: =?UTF-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: "conor+dt@kernel.org" <conor+dt@kernel.org>,
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 =?UTF-8?B?U3VubnkgU2hlbiAo5rKI5aeN5aeNKQ==?= <Sunny.Shen@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "fshao@chromium.org" <fshao@chromium.org>,
 =?UTF-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
 <Xiandong.Wang@mediatek.com>, "treapking@chromium.org"
 <treapking@chromium.org>, =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?=
 <Nancy.Lin@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>
References: <20250110123835.2719824-1-paul-pl.chen@mediatek.com>
 <20250110123835.2719824-5-paul-pl.chen@mediatek.com>
 <173651725269.2671643.2891127782637834272.robh@kernel.org>
 <SG2PR03MB66367B4A9DBCC971F55DB326BC182@SG2PR03MB6636.apcprd03.prod.outlook.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <SG2PR03MB66367B4A9DBCC971F55DB326BC182@SG2PR03MB6636.apcprd03.prod.outlook.com>
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

Il 14/01/25 06:49, Paul-pl Chen (陳柏霖) ha scritto:
> Hi Rob
> Thanks for the advice.
> The root cause of the erroneous log message is due to missing power/clock dependencies.
> Once the MTK clock/power header file is upstreamed,

The mt8196-clk/power.h filenames are anyway wrong for upstream.... :-)

Cheers,
Angelo

> we will include a reference link in the next version of the upstream series submission.
>   
> Best, Paul-pl Chen
> 
> -----Original Message-----
> From: Rob Herring (Arm) <robh@kernel.org>
> Sent: Friday, January 10, 2025 9:54 PM
> To: Paul-pl Chen (陳柏霖) <Paul-pl.Chen@mediatek.com>
> Cc: conor+dt@kernel.org; Singo Chang (張興國) <Singo.Chang@mediatek.com>; Sunny Shen (沈姍姍) <Sunny.Shen@mediatek.com>; chunkuang.hu@kernel.org; Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>; fshao@chromium.org; Sirius Wang (王皓昱) <Sirius.Wang@mediatek.com>; dri-devel@lists.freedesktop.org; matthias.bgg@gmail.com; linux-kernel@vger.kernel.org; devicetree@vger.kernel.org; Xiandong Wang (王先冬) <Xiandong.Wang@mediatek.com>; treapking@chromium.org; Nancy Lin (林欣螢) <Nancy.Lin@mediatek.com>; linux-mediatek@lists.infradead.org; p.zabel@pengutronix.de; Jason-JH Lin (林睿祥) <Jason-JH.Lin@mediatek.com>; AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>; linux-arm-kernel@lists.infradead.org; krzk+dt@kernel.org
> Subject: Re: [PATCH 03/12] dt-bindings: display: mediatek: add EXDMA yaml for MT8196
> 
> 
> External email : Please do not click links or open attachments until you have verified the sender or the content.
> 
> 
> On Fri, 10 Jan 2025 20:33:59 +0800, paul-pl.chen wrote:
>> From: "Paul-pl.Chen" <paul-pl.chen@mediatek.com>
>>
>> Add mediatek,exdma.yaml to support EXDMA for MT8196.
>>
>> Signed-off-by: Paul-pl.Chen <paul-pl.chen@mediatek.com>
>> ---
>> The header used in examples:
>> #include <dt-bindings/clock/mt8196-clk.h> #include
>> <dt-bindings/power/mt8196-power.h>
>> are not upstreamed yet.
>> It will be sent by related owner soon.
>> ---
>>   .../display/mediatek/mediatek,exdma.yaml      | 77 +++++++++++++++++++
>>   1 file changed, 77 insertions(+)
>>   create mode 100644
>> Documentation/devicetree/bindings/display/mediatek/mediatek,exdma.yaml
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/display/mediatek/mediatek,exdma.example.dts:18:18: fatal error: dt-bindings/clock/mt8196-clk.h: No such file or directory
>     18 |         #include <dt-bindings/clock/mt8196-clk.h>
>        |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/display/mediatek/mediatek,exdma.example.dtb] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1506: dt_binding_check] Error 2
> make: *** [Makefile:251: __sub-make] Error 2
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250110123835.2719824-5-paul-pl.chen@mediatek.com
> 
> The base for the series is generally the latest rc1. A different dependency should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note that DT_SCHEMA_FILES can be set to your schema file to speed up checking your schema. However, it must be unset to test all examples with your schema.
> 



