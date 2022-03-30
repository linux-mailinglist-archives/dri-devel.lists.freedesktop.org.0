Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 569EB4EBD27
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 11:04:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D88E510F253;
	Wed, 30 Mar 2022 09:04:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BFBB88FC1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 09:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648631060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EK9NB3RMS7T2e1caJQWz9xKzVQkdV5ICfuO65m4ljmU=;
 b=eVPQEjdGkMVLauICEfE4skvf0073SC1ym6y+DUsZp9u79F9ML4ww6AtgC2U9kRVsVQMQzm
 zNUv7BxwotzcHqyaVFsNRl0jdBRVtq9Y6nNqso8v+M6K54Hv2owGRtamIsUzMe3Ahc1L/c
 LPE0PVGV+qPJT6L4R/oiDTU0+TTybU8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-193-sWS2P-rWN9e539-j18URHg-1; Wed, 30 Mar 2022 05:04:19 -0400
X-MC-Unique: sWS2P-rWN9e539-j18URHg-1
Received: by mail-wm1-f71.google.com with SMTP id
 c62-20020a1c3541000000b003815245c642so798834wma.6
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 02:04:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EK9NB3RMS7T2e1caJQWz9xKzVQkdV5ICfuO65m4ljmU=;
 b=yLZNVkOrFLGt2Fh37lBITewKY+Zhp1Emu3oonMjJPwhzskGhAZWRPC22upQsoe+KV9
 A/VCF9JBFmtgShCh1ng66EeUUt1VgTHsbzSEcFRRLOTvGbBEhfbcNFPa8hCfLKgPIecP
 vh0rff6lIA1qLZXTdrQJYXcpBFlxoSyOds9bhGtvm3cNz19hNawuzO0KAqYLnRaBRf4L
 2ZIWbIAdx7LH28+eLIiZ/qDYfB0xKURyD2HO5Z4GEn7H7DOxV0QJzvRHe3DZPkEDkSRt
 Qo78svruTqv5zXBWxZ/J6aSYHpfPRLqNyB2qt3tq7+ZL+Mgd1ogYJOEiCk1suyHmF0Lc
 1wAg==
X-Gm-Message-State: AOAM533k4ozXzwPHxNQhBIIKA/D8yqp7f7ehyPrFdvoHFxnPguXZzGTI
 cFbsE93xYQ6KM+19V5UZaLR12iZmYBvPFlel0kXDaT0XXVBItRc09Y9sIDNDo2w1Bom8gkvXR66
 QVT8ojRHEeP2jvYJu28uNAinV7bVn
X-Received: by 2002:adf:e4c4:0:b0:205:aa07:698e with SMTP id
 v4-20020adfe4c4000000b00205aa07698emr27615112wrm.719.1648631057918; 
 Wed, 30 Mar 2022 02:04:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyldP6pUJjEVWyxaJU/L4fDmcNAaEPy/vWAE9Cq7VkLQ6eOsWIg8f4bnxETM/oEa9gScMzbQ==
X-Received: by 2002:adf:e4c4:0:b0:205:aa07:698e with SMTP id
 v4-20020adfe4c4000000b00205aa07698emr27615102wrm.719.1648631057727; 
 Wed, 30 Mar 2022 02:04:17 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a05600c350900b0038cbcbcf994sm4208106wmq.36.2022.03.30.02.04.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 02:04:17 -0700 (PDT)
Message-ID: <53cbae54-be1a-bd36-b587-d4491a7ece5d@redhat.com>
Date: Wed, 30 Mar 2022 11:04:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/8] drm: Rename dp/ to display/
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jani.nikula@linux.intel.com, lyude@redhat.com
References: <20220322192743.14414-1-tzimmermann@suse.de>
 <20220322192743.14414-3-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220322192743.14414-3-tzimmermann@suse.de>
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

On 3/22/22 20:27, Thomas Zimmermann wrote:
> Rename dp/ to display/ to account for additional display-related
> helpers, such as HDMI. Update all related include statements. No
> functional changes.
> 
> Various drivers, such as i915 and amdgpu, use similar naming scheme
> by putting code for video-output standards into a local display/
> directory. The new directory's name is aligned with that policy.
>

It is really a policy or just a convention ?
 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
> 

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

