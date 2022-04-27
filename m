Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2EF511C86
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 19:15:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C3C10E497;
	Wed, 27 Apr 2022 17:14:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2119A10E497
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 17:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651079696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9YUznmB9P2jBcOq6DrfzVnG8uJ/Bk7HsqZZR2IcuP88=;
 b=UOpoAK7G9kAiwo+UQTwItEkM5gcIFxL7W/TWO2n4rv2Ntzw2QssMZlD9YOUSUIRuN4tiRq
 npJrCCc6TW51wMjUL9roUDXr6uzI5zHEQ5z4J+OWL67G5XM+T3hYL05VqA+JvCiN4OQEMW
 nax12ziBNigJaJ/g2FIFOyykBt+7/Cw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-263-4z_rADbqMlq6SnKcuTFACA-1; Wed, 27 Apr 2022 13:14:54 -0400
X-MC-Unique: 4z_rADbqMlq6SnKcuTFACA-1
Received: by mail-wm1-f72.google.com with SMTP id
 g9-20020a1c4e09000000b0038f20d94f01so3085879wmh.8
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 10:14:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9YUznmB9P2jBcOq6DrfzVnG8uJ/Bk7HsqZZR2IcuP88=;
 b=mBDwX3JFq/VdPuohrUfr0Fz2IswuWZ7iCWaj4Mbj37dNPHLoKsLl6aRX90x8qkWtse
 5Zlq0603HH6jdkn20NZZoEaUDUriftxXf/vEEqy+adJrE93/DKqRAirK8I0cvSrBogDb
 zpHEcsLNKZF4cfbPCX1BSbuhMuGXAbif44wOYpsO3hAz8k4Cgj7OGAaGP56bpzf37arN
 Kb02Zt58RO7bn/syepm5cvK/4aZnNQV2nswZRTSf8sUGgdUWlnLp4oXKZ8Al3bJfBZx0
 fyeqUt8ekmY3gAjhE9NsO6pDfjXyFt4TocLjfH0MoqHD9tojscmo+mpLiO8CV6TatD+k
 Axag==
X-Gm-Message-State: AOAM532u29ccgzJKgd79n9kyHg/jkLt0S3uaZ0i1MNhPx1GrbfPsESQI
 XFo0oAjm/vZoXH1/IvNHllbKteeySQq5lVz8Tz7UO7MYx3zGFCv8P8EF0rX2gEaMPpJSN96Qbfn
 rNZQ7To6om8uRCXp4kGImoS7W82BL
X-Received: by 2002:a5d:5311:0:b0:20a:d007:b499 with SMTP id
 e17-20020a5d5311000000b0020ad007b499mr18651215wrv.258.1651079693300; 
 Wed, 27 Apr 2022 10:14:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9gmILqTdRAEv5fADePBJ//BGbzfu/YlqdgybewixXeP/an9YLV/CAg7PFZJIOJmkGoxatPQ==
X-Received: by 2002:a5d:5311:0:b0:20a:d007:b499 with SMTP id
 e17-20020a5d5311000000b0020ad007b499mr18651198wrv.258.1651079693033; 
 Wed, 27 Apr 2022 10:14:53 -0700 (PDT)
Received: from [192.168.1.129] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 v11-20020a056000144b00b0020a9c02f60dsm15149131wrx.50.2022.04.27.10.14.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 10:14:52 -0700 (PDT)
Message-ID: <1885e110-6353-45bb-1120-c6fa4c50f63a@redhat.com>
Date: Wed, 27 Apr 2022 19:14:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3] drm/doc: Add sections about tiny drivers and external
 refs to intro page
To: linux-kernel@vger.kernel.org,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
References: <20220420072411.15104-1-javierm@redhat.com>
 <YmlhS3m6se0sqhnn@phenom.ffwll.local>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YmlhS3m6se0sqhnn@phenom.ffwll.local>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Daniel,

On 4/27/22 17:29, Daniel Vetter wrote:
> On Wed, Apr 20, 2022 at 09:24:11AM +0200, Javier Martinez Canillas wrote:
>> Learning about the DRM subsystem could be quite overwhelming for newcomers
>> but there are lots of useful talks, slides and articles available that can
>> help to understand the needed concepts and ease the learning curve.
>>
>> There are also simple DRM drivers that can be used as example about how a
>> DRM driver should look like.
>>
>> Add sections to the introduction page, that contains references to these.
>>
>> Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>> Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
>> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> Maybe needs more acks to land?
> 
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>

Thanks! But this landed already a few days ago in drm-misc-next:

https://cgit.freedesktop.org/drm/drm-misc/commit/?id=e41a2999f746
 
> Would be good we can hand out links to pretty htmldocs instead of lore
> links to this patch, the latter is rather hard on the eyes :-)
>

Agreed :)
 -- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

