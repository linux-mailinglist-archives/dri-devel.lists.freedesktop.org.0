Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF639630EBF
	for <lists+dri-devel@lfdr.de>; Sat, 19 Nov 2022 13:39:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F4C810E12B;
	Sat, 19 Nov 2022 12:39:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C06910E239
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 19:02:36 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id g2so7010031wrv.6
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 11:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=E5Ey+SWUGHe54inhYQO4Q9IAek2nNg4LJ02tyTCqBBc=;
 b=muB+SifbTgI90sosGYp1Rdn9323oxvY/zKHPXxKDBsUaWLb+RDwNiQr346MUdyu7lC
 Gucft/tc7JBy/sxc44JyFyG2pL7UhNO5tik1/CaLmaBOOQFGFjDrt0rB71jm5h/WW4VN
 QNg3RKWX0yEJPqu7dLKG9Oz+By3cLCmQAhF8eLI7rFfy2yycAgWBMaPK9DwHZxe3OMnd
 Ij6RcFnNjlBq625Wwun3KE3WP0OiqrZKmC86roZKUid0EjoAuLba4qAFT4oNMBoenwt7
 RAsO4KMWBw0qoEuZZ66LqXSWOJp+pEvUrWX9/krmnj7hktPOkvvrhpqfLLg8YTYrYNQX
 vy1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:sender:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E5Ey+SWUGHe54inhYQO4Q9IAek2nNg4LJ02tyTCqBBc=;
 b=DuC9jZVKYg0VKMYTXZt/qlZ57jEeBjZ7wkHe4oNFwO784ucJihoyB5B6nzCkykIbRy
 Msq4REgaqOciOqkROhmSuz08gMicSGDm0Q0gRUmeqDpVL3ElHfkUqX4PG5tnR9pB0b1T
 2RudoCvLF7v6p+iBQhx1XQJX6AwpGqEEDZNev2ToGr8PSbm2TkRRmz0+6k9S66s/2Avh
 alzcuNE+Cjb/ilBugvF6rzxKp9kfZF7Go3qfk6D4uGq6ucDBO/6V3qCYTzuWciQCq/3l
 qY64qMzBd0iViK0y7eAjfYciXqyF1Q0UYJ4GVC2hvlKq2T2wy/d0ix/Ns4sTUl97hR2k
 ZCmw==
X-Gm-Message-State: ANoB5pnhZwjuQaGVcsr8YaYSHBD0ISnwD+dTFrGOn3Jzmoftt0uTGMDS
 TTXHpY6WmzncmTVpvtQk+rM=
X-Google-Smtp-Source: AA0mqf6w/1xAUqgYy2FX3lJHlg67dGBf2UYoc+mhcExG80QMtV/cbLJw50V7xfWynisTt8PVUp27yg==
X-Received: by 2002:a05:6000:114f:b0:241:c80c:5f54 with SMTP id
 d15-20020a056000114f00b00241c80c5f54mr476592wrx.15.1668798154591; 
 Fri, 18 Nov 2022 11:02:34 -0800 (PST)
Received: from ?IPV6:2a0e:41a:894f:0:6f8e:6bf6:725c:d7d5?
 ([2a0e:41a:894f:0:6f8e:6bf6:725c:d7d5])
 by smtp.gmail.com with ESMTPSA id
 u16-20020a05600c19d000b003cf37c5ddc0sm5775361wmq.22.2022.11.18.11.02.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Nov 2022 11:02:33 -0800 (PST)
From: Carlo Caione <carlo@caione.org>
X-Google-Original-From: Carlo Caione <ccaione@baylibre.com>
Message-ID: <8a3bdd84-2789-1b42-976f-2843320750b6@baylibre.com>
Date: Fri, 18 Nov 2022 20:02:32 +0100
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
 <e36142ec-6b7f-e667-7d6b-48234318c8cd@baylibre.com>
 <Y3eoYTZRyRJnze1z@sirena.org.uk>
In-Reply-To: <Y3eoYTZRyRJnze1z@sirena.org.uk>
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

On 18/11/2022 16:44, Mark Brown wrote:

>> The problem arrives when your controller does support 16-bits, so 
>> your data is not swapped, but you still put the data on the bus 
>> with 8-bit transfers.
> 
> Why would you need to use 8 bit transfers if the controller supports
>  16 bits?

No idea why this driver is forcing 8-bit transfers when the controller
supports 16-bits (this is what this patch is fixing).

My theory is that this driver was written with the Raspberry Pi HATs in
mind and (AFAICT) the RPi has an 8-bit only SPI controller so the driver
author didn't bother with anything different.

--
Carlo Caione

