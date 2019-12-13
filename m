Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DCC11E273
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 11:56:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CA1C6E478;
	Fri, 13 Dec 2019 10:56:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37B956E478
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 10:56:46 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBDAuYM5114573;
 Fri, 13 Dec 2019 04:56:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1576234594;
 bh=ypmFGloAwkhAl74Cgzy3NwvQSKKVwwK0b+Pe5fwy/wM=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=Ldp9cUj20wuKayAgy5XBC4faD5xcbEuXpbl5Sen9ofR83hLrmwOqgbZfgfL8qGxjL
 7kpSnjUUrBk4sC0Vfb7qEEm+vZMtU819rdJMl0k6VjMzfgCshesSNbU++Hly5VLVbX
 0no5uZl2og7WVHNxNg/2U+QYxAkZbrtdjSLHV/S0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBDAuY5o030324
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 13 Dec 2019 04:56:34 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 13
 Dec 2019 04:56:34 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 13 Dec 2019 04:56:34 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBDAuWmm040845;
 Fri, 13 Dec 2019 04:56:32 -0600
Subject: Re: [PATCH 1/4] ARM: dts: am437x-gp-evm: add HDMI support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20191125131100.9839-1-tomi.valkeinen@ti.com>
 <20191212172104.GY35479@atomide.com> <20191212173110.GA35479@atomide.com>
 <d09526b2-8435-bef2-0489-0c3c8173d451@ti.com>
 <20191213104204.GB4860@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <2f5cfca4-d36d-da2d-59ba-b76669daeded@ti.com>
Date: Fri, 13 Dec 2019 12:56:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191213104204.GB4860@pendragon.ideasonboard.com>
Content-Language: en-US
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Tony Lindgren <tony@atomide.com>, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, linux-omap@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/12/2019 12:42, Laurent Pinchart wrote:

>> I think the correct way would be to have DRM framework understand that we have two displays, which
>> are mutually exclusive, and the display pipeline drivers would have the means to switch the gpio.
>> And that the display setup could be communicated properly to the userspace, and the userspace would
>> understand it. I don't think any of those exists.
> 
> Isn't this what possible_clones in drm_encoder is for ? It notifies
> userspace of mutual exclusions between encoders.

Hmm, how would that work here? Isn't encoder cloning about having two encoders, which take the input 
from the same video source, and then outputting to two displays?

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
