Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 081E0607853
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 15:24:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A363F10E500;
	Fri, 21 Oct 2022 13:24:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68C4210E500
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 13:24:21 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id a6so3670391ljq.5
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 06:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8XVCt8zk03c9asrvK7r0rw8Bvfy8tRtb9InAD3Pc+wE=;
 b=I1uw4Swogq+wFwM4eZF4U7T0psUAUtaSiBLONbK7SmiRmwri2Fli7EFsCSAelhpI/E
 pKi+pRrn4XFdYMyRvAi+m+J81nErFKriRGZxtqEQVBFXDoEspocnP1KnqSQwzt3jYUm4
 xO+mMbAeugwp0EZBTbl26sFFg82143NQxMzILi2pRWuu8m7kkMQbYhQN8eLLcvxRWERw
 LGnlWFD6YQcQt6Pt5+DztsobpIts7k6ac5FIFQi3nwed8pbLI1Q2McNcAokKzK0DeDXB
 Al/YixJncrcx5IpuYgoqbgggSY5btOl8oeRJyLQJnKpaLmMxvfZ9ct7mTS8/84XXpsj3
 Qbow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8XVCt8zk03c9asrvK7r0rw8Bvfy8tRtb9InAD3Pc+wE=;
 b=gSIx+b6q50MO4+R0HDaNrl+TR1VkgE4GVdXBr7nnXN2GX03f5KUcJ1FxNr702N099U
 OOhX+F4skGlP3wtMjM5bl4vCBTq4UGiZi0P9HfptTukb3A+igKB2U3l8GvoGTgzl0ZFM
 Uhxed15dLgB8RkyYfBxGP1QAnZhAl3rXzAvRxDbAtGG5+gr0hagW/kTXPbci0WsndTSp
 hMQmVnX6/k7gFBuMljbAcTNKHS/1LEPstg6mbYKWO1o5moNEh4ryjrxkCkSmpV1AHhVy
 rwEg62hwf+OUB7ILi3CJc4sro42zUiEx/yi0U/4y2prNBs/A4WXMbItoYvVrwtyvFo5T
 VNWA==
X-Gm-Message-State: ACrzQf0hWMRNTwzB4gtvPi4XjLdDt0QpGDEermPPGrChcUGBs8uQSTjX
 yCqMR/iUy4DTOsxPki0Qvts=
X-Google-Smtp-Source: AMsMyM5sFCxauhaoyvskm4EO/dQHCsltNX5NPBoPJjuzzzwYzLjYNbmiDc0KlKoPXWDpf5yJVFWRgA==
X-Received: by 2002:a2e:bd0e:0:b0:267:fad4:7f72 with SMTP id
 n14-20020a2ebd0e000000b00267fad47f72mr7117490ljq.130.1666358659630; 
 Fri, 21 Oct 2022 06:24:19 -0700 (PDT)
Received: from ?IPV6:2001:14ba:16f3:4a00::2?
 (dc75zzyyyyyyyyyyyyyby-3.rev.dnainternet.fi. [2001:14ba:16f3:4a00::2])
 by smtp.gmail.com with ESMTPSA id
 q8-20020a056512210800b0049d3614463dsm3158404lfr.77.2022.10.21.06.24.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Oct 2022 06:24:18 -0700 (PDT)
Message-ID: <d1ed9ab7-6d67-fd93-6a77-86ea029eedc5@gmail.com>
Date: Fri, 21 Oct 2022 16:24:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v4 2/4] gpu: drm: sii902x: Use
 devm_regulator_bulk_get_enable()
Content-Language: en-US
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
References: <cover.1666357434.git.mazziesaccount@gmail.com>
 <1ed8351c2cb4911fcda21b97f7a7b089e955c301.1666357434.git.mazziesaccount@gmail.com>
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <1ed8351c2cb4911fcda21b97f7a7b089e955c301.1666357434.git.mazziesaccount@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org, Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, dri-devel@lists.freedesktop.org,
 Liam Girdwood <lgirdwood@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/21/22 16:18, Matti Vaittinen wrote:
> Simplify using devm_regulator_bulk_get_enable()
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> Reviewed-by: Robert Foss <robert.foss@linaro.org>

Robert, I did slightly modify the return from probe when using the 
dev_err_probe(). I still decided to keep your RBT - please let me know 
if you disagree.

Eg, this:
> -	if (ret < 0) {
> -		dev_err_probe(dev, ret, "Failed to enable supplies");
> -		return ret;
> -	}

was converted to:
 >   	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to enable supplies");

Yours
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

