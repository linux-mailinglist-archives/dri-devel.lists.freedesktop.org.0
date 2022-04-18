Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9392C505E18
	for <lists+dri-devel@lfdr.de>; Mon, 18 Apr 2022 20:53:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C99B10E13A;
	Mon, 18 Apr 2022 18:53:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8E3810E12A
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Apr 2022 18:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650308004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3QL6AB1e58fXCCgMn67tELqsCerYiMJO8eo3KuBC5io=;
 b=dhIA3gFRYF/R0rcNn551iJLOYMoxCGBUzUSUF2w+bcLwZYi/H8v5EsVKVd9uN5w257s3C3
 G92O6dvcPOwvK3Fnz318jI4os8BIr4FCkocI61WXAh6p5Duvd86KzGLmPTIWv7BpR/2/PR
 +ugtGycvddW9z+aCOdFGLLLNp+4ZSFU=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-IvSG2CDvMxuqfacigxIxDw-1; Mon, 18 Apr 2022 14:53:21 -0400
X-MC-Unique: IvSG2CDvMxuqfacigxIxDw-1
Received: by mail-qt1-f199.google.com with SMTP id
 bt12-20020ac8690c000000b002ee65af14d0so9002638qtb.22
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Apr 2022 11:53:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=3QL6AB1e58fXCCgMn67tELqsCerYiMJO8eo3KuBC5io=;
 b=PQK5BT7XFXeeX+YKxibpCYJ9erCwblO5scnGllgDGHXxMleTAfUDT+qiG50lw4hw0S
 nWwQ+dkRktqSMIOLPwHCVjFKHpGys8BAJREGIloRiivmrkVdlOUrKxO0QXnEt62YZDrD
 fHAAOhLdTRXrXObxoB2nWu3hujHokzuV94vjQEOJwGJiPF2IbX6aadtw3PIv8mb6VSA9
 9Xb5+Yx3sB6MRilaIeyZLNhVq3c2BsitJ77MJR+gRObaMRUASq06gFkS1Usw5bUk51wP
 INMJklCNCoo2IdJSU/8Y1Mb8f7uTZsU2bS7h60SkEoOrhYdb2vW0hqfxbNkSGBYS7DwK
 979Q==
X-Gm-Message-State: AOAM531J5zBnTNtySQ4biUucA1SfBY1E3sRy8rhMTGMSo/+xAq0BnEhc
 bBqFnQHOhbxbOFKgEGDMLYuE4Rw1zv5dyptoy0FE/pjEIcv3TKXKBRGh+PSNRMGsfRuddzlT6sK
 Mw0Dqg4qVm8qy6XWG9TyociCFzHUz
X-Received: by 2002:a05:622a:13c7:b0:2f2:4bf:b4ee with SMTP id
 p7-20020a05622a13c700b002f204bfb4eemr2382466qtk.676.1650308001221; 
 Mon, 18 Apr 2022 11:53:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxiJOMwM2cO+2EIYEAPFwkpbHHBWmZQjSPFW43xk7EoOaFdRaV6zdviqsvk9fEK/Ser1+Qycw==
X-Received: by 2002:a05:622a:13c7:b0:2f2:4bf:b4ee with SMTP id
 p7-20020a05622a13c700b002f204bfb4eemr2382456qtk.676.1650308001019; 
 Mon, 18 Apr 2022 11:53:21 -0700 (PDT)
Received: from [192.168.8.138] (pool-71-126-244-162.bstnma.fios.verizon.net.
 [71.126.244.162]) by smtp.gmail.com with ESMTPSA id
 s12-20020a05622a018c00b002f2017d5652sm1819917qtw.40.2022.04.18.11.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 11:53:20 -0700 (PDT)
Message-ID: <f5700e71bfee343dc2837d3348cada66406ce9fa.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/gr/gf100-: change gf108_gr_fwif from global
 to static
From: Lyude Paul <lyude@redhat.com>
To: Tom Rix <trix@redhat.com>, bskeggs@redhat.com, kherbst@redhat.com, 
 airlied@linux.ie, daniel@ffwll.ch
Date: Mon, 18 Apr 2022 14:53:19 -0400
In-Reply-To: <20220418152810.3280502-1-trix@redhat.com>
References: <20220418152810.3280502-1-trix@redhat.com>
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to the appropriate branch in a moment

On Mon, 2022-04-18 at 11:28 -0400, Tom Rix wrote:
> Smatch reports this issue
> gf108.c:147:1: warning: symbol 'gf108_gr_fwif'
>   was not declared. Should it be static?
> 
> gf108_gr_fwif is only used in gf108.c.  Single
> file variables should not be global so change
> gf108_gr_fwif's storage-class specifier to static.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/gf108.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf108.c
> b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf108.c
> index 030640bb3dca..ab3760e804b8 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf108.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf108.c
> @@ -143,7 +143,7 @@ gf108_gr = {
>         }
>  };
>  
> -const struct gf100_gr_fwif
> +static const struct gf100_gr_fwif
>  gf108_gr_fwif[] = {
>         { -1, gf100_gr_load, &gf108_gr },
>         { -1, gf100_gr_nofw, &gf108_gr },

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

