Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A2663ED17
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 10:58:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2472910E012;
	Thu,  1 Dec 2022 09:57:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0E6B10E012
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 09:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669888674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OGHVTdg3SoZQzyqSyH7FHa7DVwQuhBkBXIZEfP8aX0U=;
 b=E2WD/kNEiQR78j6jOApXnuo+6hh3OT/S+QvR+8qSjRA0vQn5tulM6aKD4cWFU/evxHaOIF
 KuBTg0DJGcS/E8nhOIVfr+tUbCaPdL5a3pYTByGZulgz93nwMfutp4DQjkYQGRgN3jYFLb
 r9NrVS8CC0kzBYLwvpBo1IQ1hpb0X/Q=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-410-DXImFynLPDOhp5gabjNhlg-1; Thu, 01 Dec 2022 04:57:53 -0500
X-MC-Unique: DXImFynLPDOhp5gabjNhlg-1
Received: by mail-wm1-f69.google.com with SMTP id
 f18-20020a7bcd12000000b003d077f0e3e5so481594wmj.7
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Dec 2022 01:57:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OGHVTdg3SoZQzyqSyH7FHa7DVwQuhBkBXIZEfP8aX0U=;
 b=hM0xjwY9YAdWhCF6UzrXijUc1OptnD0wnc/rKXrewTUjS+fJXO5vZj841NKpJ6Zype
 hlMwR7mwWgqFDYtJXIWaD6b+yZl7BvhfItXtgy/TEL+/j8FrgLRLvIO4myGkGs867J2c
 Nb7S3W+r6Yj86MFVZkzFXj7DZsclKsuQzNsAf0zlR2hdISr1xUQIxSJFUh9zNlBCAOMb
 t/p+dI0a/U6064YQ8rlGtcu5fGvz/GlIdhWCij5nS7tB1W4Fn0lSmgmplA087XEPc6eZ
 2c91yXPmcVK/EtIvkqQB50LE7uHjs1c/z2lXBorA/xL0FX49G1a/pAFTbd/etbNjXn6Z
 K2QQ==
X-Gm-Message-State: ANoB5pmkabEYGh93eU+NNNeeDQmASgyTril0alskpaV5kEZEnE5XINpo
 i1gbeRUgsbPCgKce+ZsZghwtXlQD26UsdizfFBSHsfENfKTTNjsxWAvACIE8ZX0gMuwsNBRqoHC
 BCR0TINVmk+/meDIpylyUIFztGrIq
X-Received: by 2002:a05:600c:15c5:b0:3d0:7909:c363 with SMTP id
 v5-20020a05600c15c500b003d07909c363mr2770229wmf.122.1669888672068; 
 Thu, 01 Dec 2022 01:57:52 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7feImdOzlzzj8l2JuUofUKcU15UeFe0qJmBfmfVQGc3cSLYfhYl2jtTPP2Y97cFh3BLK6Lfw==
X-Received: by 2002:a05:600c:15c5:b0:3d0:7909:c363 with SMTP id
 v5-20020a05600c15c500b003d07909c363mr2770214wmf.122.1669888671878; 
 Thu, 01 Dec 2022 01:57:51 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c124-20020a1c3582000000b003cf894dbc4fsm4759431wma.25.2022.12.01.01.57.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Dec 2022 01:57:50 -0800 (PST)
Message-ID: <7316d65d-53e9-906d-9ba7-272a56c1e211@redhat.com>
Date: Thu, 1 Dec 2022 10:57:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] drm/tests: probe_helper: Fix unitialized variable
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20221201090736.290935-1-maxime@cerno.tech>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221201090736.290935-1-maxime@cerno.tech>
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
Cc: kernel test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/1/22 10:07, Maxime Ripard wrote:
> The len variable is used while uninitialized. Initialize it.
> 
> Fixes: 1e4a91db109f ("drm/probe-helper: Provide a TV get_modes helper")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/tests/drm_probe_helper_test.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/tests/drm_probe_helper_test.c b/drivers/gpu/drm/tests/drm_probe_helper_test.c
> index 7e938258c742..211131405500 100644
> --- a/drivers/gpu/drm/tests/drm_probe_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_probe_helper_test.c
> @@ -115,6 +115,7 @@ drm_test_connector_helper_tv_get_modes_check(struct kunit *test)
>  	ret = drm_connector_helper_tv_get_modes(connector);
>  	KUNIT_EXPECT_EQ(test, ret, params->num_expected_modes);
>  
> +	len = 0;

I would probably do `size_t len = 0;` instead but don't have a strong opinion.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

