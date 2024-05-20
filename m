Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 479928C9FC0
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 17:34:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC1D10E115;
	Mon, 20 May 2024 15:34:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="IMfmGPfK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5357710E115
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 15:34:26 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2e73441edf7so2918721fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 08:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716219264; x=1716824064;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q2d46BIzaS71fynIkzwWpbI/UQLh+9rw0YHOl7HkTKw=;
 b=IMfmGPfKrHN+DYcX7VZj2zllEo7pwYXPfRNoNaLSBTYhmQbUpOWLiqDRegMARh3Ur/
 4uEB9EKtt+UVeA47Ti44Pa29OAKzwXtWfL6n+fOyXNqeonVibLuJNv37ca2YUypw0Rby
 o7D3XDeJ+YtewcFFN/wzp/9vJcw7uwSyH7LdOTtXc7e0nWUn4l5WDcuBQz2hTKG/zzPY
 OSsjusCTWsD8RPPLAz2O/deCPceMpGfk5s4DzgRRTKF6pbwuiwmJ6NVNUeWiZmr5S1ZU
 aMUD4wAN7IrIhvJS43SGzaAm/BEstvugW3MCeR8zMcg1BuPlBiQk/j7S9YVfADS5kqz5
 mGTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716219264; x=1716824064;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q2d46BIzaS71fynIkzwWpbI/UQLh+9rw0YHOl7HkTKw=;
 b=WzWMKyFRxzRHfwrB1zp6pFkjkJG5BsScb7p05fTe/DmXCdIS+GiNVmXWXJQDV0UbwZ
 DMrQisyea8SY+/+P1Zp/QESJTRngc48twNG3o9hRcQOc2D/6hcRgRLBiveTl5PtUSG48
 9wFPT+kaRUNlRqR0QW7wQ4SxF8q3JwSHS3meUKOVe35b6zfIz0kLyYHPYoYbfFvUua3b
 oADRNpnIhnUFHWUb4u1mYOYYkFiJ8rvhJfQUD7aDA8ytgEhe2p+cTv77XlonSHHTy9nU
 TqziGwPp6rZXtsr8Tq+sM0ll7cIwt6c3JC3a0LmC2cFGK8WlTl4k7n8zRxfF2rH3PKYr
 BZTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYhsCI/lVF891K3x1j/UgYUDtlrIB/6L0VWgesX55BYzi46sUTxY9ORmC5Htkw5qvYOW8RIzVwUBvw/tyoveYUMlMBswtMYyjwHEPz3MOv
X-Gm-Message-State: AOJu0YzTAS2MhMw7IBDfrBeO38/Ii8ryaTlSQaygav0eiiKCqXS/hJV0
 F/CFwRqpohn2PXkQWC9+oVzmxDGeEWstHNMAyQNoHlPlMdbXFKd/zUs2hHO5jgY=
X-Google-Smtp-Source: AGHT+IFwdu6YJ9mb/t8HH6MJk6jbYDbj8a+haKLMBrRf9ny2u4juPEFKyoKT/juaePI9RR6Hkf8E8A==
X-Received: by 2002:a2e:a6a6:0:b0:2e2:72a7:8435 with SMTP id
 38308e7fff4ca-2e5204b2e7emr164397641fa.45.1716219263883; 
 Mon, 20 May 2024 08:34:23 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42003bf579esm374395215e9.43.2024.05.20.08.34.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 May 2024 08:34:22 -0700 (PDT)
Message-ID: <23609d0b-0908-4acc-9fc7-d74d2c06e80f@baylibre.com>
Date: Mon, 20 May 2024 17:34:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: display: mediatek: Add OF graph
 support for board path
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 matthias.bgg@gmail.com, shawn.sung@mediatek.com, yu-chang.lee@mediatek.com,
 ck.hu@mediatek.com, jitao.shi@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 wenst@chromium.org, kernel@collabora.com
References: <20240516081104.83458-1-angelogioacchino.delregno@collabora.com>
 <20240516081104.83458-2-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240516081104.83458-2-angelogioacchino.delregno@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Tested-by: Alexandre Mergnat <amergnat@baylibre.com>

On 16/05/2024 10:11, AngeloGioacchino Del Regno wrote:
> The display IPs in MediaTek SoCs support being interconnected with
> different instances of DDP IPs (for example, merge0 or merge1) and/or
> with different DDP IPs (for example, rdma can be connected with either
> color, dpi, dsi, merge, etc), forming a full Display Data Path that
> ends with an actual display.
> 
> The final display pipeline is effectively board specific, as it does
> depend on the display that is attached to it, and eventually on the
> sensors supported by the board (for example, Adaptive Ambient Light
> would need an Ambient Light Sensor, otherwise it's pointless!), other
> than the output type.
> 
> Add support for OF graphs to most of the MediaTek DDP (display) bindings
> to add flexibility to build custom hardware paths, hence enabling board
> specific configuration of the display pipeline and allowing to finally
> migrate away from using hardcoded paths.
> 
> Reviewed-by: Rob Herring (Arm)<robh@kernel.org>
> Signed-off-by: AngeloGioacchino Del Regno<angelogioacchino.delregno@collabora.com>

-- 
Regards,
Alexandre
