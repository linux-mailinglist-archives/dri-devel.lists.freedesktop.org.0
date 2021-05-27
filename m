Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 028A53928B0
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 09:39:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 778BF6E03C;
	Thu, 27 May 2021 07:39:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A47C6E03C
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 07:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622101140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tr9Om/qHWPld9nvtg7I4AilQwhNjlhgHg8Y3pfskr8o=;
 b=YNPdnAQIyJCOx+iUwkhM4Q/F9kJHIrxRyUbISNOB2OhoT7rgXm6RgPbcuZN4hITCgAfZwL
 sD0973VZNzlvDxL++CS3MEJuAhL+7RwN8+QSNaG3aF+B2lG/RMXFs1rFqJYFjFCZwmgX8z
 jYfGI0c0PkGP7WOWT0Jm3e7+gOV4HUM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-3N189619PkarXS-kdf9_og-1; Thu, 27 May 2021 03:38:58 -0400
X-MC-Unique: 3N189619PkarXS-kdf9_og-1
Received: by mail-wr1-f71.google.com with SMTP id
 u5-20020adf9e050000b029010df603f280so1394800wre.18
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 00:38:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tr9Om/qHWPld9nvtg7I4AilQwhNjlhgHg8Y3pfskr8o=;
 b=p88/s9K9e17gdBrJLgOOl3Hp9DwJX5DIsr4FfGF7fPjHMOBrSNWj5uI9lY/UIqVd6T
 mzDgn5jkMqloDOWzRh3UgkyKBpWAJZPM1QX/UM8idrKxkbBGR4W0IvEgwn2hwRojzALf
 l/suylBLZWyrMmqTTI8D9Xk0W+TDmMQYVO7l6fA0oG0oOa7swqh5P2jnspuTPiW9i7Hg
 owPSdMgprdGiZBHVVd9XXv64f6iHl9trZZx1pGCrO7DYwt/hIyjjOFGhdqjg1IV3yEWW
 JDE0bf1druaQLBZVCkPVWM6IKovZtQGy/WvNgYNHI9HtL3QQWPO9SFagwx0E0Vjh6b8x
 lSxQ==
X-Gm-Message-State: AOAM532h0TtCSDrSMXZrbHHWsGrByNNHkJwOxgvM5OSGi/888EaiJrj2
 gr36HsaEm0AZSX57kK7VcoBMb/S/0K5XQzzfoBZQTeghW+fUlRxDsK3sv6Dn5wTV3j4oKvp24Y0
 gQz3zK7A4/Izd8VA21HAf4ENaxJmR
X-Received: by 2002:a1c:7407:: with SMTP id p7mr2052137wmc.36.1622101137741;
 Thu, 27 May 2021 00:38:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZVop6H2VW1mRjVUOgw8KEymXsvePOqGNAVjrj5q1DCCxN2zMbkp3L1Ndnzh3bt5xh50E+CQ==
X-Received: by 2002:a1c:7407:: with SMTP id p7mr2052118wmc.36.1622101137559;
 Thu, 27 May 2021 00:38:57 -0700 (PDT)
Received: from [192.168.1.101] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id h9sm1753276wmb.35.2021.05.27.00.38.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 May 2021 00:38:57 -0700 (PDT)
Subject: Re: [PATCH v2] drm/rockchip: remove existing generic drivers to take
 over the device
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20210516074833.451643-1-javierm@redhat.com>
 <ef974dd8-5619-35b7-74de-4e270033a3c3@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
Message-ID: <1f781f88-24ff-98b8-9c86-ae4db311843f@redhat.com>
Date: Thu, 27 May 2021 09:38:55 +0200
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

Thanks for the ack.
 
> Ping me if no one else merges the patch.
>

I would really appreciate if you merge this patch.
 
> Best regards
> Thomas

Best regards,
-- 
Javier Martinez Canillas
Software Engineer
New Platform Technologies Enablement team
RHEL Engineering

