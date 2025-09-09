Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41285B4A638
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 10:59:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D08E10E10A;
	Tue,  9 Sep 2025 08:58:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="uEu9gw6B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEB6710E23A
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 08:58:56 +0000 (UTC)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5898wVh8252869;
 Tue, 9 Sep 2025 03:58:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1757408311;
 bh=0d7t8ytG1KYXMuk/O6rae+6WjEMPs0v0Joex6Yfs+1A=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=uEu9gw6BPWlTNhXTT4D6LNiGVy5VuQ7L4xsHXc5dtUjVoh4Eckel/qqz4SN/xNRAV
 C7zegZFBQddRgmy0XDd6qbuKrk6IYbX3fMuSnHcKxVLt1hw2lD9yypTjD54UkEeH9a
 Kxme6pcHt0udMcvDAp3iPGdN3iwbnrLwnHh8q2Zc=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5898wVuH3036821
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Tue, 9 Sep 2025 03:58:31 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 9
 Sep 2025 03:58:30 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 9 Sep 2025 03:58:30 -0500
Received: from [172.24.233.62] (devarsh-precision-tower-3620.dhcp.ti.com
 [172.24.233.62])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5898wQPo2383855;
 Tue, 9 Sep 2025 03:58:27 -0500
Message-ID: <0b6587e1-b0ae-4580-9ed9-f4c8b8c9378e@ti.com>
Date: Tue, 9 Sep 2025 14:28:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/tidss: Update Videoport SYNC LOST IRQ bit
To: Harikrishna Shenoy <h-shenoy@ti.com>, <jyri.sarha@iki.fi>,
 <tomi.valkeinen@ideasonboard.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <bparrot@ti.com>, <sam@ravnborg.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250903100929.2598626-1-h-shenoy@ti.com>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20250903100929.2598626-1-h-shenoy@ti.com>
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

Hi Hari,

On 03/09/25 15:39, Harikrishna Shenoy wrote:
> Update VP SYNC LOST Bit as per register description for
> DSS0_COMMON_VP_IRQENABLE_0 give in TRM.
> 
> Link:https://www.ti.com/lit/zip/spruil1/SPRUIL_DRA829_TDA4VM
> Table 12-597. DSS0_COMMON_VP_IRQENABLE_0
> 
> Fixes: 32a1795f57ee ("drm/tidss: New driver for TI Keystone platform Display SubSystem")
> 
> Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
> ---
>   drivers/gpu/drm/tidss/tidss_irq.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_irq.h b/drivers/gpu/drm/tidss/tidss_irq.h
> index dd61f645f662..0194010a7fff 100644
> --- a/drivers/gpu/drm/tidss/tidss_irq.h
> +++ b/drivers/gpu/drm/tidss/tidss_irq.h
> @@ -53,7 +53,7 @@ static inline dispc_irq_t DSS_IRQ_PLANE_MASK(u32 plane)
>   #define DSS_IRQ_VP_FRAME_DONE(ch)	DSS_IRQ_VP_BIT((ch), 0)
>   #define DSS_IRQ_VP_VSYNC_EVEN(ch)	DSS_IRQ_VP_BIT((ch), 1)
>   #define DSS_IRQ_VP_VSYNC_ODD(ch)	DSS_IRQ_VP_BIT((ch), 2)
> -#define DSS_IRQ_VP_SYNC_LOST(ch)	DSS_IRQ_VP_BIT((ch), 3)
> +#define DSS_IRQ_VP_SYNC_LOST(ch)	DSS_IRQ_VP_BIT((ch), 4)

I think DSS_IRQ_VP_BIT((ch), 3) is correct only. As we discussed, above 
bits correspond to virtual mask that driver is using as mentioned in the 
comment :

/
  * 

  * bit group |dev|wb |mrg0|mrg1|mrg2|mrg3|plane0-3| <unused> | 

  * bit use   |D  |fou|FEOL|FEOL|FEOL|FEOL|  UUUU  |          | 

  * bit number|0  |1-3|4-7 |8-11|  12-19  | 20-23  |  24-31   | 

  *
/

Furthermore, it gives correct value per the above table when sync lost 
occurs :
[ 2245.588346] tidss 30220000.dss: CRTC1 SYNC LOST: (irq 800)

Hence, NACK for this patch.

Regards
Devarsh











>   
>   #define DSS_IRQ_PLANE_FIFO_UNDERFLOW(plane)	DSS_IRQ_PLANE_BIT((plane), 0)
>   

