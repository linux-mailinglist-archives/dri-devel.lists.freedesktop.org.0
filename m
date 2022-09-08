Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C726E5B1DF5
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 15:07:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6246310EAD7;
	Thu,  8 Sep 2022 13:07:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA4310EAD9
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 13:07:08 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id x14so12253982lfu.10
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Sep 2022 06:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=5u6/MtXpxn1tTwAaduJUsG0IZt/fBpU15ZKPc1fiE2o=;
 b=ehPfB6s0nVoR+tfYmVzHTZew8S0nkhf/njyDNfgALVDMbGOdgHuGGmQui0Pd7WnIsF
 I3JDjrelF0pvS8dBTeBTtCZc8FneI1LHcuAFJCg8RicNTf6nRpUjcfWcM0AR0EpgScdJ
 yvtWWmj6+anIcTY/ll1vMJZV+kHOAn+Bso7lm/mzGAZKtTDAdHRmZzAglSa9AOo/5Lgv
 ftsdKfEsM8lFNMy8ljTbmhzHftdY9nEWVi0dkpR1/FoN2XMM3756dODbS4srP5aCoeko
 JN0omm9q5QGOZhll2wwXkOHiCqv66gb6+/Ad+QJz5I62NEGPizwF0b+PJmcqGwlIHj4I
 JExA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=5u6/MtXpxn1tTwAaduJUsG0IZt/fBpU15ZKPc1fiE2o=;
 b=xeNUgZr1hCk3VpxIYyPji82wTOAuOkwXkEj1O2GIpUyukKB9TpUF8uD5IUestusKeV
 3vBrlHOvWnJ6zV5j1btG4VUSB62wlj2/5ehJVN+wUPeN4agx4E1xr1u4NdelcuNLhV9L
 maxAYiahyc6jCg6FcMi3en4UhN0JVPYgxQr4oQYXOc3BADVQWZzNQScVroU0MvuU9hJH
 868TmAsdkAzpErLHK6d30d4wcI1NShqL5GfPD/+XLJrAKxhJnCuMSx0AE2DE3kbhcEVC
 hsgehSCjdW9oLhspiurWKT/rdfHoeXRVCYqRF2AYAjLHFCEjFdXJLz57VXt8DOHsNtVl
 t7hA==
X-Gm-Message-State: ACgBeo2z5IBHsdvwnTdbhhb4+nsVI2VUAgV+mo0+85qTkGYCmQx8CD40
 a/Pso+sUaB9i7IiDYNEQwHZiaQ==
X-Google-Smtp-Source: AA6agR6wXnCQ6Vkqjjc03U6QxWxuJlZ7Fdfx0r4tDx4eRfk3Kfg7iqmZkdEZRBaoTN09hgyUFzPdFQ==
X-Received: by 2002:a05:6512:10d0:b0:494:7811:e673 with SMTP id
 k16-20020a05651210d000b004947811e673mr2559502lfg.400.1662642426042; 
 Thu, 08 Sep 2022 06:07:06 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 a25-20020a196619000000b00497cb9f95a0sm319728lfc.51.2022.09.08.06.07.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 06:07:05 -0700 (PDT)
Message-ID: <603072dc-3595-ed54-53de-e88a0579d78f@linaro.org>
Date: Thu, 8 Sep 2022 15:07:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 2/6] dt-bindings: mediatek: modify VDOSYS0 mmsys device
 tree Documentations for MT8188
Content-Language: en-US
To: "nathan.lu" <nathan.lu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Matthias Brugger <matthias.bgg@gmail.com>
References: <20220906084449.20124-1-nathan.lu@mediatek.com>
 <20220906084449.20124-3-nathan.lu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220906084449.20124-3-nathan.lu@mediatek.com>
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 linux-mediatek@lists.infradead.org, lancelot.wu@mediatek.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/09/2022 10:44, nathan.lu wrote:
> From: Nathan Lu <nathan.lu@mediatek.com>
> 
> modify VDOSYS0 mmsys device tree Documentations for MT8188.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
