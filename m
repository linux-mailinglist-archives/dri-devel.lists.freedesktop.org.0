Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E462766DC7
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 15:01:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 329A710E6E1;
	Fri, 28 Jul 2023 13:01:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C19E10E6E1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 13:01:35 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3fbc59de0e2so21528205e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 06:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690549293; x=1691154093; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GHiawQpngVfU3Z6lAbvF/XFA4hRpbcAvvOhJloZt9Vs=;
 b=awllWdar0JnfZi5DTXXYlC2hQRqstsq4OagnOvDE4Y4dgS1nuIGsHmsgsIPkFO1t3J
 iCFiJqPRuQWI6hod3BhObT+26Y5r1Vjfu4ukCouCZ4VrA8E6CwMY6ZjA3o+l1hMb4AHF
 8GXsGhKOFGuM6+b/QIH3Jk5vpy6aKpIvO2sUafOsqqCerx9CRGYvA1MXUDz/DRrCv+Pb
 DLe9t7/gpBaIrYcFkAS+YAH0WuiKkFibdTsU7EfQKI/zfvZT55kbifsD83OV/+NiA9By
 c5mMuMTGuDSRi3A8iM4UxN5sx6ZQ/ZbJSa/pWb+5xqGErG61MWGbvkHSDNHoS588BwGx
 5mPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690549293; x=1691154093;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GHiawQpngVfU3Z6lAbvF/XFA4hRpbcAvvOhJloZt9Vs=;
 b=jE6PukSqtZ7hY8MF8CVHLnTWO249nYPqCEtfHhksE6HWCklfX+76yIpIgcu9LyQ7Y6
 avQvydDyJ+0c0xT7uBwFUv2pklDSRTgnILTQeMCC0z9mJMGnX4b+/+l0DqicS7I1bhcG
 6Qgc1rihujyiEapsWGRjXXKuj4PRuSPUd3YVDB27ECKqCn5bJlfvb6/Qgua231OW9fav
 DBdrq7am26wq1/xlQQ+0wSSU5tc80wR3hyCUqjx8aH9cY13jNvzIkhTBflXEinZKjKuy
 jSIetB4aXtbrY1xfHXSJ/+6YAr94Sw1Md6mWdSerLDDsM5KweDMEqZOunThsLnFXh8Qw
 NBoQ==
X-Gm-Message-State: ABy/qLaXdflIOj/IqprJf1tlkeldqSdlUcsOqkjxrdppBAezHGGHudp2
 4F8uwvIrz6CgjycYeaU8gtwPPA==
X-Google-Smtp-Source: APBJJlFsN+yCMtYDAo87KgEo3nUVITs5qB6btu/td2eWZ7u9kpNIrrhvdquppQoWVobCDh5dBZDZAQ==
X-Received: by 2002:a7b:cc17:0:b0:3fd:2e93:c524 with SMTP id
 f23-20020a7bcc17000000b003fd2e93c524mr1690329wmh.26.1690549292943; 
 Fri, 28 Jul 2023 06:01:32 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 p24-20020a05600c205800b003fc01189b0dsm4174594wmg.42.2023.07.28.06.01.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jul 2023 06:01:32 -0700 (PDT)
Message-ID: <8b47f7ed-9d21-c244-716d-5a9c3cabd16e@baylibre.com>
Date: Fri, 28 Jul 2023 15:01:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND v6 07/11] drm/mediatek: gamma: Support specifying
 number of bits per LUT component
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
References: <20230727094633.22505-1-angelogioacchino.delregno@collabora.com>
 <20230727094633.22505-8-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230727094633.22505-8-angelogioacchino.delregno@collabora.com>
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
Cc: "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 ehristev@collabora.com, wenst@chromium.org, matthias.bgg@gmail.com,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 27/07/2023 11:46, AngeloGioacchino Del Regno wrote:
> New SoCs, like MT8195, not only may support bigger lookup tables, but
> have got a different register layout to support bigger precision:
> support specifying the number of `lut_bits` for each SoC and use it
> in mtk_gamma_set_common() to perform the right calculation.

-- 
Regards,
Alexandre
