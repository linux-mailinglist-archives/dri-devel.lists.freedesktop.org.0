Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6931AB80F
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 08:32:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D3C16E2B6;
	Thu, 16 Apr 2020 06:32:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3084E6E2B6
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 06:32:41 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03G6WSNl091235;
 Thu, 16 Apr 2020 01:32:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1587018748;
 bh=Rb8TXWTmwQcjPvJd3E+h6uzfxHfRJWCoNumVEM5OcBE=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=VxcMqauSvSkeMWgQZ96WlmQKP7xDtXR9gTemFrgiHZGchILth/PH2eIgvnZ6vSIyN
 duAgQ04xBDc0michmtgvgpby/jE9vXZ+KeM8ySYDQYN8PZ56bb+Wbi7Gr2F8Bv9Y1S
 vlN+qO/9AW3welU9Mu/1Q890ytQBOxnUPO5Gp4k0=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03G6WRfg083663
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 16 Apr 2020 01:32:27 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 16
 Apr 2020 01:32:26 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 16 Apr 2020 01:32:26 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03G6WOfQ025822;
 Thu, 16 Apr 2020 01:32:25 -0500
Subject: Re: [PATCH -next] drm/omap: venc: remove unused variable
 'venc_config_pal_bdghi'
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, YueHaibing
 <yuehaibing@huawei.com>
References: <20200415132105.43636-1-yuehaibing@huawei.com>
 <20200415153959.GI4758@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <1c9e1e60-5ff6-3ee7-e31e-e7cfb0cd279e@ti.com>
Date: Thu, 16 Apr 2020 09:32:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200415153959.GI4758@pendragon.ideasonboard.com>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 sebastian.reichel@collabora.com, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/04/2020 18:39, Laurent Pinchart wrote:
> Hi Yue,
> 
> Thank you for the patch.
> 
> On Wed, Apr 15, 2020 at 09:21:05PM +0800, YueHaibing wrote:
>> drivers/gpu/drm/omapdrm/dss/venc.c:211:33:
>>   warning: 'venc_config_pal_bdghi' defined but not used [-Wunused-const-variable=]
>>   static const struct venc_config venc_config_pal_bdghi = {
>>                                   ^~~~~~~~~~~~~~~~~~~~~
>>
>> It is never used, remove it.
> 
> Tomi, is this the right fix, or should we work on making use of this
> structure ?

I think we can remove it. I'll pick you this patch.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
