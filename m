Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBEA54EDD8
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 01:21:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6470410E2C6;
	Thu, 16 Jun 2022 23:21:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04A2010E2C6
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 23:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655421682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Sk05nK8yr31d0PfEhMiImAlc8BO2DlseMPnx7U4OyI=;
 b=EvVNDX0+d/ibOTI3v/x09FUZYtvzU7jEKVBJov68pNKQDLrz9B33dM0cYskN7ZEsfYmA8t
 T99scoEO9FHxpyYfV+BRMSqIkLsEsczQSP/hkIkxx+TzQqaAS9x27vUVBKiNNjUtk/UeNl
 IYW6WptacsMSzolTVWsdPlw0WnNxIfA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-438-ZHH1P90MPDCvo16me8r3hw-1; Thu, 16 Jun 2022 19:21:21 -0400
X-MC-Unique: ZHH1P90MPDCvo16me8r3hw-1
Received: by mail-wm1-f71.google.com with SMTP id
 o2-20020a05600c510200b0039747b0216fso1832709wms.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 16:21:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=7Sk05nK8yr31d0PfEhMiImAlc8BO2DlseMPnx7U4OyI=;
 b=4HS7Qrk9slOhoM8HZApF0XcLLBl1iU+BYb/lYqgzqkZjFnAJ07xue/RxZxt7BGUdqQ
 XmmQgpmHkVYfmEXWkzlh+1idFxHJpsf9GDw9xXfFedJT9JOuLsXRBPe5srBILdueLCHX
 UjA3ExUGm0sug8zCrJFHd7fJJxszSTJ2WPjGjqR/zfqks1BFkYiIfXLfxA7PGR+wmy4l
 GmzQo/ZZm+cmjMUvgXI9rUw9K09DM3SrGdTMJbVV+rk9pssJN4YlWUB57GvWJEBq3S71
 ndVrUonaY81BMiIA6XYHKkB/4bGfKPiNOwHD94M8wb5cT41ucgJV68R5nN009YVGUJPw
 Dn6w==
X-Gm-Message-State: AJIora8QFm/hR9+gpdKUdHFbj1RC2EGNrFJNqKv+6CRXFcABQi8M3P4B
 kpp5maryqByfoKqMKLHo3dYU/4ju2QOafu80zY63zMtJgpyIWK0itpt05pmfUEUKKOfh3A5cARO
 bN2FQrlDpALXu2qOD4r5l6FgZwo0s
X-Received: by 2002:adf:dd50:0:b0:21a:ba8:6c8d with SMTP id
 u16-20020adfdd50000000b0021a0ba86c8dmr6836476wrm.133.1655421680443; 
 Thu, 16 Jun 2022 16:21:20 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sb3IFUqs3ZqGZX9qvUxp1wuRL6DIG8sHZblCmseyvlgwUjG0m1h+TgWCsvv3Al2+33swPkSg==
X-Received: by 2002:adf:dd50:0:b0:21a:ba8:6c8d with SMTP id
 u16-20020adfdd50000000b0021a0ba86c8dmr6836452wrm.133.1655421680150; 
 Thu, 16 Jun 2022 16:21:20 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 r15-20020a05600c35cf00b0039c4ff5e0a7sm3658603wmq.38.2022.06.16.16.21.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jun 2022 16:21:19 -0700 (PDT)
Message-ID: <97565fb5-cf7f-5991-6fb3-db96fe239ee8@redhat.com>
Date: Fri, 17 Jun 2022 01:21:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 3/5] fbdev: Disable sysfb device registration when
 removing conflicting FBs
From: Javier Martinez Canillas <javierm@redhat.com>
To: Zack Rusin <zackr@vmware.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20220607182338.344270-1-javierm@redhat.com>
 <20220607182338.344270-4-javierm@redhat.com>
 <de83ae8cb6de7ee7c88aa2121513e91bb0a74608.camel@vmware.com>
 <38473dcd-0666-67b9-28bd-afa2d0ce434a@redhat.com>
 <603e3613b9b8ff7815b63f294510d417b5b12937.camel@vmware.com>
 <a633d605-4cb3-2e04-1818-85892cf6f7b0@redhat.com>
In-Reply-To: <a633d605-4cb3-2e04-1818-85892cf6f7b0@redhat.com>
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "deller@gmx.de" <deller@gmx.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "lersek@redhat.com" <lersek@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/17/22 00:18, Javier Martinez Canillas wrote:
> On 6/16/22 23:03, Zack Rusin wrote:

[snip]

> 
> I'll look at this tomorrow but in the meantime, could you please look if the following
> commits on top of drm-misc-next help ?
> 
> d258d00fb9c7 fbdev: efifb: Cleanup fb_info in .fb_destroy rather than .remove
> 1b5853dfab7f fbdev: efifb: Fix a use-after-free due early fb_info cleanup
> 

Scratch that. I see in your config now that you are not using efifb but instead
simpledrm: CONFIG_DRM_SIMPLEDRM=y, CONFIG_SYSFB_SIMPLEFB=y and CONFIG_DRM_VMWGFX.

Since you mentioned efifb I misunderstood that you are using it. Anyways, as
said I'll investigate this tomorrow.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

