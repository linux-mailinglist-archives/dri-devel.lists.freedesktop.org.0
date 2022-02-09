Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 641984AF3E3
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 15:17:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7FD910E5CB;
	Wed,  9 Feb 2022 14:17:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B862210E5CB
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 14:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644416230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KRUhAeA84UjsLS4HbxlBt5EQCd/sdN8Mn9sTcjqUddo=;
 b=ebvB37XEVDGNG1FebJq3zHD7HgMjQmwBonivNYdUNNK8ACLoS/jw++nxdP2W0WeZw3JPof
 hnkwCqRQe17s7icRJkDo/hlRT+i9SarminlNHc+herT8qlmzDZrOwK0SNR5dIiBcym8AXD
 DiDDpNUnaAydAMRrgkYDUdRHdlXY6MY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-205-PC0piq9PP5KtTvCgeyFfJw-1; Wed, 09 Feb 2022 09:17:09 -0500
X-MC-Unique: PC0piq9PP5KtTvCgeyFfJw-1
Received: by mail-wm1-f70.google.com with SMTP id
 v185-20020a1cacc2000000b0034906580813so2725786wme.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 06:17:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KRUhAeA84UjsLS4HbxlBt5EQCd/sdN8Mn9sTcjqUddo=;
 b=JZOh5OFzgKdyYFYS0WucQe20R6wkLpkVSpitoLTo6B6f8x841EGFxuLKAYQP00/SdS
 uDrM4EzeaXJ5J8x70xm7inIaBA5SOlt8wmKAj1pjZoZ9eRz0WITdyDlKcYbhkRZMw6hp
 +ZzuddXofRg5GoTX5F6+KgzA2FdvIg3CDK3YDB/ebZEybygIG60TDLURidGQx2zDg+TS
 LUsSH4G48a9p4EU4IdVR0b5D+cYx5MroSqMR+k3uFz4M48JxUrmFddwP0VOkro2ZiuiD
 e2werfmAA2htrmX0aYNgIk+vwzqqykI5eebicjzLs8YFdPgrGvriGoIMg13dHsP9zkb+
 AOXA==
X-Gm-Message-State: AOAM533KIMorOmwSRXwtNzvBujFnMrNErwl/l+dP9ob3DYW01xd+AByA
 5+Db4kUZwDgrXBpDMLwYwZNt1JUDrsEwLiHw1aBH560VraPon1AqnYlTVhe1LlqAOGv33281h2j
 HhiD9e13tZjOKs/5tf3RW7Nns/qLR
X-Received: by 2002:a05:600c:4e16:: with SMTP id
 b22mr2290155wmq.8.1644416228504; 
 Wed, 09 Feb 2022 06:17:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxwIzQ5Y+IJIHsSpt0Pgn2iyoVM/suryQvdT8KlECfzPpYA1vTVAA9aQ4WkCb9TTM9E2pUG9Q==
X-Received: by 2002:a05:600c:4e16:: with SMTP id
 b22mr2290117wmq.8.1644416228230; 
 Wed, 09 Feb 2022 06:17:08 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id f13sm5562779wmq.29.2022.02.09.06.17.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 06:17:07 -0800 (PST)
Message-ID: <d1025530-90e1-fbc5-c06b-f62ed83f2f19@redhat.com>
Date: Wed, 9 Feb 2022 15:17:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 3/7] drm: Add driver for Solomon SSD130X OLED displays
To: Mark Brown <broonie@kernel.org>
References: <20220209090314.2511959-1-javierm@redhat.com>
 <20220209090314.2511959-4-javierm@redhat.com>
 <YgPE8Z7HxU2wv7J/@sirena.org.uk>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YgPE8Z7HxU2wv7J/@sirena.org.uk>
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Mark,

Thanks for your feedback.

On 2/9/22 14:43, Mark Brown wrote:
> On Wed, Feb 09, 2022 at 10:03:10AM +0100, Javier Martinez Canillas wrote:
> 
>> +	if (ssd130x->vbat_reg) {
>> +		ret = regulator_enable(ssd130x->vbat_reg);
>> +		if (ret) {
>> +			dev_err(dev, "Failed to enable VBAT: %d\n", ret);
>> +			return ret;
>> +		}
>> +	}
> 
> Unless the device supports power being physically omitted regulator
> usage should not be optional, it's just more code and a recipie for poor
> error handling.

The device has a VCC pin but in most cases this is just connected to a
power provided by the board in its pinout header. For example, I've it
connected to a rpi4 3.3v pin.

I guess in that case what we should do then is to just have a regulator
fixed as the vbat-supply in the Device Tree, that's regulator-always-on.

The old ssd1307fb fbdev driver also had this as optional and I wanted to
keep the new driver as backward compatible. But I understand now that is
not describing the hardware properly by making this regulator optional.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

