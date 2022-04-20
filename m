Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE1550879C
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 14:02:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 162B610F16B;
	Wed, 20 Apr 2022 12:02:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE20D10F0F4
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 12:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650456130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jns15WXaKK2T4vvPYQSokguRf+DPGNKam+M6DNBkc5M=;
 b=TSchKlXXJJMj3PmSMElX82v/CYfCdHVXiYUagzhnZvMrOdi/rT7iYubnJFtknHegG7NZMl
 38mOjns85uo5A5/xUqmHt72AbGsElHPAtAGwzUgpfOSbZxywB6jBzyU9WIHkSz9w9GWoke
 PM1l40QTLwdhfHImtHn1upTkBDp+mEE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-534-ZB2SQendMe2CH7yZ-wjN0A-1; Wed, 20 Apr 2022 08:02:07 -0400
X-MC-Unique: ZB2SQendMe2CH7yZ-wjN0A-1
Received: by mail-wm1-f71.google.com with SMTP id
 125-20020a1c0283000000b003928cd3853aso2376911wmc.9
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 05:02:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Jns15WXaKK2T4vvPYQSokguRf+DPGNKam+M6DNBkc5M=;
 b=WHtvAe7MJWug+5wfbrDJY6u66d661zL8pVig9Pxr5NMQ4FR9kpohOfeviNLa13BevH
 oT3D1WBIy7utpj9cRYXFQpLT+uvBuTJ88tyjrp/mnIdiV57/7YXYDQv95fsAFbg5+I+I
 f9l55OSrAwapdjsC3EQTlQw/D83N4Ttqiht6B3WWyxgXIYtLWbxdc16Zj2kSa191+yLL
 ZHE8PClijXA1pBVeNG4jVM1kMvlVqLf4mLyLKwMKKzG34kdM020jOWY+75ARVmONzeR9
 3SpzbK+pht3RLJkRz4WTh/+DXjbnp23c2kRNEqYLebEz7mrowyAwV82GG9zFdmABHyTa
 vwtw==
X-Gm-Message-State: AOAM533zXyt/45LGUTsh+kOTi7QKOTJR0p/47T5X68iaJOSquDTe/LF1
 9oplW9/rgvnCcArDxi40lpsQQKF5ZOHaJvLdBEGUXDwXVi+Fn5ffDqpiSy1LncU23757yl8Rd4A
 7tOZtgGFY3Dw752MT5NlQ9F4hAnG4
X-Received: by 2002:a5d:598e:0:b0:20a:83aa:4e58 with SMTP id
 n14-20020a5d598e000000b0020a83aa4e58mr15136935wri.182.1650456126333; 
 Wed, 20 Apr 2022 05:02:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYiYiiVNyp7Gjb10Dyxh4F2uH2giyRB2baE2ewas1dNLUlmkC5g8orpjkcHw/02AhgzXZQiw==
X-Received: by 2002:a5d:598e:0:b0:20a:83aa:4e58 with SMTP id
 n14-20020a5d598e000000b0020a83aa4e58mr15136907wri.182.1650456126050; 
 Wed, 20 Apr 2022 05:02:06 -0700 (PDT)
Received: from [192.168.1.129] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a5d5350000000b0020a99bc986bsm6656359wrv.28.2022.04.20.05.02.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 05:02:05 -0700 (PDT)
Message-ID: <6f4c5894-a154-b0f8-084a-4ba8f66cd4ea@redhat.com>
Date: Wed, 20 Apr 2022 14:02:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 7/8] drm/display: Move HDMI helpers into display-helper
 module
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jani.nikula@linux.intel.com, lyude@redhat.com
References: <20220420110900.8707-1-tzimmermann@suse.de>
 <20220420110900.8707-8-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220420110900.8707-8-tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 4/20/22 13:08, Thomas Zimmermann wrote:

[snip]

> --- a/drivers/gpu/drm/bridge/synopsys/Kconfig
> +++ b/drivers/gpu/drm/bridge/synopsys/Kconfig
> @@ -1,6 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config DRM_DW_HDMI
>  	tristate
> +	select DRM_DISPLAY_HDMI_HELPER
> +	select DRM_DISPLAY_HELPER
>  	select DRM_KMS_HELPER
>  	select REGMAP_MMIO
>  	select CEC_CORE if CEC_NOTIFIER

[snip]

> +config DRM_DISPLAY_HDMI_HELPER
> +	bool
> +	select DRM_DISPLAY_HELPER
> +	help
> +	  DRM display helpers for HDMI.
> +

Maybe you mentioned already when we discussed it in v1, but could
you please remember me why we need to select both symbols for the
drivers, even when DRM_DISPLAY_HELPER is already selected here ?

Or are select operations not transitive ?

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

