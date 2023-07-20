Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 207B475B3A7
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 17:58:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46D5F10E5C4;
	Thu, 20 Jul 2023 15:58:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C95010E5C4
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 15:58:50 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3fc0aecf107so7734765e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 08:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689868729; x=1690473529; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=APInPB7RqnE96OD+GVxCziUT6IhjtDsuJ0KQfyBikKg=;
 b=U1XvacrrAcEXhZMWOEs1D1gXdFvBG7S7/Gx3vXiguI8p3v2ePMaObAOQ7V/JaoDCJI
 Zyq1cH0GP6m4oMOI7VO7yJVL8tXcSswAfJUq4SO9ns5tuc4WsG8tMzncIpDosSnDEsme
 mQvBAFW9njBOLCIDbUob6/xrsbHPsibQratHN3Ktorg+l54KFs8vdnUb8MOKdm2LngBE
 HnemVN/pMIrZCTt4kW0igczwYXEwMylgWAhiZ6Q7U9FddzkCmvrNk25w91N2Mt2Bc4GA
 Dp5DBrajp4H05GmZvGAPxZeRuJBOkyZRGsEvLIA6nHFznDWNPiyRkpGBA9fXa1FKl8W5
 JbQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689868729; x=1690473529;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=APInPB7RqnE96OD+GVxCziUT6IhjtDsuJ0KQfyBikKg=;
 b=ZFAJXySeNSYlZDkgXuN/t3dZvikoKV/6TBSg+8X55Y5rSOrlTd2Fpb6Z4NiKJysgj6
 AE3ZoHCFKv8p0TUQj4ZX+SxiVn4Irh4zl1kPL7rVTtKo2kPZNl0rvieXY1KRoAOV7GN2
 WH4dh29mZzEFi970VEUE4k9oyAi+/VWXdkdtmlOfFq6G23xUmCdRz3x7VFWbJctdnHmG
 OQzYhnyHRNMS2e7B/FnhiSqckc8Owb7GIGqEuO6dMoyDF9OlUDR1Roo0QuJzEqbTQOoZ
 c4DY+4Do8a7zAl2MtXN4hBksCy1aGLUWv786MdrNlGLG58/w3KkFqgjGM0Rwgl3roCu4
 foHQ==
X-Gm-Message-State: ABy/qLavWNh6TW9x0gKPDhjQ5F9SuODGGDO29JbXdW00yBpePZ8uH6lz
 HH/sWfNPmU9Zdiz9DUH/og+YIgAZoN4SqnKpobY=
X-Google-Smtp-Source: APBJJlEW6ehSEwNUSYMtsbgzoCe6bXnwpN2+DywULbS7KdO346A4Zad5/hmiohby/H5JtNgF88pe6w==
X-Received: by 2002:a1c:7501:0:b0:3fc:21:2c43 with SMTP id
 o1-20020a1c7501000000b003fc00212c43mr2181991wmc.13.1689868728760; 
 Thu, 20 Jul 2023 08:58:48 -0700 (PDT)
Received: from [10.1.3.131]
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id
 c22-20020a05600c0ad600b003fa98908014sm4228769wmr.8.2023.07.20.08.58.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jul 2023 08:58:48 -0700 (PDT)
Message-ID: <6a1218a6-5825-2366-f3cf-d44e1e9956ed@baylibre.com>
Date: Thu, 20 Jul 2023 17:58:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 04/11] drm/mediatek: dp: Use devm variant of
 drm_bridge_add()
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
References: <20230717141438.274419-1-angelogioacchino.delregno@collabora.com>
 <20230717141438.274419-5-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230717141438.274419-5-angelogioacchino.delregno@collabora.com>
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
> In preparation for adding support for aux-bus, which will add a code
> path that may fail after the drm_bridge_add() call, change that to
> devm_drm_bridge_add() to simplify failure paths later.

-- 
Regards,
Alexandre
