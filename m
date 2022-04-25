Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC7350EB1C
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 23:11:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC01010E22C;
	Mon, 25 Apr 2022 21:11:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4758A10E1BC
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 21:11:24 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id k12so4073652lfr.9
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 14:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=oQazfOAFrQddDPrpYfYQVsnloceCr9NIRYCe8QuCQ6s=;
 b=I+UA4zwpy8anE+yetM6ogFnNuFOQr1aWPNEBZ/cAEPjewlmNGZt/BvuRoWneB6JHpE
 2tfBsAH1/w6JbVK55BfytJtNPDSsbJzbZhdA8KuTTsmJSJQJhmTExgq4Uo0wjX+ZnGfD
 8+C43OZp5XDttcVdchpA4kibuxAXLR2yNCyotKEuLazqnqmtNRCCAiKf2Ooc/Zx/N9bH
 yFvmgdixnX2T9q1xr3aadTeeFQWIAblmN5hR6i56qPLXuE6XeGFfxprumpnq7THNtfv8
 230F0/RiXKeyO4bziFdZoxCK2P4zoxDC000QpDQrgGL/Vb1RscArwMstMuLNkQztbq5Q
 id3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oQazfOAFrQddDPrpYfYQVsnloceCr9NIRYCe8QuCQ6s=;
 b=LLhiAhLqczRiZyPJOrXR5T33XpBNz/+2UdAcYbGgHXdgn4kuNHhX2XXi2ehplaKnQu
 CEO1u4vBsY8AcLyevilflqYcH2y+oRc9JfX1De5K97A7popuUxC2x0FaChG37kjX7kf+
 HGjvQ7iaLT9ZgG7jlNGukuJCvMPK3JyC3U+G+S1xENZad59YERRNZHN04AzI2ehis8OI
 RmXiySUvzKKIvca2Z/D7laqSIRzDToN8KQXo9wwA6u9wCZGhSoTjEJnExJ1NQpU2Jr+D
 G+4qwHTp34W3ziGiZh/FWxf3FG635x9VCra4qtnXCsP6B/Y+EcqT66/BSyQiQUKTiTJv
 ePZA==
X-Gm-Message-State: AOAM531kFL0UFeZPvh7p1oDEonKwUhMrd+DMgzT+UA463QFm2GH2YxJW
 TvrMIO59gD18yRJtNx0EsDGbeQ==
X-Google-Smtp-Source: ABdhPJxcbZtDpr6V9JljEso0M9prK9fOVpFL2+y5PMRZrGKtbo0TOW4NnBVy18JV5UzWakkQ9T4FGQ==
X-Received: by 2002:a05:6512:2828:b0:471:9ef6:f5bf with SMTP id
 cf40-20020a056512282800b004719ef6f5bfmr14342161lfb.122.1650921082135; 
 Mon, 25 Apr 2022 14:11:22 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 b11-20020a19670b000000b0044a385058acsm1522183lfc.187.2022.04.25.14.11.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 14:11:21 -0700 (PDT)
Message-ID: <1564e2b1-e205-aa44-6a30-38a5160b0ec3@linaro.org>
Date: Tue, 26 Apr 2022 00:11:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] drm/msm/hdmi: fix error check return value of
 irq_of_parse_and_map()
Content-Language: en-GB
To: Stephen Boyd <swboyd@chromium.org>, cgel.zte@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run
References: <20220425091831.3500487-1-lv.ruyi@zte.com.cn>
 <CAE-0n53xBM+n__eKKGaCuB+3Ea4O+rNk2PUQbD2bjW3JS7YJBA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAE-0n53xBM+n__eKKGaCuB+3Ea4O+rNk2PUQbD2bjW3JS7YJBA@mail.gmail.com>
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
Cc: linmq006@gmail.com, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 lv.ruyi@zte.com.cn, daniel.thompson@linaro.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 christophe.jaillet@wanadoo.fr, freedreno@lists.freedesktop.org,
 Zeal Robot <zealci@zte.com.cn>, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/04/2022 23:11, Stephen Boyd wrote:
> Quoting cgel.zte@gmail.com (2022-04-25 02:18:31)
>> From: Lv Ruyi <lv.ruyi@zte.com.cn>
>>
>> The irq_of_parse_and_map() function returns 0 on failure, and does not
>> return a negative value anyhow, so never enter this conditional branch.
>>
>> Fixes: f6a8eaca0ea1 ("drm/msm/mdp5: use irqdomains")
>> Reported-by: Zeal Robot <zealci@zte.com.cn>
>> Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
>> ---
> 
> This one fixes a commit that moved away from platform APIs!

The change was introduced in 2014 in the commit f6a8eaca0ea1 
("drm/msm/mdp5: use irqdomains"). I can suspect that at that time 
platform irq code wasn't fully compatible with IRQ domains.

> Reviewed-by: Stephen Boyd <swboyd@chromium.org>


-- 
With best wishes
Dmitry
