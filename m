Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8525944EF73
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 23:37:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4AFD6E0B9;
	Fri, 12 Nov 2021 22:37:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EA386E08E
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 22:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636756656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j8UFd87L7Ab8fMSkAQc3vH/XiCMU7sezVLrwRYH/XDg=;
 b=F++7nwOunfpR39CYjsV0Vqa02X9TQKDb5LUohL3P9RqQCSaiHs3eWf5ZoZ5coapK7wZNJ7
 mmJqEKYhxrHtR3OuhOqq6QXJ0nrzJ7Z+gmFRe50oH2z83L4mp26FNHqm1wi6McgUzrXkjT
 nFTk2UbECzknTXnmVpEbJsDozyvTZC8=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-NcZZrk6XNi6ucHBQhJQcfA-1; Fri, 12 Nov 2021 17:37:33 -0500
X-MC-Unique: NcZZrk6XNi6ucHBQhJQcfA-1
Received: by mail-qk1-f198.google.com with SMTP id
 bq9-20020a05620a468900b004681cdb3483so2409074qkb.23
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 14:37:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=j8UFd87L7Ab8fMSkAQc3vH/XiCMU7sezVLrwRYH/XDg=;
 b=lwe/lVKWuoKb2da8i960vG0VJcQCBA1A7VbEd7ZQrVkAmXS/VJuC9liOgqWDvQqJrV
 b4cqEqMJQb166jBD+xE8JxCDMsW03pZqjNgPN/mlKVQuJY2ulYBjG+iPbcZY28HxUJo7
 jB/Ii40+ozQTInvtx9beyG8D2nhPmisw8oeGZohb1zR0Jmf5o8M9mWtc6jcBnjteDBSA
 IfE+CfZvMEveIu4YJFvxEjhI4ehc2XnaP5eHZTRamfPdRU7NuUv3gui/CxzWFP9nSiag
 6ZRlp9bVyc1NgHT2KjBs9QQbFJl8TPj0PJcRhlP198QYgWMesS3sJ9+vvbumtL1NQ0Lm
 WdVQ==
X-Gm-Message-State: AOAM533AAxhUBhksED93FlvbLM5VU1I1yWxbZXhui7X0YDjXdlTHLdLU
 fOC6bFQeLUF+kyfb6xOUy0E4STWh3kD0nABrsGQhFXFMW84ZGHbU6ndsDmNO6CO8+ZKAR0G/KR2
 KZba62KEoyT7nVph8yesk0JU8aCcE
X-Received: by 2002:a05:622a:307:: with SMTP id
 q7mr20280374qtw.330.1636756653002; 
 Fri, 12 Nov 2021 14:37:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwmv2+s9HsIhOZaWW0wh6WQGFS4c9E6qdrActSt8eoSle+Ac4DscVPTJ81svE0EOruG6rZTrQ==
X-Received: by 2002:a05:622a:307:: with SMTP id
 q7mr20280350qtw.330.1636756652794; 
 Fri, 12 Nov 2021 14:37:32 -0800 (PST)
Received: from [192.168.8.138] (pool-96-230-249-157.bstnma.fios.verizon.net.
 [96.230.249.157])
 by smtp.gmail.com with ESMTPSA id l1sm3377960qkp.65.2021.11.12.14.37.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 14:37:32 -0800 (PST)
Message-ID: <462fc433630bf6f5b059b6f6f5a62374b0ddd410.camel@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: update information for nouveau
From: Lyude Paul <lyude@redhat.com>
To: Karol Herbst <kherbst@redhat.com>, dri-devel@lists.freedesktop.org
Date: Fri, 12 Nov 2021 17:37:31 -0500
In-Reply-To: <20211110133157.553251-1-kherbst@redhat.com>
References: <20211110133157.553251-1-kherbst@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34)
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acked-by: Lyude Paul <lyude@redhat.com>

On Wed, 2021-11-10 at 14:31 +0100, Karol Herbst wrote:
> Some side notes on this. Atm we do want to use gitlab for bug tracking and
> merge requests. But due to the nature of the current linux kernel
> development, we can only do so for nouveau internal changes.
> 
> Everything else still needs to be sent as emails and this is also includes
> changes to UAPI etc.
> 
> Anyway, if somebody wants to submit patches via gitlab, they are free to
> do so and this should just make this more official and documented.
> 
> People listed as maintainers are such that have push access to drm-misc
> (where changes are pushed to after landing in gitlab) and are known
> nouveau developers.
> We did this already for some trivial changes and critical bug fixes
> already, we just weren't thinking about updating the MAINTAINERS file.
> 
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Signed-off-by: Karol Herbst <kherbst@redhat.com>
> ---
>  MAINTAINERS | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8805df335326..270dc9c0a427 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5961,10 +5961,17 @@ F:      drivers/gpu/drm/panel/panel-novatek-
> nt36672a.c
>  
>  DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS
>  M:     Ben Skeggs <bskeggs@redhat.com>
> +M:     Karol Herbst <kherbst@redhat.com>
> +M:     Lyude Paul <lyude@redhat.com>
>  L:     dri-devel@lists.freedesktop.org
>  L:     nouveau@lists.freedesktop.org
>  S:     Supported
> -T:     git git://github.com/skeggsb/linux
> +W:     https://nouveau.freedesktop.org/
> +Q:     https://patchwork.freedesktop.org/project/nouveau/
> +Q:     https://gitlab.freedesktop.org/drm/nouveau/-/merge_requests
> +B:     https://gitlab.freedesktop.org/drm/nouveau/-/issues
> +C:     irc://irc.oftc.net/nouveau
> +T:     git https://gitlab.freedesktop.org/drm/nouveau.git
>  F:     drivers/gpu/drm/nouveau/
>  F:     include/uapi/drm/nouveau_drm.h
>  

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

