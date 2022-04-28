Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A815512D63
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 09:53:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE15010ECD2;
	Thu, 28 Apr 2022 07:53:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77C9410ECC1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 07:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651132376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fwpLwYRRl15FISsOjXyGpPG6h0phY4GTTlpFR9suoQg=;
 b=NN6yJnvM33yuTekllCPuiQonV9kJ7Vv0amFz3Vam8gok+/u6gEpzVETXKwJ/qq+fxxzivo
 ZwFl3NkXul6AvaDLpVoPFRCFzT+9q9Gx5BEJtSujo9cleHxShCLj8bBbk6DD7rm8hFFZji
 goK9PaP2Uu+nj8OR89K8md40tXgqozU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-78-uIOSGdE3MT-Yp6WeZVmmgQ-1; Thu, 28 Apr 2022 03:52:55 -0400
X-MC-Unique: uIOSGdE3MT-Yp6WeZVmmgQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 t15-20020adfdc0f000000b001ef93643476so1611415wri.2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 00:52:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fwpLwYRRl15FISsOjXyGpPG6h0phY4GTTlpFR9suoQg=;
 b=y700QK22P7AIxhxzlD5RwImXo5cJlHQNIkd3+ZwrhxhaEEx2Jpuz3vtpzRLQlnwmcN
 VQN2of5HCdqfub19SzNzKH9Gh+suZD4A4YQ7eZ1oQix6VMk7bj6IZ8XGy3++N04H+W9w
 S0+dJe8sAdTT3wiq1XLQLL+Y7famcO7mUl11oDocHF9tdqUXmujLKSnc7VaG23M0ea7r
 UnU4BlLWFyzEwZFl2sC3QPFXUSdyA+kEDkLW3TNkKxHfDuaHMT9LRuEblj7UwzuCTWaw
 LAjVWse+MvSGftazmuJCb+fD3EM84CP0qiP6CIPRg1gvXDRh+HEzA2EW6DNLtNtsbLNN
 iS8w==
X-Gm-Message-State: AOAM530YRwU1KH1qv/08kpdyPctgB5mg+XwS9iEQy/22FHohHdOWMGjB
 tSHcp1zISLfMh3+JHwrrBAuVyMWDwmGIyuxhZEPkGSNK12d+5e/q4syCRhst+hZSAE+w1LXUnh3
 9Zp2dAl7gv1Pc21QoBi1uTY1EhTwc
X-Received: by 2002:adf:db05:0:b0:20a:dbf1:fdf8 with SMTP id
 s5-20020adfdb05000000b0020adbf1fdf8mr14784251wri.404.1651132374000; 
 Thu, 28 Apr 2022 00:52:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4nP57a8g94sEy+weZhg736sd16pvG88YCpRY4VbB3lBBzq0jKK+zIIYv2kWADbstM5n+KNA==
X-Received: by 2002:adf:db05:0:b0:20a:dbf1:fdf8 with SMTP id
 s5-20020adfdb05000000b0020adbf1fdf8mr14784239wri.404.1651132373697; 
 Thu, 28 Apr 2022 00:52:53 -0700 (PDT)
Received: from [192.168.1.129] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 17-20020a05600c021100b00393faf12859sm3826617wmi.18.2022.04.28.00.52.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 00:52:53 -0700 (PDT)
Message-ID: <1d456654-6d06-ef35-b9a0-519db7d5b35e@redhat.com>
Date: Thu, 28 Apr 2022 09:52:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] drm/display: Select DP helper for DRM_DP_AUX_CHARDEV
 and DRM_DP_CEC
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20220427215528.237861-1-javierm@redhat.com>
 <46446e78-60a6-1b8c-1bb6-1c005489d58c@suse.de>
 <6f3b8d37-0a70-a035-e87b-5aa72926fff9@redhat.com>
 <af31d343-202b-ffaa-c6a9-b20247938dfd@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <af31d343-202b-ffaa-c6a9-b20247938dfd@suse.de>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/28/22 09:45, Thomas Zimmermann wrote:

[snip]

>>> You cannot select DISPLAY_DP_HELPER without DISPLAY_HELPER.
>>>
>>
>> That was my original thought as well and what did in v1, but then I noticed
>> that doing that it would force DRM_DISPLAY_HELPER to be set as built-in and
>> not allow to be built as a module.
> 
> It was a rhetorical only. I didn't mean to actually set DISPLAY_HELPER.
> 

Ah, sorry for misunderstanding.

>>   
>>> Can't you simply make it depend on DISPLAY_DP_HELPER.  The menu entry
>>> will show up as soon as there's a driver that selcets DISPLAY_DP_HELPER.
>>>
>>
>> I could but then that means that once won't be able to select these two config
>> options unless some enable symbol selects DRM_DISPLAY_DP_HELPER.
>>
>> In my opinion, DRM_DP_AUX_CHARDEV and DRM_DP_CEC are different than all other
>> options that select DRM_DISPLAY_DP_HELPER, since those are drivers and want to
>> have both DRM_DISPLAY_DP_HELPER and DRM_DISPLAY_HELPER set.
>>
>> But DRM_DP_AUX_CHARDEV and DRM_DP_CEC are just included in drm_display_helper.o
>> if enabled, and depend on symbols that are present if CONFIG_DRM_DISPLAY_DP_HELPER
>> is enabled. So just need the latter, if DRM_DISPLAY_HELPER is not enabled then it
>> will just be a no-op.
>>
>> Having written that though I noticed that a "depends on DRM_DISPLAY_HELPER" makes
>> sense. If you agree I can add it and post a v3.
> 
> Yes please.  These options enable features of the DP code. If there's no 
> driver with DP, it doesn't make sense to allow them.
> 
> I know that there could be an odd situation where userspace might not 
> have DP, but still wants the chardev file of aux bus.  But that 
> situation existed already when the code was located within KMS helpers.
> 

Agreed.

>>
>> Now, pondering more about this issue, probably the most correct thing to do is for
>> the drivers that make use of the symbols exported by DRM_DP_{AUX_CHARDEV,CEC} to
>> select these. What do you think ?
> 
> That's not considered good style. Select should not be used for anything 
> that is user-configurable. [1]
>

Right. So giving even more thought to this, now I think that we should just include
drm_dp_aux_dev.o, drm_dp_cec.o (and probably drm_dp_aux_bus.o?) unconditionally to
drm_display_helper-$(CONFIG_DRM_DISPLAY_DP_HELPER).

After all, these are not big objects and drm_display_helper can now be built as module.

I don't see that much value to have separate user-configurable config options...

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

