Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBC062875A
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 18:44:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA6F210E2FF;
	Mon, 14 Nov 2022 17:44:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 230C610E2FF
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 17:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K+jN+xCNFkIqV728HriaxczDqt9wRzrY0pWEwluJbk0=; b=pgGkK8YkmUqOrAFLDbSlo/+5FM
 2fJyOD88rPuYUAV1R0mKZ1qDeLH9zKkEYW//eUGhMfiQB5UiU4dIGTt7AGDWjIwWn5CYznPK4V7bk
 aA6YpbwU9RElMt3XzkqFeEQ5R2ihZFtlCgtEZLHTKAz62yBFdkizIX9YRgfcIq9kF6lvDoMBOpmOv
 IMSt40+5XKCan7gZ/7fcPRNF0EBYNCyEQxmLLwQTFCRXQWNDjJPv7cBv9HS5rrbFOur0MrIuK7aGz
 ZrQxMeSURUMgWf7gJVnXOvcHqdmu0yoo3QnvKDAyixUm9pBaTcsBLHx45tBnUvVCI2P89PfweUvJ0
 qOxtE1DA==;
Received: from [2a01:799:95e:1700:c981:e728:c113:ea41] (port=57955)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1oudVh-00040E-M8; Mon, 14 Nov 2022 18:44:41 +0100
Message-ID: <3e92ce03-9b16-4df7-4d0f-fea4580a97dc@tronnes.org>
Date: Mon, 14 Nov 2022 18:44:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/1] drm/shmem: Dual licence the files as GPL-2 and MIT
To: Robert Swindells <rjs@fdy2.co.uk>, liuzixian4@huawei.com,
 airlied@redhat.com, tzimmermann@suse.de, lucas.demarchi@intel.com,
 kraxel@redhat.com, robh@kernel.org, kuba@kernel.org,
 marcel.ziswiler@toradex.com, sfr@canb.auug.org.au, daniel.vetter@ffwll.ch,
 cai.huoqing@linux.dev, nroberts@igalia.com, m.szyprowski@samsung.com,
 emil.velikov@collabora.com, sam@ravnborg.org, boris.brezillon@collabora.com,
 dan.carpenter@oracle.com, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>
References: <20221112194210.7657-1-rjs@fdy2.co.uk>
 <20221112194210.7657-2-rjs@fdy2.co.uk>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20221112194210.7657-2-rjs@fdy2.co.uk>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 12.11.2022 20.42, skrev Robert Swindells:
> Contributors to these files are:
> 
> Noralf Trønnes <noralf@tronnes.org>

Acked-by: Noralf Trønnes <noralf@tronnes.org>

> Liu Zixian <liuzixian4@huawei.com>
> Dave Airlie <airlied@redhat.com>
> Thomas Zimmermann <tzimmermann@suse.de>
> Lucas De Marchi <lucas.demarchi@intel.com>
> Gerd Hoffmann <kraxel@redhat.com>
> Rob Herring <robh@kernel.org>
> Jakub Kicinski <kuba@kernel.org>
> Marcel Ziswiler <marcel.ziswiler@toradex.com>
> Stephen Rothwell <sfr@canb.auug.org.au>
> Daniel Vetter <daniel.vetter@ffwll.ch>
> Cai Huoqing <cai.huoqing@linux.dev>
> Neil Roberts <nroberts@igalia.com>
> Marek Szyprowski <m.szyprowski@samsung.com>
> Emil Velikov <emil.velikov@collabora.com>
> Sam Ravnborg <sam@ravnborg.org>
> Boris Brezillon <boris.brezillon@collabora.com>
> Dan Carpenter <dan.carpenter@oracle.com>
> 
> Signed-off-by: Robert Swindells <rjs@fdy2.co.uk>
> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 2 +-
>  include/drm/drm_gem_shmem_helper.h     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index 35138f8a375c..f1a68a71f876 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: GPL-2.0
> +// SPDX-License-Identifier: GPL-2.0 or MIT
>  /*
>   * Copyright 2018 Noralf Trønnes
>   */
> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
> index a2201b2488c5..56ac32947d1c 100644
> --- a/include/drm/drm_gem_shmem_helper.h
> +++ b/include/drm/drm_gem_shmem_helper.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: GPL-2.0 or MIT */
>  
>  #ifndef __DRM_GEM_SHMEM_HELPER_H__
>  #define __DRM_GEM_SHMEM_HELPER_H__
