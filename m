Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1021E561505
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 10:27:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 649471133C0;
	Thu, 30 Jun 2022 08:27:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69B311133C0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 08:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656577654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XHG056//hHAI/tlIlnTC0eVR2KVYHYPe7tqFy96UaRc=;
 b=L7Cxicyw/j95SHfad9+h4wM5UYyObwHJhg/b4UZVOhvOCWc1lNn013UgdfzFR4LUGOq/8o
 x4mG5NFEDmQlsuEqZVR5dcEjV2s93fQcuyuR2mVTeZ6ML4KoBWdesbLH419syVWrLAWf1l
 ro7+W3GLtu295ObFOis1HsR4vGWVlDI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-PFnJPpGwMFu6DH9WU895kw-1; Thu, 30 Jun 2022 04:27:33 -0400
X-MC-Unique: PFnJPpGwMFu6DH9WU895kw-1
Received: by mail-wm1-f69.google.com with SMTP id
 r132-20020a1c448a000000b003a02a3f0beeso1081998wma.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 01:27:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XHG056//hHAI/tlIlnTC0eVR2KVYHYPe7tqFy96UaRc=;
 b=n3Vl4dQVIEIO8X7gjlnsMCuE3aaYkiVGXGiF+2+FG6OJEEultbzc0+eLboCWZEeF0q
 5RsDXeaiAYYuFGeUhrI2Kqc4g9OqAzX28p0Y2fnijOzCvyw6D815lXQbmW3eqK4VJFmT
 hU8MwRBVmzIXdj520Ms5cLzLKs5FmwYq+m9EjK/txUfZp7acgfeITdBuSzsANUpTWA3d
 AsP9R3N10LocmEWYgQNa6yk02GLmsHPTT0xgTdmT4zrj/CqyjQklgyWdTaXi1pYOu7C4
 t4v5Z3xzd184t5V8XxMS2j4sb8wllAPMjb1r6qP0gknXAwpm5mCx29YGsEYkGniv3h49
 yGlw==
X-Gm-Message-State: AJIora/34nXMYEKQX1Djpq0bRRotkDyTd3weNzjuNEXIYYWz5CwyxBv5
 0SRFTjhUIOgjS3WoT1/tmaT/snbvGxf+OJWXjnjUtsUMNJYr5nEmJDd0+kPL6zLlBocqIqDyp9k
 MdYnZaRZuAtJdnTIzgMZkyp99ju7b
X-Received: by 2002:a05:6000:1789:b0:21d:256e:eb03 with SMTP id
 e9-20020a056000178900b0021d256eeb03mr7091744wrg.352.1656577651961; 
 Thu, 30 Jun 2022 01:27:31 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sbyHuDcjcQ21EkUtXcYlcAQD6F9bAQqCitRu14OxTTOIIHVCFDmUp/c8Uep1gRcfCbZZWIOg==
X-Received: by 2002:a05:6000:1789:b0:21d:256e:eb03 with SMTP id
 e9-20020a056000178900b0021d256eeb03mr7091713wrg.352.1656577651690; 
 Thu, 30 Jun 2022 01:27:31 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c7-20020adffb07000000b0021b98d73a4esm18889612wrr.114.2022.06.30.01.27.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jun 2022 01:27:31 -0700 (PDT)
Message-ID: <37f8a89f-0dd8-8908-550d-3cbfd359bfc2@redhat.com>
Date: Thu, 30 Jun 2022 10:27:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 00/28] OpenChrome DRM for Linux 5.20
To: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
References: <20220624202633.3978-1-kevinbrace@gmx.com>
 <dacc0636-d307-3f2f-260d-09208a0dd9c1@suse.de>
 <Yroh0fe4Fzqgam3W@ravnborg.org>
 <58475858-cc98-0aab-d248-f3473b179fab@suse.de>
 <6de4f449-bd4a-48ec-974b-8ace58947b70@redhat.com>
 <dae59187-a055-2699-bee1-c066b69627b0@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <dae59187-a055-2699-bee1-c066b69627b0@suse.de>
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
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>,
 dri-devel@lists.freedesktop.org, Kevin Brace <kevinbrace@gmx.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 6/30/22 10:19, Thomas Zimmermann wrote:

[snip]

>>
>> And the directory could only be sourced from Kconfig when CONFIG_DRM_LEGACY
>> is enabled and make it default to n. If in a few of releases nobody complains
>> then the whole directory could be removed.
>>
> 
> That seems a lot of work for simply removing something. And I'm sure 
> that people will only complain after legacy/via got removed.
> 
> If we want to separate code for the old and new VIA driver, let's put 
> the new code into  unichrome/ and be done with it.
>

I believe that there's value in having all the legacy drivers in a single
directory rather than having them scattered all across the subsystem. But
don't have a strong opinion either. I just wanted to share my thoughts.
 
> Best regards
> Thomas
> 
> 

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

