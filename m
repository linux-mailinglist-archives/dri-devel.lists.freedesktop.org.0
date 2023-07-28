Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD862766DBF
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 15:00:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 067CC10E6E0;
	Fri, 28 Jul 2023 13:00:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E7DC10E6E0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 13:00:35 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3fbc5d5742bso23034965e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 06:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690549234; x=1691154034; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YRiix5Wbu8cUEwewXZbHXypVIH/8I/HGpsd1Ld0zKcA=;
 b=uHTsjZTdPbQOhN2xXT6vdB0e9iO2q8OEekgi3R6Xo0vBRxfuKAXOdM3HXC2odGRF6g
 5kH+wW4g1ClRUuR8clAablsRloAM2bbpa9geV5YCXqHdwwC5Ukq2oCs2TF+/zkAT/QQr
 TzlOqqsX4DFI+O0mCYWL76K/Km7TOj96/J4JfrcaOHHN6C+pjBhJxtT90ZZILcP1gsyt
 5eZHOG+BeJxR8jz9RpVGayWNNxlXU1KpLdNIoM4/nIdlSX73xh3G4E54Q6n4dQKRnh/P
 Rciqu/UaxuYOfL4tfruaUs+27zxYNsTJfKLEhmWxYGce3PoXcwg4MWJ+v9E1kj/ak/RP
 K1Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690549234; x=1691154034;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YRiix5Wbu8cUEwewXZbHXypVIH/8I/HGpsd1Ld0zKcA=;
 b=Ptk3D54j35n7S9RcFB/v+xFjQro+RblQQFwrJO2S0Xfv7QJWweKfG8PlBG5qWntJQn
 y5gxjzcSG25np7yAPjGklQMsYNk21R0goPbAgJHLaXZRC0BWcDzIDR1/1YNj8FmBCfYN
 lvvhuJoFbCH4Wr8bTiD1Htbgz+Fi1MeP9snT2J+tVSJQnfEqUcDk1iKkYR45KF3KPCMD
 jdi2G587lNKUnstmtNHoeku7PspscrFfJhx7nMpMsRzqbS6sKISWBpFdu46x8cbX6Rec
 9fahfwhDS1qHrYslzqoiqfJDk+kWZlSG4jaRd/AkpV8NMa055efwo0Zq+GsO1JYX7YpX
 xARQ==
X-Gm-Message-State: ABy/qLYQCjq+ONxftJyX3TYsw7poaor2OcSUX2UFMj4K+Xkhv2JcovJw
 DnZFTa/ZCVvUJCQTCYM1fu6bIC4cB0tKNo8GBZ0=
X-Google-Smtp-Source: APBJJlGf644aS69IfHiGjdU78DPSh3l7c3O8DBAe3QaqLPykUWVJ56ZWmKuFuzDN/9JXfQ8Mwtgj9A==
X-Received: by 2002:adf:f009:0:b0:306:2e62:8d2e with SMTP id
 j9-20020adff009000000b003062e628d2emr2022404wro.1.1690549233876; 
 Fri, 28 Jul 2023 06:00:33 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a05600012d200b0031753073abcsm4756456wrx.36.2023.07.28.06.00.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jul 2023 06:00:33 -0700 (PDT)
Message-ID: <550b9775-e11a-7481-4b4a-0f4512d3bd26@baylibre.com>
Date: Fri, 28 Jul 2023 15:00:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND v6 03/11] drm/mediatek: gamma: Support SoC specific
 LUT size
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
References: <20230727094633.22505-1-angelogioacchino.delregno@collabora.com>
 <20230727094633.22505-4-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230727094633.22505-4-angelogioacchino.delregno@collabora.com>
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
> Newer SoCs support a bigger Gamma LUT table: wire up a callback
> to retrieve the correct LUT size for each different Gamma IP.

-- 
Regards,
Alexandre
