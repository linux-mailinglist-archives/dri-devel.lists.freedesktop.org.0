Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE366510562
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 19:26:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD49F10E95C;
	Tue, 26 Apr 2022 17:26:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22BEA10E95C
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 17:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650993996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lIDKi1Fbqi03mYjNDUZNSZko/5hz16GhkjeizzJX6xo=;
 b=cS6xZAnJL7rnrxwoDa99MBrF5q4yHRrD0S4h2Sj8tAzjKzPAeG3fnK7yNEJhbbQ/3sXGkx
 7EdU2w55OOA83EAGZ1t0lW2opxYonI790YZqusW2XDhawE9x62foi0KZZVkpcePwoYFnIr
 lC3rYf7L30knxILvOjcGTPkZiQ9zxWA=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-259-q0q4SJpVNuSABkR_Isf0kQ-1; Tue, 26 Apr 2022 13:26:27 -0400
X-MC-Unique: q0q4SJpVNuSABkR_Isf0kQ-1
Received: by mail-vk1-f199.google.com with SMTP id
 bk12-20020a0561220e0c00b0033ed0b2c1d8so1899985vkb.23
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 10:26:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=lIDKi1Fbqi03mYjNDUZNSZko/5hz16GhkjeizzJX6xo=;
 b=74siyA+7/lynDwRsJdmKwnPjQNJYqVG1sBt4kFkzAjDc0/HqwnvU7lnNpnbVaK/aKL
 pzsy+klc35c+wD3U/peuE69jhN6YdrXDh9PCGN2XrLIjJoEzm6aY6KsW0KFE8Y7yKakB
 hMFsiOGM1hKpffNx/tSTHg5iYK0qyWjnWX87b9lRMCMhXvVpUvGFLitJEJfOOSP9BxkI
 2IMWGxACvEFovv5+AG4odaskCqtFxtv7bB9VRxrjgoBT0LufbAQ7IJYU4WXFTn+t5NKP
 hqmG5FNTWOSd+UHsG9wn3Ke99FPEAlhEi19im/wTJXXP0I1NbTTWWNqZ42P0+3nZmYYp
 TpDQ==
X-Gm-Message-State: AOAM533hTnRjYR7OXAJrtha+SPAEs8DR/DMKx3Jee6RFiUTdvRJsssrJ
 gXtdhXYfZiGx3kR1UNWcNF/a+XAAE7fx5V8bPjaQe82VFCmyXWWcLvG3KfCZkT/1ETZUGXdgV2U
 rPwF8d4L7RYyErrd1bUU8OwuVALr9
X-Received: by 2002:a67:e9d1:0:b0:32c:eb44:efd6 with SMTP id
 q17-20020a67e9d1000000b0032ceb44efd6mr911050vso.16.1650993986820; 
 Tue, 26 Apr 2022 10:26:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpFGyTlNOnTHUlqHT3HOBW9kR28MQd1k1z2LvC85IOws5IevLAC/JD+KnrsGzp3VspUMHE+w==
X-Received: by 2002:a67:e9d1:0:b0:32c:eb44:efd6 with SMTP id
 q17-20020a67e9d1000000b0032ceb44efd6mr911031vso.16.1650993986543; 
 Tue, 26 Apr 2022 10:26:26 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 b206-20020a1f34d7000000b003452c5cc13csm1672864vka.41.2022.04.26.10.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 10:26:25 -0700 (PDT)
Message-ID: <a46595078332c8e0ad801f3f8eb03ca9c11db8dc.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/kms/gv100: use static for
 gv100_disp_core_mthd_[base|sor]
From: Lyude Paul <lyude@redhat.com>
To: Tom Rix <trix@redhat.com>, bskeggs@redhat.com, kherbst@redhat.com, 
 airlied@linux.ie, daniel@ffwll.ch
Date: Tue, 26 Apr 2022 13:26:24 -0400
In-Reply-To: <20220422185132.3163248-1-trix@redhat.com>
References: <20220422185132.3163248-1-trix@redhat.com>
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

Will push to the appropriate branch in a bit

On Fri, 2022-04-22 at 14:51 -0400, Tom Rix wrote:
> Sparse reports these issues
> coregv100.c:27:1: warning: symbol 'gv100_disp_core_mthd_base' was not
> declared. Should it be static?
> coregv100.c:43:1: warning: symbol 'gv100_disp_core_mthd_sor' was not
> declared. Should it be static?
> 
> These variables are only used in coregv100.c.  Single file use
> variables should be static, so add static to their storage-class specifier.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/disp/coregv100.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/coregv100.c
> b/drivers/gpu/drm/nouveau/nvkm/engine/disp/coregv100.c
> index 448a515057c7..1d333c484a49 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/coregv100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/coregv100.c
> @@ -23,7 +23,7 @@
>  
>  #include <subdev/timer.h>
>  
> -const struct nv50_disp_mthd_list
> +static const struct nv50_disp_mthd_list
>  gv100_disp_core_mthd_base = {
>         .mthd = 0x0000,
>         .addr = 0x000000,
> @@ -39,7 +39,7 @@ gv100_disp_core_mthd_base = {
>         }
>  };
>  
> -const struct nv50_disp_mthd_list
> +static const struct nv50_disp_mthd_list
>  gv100_disp_core_mthd_sor = {
>         .mthd = 0x0020,
>         .addr = 0x000020,

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

