Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BFB79C9C5
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 10:23:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D886F10E3B8;
	Tue, 12 Sep 2023 08:23:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BBF810E3B8
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 08:23:40 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-9a9d82d73f9so659165966b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 01:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694507019; x=1695111819; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NecnTNhEs6mk/7xS4+yPxPBE+Iq+otCfvP8k/SUlgdY=;
 b=GoYgzKcgQ6xdtkInG06OGG6pwR7u+FFCXhEuxPfxkPlSdLWyMNsB6qZTMdRG3ElJL0
 lDWyvoUnOtHSdrj17V082JmINRJLW/ARvXe4r4VHhiIgWLCbFmv4STGvP/a6dVfKCvZm
 V50S5+SoIUqZggB6WT+O2ww4yOt0lKV8aPmcrj3SCQ994dLI4FYUdzWOr3gxoSNIxgb6
 51XdJZAp/1GaH+8HTgs/wzTxAyiNf7f2GqRjpLVe1uwuOo8wBDvZVzYOez9vzTb7pXCJ
 JEhDmjk8RVBmDWUeH1jSvUcv08q63uJExMlB853n1VeWVnjkX5T5fTFZoF1xJOh8mFNE
 0B3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694507019; x=1695111819;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NecnTNhEs6mk/7xS4+yPxPBE+Iq+otCfvP8k/SUlgdY=;
 b=vbJ1cj/Di9coGAskXs/AR9IM4ms4kOtb7Pzv4oNCvx5M0TLxUscdaQ2nJoIq5RnO7b
 u1hdWb6QSZEHMFLQTf9BkzGk11YvEbCEQbaTj6JqNhMheB63PSwrFTaiHQmfzqoTcUxI
 G0TpNMBZZ8xsDH/gvEqX+HyVjVLDXprYPHzhKJzk284HmARf5R14arC098x9pfUWGYgZ
 /Wm2sO+YwY6k2nXLysrTvpY1v/anFhvcBs65l7cnHjjuyp3Ggk6WUfLwIvT9OaZS9hoF
 m5kNtx+kpBhMUXacJQIaC1lqhqTAYG1axB2dYS0V3CMn1lSUlJpy0uzmsl5VeQ2hbvdM
 yN6w==
X-Gm-Message-State: AOJu0YzaMz4gFK8uD5JBRQtdMRXayhtjsvcZobqPP9IgzbZkjGxwMsH6
 8oJu3Mw+aMOxLDKoyqbZGXsZbVuwOjzbd2OIVQw=
X-Google-Smtp-Source: AGHT+IFUhAhviWgQLFU03MSAKRTyIaNN7fIQ2Ll6cz8uur8tvWrxceUtpGTQvZh5kUvI/HNWPpsu2g==
X-Received: by 2002:a17:907:a0c6:b0:9a2:86a:f9b7 with SMTP id
 hw6-20020a170907a0c600b009a2086af9b7mr9091015ejc.59.1694507018283; 
 Tue, 12 Sep 2023 01:23:38 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
 by smtp.gmail.com with ESMTPSA id
 rh16-20020a17090720f000b0098e0a937a6asm6416288ejb.69.2023.09.12.01.23.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Sep 2023 01:23:37 -0700 (PDT)
Message-ID: <c64efa17-704d-0bb0-da91-5658bc0bf34e@linaro.org>
Date: Tue, 12 Sep 2023 10:23:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v5 02/14] arm64: dts: mediatek: mt8195: add MDP3 nodes
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20230912075805.11432-1-moudy.ho@mediatek.com>
 <20230912075805.11432-3-moudy.ho@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230912075805.11432-3-moudy.ho@mediatek.com>
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
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/09/2023 09:57, Moudy Ho wrote:
> Add device nodes for Media Data Path 3 (MDP3) modules.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi | 378 +++++++++++++++++++++++
>  1 file changed, 378 insertions(+)

Why is this targeting media? No, don't. DTS goes via SoC, not media.
Don't mix patches.

Best regards,
Krzysztof

