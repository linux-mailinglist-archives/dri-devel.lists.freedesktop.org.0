Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B94766DB3
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 14:58:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0508710E6DA;
	Fri, 28 Jul 2023 12:58:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFE4210E6DA
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 12:58:22 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3176a439606so2082012f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 05:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690549101; x=1691153901; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=h5wNhDucTBvD7VjULZN8VbFpxmhmCSTIyHeEyjuGmhA=;
 b=XjmJheBE/C6yvp/TSP7wxKlwXjmWcTuJO1ASCc49bV9oGIEukuNky/T4Q9SoD6a9KY
 Lz0Tn2L83bg2L6BIWg8hUfKBaiCppuHNr60h3gCZ9KvzKFnHyUe+p5d+czXddBYIJCbw
 zXYWz5VmOHv2yHyk0O20M7DrH14s6L5bBf+IRaryw2wQquockc3QUV7tXCiJmJA3VsHW
 5/EeT4b5i1DxJXEjhdumkjCn2MIVUtHPa7kr/Chc0Puv3MqITvTFbBXMxuB45R/VlIxk
 EGJia5TT4Zg3CydOJwB/baXNATAtEEOyksPE0I1w6gnRTvDLmTnvl49xrhC1P+bF4L+a
 23rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690549101; x=1691153901;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h5wNhDucTBvD7VjULZN8VbFpxmhmCSTIyHeEyjuGmhA=;
 b=kiPTm05aimMcwH6Xu+JGooOhxE6GYGD7hgwbxoVUYp8L9C/7Ua+WyDb9+9ZxlYpqR0
 fz8vqQTgoZ0F5RebJBn34tUHUzGNSFTefqg6KpF2RetlPqYp/uqxtLrEoiS5s93bqlDH
 bNSSR6LCY4B94yVzWQ69P6YrjMJ04lrSKiwd9EahqQ6d8NFESymWnjj4af3Cxl+38FUk
 /nfeMwaEa8Ktr2aE+dHeQnWbSB/MNDegDpC1+btpNxFhstWOnCOKT5fhqNtNo+S0Lkh2
 5e6uKekOMrWpV6UpfgywTZgPnkJvD9jDeQyQ6SGZdsiJjk6lPweZDWeU8etvQPJmSFGW
 q6xQ==
X-Gm-Message-State: ABy/qLYNgv5qW9RShONf4qAO56cVHZZiJew+mnEhm0qJA19/5B04BQNP
 b02WHY4GG5/3Mqq3u2Ad6wks/Q==
X-Google-Smtp-Source: APBJJlGar/tmHVpTBhnuxJKXkBr+psfA2w8OU8z3PFWgoyiAs+jFzsMHodkY/faOmzzykdWH9IWTfg==
X-Received: by 2002:adf:d846:0:b0:317:5c82:10c5 with SMTP id
 k6-20020adfd846000000b003175c8210c5mr1540052wrl.17.1690549100707; 
 Fri, 28 Jul 2023 05:58:20 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 l6-20020adfe586000000b0031416362e23sm4838147wrm.3.2023.07.28.05.58.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jul 2023 05:58:20 -0700 (PDT)
Message-ID: <0b9d62d0-5958-2b0f-03d7-9e91e026c33d@baylibre.com>
Date: Fri, 28 Jul 2023 14:58:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND v6 09/11] drm/mediatek: gamma: Add support for
 12-bit LUT and MT8195
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
References: <20230727094633.22505-1-angelogioacchino.delregno@collabora.com>
 <20230727094633.22505-10-angelogioacchino.delregno@collabora.com>
 <ec66e067-642e-1512-3e4b-b51065ccc75d@baylibre.com>
 <8b9769f3-8a7c-3607-ca9a-09443cfbc9d9@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <8b9769f3-8a7c-3607-ca9a-09443cfbc9d9@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 ehristev@collabora.com, wenst@chromium.org, matthias.bgg@gmail.com,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Angelo

