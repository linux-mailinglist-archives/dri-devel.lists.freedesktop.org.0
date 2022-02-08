Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5524AE27D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 21:09:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 741F410E15D;
	Tue,  8 Feb 2022 20:09:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D969110E15D
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 20:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644350965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I3/8UwtTiLaHjDIsw5ToTGGU9VaJhcJtecxqfQCO+Kg=;
 b=g8nU53UAHC5QB2KVi18fdbaLfZ1t3lAi8wL+tHFlqMS85UQ2WGf7a7ZAgg10mnjFyzQizT
 e3sB5mSH8Gpopj1rhl6qtTXjOLgtOYrX1Stjdpe3LK/ZwkV+aeQOhvvMl8/kSTmr8DSC+i
 9nRqJbNY0SIjClW3/6j5uGUbr+2xhCs=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-99-Il41676ONt2p3xsjbgWr-A-1; Tue, 08 Feb 2022 15:09:17 -0500
X-MC-Unique: Il41676ONt2p3xsjbgWr-A-1
Received: by mail-qk1-f197.google.com with SMTP id
 bl5-20020a05620a1a8500b005088d061be4so6250527qkb.21
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 12:09:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=I3/8UwtTiLaHjDIsw5ToTGGU9VaJhcJtecxqfQCO+Kg=;
 b=kO1uomKDoZKq5+0l7j+J2fpGosWySqzVpPYinEssGP2BsNg1qkzoQznq1JOt60gdkI
 dxgCqkS5DA1uX/gHM9KBHFTMF7gZW0TYB1DQG3RTlfe4OJoWVKD+yZtf7V63MNIupq4X
 GmWFJSj74caVYEw+Ns2gJTmOBaqBwicDVqzAy3HLd9A3kOf6lEj8xNiuoDUtp74+RxoC
 bTnZatu3Cdmb81mCn+W7QZRGGBqRF59h+ErV2QtB3jJVkHNATuOjkm8vBJaclwFA5NEb
 NEh6hxadn/r33IDnUYTVFRrGXzYokSbZiJvNqY5h1FPycf8PhTHwp3TIG6BF7221dQsR
 Vtxg==
X-Gm-Message-State: AOAM531y4LEvdt8L99VZF4WFe6bVoTPUjBSY/qJs7J5f9TEhCYGbANsu
 WT1WC8m9hgVnaVLB5BZTSY0PG5S15/4yNH+TSOeXzwZz8evHkU8usrVybzWZA90hHXG7RXVD5Hi
 R8uqbx3x/eS6cgnt+4XCYwElxGZfr
X-Received: by 2002:a05:6214:4111:: with SMTP id
 kc17mr4417590qvb.61.1644350957410; 
 Tue, 08 Feb 2022 12:09:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxsREE/wlVXhB/X8tBjZ+cErEBHMvIYU1EUljfRg7HUFF85vJYIMBgalTBx0/F2MZWG8LFj8g==
X-Received: by 2002:a05:6214:4111:: with SMTP id
 kc17mr4417571qvb.61.1644350957203; 
 Tue, 08 Feb 2022 12:09:17 -0800 (PST)
Received: from [192.168.8.138] (pool-96-230-100-15.bstnma.fios.verizon.net.
 [96.230.100.15])
 by smtp.gmail.com with ESMTPSA id p70sm7253061qka.62.2022.02.08.12.09.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 12:09:16 -0800 (PST)
Message-ID: <58cc03e21bdf8665f402c7eb9beed557f19a4be2.camel@redhat.com>
Subject: Re: [PATCH][next] nouveau/svm: Use struct_size() helper in
 nouveau_pfns_map()
From: Lyude Paul <lyude@redhat.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>, Ben Skeggs
 <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 08 Feb 2022 15:09:04 -0500
In-Reply-To: <20220207233923.GA524723@embeddedor>
References: <20220207233923.GA524723@embeddedor>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35)
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push this to drm-misc-next, thanks!

On Mon, 2022-02-07 at 17:39 -0600, Gustavo A. R. Silva wrote:
> Make use of the struct_size() helper instead of an open-coded version,
> in order to avoid any potential type mistakes or integer overflows that,
> in the worse scenario, could lead to heap overflows.
> 
> Link: https://github.com/KSPP/linux/issues/160
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_svm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c
> b/drivers/gpu/drm/nouveau/nouveau_svm.c
> index 266809e511e2..46a5a1016e37 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_svm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
> @@ -925,8 +925,8 @@ nouveau_pfns_map(struct nouveau_svmm *svmm, struct
> mm_struct *mm,
>  
>         mutex_lock(&svmm->mutex);
>  
> -       ret = nvif_object_ioctl(&svmm->vmm->vmm.object, args, sizeof(*args)
> +
> -                               npages * sizeof(args->p.phys[0]), NULL);
> +       ret = nvif_object_ioctl(&svmm->vmm->vmm.object, args,
> +                               struct_size(args, p.phys, npages), NULL);
>  
>         mutex_unlock(&svmm->mutex);
>  }

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

