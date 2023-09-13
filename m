Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE6179E019
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 08:38:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D25410E459;
	Wed, 13 Sep 2023 06:38:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D71B910E465
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 06:38:01 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-401d67434daso69746015e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 23:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694587080; x=1695191880; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8My5CApiKeaXtXgjQmnhwf9UqSWZovhHM2oxjC1BrHk=;
 b=MwuHzB8nJXHB4v4PoKeKfMN1H1LVC0ur7WdorsPvbki8SKR2Zl/vjotY9BtV6D+oUZ
 7cc0SLMJrkQQCb0Zz3dOONWlttZsBmwo0iUGfBLDGUwMWP5BzQSR2Tl7d55gQB2x80TY
 ezOI97vgnRsZvxoQ85Ozd2fHv0f5FjIfN2Nj+QovEfWuM8KvsQKed8lM7MMx+awFfZsr
 +0mD/UZt/zYKaap+m0UfDaJXl14L9gVDPQEdpgcJA0NWztGgbf8Gl264+uTJsLfaXlKF
 Ihn+KaR8kXH+0dUmBiI4ROjtDlxOztUL0sET42iR387fu2RxAZpDpBYneGxLcgMKvJYS
 iyTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694587080; x=1695191880;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8My5CApiKeaXtXgjQmnhwf9UqSWZovhHM2oxjC1BrHk=;
 b=VPl/LjnYwXzzekWzZ6ngrsOeBNvUzUirbighMfPm0TsXhls+emyppIr4ZNUmy7ZtYE
 /S2eHGzUwF//aalNQlOdMcnPyZk86C+TLCxzIek4l95LdUUCm4gYp02LxDB8Q70vgM9Z
 llMIiq/YA4ME/1lIgCXlawLQpc+vvXxf4TRKCZZF02oujcpdPs5QYDup17s/zaQOQwyH
 vLK3aaKEDVwycuOFV8m3VOtYfKVJ7hDWQgV/miCUXO1Jc2uydE9e/Dkzozvq9wEQz1N6
 bBZ0u+vUSeutSL09g2Kfxl4vkNRIJ2qecdfB7Ikjba7tqtyXO3ti5YuM/o+Nx+Btblbj
 fIxA==
X-Gm-Message-State: AOJu0Ywc0kIy7TrZq6AjsGKJ9rh9ZMgmnQfhjoz2KbAAt5bNo9mCX8jT
 oTaqyRLZNIVG+iXz0d6rC+CzOQ==
X-Google-Smtp-Source: AGHT+IEZ2F60h3ihjAJYnXxW24cqpT3tWenIsbGIseVxLMVNVbBJ9+q+xwzYR0l2cvMniL752UbZhQ==
X-Received: by 2002:a7b:c414:0:b0:402:fe6d:6296 with SMTP id
 k20-20020a7bc414000000b00402fe6d6296mr1282354wmi.9.1694587080118; 
 Tue, 12 Sep 2023 23:38:00 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a05600c294c00b003ff3b964a9asm1029639wmd.39.2023.09.12.23.37.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Sep 2023 23:37:58 -0700 (PDT)
Message-ID: <0e63b264-1023-7b97-dfc1-91dd6ecef1c0@linaro.org>
Date: Wed, 13 Sep 2023 08:37:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v5 2/3] dt-binding: mediatek: integrate MDP RDMA to one
 binding
To: =?UTF-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "mchehab@kernel.org" <mchehab@kernel.org>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
References: <20230912075651.10693-1-moudy.ho@mediatek.com>
 <20230912075651.10693-3-moudy.ho@mediatek.com>
 <83b3f2eb-84e3-2daa-c63c-14b6792a1db5@linaro.org>
 <69ce225d04b1ed3890365c6f684bdbdb5c540e16.camel@mediatek.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <69ce225d04b1ed3890365c6f684bdbdb5c540e16.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/09/2023 05:04, Moudy Ho (何宗原) wrote:
> On Tue, 2023-09-12 at 10:16 +0200, Krzysztof Kozlowski wrote:
>>  	 
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>  On 12/09/2023 09:56, Moudy Ho wrote:
>>> Due to the same hardware design, MDP RDMA needs to
>>> be integrated into the same binding.
>>>
>>
>> Please use subject prefixes matching the subsystem. You can get them
>> for
>> example with `git log --oneline -- DIRECTORY_OR_FILE` on the
>> directory
>> your patch is touching.
>>
>> This applies to entire patchset. It is not dt-binding, but dt-
>> bindings.
>>
>>> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
>>> ---
>>>  .../display/mediatek/mediatek,mdp-rdma.yaml   | 88 -------------
>> ------
>>>  .../bindings/media/mediatek,mdp3-rdma.yaml    |  5 +-
>>>  2 files changed, 3 insertions(+), 90 deletions(-)
>>>  delete mode 100644
>> Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-
>> rdma.yaml
>>>
>>> diff --git
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-
>> rdma.yaml
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-
>> rdma.yaml
>>> deleted file mode 100644
>>> index dd12e2ff685c..000000000000
>>> ---
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-
>> rdma.yaml
>>> +++ /dev/null
>>> @@ -1,88 +0,0 @@
>>> -# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> -%YAML 1.2
>>> ----
>>> -$id: 
>> http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>>> -$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> -
>>> -title: MediaTek MDP RDMA
>>> -
>>> -maintainers:
>>> -  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
>>> -  - Philipp Zabel <p.zabel@pengutronix.de>
>>> -
>>> -description:
>>> -  The MediaTek MDP RDMA stands for Read Direct Memory Access.
>>> -  It provides real time data to the back-end panel driver, such as
>> DSI,
>>> -  DPI and DP_INTF.
>>> -  It contains one line buffer to store the sufficient pixel data.
>>> -  RDMA device node must be siblings to the central MMSYS_CONFIG
>> node.
>>> -  For a description of the MMSYS_CONFIG binding, see
>>>
>> -  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
>> for details.
>>> -
>>> -properties:
>>> -  compatible:
>>> -    const: mediatek,mt8195-vdo1-rdma
>>> -
>>> -  reg:
>>> -    maxItems: 1
>>> -
>>> -  interrupts:
>>> -    maxItems: 1
>>> -
>>> -  power-domains:
>>> -    maxItems: 1
>>> -
>>> -  clocks:
>>> -    items:
>>> -      - description: RDMA Clock
>>
>> This is different and you did not explain it in commit msg.
>>
>> Another difference - mboxes. Looks like you did not test your DTS...
>>
>> Best regards,
>> Krzysztof
>>
> Hi Krzysztof,
> 
> Sorry for the inconvenience.
> The property you mentioned was removed on [3/3]. This incorrect
> configuration went unnoticed because I passed the test with the entire
> series.
> It will be recified in the next version.

Please describe any differences (lost properties etc) in commit msg with
some explanation.

Best regards,
Krzysztof

