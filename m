Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DBC6C0156
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 13:06:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1171D10E15A;
	Sun, 19 Mar 2023 12:06:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C0D10E126
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Mar 2023 12:06:06 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id x3so36716768edb.10
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Mar 2023 05:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679227564;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3GQ0kuX+CANTyKsciGzMU4Vb8Jeilt6T7QwH/C5HtcI=;
 b=pVE7uoVyhC7NdVaNDMAae95yljmhHJ/vy720gGm9Wcwipv7UjfXSfsHinpMhTLeopx
 cr5RClkReTYivfC2IY5U5wY572ezvC1yCkHd7LIEj1HuYvbps2jMciS1PvOubx3Phpzv
 lfp5ymplUDgbfL2kaHoUaSBUbvueNoyQOpkFwxacSddt2OvHyx9V1IRGsXLNxNuNI8tR
 pzgJjPJtO1SL+S6dW0blVTikGk2hVBMbyclcg2gesIeegLGn9Mb8DIqUUNj6OWGRux4X
 VlPpEjmVgeM8W8fsbY1qaNuRHoxHO642hfuMBJ5aK+5ziENTS4/JD82wADP8gHrLT7H4
 rITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679227564;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3GQ0kuX+CANTyKsciGzMU4Vb8Jeilt6T7QwH/C5HtcI=;
 b=idRObUX8NfHEN3Pbi4zxT8njGIfYHGZcwLq3l/bHAf+xwRRyFWY1Et3I6EOrIrdSj2
 2eu0TCls1jbCBW1202ssjlWj08guMkbykcigcfRbkOecBxYeG4SMZogxKSaW2u3TIfUQ
 /EpZab5GUghXDR9LVoA4REbh+AgJwqk3wlscZnbYtQkUcO6eDIQZ6y4oIuIufEzFU3jZ
 /d+rDy3SvCcVbdjElnp800c5ygCeAkXTqezOZUPu3+RYa7v2uCEDSvfqvJYUqsrzHr+f
 BhQQLt+gYaYjTOfC+GAJmplrRJSqmmkE44mGxYplC+dcXIVZtjEpQMxKjMgjk0Z6gAyF
 RW4w==
X-Gm-Message-State: AO0yUKX6XfS928nbrrRoxh+uMP3YeOSgdGAge3tGl2IuUuVvREHvURWs
 N59+b3fLSoc13c78faIAQASS1w==
X-Google-Smtp-Source: AK7set+IUACGutO71vcC7FVNze5yyNjfDWDHleE0EpSa6MxZnLDTstSEjlod2kahf5dchF8sAdB/PA==
X-Received: by 2002:a17:906:6886:b0:924:d90a:6f97 with SMTP id
 n6-20020a170906688600b00924d90a6f97mr5311713ejr.13.1679227564671; 
 Sun, 19 Mar 2023 05:06:04 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d?
 ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a50c385000000b004f9e6495f94sm3473945edf.50.2023.03.19.05.06.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Mar 2023 05:06:04 -0700 (PDT)
Message-ID: <6d4dba0d-14eb-d9a4-0d16-b0c141b0c733@linaro.org>
Date: Sun, 19 Mar 2023 13:06:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: display: Drop unneeded quotes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Robin van der Gracht <robin@protonic.nl>,
 Miguel Ojeda <ojeda@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomba@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230317233626.3968358-1-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230317233626.3968358-1-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/03/2023 00:36, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

