Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6574D20C7
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 19:56:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 333EB10E2FE;
	Tue,  8 Mar 2022 18:56:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A169710E2FE
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 18:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646765810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kjiLkkf7xDfrn30MY8PE4+C9BbuVWl8TzJ7Ra7e8GYQ=;
 b=I/czqNxETksaPVhL+KksoArWsAP8Mqde9nc4DivhQBbOuPyqiicLFx54YjOIh+TsKV7J+d
 PZv2IpqIQQ/4aJiHA92NP+2TDVRhCsP4kprRHUJ0fjsaiLPZHEtWp5m58I7UEnWtaxlo+U
 EwUipAf1U2QBG/DZGAIOEsNb6AqTJfk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-5jvB79JSMgCWrfRYO9M24g-1; Tue, 08 Mar 2022 13:56:49 -0500
X-MC-Unique: 5jvB79JSMgCWrfRYO9M24g-1
Received: by mail-wm1-f72.google.com with SMTP id
 l2-20020a1ced02000000b0038482a47e7eso1524843wmh.5
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 10:56:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kjiLkkf7xDfrn30MY8PE4+C9BbuVWl8TzJ7Ra7e8GYQ=;
 b=8PDfJG6SJXiyJa6J17RfxM6e0TBntYHWWaUg7j/zeUgM7w5KHp2upHUjRP1b4/IQ1t
 pj6HxiVjli4aZxS+ndedUNoko2JUR6NIY1WUITgsFMFz6Nh7y3W/1SBMkKCbD6o3Gk/P
 6EGYaW6jtFg8Tsh31hMnjMrbkIZPWGQOioQfMY4usS7LBHEsvk0UAXKo+jTAUqvLUR60
 6ytUgHaooUf4Zk3qZaJGxc9RUcPW6n9dlEGlUOIs4b2gPvv9htScklBTBxnGiyAdnyPs
 NrpcvdPd+K9ix5xrIYJUOn/cSHMJVzKy+bMVfr98rr/mpOkNbo5PiB29YcCZ3R9qmwV6
 Ygnw==
X-Gm-Message-State: AOAM532aF5X32ZxVQab9EJZwxjdsfJF/t2daRnPLjeyL1G57OjSb7eGe
 dfsNEjMFQz2NQN5u3RES/XpCGV9Dyhil6gzDszL2sRyE1njy4WcgP3oBEO6zRq+I93nccl8TtDe
 tC6H9UBfq4G9iU9NNhzK0E/gpGhI8
X-Received: by 2002:a5d:4089:0:b0:1f0:4819:61ba with SMTP id
 o9-20020a5d4089000000b001f0481961bamr13586841wrp.307.1646765808423; 
 Tue, 08 Mar 2022 10:56:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyii7JCimUU2MPgDsFizZxxW2nHtAnaQCXh6270neK9jP7tByZhvzDFA4sRDDojmjTFNnCEUg==
X-Received: by 2002:a5d:4089:0:b0:1f0:4819:61ba with SMTP id
 o9-20020a5d4089000000b001f0481961bamr13586826wrp.307.1646765808140; 
 Tue, 08 Mar 2022 10:56:48 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 s17-20020adfdb11000000b001f02d5fea43sm15744026wri.98.2022.03.08.10.56.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 10:56:47 -0800 (PST)
Message-ID: <2c02dd69-cb1b-a862-04ed-d9677987bb7e@redhat.com>
Date: Tue, 8 Mar 2022 19:56:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 7/9] drm/fb-helper: Provide fbdev deferred-I/O helpers
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 deller@gmx.de
References: <20220303205839.28484-1-tzimmermann@suse.de>
 <20220303205839.28484-8-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220303205839.28484-8-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/3/22 21:58, Thomas Zimmermann wrote:
> Add drm_fb_helper_vm_page_mkwrite(), a helper to track pages written
> by fbdev userspace. DRM drivers should use this function to implement
> fbdev deferred I/O.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

