Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9721046013A
	for <lists+dri-devel@lfdr.de>; Sat, 27 Nov 2021 20:40:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B754F6E192;
	Sat, 27 Nov 2021 19:40:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE35F6E192
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Nov 2021 19:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638042026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t8RNZ9mAJByky9V93E1UlbnnyGphpUak9sPhZ/HMjss=;
 b=Z/QxKa27a/kTcb/k4/tM91xoSdZNuPZuxCp0mjBoAfJ9M95qiGZhPinR//x9p2Z4dmPrQH
 7X9Rk3O2AfNLUu6/xlfWRg1sJB3q4UmLAV3rzvMW1RN8m4wRDSRrKO/r/Iag4pBqfHY6Os
 WzzmztiObr1JxoUtMzeLztxdTituyWE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-487-SRp2kwqWPymLNfQUmd-1Hw-1; Sat, 27 Nov 2021 14:40:25 -0500
X-MC-Unique: SRp2kwqWPymLNfQUmd-1Hw-1
Received: by mail-wr1-f71.google.com with SMTP id
 q7-20020adff507000000b0017d160d35a8so2086592wro.4
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Nov 2021 11:40:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=t8RNZ9mAJByky9V93E1UlbnnyGphpUak9sPhZ/HMjss=;
 b=UvNJ2V3zh4bPFcPcVXOLGAglu8TCJDawHdol9yTsiKok8iw3sq2G92YkH6S219SqO9
 D6n614UlKZSPWI/jKlxCmeL36DSLazltIlY0E3WB/ufNM3MkvDeKV8oamgWVNMssW7Ks
 2U3WKDbhc4mXqJp2kiGix4lirUd1qvTN1rEa1x05fpKhbGV2RfoKgFkWB+CbvfJ50qIe
 sVzm6K18CZwQfUAogRiem6DZSuUc/qc7Kzn2u1+bKQQz87iv5xbFxI6BxJnC9B/Z4OGy
 LMX+7t7WSOqZZ3HzPoQ1pgpPQJTmdHjGvzTt55iAkFmmgRNsg0hmqeH46CVKFLn8mc2Y
 znfw==
X-Gm-Message-State: AOAM530PDlNFmmX5Qte/DlLOAmPOfnktDApsGJMl8RZ12sulU3JVbrD9
 8IhzQA7JZNlV+sDJfd8Xn2yX6IpY7ZdrjW67/+6n2v1miQ5RQ7nA2LTom0kTap33tXYlBl0FTPy
 o0avkJ7hzxxzP6opgTH3NY6RTGmI+
X-Received: by 2002:a05:6000:1862:: with SMTP id
 d2mr23642517wri.251.1638042024319; 
 Sat, 27 Nov 2021 11:40:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyBQ+Tio+oHqcKl0gpxrZuLMQiJF7IdVOaJBN+FhlZqCJLCfE8bPqtMGj4HUuVoO7l1kXNH/g==
X-Received: by 2002:a05:6000:1862:: with SMTP id
 d2mr23642502wri.251.1638042024133; 
 Sat, 27 Nov 2021 11:40:24 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id t8sm9470235wrv.30.2021.11.27.11.40.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Nov 2021 11:40:23 -0800 (PST)
Message-ID: <e3aeb07f-34e6-6ae5-61b1-bb357b0a7aef@redhat.com>
Date: Sat, 27 Nov 2021 20:40:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] drm: Fix build error caused by missing drm_nomodeset.o
To: linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
References: <20211127191910.709356-1-javierm@redhat.com>
 <YaKGeKU7HJOgEu9r@phenom.ffwll.local>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YaKGeKU7HJOgEu9r@phenom.ffwll.local>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/27/21 20:26, Daniel Vetter wrote:
> On Sat, Nov 27, 2021 at 08:19:10PM +0100, Javier Martinez Canillas wrote:
>> The patch for commit ("6a2d2ddf2c34 drm: Move nomodeset kernel parameter
>> to the DRM subsystem") was generated with config 'diff.noprefix true'.
>>
>> But later was applied using 'cat nomodeset.mbox | dim apply-branch' on a
>> machine with 'diff.noprefix false'. And command 'git am --scissors -3' as
> 
> Huh that's a dangerous setting, I guess a dim patch to check for this and
> very loudly complain would be good? Care to type that up?  It's no big
> deal because strange git settings for dim is pretty much a game of
> whack-a-mole, but we should tackle them when they pop up.
>

Sure.

>> used by the dim tool doesn't handle that case well, since the 3-way merge
>> wrongly resolves the path for new file drivers/gpu/drm/drm_nomodeset.c as
>> gpu/drm/drm_nomodeset.c instead.
>>
>> It led to the following build error as reported by the kernel test robot:
>>
>>   make[4]: *** No rule to make target 'drivers/gpu/drm/drm_nomodeset.o', needed by 'drivers/gpu/drm/built-in.a'.
>>
>> Fixes: ("6a2d2ddf2c34 drm: Move nomodeset kernel parameter to the DRM subsystem")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> 
> Build testing before pushing should be done, not the other way round :-)
> 

Yes, sorry about that. I wrongly assumed that the tools would do the correct
thing but I will make sure to build test before pushing in the future.

> Also this is pretty much why we want gitlab CI and real branches.
>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>> ---

Thanks!

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

