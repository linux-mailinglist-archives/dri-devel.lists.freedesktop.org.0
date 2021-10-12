Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 948D342A8AE
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 17:42:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 908E589F5F;
	Tue, 12 Oct 2021 15:41:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 479FE89F43
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 15:41:57 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id i12so55517207wrb.7
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 08:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UTtSB/AxX+nSKnjq3c2L4Uc0/wQulxnMO92eFOXOlYQ=;
 b=MmwgVDETVJouQBmc3HR0QBJHA2yCYg7nOK9wdX24BdMwb15QNzWm4KcN/8Bb0oTo17
 PHkQZsm6Ngg7F/cN6jcrFT2QvAb0e92JUAVV9UA0e+NMmk2f9uKUuiWr5c3POlYf4Yhv
 zg9cBpOl7f9DSyY0tdtNUWeBNvQFH7ioHPm4ecBAXXh4kxTB4z42r0fuITeOo5QaXpxL
 WjLCPsZjLqhYFE1vpSPcS3YLbR7fhoXnUY5xIYzNlL5fbPqT2nPzsJFWdwFl6W+QcG9O
 URGwnTBuFNwURuAcuh9dJWex/Xgl4vCB2EllYmY8n6ZvWjF/0gycf4EjFG4y0qxO0Lv2
 94Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=UTtSB/AxX+nSKnjq3c2L4Uc0/wQulxnMO92eFOXOlYQ=;
 b=JKlhog2J2uarwnUNpH0MUk1WsCyNDJDVXPKgXTug0Uw29mMPDkVK5RcUbwLgqUCvA1
 HK8G4x0pFKU0XNVFffyZ8/Rm+iKXi/ASUJ05icrJTii+wmHOxsjwCEQrujSnesAxWNZA
 Eky/go0KYr0EIKgp7rWqksps6Zo2gZfnDB2tenKRnL/4cSlrNjVdfJru9So8Gb7ayIQf
 ybM6Fz6+eveBs76l3X9DvJZ6tir5VIe/ZIc7IuFA63qs3ordxVoGKJIDC8KYaEeeRcS6
 cYKlGigPB5MqOKPUuYn0J/sZpA9I2K2jnQ7t/O+UvWIxTalpFQ3nsQZgtDK4im/vChTR
 aoQg==
X-Gm-Message-State: AOAM53386BnoF54to7iHi9FG+lAcj1dx7P8JYjAfpyjoNIyBzr98/bd2
 ndk1A4SZJ6wSSh1Vt5c89fcBzg==
X-Google-Smtp-Source: ABdhPJwxDHwuJQc5gA52Ios6lKJyqwI1A27lY5AbKwzJqazbY/YH/HnLJtkOUMdNrZRwnolvQW8Iug==
X-Received: by 2002:a7b:c406:: with SMTP id k6mr6436165wmi.170.1634053315482; 
 Tue, 12 Oct 2021 08:41:55 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:4e93:9fa7:4d66:4f5c?
 ([2001:861:44c0:66c0:4e93:9fa7:4d66:4f5c])
 by smtp.gmail.com with ESMTPSA id w5sm10829357wrq.86.2021.10.12.08.41.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 08:41:55 -0700 (PDT)
Subject: Re: [PATCH v5 5/8] drm/omap: Add global state as a private atomic
 object
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, khilman@baylibre.com,
 Benoit Parrot <bparrot@ti.com>
References: <20210923070701.145377-1-narmstrong@baylibre.com>
 <20210923070701.145377-6-narmstrong@baylibre.com>
 <2609ca32-90e8-1335-2769-14dcbcdfafde@ideasonboard.com>
 <ab06e379-1579-2352-3525-dbdca6a94f9b@baylibre.com>
 <00ad704f-cd01-cfc2-0418-1cb0561c41a5@ideasonboard.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <aa8eb332-83d9-2212-2d3d-cb5ad40ef73a@baylibre.com>
Date: Tue, 12 Oct 2021 17:41:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <00ad704f-cd01-cfc2-0418-1cb0561c41a5@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/10/2021 15:38, Tomi Valkeinen wrote:
> On 12/10/2021 16:23, Neil Armstrong wrote:
> 
>>>> +    struct drm_private_obj glob_obj;
>>>> +
>>>>        struct drm_fb_helper *fbdev;
>>>>          struct workqueue_struct *wq;
>>>> @@ -88,5 +105,9 @@ struct omap_drm_private {
>>>>        void omap_debugfs_init(struct drm_minor *minor);
>>>> +struct omap_global_state *__must_check
>>>> +omap_get_global_state(struct drm_atomic_state *s);
>>>> +struct omap_global_state *
>>>> +omap_get_existing_global_state(struct omap_drm_private *priv);
>>>
>>> These could also be separated by empty lines. At least to my eyes it gets confusing if those declarations are not separated.
>>
>> Atomic states can be extremely confusing, and hard to track.
>> I checked and they do what they are documented for...
>>
>> The omap_get_existing_global_state() is the most confusing since the result depends if
>> we are in an atomic transaction of not.
> 
> So here I was just talking about the cosmetics, how the lines above look like. I have trouble seeing where the function declaration starts and where it ends without looking closely, as both lines of the declaration start at the first column, and there are no empty lines between the declarations.

Ok, it's a legacy of the 80chars max, will reformat.

> 
> But now that you mention, yes, the states are confusing =). And this series is somewhat difficult. I think it's important for future maintainability to include explanations and comments in this series for the confusing parts (plane-overlay mapping and state handling, mostly).

Yep I added some hopefully useful comments explaining that.

Neil

> 
>  Tomi

