Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC4F512CBD
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 09:26:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 060E810E644;
	Thu, 28 Apr 2022 07:26:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7564610E644
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 07:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651130775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Baw5AAynaYZhBtVAECa7lnldNyZZzfbq8GqHK16Ojp4=;
 b=LsplcUAt8VtWc7+PN0rNCoS6r5FW4qE7Hyzz81iTZHPUnJJ53x2l1VlvHauo8l29jok/02
 wWNSUA0KfZTiuzs9aloKivhkBsxWGzkMV21HQ1R/GvuhVCj6W/M69m0zxuOs4quxDB9nx4
 NAvms0Xe+agSIdjJVSxDj/h2Avx6ouM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-674-YhWMuxohNcys8yoIz_UoTA-1; Thu, 28 Apr 2022 03:26:13 -0400
X-MC-Unique: YhWMuxohNcys8yoIz_UoTA-1
Received: by mail-wr1-f69.google.com with SMTP id
 u26-20020adfb21a000000b0020ac48a9aa4so1592370wra.5
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 00:26:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Baw5AAynaYZhBtVAECa7lnldNyZZzfbq8GqHK16Ojp4=;
 b=QhgiwV6LBC0SrHn6Mxxg3E/ew+JOPcMWuL/T1mjzyFjOLOqH0is40lxfZilGhOwJTk
 eU/N/3fYGPlF9lR65XywUjTpW+/bSVC4sufANP0LZWbo/u6D9IleAcJMkyLF3n3tHlpv
 yA+EyVBC48GZ4qZJzta2I/kWrzDyQsz17xoiXKegJQcQnyoFXWQErOpzTHlNcAgT5cai
 rz/IZk6G2dKLSvHAvcEcgREMOoRx25MBs5eKmdPGDdeaogBGMLs4ke9s/lQD7ICQhJUc
 9oLPxVOFomgkhzx3HOF0l2HgZ45Bbf+91kUmPrMTdmKCAB63GzwNZPD12wpEuJsU0db5
 bJuw==
X-Gm-Message-State: AOAM532jPzr3z2nmKPbFNQR/mpl+hi50XgoSQoc+oq74ZUvvl6edf7ta
 xyztP4Up/s9p+WxcoKa+nE4dFgKdeH6WEyhsurrosZVeWPEUIn3QcYt+eTYp6xhz40ykIPk9WQg
 O3+WE+OceRVz5NGKUyJOd+V3x9Pix
X-Received: by 2002:a7b:c8d5:0:b0:392:b12e:fd11 with SMTP id
 f21-20020a7bc8d5000000b00392b12efd11mr29610294wml.96.1651130772053; 
 Thu, 28 Apr 2022 00:26:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNXR7aPjPClAeL9yVwShDBwTTCIJfhAL5A0u1ugWtOkmKMV1lDCAZ9Yu5Tgd4bZgKDo6E2Qg==
X-Received: by 2002:a7b:c8d5:0:b0:392:b12e:fd11 with SMTP id
 f21-20020a7bc8d5000000b00392b12efd11mr29610274wml.96.1651130771783; 
 Thu, 28 Apr 2022 00:26:11 -0700 (PDT)
Received: from [192.168.1.129] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 u4-20020a5d6da4000000b0020a8c8d3e00sm16226202wrs.73.2022.04.28.00.26.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 00:26:11 -0700 (PDT)
Message-ID: <6f3b8d37-0a70-a035-e87b-5aa72926fff9@redhat.com>
Date: Thu, 28 Apr 2022 09:26:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] drm/display: Select DP helper for DRM_DP_AUX_CHARDEV
 and DRM_DP_CEC
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20220427215528.237861-1-javierm@redhat.com>
 <46446e78-60a6-1b8c-1bb6-1c005489d58c@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <46446e78-60a6-1b8c-1bb6-1c005489d58c@suse.de>
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

Hello Thomas,

Thanks for your feedback.

On 4/28/22 09:02, Thomas Zimmermann wrote:

[snip]

>> Changes in v2:
>> - Explain better the issue in the change description.
>> - Only select DRM_DISPLAY_DP_HELPER and not DRM_DISPLAY_HELPER.
>>
>>   drivers/gpu/drm/display/Kconfig | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
>> index f84f1b0cd23f..9fe80c4e555c 100644
>> --- a/drivers/gpu/drm/display/Kconfig
>> +++ b/drivers/gpu/drm/display/Kconfig
>> @@ -32,6 +32,7 @@ config DRM_DISPLAY_HDMI_HELPER
>>   config DRM_DP_AUX_CHARDEV
>>   	bool "DRM DP AUX Interface"
>>   	depends on DRM
>> +	select DRM_DISPLAY_DP_HELPER
> 
> You cannot select DISPLAY_DP_HELPER without DISPLAY_HELPER.
>

That was my original thought as well and what did in v1, but then I noticed
that doing that it would force DRM_DISPLAY_HELPER to be set as built-in and
not allow to be built as a module.
 
> Can't you simply make it depend on DISPLAY_DP_HELPER.  The menu entry 
> will show up as soon as there's a driver that selcets DISPLAY_DP_HELPER.
>

I could but then that means that once won't be able to select these two config
options unless some enable symbol selects DRM_DISPLAY_DP_HELPER.

In my opinion, DRM_DP_AUX_CHARDEV and DRM_DP_CEC are different than all other
options that select DRM_DISPLAY_DP_HELPER, since those are drivers and want to
have both DRM_DISPLAY_DP_HELPER and DRM_DISPLAY_HELPER set.

But DRM_DP_AUX_CHARDEV and DRM_DP_CEC are just included in drm_display_helper.o
if enabled, and depend on symbols that are present if CONFIG_DRM_DISPLAY_DP_HELPER
is enabled. So just need the latter, if DRM_DISPLAY_HELPER is not enabled then it
will just be a no-op.

Having written that though I noticed that a "depends on DRM_DISPLAY_HELPER" makes
sense. If you agree I can add it and post a v3.

Now, pondering more about this issue, probably the most correct thing to do is for
the drivers that make use of the symbols exported by DRM_DP_{AUX_CHARDEV,CEC} to
select these. What do you think ?
 -- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

