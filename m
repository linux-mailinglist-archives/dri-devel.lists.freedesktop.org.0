Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C52AC2768E0
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 08:28:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1F3B6EAA8;
	Thu, 24 Sep 2020 06:28:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25E196EAA8
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 06:28:16 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08O6S2Go010071;
 Thu, 24 Sep 2020 01:28:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600928882;
 bh=0yxL3UwtG5BvIkPNkawsRHIiyKw0JhuTCN5ScjMZh3U=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=FFa/7pkwE1acxRzbAL1b8RALbaRgs5p/QtMiEVApgoArKVHxozlNbBudxt/ZGAPjn
 /+H7t0IspEk9Q7nx1dOMwE3wj3zlvS6gzjPq6MsnbI+L1cf8+80NLY7kAIaPEqPHTw
 ddxKRpBh78OpQQ6olHAXCrGBXtUql5L2UjrgaTrs=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08O6S2SL047611
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 24 Sep 2020 01:28:02 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 24
 Sep 2020 01:28:01 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 24 Sep 2020 01:28:01 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08O6S0lC063961;
 Thu, 24 Sep 2020 01:28:00 -0500
Subject: Re: [PATCH] drm: bridge: cdns-mhdp8546: fix compile warning
To: <dri-devel@lists.freedesktop.org>, Swapnil Jakhade <sjakhade@cadence.com>, 
 Yuti Amonkar <yamonkar@cadence.com>
References: <20200923083057.113367-1-tomi.valkeinen@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <46713f66-f34f-475c-b821-6fb22d8ccfd5@ti.com>
Date: Thu, 24 Sep 2020 09:27:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200923083057.113367-1-tomi.valkeinen@ti.com>
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
Cc: Dave Airlie <airlied@linux.ie>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/09/2020 11:30, Tomi Valkeinen wrote:
> On x64 we get:
> 
> drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:751:10: warning: conversion from 'long unsigned int' to 'unsigned int' changes value from '18446744073709551613' to '4294967293' [-Woverflow]
> 
> The registers are 32 bit, so fix by casting to u32.
> 
> Fixes: fb43aa0acdfd ("drm: bridge: Add support for Cadence MHDP8546 DPI/DP bridge")
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

I forgot to add

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
