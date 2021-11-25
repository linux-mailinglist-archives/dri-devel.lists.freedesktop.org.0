Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E35D45D72C
	for <lists+dri-devel@lfdr.de>; Thu, 25 Nov 2021 10:29:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 902A16E525;
	Thu, 25 Nov 2021 09:29:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C94136E525
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 09:29:08 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637832562; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: From: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: Sender; bh=+hE7rsA6S3I3kl8+qNiMxVgjO73xM/HHZQA+ALiBHbk=;
 b=KUc/7QMR1UBpK5NCefFXPiWLqs+6spM0ICQ8+1I1kpZ4IuWIR17o4EVzHgUCYXWfHPmEm3HB
 JgEfFrwkDh/w+IWMFoZU9TJe8mhLO+gJxVv1TpccpCo71cRYvr59bEUtCOtgJgD+a9V75HAY
 rHLnBTMrg/9SfZXpefT0/XfQW7s=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 619f575abebfa3d4d5ee0b20 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 25 Nov 2021 09:28:58
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1DE64C4360D; Thu, 25 Nov 2021 09:28:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
 version=3.4.0
Received: from [192.168.1.5] (unknown [61.1.233.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id BBDCBC4360C;
 Thu, 25 Nov 2021 09:28:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org BBDCBC4360C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Message-ID: <a0d95300-cba7-9e2d-5820-f61569dd85ba@codeaurora.org>
Date: Thu, 25 Nov 2021 14:58:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [bug report] drm/msm/a6xx: Fix llcc configuration for a660 gpu
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <20211125083644.GA6382@kili>
From: Akhil P Oommen <akhilpo@codeaurora.org>
In-Reply-To: <20211125083644.GA6382@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Nathan Chancellor <natechancellor@gmail.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/25/2021 2:06 PM, Dan Carpenter wrote:
> [ Nathan, it turns out that Smatch has been broken with regards to
>    uninitialized variables for a while so I'm going through my backlog
>    of warnings.  No idea if you already reported this one.
> 
>    - dan]
> 
> Hello Akhil P Oommen,
> 
> The patch a6f24383f6c0: "drm/msm/a6xx: Fix llcc configuration for
> a660 gpu" from Jul 30, 2021, leads to the following Smatch static
> checker warning:
> 
> 	drivers/gpu/drm/msm/adreno/a6xx_gpu.c:1480 a6xx_llc_activate()
> 	error: uninitialized symbol 'gpu_scid'.
> 
> drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>      1423 static void a6xx_llc_activate(struct a6xx_gpu *a6xx_gpu)
>      1424 {
>      1425         struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>      1426         struct msm_gpu *gpu = &adreno_gpu->base;
>      1427         u32 gpu_scid, cntl1_regval = 0;
>                   ^^^^^^^^^^^^
> 
>      1428
>      1429         if (IS_ERR(a6xx_gpu->llc_mmio))
>      1430                 return;
>      1431
>      1432         if (!llcc_slice_activate(a6xx_gpu->llc_slice)) {
>      1433                 gpu_scid = llcc_get_slice_id(a6xx_gpu->llc_slice);
>                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
>      1434
>      1435                 gpu_scid &= 0x1f;
>      1436                 cntl1_regval = (gpu_scid << 0) | (gpu_scid << 5) | (gpu_scid << 10) |
>      1437                                (gpu_scid << 15) | (gpu_scid << 20);
>      1438         }
>      1439
>      1440         /*
>      1441          * For targets with a MMU500, activate the slice but don't program the
>      1442          * register.  The XBL will take care of that.
>      1443          */
>      1444         if (!llcc_slice_activate(a6xx_gpu->htw_llc_slice)) {
>      1445                 if (!a6xx_gpu->have_mmu500) {
>      1446                         u32 gpuhtw_scid = llcc_get_slice_id(a6xx_gpu->htw_llc_slice);
>      1447
>      1448                         gpuhtw_scid &= 0x1f;
>      1449                         cntl1_regval |= FIELD_PREP(GENMASK(29, 25), gpuhtw_scid);
>      1450                 }
>      1451         }
>      1452
>      1453         if (!cntl1_regval)
>      1454                 return;
>      1455
>      1456         /*
>      1457          * Program the slice IDs for the various GPU blocks and GPU MMU
>      1458          * pagetables
>      1459          */
>      1460         if (!a6xx_gpu->have_mmu500) {
>      1461                 a6xx_llc_write(a6xx_gpu,
>      1462                         REG_A6XX_CX_MISC_SYSTEM_CACHE_CNTL_1, cntl1_regval);
>      1463
>      1464                 /*
>      1465                  * Program cacheability overrides to not allocate cache
>      1466                  * lines on a write miss
>      1467                  */
>      1468                 a6xx_llc_rmw(a6xx_gpu,
>      1469                         REG_A6XX_CX_MISC_SYSTEM_CACHE_CNTL_0, 0xF, 0x03);
>      1470                 return;
>      1471         }
>      1472
>      1473         gpu_rmw(gpu, REG_A6XX_GBIF_SCACHE_CNTL1, GENMASK(24, 0), cntl1_regval);
>      1474
>      1475         /* On A660, the SCID programming for UCHE traffic is done in
>      1476          * A6XX_GBIF_SCACHE_CNTL0[14:10]
>      1477          */
>      1478         if (adreno_is_a660_family(adreno_gpu))
>      1479                 gpu_rmw(gpu, REG_A6XX_GBIF_SCACHE_CNTL0, (0x1f << 10) |
> --> 1480                         (1 << 8), (gpu_scid << 10) | (1 << 8));
>                                              ^^^^^^^^^^^^^^
> Uninitialized if llcc_slice_activate() failed.
> 
>      1481 }
> 
> regards,
> dan carpenter
> 

Dan,

This is fixed here: https://patchwork.freedesktop.org/patch/464046/

-Akhil.
