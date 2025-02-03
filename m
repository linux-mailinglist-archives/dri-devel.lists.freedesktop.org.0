Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45794A2597D
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 13:35:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1C2910E4A7;
	Mon,  3 Feb 2025 12:35:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="ZQDHQxY3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D798B10E4AA
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 12:35:23 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 513CYoXQ2192284
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 Feb 2025 06:34:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1738586090;
 bh=k+Iyg6+jxdDXDDmQldk/ZFJvlNMPElJBNaK5YfhBuGs=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=ZQDHQxY3+lMSV0OsuNCLOwqNGu3KVlT7e5T10cMpp5uB00HlGx8HVP+qfnx9mP0P3
 /VETYsL8aH1bAXmZ2r2eunItBNoDKUcPdmjETaIuSR4NbaMKiL21ImCoOZDGDsLb7B
 aBtaWkWV+WSnfiffRSWx5Q7bGZtnoY6c9s94WBPA=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 513CYo9Y028147
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 3 Feb 2025 06:34:50 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Feb 2025 06:34:49 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Feb 2025 06:34:49 -0600
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193] (may be
 forged))
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 513CYiGc040705;
 Mon, 3 Feb 2025 06:34:45 -0600
Message-ID: <9c938a69-c168-18e6-39f9-43b97f7aaaa9@ti.com>
Date: Mon, 3 Feb 2025 18:04:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] dt-bindings: display: ti,am65x-dss: Add support for
 AM62L DSS
Content-Language: en-US
To: Jayesh Choudhary <j-choudhary@ti.com>, <jyri.sarha@iki.fi>,
 <tomi.valkeinen@ideasonboard.com>, <airlied@gmail.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <dri-devel@lists.freedesktop.org>,
 <simona@ffwll.ch>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>
CC: <praneeth@ti.com>, <vigneshr@ti.com>, <aradhya.bhatia@linux.dev>,
 <s-jain1@ti.com>, <r-donadkar@ti.com>, <h-shenoy@ti.com>
References: <20241231090432.3649158-1-devarsht@ti.com>
 <20241231090432.3649158-2-devarsht@ti.com>
 <4df0097f-2672-4bf0-8321-5922783e9278@ti.com>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <4df0097f-2672-4bf0-8321-5922783e9278@ti.com>
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

Hi Jayesh,

On 24/01/25 13:50, Jayesh Choudhary wrote:
<snip>
>>     compatible:
>>       enum:
>>         - ti,am625-dss
>>         - ti,am62a7,dss
>> +      - ti,am62l,dss
> 
> 
> s/ti,am62l,dss/ti,am62l-dss
> 
> There seems to be inconsistency in the usage of the compatible name in
> the conditional below.
> 
> Same is with the compatible "ti,am62a7,dss".
> Can you fix that too?
> 
> 
> With the above comments addressed,
> 
> Reviewed-by: Jayesh Choudhary <j-choudhary@ti.com>
> 

Thanks for the comments, indeed above needs to be fixed, will include it in V2.

Regards
Devarsh
