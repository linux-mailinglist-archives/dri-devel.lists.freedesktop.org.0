Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9085DAA8D58
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 09:50:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4900310E02C;
	Mon,  5 May 2025 07:50:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="t5NOcc4A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6185310E02C
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 07:50:05 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5457nOll716797
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 5 May 2025 02:49:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1746431364;
 bh=5Ii9h9rPzROGPRkouzthetaV+45FxhY90QOk8t0nqok=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=t5NOcc4AkykTBetmD815dXZgKQT6FypKLSXNv8PzRCUkpEQBeB2ShPwrsvLWs0Iro
 ArOJwiKxnKdxee9m6P3/eQZ/CAKe3YZPpTf8KAIQsVgK/KSXw9vlanZoPsb1lMxsWX
 imw5Ni2+NvFoTfmjVFJ+mYL/53paBSoQD6oQj/64=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5457nOBi019555
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 5 May 2025 02:49:24 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 May 2025 02:49:23 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 May 2025 02:49:23 -0500
Received: from [172.24.227.193] (devarsh-precision-tower-3620.dhcp.ti.com
 [172.24.227.193])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5457nHUY087427;
 Mon, 5 May 2025 02:49:18 -0500
Message-ID: <5fd14448-27d9-43e6-8526-fd93483b94cb@ti.com>
Date: Mon, 5 May 2025 13:19:17 +0530
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH v5 2/3] drm/tidss: Update infrastructure to support K3 DSS
 cut-down versions
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC: <praneeth@ti.com>, <vigneshr@ti.com>, <aradhya.bhatia@linux.dev>,
 <s-jain1@ti.com>, <r-donadkar@ti.com>, <j-choudhary@ti.com>,
 <h-shenoy@ti.com>, <jyri.sarha@iki.fi>, <airlied@gmail.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <dri-devel@lists.freedesktop.org>,
 <simona@ffwll.ch>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>
References: <20250429143656.3252877-1-devarsht@ti.com>
 <20250429143656.3252877-3-devarsht@ti.com>
 <f729c0d6-45a0-4610-b22b-92c03f534bf7@ideasonboard.com>
 <1f8c43cd-8c26-4e42-b144-b91f5ffc2e2e@ti.com>
 <88993439-bfdc-418c-95c6-d6d8bdb5b87f@ideasonboard.com>
 <466254e9-145f-4839-9451-a5f282ff02e9@ti.com>
 <ce831f65-67d0-4f4c-9f08-3014b1d00dc0@ideasonboard.com>
 <ca008cb0-bec6-4b10-b6b5-0f29648f76c0@ti.com>
 <ed82e498-b3af-46f6-97ce-3a2f47872935@ideasonboard.com>
 <ead31912-d1e5-4813-99a7-5cd2754672ef@ti.com>
 <d4daa87f-3556-4b46-a0e0-d90f9d14a097@ideasonboard.com>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <d4daa87f-3556-4b46-a0e0-d90f9d14a097@ideasonboard.com>
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

Hi Tomi

On 03/05/25 14:14, Tomi Valkeinen wrote:
> On 02/05/2025 14:52, Devarsh Thakkar wrote:

>> Hi,
>>
>>
<snip>
>> Ok I see what you mean to say.....although functionally it is working
>> fine but from readability point of view it is confusing since both
>> functions use same argument name i.e hw_plane in two different contexts.
>> In that case, I would propose to use hw_id as arg name for all
>> dispc_k3_vid* functions, will that be okay ?
> 
> I'd prefer to have all the dispc functions take the same kind of index.
> 

Why? Even all dispc functions are not named with same prefix.
1) dispc_vid* functions act on VID* base directly and here plane
indexing would be w.r.t which VID* base we are using e.g VID vs VIDL
2) dispc_k3_vid* functions act on common region bits which are related
to VID pipelines and plane indexing would signify vid base w.r.t common
register space i.e. COMMON_VID_IRQ0 vs COMMON_VID_IRQ1.

As they both act on different register base and refer it in different
contexts (VID* base vs COMMON_VID* base)  and have also been named
differently anyway, I feel it is okay and legitimate to use hw_id for
dispc_k3_vid* functions (which would signify vid* indexing w.r.t common
region) and hw_plane for dispc_vid* functions (which would signify vid*
base w.r.t VID* regions mapped in device-tree).

Regards
Devarsh

>  Tomi
> 

