Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB0AAEF7B8
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 14:04:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B3BD10E031;
	Tue,  1 Jul 2025 12:04:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="cMIUouJJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D586810E031
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 12:04:47 +0000 (UTC)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
 by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 561C4L2G3613463;
 Tue, 1 Jul 2025 07:04:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1751371461;
 bh=FxmiebPIaeW3vcua2psua1JTYarnf+7Xb/RB+rm6+DE=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=cMIUouJJr4t9zDpfhSI8f7Chghw7kZvQSCVTS394ne7PdaZbkBnTe0rmTDHqc4Bdl
 WCC5NtY32j3zhTpk2AbNddMP5g72xRjC1ot18O0wbN+7B0aUnsyG1o7zqkZRyC1xIH
 sdL9RdcB5AYmWwztjU5qLTAIzTWhjYKptcxj/fpE=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
 by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 561C4K1t4055689
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Tue, 1 Jul 2025 07:04:20 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 1
 Jul 2025 07:04:20 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 1 Jul 2025 07:04:20 -0500
Received: from [172.24.227.193] (devarsh-precision-tower-3620.dhcp.ti.com
 [172.24.227.193])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 561C4GIw1515693;
 Tue, 1 Jul 2025 07:04:17 -0500
Message-ID: <3541e223-6a06-40f6-ab32-1b9baf718371@ti.com>
Date: Tue, 1 Jul 2025 17:34:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] drm/tidss: oldi: Add property to identify OLDI
 supported VP
To: Jayesh Choudhary <j-choudhary@ti.com>, <jyri.sarha@iki.fi>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <dri-devel@lists.freedesktop.org>,
 <tomi.valkeinen@ideasonboard.com>, <mwalle@kernel.org>
CC: <airlied@gmail.com>, <simona@ffwll.ch>, <linux-kernel@vger.kernel.org>
References: <20250701095541.190422-1-j-choudhary@ti.com>
 <20250701095541.190422-2-j-choudhary@ti.com>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20250701095541.190422-2-j-choudhary@ti.com>
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



On 01/07/25 15:25, Jayesh Choudhary wrote:
> TIDSS should know which VP has OLDI output to avoid calling clock
> functions for that VP as those are controlled by oldi driver. Add a
> property "is_oldi_vp" to "tidss_device" structure for that. Mark it
> 'true' in tidss_oldi_init() and 'false' in tidss_oldi_deinit().
> 
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>

Reviewed-by: Devarsh Thakkar <devarsht@ti.com>

Regards
Devarsh
> ---
>   drivers/gpu/drm/tidss/tidss_drv.h  | 2 ++
>   drivers/gpu/drm/tidss/tidss_oldi.c | 2 ++
>   2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_drv.h b/drivers/gpu/drm/tidss/tidss_drv.h
> index 0ae24f645582..82beaaceadb3 100644
> --- a/drivers/gpu/drm/tidss/tidss_drv.h
> +++ b/drivers/gpu/drm/tidss/tidss_drv.h
> @@ -24,6 +24,8 @@ struct tidss_device {
>   
>   	const struct dispc_features *feat;
>   	struct dispc_device *dispc;
> +	bool is_oldi_vp[TIDSS_MAX_PORTS];
> +
>   
>   	unsigned int num_crtcs;
>   	struct drm_crtc *crtcs[TIDSS_MAX_PORTS];
> diff --git a/drivers/gpu/drm/tidss/tidss_oldi.c b/drivers/gpu/drm/tidss/tidss_oldi.c
> index b0f99656e87e..63e07c8edeaa 100644
> --- a/drivers/gpu/drm/tidss/tidss_oldi.c
> +++ b/drivers/gpu/drm/tidss/tidss_oldi.c
> @@ -430,6 +430,7 @@ void tidss_oldi_deinit(struct tidss_device *tidss)
>   	for (int i = 0; i < tidss->num_oldis; i++) {
>   		if (tidss->oldis[i]) {
>   			drm_bridge_remove(&tidss->oldis[i]->bridge);
> +			tidss->is_oldi_vp[tidss->oldis[i]->parent_vp] = false;
>   			tidss->oldis[i] = NULL;
>   		}
>   	}
> @@ -579,6 +580,7 @@ int tidss_oldi_init(struct tidss_device *tidss)
>   		oldi->bridge.timings = &default_tidss_oldi_timings;
>   
>   		tidss->oldis[tidss->num_oldis++] = oldi;
> +		tidss->is_oldi_vp[oldi->parent_vp] = true;
>   		oldi->tidss = tidss;
>   
>   		drm_bridge_add(&oldi->bridge);
