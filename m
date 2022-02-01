Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99ECE4A5CC9
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 14:06:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D77F410E15A;
	Tue,  1 Feb 2022 13:06:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 821F310E15A
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 13:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643720771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/JQQOEd58RWuQGlfFpmDXOvRRGfDXT71ddV8rPIIJl0=;
 b=UCi1fnIUNsEZ5DcUNRo6455Qu5KuTCo8jzMfSR4JnxGIbMaG7Y0oVL4AUK1NA2bJmVHmMC
 l82t2LD5wYpmzZDQ0+A164XQXb2Vu90U8IrV7HEvniwpVuEIpmLutsPYRMLSt8GQVo08za
 5ZwpE0Xxn6ganJSOIf1WzYVjPRH7kXs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-a2vZKsnvPZqY1R79RZO9tw-1; Tue, 01 Feb 2022 08:06:10 -0500
X-MC-Unique: a2vZKsnvPZqY1R79RZO9tw-1
Received: by mail-wm1-f69.google.com with SMTP id
 i132-20020a1c3b8a000000b0035399bb7e85so1335377wma.4
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 05:06:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/JQQOEd58RWuQGlfFpmDXOvRRGfDXT71ddV8rPIIJl0=;
 b=daePK8AxdCka2J7H4j4T3NjqbO/mZjxSkLlf6Yu0jZ0vX+u+QDrUMOHZIIcfkJUrtd
 J9p0KfJl3NYcX3OL/EsCkR1WVzRcPJwhHkkvse9Yzv106iKXnnd/zS2INEJT+iCxvvY1
 Bu7C52ICKIgE+Tijqphj4DePJhm1OkkF8jL64mR+PHe6JBYs4Pp6HM/AAGuY4u0Vcijh
 uapyOYqt2I0bUiHnPzSEeO34O9rWSLlfonG4m873uXKysyHlmeBP6KvIvu0/T9ZZwE1h
 HHGlYaJ7l5pRnMgLoPNTiubagl5AbVB61ezhly6dVAWmufdQL2khrcKB9rYFxF7iDcv4
 nDGQ==
X-Gm-Message-State: AOAM533Obw6X6q/netaPFf0AylrI0Muv7nNs40Hzc0uNA4o6K6SaI8KM
 GTI3SEeXdBs4XeDGqyoNCywBQX36M2DyAAIakfB61tJiFPI8Lr3EfZLO8T54/ZNCYeG6RdXZnSD
 TUd+bXrZLf7dmQkG4jvfGI3kOqfPm
X-Received: by 2002:a1c:3586:: with SMTP id c128mr1752536wma.15.1643720769213; 
 Tue, 01 Feb 2022 05:06:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzYHBjANBhvf+E+2paUEQ5NN7skEmnIc89W4J4poW5Ib7Aw4MHr3Wo/i0Jc5irQYQHxGDNJ+g==
X-Received: by 2002:a1c:3586:: with SMTP id c128mr1752519wma.15.1643720769023; 
 Tue, 01 Feb 2022 05:06:09 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id l4sm15793539wrs.6.2022.02.01.05.06.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 05:06:08 -0800 (PST)
Message-ID: <4322f58b-dbeb-b90f-2770-d6881f8005b4@redhat.com>
Date: Tue, 1 Feb 2022 14:06:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/4] drm: Add I2C connector type
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Sam Ravnborg <sam@ravnborg.org>
References: <20220131201225.2324984-1-javierm@redhat.com>
 <20220131201225.2324984-2-javierm@redhat.com> <YfhMESTylI1NTKDg@ravnborg.org>
 <4d9a56a7-da25-b411-61cc-372c6fa9011d@tronnes.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <4d9a56a7-da25-b411-61cc-372c6fa9011d@tronnes.org>
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Emil Velikov <emil.l.velikov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Noralf,

On 2/1/22 13:58, Noralf Trønnes wrote:
> 
> 
> Den 31.01.2022 21.52, skrev Sam Ravnborg:
>> On Mon, Jan 31, 2022 at 09:12:21PM +0100, Javier Martinez Canillas wrote:
>>> There isn't a connector type for display controllers accesed through I2C,
>>> most drivers use DRM_MODE_CONNECTOR_Unknown or DRM_MODE_CONNECTOR_VIRTUAL.
>>>
>>> Add an I2C connector type to match the actual connector.
>>>
>>> As Noralf Trønnes mentions in commit fc06bf1d76d6 ("drm: Add SPI connector
>>> type"), user-space should be able to cope with a connector type that does
>>> not yet understand.
>>>
> 
> It turned out that I wasn't entirely correct here, mpv didn't cope with
> unknown types. In the PR to add support Emil Velikov wondered if libdrm
> should handle these connector names:
> https://github.com/mpv-player/mpv/pull/8989#issuecomment-879187711
> 

I see, thanks for the information. What should we do then, just use the type
DRM_MODE_CONNECTOR_Unknown then ?

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

