Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6957CA0747D
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 12:19:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB37510ED70;
	Thu,  9 Jan 2025 11:19:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="FoCcEO67";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB87010ED70
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 11:19:41 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-ab2b29dfc65so133450666b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 03:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736421520; x=1737026320;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z6RS4xw6Ub9a98zJR5HGgMwejTw+vHzDAwM6dcDaFxo=;
 b=FoCcEO67xw7g9T5LhGjLa5SDzmxChhcL9+Yz0BmlEOxILad8Qyf2U3/thkSsPOrexI
 LTRA9PUCFANbpJEFOehEBZTaKqgn6Rq5HQm2lweyUHmI3vpfKQuO7iQjjxZYlqs4RMM6
 KTcQgXx+Ywf1INN5tRkhvVeitDVYy5S8TZ+aiztWKSNEz4HzQ5NSjYfHQUxAPKIxyf1r
 htqNH2YlVRi60iYE+h99GuVPW6AoEViDPuKshCqQiHveCDFuU3YtHtPohW05KS2lL9h9
 PUkHqkzfiaPW2odm+iyo79xDlbnTJ0xN8ovY/THRj58gKufsBaPJLTClg+eSts/ovfne
 FYjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736421520; x=1737026320;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z6RS4xw6Ub9a98zJR5HGgMwejTw+vHzDAwM6dcDaFxo=;
 b=JlFMHrm2dT74FEQWK3icGZ6J7rQ0WWu80hdpm8Gt6ZyxfJA/i+c14TRIdZuYffr6qH
 ZwI85OAgIpRBoPdaPV1Fh9/rHpwUVp/KGOcff2b3SKpcSLjpcDPiqEtC9sfxC2tH1Htn
 9+XXTaax3J/mZu/Xfj2SA96PEXK5Mv3SeeAUikpBYNcDkmTY6N1+L30vWnGaHrhs+/Pa
 PD3BNS1g+fAfWwfxjlUQX/qMLGM84oBuwNj311aWI9gY6SIQEfhpm4h2LA+6A06RSmuw
 A5gszmwzWKKDQ7VThJcCnTl48ES1epZh1ANEldUcZKbXLQgiBL/st+QvU3GG+SLIv0LF
 Ug2g==
X-Gm-Message-State: AOJu0YwhOgRGqIp34mawSMooAfr++cxj0SDS1XUby5xe9DZOl1Xxj1or
 iAgzv3foW2XhBrklLISqtlwEg4+M0VdW5Nqac+nKqKAP81lNFfBY6vzDpzRtWtvjtmM4+3xblmx
 G0Eo=
X-Gm-Gg: ASbGncsb81bIIG+sVy541WjJphba9/jcrxYpJWRltw4q8NXqvL+RPwtq/1X4JDxshnl
 i5ZqtSw3dNPl0FGLoiT1Sc8PcL+d8HzN2WzNj/RVgjymy43ljx4BETjER12dQMHRAv1hDL+/Biq
 B9fSk0YyiTjtGp/GIynsKPq0Ow0/hieEqz2yfiUfUI46eIDO5zTa72P5o2SxcgUMeiM72CsT2y1
 6vqeVJ7bKSG9G3AXGS/wqEyuR+wQZlXZFXDogCi1iyl4sz1DFCu3y+X9+9imGEcJ7qTpr/Wi77G
 GzdV/bvB35ciNOBMrNVkcBs44g==
X-Google-Smtp-Source: AGHT+IFDFX3nATWzt3JJXgsFxlH2455Ys5367JQMJFp3tUUCUzhjUi2qmO4yXeOxwH6ju4OueG0nOg==
X-Received: by 2002:adf:c08d:0:b0:38a:87cc:fb2c with SMTP id
 ffacd0b85a97d-38a87ccfc17mr3463841f8f.18.1736417747781; 
 Thu, 09 Jan 2025 02:15:47 -0800 (PST)
Received: from ?IPV6:2a01:e0a:5ee:79d0:125:358f:ea05:210e?
 ([2a01:e0a:5ee:79d0:125:358f:ea05:210e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e385026sm1389541f8f.42.2025.01.09.02.15.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 02:15:47 -0800 (PST)
Message-ID: <3506d2e1-d7b6-47f2-b2b7-edc208ad45f8@baylibre.com>
Date: Thu, 9 Jan 2025 11:15:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/7] arm64: dts: mediatek: add display support for
 mt8365-evk
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20231023-display-support-v5-0-3905f1e4b835@baylibre.com>
 <20231023-display-support-v5-7-3905f1e4b835@baylibre.com>
 <325c495b-8e5a-412f-9974-3ec7ab15b479@kernel.org>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <325c495b-8e5a-412f-9974-3ec7ab15b479@kernel.org>
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

Thanks, fixed for v6


On 09/01/2025 08:55, Krzysztof Kozlowski wrote:
> compatible is always, ALWAYS first.
> 
>> +		compatible = "ite,it66121";
> reg follows.

-- 
Regards,
Alexandre
