Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CB54936DA
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 10:10:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0562010E366;
	Wed, 19 Jan 2022 09:09:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6DD010E366
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 09:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642583396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kCH0AjI3eFPY2q8NUP5gdOrSh0DwHQxcSUH1oIghDG8=;
 b=ivQ1ixBInev1Vr72a7lTSKrpFuLVejpKHewy2mqBX3psV4VclHoj+xHMjsGIGsFC66Ef2p
 H/vlmjZInhGNrJZeLl0ayHSd7IxjolRoSWKuR4nR1Q+uD6vmzLx0dy0a9CFMQZOHivKoD7
 C4tZX29IFIpTgNX22Idwvxl5Oa0n84Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-340-ehJDOYzKP1WBRvuIMZyO3A-1; Wed, 19 Jan 2022 04:09:55 -0500
X-MC-Unique: ehJDOYzKP1WBRvuIMZyO3A-1
Received: by mail-wm1-f71.google.com with SMTP id
 p7-20020a05600c1d8700b0034a0c77dad6so1439678wms.7
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 01:09:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kCH0AjI3eFPY2q8NUP5gdOrSh0DwHQxcSUH1oIghDG8=;
 b=gryZPWeAFSjeLFDQdQVU1Yb12iwJmER4lTfS8fKTDcT7jrnnjk+RhuT0eiWpA9h8OT
 NBgmTrRsxBvbFM0tZTUgvKYapTKUmiD4SiuVGe5VPj8cD5l7Wqwd8ycqCbD9lHS8NFro
 6IQ2WXDXc+kQ+ly7bHkmpFL5g8BehJOzfqNIIqbQK8CU+k5rL5IDDmabe71O7JQTcC5j
 UMOKtfjt1LBBVM3f7BLEy5Nfaafagi7cfz/XxM2IyeqQlBjoYqi3Qua0Ysmv/EuJhuWy
 7T1ZPzkrEH0NsdVcacf51GuMCdek83pp99DqrbzJH+UMdA0YPKXIMD8/Fm6se6HCC0sA
 xTJQ==
X-Gm-Message-State: AOAM533nttGfzy2mZLXpP4pkB2z9jp+SdW+dwLmE/CMwiUuRHmCOQxnd
 M+gv3lZBZkGN3Yld1LFpWUFypx2JPyyc6E0+Nt+cO2qnyXtJabcJooTXRq9CzMuLh68PWFmumZK
 hTfmz06x2W1Jc7SUrpuVPu/SkNGxZ
X-Received: by 2002:a5d:64a3:: with SMTP id m3mr27550848wrp.36.1642583393961; 
 Wed, 19 Jan 2022 01:09:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw4mSSy7TajapoJ7PW82ft7hU8P4SXnM3bPyypID6clEBCjm4UngytWsRKI1DJf9NWdr4q8Mw==
X-Received: by 2002:a5d:64a3:: with SMTP id m3mr27550816wrp.36.1642583393706; 
 Wed, 19 Jan 2022 01:09:53 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id p9sm5550805wmb.32.2022.01.19.01.09.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 01:09:53 -0800 (PST)
Message-ID: <e956363f-d62a-3c73-6dae-6c691c63dedc@redhat.com>
Date: Wed, 19 Jan 2022 10:09:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 00/10] drm: Make drivers to honour the nomodeset
 parameter
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20211222082831.196562-1-javierm@redhat.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20211222082831.196562-1-javierm@redhat.com>
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
 Liviu Dudau <liviu.dudau@arm.com>, virtualization@lists.linux-foundation.org,
 Gerd Hoffmann <kraxel@redhat.com>, Mihail Atanassov <mihail.atanassov@arm.com>,
 Jonathan Corbet <corbet@lwn.net>, Xinliang Liu <xinliang.liu@linaro.org>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 NXP Linux Team <linux-imx@nxp.com>, Dave Airlie <airlied@redhat.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Chen Feng <puck.chen@hisilicon.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 linux-arm-kernel@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Tian Tao <tiantao6@hisilicon.com>, Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/22/21 09:28, Javier Martinez Canillas wrote:
> The nomodeset kernel command line parameter is used to prevent the KMS/DRM
> drivers to be registered/probed. But only a few drivers implement support
> for this and most DRM drivers just ignore it.
> 
> This patch series is a v3 to make DRM drivers to honour nomodeset. It is
> posted as separate patches to make easier for drivers maintainers to ack
> or pick them independently at their own pace.
> 

[snip]

> 
> Thomas Zimmermann (5):
>   drm: Provide PCI module-init macros
>   drm/ast: Replace module-init boiler-plate code with DRM helpers
>   drm/bochs: Replace module-init boiler-plate code with DRM helpers
>   drm/cirrus: Replace module-init boiler-plate code with DRM helpers
>   drm/hisilicon/hibmc: Replace module initialization with DRM helpers
>

For Thomas' patches (1-5)

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

