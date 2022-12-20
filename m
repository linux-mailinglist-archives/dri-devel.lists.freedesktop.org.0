Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA539651D17
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 10:19:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86F4F10E34E;
	Tue, 20 Dec 2022 09:19:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE1E510E34E
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 09:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671527979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ABmxoLEyhLmWYUbBrwSAozB1mTvmA41c/n7InFI0eTk=;
 b=cyJJ0I19auZaMfVHveFdYbza75xMjvhXI1d5XVRnYTYMwKKyCz9hbjnBJRslEX1dqkFcJb
 bpy9z8B5YvEU78giMMhSrp8J8m6+/3q63JdLJLmHha6a9Q941LDB6NsRV1qiEY0pQlskX8
 4WC8kXdEkrtFExEsyoX/4R2BO6ep5BM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-477-H3E7ZPZLO7SfHWUFNyO_Xw-1; Tue, 20 Dec 2022 04:19:35 -0500
X-MC-Unique: H3E7ZPZLO7SfHWUFNyO_Xw-1
Received: by mail-wm1-f70.google.com with SMTP id
 bi19-20020a05600c3d9300b003cf9d6c4016so7785317wmb.8
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 01:19:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ABmxoLEyhLmWYUbBrwSAozB1mTvmA41c/n7InFI0eTk=;
 b=rDZYIjB+vIabFQrmmRHHfbVS+0jjE372zl9e9rdSlVyDyQf5BT5yeNkj/dhMe+Eixk
 DM/IsHw1/OwHO/wn7rOBjtqSBFiL/9FSgzGuIobpMJbh92Z17zCz/tPBABNZlYa7tmcG
 MmMI9beAjzZC4gWB9SDfKsqkFzjkAq43+4abF4qc2FEW1nSHKWeQYYd3La1qk5XGZuAM
 rv4MPxVpjBlqik76dPWtSLSaR8vgK9qxAZ/e+lRQdU7uS4bGDNCtjz6QESrdXog7vSHj
 2zYiRIj5IskmOnw+30cBU98HLMSu8+V2vAPciDlluof4OLPuHYAvqdepG2AD2Z7Zu/nU
 G5Bg==
X-Gm-Message-State: AFqh2krU/ZL3q4ZqsuCZhMwxHpwSFC5ZQVNn096tS4d4LrVyxyD1UB4e
 IXSj3t1X4kKsWEbZ9LkruWlDeA4HZEuzyuD3bLBetgCgTv2I3sbXDKNZditniZDayiEjIa0DwvL
 noNhLBy1YtMGlYTLbe/P53zF3TwPD
X-Received: by 2002:a5d:5752:0:b0:244:48b3:d13f with SMTP id
 q18-20020a5d5752000000b0024448b3d13fmr814496wrw.41.1671527974609; 
 Tue, 20 Dec 2022 01:19:34 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtLG6B6o+Iq76Uq1s7q/P5T3qehN9lnU31N4pqMHcN5FUQ5i4K5iNalaLBn7T7/AoIpv82Xvg==
X-Received: by 2002:a5d:5752:0:b0:244:48b3:d13f with SMTP id
 q18-20020a5d5752000000b0024448b3d13fmr814479wrw.41.1671527974427; 
 Tue, 20 Dec 2022 01:19:34 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 bj19-20020a0560001e1300b002238ea5750csm14570460wrb.72.2022.12.20.01.19.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 01:19:34 -0800 (PST)
Message-ID: <d9fa03ac-4e71-dcd4-2d79-698410c9c444@redhat.com>
Date: Tue, 20 Dec 2022 10:19:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 04/18] drm/i915: Do not set struct fb_info.apertures
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de
References: <20221219160516.23436-1-tzimmermann@suse.de>
 <20221219160516.23436-5-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221219160516.23436-5-tzimmermann@suse.de>
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
> Generic fbdev drivers use the apertures field in struct fb_info to
> control ownership of the framebuffer memory and graphics device. Do
> not set the values in i915.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

