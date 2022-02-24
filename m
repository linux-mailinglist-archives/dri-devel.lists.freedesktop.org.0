Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABEF4C2CAC
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 14:08:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECB3810E1B0;
	Thu, 24 Feb 2022 13:08:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3B9210E1B0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 13:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645708087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0EVsOVEVi549uQueySNY9KzFlhmMPHLIPMzleYLz+qo=;
 b=EWDWISIeyZdDAptTYD4rZrnCTYcQEMa1/ijnY5teVbQxp9+ehbwv0hThSvRqgCj1wq0JIC
 nQWCMPbGEBkJKayVApXTnPnTqwoiGlu6gtvSLhKDRYBM83Evsrm9ZM6HleqZpnGusKgwBc
 Iz7r4dDqr06+lFRrVlTBYUOUdrAjNao=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-DqsGSua7N6W5kcIgT8La1g-1; Thu, 24 Feb 2022 08:08:05 -0500
X-MC-Unique: DqsGSua7N6W5kcIgT8La1g-1
Received: by mail-wm1-f72.google.com with SMTP id
 r206-20020a1c44d7000000b00380e36c6d34so2688603wma.4
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 05:08:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0EVsOVEVi549uQueySNY9KzFlhmMPHLIPMzleYLz+qo=;
 b=d0PpbBsevARY3bGN7utvz+uc8tOhlxQs12BDHvd31e5sVPYESEiITOgfTgaAWlZnKg
 DuP+IT33Am6kiWn/J9nb03qCcAMYHy/Tb1UqnvEdzXC4TdXZRWhfpr2jl+7BUEYYMPry
 1N3M1n67Na3sRkirnCwNjmh7OW+1yD4ebBNiwnlDli4IuXEbNKKabDszkGtTByuoKfhm
 WEGZsYC0srJLTNyHrHrqR32r7on74cVT57jZkPn+rnK2v0Y/7XuoENfL49aMqV/WknLe
 lDuiQOeN4mojD3lgjWAMzTPFOTJLam2esuKkkJrdGk0zQof91gdPZAYaAHFEc/HLw0PO
 +bQw==
X-Gm-Message-State: AOAM5309Dv64B2P7O/EMjLHSPXRWzFx03WCcgh+FyH/WVcc+lS6kM9I+
 b3DQk/EQ+5E7dmXBIhw1YXI2SirNvqyjMvvoTD9Jc3mJ1k/bDnUxguFH8VxifzuF6YD5nozENS+
 xaZ9dOoQrVDsdCPVsK5vVTT2SSmRy
X-Received: by 2002:a5d:55d0:0:b0:1ed:bda2:4e11 with SMTP id
 i16-20020a5d55d0000000b001edbda24e11mr2150397wrw.6.1645708083875; 
 Thu, 24 Feb 2022 05:08:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzn1X/saZLBhWVfywktHqMBxvhE1rOLLQ0lPvQOqMZENaD5Q/O6dfZ65Ail1oS2c8lpZGA5kQ==
X-Received: by 2002:a5d:55d0:0:b0:1ed:bda2:4e11 with SMTP id
 i16-20020a5d55d0000000b001edbda24e11mr2150381wrw.6.1645708083610; 
 Thu, 24 Feb 2022 05:08:03 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id f18sm2931416wmg.21.2022.02.24.05.08.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 05:08:03 -0800 (PST)
Message-ID: <5ce95984-0816-9c28-f0b5-fe3f0094aeb6@redhat.com>
Date: Thu, 24 Feb 2022 14:08:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/todo: Update panic handling todo
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20220224125934.3461478-1-daniel.vetter@ffwll.ch>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220224125934.3461478-1-daniel.vetter@ffwll.ch>
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
Cc: gpiccoli@igalia.com, Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Daniel,

On 2/24/22 13:59, Daniel Vetter wrote:
> Some things changed, and add two useful links.
> 
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: gpiccoli@igalia.com
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  Documentation/gpu/todo.rst | 21 +++++++++------------
>  1 file changed, 9 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 7bf7f2111696..283d35a500bd 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -475,8 +475,12 @@ This is a really varied tasks with lots of little bits and pieces:
>    achieved by using an IPI to the local processor.
>  
>  * There's a massive confusion of different panic handlers. DRM fbdev emulation
> -  helpers have one, but on top of that the fbcon code itself also has one. We
> -  need to make sure that they stop fighting over each another.
> +  helpers had their own (long removed), but on top of that the fbcon code itself
> +  also has one. We need to make sure that they stop fighting over each another.

The "over each another" sounds a little bit off, shouldn't be "over each other" ?

> +  This is worked around by checking ``oops_in_progress`` at various entry points
> +  into the DRM fbdev emulation helpers. A much cleaner approach here would be to
> +  switch fbcon to the `threaded printk support
> +  <https://lwn.net/Articles/800946/>`_.
>  
>  * ``drm_can_sleep()`` is a mess. It hides real bugs in normal operations and
>    isn't a full solution for panic paths. We need to make sure that it only
> @@ -488,16 +492,9 @@ This is a really varied tasks with lots of little bits and pieces:
>    even spinlocks (because NMI and hardirq can panic too). We need to either
>    make sure to not call such paths, or trylock everything. Really tricky.
>  
> -* For the above locking troubles reasons it's pretty much impossible to
> -  attempt a synchronous modeset from panic handlers. The only thing we could
> -  try to achive is an atomic ``set_base`` of the primary plane, and hope that
> -  it shows up. Everything else probably needs to be delayed to some worker or
> -  something else which happens later on. Otherwise it just kills the box
> -  harder, prevent the panic from going out on e.g. netconsole.
> -
> -* There's also proposal for a simplied DRM console instead of the full-blown
> -  fbcon and DRM fbdev emulation. Any kind of panic handling tricks should
> -  obviously work for both console, in case we ever get kmslog merged.
> +* A clean solution would be an entirely separate panic output support in KMS,
> +  bypassing the current fbcon support. See `[PATCH v2 0/3] drm: Add panic handling
> +  <https://lore.kernel.org/dri-devel/20190311174218.51899-1-noralf@tronnes.org/>`_.
>  

Having these two links in the docs is very useful. Thanks a lot for adding that.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

