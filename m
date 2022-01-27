Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CA249DFDB
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 11:50:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A31710E6FD;
	Thu, 27 Jan 2022 10:50:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B9810EC6F
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 10:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643280634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Fc2g7RRS/5veLFVlWFZ0JAd/TstB7ATk2nJ8PQ8WRQ=;
 b=UlvpXpx05pvPchp+N4NPNPe2UrL++dLTSQb1uFaxY7K3mvnOsoYcU5wEZfWkEwqxzzPNMJ
 hySb+psTPy2muENK8Fdy81BmKEnC2qzrnmgQOPm90KIcP5XCBKdoINBXgsjDFIjq0sL2FF
 gQmJiTDxTsSf7pPneYmU7+6rVyE1n7Y=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-DIpU-89CNROWEdzwE4ZT0Q-1; Thu, 27 Jan 2022 05:50:33 -0500
X-MC-Unique: DIpU-89CNROWEdzwE4ZT0Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 g17-20020adfa591000000b001da86c91c22so932230wrc.5
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 02:50:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6Fc2g7RRS/5veLFVlWFZ0JAd/TstB7ATk2nJ8PQ8WRQ=;
 b=LZ3UMl/YgOow16qZ/oevmPTA1wd6UsOK3ffl101myDTS/PUjVMQMPilf7NGaE4KVWf
 uL/5+imTRTlKClx1yMCrx4Bp7/gY2oeGLJh6qMEUAABkopOL7k/9vVaU9Uer/QHGJhgu
 XY5ioJFxzKCJAEthG30zAMh9ymPyTLuh0hpQB2NnicSdIOiLCdHySzNNxfGXQ/Etr8wt
 +JJ7rVccKQ6BbH1p0OXqZuVBYM2a1JXxR2sKNNmqDt8qE0zNS9f5ppEMuUbTCYTkCHOy
 VI0h/sAwYDnDodf+Ckvx6PxhSP6L4P3JFWnVDCGGEzUIcHmeg2uN1LELi6jlFjKroJ5y
 pyPg==
X-Gm-Message-State: AOAM533RkR3H40RLZj0R6vy0pbVlIx53j+QMNpjtmRw7GMpdd5I4Mp7T
 BjFOrLukM0pEwjLgw7dsG/I9QuTI2OclO8QrRT5+CZiBr8n7Xap6M+IHpxu1tQF60ODjsKpLM9j
 aWrHhZMMYhwKycXKUCC1iN7XpK1nQ
X-Received: by 2002:a05:6000:1acc:: with SMTP id
 i12mr2636059wry.492.1643280632296; 
 Thu, 27 Jan 2022 02:50:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzNH0Darpnr4Jl3HYou3CgHI6hafBenm/U34TNRMyZ82WXc0eLk9f+p/4dPBzISBOZBPFknQw==
X-Received: by 2002:a05:6000:1acc:: with SMTP id
 i12mr2636048wry.492.1643280632126; 
 Thu, 27 Jan 2022 02:50:32 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id b11sm5331007wmq.46.2022.01.27.02.50.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 02:50:31 -0800 (PST)
Message-ID: <b305cb36-1a09-c990-a3e6-98d420c62e3a@redhat.com>
Date: Thu, 27 Jan 2022 11:50:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/doc: Add section in the introduction page about
 learning material
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20220127082058.434421-1-javierm@redhat.com>
 <c99a7784-7ac4-e305-1a06-dfb514a409ff@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <c99a7784-7ac4-e305-1a06-dfb514a409ff@suse.de>
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
Cc: linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pekka Paalanen <pekka.paalanen@collabora.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 1/27/22 10:18, Thomas Zimmermann wrote:
> Hi Javier,
> 
> thanks for this patch.
> 
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>

Thanks!
 
> Find some ideas for consideration below.
> 

[snip]

>> +
>> +Learning material
>> +=================
> 
> Maybe 'External References'.
>

Agreed, I'll change it.

>> +
>> +Since the Linux DRM layer supports complex graphics devices, it can be quite
>> +overwhelming for newcomers to get familiar with all the needed concepts and
>> +learn the subsystem's internals.
> 
> It sounds a bit intimdating to me. Can we give it a positive spin?
>

Pekka also had reservations about this paragraph, so I think that will just
drop it. The goal of having this section was to ease the learning curve but
the way I worded it may reinforce the perception that DRM is hard to learn.

> IMHO we could add a separate section that talks about complexity and 
> provides guidelines about how to deal with it:  trivial HW? use simple 
> pipe;  dedicated VRAM? try TTM;  awkward color formats?  see 
> drm_format_helper.c
>

Indeed. And we can add such section as a follow-up. Maybe referring to some
of the drivers in drivers/gpu/drm/tiny.

Best regards, -- 
Javier Martinez Canillas
Linux Engineering
Red Hat

