Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9158347D193
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 13:19:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40CBF10EBB1;
	Wed, 22 Dec 2021 12:19:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8661710EBB1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 12:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640175541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cL61vxvdQEO5k/ykdSCycESvP1inlvyehpY4sAwws0I=;
 b=i6DpV8flWtYMgw7ozmOsI8ftLam6XUTE9lhwG2BpbSG++0OioROfyZGzXtYYRUlHSq6pq1
 sbN16bRlJfFb8s38L5d6Ii1d7zTlTzedpecM7yaPcJ+IpU4+xSuMuGGT28alXVa/svzJNX
 8VfvT+WJFSOZb/5/xAybzViKufh3uG4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-U7AsQgz5PK2gPQs_HdOzLA-1; Wed, 22 Dec 2021 07:19:00 -0500
X-MC-Unique: U7AsQgz5PK2gPQs_HdOzLA-1
Received: by mail-wm1-f69.google.com with SMTP id
 r2-20020a05600c35c200b00345c3b82b22so1055734wmq.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 04:18:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cL61vxvdQEO5k/ykdSCycESvP1inlvyehpY4sAwws0I=;
 b=ATabkAfdw8MundxmrTKToJBz0/pLI4BJ3o634pfY1VMB3IGtl92H2lNEEDEboNKPeN
 Y5AsCNo43hSriWB5uC3MmmaAJETMQUmvYwzfCvlkx1GME0q4oY75yPcVs9pjG03HjQNv
 r+7wlIKm2WVboFHZZ4V/6rWhp24St117VQBXiOo1xwNbe+6pP93wXZW+KZllPBn79hLw
 LLFcjcemNqZO4bMzvZP8JOhv1cnaXAxmyzmvP111ekV3AX0ceP+2fiW5qzRVygowBgDX
 Y0fu7jSy03KhuVQ8Ch4lEC1exJ5Tiqca3CrSQFQhBgCGSgPwDSC/nPaU+N4izUpUh3Og
 RhSg==
X-Gm-Message-State: AOAM533H/v9J/ztiKhdKEf13xd9zewT0lmh2rQQBJObVZlGBA/YvQ8N6
 zWNvf/urx2C385jQl2wA/cPF3KOgBUkIhQs2j3FrYlHJRA3ptcNgq38sZxuKLVpE7DhoTIMY7jm
 rTdnCslNJafRAdBvg4T2LZp7qCrvV
X-Received: by 2002:a05:600c:511c:: with SMTP id
 o28mr821313wms.96.1640175538758; 
 Wed, 22 Dec 2021 04:18:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy5r7kubxgz+bs8OZwuv5BmfKHiTBiEJEfqXxBgDH8xXoRJQUdklHrzHmZpeba3ojR02aUVTw==
X-Received: by 2002:a05:600c:511c:: with SMTP id
 o28mr821303wms.96.1640175538587; 
 Wed, 22 Dec 2021 04:18:58 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id h27sm5365676wmc.43.2021.12.22.04.18.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Dec 2021 04:18:58 -0800 (PST)
Message-ID: <7b07b437-2bc1-0194-233b-cc6d6c70cfd5@redhat.com>
Date: Wed, 22 Dec 2021 13:18:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 03/10] drm/bochs: Replace module-init boiler-plate code
 with DRM helpers
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20211222082831.196562-1-javierm@redhat.com>
 <20211222082831.196562-4-javierm@redhat.com>
 <20211222102135.fhtfkinp2u6yjwx3@sirius.home.kraxel.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20211222102135.fhtfkinp2u6yjwx3@sirius.home.kraxel.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Gerd,

On 12/22/21 11:21, Gerd Hoffmann wrote:
> On Wed, Dec 22, 2021 at 09:28:24AM +0100, Javier Martinez Canillas wrote:
>> -static int __init bochs_init(void)
>> -{
>> -	if (drm_firmware_drivers_only() && bochs_modeset == -1)
>> -		return -EINVAL;
> 
> Also cleanup bochs_modeset?  I guess its not used any more after this
> patch ...
>

That's still used. It is passed as an argument to the macro:

drm_module_pci_driver_if_modeset(bochs_pci_driver, bochs_modeset);

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

