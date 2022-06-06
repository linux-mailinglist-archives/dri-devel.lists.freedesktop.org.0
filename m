Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7459853E4D0
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 15:40:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4641911B4DB;
	Mon,  6 Jun 2022 13:40:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87CD311B4DB
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 13:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654522825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8qoXnoqYpBHw1hBc7oMi8KrfARACS0m8xSrOHvWHVRQ=;
 b=UtO+g8ZJN8gyRWuFORByS89SnT3I5ZCPG8o9kLEjUSdK9+Wb9uSZqrImkphWqTHMT7xJzO
 VIY3d4uZcXqEAn4R5UdnWcuMQnQpwoadtL4HXiE+MYv1G6CdK1HaC8QO3roksETVdtzE2m
 vBnlK0xb/13olPaVP9KUqr/+VzxqAco=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-93-7pF1gm77M5WKGG2Kpjj7tw-1; Mon, 06 Jun 2022 09:40:24 -0400
X-MC-Unique: 7pF1gm77M5WKGG2Kpjj7tw-1
Received: by mail-wm1-f69.google.com with SMTP id
 6-20020a05600c024600b0039c4de3576aso1791750wmj.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 06:40:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8qoXnoqYpBHw1hBc7oMi8KrfARACS0m8xSrOHvWHVRQ=;
 b=xsWHzp3QOAdNrTiUfW5OrnDarxM/nbO8j0ME0ggjbEuyGrX2yGDzhSdAHpkpuwh/Sb
 2YhtPKQEysPUsLwAmE7Ot03ggKtVmD63FVlB8OayvDg+SrQfvmMcf5G3xnCPWtqfYwFA
 ZDSXlqteyD+WblfgwCo1BNUOkFhl9Y+qht7jpdkw1S2Eav+cA/fimTUdQkk+I7nmYT3k
 8EybrUWP/qc2BmRJZbEoDxh3tQzpcX+qEnjFkrnz8IJj8OKIcoPKhZoSvZRBIaUH06Ju
 +owQdXtPfIuMxnl0YELJ+7hB00P/cDfBA9Z86kNzNJZ5V6V8aYr+Yr0K0/PFOkBfrvVP
 bEfg==
X-Gm-Message-State: AOAM533IRW2WcKeFe4lzA9y/I+f6wLLKJ0+cx2tXme1ShInhhH4lpFH5
 t9UUM0mJ2a4MXrmAGfjRbuz8JfNt89MXNUiEvOgssm9ssRgM0SpkJbbCfavJ3qpURZNPn7PMiJv
 C8vcvMua6iBwNWkLeBn5bmewVfYq2
X-Received: by 2002:adf:f403:0:b0:218:82e:4c9e with SMTP id
 g3-20020adff403000000b00218082e4c9emr6360626wro.247.1654522822988; 
 Mon, 06 Jun 2022 06:40:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZVdyGqAyzV/vlvckyOLNGFcL34R33cBgwYqi3lWgUaeO7ZYsoldrhJ+J93QvdRXiow3GN5g==
X-Received: by 2002:adf:f403:0:b0:218:82e:4c9e with SMTP id
 g3-20020adff403000000b00218082e4c9emr6360601wro.247.1654522822756; 
 Mon, 06 Jun 2022 06:40:22 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 h6-20020adfa4c6000000b0020fe61acd09sm16056329wrb.12.2022.06.06.06.40.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 06:40:22 -0700 (PDT)
Message-ID: <cbef78d3-c392-37e6-afdd-177806dfb033@redhat.com>
Date: Mon, 6 Jun 2022 15:40:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/1] drm/format-helper: Add KUnit tests for
 drm_fb_xrgb8888_to_rgb332()
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
References: <20220606095516.938934-1-jose.exposito89@gmail.com>
 <20220606095516.938934-2-jose.exposito89@gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220606095516.938934-2-jose.exposito89@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: davidgow@google.com, airlied@linux.ie, dlatypov@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello José,

On 6/6/22 11:55, José Expósito wrote:
> Test the conversion from XRGB8888 to RGB332.
> 
> What is tested?
> 
>  - Different values for the X in XRGB8888 to make sure it is ignored
>  - Different clip values: Single pixel and full and partial buffer
>  - Well known colors: White, black, red, green, blue, magenta, yellow
>    and cyan
>  - Other colors: Randomly picked
>  - Destination pitch
> 
> How to run the tests?
> 
>  $ ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm \
>          --kconfig_add CONFIG_VIRTIO_UML=y \
>          --kconfig_add CONFIG_UML_PCI_OVER_VIRTIO=y
> 
> Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> 
> ---

Thanks for addressing the issues pointed out. Patch looks good to me now.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

By the way, I think you should request an account [0], so that you can push
patches to drm-misc directly. Specially since AFAIU the plan is to add more
KUnit tests in future patch series.

[0]: https://www.freedesktop.org/wiki/AccountRequests/

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

