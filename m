Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE26EA07290
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 11:15:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A0D710E45B;
	Thu,  9 Jan 2025 10:15:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="OfKh2YsU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F98310E45B
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 10:15:44 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-38a8b17d7a7so372292f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 02:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736417683; x=1737022483;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=i651SpluW1MRI3JjFDP6kaKt8+EEESD/wqEDYw6jbG8=;
 b=OfKh2YsUTYrnJKIIBeUlvhWN1H6KgddH1jdJ73HnalGIuvww5/13RWYJC9EpPAkX7W
 e/YYeWjdNpMbs8RFM5yHRROjFtcHu5vKp3ZcYb4dK8/cULn2GKJeobvFV55GtcPMcLrf
 5Xe7IzChg3YIlVZB8sn6z1HlUYamBhM1a8HrVQpyp/G1RD1BJojC75yG5fWQ3Yb0/3wp
 EFjBRAfiJvBZOHP70zbh2lNbhmjQpwhn5RmwfrY619sFwY1BK65g1Xeuce/tXyjbCOiM
 jf+Ej9niy6v0rPlvpFYSDvi4/MFxzPl7TZkj6Fdp5yQwskJPxPcgxyz8EqPp+uyvMg3K
 1Qqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736417683; x=1737022483;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i651SpluW1MRI3JjFDP6kaKt8+EEESD/wqEDYw6jbG8=;
 b=t2YlQcz/s4dwMfjCZFW4sQZSLkZVWdKwTjHWtN5QHvW2izei2Q0UOZDBs0iq23i1X+
 xgjK3HxgChaKCgErAwIa4DdRr+rx7Uw8Xl+Fvm2A8EDBRKl1+EOvIJ1ctFaVb1GvfQbY
 Wza84z+Usw/+o8s0srsNbU7O9fg73GXs8Pj1W8GMPKQHT81xzQWrXZ/DuB8ssItllHkU
 nF/pGKYkS7UczfGncMwdzBmWwk5AsFIW98d8xEFrnFuBvKUDiyePhcETprpNw6Y5IfcA
 M62AsfNC2QkFLVsUXvxpvCj+vPBwvZAbJ17VRewM69lO9gOHMmxI0cdUhnz0rBrHdSHg
 +7kQ==
X-Gm-Message-State: AOJu0YzuKJDHD/PYm69QXdVpOkcCEWa5fC+RbC4MOGUTiuZeM80uhAKm
 FWLkemX9559R6ybZ77fCdd3poYvhqx7CAMi79N68OeD0g5NynF7NS/3cXv8H50c=
X-Gm-Gg: ASbGncvK9KtvNiEodzZ89U9XMviVaC/SVgc66MwztIPeVJxMqI3TSOI2JuRpJSfyM6T
 wDm6EOE06QexZ3c8DfQ6CTqSd+Mn+zbf9rkvxGaD3/Q2asRbC9UN1PyfE9VwLWsL2+/+CY/TYBo
 w/LDttUf5XZByOYbQIMLYHyzILyzmlEMBVABput7Qvm5LKmHp3bMi8PtwSTqZX3YeyeWC31RKqC
 zk47BUO2s+rHJ9oIqPWsfsCDG6h15cXR7pKD6zpJx+sYhnM2I+hskjhL2G7OCDPJfmy22fgWcJf
 FLP3ZVUOnbooDrGg7vM0GsU3Gg==
X-Google-Smtp-Source: AGHT+IEXsj3cGfTM3WuiOcTVPO3qnoxJJ8qkHw0f0Dnd2kBWv/CZsMscUjyXI2o0KFisYvaJanIsLA==
X-Received: by 2002:a5d:5f85:0:b0:385:fdc2:1808 with SMTP id
 ffacd0b85a97d-38a87336ee3mr5496376f8f.40.1736417683201; 
 Thu, 09 Jan 2025 02:14:43 -0800 (PST)
Received: from ?IPV6:2a01:e0a:5ee:79d0:125:358f:ea05:210e?
 ([2a01:e0a:5ee:79d0:125:358f:ea05:210e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2df3610sm49767285e9.20.2025.01.09.02.14.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 02:14:42 -0800 (PST)
Message-ID: <35868716-a80a-4cb7-bc59-35ea6263546d@baylibre.com>
Date: Thu, 9 Jan 2025 11:14:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/7] arm64: defconfig: enable display connector support
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
 <20231023-display-support-v5-4-3905f1e4b835@baylibre.com>
 <6df0f935-b7d2-4961-a947-47b328a3758f@kernel.org>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <6df0f935-b7d2-4961-a947-47b328a3758f@kernel.org>
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


On 09/01/2025 08:53, Krzysztof Kozlowski wrote:
> git grep -i i350-evk - zero results. Please use some recognizable names.
> I have no clue where to even look for it - which vendor.

-- 
Regards,
Alexandre
