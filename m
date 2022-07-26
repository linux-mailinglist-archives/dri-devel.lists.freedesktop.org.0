Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30960581A3C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 21:22:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DF8411B528;
	Tue, 26 Jul 2022 19:22:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF1711B528
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 19:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658863330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HM/992FpowUrZBdOewYXTdFa78rfvZ1wIMJtEZDEzFo=;
 b=cN2r67UaTp5zrWI4EkfRQyUi8Txa3UtON2qB9KdIOip1YlFiYifcPk0XZXGarr3Wip6D5U
 w6vz7+MsKQ+zSLVpQoY2lxrwnnrv9hOxWBJkciCMa0aP0xzC5vZh/tkLQrDW7HNEyfhb9G
 rKfh1f6Neoc3e2tt/9oWfSMHJunvt8o=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-75-8N4Ee8BuNlGUBMPIv7kZIg-1; Tue, 26 Jul 2022 15:22:08 -0400
X-MC-Unique: 8N4Ee8BuNlGUBMPIv7kZIg-1
Received: by mail-wm1-f71.google.com with SMTP id
 ay19-20020a05600c1e1300b003a315c2c1c0so10635540wmb.7
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 12:22:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HM/992FpowUrZBdOewYXTdFa78rfvZ1wIMJtEZDEzFo=;
 b=Ly3rOti++HgMRvO5CsXB8Ms6Uhp5IgcXbtr6HAiiHcAab8SrvBo9A2MJLizzm2dvtH
 XuFJU7faJv1rxURRRwgcie6FwX497YuIH53X/48RtAVuE3oZ4qti9jKtaavCz4ppCzui
 JgXLcpO+Gy3WOIYmE1G3hfAO6S+ggN2/0isPAXxzo9xTHh3ZDcNzUD41pjZZ+VignLL6
 C6sLUQYZFMy6TUWuvHHQMLzG2L+Fk9xm5daXdBLwAyK2Qnc8/7E6etw/q5UI9Wm39Zl7
 9ChxZ4OZxH3dre+zc2sZ86dgkcHi1WyKZ968nv9Uwlmj245uTe+4+7XE0QhPUwt6VIyP
 K1xA==
X-Gm-Message-State: AJIora+i7U7puNUrt9sw3nyAKlkf1r0VMfChCiEcNzLqI4F6e3DS/mhD
 Gfn2i34GxnQOiA3xWn5KPKmT2IBYd24dMFTekZcIN9wmzshgHznIEafngDyrH7r2aVrwZaiCK/O
 7IwpbCFS5XRTlWjy6VyAOoCNNsRsy
X-Received: by 2002:a5d:64e5:0:b0:21d:945a:e7c4 with SMTP id
 g5-20020a5d64e5000000b0021d945ae7c4mr12161309wri.0.1658863327270; 
 Tue, 26 Jul 2022 12:22:07 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vGZKU+Yu4t/pJR7G/x3ABdDb+Jc5JIBwBhoD8uXuQNqfQGzOOG9RFUs5hjLn5ORhAmUgcRxw==
X-Received: by 2002:a5d:64e5:0:b0:21d:945a:e7c4 with SMTP id
 g5-20020a5d64e5000000b0021d945ae7c4mr12161300wri.0.1658863326979; 
 Tue, 26 Jul 2022 12:22:06 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 z21-20020a05600c0a1500b0039c454067ddsm19704276wmp.15.2022.07.26.12.22.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jul 2022 12:22:06 -0700 (PDT)
Message-ID: <90aef621-b686-12dd-de55-9a680f5783d7@redhat.com>
Date: Tue, 26 Jul 2022 21:22:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 09/10] drm/ofdrm: Add per-model device function
To: =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-10-tzimmermann@suse.de>
 <7b1a2807-59c7-d524-af8e-1ec634c740a7@redhat.com>
 <20220726144024.GP17705@kitsune.suse.cz>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220726144024.GP17705@kitsune.suse.cz>
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
Cc: linux-fbdev@vger.kernel.org, sam@ravnborg.org, airlied@linux.ie,
 mpe@ellerman.id.au, deller@gmx.de, mark.cave-ayland@ilande.co.uk,
 dri-devel@lists.freedesktop.org, paulus@samba.org, maxime@cerno.tech,
 Thomas Zimmermann <tzimmermann@suse.de>, geert@linux-m68k.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Michal,

On 7/26/22 16:40, Michal Suchánek wrote:
> Hello,
> 
> On Tue, Jul 26, 2022 at 03:38:37PM +0200, Javier Martinez Canillas wrote:
>> On 7/20/22 16:27, Thomas Zimmermann wrote:
>>> Add a per-model device-function structure in preparation of adding
>>> color-management support. Detection of the individual models has been
>>> taken from fbdev's offb.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> ---
>>
>> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>>
>> [...]
>>
>>> +static bool is_avivo(__be32 vendor, __be32 device)
>>> +{
>>> +	/* This will match most R5xx */
>>> +	return (vendor == 0x1002) &&
>>> +	       ((device >= 0x7100 && device < 0x7800) || (device >= 0x9400));
>>> +}
>>
>> Maybe add some constant macros to not have these magic numbers ?
> 
> This is based on the existing fbdev implementation's magic numbers:
> 
> drivers/video/fbdev/offb.c:                 ((*did >= 0x7100 && *did < 0x7800) ||
>

Ah, I see. Then we might have to go with the magic numbers...
 
> Of course, it would be great if somebody knowledgeable could clarify
> those.
>

Indeed.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

