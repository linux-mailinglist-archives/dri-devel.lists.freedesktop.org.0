Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C48E74AE5D1
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 01:19:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D45AB10E190;
	Wed,  9 Feb 2022 00:19:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B19A110E190
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 00:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644365970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+YfCnyxSCyr5vTP3YrAazeA9ULAGVzys2UZvocNOmGA=;
 b=Ts/dEPbO4woQGpfsghSDXDVZZcF6vJYScE/pVW/51pxVWgkGludc3wgQWCim0q/6VARIWO
 //IsO0R22hcVMmGJGw6bOrtlvUM8FOQzmwFq6C4vBVrrkJ2RJUZbD1KdvXAig1aum1Fs68
 AM0FISoNSkHLVZYrMzzRTmDy32FLsoQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-495-knP_j2JGMiOYIYLg9wtyaA-1; Tue, 08 Feb 2022 19:19:29 -0500
X-MC-Unique: knP_j2JGMiOYIYLg9wtyaA-1
Received: by mail-wm1-f69.google.com with SMTP id
 m3-20020a7bcb83000000b0034f75d92f27so73152wmi.2
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 16:19:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+YfCnyxSCyr5vTP3YrAazeA9ULAGVzys2UZvocNOmGA=;
 b=C8g8USXj3m4DIanI2GW+9mGMvJKDVl5mCyedkFmJj4YMhiIMbOXdJo0znpyhEuZdIZ
 bVlYCoUgq0PO0ypXzPs8LLDySnaL9wLvgakoJH02MCKSVHHGVy/BX+83Enxj8Bvk8Urz
 vPS1ulHjsmJBkjtrwkaqBLgCN0VUHx2VwjGWJ60bnFSA0qTi0XavHnjGaHk5Qwd0ZR0w
 lC/+H3DcjRakHk9HiV+QqSdP4wfvDgdP37Dg0Ngxoe5hxV7Z6E1gwfx984f7csnJrZo4
 QXt7z7jqXAuDzJIB063UAGVYY4WT/X0GuAt6Su2pZiz9YH4hoFoN8Mnl7lAkdGx8nEWk
 BURQ==
X-Gm-Message-State: AOAM532F2TjzJMjufwTc67wz3L4NFtuLj6KzdBjbVIinRmNQ+xDlGjk6
 RHjjsGRx+ThSeGfaeJlwJimvaKsSNh8YYN+hB05mc1RMbE4RhCTyEq/1fhLwKOOQFFMTdnUT+YY
 l/BlwNgGaDR+lR3CDwLDKBzmWEfdY
X-Received: by 2002:a05:6000:1363:: with SMTP id
 q3mr272630wrz.468.1644365968333; 
 Tue, 08 Feb 2022 16:19:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwA2Lg39k9Sbo0xLJ5uWj2LvpSd71eFqK97Wop1ro0TUcBQLjaot/weyoE5zyFF03j8y59UbA==
X-Received: by 2002:a05:6000:1363:: with SMTP id
 q3mr272596wrz.468.1644365967877; 
 Tue, 08 Feb 2022 16:19:27 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id n26sm3877837wms.13.2022.02.08.16.19.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 16:19:27 -0800 (PST)
Message-ID: <4ae20b63-f452-fdb4-ced6-d4968a8d69f0@redhat.com>
Date: Wed, 9 Feb 2022 01:19:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 18/19] Revert "fbdev: Prevent probing generic drivers
 if a FB is already registered"
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20220208210824.2238981-1-daniel.vetter@ffwll.ch>
 <20220208210824.2238981-19-daniel.vetter@ffwll.ch>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220208210824.2238981-19-daniel.vetter@ffwll.ch>
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
Cc: linux-fbdev@vger.kernel.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Peter Jones <pjones@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Ilya Trukhanov <lahvuun@gmail.com>, Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/8/22 22:08, Daniel Vetter wrote:
> This reverts commit fb561bf9abde49f7e00fdbf9ed2ccf2d86cac8ee.
> 
> With
> 
> commit 27599aacbaefcbf2af7b06b0029459bbf682000d
> Author: Thomas Zimmermann <tzimmermann@suse.de>
> Date:   Tue Jan 25 10:12:18 2022 +0100
> 
>     fbdev: Hot-unplug firmware fb devices on forced removal
> 
> this should be fixed properly and we can remove this somewhat hackish
> check here (e.g. this won't catch drm drivers if fbdev emulation isn't
> enabled).
>

Unfortunately this hack can't be reverted yet. Thomas' patch solves the issue
of platform devices matched with fbdev drivers to be properly unregistered if
a DRM driver attempts to remove all the conflicting framebuffers.

But the problem that fb561bf9abde ("fbdev: Prevent probing generic drivers if
a FB is already registered") worked around is different. It happens when the
DRM driver is probed before the {efi,simple}fb and other fbdev drivers, the
kicking out of conflicting framebuffers already happened and these drivers
will be allowed to probe even when a DRM driver is already present.

We need a clearer way to prevent it, but can't revert fb561bf9abde until that.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

