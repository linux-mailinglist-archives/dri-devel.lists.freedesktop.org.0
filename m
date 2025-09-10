Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0C6B511F2
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 11:00:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEC5610E8A2;
	Wed, 10 Sep 2025 08:59:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="T7zDR1dS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89B8A10E8A2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 08:59:57 +0000 (UTC)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58A8xRrg481262;
 Wed, 10 Sep 2025 03:59:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1757494767;
 bh=SZEwj2uiM3w7JTw8M+i8LSuxV8lRv85UX6fHmzJwKDs=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=T7zDR1dSStBgc/bVeGhNjupJA1V1tveROzhEd8s/g8jwQkPuaFfuiboUAuacVwffM
 zV5PRD5nf+UCVA8sdpQXYggqhfjWAgytjx1lspnnZB/78lBnj8SBOR6ZxPH/XmEURs
 D/PqyUX+MFaGYeh75N+MGsvOHTTLD5S9klx/IPV0=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
 by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58A8xR07168290
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Wed, 10 Sep 2025 03:59:27 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 10
 Sep 2025 03:59:27 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 10 Sep 2025 03:59:26 -0500
Received: from [172.24.235.208] (hkshenoy.dhcp.ti.com [172.24.235.208])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58A8xIdY233349;
 Wed, 10 Sep 2025 03:59:19 -0500
Message-ID: <7ef2071a-0c57-4ca8-af67-ed254d5d2faf@ti.com>
Date: Wed, 10 Sep 2025 14:29:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/6] drm/bridge: cadence: cdns-mhdp8546-core: Remove
 legacy support for connector initialisation in bridge
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <lumag@kernel.org>, <dianders@chromium.org>,
 <andy.yan@rock-chips.com>, <mordan@ispras.ru>, <linux@treblig.org>,
 <viro@zeniv.linux.org.uk>, <aradhya.bhatia@linux.dev>,
 <javierm@redhat.com>, <tomi.valkeinen@ideasonboard.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <devarsht@ti.com>, <u-kumar1@ti.com>, <s-jain1@ti.com>,
 <lyude@redhat.com>, <luca.ceresoli@bootlin.com>
References: <20250909090824.1655537-1-h-shenoy@ti.com>
 <20250909090824.1655537-2-h-shenoy@ti.com>
 <gptscrssnl7lck6ga6bzu4grcjcbokbdznbg4skbpvrmuo57ex@4zjugogguuw4>
Content-Language: en-US
From: Harikrishna Shenoy <h-shenoy@ti.com>
In-Reply-To: <gptscrssnl7lck6ga6bzu4grcjcbokbdznbg4skbpvrmuo57ex@4zjugogguuw4>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
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


On 9/9/25 19:39, Dmitry Baryshkov wrote:
> On Tue, Sep 09, 2025 at 02:38:19PM +0530, Harikrishna Shenoy wrote:
>> From: Jayesh Choudhary <j-choudhary@ti.com>
>>
>> Now that we have DBANC framework, remove the connector initialisation code
>> as that piece of code is not called if DRM_BRIDGE_ATTACH_NO_CONNECTOR flag
>> is used. Only TI K3 platforms consume this driver and tidss (their display
>> controller) has this flag set. So this legacy support can be dropped.
>>
>> Fixes: c932ced6b585 ("drm/tidss: Update encoder/bridge chain connect model")
> I'm not sure, why do you have this Fixes tag. Other than that:
>
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
>
Hi Dmitry,

Have explained about fixes tag in cover letter, that these 4 commits

fix the bug of null pointer de-refernce (logs and bug described in cover 
letter).

also have given the rationale of sequencing of commits in cover letter.

Warm Regards,

Hari

>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>> ---
>>   .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 187 +-----------------
>>   1 file changed, 10 insertions(+), 177 deletions(-)
>>
