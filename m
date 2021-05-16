Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE4D381F75
	for <lists+dri-devel@lfdr.de>; Sun, 16 May 2021 17:25:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32071891A0;
	Sun, 16 May 2021 15:25:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C1BE891A0
 for <dri-devel@lists.freedesktop.org>; Sun, 16 May 2021 15:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621178752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rh3Sd0JcU9szqK55NWh6S2hsCVgwsM8f4R5lJKfXVFU=;
 b=Lx2pslD+9vfT5nVV9pIcahJYSu71pRknQhR5GBuTL42nGosM/mMtbJhaqdM79rHYEhnGKG
 8IwGAkXydXAEIPZ1MVv8r8mXsePuxbWvJLmWvsX4nfisVDJc2bcAJx7YF7qiWp9Xdjsxc0
 aizf5JZ8L8QwVKrPQsFqawLI2Di5Aow=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-64sKy5P7Mrid245cnVJ5Ug-1; Sun, 16 May 2021 11:25:51 -0400
X-MC-Unique: 64sKy5P7Mrid245cnVJ5Ug-1
Received: by mail-wr1-f72.google.com with SMTP id
 j33-20020adf91240000b029010e4009d2ffso2535501wrj.0
 for <dri-devel@lists.freedesktop.org>; Sun, 16 May 2021 08:25:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rh3Sd0JcU9szqK55NWh6S2hsCVgwsM8f4R5lJKfXVFU=;
 b=KZBEiDJLdJhQf5PIrd1elfPS1Am+NH9b/1VAlw15j0vnTA3+MTYtDP6IeFe5AAhZNc
 Vueqyxe8fvl2Zf0xncgNw3Cqozbf/VPaZm4XFSXv0pTkgaRSLLWDEcaUkYlQHEjvqYf4
 oCGXeeYyYA9rvCj00I249EWp/8Efj2is9K088hgORPntQj3SFkxaV13kDujKMhPtiA4w
 aJF0xsN8JY3g19ttFTFIDi95Ju+3d2bVU+5h942C5h4kCpLe3KPNw1RevPAecxnIYCpd
 JBfykFx7aX6HygzsvNIiROkMJKJL/j6ZY4LWlOLJrt3DfxHKVxfm5mLAw2VTTw6YDEx8
 Sorg==
X-Gm-Message-State: AOAM531OUXJlJpnshaATfS4by/g9RJ1RBkWq81gDBa0ONjGqTQufGG0j
 AOhyW6rd5TYQvErXz7vp56jMtudFZcUZstL0A7hlb62z7aXGqiYwTI17cO093nHq+jbOb+Qsfvt
 e0nBmTcTT54LmrqVVXtUU5+dOUDy/
X-Received: by 2002:a5d:4b4e:: with SMTP id w14mr70258914wrs.9.1621178749819; 
 Sun, 16 May 2021 08:25:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrIeisoP1v0heRBwNPcG4ITRaoMkHe2GGAaPVT/JCNOExMusD/ggg/zsQI0GgHRlRdmJxhyA==
X-Received: by 2002:a5d:4b4e:: with SMTP id w14mr70258905wrs.9.1621178749653; 
 Sun, 16 May 2021 08:25:49 -0700 (PDT)
Received: from [192.168.1.101] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id f8sm10609976wmg.43.2021.05.16.08.25.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 May 2021 08:25:49 -0700 (PDT)
Subject: Re: [PATCH v2] drm/rockchip: remove existing generic drivers to take
 over the device
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20210516074833.451643-1-javierm@redhat.com>
 <ef974dd8-5619-35b7-74de-4e270033a3c3@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
Message-ID: <1b492488-3f25-fca9-e9d9-78138bed1d2c@redhat.com>
Date: Sun, 16 May 2021 17:25:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <ef974dd8-5619-35b7-74de-4e270033a3c3@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: David Airlie <airlied@linux.ie>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Peter Robinson <pbrobinson@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 5/16/21 12:30 PM, Thomas Zimmermann wrote:
> 
> 
> Am 16.05.21 um 09:48 schrieb Javier Martinez Canillas:
>> There are drivers that register framebuffer devices very early in the boot
>> process and make use of the existing framebuffer as setup by the firmware.
>>
>> If one of those drivers has registered a fbdev, then the fallback fbdev 
> of
>> the DRM driver won't be bound to the framebuffer console. To avoid that,
>> remove any existing generic driver and take over the graphics device.
>>
>> By doing that, the fb mapped to the console is switched correctly from the
>> early fbdev to the one registered by the rockchip DRM driver:
>>
>>      [   40.752420] fb0: switching to rockchip-drm-fb from EFI VGA
>>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> 
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> Ping me if no one else merges the patch.
>

Sure, I will. And thanks a lot for your review!
 
> Best regards
> Thomas
>

Best regards,
-- 
Javier Martinez Canillas
Software Engineer
New Platform Technologies Enablement team
RHEL Engineering

