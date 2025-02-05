Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 424D7A283FA
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 06:57:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE24D10E737;
	Wed,  5 Feb 2025 05:57:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="BlErTA6/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7434710E737
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2025 05:57:19 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5155v0dw3364505
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 Feb 2025 23:57:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1738735020;
 bh=t/2WmXH+7MwLwzsZBO1JWJrL8bvDXWsF3RF4uzEE/Gw=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=BlErTA6/vqn2L9sZI2Daha/0Cn+PN/IzAhwEZCWHrT9BJVYRWCJLR1Kz/hfrl+Kdj
 3/o0vUKk57r85erZmiMMdRIEgxdv/VcHDWShs6OE75S6Jak4KoS197V040EEQUjLgT
 nkJcOrXIHNAhgNmN/86LBiXTkfIDBuoP3Duue57A=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5155v0xU070283
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 4 Feb 2025 23:57:00 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Feb 2025 23:56:59 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Feb 2025 23:56:59 -0600
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193] (may be
 forged))
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5155usfF051863;
 Tue, 4 Feb 2025 23:56:54 -0600
Message-ID: <fc7fcd26-601a-5c23-7310-2a18b8cf377c@ti.com>
Date: Wed, 5 Feb 2025 11:26:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/2] dt-bindings: display: ti,am65x-dss: Add support
 for AM62L DSS
Content-Language: en-US
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC: <praneeth@ti.com>, <vigneshr@ti.com>, <aradhya.bhatia@linux.dev>,
 <s-jain1@ti.com>, <r-donadkar@ti.com>, <j-choudhary@ti.com>,
 <h-shenoy@ti.com>, <jyri.sarha@iki.fi>, <airlied@gmail.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <dri-devel@lists.freedesktop.org>,
 <simona@ffwll.ch>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>
References: <20250204061552.3720261-1-devarsht@ti.com>
 <20250204061552.3720261-2-devarsht@ti.com>
 <eb8883f2-fc34-44f5-90a9-f4b14f0c45f2@ideasonboard.com>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <eb8883f2-fc34-44f5-90a9-f4b14f0c45f2@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

Hi Tomi,

Thanks for the review.
On 04/02/25 19:25, Tomi Valkeinen wrote:
<snip>
>>     description: |
>> -  The AM625 and AM65x TI Keystone Display SubSystem with two output
>> +  The AM625 and AM65x TI Keystone Display SubSystem has two output
>>     ports and two video planes. In AM65x DSS, the first video port
>>     supports 1 OLDI TX and in AM625 DSS, the first video port output is
>>     internally routed to 2 OLDI TXes. The second video port supports DPI
>>     format. The first plane is full video plane with all features and the
>>     second is a "lite plane" without scaling support.
>> +  The AM62A7 display subsystem has a single output port supporting DPI format
>> +  although similar to AM625 and AM65x Socs, it has two video planes where
>> first
>> +  is full video plane with all features and second is a video "lite" plane
>> which
>> +  does not support scaling.
> 
> The part above doesn't belong into "add AM62L" patch. It's also quite
> confusing. "although similar to..."? Maybe drop the text "although similar to
> AM625 and AM65x Socs, ", and start a new sentence from "it"?
> 

Sure, I will split the patch for AM62A and correct above too.

> For the AM62L parts:
> 
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> 
>  Tomi

Regards
Devarsh
