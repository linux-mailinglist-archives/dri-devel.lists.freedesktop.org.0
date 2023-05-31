Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FEA717A1D
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 10:32:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1ABE10E132;
	Wed, 31 May 2023 08:32:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0A3E10E491
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 08:32:00 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f623adec61so57275875e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 01:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685521917; x=1688113917;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=WhA/sfDRnLuDCN7yHv6nCUiMzZVvvoBjYdsSnPZ2b68=;
 b=Qf9zKFrn4Y6OFuEjXy7xAuVGz/ckgeam+xe7JLoo1sZ2JIwV3Zle4eGVrClGw0Suuu
 EuPu5XqzoGtSat0xDB8XzH//945LkSMdRioWZ07l3M+g3sQPSG6k5rbbiURKiTm3B7io
 beFK2eG3qQGuU7oqTYBxDur924FFE9Kd6DwSCXq6CmSdUPSY7ZYVbroOjtE0rOpBialT
 2pRHtuwWKBsxHuAUF0xHP+WoE6Cpl5WLqdOnWc2v6+hVQ1Y3woLNfCrW5f8kxg0qVI9C
 WdnZVK5XxDrJP5HkDypnDQoH7zGtbRZct9zHWKgpsrYdownAuH6HRocfvXIjm7fhRODu
 PeLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685521917; x=1688113917;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WhA/sfDRnLuDCN7yHv6nCUiMzZVvvoBjYdsSnPZ2b68=;
 b=ITntxT41yhIw1QAItPCU2bs9/UFDCjMPYkBjTkaIy5ys2oclgmeIBDEowPDuqUDPo9
 c3/CEYgIuzgVCJlThzCK9RgnqdOugvrjspyanIlXN/IN2RSSz2Jh+6GS0jdywOdA6Jqg
 kNIS7sePE8axZ8OUiKURL8DAP3rRFtw5jAV1+Y6Skfe+OVyCsDKbcjXn/rSaWAHMTs5j
 OGrCL27eTINSmiNbJfCX5wAROnYQfmY32Mm8fAFgS1h6I3UMmwRa/1X4GkEGGLyuQvZb
 2Dk90GNPe4la6cZpfIAYubev20899agzB9tfAghvkjDtxN0ycUpfLn5NbA/gav5gwQ3l
 ayUw==
X-Gm-Message-State: AC+VfDw9YJNYt8LrmHWexkrt1k4Ncg8Z9mbU566q9dD2lAVaR1mEfegW
 u/JfyMq3aAbsS3Bqr2PB23EbYA==
X-Google-Smtp-Source: ACHHUZ4S5/0dJg8BIO5Y3X1Ar+fFJRW029hscEdyzxU/RK6FIShaB3l5woWFqtMhhmxltyEBwA5dOw==
X-Received: by 2002:a1c:f216:0:b0:3f1:7581:eaaf with SMTP id
 s22-20020a1cf216000000b003f17581eaafmr3223629wmc.4.1685521916624; 
 Wed, 31 May 2023 01:31:56 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 q13-20020a7bce8d000000b003f43f82001asm23557270wmj.31.2023.05.31.01.31.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 May 2023 01:31:54 -0700 (PDT)
Date: Wed, 31 May 2023 11:31:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>
Subject: Re: [PATCH] drm/nouveau/nvif: use struct_size()
Message-ID: <00e84595-e2c9-48ea-8737-18da34eaafbf@kili.mountain>
References: <20230531043826.991183-1-suhui@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230531043826.991183-1-suhui@nfschina.com>
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
Cc: Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 31, 2023 at 12:38:26PM +0800, Su Hui wrote:
> Use struct_size() instead of hand writing it.
> This is less verbose and more informative.
> 
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
>  drivers/gpu/drm/nouveau/nvif/object.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvif/object.c b/drivers/gpu/drm/nouveau/nvif/object.c
> index 4d1aaee8fe15..4bd693aa4ee0 100644
> --- a/drivers/gpu/drm/nouveau/nvif/object.c
> +++ b/drivers/gpu/drm/nouveau/nvif/object.c
> @@ -65,7 +65,7 @@ nvif_object_sclass_get(struct nvif_object *object, struct nvif_sclass **psclass)
>  	u32 size;
>  
>  	while (1) {
> -		size = sizeof(*args) + cnt * sizeof(args->sclass.oclass[0]);
> +		size = struct_size(args, sclass.oclass, cnt);

This is from the original code, but now that you are using the
struct_size() macro static checkers will complain about it.  (Maybe they
don't yet?).  size is a u32.  Never save struct_size() returns to
anything except unsigned long or size_t.  (ssize_t is also fine, I
suppose).  Otherwise, you do not benefit from the integer overflow
checking.

>  		if (!(args = kmalloc(size, GFP_KERNEL)))
>  			return -ENOMEM;
>  		args->ioctl.version = 0;

regards,
dan carpenter
