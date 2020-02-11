Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51013158A6E
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 08:31:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D58E6EDC7;
	Tue, 11 Feb 2020 07:31:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 305A86EDC7
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 07:31:28 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01B7VPB1037395;
 Tue, 11 Feb 2020 01:31:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1581406285;
 bh=Vt5DWD81nsjcTjP5QoQqSWaW83yP3vIn9VO8P3wcfGg=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=q7aoLykptQSOHBDvreb0KB4LQNytU5DsuPpOjZ8YeBrCmiLi4HCEzM+V40aQGvfM0
 TupuuzRxur6uKYoOd+YD0ldq92LXGUUtytZrzRA/dQjNNLL8bX2ZeZ//zTkNQZmzeq
 LFsy6ktmkm4PTNwYLNv5FP20ONDGWz/cRw1cYcnw=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01B7VPvX050611
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 11 Feb 2020 01:31:25 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 11
 Feb 2020 01:31:24 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 11 Feb 2020 01:31:24 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01B7VMra130934;
 Tue, 11 Feb 2020 01:31:23 -0600
Subject: Re: [PATCH 0/2] drm/omap: dmm_tiler: Small fixes for i878 workaround
To: Peter Ujfalusi <peter.ujfalusi@ti.com>, <laurent.pinchart@ideasonboard.com>
References: <20190731094233.13890-1-peter.ujfalusi@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <d4f4c206-473d-bcfa-8f95-7eef4b711f6a@ti.com>
Date: Tue, 11 Feb 2020 09:31:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20190731094233.13890-1-peter.ujfalusi@ti.com>
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
Cc: airlied@linux.ie, jsarha@ti.com, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31/07/2019 12:42, Peter Ujfalusi wrote:
> Hi,
> 
> two small correction on the use of DMAengine API, no functional changes
> - Use dmaengine_prep_dma_memcpy() to prepare the memcpy
> - do not call dma_async_issue_pending() as it is redundant
> 
> Regards,
> Peter
> ---
> Peter Ujfalusi (2):
>    drm/omap: dmm_tiler: Use dmaengine_prep_dma_memcpy() for i878
>      workaround
>    drm/omap: dmm_tiler: Remove the dma_async_issue_pending() call
> 
>   drivers/gpu/drm/omapdrm/omap_dmm_tiler.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 

Sorry, missed these two... Picked them up now.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
