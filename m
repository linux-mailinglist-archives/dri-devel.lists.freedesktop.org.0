Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E870D5154BB
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 21:38:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9958110E131;
	Fri, 29 Apr 2022 19:38:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F4910E131
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 19:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651261114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RRnqrZ5q9hLwmm3bRLQsIsvIf5Pjk0qeqlvtwwtHCyY=;
 b=QTYZPPsHHdFD3VCVOS30FBZ+Ak8J/I64WGfV3BpX3nvBv+UoTrx0LSamVHaTRwB91utYSS
 +C3FL+bOBVN/ohqBcHAcUJBvK+AI7P8+/ULypFVb7bsZ1Lt+txK8gstGAfVp+c3Iq2YDTm
 0W/tRgwwWsusR7vjKNhqS3oG5ugPhIk=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-339-xySoTSpoNTiP0morZsmVIw-1; Fri, 29 Apr 2022 15:38:33 -0400
X-MC-Unique: xySoTSpoNTiP0morZsmVIw-1
Received: by mail-qt1-f200.google.com with SMTP id
 f24-20020a05622a1a1800b002f396578cbbso1593644qtb.18
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 12:38:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=RRnqrZ5q9hLwmm3bRLQsIsvIf5Pjk0qeqlvtwwtHCyY=;
 b=Acc+qcXAH5kJ95aCS5tbRplEANuVrsNpU7goS7Ygz4rZ6uHYQdI/dD5mpFNDEc9uIF
 P7bwV6kAicVOs4tcyfuh53Fwo99oaouTjdsK2wNWeJpk/hh7OP8Q9tAuaBL3NL2bODC+
 tlnKgzWYLtu6aG5NOJnZ6fJB0utmmZUygCsYdSC7CVkr9RiMzAiXbbS2FyEAtV7/XZ+l
 wGwm7uVDhUf/ik2k2xIJYtTnpQO1Cn/9C4btaphQv3e0JavcjnTtGR64hwcTf7f97bbz
 eGH1fGvVnR0/+T3of++Hk9lrnpQmWK/nzyA99n2MPiq2FGM0dD5VZmeks8onLWfaeabu
 j/Rg==
X-Gm-Message-State: AOAM532pfg7grSt0b9ZKnAm6Gg3ASoK4TldBY8lamPQgtkV4fRstIF/n
 DfzzwgWWbqaGD3PrxX4etW4DwlPxdY086LPwoOEHphEUP5tK2IZ9uZaLuo3q3jrMXyqSVATmbOD
 ddMcAYoLl3roIQF6y7KnIgrz1aegm
X-Received: by 2002:a05:620a:4591:b0:69f:6dfe:fd0e with SMTP id
 bp17-20020a05620a459100b0069f6dfefd0emr533995qkb.724.1651261113282; 
 Fri, 29 Apr 2022 12:38:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzvpTuihk+7r9mupR+7j1In7Ensxviuu8Omgt416FUHuMAFpt/XdDBc0YeMc2lCqNb9b70ag==
X-Received: by 2002:a05:620a:4591:b0:69f:6dfe:fd0e with SMTP id
 bp17-20020a05620a459100b0069f6dfefd0emr533983qkb.724.1651261113089; 
 Fri, 29 Apr 2022 12:38:33 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 k16-20020ac84790000000b002f39b99f6c1sm53375qtq.91.2022.04.29.12.38.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 12:38:32 -0700 (PDT)
Message-ID: <baf0a304698c7136c95c3fbb13c90529a51b9e06.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau: simplify the return expression of
 nouveau_debugfs_init()
From: Lyude Paul <lyude@redhat.com>
To: cgel.zte@gmail.com, bskeggs@redhat.com
Date: Fri, 29 Apr 2022 15:38:31 -0400
In-Reply-To: <20220429090309.3853003-1-chi.minghao@zte.com.cn>
References: <20220429090309.3853003-1-chi.minghao@zte.com.cn>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
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
Cc: kherbst@redhat.com, nouveau@lists.freedesktop.org,
 Zeal Robot <zealci@zte.com.cn>, linux-kernel@vger.kernel.org,
 Minghao Chi <chi.minghao@zte.com.cn>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to drm-misc-next in a bit

(Kind of impressed that a bot managed to catch this, considering the route
from here to the code capable of returning < 0 or 0 was definitely not
obvious)

On Fri, 2022-04-29 at 09:03 +0000, cgel.zte@gmail.com wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
> 
> Simplify the return expression.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
> ---
>  drivers/gpu/drm/nouveau/nouveau_debugfs.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> index 1cbe01048b93..76b621f99916 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> @@ -255,19 +255,13 @@ nouveau_drm_debugfs_init(struct drm_minor *minor)
>  int
>  nouveau_debugfs_init(struct nouveau_drm *drm)
>  {
> -       int ret;
> -
>         drm->debugfs = kzalloc(sizeof(*drm->debugfs), GFP_KERNEL);
>         if (!drm->debugfs)
>                 return -ENOMEM;
>  
> -       ret = nvif_object_ctor(&drm->client.device.object, "debugfsCtrl", 0,
> +       return nvif_object_ctor(&drm->client.device.object, "debugfsCtrl",
> 0,
>                                NVIF_CLASS_CONTROL, NULL, 0,
>                                &drm->debugfs->ctrl);
> -       if (ret)
> -               return ret;
> -
> -       return 0;
>  }
>  
>  void

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

