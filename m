Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC79577716
	for <lists+dri-devel@lfdr.de>; Sun, 17 Jul 2022 17:31:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B0A310FF4B;
	Sun, 17 Jul 2022 15:31:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D7AD11251C
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jul 2022 15:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658071887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HE8rpkKV44wOCqo6nJ13W0jNE/SFjHnzbDTrmKw0k24=;
 b=hScDOFuNDM0pCQMgwK8D07jCnq3GLx/glYKP5moebAwHffS9foWNd8y1cShJynZA1schja
 KKVmUuMkO43HeYdQCGVNsoC9sBhBcYWjSP+0MM5vnsmjhscv67jnWVERmnCthQYzayiCRH
 AMnakTrxKtZ1Vh9nte5mUD1yACievSA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-404-MdpZAH_iPOyTl_zTKOND3w-1; Sun, 17 Jul 2022 11:31:25 -0400
X-MC-Unique: MdpZAH_iPOyTl_zTKOND3w-1
Received: by mail-wr1-f71.google.com with SMTP id
 i9-20020adfa509000000b0021d865ce5e3so1554025wrb.6
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jul 2022 08:31:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HE8rpkKV44wOCqo6nJ13W0jNE/SFjHnzbDTrmKw0k24=;
 b=WySAdJSOQ09AXjLYRUFt83GSDNSqCYF/+TSHutYvci0wbrcOkfqMGrR9NPZ1nJOAZv
 AQfK5WvuYtLSg+fr7KQVEfZ8TDJ3icYVJozZaUef5qAmSxLKhqa/4zCdgvc39IhCi1+V
 CdeIyU59sx8jNCwFMt2jTgHhRAR2p0toJvc/+5wHkjkGclDjabRQkS+UZiY4MHIiln+Q
 24ImqqBCP8xBefxl+adjlNAWMAdf6BJQrSJ/Hww4v8ee99b5TAGkU1i1OXZZsnL/PlW1
 eS+buSpO1I0CSPU8qRpxRHzwstq3mTZ/TGUx3NF0q1hbpSYTnLnRZbpqfkQ+W+L9P+ol
 50RQ==
X-Gm-Message-State: AJIora+AepSAeLc6qrN6XcOdsBJgiaLKgDMQ2KekGAl9y/A3Rz5BvyvN
 JvdQTZl2glJgJlwSOwuGiFpJsM53DaRDU1dxC30wKY3nO1pL725WH/lwLEHYvo2elSq+0rW8tqu
 gIztWVMKt6nCWJztM2BlBvWcFDsGH
X-Received: by 2002:adf:f646:0:b0:21d:7000:95b1 with SMTP id
 x6-20020adff646000000b0021d700095b1mr20021227wrp.486.1658071884038; 
 Sun, 17 Jul 2022 08:31:24 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uItns/iG4hscAJoC/jVpMrMmfc+qIo7hc2PiqlQju71fntje06JaBBlNZlNxN8m3hXCGyaVA==
X-Received: by 2002:adf:f646:0:b0:21d:7000:95b1 with SMTP id
 x6-20020adff646000000b0021d700095b1mr20021213wrp.486.1658071883763; 
 Sun, 17 Jul 2022 08:31:23 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 t19-20020a0560001a5300b0021d4aca9d1esm9821628wry.99.2022.07.17.08.31.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Jul 2022 08:31:23 -0700 (PDT)
Message-ID: <37877a00-3a25-4cd8-49b6-804ef66f472c@redhat.com>
Date: Sun, 17 Jul 2022 17:31:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 09/11] drm/savage: Move the savage driver to drm/dri1/
To: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
References: <20220716181750.3874838-1-sam@ravnborg.org>
 <20220716181750.3874838-10-sam@ravnborg.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220716181750.3874838-10-sam@ravnborg.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/16/22 20:17, Sam Ravnborg wrote:
> drm/dri1 is the new home for all the legacy DRI1 drivers.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

I wonder if we should just squash patches 03/11 to 09/11 into a
single patch. Although I guess having them in separate patches
makes it easier to get the acks from the drivers' maintainers.

[...]

> index 73c0aa1c7b94..f639d5e0ae2e 100644
> --- a/drivers/gpu/drm/dri1/Makefile
> +++ b/drivers/gpu/drm/dri1/Makefile
> @@ -5,6 +5,7 @@
>  obj-$(CONFIG_DRM_I810)		+= i810/
>  obj-$(CONFIG_DRM_MGA)		+= mga/
>  obj-$(CONFIG_DRM_R128)		+= r128/
> +obj-$(CONFIG_DRM_SAVAGE)	+= savage/
>  obj-$(CONFIG_DRM_SIS)		+= sis/
>  obj-$(CONFIG_DRM_TDFX)		+= tdfx/
>  obj-$(CONFIG_DRM_VIA)		+= via/

Maybe we should call these CONFIG_DRM_DRI1_FOO to make more clear
in kernel configs whether DRM or DRI1 drivers are being enabled?

After all, the menuconfig now is called DRM_DRI1 and the drivers
enabled when CONFIG_DRM_DRI1 is set.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

