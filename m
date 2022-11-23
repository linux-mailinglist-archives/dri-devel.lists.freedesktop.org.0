Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26436635285
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 09:27:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A45910E518;
	Wed, 23 Nov 2022 08:27:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 910C810E517
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 08:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669192047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YKpKoTe4ZU34UoJKO8geCe1JrtkM14KSfdDG/HVoXpQ=;
 b=f58U/W5Os9E98ig0SDeQqGyfFcAMP9JPUG9yeTRgSbwlHOFEqBhryFt9gJlMGEHYIeHUXN
 2Te/Kn8y4iHC327fNnGC9DV/aO9Dapdp2wHpcKTCZHR69Mxpc3gO4ZoWPvezvq4Dy6DtI6
 4+PwSWQ++uc+BvMBn01g0zAYnl2Bv1I=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-522-9IIgQ2wKM3KF2FjSLu8Oqg-1; Wed, 23 Nov 2022 03:27:24 -0500
X-MC-Unique: 9IIgQ2wKM3KF2FjSLu8Oqg-1
Received: by mail-wr1-f70.google.com with SMTP id
 r23-20020adfa157000000b00241bcae980cso4139083wrr.7
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 00:27:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YKpKoTe4ZU34UoJKO8geCe1JrtkM14KSfdDG/HVoXpQ=;
 b=vfoTb4GCzsGPTtc1KZ4EA4e6gBe5YcE2406OkHtZPMF6JN730BgFU4ttkjxYf0k74D
 m6IZKYJdahKkZd7g1D2+1h3DzQpxNVYKs/ga7QM4UNua9pF0YPdzgvRFopFtGi/V6Jtv
 63ZKWPrzvhL1no3a3jYCx4gBxmNiWWNUqXnJQ9IqdBbJnXsOAlXMfoPkaI42BdT8Nz6h
 o+ZPPONYud0YpQ1QtTRHWnozqiNvaguB/RY5Utru5wRMf0OQ8ps7OXf0DIH7tbuiJuLd
 yzaMgi2PaqE/HytXBfu6uRHYzEBbDMNEYeFHUkXfCaCYNFhl4EqbpBKzxyh5NbSDg0F7
 B/MA==
X-Gm-Message-State: ANoB5pkEWmS5FVM90fVVFtSL6ryq1+w8ySMiBqk63HeKZQKLLkxHhnwX
 rZiaz39DTFQrwHsrXplm1R5AhI12graAc+3IF5ssE9XkSSGQ5plyR6MoGG5C6pHpleZv74EI/CQ
 yCtL9xs/ULHKFlg6AGhs3Df8xux9s
X-Received: by 2002:a05:6000:1247:b0:238:aa36:6b0d with SMTP id
 j7-20020a056000124700b00238aa366b0dmr15910674wrx.688.1669192042968; 
 Wed, 23 Nov 2022 00:27:22 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6YHG42BzgzhF9YWH/UAD26DSg9+v144OzbXtvCPHprHdpkgP/FqPq8KJqjSWyzdumgHBy+OA==
X-Received: by 2002:a05:6000:1247:b0:238:aa36:6b0d with SMTP id
 j7-20020a056000124700b00238aa366b0dmr15910666wrx.688.1669192042761; 
 Wed, 23 Nov 2022 00:27:22 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 v14-20020a5d4b0e000000b002416e383e1csm16167401wrq.25.2022.11.23.00.27.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Nov 2022 00:27:22 -0800 (PST)
Message-ID: <3978b59a-45bd-5973-2466-7d9eb8a98610@redhat.com>
Date: Wed, 23 Nov 2022 09:27:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 2/6] drm/gud: Fix UBSAN warning
To: noralf@tronnes.org, Thomas Zimmermann <tzimmermann@suse.de>,
 stable@kernel.org, Dave Airlie <airlied@redhat.com>,
 dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Maxime Ripard <mripard@kernel.org>
References: <20221122-gud-shadow-plane-v1-0-9de3afa3383e@tronnes.org>
 <20221122-gud-shadow-plane-v1-2-9de3afa3383e@tronnes.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221122-gud-shadow-plane-v1-2-9de3afa3383e@tronnes.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/22/22 21:58, Noralf Trønnes via B4 Submission Endpoint wrote:
> From: Noralf Trønnes <noralf@tronnes.org>
> 
> UBSAN complains about invalid value for bool:
> 
> [  101.165172] [drm] Initialized gud 1.0.0 20200422 for 2-3.2:1.0 on minor 1
> [  101.213360] gud 2-3.2:1.0: [drm] fb1: guddrmfb frame buffer device
> [  101.213426] usbcore: registered new interface driver gud
> [  101.989431] ================================================================================
> [  101.989441] UBSAN: invalid-load in /home/pi/linux/include/linux/iosys-map.h:253:9
> [  101.989447] load of value 121 is not a valid value for type '_Bool'
> [  101.989451] CPU: 1 PID: 455 Comm: kworker/1:6 Not tainted 5.18.0-rc5-gud-5.18-rc5 #3
> [  101.989456] Hardware name: Hewlett-Packard HP EliteBook 820 G1/1991, BIOS L71 Ver. 01.44 04/12/2018
> [  101.989459] Workqueue: events_long gud_flush_work [gud]
> [  101.989471] Call Trace:
> [  101.989474]  <TASK>
> [  101.989479]  dump_stack_lvl+0x49/0x5f
> [  101.989488]  dump_stack+0x10/0x12
> [  101.989493]  ubsan_epilogue+0x9/0x3b
> [  101.989498]  __ubsan_handle_load_invalid_value.cold+0x44/0x49
> [  101.989504]  dma_buf_vmap.cold+0x38/0x3d
> [  101.989511]  ? find_busiest_group+0x48/0x300
> [  101.989520]  drm_gem_shmem_vmap+0x76/0x1b0 [drm_shmem_helper]
> [  101.989528]  drm_gem_shmem_object_vmap+0x9/0xb [drm_shmem_helper]
> [  101.989535]  drm_gem_vmap+0x26/0x60 [drm]
> [  101.989594]  drm_gem_fb_vmap+0x47/0x150 [drm_kms_helper]
> [  101.989630]  gud_prep_flush+0xc1/0x710 [gud]
> [  101.989639]  ? _raw_spin_lock+0x17/0x40
> [  101.989648]  gud_flush_work+0x1e0/0x430 [gud]
> [  101.989653]  ? __switch_to+0x11d/0x470
> [  101.989664]  process_one_work+0x21f/0x3f0
> [  101.989673]  worker_thread+0x200/0x3e0
> [  101.989679]  ? rescuer_thread+0x390/0x390
> [  101.989684]  kthread+0xfd/0x130
> [  101.989690]  ? kthread_complete_and_exit+0x20/0x20
> [  101.989696]  ret_from_fork+0x22/0x30
> [  101.989706]  </TASK>
> [  101.989708] ================================================================================
> 
> The source of this warning is in iosys_map_clear() called from
> dma_buf_vmap(). It conditionally sets values based on map->is_iomem. The
> iosys_map variables are allocated uninitialized on the stack leading to
> ->is_iomem having all kinds of values and not only 0/1.
> 
> Fix this by zeroing the iosys_map variables.
> 
> Fixes: 40e1a70b4aed ("drm: Add GUD USB Display driver")
> Cc: <stable@vger.kernel.org> # v5.18+
> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

