Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4E852B45D
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 10:08:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D6010E81C;
	Wed, 18 May 2022 08:08:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A7D10E81C
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 08:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652861285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A1O/NWVMqikAFsvvbwsqNK8C5NOaxPS+ve4kqCZxDtg=;
 b=LCSelJwiGPMazK+daGC3z6OIUKVMgxAUL4ujpEIazvPNglp6qJ8cNjxAPAB1+sjf/aXulR
 zZqlTsZZoLseXDQZmgchsQBOdCaYnR/V5KYSOV9HcLHzVNfi0AmrcKDKJGnNZ9XmVaQKJf
 ZoZ0+D+SnzgQeSWnET99o7Vwr5Vb5Dk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-426-IET0g5M7MOO5vbD0DMR07A-1; Wed, 18 May 2022 04:08:02 -0400
X-MC-Unique: IET0g5M7MOO5vbD0DMR07A-1
Received: by mail-wr1-f70.google.com with SMTP id
 p10-20020adfaa0a000000b0020c4829af5fso321367wrd.16
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 01:08:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=A1O/NWVMqikAFsvvbwsqNK8C5NOaxPS+ve4kqCZxDtg=;
 b=eSTcX6k8/7BpleVzDrmwbqHSZsRBbktx9scpFyPusz64DaoQ1ryqlhVMlGQDqsWAY5
 5dULv21Pq3et/+dG6bt+I1wNPNxYgSstvH7jdhj6ZeuQcauQkWtfJnRsFbSiq/9/LKyw
 Cb+huj5t1PA+Izd4iIQhXbb4Whb1JIOn3gykxZwOiqVxbfGYnhKG/4Qn3MGmNRAY7sLz
 ImAkGoewie+0DqdQ3duz96ULwYh3ytxJI4htoOwEhJH+8gTZubF20oYyAtBByettIXhd
 b3TTVqSz8ys2hH73Xy1Cnxr/FJTqq1F6lCySzSF6l4BWOfH3ptqUzn63ecwBYGoaZftn
 jeJw==
X-Gm-Message-State: AOAM533tPTe1slbphCMF/hqikQ0M9cubpilS7g6ObCxh2Fq3HScL3Sc4
 /CN9Z93+DXQzRSS8wyB0v/OCn1sUWLoCTbu0gZyH89plcBOsuZhElp/rMEEutE7MezycRyvsnEk
 ksFhQ3sVlGLp2hT8rS8Dk88e6ttih
X-Received: by 2002:a05:6000:83:b0:20d:9f5:9930 with SMTP id
 m3-20020a056000008300b0020d09f59930mr11046706wrx.10.1652861281036; 
 Wed, 18 May 2022 01:08:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9ucGP5mZcvMW2h1C7n4IwTb6Dvj8aeVsHVENPacM0ZId/+QEPNoP9cA+pdr3xn88L7VbRrA==
X-Received: by 2002:a05:6000:83:b0:20d:9f5:9930 with SMTP id
 m3-20020a056000008300b0020d09f59930mr11046691wrx.10.1652861280830; 
 Wed, 18 May 2022 01:08:00 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l27-20020adfa39b000000b0020c6a524fd5sm1435308wrb.99.2022.05.18.01.07.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 01:08:00 -0700 (PDT)
Message-ID: <70494e73-d919-d9d8-94be-5a69b4d0312f@redhat.com>
Date: Wed, 18 May 2022 10:07:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 3/5] drm/gem-vram: Share code between GEM VRAM's
 _{prepare,cleanup}_fb()
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 noralf@tronnes.org, christian.koenig@amd.com
References: <20220517113327.26919-1-tzimmermann@suse.de>
 <20220517113327.26919-4-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220517113327.26919-4-tzimmermann@suse.de>
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

Hello Thomas,

On 5/17/22 13:33, Thomas Zimmermann wrote:
> The error-recovery code in drm_gem_vram_plane_helper_prepare_fb() is of
> the same pattern as drm_gem_vram_plane_helper_cleanup_fb(). Implement
> both of them using an internal helper. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

