Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F01462EA59
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 01:33:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFF9F10E6BF;
	Fri, 18 Nov 2022 00:32:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB29B10E5FB
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 13:40:09 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id kt23so5093691ejc.7
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 05:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=dOA/XrnM55biePtmSgVQuz/vvaK7Pp/nrxDlHicjXLw=;
 b=b55P44Wa551fN/B8v9btv1bZewuklhAEgqDACB3G4DxO/3tSA+sMxdYw79PP7i80z5
 /sVk8z6Z/ARHsSepF2anN36AOd8gexjbGfhK26rciQbxdkKhb9vn8KyzriTRPVB2kMEM
 BHxe73XSue/R/bzTj2piXsRdJ5SgLqwV+E9Pwc/C5gHFgqdc1qJYwmqN7865ePorvG4M
 RDTmId2tnAr4IBFbw3VlRu9cYDr1GiOL16dxTuDfxgz2dLoLoThE0kNwsv+kdenLKzsY
 EH7hxIxJOu4fvN045NCztwjhhpGrImBWX5L/cRK2m6N45tm3ZYG/rqVRO252aDUQcpyQ
 gzMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:sender:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dOA/XrnM55biePtmSgVQuz/vvaK7Pp/nrxDlHicjXLw=;
 b=pb6uhBpHwQ+joZbUWHw6iDAJt8EObQD64sex6CMTKH9eF5UIZGvP4JddJ1Uy44LpS5
 +jA2BU2ap+ns6nZWQ7oUOh0OVteA2AfoqktO1Zm+WwEk4uSOFyMD54muYMonBJkAggL5
 uFFsvWqocEZ1PnmfYTVwQLFuBCo4APf4+pctrS1pCMygngIqugzZ4UTiZXmO/ZkDVCUY
 616MltIWaCeMHO8oU+ApFVj4mewxNt6OVcJ81exWKtf2UM/kLUDw0p5ZH7fgK33fqaB8
 MCjfPjAaXWGXBBlQSmV+oh8w8q7En8G11vUrkSDFwW4qAKUoryQ+ufL0+NOXc0FXDQmH
 1MwA==
X-Gm-Message-State: ANoB5plvH6yKPMv6FKi7IjvK0/0yotcSxIyeL5wUd8922cRV9RF0bLzu
 vLjR8QMFv1VpDk3lV7cAKaQ=
X-Google-Smtp-Source: AA0mqf6BksfbC9nZboB5WTuEjWop9CJaYyFiqnM/7Bx6amuVd+tme9UjR6NShhiXVh2I+/3cyukngA==
X-Received: by 2002:a17:907:767a:b0:7ad:e518:13fd with SMTP id
 kk26-20020a170907767a00b007ade51813fdmr2155160ejc.323.1668692407595; 
 Thu, 17 Nov 2022 05:40:07 -0800 (PST)
Received: from ?IPV6:2a0e:41a:894f:0:7a60:27eb:954c:5ab1?
 ([2a0e:41a:894f:0:7a60:27eb:954c:5ab1])
 by smtp.gmail.com with ESMTPSA id
 bw10-20020a170906c1ca00b0078dce9984afsm373454ejb.220.2022.11.17.05.40.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 05:40:06 -0800 (PST)
From: Carlo Caione <carlo@caione.org>
X-Google-Original-From: Carlo Caione <ccaione@baylibre.com>
Message-ID: <cd2d4d1e-f42a-da5b-e498-fbb32f792094@baylibre.com>
Date: Thu, 17 Nov 2022 14:40:05 +0100
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
In-Reply-To: <Y3YWdeTLfmDh7UyB@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 18 Nov 2022 00:32:52 +0000
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

On 17/11/2022 12:09, Mark Brown wrote:

> I don't understand what the commit log is saying here.  The 
> meson-spicc driver advertises support for 8 bit words, if the driver 
> is sending data formatted as a byte stream everything should be fine.
> It may be that there is some optimisation available from taking 
> advantage of the hardware's ability to handle larger word sizes but 
> there should be no data corruption issue.


There is no data corruption but the 16-bit pixel data have per-pixel
bytes swapped: for example 0x55AD is sent instead of 0xAD55 and this is
causing the wrong color to be displayed on the panel.

The problem is that the current code is sending data with an hardcoded
bpw == 8 whether the data is swapped or not before the sending.

For 8-bit only controllers the data is swapped by the MIPI DBI code but
this is not true for controllers supporting 16-bit as well, but in both
cases we are sending the data out the same way with an 8 bpw.

So the same image is basically displayed differently whether the SPI
controller supports 16 bpw or not. I'm trying to fix this by sending
data with 16-bit bpw when the controller is supporting that.

Please note that this is what it is done also by mipi_dbi_typec3_command().


>> +	/* +	 * Check whether pixel data bytes needs to be swapped or not
>> +	 */ +	if (*cmd == MIPI_DCS_WRITE_MEMORY_START && 
>> !mipi->swap_bytes) +		bpw = 16; +
> 
> You should check the SPI controller compatibility here.

This is already done in mipi_dbi_spi_init() by using spi_is_bpw_supported().

Cheers,

--
Carlo Caione
