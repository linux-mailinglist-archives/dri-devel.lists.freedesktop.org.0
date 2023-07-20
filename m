Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C2D75B08C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 15:58:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A27F810E14A;
	Thu, 20 Jul 2023 13:58:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 498CD10E14A
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 13:58:11 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3fbc12181b6so7216155e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 06:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689861490; x=1690466290; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6KjNhZCS5Ih96I9bAacZuqvFr9UPsBlbZ9B2cRl79QI=;
 b=QwcdJqQCVz4AcTIz1jV7jM+Y3w2Kh3uWs+HE8005/g2KsJ/9gEJp980y2RH+uUxe1i
 r1wYozxNwB47hwICexB/1Y+Gpiys1infL00YzdVJgeijFaaOqt1SeVBC01tK1HhX7TZi
 YRMNDx8cBiT+MKifl1BqeeWkMGWIW8ORMfDYmhfnxhYBo1v2s1owObAvCP6VnPHfdKuW
 nL3qFK1i5m5GoSN0AksyAqwBvSHB9nWA65Vn2I9YZenLGKAKmX+aMlT6PtXLjcdUlm3I
 HbASaAJZ7xpdsATEwjI3eoDw9EF9ErPPNqXBMWWc6ySwPrHVmTVCtDYZLJxFr0wnhrXc
 SHuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689861490; x=1690466290;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6KjNhZCS5Ih96I9bAacZuqvFr9UPsBlbZ9B2cRl79QI=;
 b=Giu73az+QN7v+ymd0OHlS3yYMLfg1LUWcq2fNoKiVVSHbHxbuR+kcPOFIZNVHLgo78
 AmcNtmZ3VFK+/13rd2ZD5Em5Xk8dmPQX+OzbSZvDehHYGwAAvpL126xzBIO8cm+XGJ/p
 mbKfMmwtYXXd7loE0g7mpUli3Yr40oMGc1CeTM8oQC5hF7gsRP9UfP8kJ3QWY0CFi8eX
 g9ICTp/w4ZnEhEKAasZQFdlD457A1kBhmjh/LMPnmozVT1YW3XHcUhzwOqgbueuSn8SW
 4iFDNRa26tAhCi2qjPKZsZp8cj57TVV9x+VT0CzNPb8HIHK/3U4OcBbzaTRS7Xs0u/Of
 4HiA==
X-Gm-Message-State: ABy/qLZ7nASmy0/1CfjoabC1eedylq1GuKKYFBU9dPDohJTBe0Ry0NYP
 zcJiQIcCKPf1HgHmGmbX1lIiRw==
X-Google-Smtp-Source: APBJJlFG9cyOubbOROpvzag6IpZ7+gawUh0kbE6UP3Vgh8NySRsEiGPb78RC8ywPhOF3DSTCEkpT3g==
X-Received: by 2002:a05:6000:194f:b0:315:8fc0:915e with SMTP id
 e15-20020a056000194f00b003158fc0915emr1945057wry.56.1689861489726; 
 Thu, 20 Jul 2023 06:58:09 -0700 (PDT)
Received: from [10.1.3.131]
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id
 e10-20020adfe7ca000000b003143add4396sm1434471wrn.22.2023.07.20.06.58.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jul 2023 06:58:09 -0700 (PDT)
Message-ID: <65a7fc52-5438-3c9d-cd1b-cf8a83986c88@baylibre.com>
Date: Thu, 20 Jul 2023 15:58:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 08/11] drm/mediatek: dp: Move PHY registration to new
 function
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
References: <20230717141438.274419-1-angelogioacchino.delregno@collabora.com>
 <20230717141438.274419-9-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230717141438.274419-9-angelogioacchino.delregno@collabora.com>
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
Cc: nfraprado@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 wenst@chromium.org, matthias.bgg@gmail.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 17/07/2023 16:14, AngeloGioacchino Del Regno wrote:
> In preparation for adding support for eDP, move the PHY registration
> code to a new mtk_dp_register_phy() function for better readability.
> 
> This commit brings no functional changes.

-- 
Regards,
Alexandre
