Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B21507686
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 19:30:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87D1010F137;
	Tue, 19 Apr 2022 17:30:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0562E10F134
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 17:30:33 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23JHUHRe124234;
 Tue, 19 Apr 2022 12:30:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1650389417;
 bh=tblmGe+8o+9ZJunF2//txAuP0QRnXYIGKc6iN9ViM60=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=x5Inx2bap9zeuEoC0XLd9dRiKWS+N1VbDsz8luum8ppgGOWnYcv5KbsJ5n1yljiI1
 Kq0akeXJt8ncDnXS1xR+cuM0dEhDWKRvd9xIpFXHO+CH+Ge0hWCEJhhuOx94uBrFZ/
 5Ij9umpWFKke2Zw7tFkd2B2ia07HOnKGapZClKrY=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23JHUHM9019741
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 19 Apr 2022 12:30:17 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 19
 Apr 2022 12:30:03 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 19 Apr 2022 12:30:03 -0500
Received: from [10.0.3.15] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23JHTtBT041076;
 Tue, 19 Apr 2022 12:29:57 -0500
Message-ID: <b4712133-1694-4f3a-a790-263118717715@ti.com>
Date: Tue, 19 Apr 2022 22:59:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 0/2] Update register & interrupt info in am65x DSS
Content-Language: en-US
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Rob Herring
 <robh@kernel.org>, Nishanth Menon <nm@ti.com>
References: <20220419070302.16502-1-a-bhatia1@ti.com>
 <9e848e84-a31f-98ec-ed6b-c1dce022723b@ideasonboard.com>
From: Aradhya Bhatia <a-bhatia1@ti.com>
In-Reply-To: <9e848e84-a31f-98ec-ed6b-c1dce022723b@ideasonboard.com>
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
Cc: Devicetree <devicetree@vger.kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jyri Sarha <jyri.sarha@iki.fi>, Nikhil Devshatwar <nikhil.nd@ti.com>,
 Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 19/04/22 17:36, Tomi Valkeinen wrote:
> On 19/04/2022 10:03, Aradhya Bhatia wrote:
>> The Display SubSystem IP on the ti's am65x soc has an additional
>> register space "common1" and services a maximum of 2 interrupts.
>>
>> The first patch in the series adds the required updates to the yaml
>> file. The second patch then reflects the yaml updates in the DSS DT
>> node of am65x soc.
>>
>> Aradhya Bhatia (2):
>>    dt-bindings: display: ti,am65x-dss: Add missing register & interrupt
>>    arm64: dts: ti: k3-am65: Add missing register & interrupt in DSS node
>>
>>   .../devicetree/bindings/display/ti/ti,am65x-dss.yaml   | 10 +++++++---
>>   arch/arm64/boot/dts/ti/k3-am65-main.dtsi               |  6 ++++--
>>   2 files changed, 11 insertions(+), 5 deletions(-)
>>
> 
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> 
> How are you planning to use the common1 area?
Tomi, Nishanth,
Thank you for taking out time to review this.

The DSS IP is such that it services 2 interrupts in case people want to
use DSS from 2 SW entities (2nd VM or 2nd core). The regions "common" &
"common1" cater registers for managing these 2 interrupts.
Historically, on linux, only 1 interrupt and hence only the "common"
region has been used. Therefore, the "common1" region is not actually
required.

The patches, thus, can be ignored.


Rob,
Thank you for pointing out the mistakes I have made. I will be more
careful about them going further.

> 
>  Tomi

Regards
Aradhya Bhatia
