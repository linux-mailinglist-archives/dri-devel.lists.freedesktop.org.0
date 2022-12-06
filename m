Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC8F64553D
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 09:10:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D7CD10E37F;
	Wed,  7 Dec 2022 08:10:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6110410E321
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Dec 2022 13:00:54 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id t17so6042256eju.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Dec 2022 05:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wPt4+hNHEAygAYm/iIi7WWfY6gI8L5cWMRSUMDDponY=;
 b=bQCKAqQfljf1U+dmf1KTvgvajxOVvy8g4xkI4rqmjigYqgb9X1FMbQ8tIMdrKaz3P6
 rctDhvLQTL+2Q4qbe1stTd1+SPdOxXAgcDeFRdvGHLkC4LInwOCbzeVlXod0yH3gpiAr
 vrxak2zCWhjeVMx+yMy6Vdn5liiPfn/oxVrUaD/UkMpxYVrD+P6N7Bmf4smucUSd/rNo
 2Xehk9hDqq8zPpddbXzqRxYnWw1k/32h5/s3p9KEseBLmRGtDxdiNdZEEVps0v+qdwl4
 2j+wS2CBuRpXP4IWlQlBxw8lvGERcYYR6izUxZUShkdjLvgzgqcywwDgvqBhKLq7F29H
 Holg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wPt4+hNHEAygAYm/iIi7WWfY6gI8L5cWMRSUMDDponY=;
 b=iiPJVZRL11I/tHhMpvTFCMRF4khbxQZCp/UztKLD8/KW3sjCEHJm6nsUPnDHOKxFFu
 ze+Cvsk/b1iiYrHrMPjcjLfLeJJ7h6pvSidDJRraCsbL7Rsb7f7ztXaVYWFrw5bpHYeC
 W+O9jWaJGYMLuORdMK8kvjvtk131U+AGpIeOILJeUSfS6Lu7yyszNlSgf/hYQ/p8IiYR
 yJleM8B5CqCrFsg29EdKxeAwVJ2Qx3eNwZHf0j/wiHcijWP+1pOZqPlod7R0yMdRlmT3
 U0TZT6ImR8Rzz21LdjB+ztNTRGrodOVJf8vmQKQlehKGeS7ao6+tiHlm3au0/fAfGo9B
 99lg==
X-Gm-Message-State: ANoB5pmsUKNtRTHPdpmedrFXWz5hti47+p4y5NoThMCjUvHS1ABo4dxh
 MrSNrx9Pa+HW8CxC+Q0KY2jNQw==
X-Google-Smtp-Source: AA0mqf4ZqirxuOZeT0doTihcv0ObkbVOPHk5CHTRLxdM1jLRtMbB2+TyECyb6JOuMmm8aMSm/aDMXQ==
X-Received: by 2002:a17:906:1585:b0:7ad:84c7:502d with SMTP id
 k5-20020a170906158500b007ad84c7502dmr58639319ejd.177.1670331652808; 
 Tue, 06 Dec 2022 05:00:52 -0800 (PST)
Received: from ?IPV6:2a0e:41a:894f:0:5e13:2125:2912:2c56?
 ([2a0e:41a:894f:0:5e13:2125:2912:2c56])
 by smtp.gmail.com with ESMTPSA id
 fe17-20020a1709072a5100b0077a8fa8ba55sm7325471ejc.210.2022.12.06.05.00.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Dec 2022 05:00:52 -0800 (PST)
Message-ID: <9ec0204d-ca4c-afd9-33d6-1ebaaaf6b144@baylibre.com>
Date: Tue, 6 Dec 2022 14:00:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 3/3] drm/tiny: ili9486: remove conflicting framebuffers
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, neil.armstrong@linaro.org,
 Daniel Vetter <daniel@ffwll.ch>, Jerome Brunet <jbrunet@baylibre.com>,
 David Airlie <airlied@gmail.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>
References: <20221116-s905x_spi_ili9486-v3-0-59c6b58cbfe3@baylibre.com>
 <20221116-s905x_spi_ili9486-v3-3-59c6b58cbfe3@baylibre.com>
 <14e5c4e4-30dd-8efd-81e4-d680664ab04a@linaro.org>
 <c460bbda-6e9d-24e8-eb73-2e7207958deb@suse.de>
From: Carlo Caione <ccaione@baylibre.com>
In-Reply-To: <c460bbda-6e9d-24e8-eb73-2e7207958deb@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 07 Dec 2022 08:08:46 +0000
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/12/2022 10:52, Thomas Zimmermann wrote:

>> Conflicting framebuffer on the SPI display ? How is that possible ?
> 
> Calling drm_aperture_remove_framebuffers() is only required if the 
> graphics card may have been pre-initialized by the system, such as a 
> VGA-compatible card on a PC.
> 
> Could the SPI display have been initialized by the firmware? If not, the 
> call should be left out.

What's happening on this board is that the builtin simpledrm driver is 
creating fb0 backed by the framebuffer prepared by u-boot / grub, and 
this the framebuffer being used by fbcon at early boot.

When the ILI9486 DRM driver is probed later during boot a second 
framebuffer is created (fb1) and when fb0 is destroyed, fbcon still 
remains attached to a non-existent framebuffer, so the user is left in 
the dark.

What this patch is doing is that when the ILI driver is probed, fb0 is 
destroyed and a new DRM-backed fb0 is created by the ILI DRM driver that 
can be used by fbcon, so the user can correctly see the console on the 
SPI display.

Cheers,

-- 
Carlo Caione

