Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC134F7B61
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 11:15:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F29010E939;
	Thu,  7 Apr 2022 09:15:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0462710E90C
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 09:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649322950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CmxBb4M+/kdbgcE8GirSAAcAN2ciEIElRp8Y7WJjwMM=;
 b=Cf6+wb09S4d3vn0Kr/YiJVGuCixamPsRLhLrO90hRw1+vvbsN5ADfNfAK6xVMw+sdGeYzh
 zbf9u1S+vMuIXo0g6XOMXNUzZLXI5/0wFCT4hwEmzHK7GNGIvLZWStWYXb7M8QJfo/dfrk
 e8/Qh/4K9sT6gbxjB5ots5x5BgnuJVs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-240-9gHD9hUbNg27iTXmp9cd9g-1; Thu, 07 Apr 2022 05:15:49 -0400
X-MC-Unique: 9gHD9hUbNg27iTXmp9cd9g-1
Received: by mail-wr1-f72.google.com with SMTP id
 v3-20020adf8b43000000b00205e463b017so1071633wra.10
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Apr 2022 02:15:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CmxBb4M+/kdbgcE8GirSAAcAN2ciEIElRp8Y7WJjwMM=;
 b=01MOD6VIhfWbKZbHWnDcC17zBpNYGCITZJ6vyOZLw3Tgm5TSPao5hxI+ffYG9AwMON
 MLW1GWomBIJduvByKlrd6qQdgD61rRO0KrZd+NR15jC0J1EfHLkwwb6Z2IvyMFRNblrD
 XKuSXTYduZEDyQubcORFLqxQOD9A9/TiIvRgkzTeOx2PGEcno/oProVy7Ufw4gfrUB4c
 Y3GucLtYPbyXCvKTcm5cOApjgBiioqSHciQeKVKRFGpVFIaOkoAJLhPSiggLkLHSO5a8
 OVBoRSoIpskCmytaVdcWOEJ4ex7Gkh68BOSOAQg85KxOHpKDoz3c9i6AwAjWH+jUGwb/
 DdTg==
X-Gm-Message-State: AOAM530EokodJIIK7gKxhADdAdecH4nIqQo5NySVgDbNU00v+TOQNsDb
 ADXSxctVaHIUKN1jeNs2xA51oLMKbuHc+kPx9ot6OqyyyR6zOihPHgYm0yX1RTPRLPPgLuIrNg/
 fn0Q/xEXuwtjDTaSLM85sGenZTrSY
X-Received: by 2002:a05:600c:a4b:b0:37b:ea2b:5583 with SMTP id
 c11-20020a05600c0a4b00b0037bea2b5583mr11418264wmq.139.1649322948602; 
 Thu, 07 Apr 2022 02:15:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzR+LYKbt9u3VokYFVPcbGSqCBhtUuOTFAakMiYXEbr6yt5DBwUZeDZJFTJ+SKPtiP285isGg==
X-Received: by 2002:a05:600c:a4b:b0:37b:ea2b:5583 with SMTP id
 c11-20020a05600c0a4b00b0037bea2b5583mr11418242wmq.139.1649322948426; 
 Thu, 07 Apr 2022 02:15:48 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 s10-20020adf978a000000b002060c258514sm11680472wrb.23.2022.04.07.02.15.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Apr 2022 02:15:48 -0700 (PDT)
Message-ID: <31932dda-bfd2-01ca-8ff4-9239ce0b0dd4@redhat.com>
Date: Thu, 7 Apr 2022 11:15:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RESEND RFC PATCH 4/5] fbdev: Fix some race conditions between
 fbmem and sysfb
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Guenter Roeck
 <linux@roeck-us.net>, Helge Deller <deller@gmx.de>,
 Sam Ravnborg <sam@ravnborg.org>, Xiyu Yang <xiyuyang19@fudan.edu.cn>,
 Zhen Lei <thunder.leizhen@huawei.com>, linux-fbdev@vger.kernel.org
References: <20220406213919.600294-1-javierm@redhat.com>
 <20220406213919.600294-5-javierm@redhat.com>
 <Yk6qwiP2kEh2M3Fm@phenom.ffwll.local>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <Yk6qwiP2kEh2M3Fm@phenom.ffwll.local>
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

On 4/7/22 11:11, Daniel Vetter wrote:
> On Wed, Apr 06, 2022 at 11:39:18PM +0200, Javier Martinez Canillas wrote:

[snip]

> 
> Yeah it's disappointing, but no worse than the piles of hacks we have now.
> 
> With the bikesheds addressed above:
>

Agree with all your comments and will address in the next version.
 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>

Thanks for reviewing these patches so quickly!

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

