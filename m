Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5472D62F6E7
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 15:13:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A093110E74F;
	Fri, 18 Nov 2022 14:13:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B3C10E74F
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 14:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668780783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G6z2GsHX/rXp44bsGnBfDVYpLfZQct9eXoK8rIZ2DlE=;
 b=Ef3JBAJHIx8Qxi3u8fnsp0DvNI8dSZTfkeD1xN4OgV1SW/7jWxdwdew5Gphws6GoaEyZSh
 nlmW+2YPQZMLb+8rw1IX3vj7WD1I6AMSoA/OBc2PWlG8iWybfzVYBZ1OVd/gr0hy26bjzy
 z6CSEKe+DVGrMrNdUr5LuJ+HrM+xWJI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-528-HT4W6tj9N4mo3lKLiBD_WQ-1; Fri, 18 Nov 2022 09:13:02 -0500
X-MC-Unique: HT4W6tj9N4mo3lKLiBD_WQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 i14-20020adfa50e000000b0023652707418so1634577wrb.20
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 06:13:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G6z2GsHX/rXp44bsGnBfDVYpLfZQct9eXoK8rIZ2DlE=;
 b=R/ukhOD4Fo4Aa67gWbb2fcdsjoCAg0ly8a6dPGqWWVELo47Qj7nCImQch7Yk9PoL6e
 aI3oYqP2ZURdneaxrgBbz7NKdmu/okOVDz5SruPy8hlM7MTQF+j5C1QDaw6NF2dtWvDW
 i2VZd4Cx6KUUHtNXCkNZskMj5s6oABrMT1+tD+9ByKgrTctP0rT2+IaQG6H7l2PA3gea
 gAHkuYd7Fwd3FihIqTSTek9SJFQy6tGnoDYufcknrWRrBQ9Gf1eHtwu/PgEehCeCbWaN
 7shqNCAkr5BI337hb9MRlYuwRkEyQQNxBim5rqghJECbFYXmDbj9m8DDrEd3dAdJ5qla
 ix5w==
X-Gm-Message-State: ANoB5pn2a/JL0nThVIJF5597/y+iR11CJjYeLaOiLrjb/eegQKsQTnbz
 kf5m4w9+SGQNZBQFPG0Bu21zJwJw9kUYwixhS7aBpmeyjlebc9QJ6rjhqS8sEouJAarSJJmc2z4
 wrudPUDfncKGY8qjWQTVrZYu+ZG6O
X-Received: by 2002:adf:a39c:0:b0:236:7869:ced7 with SMTP id
 l28-20020adfa39c000000b002367869ced7mr4396735wrb.163.1668780781235; 
 Fri, 18 Nov 2022 06:13:01 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4Vhk0p/+15QxOCqT72ZWVSwMtCN80cNRmpgWK8myXtgV/pn90KVULPUfvFieDBhtPx7A5B0A==
X-Received: by 2002:adf:a39c:0:b0:236:7869:ced7 with SMTP id
 l28-20020adfa39c000000b002367869ced7mr4396724wrb.163.1668780781039; 
 Fri, 18 Nov 2022 06:13:01 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 p15-20020a05600c468f00b003cfd10a33afsm9232629wmo.11.2022.11.18.06.13.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Nov 2022 06:13:00 -0800 (PST)
Message-ID: <8efa5cf1-4f32-53b9-49a4-bc3a44fbff14@redhat.com>
Date: Fri, 18 Nov 2022 15:12:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 7/7] drm/fb-helper: Don't use the preferred depth for the
 BPP default
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 xinliang.liu@linaro.org, tiantao6@hisilicon.com, jstultz@google.com,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 paul.kocialkowski@bootlin.com, airlied@redhat.com, kraxel@redhat.com
References: <20221116160917.26342-1-tzimmermann@suse.de>
 <20221116160917.26342-8-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221116160917.26342-8-tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/16/22 17:09, Thomas Zimmermann wrote:
> If no preferred value for bits-per-pixel has been given, fall back
> to 32. Never use the preferred depth. The color depth is the number
> of color/alpha bits per pixel, while bpp is the overall number of
> bits in most cases.
> 
> Most noteworthy, XRGB8888 has a depth of 24 and a bpp value of 32.
> Using depth for bpp would make the value 24 as well and format
> selection in fbdev helpers fails. Unfortunately XRGB8888 is the most
> common format and the old heuristic therefore fails for most of
> the drivers (unless they implement the 24-bit RGB888 format).
> 
> Picking a bpp of 32 will lateron result in a default depth of 24

later on

> and the format XRGB8888. As XRGB8888 is the default format for most
> of the current and legacy graphics stack, all drivers must support
> it. So it is the safe choice.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Agreed that 32 is a safe choice in this case.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

