Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C57451FBB8
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 13:52:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4075E10EC75;
	Mon,  9 May 2022 11:52:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B2C210EC75
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 11:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652097136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MTArUv/wFCiWq9i9zQ4S21laiQa/qPGD6Db/XV8vE0w=;
 b=ZKxqwvXym1aNeJ/ehjAF2BFFrH2bYaiaaWgrzAmx3GWdxQvs9aft5Bo+PW9rYMAlhdL9oz
 Ljs3OK214JFEuMzcgwmQxvSqbXpEm1OHkosCZCkDFLa5/mf9+Hden3sb//kr87PFmhc3lb
 tUH7FDI76gQ/nx82Nu9i3m31zEOxGy8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-368-UefuFfBVMRSyQaETh5Gx-A-1; Mon, 09 May 2022 07:52:13 -0400
X-MC-Unique: UefuFfBVMRSyQaETh5Gx-A-1
Received: by mail-wr1-f71.google.com with SMTP id
 w4-20020adfbac4000000b0020acba4b779so5727503wrg.22
 for <dri-devel@lists.freedesktop.org>; Mon, 09 May 2022 04:52:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MTArUv/wFCiWq9i9zQ4S21laiQa/qPGD6Db/XV8vE0w=;
 b=Phshe2Bxcq7mORnGW/GNttxHcUy9t56CfVyyGsrn/LalrT/GnEbFdBy5HDKJAAFt+y
 uakAHxtbCdxBO8bFyJOd1AlejkTV4E/Lfp6pY44M0hcVTawsjLzbS6Q/5IDYiwH5vSdL
 0DaKsvwAIRJ+9fsrQZJIiphhvwMjGGHOgO+XWAmjJ8u4Wz9z0UO7lPkZIqE9//hvUtXe
 Rfy60dP4HVos9tNHGZZ2juzcbiA5gkuHnvIJjsd0eT1Dp49ZUisrzE0EnbdrXvG+b2cP
 XKl5tasM0//hZjLmxy80j9UERf8ZElk2gkFk5B3pS/vKo5y/K7F01PXrvQ72wAx5KrUO
 IBGQ==
X-Gm-Message-State: AOAM532XnNAuejNey1Oqf7eS7hH/Tvy3aEWzT3JpvPk6pU9xnJCZ+Zcm
 aFTr50jbLio0g4NNfEGf5Fst3a2jgAKqgMBADH76KPx3OLfwp0zHzEU+1KCTwPSKd3h5snoGBmR
 anS6kH6+mPAbOXSP72VGW0YIa/dPO
X-Received: by 2002:adf:f3cb:0:b0:20c:8afd:9572 with SMTP id
 g11-20020adff3cb000000b0020c8afd9572mr13173449wrp.179.1652097131858; 
 Mon, 09 May 2022 04:52:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFsXOOcCsHix3/Q3zumYD2ATdtE3gT7cVLytgECTwISvpWO1cGBXyU6jhjEzUVG2HEeaRhNw==
X-Received: by 2002:adf:f3cb:0:b0:20c:8afd:9572 with SMTP id
 g11-20020adff3cb000000b0020c8afd9572mr13173440wrp.179.1652097131659; 
 Mon, 09 May 2022 04:52:11 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 ba28-20020a0560001c1c00b0020c86a9f33bsm12564935wrb.18.2022.05.09.04.52.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 04:52:11 -0700 (PDT)
Message-ID: <6eea44ce-4057-7267-8a0b-096cdc61dd94@redhat.com>
Date: Mon, 9 May 2022 13:52:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] drm/vmwgfx: Fix passing partly uninitialized
 drm_mode_fb_cmd2 struct
To: Hans de Goede <hdegoede@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Zack Rusin <zackr@vmware.com>
References: <20220509110425.165537-1-hdegoede@redhat.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220509110425.165537-1-hdegoede@redhat.com>
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
Cc: Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Hans,

On 5/9/22 13:04, Hans de Goede wrote:
> vmw_fb_kms_framebuffer() declares a drm_mode_fb_cmd2 struct on the stack
> without zero-ing it and then continues with initializing only some fields.
> 
> This leads to drm_mode_fb_cmd2.modifiers[0] containing garbage,
> which eventually gets used by drm_helper_mode_fill_fb_struct() to
> set fb->modifier when leads to the following atomic-check failure:
> 
> vmwgfx 0000:00:02.0: [drm:drm_atomic_check_only] [PLANE:34:plane-0]
>  invalid pixel format XR24 little-endian (0x34325258),
>  modifier 0xffff94d64719e000
> fbcon_init: detected unhandled fb_set_par error, error code -22
> 
> Which causes the fbdev emulation and thus also fbcon to not work.
> 
> Initialize the struct with all zeros to fix this.
> 
> Fixes: dabdcdc9822a ("drm/vmwgfx: Switch to mode_cmd2")
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=2072556
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---

Zack fixed this already:

https://cgit.freedesktop.org/drm/drm-misc/commit/?id=5405d25b9e8e6

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

