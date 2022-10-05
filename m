Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FC45F5CC0
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 00:33:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13E9710E7B0;
	Wed,  5 Oct 2022 22:33:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A70D10E7B0
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Oct 2022 22:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665009188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+vUhq4r4XyBFUdHgKqV0dej+dlEeKdamNVi2/y0KE7I=;
 b=CF15F6+dutTJcTTCamFpEuYiSf3Epj4Km0bhRFzqz/4l1WFr0Og87q7c09JnoGVWbr1anB
 zfOFbeMuiV+P55ffHJxcxJS2Ro0G7y7Leftoye4dOF2xqJIu47vYzycrCjIdlIF07ZTzol
 6OxRpWhrGYivsDHcZFDYhnX5e52bxSU=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-501-wu263EkZMOSLyyb374Iwgg-1; Wed, 05 Oct 2022 18:33:07 -0400
X-MC-Unique: wu263EkZMOSLyyb374Iwgg-1
Received: by mail-io1-f70.google.com with SMTP id
 a15-20020a6b660f000000b006a0d0794ad1so23373ioc.6
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Oct 2022 15:33:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=+vUhq4r4XyBFUdHgKqV0dej+dlEeKdamNVi2/y0KE7I=;
 b=3V+LsF1XmrKJxcTZ+Ebp+VLd9c9dwLL/aL1DwzXjx0ZDBEOakpmjG7i3TEr2SjQPgP
 PQmzZvobHdZMET/D5uxbqZ292O1QY+v6TjW5LnzJRRIDf61QkLcMfidGty776znjazlc
 /SM+zBgd54pz1lRRN7daoHSP0qpwwWAnnaW30XP4SBgyz7zjoxR6P+qIXacKYESLXIvk
 jea4d4yza9a1PXxRu47IM2KDjOZ2Z8+Du3UpNe3r8uvMjFWBfAAxfvn+zTyt3kfgcHSm
 0m7kk1gmYODmXdotbBjrpSkAaaN44MKknzFBzYqEMNmFbXQhxfIMgdVHfgX9tHC24Ac4
 0EqQ==
X-Gm-Message-State: ACrzQf0O9WdemB+bUduY12Lz97MgJ6XcbKbC8QmWqfN/mSqkml/Kye0c
 L/21norkxfMLeomcrI/eI28484sYk3dWSfizXDFKgEseLxOwSZY3IqnxgKqc3627LqFFJlds282
 3wHwQOmHOh5MHLRG3zNADEAIW2HCo
X-Received: by 2002:a05:6e02:160a:b0:2f9:8a30:c3af with SMTP id
 t10-20020a056e02160a00b002f98a30c3afmr905816ilu.11.1665009187044; 
 Wed, 05 Oct 2022 15:33:07 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7THQAbirZ49N9OGGm9eNgjnxvJVm0Nb3tua0eaaJweHQHZSL7JgG8M5d6J6W+IqmROYUkcMQ==
X-Received: by 2002:a05:6e02:160a:b0:2f9:8a30:c3af with SMTP id
 t10-20020a056e02160a00b002f98a30c3afmr905808ilu.11.1665009186828; 
 Wed, 05 Oct 2022 15:33:06 -0700 (PDT)
Received: from [10.56.18.1] ([140.209.96.154])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a05660213c200b006814fd71117sm7166075iov.12.2022.10.05.15.33.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Oct 2022 15:33:06 -0700 (PDT)
Message-ID: <be0b278f-0c28-fe5b-5179-50c126d52996@redhat.com>
Date: Thu, 6 Oct 2022 00:33:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v2] drm/ssd130x: Iterate over damage clips instead of
 using a merged rect
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20220930152944.2584356-1-javierm@redhat.com>
 <9fdaaae1-982c-92e1-bc61-a6db3e94ef56@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <9fdaaae1-982c-92e1-bc61-a6db3e94ef56@suse.de>
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
Cc: David Airlie <airlied@linux.ie>, Jocelyn Falempe <jfalempe@redhat.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/5/22 19:18, Thomas Zimmermann wrote:
> 
> 
> Am 30.09.22 um 17:29 schrieb Javier Martinez Canillas:
>> The drm_atomic_helper_damage_merged() helper merges all the damage clips
>> into one rectangle. If there are multiple damage clips that aren't close
>> to each other, the resulting rectangle could be quite big.
>>
>> Instead of using that function helper, iterate over all the damage clips
>> and update them one by one.
>>
>> Suggested-by: Jocelyn Falempe <jfalempe@redhat.com>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> 
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> 

Pushed this to drm-misc (drm-misc-next) now. Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

