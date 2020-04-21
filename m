Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 553041B2486
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 13:05:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80C486E462;
	Tue, 21 Apr 2020 11:05:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE2D6E462
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 11:05:33 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03LB5UBC102252;
 Tue, 21 Apr 2020 06:05:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1587467130;
 bh=1O957wDCvnhGucAhJSvJSnpoP5gHWng8P4cDfijJ0ww=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=eQuA/12M2NeImeBj169xmVXsVZO3nhcm9L2a75cwhJo2/sZA67ud02RH9lhsIpr/e
 LxfFH5uR+xw6117fTTN8/ioqkIzZykymZMoKvHxjibl1oNtqxEQV7/RrQDHGy7m9JE
 qnrl88kFlPIyikL00rc05AG5sOBSma+lKdCvq8vs=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03LB5UxZ071242
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 21 Apr 2020 06:05:30 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 21
 Apr 2020 06:05:29 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 21 Apr 2020 06:05:29 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03LB5R0M127127;
 Tue, 21 Apr 2020 06:05:28 -0500
Subject: Re: [PATCH 25/59] drm/tidss: Delete tidss->saved_state
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics Development
 <intel-gfx@lists.freedesktop.org>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-26-daniel.vetter@ffwll.ch>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <2aaafbe5-70ae-6dfd-5629-29c84b3a1530@ti.com>
Date: Tue, 21 Apr 2020 14:05:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200415074034.175360-26-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jyri Sarha <jsarha@ti.com>, DRI Development <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/04/2020 10:40, Daniel Vetter wrote:
> Not used anymore since the switch to suspend/resume helpers.
> 
> Tested-by: Jyri Sarha <jsarha@ti.com>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Jyri Sarha <jsarha@ti.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>   drivers/gpu/drm/tidss/tidss_drv.h | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_drv.h b/drivers/gpu/drm/tidss/tidss_drv.h
> index b23cd95c8d78..3b0a3d87b7c4 100644
> --- a/drivers/gpu/drm/tidss/tidss_drv.h
> +++ b/drivers/gpu/drm/tidss/tidss_drv.h
> @@ -29,8 +29,6 @@ struct tidss_device {
>   
>   	spinlock_t wait_lock;	/* protects the irq masks */
>   	dispc_irq_t irq_mask;	/* enabled irqs in addition to wait_list */
> -
> -	struct drm_atomic_state *saved_state;
>   };
>   
>   #define to_tidss(__dev) container_of(__dev, struct tidss_device, ddev)
> 

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
