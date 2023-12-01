Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD1C8003D6
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 07:26:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C3E110E7F8;
	Fri,  1 Dec 2023 06:26:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10AC710E7EA
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 06:25:12 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3B16OAGH044118;
 Fri, 1 Dec 2023 00:24:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1701411850;
 bh=jTt7e3ZcUk0/BRs9umqaQu1F8R1WBoLZXviMWv3LpGs=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=vP0jHRRhVlaAlLHxJJHLjmLKiqSUi5kBK1nzO3LAMxSh5qMnsVfq7xpLyTW65CzLQ
 BRnsRN9FdSyQZgi/BUQm4oRPYHRLHHeZ8fzcT7694rHAXQh2AT+2xpbOEDKrSl8A+J
 JCxXp8dDsxrT3IQt0n7uXkqJjPcb93DLFkWWAYmI=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3B16OAL7082264
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 1 Dec 2023 00:24:10 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 1
 Dec 2023 00:24:09 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 1 Dec 2023 00:24:09 -0600
Received: from [172.24.227.25] (ileaxei01-snat.itg.ti.com [10.180.69.5])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3B16O5CD017548;
 Fri, 1 Dec 2023 00:24:06 -0600
Message-ID: <482d9ad7-86b6-48a9-8dab-5502ce1a5384@ti.com>
Date: Fri, 1 Dec 2023 11:54:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/11] drm/tidss: Probe related fixes and cleanups
Content-Language: en-US
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Devarsh Thakkar
 <devarsht@ti.com>, Jyri Sarha <jyri.sarha@iki.fi>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20231109-tidss-probe-v2-0-ac91b5ea35c0@ideasonboard.com>
From: Aradhya Bhatia <a-bhatia1@ti.com>
In-Reply-To: <20231109-tidss-probe-v2-0-ac91b5ea35c0@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
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
Cc: Francesco Dolcini <francesco@dolcini.it>, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patches!

On 09/11/23 13:07, Tomi Valkeinen wrote:
> While working on the TI BSP kernel, adding bootload splash screen
> support, I noticed some issues with the driver and opportunities for
> cleanups and improvements.
> 
>  Tomi
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
> Changes in v2:
> - Add missing pm_runtime_dont_use_autosuspend() in error path
> - Add simple manual "reset" for K2G
> - Leave tidss->dispc NULL if dispc_init fails
> - Add Fixes tags
> - Drop "drm/tidss: Add dispc_is_idle()"
> - Add "drm/tidss: Use DRM_PLANE_COMMIT_ACTIVE_ONLY"
> - Link to v1: https://lore.kernel.org/r/20231101-tidss-probe-v1-0-45149e0f9415@ideasonboard.com
> 
> ---
> Tomi Valkeinen (11):
>       drm/tidss: Use pm_runtime_resume_and_get()
>       drm/tidss: Use PM autosuspend
>       drm/tidss: Drop useless variable init
>       drm/tidss: Move reset to the end of dispc_init()
>       drm/tidss: Return error value from from softreset
>       drm/tidss: Check for K2G in in dispc_softreset()
>       drm/tidss: Add simple K2G manual reset
>       drm/tidss: Fix dss reset
>       drm/tidss: IRQ code cleanup
>       drm/tidss: Fix atomic_flush check
>       drm/tidss: Use DRM_PLANE_COMMIT_ACTIVE_ONLY

For the series,

Reviewed-by: Aradhya Bhatia <a-bhatia1@ti.com>

Regards
Aradhya

> 
>  drivers/gpu/drm/tidss/tidss_crtc.c  | 12 ++----
>  drivers/gpu/drm/tidss/tidss_dispc.c | 79 +++++++++++++++++++++++++++++++++----
>  drivers/gpu/drm/tidss/tidss_drv.c   | 15 +++++--
>  drivers/gpu/drm/tidss/tidss_irq.c   | 54 ++++---------------------
>  drivers/gpu/drm/tidss/tidss_kms.c   |  2 +-
>  5 files changed, 97 insertions(+), 65 deletions(-)
> ---
> base-commit: 9d7c8c066916f231ca0ed4e4fce6c4b58ca3e451
> change-id: 20231030-tidss-probe-854b1098c3af
> 
> Best regards,
