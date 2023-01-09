Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C5E662338
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 11:30:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47D7E10E3CC;
	Mon,  9 Jan 2023 10:30:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C117210E3CC;
 Mon,  9 Jan 2023 10:30:15 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id jo4so18877334ejb.7;
 Mon, 09 Jan 2023 02:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=phEhvKafKrajoyp0Jf/fdEMMEawQCVqd+pQs/PZPFAE=;
 b=ez3/+Rmvpu4s53moABtNJgpziWMcrf28CEllQYJkkZvEgjz99mk5PD6PgARxHql0so
 dFdpghx/nvAXXb40L6LdzY6Xeo/vdpZqcUQEWiiHL3AEx57f+3bxfPYo/Rh/0SyyWDx3
 9An/Bxarvztnt+1mXNUtJMyEbqbQz8t0B2xHh+6zuQwoAceb+sEb9XiM/YsyP5epW+g6
 SkDomGWNAgy6NfpnCvXCYgJhUkZlDBPR3n0Dtp9tNOSxZT+sbl5BKGbXBWUwrWDfjMPL
 fqQLi50D0TjuRtjNQO8JvtWAOKUBR0Ezai+yB8aQJ3HQ+lUFcWeIOqo/iDp1EIWfnf54
 xr/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=phEhvKafKrajoyp0Jf/fdEMMEawQCVqd+pQs/PZPFAE=;
 b=IDBwmobzW/4ZNrZpTpJ+lunwjxfY7HnQlJniXB1B0HjF5fPtlz7J7ev2hHoQU+gNNl
 Hj3BAMFu6kB5mefsK5Kur7ymtctB40/GUBehljuHGrmEkzp4sYZ05wIxLuk+UXd3AUWA
 nfD0/iTlnTVSMUSpHTqdEv6/pkGELvgxbtITasaN0FBi+QhM6lB6SGiqMsofEXsqfdYG
 qH7A2qUI2LRGqf/ILxpE3MSLq2kxnlaO71KD31d6dYo3uAiRNiVzHy09EUUGFukSkHJ+
 p0ZkKUja6p5gqe2iNfA4bBRoX6bWajernM9vk812CtAqMLHB+Z5OBNndbo+X7hO9m3cr
 IOYg==
X-Gm-Message-State: AFqh2krWV3lylJuTVdaaYqVRErrh5vxkEVeF5UOXC7Avi8l02avyxekm
 +bpOL/omYoEbeKTqoBr/b2Y=
X-Google-Smtp-Source: AMrXdXuLz6NCFQR52Qhdgsnzf/luJgsmLgt97nsac26wYuu+FL+RCoPaGzmpyF+1jXH9sualZflWOQ==
X-Received: by 2002:a17:907:8c06:b0:7c1:3fbd:d569 with SMTP id
 ta6-20020a1709078c0600b007c13fbdd569mr57477938ejc.8.1673260214391; 
 Mon, 09 Jan 2023 02:30:14 -0800 (PST)
Received: from [192.168.178.21] (p5b0ea2e7.dip0.t-ipconnect.de.
 [91.14.162.231]) by smtp.gmail.com with ESMTPSA id
 qu25-20020a170907111900b0084c7574630csm3600928ejb.97.2023.01.09.02.30.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 02:30:13 -0800 (PST)
Message-ID: <b8f4af07-6ce7-dbbd-744e-8cd8706b5b07@gmail.com>
Date: Mon, 9 Jan 2023 11:30:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/5] drm/amdgpu: Do not include <linux/fb.h>
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 patrik.r.jakobsson@gmail.com, thierry.reding@gmail.com, sam@ravnborg.org,
 f.fainelli@gmail.com
References: <20230109101243.26995-1-tzimmermann@suse.de>
 <20230109101243.26995-4-tzimmermann@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20230109101243.26995-4-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 09.01.23 um 11:12 schrieb Thomas Zimmermann:
> Remove unnecessary include statements for <linux/fb.h>. No functional
> changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c                         | 1 -
>   drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c             | 1 -
>   drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c           | 1 -
>   drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_processpptables.c | 1 -
>   drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c           | 1 -
>   drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_processpptables.c | 1 -
>   drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c           | 1 -
>   drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_processpptables.c | 1 -
>   drivers/gpu/drm/amd/pm/powerplay/smumgr/ci_smumgr.c             | 1 -
>   9 files changed, 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 1353ffd08988..ebc6e6cbe2ab 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -39,7 +39,6 @@
>   #include <linux/mmu_notifier.h>
>   #include <linux/suspend.h>
>   #include <linux/cc_platform.h>
> -#include <linux/fb.h>
>   #include <linux/dynamic_debug.h>
>   
>   #include "amdgpu.h"
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
> index 7ef7e81525a3..d6edd83f67c6 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
> @@ -22,7 +22,6 @@
>    */
>   #include "pp_debug.h"
>   #include <linux/delay.h>
> -#include <linux/fb.h>
>   #include <linux/module.h>
>   #include <linux/pci.h>
>   #include <linux/slab.h>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
> index c8c9fb827bda..733cac4600ff 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
> @@ -22,7 +22,6 @@
>    */
>   
>   #include <linux/delay.h>
> -#include <linux/fb.h>
>   #include <linux/module.h>
>   #include <linux/pci.h>
>   #include <linux/slab.h>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_processpptables.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_processpptables.c
> index 95b988823f50..bb90d8abf79b 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_processpptables.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_processpptables.c
> @@ -23,7 +23,6 @@
>   #include <linux/module.h>
>   #include <linux/pci.h>
>   #include <linux/slab.h>
> -#include <linux/fb.h>
>   
>   #include "vega10_processpptables.h"
>   #include "ppatomfwctrl.h"
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c
> index a2f4d6773d45..c73693dc4c09 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c
> @@ -22,7 +22,6 @@
>    */
>   
>   #include <linux/delay.h>
> -#include <linux/fb.h>
>   #include <linux/module.h>
>   #include <linux/slab.h>
>   
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_processpptables.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_processpptables.c
> index bd54fbd393b9..89148f73b514 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_processpptables.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_processpptables.c
> @@ -22,7 +22,6 @@
>    */
>   #include <linux/module.h>
>   #include <linux/slab.h>
> -#include <linux/fb.h>
>   
>   #include "vega12/smu9_driver_if.h"
>   #include "vega12_processpptables.h"
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c
> index b30684c84e20..33f3d9792181 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c
> @@ -22,7 +22,6 @@
>    */
>   
>   #include <linux/delay.h>
> -#include <linux/fb.h>
>   #include <linux/module.h>
>   #include <linux/slab.h>
>   
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_processpptables.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_processpptables.c
> index 1f9082539457..79c817752a33 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_processpptables.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_processpptables.c
> @@ -22,7 +22,6 @@
>    */
>   #include <linux/module.h>
>   #include <linux/slab.h>
> -#include <linux/fb.h>
>   
>   #include "smu11_driver_if.h"
>   #include "vega20_processpptables.h"
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/ci_smumgr.c b/drivers/gpu/drm/amd/pm/powerplay/smumgr/ci_smumgr.c
> index 5ca3c422f7d4..5c3f42d97f69 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/ci_smumgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/ci_smumgr.c
> @@ -22,7 +22,6 @@
>    */
>   #include <linux/module.h>
>   #include <linux/slab.h>
> -#include <linux/fb.h>
>   #include "linux/delay.h"
>   #include <linux/types.h>
>   #include <linux/pci.h>

