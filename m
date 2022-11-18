Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 785FC630EC1
	for <lists+dri-devel@lfdr.de>; Sat, 19 Nov 2022 13:39:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F5A610E172;
	Sat, 19 Nov 2022 12:39:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7665610E22E
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 10:36:30 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 o7-20020a05600c510700b003cffc0b3374so3560132wms.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 02:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=o2gq3WkhxO5jelfwCv/WS0BWOBOHKufpRkH4v9U9Wao=;
 b=d4PKh8zw6k/K/IW7TceQGwknGbrYWtGWKCioj737b7AqjDamyVEgbP8oStwlBRCsgr
 2r+/vH1UGVJOQi3gaRMn2/XRtbLw90ezM4z5Ya2pPGHfUfTa3oyxFx9a+7DOoqP0b2IL
 Kf5PO5zgnl/Rxe8HXYNlDFTV1qDvsgryqooTi2Xg1eCd+lL7Vm+m3IFbeDrbmrvPFrR4
 1z2QirjNW8QjJ5uhQD1nVJ6F8m4i1ujFlklWkQRMdwxsyqoTzhnrwxCIgN9RanPK0Zy3
 eYOPIE73fiy1sLxHGUNDjbLWFPhV55RCsjfoJGT3y+8U0p71f425cbNfu5I1QBh41G/X
 sc6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:sender:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o2gq3WkhxO5jelfwCv/WS0BWOBOHKufpRkH4v9U9Wao=;
 b=p+j87uNBdEVDyd9SqbK15ycpyGRuIsttwXhZyjEmT0wew8Cm883Q2U5Z0S/2Qq5ELv
 bs/NyQi+tHF46+2dsWzR4dKyYh9WmJ9gDUMT+iZ5aPBTzH1QtP5cptVG8a6tk98hLoct
 NqESzO+eyZZfMyz/DvVoKapz05mJtkNYKgHqyy0wknscZl9gePuoeD4rsSy6Ts7+vVyI
 F40tga/F2FlrZfcROhYoxpeBVarOKdpuuxY1syaxUQNx8Z9sq//P9HArwwdg8dYj6H0s
 /i+MRQbZdHSOS+xx6IrH1m1m3dqQL0XuqQUEoG5fcWPWAmF101VZl2gDsO2GSYL4VY+x
 T0fA==
X-Gm-Message-State: ANoB5pktgIuc/7FH88mCS0nnc5fALgv20q8o/0Lq1LeM94E3E0KyOg6X
 CW3k1dllPx7YqmF3eRWrCwE=
X-Google-Smtp-Source: AA0mqf7o5IRd2H8nnmtyx5JfUpkr4cMqOd/06z+Ilwq8xBCC6RfYEnOjn0eWatL/t/qAOLXQQG9O4Q==
X-Received: by 2002:a05:600c:4d0a:b0:3c6:a7a1:eebd with SMTP id
 u10-20020a05600c4d0a00b003c6a7a1eebdmr4357430wmp.176.1668767788532; 
 Fri, 18 Nov 2022 02:36:28 -0800 (PST)
Received: from ?IPV6:2a0e:41a:894f:0:c794:607e:a911:a21e?
 ([2a0e:41a:894f:0:c794:607e:a911:a21e])
 by smtp.gmail.com with ESMTPSA id
 f28-20020a5d58fc000000b0022e36c1113fsm3230241wrd.13.2022.11.18.02.36.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Nov 2022 02:36:28 -0800 (PST)
From: Carlo Caione <carlo@caione.org>
X-Google-Original-From: Carlo Caione <ccaione@baylibre.com>
Message-ID: <e36142ec-6b7f-e667-7d6b-48234318c8cd@baylibre.com>
Date: Fri, 18 Nov 2022 11:36:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/3] drm/tiny: ili9486: Do not assume 8-bit only SPI
 controllers
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20221116-s905x_spi_ili9486-v1-0-630401cb62d5@baylibre.com>
 <20221116-s905x_spi_ili9486-v1-2-630401cb62d5@baylibre.com>
 <Y3YWdeTLfmDh7UyB@sirena.org.uk>
 <cd2d4d1e-f42a-da5b-e498-fbb32f792094@baylibre.com>
 <Y3ZMT4F3+3bjNXKo@sirena.org.uk>
In-Reply-To: <Y3ZMT4F3+3bjNXKo@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 19 Nov 2022 12:39:05 +0000
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org,
 linux-amlogic@lists.infradead.org,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/11/2022 15:59, Mark Brown wrote:

> So this is an issue in the MIPI DBI code where the interpretation of 
> the buffer passed in depends on both the a caller parameter and the 
> capabilities of the underlying SPI controller, meaning that a driver 
> can suddenly become buggy when used with a new controller?

The MIPI DBI code is fine, in fact it is doing the correct thing in the
mipi_dbi_typec3_command() function. The problem is that the ILI9486
driver is hijacking that function installing its own hook that is wrong.

> I can't really tell what the bits per word being passed in along
> with the buffer is supposed to mean, I'd have expected it to
> correspond to the format of the buffer but it seems like perhaps the
> buffer is always formatted for 16 bits and the callers are needing to
> pass in the capabilities of the controller which is then also checked
> by the underlying code? This all seems extremely confusing, I'm not 
> surprised there's bugs.

Correct, the buffer (pixel data) is always formatted for 16 bits and the
bpw is to indicate how this data should be put on the bus (according to
the controller capability).

If the controller is only capable of 8-bit transfers, the 16-bit data
needs to be swapped to account for the big endian bus, while this is not
needed if the controller already supports 16-bit transfers.

The decision to swap the data or not is taken in the MIPI DBI code by
probing the controller capabilities, so if the controller only supports
8-bit the data is swapped, otherwise it is not.

The problem arrives when your controller does support 16-bits, so your
data is not swapped, but you still put the data on the bus with 8-bit
transfers.

> At the very least your changelog needs to express clearly what is 
> going on, the description doesn't appear to correspond to what
> you're changing.

Gotcha, I'll try to clarify that in the next revision.

Thanks,

--
Carlo Caione
