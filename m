Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 665B0644561
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 15:14:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD2D10E32A;
	Tue,  6 Dec 2022 14:14:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E4CE10E065
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Dec 2022 14:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670336068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zjvIkSL2SBAgsiT7gQ2VbIYNtCKtla6HXdyvgY6EM/c=;
 b=CGWavSvjw8UVflix4pphOVAPvzHCX7xyGSdsVrF2BGLNH40o1M4DZ5qpYuDSELyBTEMMqL
 bH3JgcKHdoThmBQW8ZCPpq1LCzj9k55HcZgV8BWWYMS6kCy5r7nDW+455sO1tDlMyyoQrT
 yObaUl3WpO4PWJf7ONvz+qOG7/4PHpI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-82-2L4ge0kGOZ-lt2mOVvzxgQ-1; Tue, 06 Dec 2022 09:14:25 -0500
X-MC-Unique: 2L4ge0kGOZ-lt2mOVvzxgQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 f20-20020a7bc8d4000000b003d1cda5bd6fso2358216wml.9
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Dec 2022 06:14:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zjvIkSL2SBAgsiT7gQ2VbIYNtCKtla6HXdyvgY6EM/c=;
 b=Q+/eWhRbuwCUVxUjE3EGd3o/oFEcJM//Q2Zeq3f06Lor/OfIQfBqAPBq9ZTJ63tkSE
 s3d9lzJhMBGPdqEyMKqm6xvRW9nt98ShyfjmtYg+gN/sOWCElzqXPtpAuxCLriFoRkXg
 FuR42g3LFdb2FH6lqj4pa3CMiGxsnHEWHEiAi8KCkJBEty9KCGWq1s4YW/Ahe2EzyYfy
 sOr6NK+DyWSQtakKZMZcrLvLCFq6tLquVGdYpSQ2Z+PERIPt76lq2mYaJPLU6+yp5T2D
 h5YjZKbrxi1nTk2YDo1SxlEH0/a6e1m66qlMX607oPnYrZqYB+rKrqjD/mk/6RVEs3al
 b0jQ==
X-Gm-Message-State: ANoB5pk9foJGM1dE5hApFi1+4Wkmlm2tx1eP8PdL2GLDK6FIXgpCbCpN
 59EmjAcXQhlVGe1ygq3OKXj3X+vkj0AgfUzzUIenKxhiEq6rJc3q3ELr91bpaPVXR7gZ6cenq+X
 PcPmTE4sYk/wFB0++DcGNBBCmL7dx
X-Received: by 2002:a05:600c:350a:b0:3d0:74be:a059 with SMTP id
 h10-20020a05600c350a00b003d074bea059mr19348445wmq.177.1670336064004; 
 Tue, 06 Dec 2022 06:14:24 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4WyKP6LGRcLm2eiMh41m+pGGwu5lilQKOC/kqehU6ZzQEBrjtdzGo/MFwLtcjN9cST+hZe5w==
X-Received: by 2002:a05:600c:350a:b0:3d0:74be:a059 with SMTP id
 h10-20020a05600c350a00b003d074bea059mr19348409wmq.177.1670336063683; 
 Tue, 06 Dec 2022 06:14:23 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k10-20020a056000004a00b002365730eae8sm16924437wrx.55.2022.12.06.06.14.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Dec 2022 06:14:23 -0800 (PST)
Message-ID: <27f14969-d71b-63db-7770-5269bf7b9ef1@redhat.com>
Date: Tue, 6 Dec 2022 15:14:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 3/3] drm/tiny: ili9486: remove conflicting framebuffers
To: Thomas Zimmermann <tzimmermann@suse.de>, neil.armstrong@linaro.org,
 Carlo Caione <ccaione@baylibre.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jerome Brunet <jbrunet@baylibre.com>, David Airlie <airlied@gmail.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>
References: <20221116-s905x_spi_ili9486-v3-0-59c6b58cbfe3@baylibre.com>
 <20221116-s905x_spi_ili9486-v3-3-59c6b58cbfe3@baylibre.com>
 <14e5c4e4-30dd-8efd-81e4-d680664ab04a@linaro.org>
 <c460bbda-6e9d-24e8-eb73-2e7207958deb@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <c460bbda-6e9d-24e8-eb73-2e7207958deb@suse.de>
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
Cc: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/6/22 10:52, Thomas Zimmermann wrote:
> Hi
> 
> Am 06.12.22 um 10:41 schrieb Neil Armstrong:
>> Hi Carlo,
>>
>> On 06/12/2022 09:34, Carlo Caione wrote:
>>> For platforms using simplefb / efifb, call
>>> drm_aperture_remove_framebuffers() to remove the conflicting
>>> framebuffer.
>>
>> Conflicting framebuffer on the SPI display ? How is that possible ?
> 
> Calling drm_aperture_remove_framebuffers() is only required if the 
> graphics card may have been pre-initialized by the system, such as a 
> VGA-compatible card on a PC.
> 
> Could the SPI display have been initialized by the firmware? If not, the 
> call should be left out.
>

Agree.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

