Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C286ADF1D
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 13:50:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6CE088EFF;
	Tue,  7 Mar 2023 12:50:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83C4710E123
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 12:50:52 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id a25so51990204edb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 04:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678193451;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9UY5iuEzddJy7Jsu/1PTiy8KE7WoMJiAayKTBsEV99c=;
 b=b+bXytXwVgLrHVTUhYHA/o+BOCnksL/g7Qxp00rpVB1PeDBaCfpzd08Bu1xy8G7A1F
 A5tQULIHCYSWRP7w/6qrYje6Xt2oJE9VzIoHyqJsd5YmRUS2x6BJijVkcrPT/ZCsQ5xt
 kcb4VD2uNVgef8W8eEvXtjno/rfagdBix+CDNWXYsx9JtTOazq6Of2kulJgHHCbwyoA3
 Bcj1FWl3oWamfjtxLohEkZ6rw1/97UX4I1qwPL2jHqVguB8cYuQ+PHKlkSX6oD+nBuqx
 TDVp5xOKCwaC/6gFNglgJgO7efCGio1+ldQ3NvUYPfeyJ+z+0hsMwyUpKXOnSTQWVF6S
 mQvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678193451;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9UY5iuEzddJy7Jsu/1PTiy8KE7WoMJiAayKTBsEV99c=;
 b=cGFv6SHYz5viwRINBETPMcHk3WJ03MalSgI62cI7F1DID+fG9+AzVtC5XPRX38RueZ
 QYEs5zna7dFA0JvMA/jGTAwTnVs0smIg3Zm83ljWy8DxfMlhIzEIhXvhhWzTWBupF+b2
 0PnRrdwYw+A8oc1lnTRn0nQZtilFArTLgUlkuvLPD0xB1t20ZPbru32E2OMP/P7hvypi
 6kluhLlile17t9VrzekunULAr29aHv9lfdLiKUIJ24EbCLvZP4jWXM4hOCl+YlJipC09
 5IE5zEVyB0++Ek4s/qI77U9h2caGHP8z74QAP715vpVmZdN2HGldQ7TF6f6TvOpwPAXu
 dx/A==
X-Gm-Message-State: AO0yUKVx5PYVMrkuseU1qTCn9dVfp0SKG6fzuFr+I0tVVHbdLCtCbee4
 ZM4PLwdJu66LXtf+N/JI6/w1PQ==
X-Google-Smtp-Source: AK7set+pdgHLGptuoirUA/qeW3eypJ8kze1cqV+VkXp/vY5g9ijFcb6atsoRCHygwl7vA0Nuj441XA==
X-Received: by 2002:aa7:c1c4:0:b0:4c5:bc48:d422 with SMTP id
 d4-20020aa7c1c4000000b004c5bc48d422mr11627825edp.7.1678193450993; 
 Tue, 07 Mar 2023 04:50:50 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:a60f:e604:c252:1f3d?
 ([2a02:810d:15c0:828:a60f:e604:c252:1f3d])
 by smtp.gmail.com with ESMTPSA id
 n24-20020a509358000000b004af5001c7ecsm6666266eda.12.2023.03.07.04.50.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 04:50:50 -0800 (PST)
Message-ID: <caf54c57-f9a0-b434-8973-6734851153ff@linaro.org>
Date: Tue, 7 Mar 2023 13:50:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4] dt-bindings: display: mediatek: clean unnecessary item
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Mergnat <amergnat@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 David Airlie <airlied@gmail.com>
References: <20230306-ccorr-binding-fix-v4-0-117daea88efb@baylibre.com>
 <25019fb1-87f7-b863-48e8-a164d0e08265@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <25019fb1-87f7-b863-48e8-a164d0e08265@collabora.com>
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
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/03/2023 11:17, AngeloGioacchino Del Regno wrote:
> Il 07/03/23 11:07, Alexandre Mergnat ha scritto:
>> The item which have the mediatek,mt8192-disp-ccorr as const compatible
>> already exist above. Merge all compatibles which have the same fallback
>> under the same item.
>>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> 
> Alexandre, the Acked-by tag from Krzysztof goes *after* your S-o-b :-)

b4 puts them like this and there is even rationale from Konstantin about
it. Anyway, it's not submitters job to correct b4. Our tools should
implement the process, not us (the users), thus if the result is
incorrect, then the tool should be fixed. Not the user.

Best regards,
Krzysztof

