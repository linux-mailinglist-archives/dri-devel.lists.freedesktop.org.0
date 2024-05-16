Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9507B8C74F6
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 13:06:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD54510EC5E;
	Thu, 16 May 2024 11:06:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="kBO1aKQa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7522410EC5E
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 11:06:29 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44GB6F2G035545;
 Thu, 16 May 2024 06:06:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1715857575;
 bh=3Gx2v5SXrefBPGo2GfUcCnROLjCL96tax4zOhCy0y/E=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=kBO1aKQa779E+rLvQC1B7i7KMBm3pHr7JM0+Ky62ASIXOIZVUvuXfZORueNIMbX0f
 bY3hkH5Cke9hg70V3/kfpNnbpVkrO8FDFj1K4QmRAgygiw8E3F5miXnnOkww8tsTlJ
 h7ZuSS5pCDDS0U/tF+D4P/oGeO15KrSnelmD8DfM=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44GB6Fxx012222
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 16 May 2024 06:06:15 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 16
 May 2024 06:06:14 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 16 May 2024 06:06:14 -0500
Received: from [172.24.227.31] (uda0496377.dhcp.ti.com [172.24.227.31])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44GB67pi065202;
 Thu, 16 May 2024 06:06:08 -0500
Message-ID: <cecb865d-2f59-4cdf-991a-4607b200d503@ti.com>
Date: Thu, 16 May 2024 16:36:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] dt-bindings: display: simple: Add Microtips &
 Lincolntech Dual-LVDS Panels
To: Liu Ying <victor.liu@nxp.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
CC: DRI Development List <dri-devel@lists.freedesktop.org>, Devicetree List
 <devicetree@vger.kernel.org>, Linux Kernel List
 <linux-kernel@vger.kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh
 Raghavendra <vigneshr@ti.com>,
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, Jai Luthra <j-luthra@ti.com>
References: <20240515095133.745492-1-a-bhatia1@ti.com>
 <20240515095133.745492-4-a-bhatia1@ti.com>
 <9f3c1825-0438-464e-bd6d-88da6a9c3b3b@nxp.com>
Content-Language: en-US
From: Aradhya Bhatia <a-bhatia1@ti.com>
In-Reply-To: <9f3c1825-0438-464e-bd6d-88da6a9c3b3b@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Liu,

Thanks for reviewing the patch.

On 16/05/24 07:49, Liu Ying wrote:
> On 5/15/24 17:51, Aradhya Bhatia wrote:
>> Add the Microtips Technology USA's MF-101HIEBCAF0 10.1"[0] panel,
>> MF-103HIEB0GA0 10.25"[1] panel, and Lincoln Technology Solutions'
>> LCD185-101CT 10.1"[2] panel.
>>
>> Thes are all dual-lvds panels.
>>
>> Panel Links:
>> [0]: https://simplespec.microtipsusa.com/uploads/spec/datasheetFile/2588/13-101HIEBCAF0-S_V1.1_20221104.pdf
>> [1]: https://simplespec.microtipsusa.com/uploads/spec/datasheetFile/2660/13-103HIEB0GA0-S_V1.0_20211206.pdf
> 
> This one mentions some controls in '3. PIN DESCRIPTION' which
> don't comply with this binding, like RL, TB, STBYB and RESET.
> Note this binding only allows compatible, ports, backlight,
> enable-gpios and power-supply properties, nothing more.
>

Maybe the internal module _can_ support these control options but the
actual panel hardware does not expose any of these controls on its
connector pin-out, and hence has no possibility for additional SW
control. Even for the usage, the device-tree node for the panel only has
"compatible" and "ports" properties defined.

The panel is being used within the confines of a simple panel.

Regards
Aradhya

> 
>> [2]: https://lincolntechsolutions.com/wp-content/uploads/2023/04/LCD185-101CTL1ARNTT_DS_R1.3.pdf
>>
>> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
>> ---
>>  .../display/panel/panel-simple-lvds-dual-ports.yaml         | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
>> index 716ece5f3978..e78160d1aa24 100644
>> --- a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
>> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
>> @@ -41,6 +41,12 @@ properties:
>>        - auo,g190ean01
>>          # Kaohsiung Opto-Electronics Inc. 10.1" WUXGA (1920 x 1200) LVDS TFT LCD panel
>>        - koe,tx26d202vm0bwa
>> +        # Lincoln Technology Solutions, LCD185-101CT 10.1" TFT 1920x1200
>> +      - lincolntech,lcd185-101ct
>> +        # Microtips Technology MF-101HIEBCAF0 10.1" WUXGA (1920x1200) TFT LCD panel
>> +      - microtips,mf-101hiebcaf0
>> +        # Microtips Technology MF-103HIEB0GA0 10.25" 1920x720 TFT LCD panel
>> +      - microtips,mf-103hieb0ga0
>>          # NLT Technologies, Ltd. 15.6" FHD (1920x1080) LVDS TFT LCD panel
>>        - nlt,nl192108ac18-02d
>>  
> 
