Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 810485087B0
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 14:06:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C85B010E33B;
	Wed, 20 Apr 2022 12:06:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 549EA10E33B
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 12:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650456380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JrjlhLuNw60SqgJzaJLgTSmo0lfCDXeGwbbQ3reTlyc=;
 b=UX9iJpxt2JdP59ViNGEwWdwtNuN6bgt0AnYljnYFynupYz1tEJPQYDAgqFLO70//S7vRhP
 ZV1XjBFoEn9WsDH8oZNABGJvjVh5pBkLe3Cw6OuL8Bq+xa6HngQTnNuhAksjkS4p6/H9Oh
 jvqT+a0IjhTKxEA1EeswBViTTi6MIh4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-519-pAnptwfFNRe8JwpUkfYWXQ-1; Wed, 20 Apr 2022 08:06:19 -0400
X-MC-Unique: pAnptwfFNRe8JwpUkfYWXQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 q4-20020adfc504000000b002079c9cc1bfso337827wrf.11
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 05:06:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JrjlhLuNw60SqgJzaJLgTSmo0lfCDXeGwbbQ3reTlyc=;
 b=5b4mOSPilse4cEbc8QFIyjQU8ctWTWupObNz0DljBSL8/7fT7Z0KT/pVa+MKZiXjk/
 fgqnnYXisJruzMdvsoS704/Q73m/cSKHj6LnkNMCcJ8aXPr/PcN+27NE1JGGacs6Aevz
 Vb9yjsuHJJyJHIzRSeeMqojaacjcAf2dv6wrTWzlGVZVt1vxyGRYZ7aZ/0wRKx26qkLh
 KNAMYoePAMPdTPfICjtAD8S2mb7uY2ErYo+lq8B1MfTLVXOji3DRS1bPmBKaJFl9Gawo
 /R7Cpd+YBLbe/NGIbUiNlATE5WyROGGOmM2znQmy9TOTmeLkCjgNEGyLxak+cLXtktle
 3I8g==
X-Gm-Message-State: AOAM531JcNzhJ4CVcNcysykaRWph9YoeDUme1wU0jSaaASJnJG5l89t0
 vErm8S1jQvjvAR3H/glOP4HMFjqv1DC6qZBgoWKRhS/X7VJuuAuzs3yqgbgrZx64D1dP43fF8wd
 XW0Tvbn9+FkIU7ZF4YqoknWiBR3Fw
X-Received: by 2002:a05:600c:1552:b0:38e:c7a4:f056 with SMTP id
 f18-20020a05600c155200b0038ec7a4f056mr3353308wmg.183.1650456378174; 
 Wed, 20 Apr 2022 05:06:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPRYVBqH5dhIeogn/5Oc03Oxad1lPkAusQ80YGohWjlqZBBAjp2LC+qxctpXgXzcs+IBkGfQ==
X-Received: by 2002:a05:600c:1552:b0:38e:c7a4:f056 with SMTP id
 f18-20020a05600c155200b0038ec7a4f056mr3353284wmg.183.1650456377986; 
 Wed, 20 Apr 2022 05:06:17 -0700 (PDT)
Received: from [192.168.1.129] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a1cf403000000b0037d1f4a2201sm17966718wma.21.2022.04.20.05.06.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 05:06:17 -0700 (PDT)
Message-ID: <357b2fe7-73f7-6382-20d4-1fdfdac86c19@redhat.com>
Date: Wed, 20 Apr 2022 14:06:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 8/8] drm/display: Move SCDC helpers into display-helper
 library
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jani.nikula@linux.intel.com, lyude@redhat.com
References: <20220420110900.8707-1-tzimmermann@suse.de>
 <20220420110900.8707-9-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220420110900.8707-9-tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/20/22 13:09, Thomas Zimmermann wrote:
> SCDC is the Status and Control Data Channel for HDMI. Move the SCDC
> helpers into display/ and split the header into files for core and
> helpers. Update all affected drivers. No functional changes.
> 
> To avoid the proliferation of Kconfig options, SCDC is part of DRM's
> support for HDMI. If necessary, a new option could make SCDC an
> independent feature.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
Looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

