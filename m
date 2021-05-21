Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECA238CBEE
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 19:18:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 172AB6E4CF;
	Fri, 21 May 2021 17:18:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AF336E4CF
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 17:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621617518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CZxY6gPOjujl6azNJ5rnxxGSboX/vJcO0KuSjkOnGMY=;
 b=ahe3polRC6unwsHcTipn7/rWLHZ9j67LIh31AVs2oCclDx/0jKUxmNZPvvbJQ/vKuNN56K
 0AtlJ3A7/GI7FsXwOM1GZd+FnNNtVtuSPOVVb0mjD+3bHvx3R8WUvch5v2NabrRXp3aRE0
 sys43VybMJSyDKIlwhR9hEfmbHdcm+4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-CkZgbPKkNn2NurT5ZhfKlg-1; Fri, 21 May 2021 13:18:36 -0400
X-MC-Unique: CkZgbPKkNn2NurT5ZhfKlg-1
Received: by mail-wm1-f71.google.com with SMTP id
 129-20020a1c02870000b0290176ef5297e3so4312904wmc.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 10:18:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CZxY6gPOjujl6azNJ5rnxxGSboX/vJcO0KuSjkOnGMY=;
 b=AT9VNVom8VKcRmxuLWPSUrjTsP1xyHhAaaUkxgaU6/du4Z4DBQGH3fr5xq9GGxfsCd
 7y34eQuxLEKT0y5qBdHN4mM+ztna2ds3cxlq5NEhoads/qC9TmRnbUoqRbGpEGgsjKjU
 zYVhof5X/+FoNwJaxhZlQPqqyhap8dpUqbhh5BvtREdPGJTnjxmG1fhDEfPnRmqNvKly
 i1qt5hI7b9MJ7uOTsiMfoVC9xlblnvafuGQgDW+KXKz8mP5YzYkYJJI6rSQossEHNUh2
 bihCtf7Zh4IdHF4bB2eYA2OhYmvjM+hUqrf5HOrOrug3ddog+kdxjI/6R1Z6WbjwXEn8
 jgmA==
X-Gm-Message-State: AOAM533FPd9lwMOjzBLHt5J7cd1b/DRH73wrKDAbzqT1hEtBW1HcJpLE
 HGMT3Br3Jn9lAozRwTptGpIrQ0JlUj7opWnFU4K1HhqJt1OWb1pA70MRw0vfwKPlfoEE+/sbtsf
 RnGrLQT2EranfMa2eHs+OcZT4I1sHQ6lpbyFq94+0tSqqbPczyVY8gixGhWA1KaD7jhO1h1qQ0b
 xv38w=
X-Received: by 2002:a1c:7313:: with SMTP id d19mr9774072wmb.14.1621617514843; 
 Fri, 21 May 2021 10:18:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZyQtu9iEGMpJ0S3a0JWqqR0byevLKia/IKV/16dxFDBFhV9cKNPQxR/LHh0d9mGj4x1h9Pg==
X-Received: by 2002:a1c:7313:: with SMTP id d19mr9774041wmb.14.1621617514584; 
 Fri, 21 May 2021 10:18:34 -0700 (PDT)
Received: from [192.168.1.101] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id o11sm2821711wrq.93.2021.05.21.10.18.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 May 2021 10:18:34 -0700 (PDT)
Subject: Re: [PATCH] drm/fb-helper: improve DRM fbdev emulation device names
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Peter Robinson <pbrobinson@gmail.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
References: <20210521131910.3000689-1-javierm@redhat.com>
 <YKfS2GDCXPJ/q8gT@phenom.ffwll.local>
 <3a6f9235-5375-b2cb-2d63-a47c5f9752bb@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
Message-ID: <bfd6fa47-497a-64bc-c2fc-a081bd41d5ec@redhat.com>
Date: Fri, 21 May 2021 19:18:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <3a6f9235-5375-b2cb-2d63-a47c5f9752bb@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

On 5/21/21 6:53 PM, Thomas Zimmermann wrote:

[snip]

>>
>> So what with all the drivers which do _not_ have drm in their name? Also
>> I'm never sure how much these are uapi or not ...
>

That someone could threat as an uapi is a fair point indeed.
 
> Why do we need a suffix anyway?
> 

Yes, I thought the same and was torn about posting a patch to just remove
the suffix. I don't think users care that much if is a fb device from a
fbdev driver or a DRM driver using the fbdev emulation.

>> -Daniel
>>

Best regards,
-- 
Javier Martinez Canillas
Software Engineer
New Platform Technologies Enablement team
RHEL Engineering

