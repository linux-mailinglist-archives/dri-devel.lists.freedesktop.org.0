Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C90A492E09
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 20:00:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D62210E43D;
	Tue, 18 Jan 2022 19:00:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2236410E4DB
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 19:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642532419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3L786VdHb7jzEuUgQYqOh5SVXdHks5akSmwjq1fQ6HA=;
 b=CqSSLuB/deo/epYDZSrl1H0P9XraFaDk6bGJhy4ZH8e44lfSpagiKteesC21Trq+KwBKRV
 j3F7tel2I0D5MlBfDhHM2TAyaEw2Y/3zcK5KxMWl1BXGP+mSjuZ4UNc+9Jo+omTOU64nNF
 kNyDI92lL3FqgYsgzdYNxo1hBXq2apk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-34-CVb_tR8jPk2GejDZUOPSJg-1; Tue, 18 Jan 2022 14:00:15 -0500
X-MC-Unique: CVb_tR8jPk2GejDZUOPSJg-1
Received: by mail-wm1-f70.google.com with SMTP id
 bg16-20020a05600c3c9000b0034bea12c043so2480787wmb.7
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 11:00:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3L786VdHb7jzEuUgQYqOh5SVXdHks5akSmwjq1fQ6HA=;
 b=exRNrLsoFlAUyT5UDoxLAsMmmvzrc/I/b/roXGtG7GfouDb3Pr3AVFqDhoDfa/w2fg
 uq5THzosSQgt/TsnDzPXv0DbyPgxIxtSQ2aDNg7JaMI83lKkLmOvPDR3evgHtlJPqeSq
 h00gm4QvUIKjfDBmX3n2CtY+21f07aKu6DZ3BvLUL2MnDqnga8j4wXk64+RLq7cL+tl1
 +IirYhsEgkjz3vKQ1wmDwoq2hRp8aCoTXfVgLy0yElEwBi9R6n6HOM02o/7nQThGztcU
 GQVJd60SLqnZXkSvWCCtA3Ca00qlwze/mtlpfaOEMzHdSp9guUju1dbmCjpgkb5Kk9Lv
 R0DQ==
X-Gm-Message-State: AOAM530zUHTN01eeo8CX8bB4v5vg7pcqGrowMY8o1zlhnYxy970NFoN1
 O3/qDHAQvZKHLQ/qRN2FK9avEVmHRKFKFrsKP3lkzMmPPd3XRdFqRzgD0m4TYOgjtg29Tn52wxv
 HwKiYSax/w6KYFPGzkKd2uHRcODmR
X-Received: by 2002:a5d:64e3:: with SMTP id g3mr13109098wri.450.1642532414445; 
 Tue, 18 Jan 2022 11:00:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyQMjevWFmDnMSNPtcO0MVjLlxRtAJh85PUR+OA7yNXYiLwmX95uE7hoiVGvVFiXlrSwzbnjQ==
X-Received: by 2002:a5d:64e3:: with SMTP id g3mr13109083wri.450.1642532414215; 
 Tue, 18 Jan 2022 11:00:14 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o15sm3386819wms.11.2022.01.18.11.00.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 11:00:13 -0800 (PST)
Message-ID: <1c177e79-d28a-e896-08ec-3cd4cd2fb823@redhat.com>
Date: Tue, 18 Jan 2022 20:00:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] drm/vmwgfx: Stop requesting the pci regions
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
References: <20220117180359.18114-1-zack@kde.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220117180359.18114-1-zack@kde.org>
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
Cc: krastevm@vmware.com, mombasawalam@vmware.com, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Zack,

On 1/17/22 19:03, Zack Rusin wrote:
> From: Zack Rusin <zackr@vmware.com>
> 
> When sysfb_simple is enabled loading vmwgfx fails because the regions
> are held by the platform. In that case remove_conflicting*_framebuffers
> only removes the simplefb but not the regions held by sysfb.
>

Indeed, that's an issue. I wonder if we should drop the IORESOURCE_BUSY
flag from the memory resource added to the "simple-framebuffer" device ?

In fact, maybe in sysfb_create_simplefb() shouldn't even attempt to claim
a memory resource and just register the platform device with no resources ?
 
> Like the other drm drivers we need to stop requesting all the pci regions
> to let the driver load with platform code enabled.
> This allows vmwgfx to load correctly on systems with sysfb_simple enabled.
>

I read this very interesting thread from two years ago:

https://lkml.org/lkml/2020/11/5/248

Maybe is worth mentioning in the commit message what Daniel said there,
that is that only a few DRM drivers request explicitly the PCI regions
and the only reliable approach is for bus drivers to claim these.

In other words, removing the pci_request_regions() seems to have merit
on its own.

> Signed-off-by: Zack Rusin <zackr@vmware.com>
> Fixes: 523375c943e5 ("drm/vmwgfx: Port vmwgfx to arm64")
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org>
> Reviewed-by: Martin Krastev <krastevm@vmware.com>
> ---

The patch looks good to me, thanks a lot for fixing this:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

