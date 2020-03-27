Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C34E195515
	for <lists+dri-devel@lfdr.de>; Fri, 27 Mar 2020 11:23:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A6896E9EE;
	Fri, 27 Mar 2020 10:23:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC7CD6E9EE
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Mar 2020 10:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585304583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=05Ee6QYlJIueX5ozbF5LVD/y13wkZq4RWsLhymXVQzw=;
 b=PD/4VTCwfFLs8MwCta/A4hCyEB7Mx2Jag2bAuKP2Dz6T8BOdBe8FZzHFCYdijvK1esGTgE
 Buu/IqeFsvLot4B0SBCm0TJUGaUb9cLtkI9T3tVdlh3ZAK4mLdnjILDJm2PXk8CvZ/T8GZ
 oBJPKZLbS6Ja2LcI1moROg/6RuQQpaw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-rhRez6NSNe6nEux_rHiWIg-1; Fri, 27 Mar 2020 06:22:58 -0400
X-MC-Unique: rhRez6NSNe6nEux_rHiWIg-1
Received: by mail-wr1-f70.google.com with SMTP id d1so4318289wru.15
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Mar 2020 03:22:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=05Ee6QYlJIueX5ozbF5LVD/y13wkZq4RWsLhymXVQzw=;
 b=d64Ho+gLaTiHiSvwKAqKroUdSgHBTiadQb1YklUkMQzaWMOyBqkTWwd+CYV6YK3+Ex
 UygSKVHspBcJu7029annjtwnHHk88CAfron3QBX4ImFc1JO0Hdk1pUxKGvKfLMY3lRg3
 Q5HbKHPl4ZUUBsSnDqDh90YSOg0y18MNJg9XWFg0v0yBOOA65vs/k0ua9el942WOcpd+
 C+7na7LYYy45E06PPOF6LTyjKPXx7g2QtpUX+qUAUBYcJlW0g7TAGAB0oaAlurkZLf5c
 TBXSkfUPSd7AH6AgFW2qQo2kcOv+HbrSFWQDfncQle8ojRHmvNriR10IW++HqZdkdjkQ
 LGsA==
X-Gm-Message-State: ANhLgQ2LxUBj+DCL/f3QgbBadED/bLSCrcJOaG45/FCzpgrz4m5wq8Qg
 IoqBxm6V2duWDqH++ZJ6axWrUlbnwEw0Y6r2lJsh/nzNRRShyIlpoeuMOFoiX+BZc2Ib99vZVc0
 AyUqxifSWIYavKhkdVraA48FpuBgX
X-Received: by 2002:a7b:c951:: with SMTP id i17mr4795830wml.182.1585304576739; 
 Fri, 27 Mar 2020 03:22:56 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtDNX47i3srX2ILDC4XcjNclFJtGWEC09OQ0rOSinIhuTKwBB0F3mnf5msFQPZIECn5TGLN/Q==
X-Received: by 2002:a7b:c951:: with SMTP id i17mr4795800wml.182.1585304576226; 
 Fri, 27 Mar 2020 03:22:56 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
 by smtp.gmail.com with ESMTPSA id f22sm15109583wmf.2.2020.03.27.03.22.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Mar 2020 03:22:55 -0700 (PDT)
Subject: Re: [PATCH] drm/fb-helper: Add TODO for making
 drm_fb_helper_alloc_fbi fill apertures
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200326151009.102377-1-hdegoede@redhat.com>
 <CAKMK7uFgyt_LD7wSTDB-LdaW_cc9Ge12DY8kWxeL_dS4Q4deOQ@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <4af412c1-6ffe-8d5b-37ff-cd67be87a840@redhat.com>
Date: Fri, 27 Mar 2020 11:22:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uFgyt_LD7wSTDB-LdaW_cc9Ge12DY8kWxeL_dS4Q4deOQ@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 3/26/20 6:55 PM, Daniel Vetter wrote:
> On Thu, Mar 26, 2020 at 4:10 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Currently drivers using drm_fbdev_generic_setup() end up with a single
>> empty aperture in their fb_info struct.
>>
>> Not having the proper info in the apertures list causes
>> register_framebuffer to not remove conflicting framebuffers,
>> which some drivers currently workaround by manually calling
>> drm_fb_helper_remove_conflicting_pci_framebuffers().
>>
>> Add a TODO as a reminder that we need to fix this.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   drivers/gpu/drm/drm_fb_helper.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
>> index 4c7cbce7bae7..16b8dc38d022 100644
>> --- a/drivers/gpu/drm/drm_fb_helper.c
>> +++ b/drivers/gpu/drm/drm_fb_helper.c
>> @@ -526,6 +526,14 @@ struct fb_info *drm_fb_helper_alloc_fbi(struct drm_fb_helper *fb_helper)
>>          if (ret)
>>                  goto err_release;
>>
>> +       /*
>> +        * TODO: We really should be smarter here and alloc an apperture
>> +        * for each IORESOURCE_MEM resource helper->dev->dev has and also
>> +        * init the ranges of the appertures based on the resources.
>> +        * Note some drivers currently count on there being only 1 empty
>> +        * aperture and fill this themselves, these will need to be dealt
>> +        * with somehow when fixing this.
>> +        */
> 
> Ah yes this is a bit more involved than first apperances suggest - we
> might want to have a dedicated solution for the generic_setup helper
> only, so we don't break all the other drivers using this function
> directly.
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Thank you, pushed to drm-misc-next.

Any chance you can perhaps take (another) look at:
https://patchwork.freedesktop.org/patch/340140/

? We had an interesting discussion about that which
seems (to me) to end in agreement and you asking for
more documentation. I replied to that that the patch
already added some (but not much) documentation and
then the discussion ended. I would still like to get
this patch upstream, as I have a userspace patch
(for plymouth) pending which depends on it.

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
