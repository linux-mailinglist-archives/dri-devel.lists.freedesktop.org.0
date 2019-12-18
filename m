Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86209124010
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 08:08:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8A9F6E226;
	Wed, 18 Dec 2019 07:08:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB7FF6E226
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 07:08:00 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBI77tYF106184;
 Wed, 18 Dec 2019 01:07:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1576652875;
 bh=uQUw28ICmMhl/3QZr3zys9sqTn2onispGWGMldg2xVw=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=Vwz7ed6ZS3KG6hy1J4edGmcd5d+CIhpC4GMjAVhmfGLJEuhc9U0KgY+RbZyBYfdOq
 lvxjJLhZoCxm3RW8VYpev1sqwt1xkvu3+/NTe/dCdrNuzcDd5IklTcoEbazj/Eg6tm
 tkXkuUXmvoVtaAk9qqBNfHrpMoq88CK3cbWIGI0Q=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBI77trv041445
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 18 Dec 2019 01:07:55 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 18
 Dec 2019 01:07:54 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 18 Dec 2019 01:07:54 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBI77qnt121163;
 Wed, 18 Dec 2019 01:07:53 -0600
Subject: Re: [PATCH v3 00/50] drm/omap: Replace custom display drivers with
 drm_bridge and drm_panel
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sam Ravnborg
 <sam@ravnborg.org>
References: <20191210225750.15709-1-laurent.pinchart@ideasonboard.com>
 <20191215122728.GA32124@ravnborg.org>
 <20191218020336.GN4874@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <932bbb46-a3fb-67c6-6f12-85540fe7f234@ti.com>
Date: Wed, 18 Dec 2019 09:07:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191218020336.GN4874@pendragon.ideasonboard.com>
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
Cc: Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Boris Brezillon <bbrezillon@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/12/2019 04:03, Laurent Pinchart wrote:

>> Hopefully we can soon have this series landed so we can start
>> working on top of the new bridge/connector handling.
>>
>> I assume it will be applied direct to drm-misc-next, so we do not
>> have to wait extra time to get it.
> 
> Tomi, how would you like to proceed ? The core patches are ready in my
> opinion. I can post a v4 without the omapdrm patches, which could be
> merged to drm-misc already while you finish reviewing patches 30/50
> onwards.

This sounds good to me.

I have tested your branch on AM5 EMV, AM4 EVM and Panda, without any issues. But that's with the 
omapdrm patches, and things will be slightly different without them.

You add TPD12S015 and OPA362 driver in the earlier part. Should those be moved to the omapdrm side? 
In theory there won't be any issues, but having multiple drivers for the same device can create 
conflicts.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
