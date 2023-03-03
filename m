Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AB46A9973
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 15:33:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B043710E618;
	Fri,  3 Mar 2023 14:33:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A18E110E618
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Mar 2023 14:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677854029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F1Sn0/mypHkU6ly+1mTIVNlEYcj+rMktwAvyJJ3xDBs=;
 b=HRu6G5M29aEOcnaNsrpvsuefVo7lobILY1sj8mpCy7gzZx/Q07VIXszTdj5D1vq93+Rqtr
 LeDNyY1BfzOYgYEZe7EJryplrpEGl/bVkyL7CwwoaNWRQzVKWzFLTlf0+zZNuA5Letv3/4
 FwIMAbwmT0r7B5Lymu0tN9/KXuG5ZXY=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-79-EDtfqYI7PFqhZrgm_7HCDw-1; Fri, 03 Mar 2023 09:33:46 -0500
X-MC-Unique: EDtfqYI7PFqhZrgm_7HCDw-1
Received: by mail-lj1-f197.google.com with SMTP id
 z12-20020a05651c11cc00b002935008af2aso671156ljo.19
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Mar 2023 06:33:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677854024;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F1Sn0/mypHkU6ly+1mTIVNlEYcj+rMktwAvyJJ3xDBs=;
 b=Z+JrUtxmaDrX8dgkv6fNB4thj3TW7DgaDAc8Pkpnz9zH+VuTT/VnubxLqKj63CceKw
 QteoXBRMGXYNHqxjMmgs2chMWCdK/nfViWOGh/4erGavQRQ8H02HEPF22slzfTVWFNEd
 RuoomAFQEfLqgG0h0BtzY8VnBxejnHi+KKnfSWXb23+pYg8WwlMi0GRoCG/zlPluVs2K
 e7sb9cDbKoiyIvmKU3L6lqWEAI29JQFO/z7eJrKn/wYfy5tjG/3QBr6x2laMo7+dx2bJ
 G1NaU4wwSCVNdLLTxbdNlk5crmqvFD65HvI8xlmHwyL9V3GcAmbfUq6jieKTR1R8yjgb
 7bCw==
X-Gm-Message-State: AO0yUKW/oivrG8ONDnsUMdrEvyfK8ErYD5KOY2LiYe8XNzgLgC5x5V81
 ehYkB7mUH+95+iOg2T362j8RswF7VQouS/5FlmT31bVqly/AXq+1EzfdZa49SpswuAIDh4pj212
 WSxV4MVErKOyGUIgNpvoCmqsgXZZD5VpSS15dmG49DMdFFzW+4rsO
X-Received: by 2002:a2e:a269:0:b0:295:ab47:119b with SMTP id
 k9-20020a2ea269000000b00295ab47119bmr617036ljm.8.1677854024021; 
 Fri, 03 Mar 2023 06:33:44 -0800 (PST)
X-Google-Smtp-Source: AK7set8dskGiDMeG1f4EFzCLSCJINA3Rk6cJqgMITbg2NCrdgTqKLg2n24Jl1IpBJ42JYGk53ZIokiHYAl2dT1gNbFI=
X-Received: by 2002:a2e:a269:0:b0:295:ab47:119b with SMTP id
 k9-20020a2ea269000000b00295ab47119bmr617027ljm.8.1677854023781; Fri, 03 Mar
 2023 06:33:43 -0800 (PST)
MIME-Version: 1.0
References: <20230228221533.3240520-1-trix@redhat.com>
In-Reply-To: <20230228221533.3240520-1-trix@redhat.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 3 Mar 2023 15:33:31 +0100
Message-ID: <CACO55tvJH=VmTf+Wv4Lf56eEPp3vO1Aoa6Sb1=UYnRzFkVardg@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/fifo: set nvkm_engn_cgrp_get
 storage-class-specifier to static
To: Tom Rix <trix@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
 dri-devel@lists.freedesktop.org, bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

will push in a moment

On Tue, Feb 28, 2023 at 11:15 PM Tom Rix <trix@redhat.com> wrote:
>
> smatch reports
> drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c:33:18:
>   warning: symbol 'nvkm_engn_cgrp_get' was not declared. Should it be static?
>
> nvkm_engn_cgrp_get is only used in runl.c, so it should be static
>
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c
> index b5836cbc29aa..93d628d7d508 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c
> @@ -30,7 +30,7 @@
>  #include <subdev/timer.h>
>  #include <subdev/top.h>
>
> -struct nvkm_cgrp *
> +static struct nvkm_cgrp *
>  nvkm_engn_cgrp_get(struct nvkm_engn *engn, unsigned long *pirqflags)
>  {
>         struct nvkm_cgrp *cgrp = NULL;
> --
> 2.27.0
>

