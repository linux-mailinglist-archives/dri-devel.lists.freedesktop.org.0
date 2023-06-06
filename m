Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEE2723E25
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 11:47:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA61D10E324;
	Tue,  6 Jun 2023 09:47:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8719B10E333
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 09:47:32 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3569kvk3041536;
 Tue, 6 Jun 2023 04:46:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1686044817;
 bh=/CpVUW5KJqV8jUtMerYvOT4MMkJcqj7gtawJjpNIJBk=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=ivvb35jAW2dVixTnUeGGWBgwNAKYlhtFXguYCiZvJhdjUVlLsDihMrmHOjGpjW1wd
 mTuLgLRJBTSm7onzz+B/K8dW8ZEUbB7t5reT9L0OUjvXYCbUecKwhmfaIPXv13FPD7
 ZL21jMIoMA1+vYCAO+XGfsJ93QiRj22FNzfgo1sY=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3569kvZB018974
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 6 Jun 2023 04:46:57 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 Jun 2023 04:46:56 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 Jun 2023 04:46:56 -0500
Received: from [172.24.218.160] (ileaxei01-snat.itg.ti.com [10.180.69.5])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3569koec009877;
 Tue, 6 Jun 2023 04:46:51 -0500
Message-ID: <1b31f36c-b1ba-43b5-9285-0f50384a78cf@ti.com>
Date: Tue, 6 Jun 2023 15:16:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v7 0/8] drm/tidss: Use new connector model for tidss
Content-Language: en-US
To: <neil.armstrong@linaro.org>, Tomi Valkeinen <tomba@kernel.org>, Jyri Sarha
 <jyri.sarha@iki.fi>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Swapnil Jakhade <sjakhade@cadence.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Francesco Dolcini <francesco@dolcini.it>
References: <20230606082142.23760-1-a-bhatia1@ti.com>
 <1f284e9d-5a1e-9fca-ceb0-478a413ae4ef@linaro.org>
From: Aradhya Bhatia <a-bhatia1@ti.com>
In-Reply-To: <1f284e9d-5a1e-9fca-ceb0-478a413ae4ef@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Nishanth Menon <nm@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 Rahul T R <r-ravikumar@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Vignesh Raghavendra <vigneshr@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,

Thank you for reviewing the previous patches!

On 06-Jun-23 14:37, Neil Armstrong wrote:
> Hi,
> 
> On 06/06/2023 10:21, Aradhya Bhatia wrote:
>> Hi all,
>>
>> I have picked up this long standing series from Nikhil Devshatwar[1].
>>
>> This series moves the tidss to using new connectoe model, where the SoC
>> driver (tidss) creates the connector and all the bridges are attached
>> with the flag DRM_BRIDGE_ATTACH_NO_CONNECTOR. It also now creates bridge
>> to support format negotiation and and 'simple' encoder to expose it to
>> the userspace.
>>
>> Since the bridges do not create the connector, the bus_format and
>> bus_flag is set via atomic hooks.
>>
>> Support format negotiations in the tfp410, sii902x and mhdp-8546 bridge
>> drivers as a first step before moving the connector model.
>>
>> These patches were tested on AM625-SK EVM, AM625 SoC based BeaglePlay,
>> and J721E-SK. Display support for AM625 SoC has not been added upstream
>> and is a WIP. To test this series on AM625 based platforms, basic
>> display support patches, (for driver + devicetree), can be found in
>> the "next_AttachNoConn-v2" branch on my github fork[2].
> 
> I can apply all bridge patches right now so only the tidss change remain,
> is that ok for you ?
> 

While the bridge patches and the tidss patch can be separately built
without any issue, the tidss functionality will break if only the bridge
patches get picked up, and not the tidss.

Would it be possible for you to pick all the patches together once Tomi
acks the tidss patch?


Regards
Aradhya

> 
>>
>> Thanks,
>> Aradhya
>>
>> [1]: https://patchwork.freedesktop.org/series/82765/#rev5
>> [2]: https://github.com/aradhya07/linux-ab/tree/next_AttachNoConn-v2
>>
>> Change Log:
>> V6 -> V7
>>    - Rebase and cosmetic changes.
>>    - Drop the output format check condition for mhdp8546 and hence,
>>      drop Tomi Valkeinen's R-b tag.
>>    - Added tags wherever suggested.
>>
>> V5 -> V6
>>    - Rebase and cosmetic changes
>>    - Dropped the output format check condition for tfp410 and hence,
>>      dropped Tomi Valkeinen's and Laurent Pinchart's R-b tags.
>>    - Based on Boris Brezillon's comments: dropped patches 5 and 6 from
>>      the series and instead created a single patch that,
>>        1. Creates tidss bridge for format negotiation.
>>        2. Creates 'simple' encoder for userspace exposure.
>>        3. Creates a tidss connector.
>>        4. Attaches the next-bridge to encoder with the
>>           DRM_BRIDGE_ATTACH_NO_CONNECTOR flag.
>>    - Add format negotiation support for sii902x driver.
>>
>> Previous versions:
>> V1 to V6: https://patchwork.freedesktop.org/series/82765/
>>
>> Aradhya Bhatia (3):
>>    drm/bridge: sii902x: Support format negotiation hooks
>>    drm/bridge: sii902x: Set input_bus_flags in atomic_check
>>    drm/tidss: Update encoder/bridge chain connect model
>>
>> Nikhil Devshatwar (5):
>>    drm/bridge: tfp410: Support format negotiation hooks
>>    drm/bridge: tfp410: Set input_bus_flags in atomic_check
>>    drm/bridge: mhdp8546: Add minimal format negotiation
>>    drm/bridge: mhdp8546: Set input_bus_flags from atomic_check
>>    drm/bridge: cdns-mhdp8546: Fix the interrupt enable/disable
>>
>>   .../drm/bridge/cadence/cdns-mhdp8546-core.c   |  77 ++++++----
>>   .../drm/bridge/cadence/cdns-mhdp8546-core.h   |   2 +-
>>   .../drm/bridge/cadence/cdns-mhdp8546-j721e.c  |   9 +-
>>   .../drm/bridge/cadence/cdns-mhdp8546-j721e.h  |   2 +-
>>   drivers/gpu/drm/bridge/sii902x.c              |  40 +++++
>>   drivers/gpu/drm/bridge/ti-tfp410.c            |  43 ++++++
>>   drivers/gpu/drm/tidss/tidss_encoder.c         | 140 +++++++++++-------
>>   drivers/gpu/drm/tidss/tidss_encoder.h         |   5 +-
>>   drivers/gpu/drm/tidss/tidss_kms.c             |  12 +-
>>   9 files changed, 235 insertions(+), 95 deletions(-)
>>
> 
