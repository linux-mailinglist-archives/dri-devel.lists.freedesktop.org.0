Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F6E43CA31
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 14:56:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D796E7E5;
	Wed, 27 Oct 2021 12:56:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F12096E7E5
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 12:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635339392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dV1Z80ykRADd512OHhKXIV+1XGUp97f6U0RAWP3BwzU=;
 b=F75ecNe0tnt5axBO7LlKtIkWAhvqWeM6B7IiU54XbD14fMWFvyPK8QQmvkMxfWwK+e/P+B
 m8sg75pq3eXbLvsMtD49AYfc2IltAyJC8uNycsaND98QPktQ7/kYET2PO4DuMjHfDL1F+w
 z61h5HI8JkI90vR2FYkfF9Tk5PhMjhU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-tgHXxZgtOUKEtWkbfuL5Tg-1; Wed, 27 Oct 2021 08:56:31 -0400
X-MC-Unique: tgHXxZgtOUKEtWkbfuL5Tg-1
Received: by mail-wm1-f71.google.com with SMTP id
 a21-20020a1c7f15000000b0032cd93a2bd7so368343wmd.9
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 05:56:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dV1Z80ykRADd512OHhKXIV+1XGUp97f6U0RAWP3BwzU=;
 b=D/WQMnSwM9xym8YJ7EeJKmw69uVAfgrHvoGqTf2EYNQYWiILZpUMk6wJTW2ZRNf/gQ
 ZB3ECscgSqX0qbSbdeHT4F8vpCtr9WptGxch7/XRwL2m9X3rNn1i8GKfRUitgUpm1INO
 a1QUO2b3z9BAuHK4q08irSi6qfD/KV3wrF8EXw/xHWS7xIt9mbwoQmRiHdQmY1RplJDh
 Yh/9Rj/6/esBS9VhectQeIKmMdAzPUS9B7juwf7NJBwDtTnUK+5eJWIo5Obqt4DOgu+r
 QVCupqLn9W7oWEjjogZ5mOY/KSbraoPqUbBCaCTTeY+ITdExjI1uf+enqj9YQW0kKwRl
 LASA==
X-Gm-Message-State: AOAM5311fdU9qWKvNNMYWm9ADbSiZAkxjdhA5FCthTJUGPO2YtsH/eIl
 PnhcJAZX9ArHGybjUjEbPX+AtPomx/vidgFc4pp4pGy9z15QHOtxk9vY6wA0MBnwYChsl95CqQ+
 rZVP/AZe27BYNq+y21QRCtRoag7Kj
X-Received: by 2002:a5d:43c5:: with SMTP id v5mr1219574wrr.11.1635339390576;
 Wed, 27 Oct 2021 05:56:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKaVjORReycoaANOAduGQwiJYFkPr9IAe/CbTP2Q74FGscfijWFU6rg2CScZQ7+TQK5c04xw==
X-Received: by 2002:a5d:43c5:: with SMTP id v5mr1219550wrr.11.1635339390425;
 Wed, 27 Oct 2021 05:56:30 -0700 (PDT)
Received: from [192.168.1.128] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id x2sm3349278wmj.3.2021.10.27.05.56.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 05:56:30 -0700 (PDT)
Message-ID: <5a01bedd-9150-b23c-7e2a-08d2e7da0fe6@redhat.com>
Date: Wed, 27 Oct 2021 14:56:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] [RESEND] drm: fb_helper: fix CONFIG_FB dependency
To: Arnd Bergmann <arnd@kernel.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter
 <daniel@ffwll.ch>, Kees Cook <keescook@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Arnd Bergmann <arnd@arndb.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210927142816.2069269-1-arnd@kernel.org>
 <202109270923.97AFDE89DB@keescook> <YVXJLE8UqgcUNIKl@phenom.ffwll.local>
 <878ryeit9i.fsf@intel.com>
 <CAK8P3a0EG_C6OvG00Dg8SQacirNztLFjVonb5t2xQj9aFZ47Vg@mail.gmail.com>
 <3604fb90-f6c3-0fa2-c864-7f1795caee1e@redhat.com>
 <CAK8P3a0_9U0MDLcNG8GL_ZDCGQAsB=G7DBC0k1BYB1HNQTbu4Q@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAK8P3a0_9U0MDLcNG8GL_ZDCGQAsB=G7DBC0k1BYB1HNQTbu4Q@mail.gmail.com>
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

On 10/27/21 14:52, Arnd Bergmann wrote:

[snip]

>>
>> @@ -104,7 +105,6 @@ config DRM_FBDEV_EMULATION
>>         bool "Enable legacy fbdev support for your modesetting driver"
>>         depends on DRM
>>         depends on FB
>> -       select DRM_KMS_HELPER
>>         select FB_CFB_FILLRECT
>>         select FB_CFB_COPYAREA
>>         select FB_CFB_IMAGEBLIT
> 
> This fails because of all the other drivers that try to 'select DRM_KMS_HELPER'.
> Kconfig will now complain about a symbol that gets selected while its
> dependencies
> are not met.
> 
> To work around that, every single driver that has 'selects DRM_KMS_HELPER' would
> now have to also list 'depends on (DRM_FBDEV_EMULATION && FB) ||
> !DRM_FBDEV_EMULATION'.
>

Ah, I see now. Thanks a lot for the explanation.
 
>        Arnd
> 

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

