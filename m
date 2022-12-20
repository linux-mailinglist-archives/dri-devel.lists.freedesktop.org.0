Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BD4651DD2
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 10:44:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36F6510E35E;
	Tue, 20 Dec 2022 09:44:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FF5510E36B
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 09:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671529437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1J4eLv+5To8BjnLItTbs6pq8g5LjZHk9PMjLEQIi8Lo=;
 b=bMNfBpnQ0R4k+ZK8hL0B6FvdIHuE2a82b6uq5TwyVbtjv66Bs6gClwvEX1W6Fp3/8xwXD2
 dqhZCRE0PLbY6sGXEU4B8doc9gx/9iHlNxoiEiwYCKyUlTRJCUDkQO3LpaklI1gpIPUkiz
 d8HmCBKJ4wvs+IM57SvO4ncgFUGRrYA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-584-pnNZhGN4Mim0xr-dWQau8w-1; Tue, 20 Dec 2022 04:43:56 -0500
X-MC-Unique: pnNZhGN4Mim0xr-dWQau8w-1
Received: by mail-wm1-f71.google.com with SMTP id
 l9-20020a7bc349000000b003d35aa4ed8eso1074789wmj.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 01:43:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1J4eLv+5To8BjnLItTbs6pq8g5LjZHk9PMjLEQIi8Lo=;
 b=MLmm758/qL8k3ixEWFjStQsaEqlcIo5nY7aLsf5f6LIoFean/WKrGGLw0ydTmbe+am
 KNDAczusbaEP7MBepvyWlIY+HRJGjPfi74tDvXdqYFSUeqYiR9Upt/fwH/rC2zplprQ1
 WNtMlmPPVZJ7w+YKsUhHX0MRvuPv8JC0EUh3lGirJFPR5p6DovpNcr7HZxQgD62MmAFr
 58sk1IRBRlIuZ6OXl7tA27RsqX/yR2jQTArRX2vQu7CW+l6alu20QmtJj6NwYrHsAJff
 HPCpm+etZGMDk3VJzfZ1+ZNQvz7skEpwWCv1TB5f1+SKbInbHsDf+p6C3vGf9DZkIuic
 OCFQ==
X-Gm-Message-State: AFqh2kr11COkCHUFk7+f5xk4jsnf7b3aBfdVAR/3BKeTn1NWNR6HuYVw
 pU3yb7xApSzk0+9lrGdsBuUbN4h9iYMYFgqI7Iw64xzwt3cmZC1LBsBr4+qrYgCZazWGt8cDJzS
 324uWWHGDm/7mPf869n0agxnfo/Va
X-Received: by 2002:a05:600c:4311:b0:3d2:3e75:7bb9 with SMTP id
 p17-20020a05600c431100b003d23e757bb9mr994922wme.34.1671529435450; 
 Tue, 20 Dec 2022 01:43:55 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvfI2fbHCkuQqRJ76jLZpFV0pKFd9I/EWHnHADcWJc2WmgvjMGHFvYEzSGe6w+l7QXDUqu6sg==
X-Received: by 2002:a05:600c:4311:b0:3d2:3e75:7bb9 with SMTP id
 p17-20020a05600c431100b003d23e757bb9mr994914wme.34.1671529435238; 
 Tue, 20 Dec 2022 01:43:55 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 y7-20020a05600c364700b003d33ab317dasm17144094wmq.14.2022.12.20.01.43.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 01:43:54 -0800 (PST)
Message-ID: <c9a34fd2-3dc5-18d7-20b4-b5c9e69ad039@redhat.com>
Date: Tue, 20 Dec 2022 10:43:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 16/18] fbdev/vesafb: Do not use struct fb_info.apertures
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de
References: <20221219160516.23436-1-tzimmermann@suse.de>
 <20221219160516.23436-17-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221219160516.23436-17-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-hyperv@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/19/22 17:05, Thomas Zimmermann wrote:
> Acquire ownership of the firmware scanout buffer by calling Linux'
> aperture helpers. Remove the use of struct fb_info.apertures and do
> not set FBINFO_MISC_FIRMWARE; both of which previously configured
> buffer ownership.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

