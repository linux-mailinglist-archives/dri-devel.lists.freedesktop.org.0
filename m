Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECED476955D
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 13:57:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7967E10E26B;
	Mon, 31 Jul 2023 11:57:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0952B10E26B
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 11:57:44 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3fb4146e8fcso30403305e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 04:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690804663; x=1691409463; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=84p6LuV3kqjsQ38caNmFY0hjFJK8gje0eg9gedCk7+E=;
 b=GTz2z46rZqYVBJe9xcSwdI+7QtxocDHZoo1lTcR4gcdpTVNr5ydA/TjcdzI0hykclb
 L7disChATKsEVPF6u4hk7xRzikjXvpe7rgFduzn65xRa4llxH4UELN6kJHB1RsdqGlnC
 CYQOP6CdntIsoXUlK7fUHOyKLvYhRp4wp0YkCVk0X4cItoCIRXYN8BBD9ouZqBX/EY6P
 ixzwbtZ18fTtR0HzOLz+QOUfZJNH1nHp/u/H3fON9ulfoQlX83OtHvmyg23yYZ7s82Aa
 gIbAA0DTaGmlGjxGumCPYF0TYh0NOvda6E4bScxmSxtoLzgFpY17O2jwV1Ti8pqqvKuP
 4BQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690804663; x=1691409463;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=84p6LuV3kqjsQ38caNmFY0hjFJK8gje0eg9gedCk7+E=;
 b=YO4nZU72E+1FDBizQyqgkR9RaeN3errYKc9SD8/FYetNb4PqxIUGST0Ls4CW7kGqLI
 LpHkiQbZSiLrgWepioy0GLqii30fT6Q4+6j2pKj6xqjRycBPoUh3vTbP5rxnHgbQxra5
 cXMXcRL40epiFhoqwY6b8wXF76wYnciRF3upKwJG7gPr0WI1A5G/REfmOtL7Mvv4wYDe
 aXqp3rCWpuLsvr5Bij9D9QMIPySIivJVb3UTC0McxseWU4L15hafdanRBuFQuhFiDET7
 RjAuhn0rr6dRy76WW0FVriAlM7lyxnJvtMhG0arkChait4cYQlf1VLjcxkSNcpy/9Vx4
 F37Q==
X-Gm-Message-State: ABy/qLbJXzU8deGwWcvUra31XmevU8/JVOQldC0rjm5to6aCo3K9dw04
 2ZZuvicXD6DJyCs+Tmc+lvJqvw==
X-Google-Smtp-Source: APBJJlEN1GtAehJzUvlmGfJJ54bjKPXWoI0vErW/9yKQPWUAvNebPH2c1X7TzLGxGDgOuuPnzoBd8A==
X-Received: by 2002:a05:600c:20c4:b0:3f7:e660:cdc5 with SMTP id
 y4-20020a05600c20c400b003f7e660cdc5mr7884275wmm.9.1690804662970; 
 Mon, 31 Jul 2023 04:57:42 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 z19-20020a1c4c13000000b003fe20db88ebsm2894966wmf.31.2023.07.31.04.57.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jul 2023 04:57:42 -0700 (PDT)
Message-ID: <0de4d9fe-39ac-5efa-8344-428f0074adeb@baylibre.com>
Date: Mon, 31 Jul 2023 13:57:41 +0200
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
 <0b9d62d0-5958-2b0f-03d7-9e91e026c33d@baylibre.com>
 <4e0bcb82-03f7-66de-19ec-9cc23f95ddad@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <4e0bcb82-03f7-66de-19ec-9cc23f95ddad@collabora.com>
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



