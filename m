Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F47E4A5DBE
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 14:56:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E0F210E2B8;
	Tue,  1 Feb 2022 13:55:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 528EC10E2B8
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 13:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643723754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fiDgurBW1NwAiqY2GLiQR5aJEIehzQmgOw53j3Z2hSA=;
 b=e8MUpfGOYhCoOh31LOQ6D6JEO+hrUvgfz3IFmZCZ6WsgIX+cj2cKa0rtctOLnZjVJpevlt
 TUDaGDnUua9ADFH5NQhi5GLdJJ/c0P125dzgkXM6wXpbU1QECMwTmEVEiBjRgDnyMrg6OF
 PoM/N+4zctU7T9YNW5bwed5ffay3ZGE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-vIIyirAiPA-VUKmo3zT_Hw-1; Tue, 01 Feb 2022 08:55:51 -0500
X-MC-Unique: vIIyirAiPA-VUKmo3zT_Hw-1
Received: by mail-wm1-f70.google.com with SMTP id
 j18-20020a05600c1c1200b0034aeea95dacso1631817wms.8
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 05:55:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fiDgurBW1NwAiqY2GLiQR5aJEIehzQmgOw53j3Z2hSA=;
 b=2y/VquBIc21HCKR5G5tPkWndl5slFruMP/qJw/HZq+yCQ0nunsR22myIldgb0XTVsQ
 aQ98JlE8vLkm+4Jsj0cAxw/SEzOxtMVHoluEoppL/u+/lD0g1RZXnPmXC9SFudt9IeAu
 OjuoZiRcGqtTBTsvbMxI9Mi2il+q4DHmWNogvKLOpfLkx+EHsA9r4N0XTjO3RxO9RhkA
 8wyzrhsM7u4tulkm16FXXBoHzLBFc54EYOstB7pkNrUu3BaWwURX6IUSxXGkTYfKsBWt
 wNQkf+Wv+mXX15LU2WULNdgbvGMYz49LCk3Tt6+hvLYxEoAIBWbJxEXjAYJub0JS4A7O
 pLCQ==
X-Gm-Message-State: AOAM533EZPfFR+zWgY7uPtJ7dyXf7w3DZPKOD1DUw4X/69dBriKHKnds
 7OcDUO6/NHQMr/AW+spjQ21sGjL17bFwIahuNORUn+hmLknDi+vcMe+TFv8AiOiR7gPqQqng3kK
 sDTBnqWMG9oXm47jtodBGrNEJFiIS
X-Received: by 2002:a05:600c:308:: with SMTP id
 q8mr1920540wmd.118.1643723750414; 
 Tue, 01 Feb 2022 05:55:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwiMcaMwXhPvSvseRwur0kl1vzm4WxKS+ITQZ4fi35QJL+D2oLFM2CJItTZMN0+Csgh1HP6Iw==
X-Received: by 2002:a05:600c:308:: with SMTP id
 q8mr1920525wmd.118.1643723750213; 
 Tue, 01 Feb 2022 05:55:50 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id y14sm16638445wrd.91.2022.02.01.05.55.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 05:55:49 -0800 (PST)
Message-ID: <f1c3557a-a24b-9764-ff3f-9df352e37188@redhat.com>
Date: Tue, 1 Feb 2022 14:55:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/4] drm: Add I2C connector type
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Sam Ravnborg <sam@ravnborg.org>
References: <20220131201225.2324984-1-javierm@redhat.com>
 <20220131201225.2324984-2-javierm@redhat.com> <YfhMESTylI1NTKDg@ravnborg.org>
 <4d9a56a7-da25-b411-61cc-372c6fa9011d@tronnes.org>
 <4322f58b-dbeb-b90f-2770-d6881f8005b4@redhat.com>
 <a6f267ea-7617-7d0e-06cd-7ec9c88576c3@tronnes.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <a6f267ea-7617-7d0e-06cd-7ec9c88576c3@tronnes.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Emil Velikov <emil.l.velikov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/1/22 14:20, Noralf Trønnes wrote:
> 
> 
> Den 01.02.2022 14.06, skrev Javier Martinez Canillas:
>> Hello Noralf,
>>
>> On 2/1/22 13:58, Noralf Trønnes wrote:
>>>
>>>
>>> Den 31.01.2022 21.52, skrev Sam Ravnborg:
>>>> On Mon, Jan 31, 2022 at 09:12:21PM +0100, Javier Martinez Canillas wrote:
>>>>> There isn't a connector type for display controllers accesed through I2C,
>>>>> most drivers use DRM_MODE_CONNECTOR_Unknown or DRM_MODE_CONNECTOR_VIRTUAL.
>>>>>
>>>>> Add an I2C connector type to match the actual connector.
>>>>>
>>>>> As Noralf Trønnes mentions in commit fc06bf1d76d6 ("drm: Add SPI connector
>>>>> type"), user-space should be able to cope with a connector type that does
>>>>> not yet understand.
>>>>>
>>>
>>> It turned out that I wasn't entirely correct here, mpv didn't cope with
>>> unknown types. In the PR to add support Emil Velikov wondered if libdrm
>>> should handle these connector names:
>>> https://github.com/mpv-player/mpv/pull/8989#issuecomment-879187711
>>>
>>
>> I see, thanks for the information. What should we do then, just use the type
>> DRM_MODE_CONNECTOR_Unknown then ?
>>
> 
> Not really, I just wanted to point out that it could be that not all
> userspace will handle an unknown connector type (I just checked the DE's
> at the time). I haven't seen any issues after adding the SPI type so it
> can't be that many apps that has problems. Adding to that a tiny
> monochrome display is limited in which applications it will encounter I
> guess :) It was after adding the USB type that I discovered that mpv
> didn't work.
> 

Anything we do for this rather obscure hardware certainly won't be an
issue for most applications :)

But I wasn't sure if your previous comment meant that you were nacking
$subject. Glad that we can go ahead and describe the correct type then.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

