Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2955B1E4B
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 15:14:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5BDF10E4CC;
	Thu,  8 Sep 2022 13:14:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DC5810E4CC
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 13:14:11 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id bt10so27667719lfb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Sep 2022 06:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=d6L8J87aB1v86b8RgudDsS+xKsHjOOrMMFG5XtkLsqo=;
 b=KHawKIkFgPkUxVPkrjS1pBxHZgetgHTNXzqxeOnAcSGLyIQMDySoPJY0z20Bkyivns
 RPFgcCuGjz4+xShlNPgjCl+R9EueMyB2ktLSK2dZpqECBuL0feaVHYpwNepFy7K7tYSu
 2KvMpZD6jpzhfIwYGIZKHCxFgYI5bGqvoTmZWHyH8sMHA5ne2vHmdeHMcUdzXfZxdrrB
 DrvjEFNw6NB0C4OcfJ7W298bdxJKmhSiODQpTt1GczHtkKhnZfrsDf26fCWUok8Y0zbT
 DyXGnZFjOllz5290Yz1gzA/LcwKkLPd4YWczB9p99j3HJhONBxS5BBuVJOE3kBfLtayx
 ge8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=d6L8J87aB1v86b8RgudDsS+xKsHjOOrMMFG5XtkLsqo=;
 b=ZxvGj563Co9BAsr8oMkdGbN/4xNtXyu9gm3nKTU5czZpaI3HWlsCi7niPs65wKL8U3
 81QomdWIVKCYVr4mrWTJyLccDUEqdLLd4qLvQVo7y2zSwSwYD4LO1FOMBQGDZIiaVvCS
 BVw3Z0nJDuUafCvoUqT8nwfccuod+HW2riQbgGG8Q09lTfjC/D+7x4vI8XmdLcw1FtgJ
 C7sRHFBvXHYJz1Aj/2KXqh/IlGgONEDJKF6oty58zyw9N4a726CGPkH5lyZLpp5utBsD
 NmAwQtEpy6Vq9BeoZaTlkOtK+zW7o+mzibgqaCgpoV2UozFhWgawVIJbhoeUlT8khef2
 kdGg==
X-Gm-Message-State: ACgBeo3cl55oyKUOyFepqk6SkakPNk81GnH0eFus1hfjZa5rci+xaksl
 Qogc32l2mZrJXCOgQCmACDTBHw==
X-Google-Smtp-Source: AA6agR4avfuGtI4mV/LW9eH4t+t9Zcbij4SZp+wKUzY4VSoj42JgpHx8sPN67mwk8vwBWDoNPbikJg==
X-Received: by 2002:a05:6512:3f05:b0:497:9e06:255b with SMTP id
 y5-20020a0565123f0500b004979e06255bmr2549468lfa.175.1662642849511; 
 Thu, 08 Sep 2022 06:14:09 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 w22-20020a0565120b1600b004946d1f3cc4sm3028045lfu.164.2022.09.08.06.14.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 06:14:09 -0700 (PDT)
Message-ID: <cd896ff3-47b7-43eb-c821-8c5fb53c6ae6@linaro.org>
Date: Thu, 8 Sep 2022 15:14:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 0/6] Add first version mt8188 vdosys0 driver
Content-Language: en-US
To: "nathan.lu" <nathan.lu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Matthias Brugger <matthias.bgg@gmail.com>
References: <20220906084449.20124-1-nathan.lu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220906084449.20124-1-nathan.lu@mediatek.com>
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
> This path is based on [1] and [2]
> [1] Add MediaTek SoC(vdosys1) support for mt8195
>     - https://patchwork.kernel.org/project/linux-mediatek/list/?series=658416
> [2] Add MediaTek SoC DRM (vdosys1) support for mt8195
>     - https://patchwork.kernel.org/project/linux-mediatek/list/?series=665269
> 

Can you stop ccing internal/fake/non-existing email addresses?

Your message couldn't be delivered to wsd_upstream@mediatek.com because
the remote server is misconfigured. See the technical details below for
more information.


Best regards,
Krzysztof