On 31/07/2023 12:27, AngeloGioacchino Del Regno wrote:
> Il 28/07/23 14:58, Alexandre Mergnat ha scritto:
>> Hi Angelo
>>
>> On 27/07/2023 15:06, AngeloGioacchino Del Regno wrote:
>>>>> +/* For 10 bit LUT layout, R/G/B are in the same register */
>>>>>   #define DISP_GAMMA_LUT_10BIT_R            GENMASK(29, 20)
>>>>>   #define DISP_GAMMA_LUT_10BIT_G            GENMASK(19, 10)
>>>>>   #define DISP_GAMMA_LUT_10BIT_B            GENMASK(9, 0)
>>>>> +/* For 12 bit LUT layout, R/G are in LUT, B is in LUT1 */
>>>>
>>>> As I understood from the application processor registers (v0.4), R/G 
>>>> are in LUT, B is in LUT1 for 10bit and 12bit for MT8195. Can you 
>>>> check please to be sure ?
>>>>
>>>
>>> That's right, but here I'm implying that 10-bit LUT is only for older 
>>> SoCs, and
>>> all of them have got the same register layout with one LUT register 
>>> for R, G, B,
>>> while all the new SoCs, which have got 12-bits LUT support, have got 
>>> the new
>>> register layout with two LUT registers (and multiple banks).
>>> Infact, the MT8195 SoC was added here with 12-bits LUT support only 
>>> (as the LUT
>>> parameters extraction is easily handled by the 
>>> drm_color_lut_extract() function).
>>>
>>> The alternative would've been to add two compatibles, like
>>> "mediatek,mt8195-disp-gamma-10bits" and 
>>> "mediatek,mt8195-disp-gamma-12bits",
>>> or a boolean property like "mediatek,lut-12bits" which would appear 
>>> literally
>>> everywhere starting from a certain point in time (since there's no 
>>> reason to
>>> use 10-bits LUT on MT8195, that starts now!).
>>>
>>> Even then, consider the complication in code, where 
>>> mtk_gamma_set_common()
>>> would have to handle:
>>> - 10-bits, layout A
>>> - 10-bits, layout B -> but fallback to layout A if this is AAL
>>> - 12-bits layout
>>>
>>> is_aal = !(gamma && gamma->data);
>>>
>>> for_each_bank()
>>> {
>>>      if (num_lut_banks > 1) write_num_bank();
>>>
>>>      for (i = 0; i < lut_bank_size; i++) {
>>>          .......
>>>
>>>          if (!lut_diff || (i % 2 == 0)) {
>>>              if (lut_bits == 12 || (lut_bits == 10 && layout_b)) {
>>>                  ... setup word[0],[1] ...
>>>              } else if (layout_b && !is_aal) {
>>>                  ...setup word[0],[1]...
>>>              } else {
>>>                  ...setup word[0]
>>>              }
>>>          } else {
>>>               ^^^ almost repeat the same ^^^
>>>          }
>>>          writel(word[0], (...));
>>>          if (lut_bits == 12 || (lut_bits == 10 && layout_b) && !is_aal)
>>>              writel(word[i] (....));
>>>      }
>>> }
>>>
>>> probe() {
>>>      if (of_property_read_bool(dev->of_node, "mediatek,lut-12bits") ||
>>>          data->supports_only_12bits)
>>>          priv->lut_bits = 12;
>>>      else
>>>          priv->lut_bits = 10;
>>> }
>>>
>>> ...at least, that's the implementation that I would do to solve your 
>>> concern,
>>> which isn't *too bad*, but still, a big question arises here...
>>>
>>>
>>> Why should we care about supporting *both* 10-bit and 12-bit Gamma 
>>> LUTs on
>>> the *same* SoC?
>>>
>>>
>>> A 12-bit LUT gives us more precision and there's no penalty if we 
>>> want to
>>> convert a 10-bit LUT to a 12-bits one, as we're simply "ignoring" the 
>>> value
>>> of two bits per component (no expensive calculation involved)...
>>>
>>> Is there anything that I'm underestimating here?
>>
>> Thanks for you explanation !
>> I think your choice is not bad, but it's not clear that MT8195 10 bit 
>> LUT isn't supported at all.
>> So, IMHO, the first solution is to support it like you explained it 
>> above, and the second solution is to add comment somewhere to clarify 
>> that driver doesn't support 10 bit LUT if the SoC is able to use 12 
>> bit LUT, like MT8195 10 bit.
>>
>> Is that relevant ? :D
>>
> 
> Even though the same as whhat I'm doing here was already done before, as 
> the
> current 10-bits LUT support ignores 9-bits LUT support, I can add a 
> comment to
> the code:
> 
> /*
>   * SoCs supporting 12-bits LUTs are using a new register layout that does
>   * always support (by HW) both 12-bits and 10-bits LUT but, on those, we
>   * ignore the support for 10-bits in this driver and always use 12-bits.
>   *
>   * Summarizing:
>   * - SoC HW support 9/10-bits LUT only
>   *   - Old register layout
>   *     - 10-bits LUT supported
>   *     - 9-bits LUT not supported
>   * - SoC HW support both 10/12bits LUT
>   *   - New register layout
>   *    - 12-bits LUT supported
>   *    - 10-its LUT not supported
>   */
> 
> Where the SoCs supporting 9-bits and 10-bits: mt6795, 8173, 8192,others and
> 12-bits are 8195, 8186, others.. of course.
> 
> Would that work for you?

Sound good for me. After that:

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre
