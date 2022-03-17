Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 931F34DC4F4
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 12:40:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F08A910E598;
	Thu, 17 Mar 2022 11:40:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1813110E598
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 11:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647517203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S0GPDzZRGu9yOKrwYapaocFp6V53jwtR479N3pP5zYg=;
 b=aEp6kF7gUuY4/XTLeDGBcVzZ4kzM9jlV4UEPWP7LfZwmQ6XeL/H7TT5CPWsFaFbDRlABB6
 TtOVUJ1gZ4E3d07UG/5sq0A8uMHADm6N0Akavr22zXzGIOYlE2qvPawnsYGjJhEQp4/dej
 1JMFZigvbpYRobT61VrVpRZ3dW77BW0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-Tijvdq2CM_CktLT6BISUPw-1; Thu, 17 Mar 2022 07:40:00 -0400
X-MC-Unique: Tijvdq2CM_CktLT6BISUPw-1
Received: by mail-wr1-f70.google.com with SMTP id
 s8-20020adfc548000000b00203eba1052eso343583wrf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 04:40:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=S0GPDzZRGu9yOKrwYapaocFp6V53jwtR479N3pP5zYg=;
 b=i/FEHd5AH7MFbf2phoiFBGWBdBFrKY3h7TFC8NyFgQ+TwSo+gIFhQJ2a5qkCsP+FVU
 O31qpW6/VRX+C4nNT0szd5UPGLqGS1KOYIgKwUM/JFkMtL5KfvMTw8ntInnuiWYPuxgv
 gf53MZmvFoyK6PdIXA1dKkClYD7ORkhv/iIaNhUdV1htdPtn8fqJpHzL4WbndKUzHXbx
 Y6jbLPnT+iWPDa18UfC6I0kZpzizoxrHISgvf5Xxu7Gh8xaXEfrTr4THeZg2UA94YWeR
 5y/IBilnlgLXb31wXmlEBlij6DfNAkWtWFp8aQa3kjseZp5xwor90BJgOQBLjFP47V51
 5Xtw==
X-Gm-Message-State: AOAM532G65A9ShICK/pWjDQ4gsARvpvT5TNT+B277dmUsySXs4vxI2vL
 SF8qquBWVM3mmACbMvMSIBglXIUC6tsuoSsZWeZxSboxkpFSGieVTTkAjcSPUReM2Ww4fihIpdt
 oIZ1f9GViszBHvkpbyVqDoQSWqQmt
X-Received: by 2002:a5d:4f12:0:b0:203:f0cc:da04 with SMTP id
 c18-20020a5d4f12000000b00203f0ccda04mr563358wru.248.1647517199312; 
 Thu, 17 Mar 2022 04:39:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJQe+TzlCkwrcKAsgJu9Uxvo9kmJPknXmxL33nxErHnUYSKMO7U0NlsOT7yuGusesX59ASrA==
X-Received: by 2002:a5d:4f12:0:b0:203:f0cc:da04 with SMTP id
 c18-20020a5d4f12000000b00203f0ccda04mr563342wru.248.1647517199097; 
 Thu, 17 Mar 2022 04:39:59 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 m185-20020a1ca3c2000000b0038c836a5c13sm224338wme.20.2022.03.17.04.39.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 04:39:58 -0700 (PDT)
Message-ID: <f94c0f44-36f1-e1a9-5963-5da0bafb8c90@redhat.com>
Date: Thu, 17 Mar 2022 12:39:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 0/5] drm: Fix monochrome conversion for sdd130x
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
References: <20220317081830.1211400-1-geert@linux-m68k.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220317081830.1211400-1-geert@linux-m68k.org>
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Geert,

On 3/17/22 09:18, Geert Uytterhoeven wrote:
>         Hi all,
> 
> This patch series contains fixes and improvements for the XRGB888 to
> monochrome conversion in the DRM core, and for its users.
> 
> This has been tested on an Adafruit FeatherWing 128x32 OLED, connected
> to an OrangeCrab ECP5 FPGA board running a 64 MHz VexRiscv RISC-V
> softcore, using a text console with 4x6, 7x14 and 8x8 fonts.
> 
> Thanks!
> 
> Geert Uytterhoeven (5):
>   drm/format-helper: Rename drm_fb_xrgb8888_to_mono_reversed()
>   drm/format-helper: Fix XRGB888 to monochrome conversion
>   drm/ssd130x: Fix rectangle updates
>   drm/ssd130x: Reduce temporary buffer sizes
>   drm/repaper: Reduce temporary buffer size in repaper_fb_dirty()
>

Thanks for re-spinning this series and again for fixing my bugs!

I pushed patches 1-4 to drm-misc (drm-misc-next) but left patch 5 since
would like to give Noralf the opportunity to review/test before pushing.

By the way, you should probably request commit access to the drm-misc tree:

https://drm.pages.freedesktop.org/maintainer-tools/commit-access.html

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

