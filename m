Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C48274A0149
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 20:59:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ABD610E2DD;
	Fri, 28 Jan 2022 19:59:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D213D10E25C
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 19:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643399986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H/RNAVREYoMWWmbXyD7JmCQPxXU0h1w7hHfP+VKDHWk=;
 b=NEYVWR3jmEfEYpocz++QJ1myCHqTKU6dnF8fooM6PzDBbKsLRLn1oWmsO5h44F7uEh+1Di
 sqoGWl5ZUOjGOtwm3KiIGevISkOIqm1HIBxTcOtKmSynPXvbFtJcSMrGj+pTkrMrtlImy3
 lrk0sV1uRpElc/pV2g5hflm0rGLoyZE=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-207-oDI8D5s7OsKoQT8En4KCLw-1; Fri, 28 Jan 2022 14:59:45 -0500
X-MC-Unique: oDI8D5s7OsKoQT8En4KCLw-1
Received: by mail-qv1-f69.google.com with SMTP id
 14-20020a05621420ee00b00423846005d4so7034548qvk.15
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 11:59:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=H/RNAVREYoMWWmbXyD7JmCQPxXU0h1w7hHfP+VKDHWk=;
 b=MjKnuw9vZDep5jTb5lLQ6YTAEEReVNxHH90Lwd42aaoEDla0+TFERPmch7TgD0n7nI
 sXpR2wX5dk80MY/vcvrdthmyJ1kHAbNYlsTJhgVmDZUKaURk8tqRIv/9YftQvEPtlpPQ
 SfcHpZAky8gawcS8mQNLLnKAAMNeDgISzoI7EUZITqzi62pQoCyumIoKdDeNw4v9IYfA
 cCb5QfiF3jv736Fo30IvkEhT3scbvtVI9nnLmb/t+XhLV+ECAJPVQud+92ALjr406qIe
 jwDSaEynXWyQyp/Gu35E6PEOTLNZObtr9CprLp9l5h10qK8D7mZbQ/scTB3Mu0zdxW8Y
 hcGg==
X-Gm-Message-State: AOAM532PWSs0WyO1O7rsFVnVnmhRet3tIqNa5sxsgmYoikIiyiHsbISm
 98aXkQwZxhPwFzVpmH/cXTx0T4VA2uFh9A+FxlrZSKnan321Kv4XxsWDiO7BvvpAHUiTOqnXjSt
 Yh1o6RctngoojXQDZcEV+2D7Hlvmv
X-Received: by 2002:a05:620a:1a9e:: with SMTP id
 bl30mr4658854qkb.122.1643399984962; 
 Fri, 28 Jan 2022 11:59:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxMVL7Ee01ALwRBPd6MwzSYTHv1qXAtOUO9d/6kaeBi6vEJvalGNdFdHO2BgIzYtQiTAwBaxQ==
X-Received: by 2002:a05:620a:1a9e:: with SMTP id
 bl30mr4658847qkb.122.1643399984791; 
 Fri, 28 Jan 2022 11:59:44 -0800 (PST)
Received: from [192.168.8.138] (pool-98-118-105-43.bstnma.ftas.verizon.net.
 [98.118.105.43])
 by smtp.gmail.com with ESMTPSA id m4sm3868731qkp.117.2022.01.28.11.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 11:59:44 -0800 (PST)
Message-ID: <8a01bf1d367a702cd41e6cb1281294e82a48f541.camel@redhat.com>
Subject: Re: [PATCH] Revert "drm/nouveau/acr: Fix undefined behavior in
 nvkm_acr_hsfw_load_bl()"
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Fri, 28 Jan 2022 14:59:42 -0500
In-Reply-To: <20220128192951.626532-1-lyude@redhat.com>
References: <20220128192951.626532-1-lyude@redhat.com>
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 Greg KH <gregkh@linuxfoundation.org>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Zhou Qingyang <zhou1615@umn.edu>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

on further reconsideration: Self-NAKing this. I don't see any issues with
those patches.

On Fri, 2022-01-28 at 14:29 -0500, Lyude Paul wrote:
> This reverts commit 2343bcdb4747d4f418a4daf2e898b94f86c24a59.
> 
> Unfortunately, as Greg pointed out I totally missed the fact that this
> patch came from a umn.edu patch. umn.edu is still banned from contributing
> to the Linux kernel, so let's revert this for the time being. I'll
> re-evaluate this fix myself later and send another fix if this ends up
> being valid.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: Greg KH <gregkh@linuxfoundation.org>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Karol Herbst <kherbst@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> index a6ea89a5d51a..667fa016496e 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> @@ -142,12 +142,11 @@ nvkm_acr_hsfw_load_bl(struct nvkm_acr *acr, const char
> *name, int ver,
>  
>         hsfw->imem_size = desc->code_size;
>         hsfw->imem_tag = desc->start_tag;
> -       hsfw->imem = kmemdup(data + desc->code_off, desc->code_size,
> GFP_KERNEL);
> +       hsfw->imem = kmalloc(desc->code_size, GFP_KERNEL);
> +       memcpy(hsfw->imem, data + desc->code_off, desc->code_size);
> +
>         nvkm_firmware_put(fw);
> -       if (!hsfw->imem)
> -               return -ENOMEM;
> -       else
> -               return 0;
> +       return 0;
>  }
>  
>  int

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

