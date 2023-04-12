Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 869446DF65D
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 15:03:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F41FC10E7D9;
	Wed, 12 Apr 2023 13:03:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4DB610E7DA
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 13:03:15 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id l16so6012432wms.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 06:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1681304594; x=1683896594; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yjIdUq4Jsx9/GasEwdm41tjYbvcUo9h/pUwit0AG0qw=;
 b=I+U9p2RUdQ0jma7vWiMjgOivywGBJsk9WNavQzLUEh/9XwD46/PWdCmz2jtHMZlyPh
 IJR47kFbuS2krTR8D8TwAoya05XsgHSzcDXHIKFJzmddiFLXTOi+ZU/7tUJOrDz/yILl
 SIXsvKy2gl0NfWrtKgHqPiamvl5ngUisfT9GXgEKfhhEJvyICrgLJbZ3lPLJT7BHpfo+
 OSGfbwxEm0Np0ji7Ls9mAhsRxdI+nrPhkMNNSp2Nx/v3JKn9KszmNHXabkT74hCnStwN
 NBB9zEfXfbjr1st9ZZsooom9HhGVRXK1j0XWYSO1zD6vifKgxUFKlHowMFXVEnUTh0NE
 pq4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681304594; x=1683896594;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yjIdUq4Jsx9/GasEwdm41tjYbvcUo9h/pUwit0AG0qw=;
 b=quHwkXmfMkCd38fz2d/aWG8uBHitHztNm8FAV25KwnmjdgvJLD/lAbbKx9iYiPa+V5
 ZcSgxNM2fw+bPHvQPKr+d8QLg9oT842CGSzRwagZyp03DPSHDA4DTAu/9hBTYrJxPJi/
 lPTg+eRSaBwiTiC2OuICewuu9lMqX9gOQ7WvIM9f0hSMVCp4ewUxBL905T34BM3YI+i/
 N+ER9vUvFHlbqaX71RJE4WI71OCaiCsYPWF5mMmT9xrACh/N8tEWIwwFVujJZD11lfZk
 B2gY6ZL8RWqNgG1BFp58ITyHzEv8zMFpLomKVqLZf2cSxROHxT23Mr9ojpqdjBD3uL4x
 AjIQ==
X-Gm-Message-State: AAQBX9c5Uys/r3lAX2lZ2oI1H/tUSxy+3WD34I5ToeneRPmikxHEQXPj
 a39saBSoluV2WiHQGFFPEX1R+Q==
X-Google-Smtp-Source: AKy350bDmpM+Lm/AqJiXBxAL4RoNuLKnffa2b9rPXFmlseSpOQ7ouXWDEFlId84sgS3bp9uw+f9nsQ==
X-Received: by 2002:a05:600c:292:b0:3f0:a137:90d9 with SMTP id
 18-20020a05600c029200b003f0a13790d9mr218544wmk.3.1681304594013; 
 Wed, 12 Apr 2023 06:03:14 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 h15-20020a05600c350f00b003ee9f396dcesm2439248wmq.30.2023.04.12.06.03.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 06:03:13 -0700 (PDT)
Message-ID: <c2b4cc90-9dd7-60b5-66f0-56a4d19d63e3@baylibre.com>
Date: Wed, 12 Apr 2023 15:03:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 04/27] dt-bindings: display: mediatek: aal: Add compatible
 for MediaTek MT6795
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@gmail.com
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-5-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230412112739.160376-5-angelogioacchino.delregno@collabora.com>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 linux-phy@lists.infradead.org, kernel@collabora.com, xinlei.lee@mediatek.com,
 kishon@kernel.org, phone-devel@vger.kernel.org, jassisinghbrar@gmail.com,
 linux-pwm@vger.kernel.org, u.kleine-koenig@pengutronix.de,
 chunkuang.hu@kernel.org, jitao.shi@mediatek.com, houlong.wei@mediatek.com,
 chunfeng.yun@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 vkoul@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
> Add a compatible string for MediaTek Helio X10 MT6795: similarly to
> MT8173, this SoC has the gamma LUT registers in DISP_AAL.
> 
> Signed-off-by: AngeloGioacchino Del Regno<angelogioacchino.delregno@collabora.com>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

