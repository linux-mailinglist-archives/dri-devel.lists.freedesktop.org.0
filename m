Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 302A85BACC5
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 13:51:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5747510ECBF;
	Fri, 16 Sep 2022 11:51:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB84510ECE3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 11:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663329103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bU7kCXLJSgLZrxOeLHX/KqgOsD8qkxHVpVMYeFKVWKA=;
 b=UKdsOL/Fh7D1f2/9TV4SYLgGzLVU6zXEViAmoGpMELILhqGQeJ6UfSaeGxqhp68NHcX3Gc
 31t9UZdxJ5omcXs/ertGhOBdszv5l6NRrOn7+HqSYVXSwCa6d4NyCBUSl4vUARSFlZo1RG
 LAQCF4VH0W74hqEnM2yIjUBTPgdcFUg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-25-iUzWrOkKNW-1sxrD4PKooQ-1; Fri, 16 Sep 2022 07:51:42 -0400
X-MC-Unique: iUzWrOkKNW-1sxrD4PKooQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 e18-20020adfa452000000b00228a420c389so5386780wra.16
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 04:51:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=bU7kCXLJSgLZrxOeLHX/KqgOsD8qkxHVpVMYeFKVWKA=;
 b=2hJFi0fXV1TIar85E8plA7pMlUyY7G5EJ39a+3Zdnaog7VxIjYIihDcTkRSsJd1UHU
 UUB8QuYrsty1Kq8/GJY44TkhmGFehFikC6qFbKVQjZiQB75lWbKFO11xfIFyABB4aXEA
 YB7l6oGDmyF3ddqWkHjpTnOp4fmgCzOs0oLe131wvE42S2xW2yh0V55Npjxw4/rnBJPo
 Un9z5ul+E3NoCfIVB6SVZIYkhu2cBFh50zPGIAeABEyjkfyaZHI1fksNDbxP4CfX65XZ
 fmAAVFvEp/jjUsnKCd3TKDq9NMzOvoGTOLvUEL9287Q2bCoiZAfLUXg4hF9b5qRPMV6O
 C5tg==
X-Gm-Message-State: ACrzQf053hZIavNkVnAkHcx/vbPgdyh5IANGXDfxUSVQzVCmE2zVu/kb
 TKXZVOqIi1HK5melwaAQJ4yTCSgUqQhojdFvqvq8AsknNRPAbl0zUFZmg2YDfz2/jp2IQID+SRi
 Gm59uWKEtfiMhf4LoQA+QfVT1m2VU
X-Received: by 2002:a05:600c:1e24:b0:3b4:6c1e:8bb7 with SMTP id
 ay36-20020a05600c1e2400b003b46c1e8bb7mr3211916wmb.1.1663329101266; 
 Fri, 16 Sep 2022 04:51:41 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7aRBJ75LlLwOGHdB7wI38p8BMKPnM0FH/WgnmHmp9FOfuZcOJAWAz1q0E6oPTsuUXGYrcnbg==
X-Received: by 2002:a05:600c:1e24:b0:3b4:6c1e:8bb7 with SMTP id
 ay36-20020a05600c1e2400b003b46c1e8bb7mr3211892wmb.1.1663329101076; 
 Fri, 16 Sep 2022 04:51:41 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n1-20020a1c2701000000b003b3307fb98fsm1973286wmn.24.2022.09.16.04.51.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Sep 2022 04:51:40 -0700 (PDT)
Message-ID: <1bc734be-91e8-9845-66a0-d693d62c9297@redhat.com>
Date: Fri, 16 Sep 2022 13:51:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 2/4] drm/plane: Allocate planes with
 drm_universal_plane_alloc()
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com,
 laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 jyri.sarha@iki.fi, tomba@kernel.org, sam@ravnborg.org
References: <20220909105947.6487-1-tzimmermann@suse.de>
 <20220909105947.6487-3-tzimmermann@suse.de>
 <7080a54e-9e0d-93f4-ecba-150d3af03226@redhat.com>
 <7013378e-9434-d6c6-b777-67af945cb0f8@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <7013378e-9434-d6c6-b777-67af945cb0f8@suse.de>
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
Cc: linux-renesas-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/16/22 13:41, Thomas Zimmermann wrote:

[...]

>>
>>> + * @dev: DRM device
>>> + * @type: the type of the struct which contains struct &drm_plane
>>> + * @member: the name of the &drm_plane within @type
>>> + * @possible_crtcs: bitmask of possible CRTCs
>>> + * @funcs: callbacks for the new plane
>>> + * @formats: array of supported formats (DRM_FORMAT\_\*)
>>> + * @format_count: number of elements in @formats
>>> + * @format_modifiers: array of struct drm_format modifiers terminated by
>>> + *                    DRM_FORMAT_MOD_INVALID
>>> + * @plane_type: type of plane (overlay, primary, cursor)
>>> + * @name: printf style format string for the plane name, or NULL for default name
>>> + *
>>> + * Allocates and initializes a plane object of type @type. The caller
>>> + * is responsible for releasing the allocated memory with kfree().
>>> + *
>>
>> I thought that all the drmm_*_alloc() managed interfaces should use the
>> drmm_k{z,m}alloc() helpers, so that the memory is automatically freed
>> on the last drm_dev_put() call ?
> 
> For new drivers, managed cleanup is preferred. But this is an existing 
> unmanaged cleanup.
> 
> I don't know if drmm_ changes the semantics in unexpected ways (well, 
> probably not). With managed memory releases, I was worried that plane 
> memory might stay around longer than expected. And we'd have to fix the 
> plane-destroy function in each user as well.
> 
> Adding the existing code as a new function is the trivial solution and 
> allows to address each driver individually. Also see my reply to 
> Laurent's question on that topic.
>

Ah, never mind. I misread the function name definition and thought that
you had a drmm_ suffix but, now on second read I see that is only drm_
so just ignore my comment about using managed memory alloc / release.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

