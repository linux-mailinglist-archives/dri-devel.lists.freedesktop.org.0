Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA6D5E7940
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 13:16:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB19510E868;
	Fri, 23 Sep 2022 11:16:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F31BA10E88F
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 11:16:37 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id k10so19285315lfm.4
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 04:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=WVY444sgVZKK+vY4euROZT7RCJrRWYm0QFkYeu7q07A=;
 b=GKMyIrG6A6lX/rlrp3TOcU57GiknL+XUxrwfFH/f1akM2DMNy87i4OzM4NX7/XMkx6
 YED9kf6T+9gIhaeTEvZV+unwNBINlTjTsSqf2qWUseD54NmeKDo0INP/1Keu+uqeLBde
 7HicySAx8BM4kdf9ajk0c3LTUdsD6KOhzZW5aUW8Gev6L2UsDUsVcGiOYquJNPz5viII
 kElCm//hSG38MLMDhotwtKhqhhQY5O35ZU45cuzNbI25thZnSm5XBk5JPw7AmCLeHiGH
 OduCbQp04LfBpS0Vetf0LjQoeLTXfjh3hCbVovgepaPCOoCmBjut3+go3MlEosTHYK//
 c7dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=WVY444sgVZKK+vY4euROZT7RCJrRWYm0QFkYeu7q07A=;
 b=lnQLt3gZ8ie4E7KE7I1C7MTxhxvvv26oWHp/C6LATBvxFUeVf4JzByW/PdqiFGKYQd
 I3LDKE+BVpiOapFr9lHqiysGIS23gK7ErJGMORbHkZ2YbpTyeVCpPJCPl+DKJDGz37fY
 Lj98bfIZ69b5QxFIRSMMcmWJCyC9oK/cEiv0IOXCeZA1lgBaiXNrJ66VPLkcV4jK2U97
 OHpQx0zgSIigA+8nwfHOvzilSzzTvNEqsWcMLHiVf0Ul2ataqZL+W9tI5zGRE1SyG/d6
 Cm5LPIZw08m1hTV7hCQAti4jIxrNzXboZG10S77wO1bM0h1Kq1dACs/tATug2ojYxNNk
 CKAA==
X-Gm-Message-State: ACrzQf3j8XWCGq31HwFv6dQh/2erOl6DitZHk22U068NfugWwlmxbzv1
 qXQ4a4JI/EkbWvYZSwCHwavZPQ==
X-Google-Smtp-Source: AMsMyM6ZqgtGE6YGi5NHqU38FwIKEP5Y636y2wBc6bsb7FGrQUA/VEzL6pvHiLgIjd3Bhg+MjURUzg==
X-Received: by 2002:a05:6512:3c92:b0:499:a1ff:d6f3 with SMTP id
 h18-20020a0565123c9200b00499a1ffd6f3mr3099204lfv.153.1663931796319; 
 Fri, 23 Sep 2022 04:16:36 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 du12-20020a056512298c00b004946a1e045fsm1399245lfb.197.2022.09.23.04.16.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Sep 2022 04:16:35 -0700 (PDT)
Message-ID: <f6e669dd-f2cf-6e3f-18bb-25b21e5eab0c@linaro.org>
Date: Fri, 23 Sep 2022 13:16:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] dt-bindings: display: mediatek: dp: Add compatible for
 MediaTek MT8188
Content-Language: en-US
To: liangxu.xu@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 jitao.shi@mediatek.com
References: <20220923013953.5043-1-liangxu.xu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220923013953.5043-1-liangxu.xu@mediatek.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/09/2022 03:39, liangxu.xu@mediatek.com wrote:
> From: liangxu xu <liangxu.xu@mediatek.com>
> 
> Add dt-binding documentation of dp for MediaTek MT8188 SoC.
> 
> Signed-off-by: liangxu xu <liangxu.xu@mediatek.com>
> ---

Where is the DTS? Where are driver changes?

Best regards,
Krzysztof