On 27/07/2023 15:06, AngeloGioacchino Del Regno wrote:
>>> +/* For 10 bit LUT layout, R/G/B are in the same register */
>>>   #define DISP_GAMMA_LUT_10BIT_R            GENMASK(29, 20)
>>>   #define DISP_GAMMA_LUT_10BIT_G            GENMASK(19, 10)
>>>   #define DISP_GAMMA_LUT_10BIT_B            GENMASK(9, 0)
>>> +/* For 12 bit LUT layout, R/G are in LUT, B is in LUT1 */
>>
>> As I understood from the application processor registers (v0.4), R/G 
>> are in LUT, B is in LUT1 for 10bit and 12bit for MT8195. Can you check 
>> please to be sure ?
>>
> 
> That's right, but here I'm implying that 10-bit LUT is only for older 
> SoCs, and
> all of them have got the same register layout with one LUT register for 
> R, G, B,
> while all the new SoCs, which have got 12-bits LUT support, have got the 
> new
> register layout with two LUT registers (and multiple banks).
> Infact, the MT8195 SoC was added here with 12-bits LUT support only (as 
> the LUT
> parameters extraction is easily handled by the drm_color_lut_extract() 
> function).
> 
> The alternative would've been to add two compatibles, like
> "mediatek,mt8195-disp-gamma-10bits" and 
> "mediatek,mt8195-disp-gamma-12bits",
> or a boolean property like "mediatek,lut-12bits" which would appear 
> literally
> everywhere starting from a certain point in time (since there's no 
> reason to
> use 10-bits LUT on MT8195, that starts now!).
> 
> Even then, consider the complication in code, where mtk_gamma_set_common()
> would have to handle:
> - 10-bits, layout A
> - 10-bits, layout B -> but fallback to layout A if this is AAL
> - 12-bits layout
> 
> is_aal = !(gamma && gamma->data);
> 
> for_each_bank()
> {
>      if (num_lut_banks > 1) write_num_bank();
> 
>      for (i = 0; i < lut_bank_size; i++) {
>          .......
> 
>          if (!lut_diff || (i % 2 == 0)) {
>              if (lut_bits == 12 || (lut_bits == 10 && layout_b)) {
>                  ... setup word[0],[1] ...
>              } else if (layout_b && !is_aal) {
>                  ...setup word[0],[1]...
>              } else {
>                  ...setup word[0]
>              }
>          } else {
>               ^^^ almost repeat the same ^^^
>          }
>          writel(word[0], (...));
>          if (lut_bits == 12 || (lut_bits == 10 && layout_b) && !is_aal)
>              writel(word[i] (....));
>      }
> }
> 
> probe() {
>      if (of_property_read_bool(dev->of_node, "mediatek,lut-12bits") ||
>          data->supports_only_12bits)
>          priv->lut_bits = 12;
>      else
>          priv->lut_bits = 10;
> }
> 
> ...at least, that's the implementation that I would do to solve your 
> concern,
> which isn't *too bad*, but still, a big question arises here...
> 
> 
> Why should we care about supporting *both* 10-bit and 12-bit Gamma LUTs on
> the *same* SoC?
> 
> 
> A 12-bit LUT gives us more precision and there's no penalty if we want to
> convert a 10-bit LUT to a 12-bits one, as we're simply "ignoring" the value
> of two bits per component (no expensive calculation involved)...
> 
> Is there anything that I'm underestimating here?

Thanks for you explanation !
I think your choice is not bad, but it's not clear that MT8195 10 bit 
LUT isn't supported at all.
So, IMHO, the first solution is to support it like you explained it 
above, and the second solution is to add comment somewhere to clarify 
that driver doesn't support 10 bit LUT if the SoC is able to use 12 bit 
LUT, like MT8195 10 bit.

Is that relevant ? :D

-- 
Regards,
Alexandre
