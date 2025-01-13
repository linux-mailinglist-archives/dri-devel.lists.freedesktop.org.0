Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE154A0B97F
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 15:29:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4500A10E69E;
	Mon, 13 Jan 2025 14:29:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="AIlREdZf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49B4010E42B
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 14:29:02 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-434f398a171so4411525e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 06:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736778481; x=1737383281; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2PcFXhTaaFZ66CkGM3Q42t1waBxcXDp7hOTkj1v+y9w=;
 b=AIlREdZf2dDo83bA5EZFJaf9EWXHoJwi5V5mgswDzMNoAHC4n7w1QiGvtI5H0u/iF8
 /OxfcYW134NsKJ2v6VkRBMy3vjpttP8HIB53GSC4D1scaPyrGM3Y56DM3qnXNZZvG481
 UBeNQUNGJohHLkxMWDKhfS0VecivVV2r8qoEPBzljN3huK/BVun1LQDyYqxBUVAf5LE5
 SJMGVLilVhrgMebBEXRXz/Smxk2raYMo8DB8Seg5VHPFZAFMvE27T9lmzQuI8Ff47LUl
 XTc1cOJdT56ZMBmqJqUBW0oKrVhnuun9qg762+LpPMAUX7sIkoIqaxLi7ed69YQ5hGjM
 rVZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736778481; x=1737383281;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2PcFXhTaaFZ66CkGM3Q42t1waBxcXDp7hOTkj1v+y9w=;
 b=XhJvSvRQFXZ/WDAgwKEFtseM38eciYCQgUIkthwLxzgLxDNdePd0tkQBnFIQ4HLAIK
 60fafHuIySDHOBLd8yCwJ4yIjV4W9Xe2bc7mF0gYe6hGoY338iT65yAvpuwnp45t0KcX
 aIIQCIYve+Uc+Ocbfsf32Sl7PjxsmWUnVEbbWvcOLpH6xZ+u6djWAmusXFPhbvuF7Uge
 PjqZf6FyuiqH7hBFsljMaXnr/zJXaB1eFQkavpq/m+5uSysNtjnXPrMm6z/93MkWXHXZ
 6suwMOAHRwUwGNIaWQgCQ2rpYu4mtrDGieVmCsin44yVET895BdSRmdbkD1u4oM+0KXm
 xUtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUd16r6Qq4TP1tNBiQc2XigUUZRLGNgWbMeofmcfGigHPh9Ty/w3PbHW6yVjSTECBttmx1Fprho6VI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJfY5v/+OxZH9exmLucJqHn6lBHbuaLVtawHjouohCm/oOzRFG
 yNi57Ke08nZHmmtIu9OY6Yf6enqSNJtYUWENKMjsAHaLyB0qunR2X7e4oi+ykRo=
X-Gm-Gg: ASbGncve5xsfBqukGYtnIFbXYZ4gNgobHH6T3kfQKcBKiY4JuvGs66YM4R1TwtEA+mQ
 8cQiRHP/3ax5P4otF6rkMXJDkOXw60zjMtsB2voYZDcj7obuEBvgmvyFq92JXuVEsecpgc3tMcD
 p7pSxg6vac4Cq1zZ+QnLOvOa6/+ni8iZGH3DGX52bqoV/3YBop2zt1LOGUHD0t7/+x8ysGGVPlF
 DByThnyRA+aZfGSA0Hi7Z0KI+vW57yvK7L/jGtuQe1SocRFd/iKUIjfBsf5fboYgpvzJFT1r04J
X-Google-Smtp-Source: AGHT+IHhfnJLTe6hwtrplnlr6f4IsH8b02vKJyKSAk50FfjRZlPmVUjBMGl8439cG/f0Xixv8Y0/rw==
X-Received: by 2002:a05:600c:3d06:b0:434:9cb7:7321 with SMTP id
 5b1f17b1804b1-436e2691021mr84320245e9.1.1736778480768; 
 Mon, 13 Jan 2025 06:28:00 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2e89de4sm177638385e9.34.2025.01.13.06.27.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jan 2025 06:28:00 -0800 (PST)
Message-ID: <e64ab0c7-25da-449e-abd2-e4c70dee3041@linaro.org>
Date: Mon, 13 Jan 2025 15:27:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/mediatek/hdmi: Use
 syscon_regmap_lookup_by_phandle_args
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250112134708.46100-1-krzysztof.kozlowski@linaro.org>
 <516d16e3-6fc6-49ba-a0ce-f451b65a6c1a@collabora.com>
 <fef6b198-d916-4b71-86ed-0cbdd55cb3c4@linaro.org>
 <fcf8ebde-46c9-406e-b4d9-933623a9786b@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <fcf8ebde-46c9-406e-b4d9-933623a9786b@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/01/2025 14:58, AngeloGioacchino Del Regno wrote:
> Il 13/01/25 14:05, Krzysztof Kozlowski ha scritto:
>> On 13/01/2025 13:41, AngeloGioacchino Del Regno wrote:
>>> Il 12/01/25 14:47, Krzysztof Kozlowski ha scritto:
>>>> Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
>>>> syscon_regmap_lookup_by_phandle() combined with getting the syscon
>>>> argument.  Except simpler code this annotates within one line that given
>>>> phandle has arguments, so grepping for code would be easier.
>>>>
>>>> There is also no real benefit in printing errors on missing syscon
>>>> argument, because this is done just too late: runtime check on
>>>> static/build-time data.  Dtschema and Devicetree bindings offer the
>>>> static/build-time check for this already.
>>>>
>>>
>>> I agree with this change but can you please rebase it over [1]?
>>>
>>> The same code got migrated to mtk_hdmi_common.c instead :-)
>>>
>>> [1]:
>>> https://lore.kernel.org/r/20250108112744.64686-1-angelogioacchino.delregno@collabora.com
>> My is 2-patch cleanup, your is 34 patch rework and new features with
>> existing build reports, so rebase is not reasonable. It would make this
>> 2-patch cleanup wait for many cycles.
>>
> If adding the `#include <linux/bitfield.h>` line to a file would take
> *many cycles*, that'd be a bit weird, wouldn't it? :-)
It's not about include, it is about rebase. If I rebase on 34-patchset,
that's my dependency and this work cannot be merged before yours is.

And yours already have kbuild reports, so there will be v5, maybe v6 etc.

Best regards,
Krzysztof
