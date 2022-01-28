Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 977D14A00C1
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 20:17:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CB4B10E253;
	Fri, 28 Jan 2022 19:17:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA0DB10E201
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 19:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643397434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eO1UXFuFc6XDm59y7eIl2dtM6a/z0pBy0qGOEAiugBI=;
 b=c8iWQcuZvRTLEwe5kXcTTna0eo+znPw+8ex8obIRugEgFvsdAlWmHf/ePulVbWZFvvc0+6
 tuN3AjXQEgVu4bjPPIiZTOWQhYyJkVmqM5L0cQARR+JBYpAQgF2ZfJUxxPsDSaZQxLOSkg
 bc0F09HwyoxIpiG7L0lxTG8N4EwJSPw=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-488-RAL2_kSDPIeVy9AildlPEg-1; Fri, 28 Jan 2022 14:17:13 -0500
X-MC-Unique: RAL2_kSDPIeVy9AildlPEg-1
Received: by mail-qk1-f198.google.com with SMTP id
 j66-20020a375545000000b004e0e071f37eso3005895qkb.23
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 11:17:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=eO1UXFuFc6XDm59y7eIl2dtM6a/z0pBy0qGOEAiugBI=;
 b=KDsy8OSA4bvsbLhukAPzhy4+C9/gJfzlKaq6DrqnxCrgMMNaC9VPXng7BZ2OaE+jS+
 kFjZQEccYl+TPDWvMukvOtmrzpRKGZuLYvEHIm6pS4ojcy60/KVJu/BH8/VlKe+URzym
 syLkJzuIsA0uqvhEdP8NlCWHjFLN1reGWB6z20n5De8jFklp3Y6qHNEFGlMgKWxrLUHs
 dGp43TzLt4TSrir4eA7oyo5yQQXgNqWtz9ccMDPfxSGmKysAOMiPnHMFfoIWVs76Lpon
 1Kh94ZaM5PAtvJZWcDnb5x3EweNzgUeFd66qBzFET8OzJdDQfu0FsOSmqgm8wrMZ3unQ
 IytA==
X-Gm-Message-State: AOAM532uLhHz7zcVexib6BrW/2m7Ie6q+U5P6C2aXPhUW3ieWx0G82Jz
 wOLax+oNbvefgRl9HiWdAockjtzE9fSHiq5P/hzzHTkniLccqxqw5WwVSVJQnJCtr3j2ZhoCnjV
 6dwMrgGd/tU2tuPZ9xT6yGd+lhk+2
X-Received: by 2002:a05:622a:ca:: with SMTP id
 p10mr2002419qtw.123.1643397432669; 
 Fri, 28 Jan 2022 11:17:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwYaAdUDE5W566fq77+INMNx47zILwdtqN04KYzsDT/UoGpKgB0OvZw6qO3zCtXnbY/NcpCYg==
X-Received: by 2002:a05:622a:ca:: with SMTP id
 p10mr2002408qtw.123.1643397432443; 
 Fri, 28 Jan 2022 11:17:12 -0800 (PST)
Received: from [192.168.8.138] (pool-98-118-105-43.bstnma.ftas.verizon.net.
 [98.118.105.43])
 by smtp.gmail.com with ESMTPSA id u17sm3548025qkj.44.2022.01.28.11.17.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 11:17:11 -0800 (PST)
Message-ID: <67747024d7b3e1904d639e5877a580a0af32d855.camel@redhat.com>
Subject: Re: [PATCH 09/14] drm/nouveau: Replace dma-buf-map with iosys-map
From: Lyude Paul <lyude@redhat.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 linux-kernel@vger.kernel.org,  dri-devel@lists.freedesktop.org
Date: Fri, 28 Jan 2022 14:17:09 -0500
In-Reply-To: <20220128083626.3012259-10-lucas.demarchi@intel.com>
References: <20220128083626.3012259-1-lucas.demarchi@intel.com>
 <20220128083626.3012259-10-lucas.demarchi@intel.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.2 (3.42.2-1.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: airlied@linux.ie, daniel.vetter@ffwll.ch, christian.koenig@amd.com,
 srinivas.kandagatla@linaro.org, tzimmermann@suse.de,
 gregkh@linuxfoundation.org, nouveau@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For this patch:

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Fri, 2022-01-28 at 00:36 -0800, Lucas De Marchi wrote:
> iosys-map is the new name for dma-buf-map and will gain new
> capabitilities. Replace with the new API in nouveau.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_gem.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c
> b/drivers/gpu/drm/nouveau/nouveau_gem.c
> index 9416bee92141..ad0527bdaadf 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> @@ -24,6 +24,8 @@
>   *
>   */
>  
> +#include <linux/iosys-map.h>
> +
>  #include <drm/drm_gem_ttm_helper.h>
>  
>  #include "nouveau_drv.h"

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

