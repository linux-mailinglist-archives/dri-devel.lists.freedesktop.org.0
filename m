Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 213A3695355
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 22:46:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AD8110E72F;
	Mon, 13 Feb 2023 21:46:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEBF510E03F
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 21:46:13 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id rp23so35281509ejb.7
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 13:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cLqbD4GL7wGt7wb5qOSWcpBX+EUA83fR85j9v5NAA80=;
 b=yHlIZp5ficXr4X8XRD0YbnUlgk9MpuTsDUbZ9rqtE2SXrhMeI7NHGFo4bCZ1uACMtR
 V3ho3QqXsAl0JxMknz4NE8nNturALTlkGsji1a5ONcfjxDFxo5p0FfGgc7V3LuatrsIp
 TGxUbn7AqxoyyVxBGk+MBaP11Pmc/37SmSEPQtSbd3D69W8IxGxlFlgCk9urHd10wj76
 6UehSRgHmFBBR1SwRmpV4vzHL9u2q7TbeGXB5hzCUhBkkO8q6reUyOziIk/rxyJRBDC3
 gBqcQj08hFkpwGQ833GLdDyVO0BKvDPHyf+dLFxsCcrEkF3Lu59I9N63cH5aeAvLHwea
 s+Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cLqbD4GL7wGt7wb5qOSWcpBX+EUA83fR85j9v5NAA80=;
 b=LxFNraxq4T1anS1nl0/yA/MTJy6RcKhejnGNb1iVJFYurkYHQOCO0ML2hJWh0OvVVf
 GlO1DF4BkZhNejrQGNmMTDzsahkpw3bO/Hqw3YUtYuLBVQrOuQAKKbZ0QgERYTjDNTYf
 LclX4hF89v0yeFlVM/NtlrL4BZIRrmhH9JEhRYBnmn6QaL32tuQKqtHQb9Ce+mcHYX7z
 Lz2kxof7DGw6NmZGykwGcqCN+5Pc/j2n+kicjexn6GakAXhCc3yUGeXbKNxA1q+TAxjO
 3QRBEE/eYLs8KLpsgdlXH1kGG6MVvAOY3UN+E3uyzWsRFlT5G3VkVrTmj6odHi1dniFj
 a9MA==
X-Gm-Message-State: AO0yUKVPbK9Sck8atGJmnnZDCe1innRcHhYzPCirTmB1KRpL4jJMUGdT
 SgTRixXYJxZ9yw2Z+3X9jt5kjg==
X-Google-Smtp-Source: AK7set9aAcUj8MPJa0hpm1RoqSyPXeXAENwlb572NSMRk8UGq6YFqH3lfDUTDPiGMw1iZzQiQnH4rQ==
X-Received: by 2002:a17:906:d7b3:b0:8a4:e0a2:e774 with SMTP id
 pk19-20020a170906d7b300b008a4e0a2e774mr411473ejb.29.1676324772363; 
 Mon, 13 Feb 2023 13:46:12 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 gh2-20020a1709073c0200b008b124134fb4sm554895ejc.115.2023.02.13.13.46.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 13:46:11 -0800 (PST)
Message-ID: <1051d6bd-eb3c-6293-0bd2-3f4ea28fa3f8@linaro.org>
Date: Mon, 13 Feb 2023 23:46:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH 5/7] drm/msm/dpu: Document and enable TEAR interrupts
 on DSI interfaces
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, phone-devel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20221231215006.211860-1-marijn.suijten@somainline.org>
 <20221231215006.211860-6-marijn.suijten@somainline.org>
 <773cd72b-a766-1764-e25f-0af1174f0e51@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <773cd72b-a766-1764-e25f-0af1174f0e51@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, Loic Poulain <loic.poulain@linaro.org>,
 linux-kernel@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, Adam Skladowski <a39.skl@gmail.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Vinod Koul <vkoul@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Sean Paul <sean@poorly.run>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/02/2023 21:37, Jessica Zhang wrote:
> 
> 
> On 12/31/2022 1:50 PM, Marijn Suijten wrote:
>> All SoCs since DPU 5.0.0 (and seemingly up until and including 6.0.0,
>> but excluding 7.x.x) have the tear interrupt and control registers moved
>> out of the PINGPONG block and into the INTF block.  Wire up the
>> necessary interrupts and IRQ masks on all supported hardware.
> 
> Hi Marijn,
> 
> Thanks for the patch.
> 
> I saw that in your commit msg, you mentioned that 7.x doesn't have 
> tearcheck in the INTF block -- can you double check that this is correct?
> 
> I'm working on SM8350 (DPU v7) and I'm seeing that it does have 
> tearcheck in INTF block.

I confirm, according to the vendor drivers INTF TE should be used for 
all DPU >= 5.0, including 7.x and 8.x

However I think I know what Marijn meant here. For 5.x and 6.x these 
IRQs are handled at the address MDSS + 0x6e800 / + 0x6e900 (which means 
offset here should 0x6d800 and 0x6d900) for INTF_1 and INTF_2. Since DPU 
7.x these IRQ registers were moved close to the main INTF block (0x36800 
and 0x37800 = INTF + 0x800).

> 
>>
>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
>> ---
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 78 +++++++++++--------
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  6 +-
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 12 +++
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  2 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h      |  3 +
>>   5 files changed, 68 insertions(+), 33 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index 1cfe94494135..b9b9b5b0b615 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -86,6 +86,15 @@
>>   #define INTF_SC7280_MASK INTF_SC7180_MASK | BIT(DPU_DATA_HCTL_EN)
>> +#define IRQ_MSM8998_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
>> +             BIT(MDP_SSPP_TOP0_INTR2) | \
>> +             BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>> +             BIT(MDP_INTF0_INTR) | \
>> +             BIT(MDP_INTF1_INTR) | \
>> +             BIT(MDP_INTF2_INTR) | \
>> +             BIT(MDP_INTF3_INTR) | \
>> +             BIT(MDP_INTF4_INTR))
>> +
>>   #define IRQ_SDM845_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
>>                BIT(MDP_SSPP_TOP0_INTR2) | \
>>                BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>> @@ -100,13 +109,15 @@
>>   #define IRQ_QCM2290_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
>>                BIT(MDP_SSPP_TOP0_INTR2) | \
>>                BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>> -             BIT(MDP_INTF1_INTR))
>> +             BIT(MDP_INTF1_INTR) | \
>> +             BIT(MDP_INTF1_TEAR_INTR))
>>   #define IRQ_SC7180_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
>>                BIT(MDP_SSPP_TOP0_INTR2) | \
>>                BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>>                BIT(MDP_INTF0_INTR) | \
>> -             BIT(MDP_INTF1_INTR))
>> +             BIT(MDP_INTF1_INTR) | \
>> +             BIT(MDP_INTF1_TEAR_INTR))
>>   #define IRQ_SC7280_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
>>                BIT(MDP_SSPP_TOP0_INTR2) | \
>> @@ -120,7 +131,9 @@
>>                BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>>                BIT(MDP_INTF0_INTR) | \
>>                BIT(MDP_INTF1_INTR) | \
>> +             BIT(MDP_INTF1_TEAR_INTR) | \
>>                BIT(MDP_INTF2_INTR) | \
>> +             BIT(MDP_INTF2_TEAR_INTR) | \
>>                BIT(MDP_INTF3_INTR) | \
>>                BIT(MDP_INTF4_INTR))
>> @@ -129,7 +142,9 @@
>>                 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>>                 BIT(MDP_INTF0_INTR) | \
>>                 BIT(MDP_INTF1_INTR) | \
>> +              BIT(MDP_INTF1_TEAR_INTR) | \
>>                 BIT(MDP_INTF2_INTR) | \
>> +              BIT(MDP_INTF2_TEAR_INTR) | \
>>                 BIT(MDP_INTF3_INTR) | \
>>                 BIT(MDP_INTF4_INTR) | \
>>                 BIT(MDP_INTF5_INTR) | \
>> @@ -1300,63 +1315,64 @@ static struct dpu_dsc_cfg sdm845_dsc[] = {
>>   /*************************************************************
>>    * INTF sub blocks config
>>    *************************************************************/
>> -#define INTF_BLK(_name, _id, _base, _type, _ctrl_id, _progfetch, 
>> _features, _reg, _underrun_bit, _vsync_bit) \
>> +#define INTF_BLK(_name, _id, _base, _len, _type, _ctrl_id, 
>> _progfetch, _features, _reg, _underrun_bit, _vsync_bit, _tear_reg, 
>> _tear_rd_ptr_bit) \
>>       {\
>>       .name = _name, .id = _id, \
>> -    .base = _base, .len = 0x280, \
>> +    .base = _base, .len = _len, \
>>       .features = _features, \
>>       .type = _type, \
>>       .controller_id = _ctrl_id, \
>>       .prog_fetch_lines_worst_case = _progfetch, \
>>       .intr_underrun = DPU_IRQ_IDX(_reg, _underrun_bit), \
>>       .intr_vsync = DPU_IRQ_IDX(_reg, _vsync_bit), \
>> +    .intr_tear_rd_ptr = DPU_IRQ_IDX(_tear_reg, _tear_rd_ptr_bit), \
>>       }
>>   static const struct dpu_intf_cfg msm8998_intf[] = {
>> -    INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 25, 
>> INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>> -    INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 25, 
>> INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
>> -    INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 25, 
>> INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
>> -    INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_HDMI, 0, 25, 
>> INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
>> +    INTF_BLK("intf_0", INTF_0, 0x6A000, 0x268, INTF_DP, 0, 25, 
>> INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 24, 25, -1, -1),
> 
> Just wondering, how were the lengths calculated for the INTF blocks? The 
> values in general seem a little off to me.
> 
> For example, I'm looking downstream and it seems to me that the length 
> for the INTF_0 on MSM8998 should be 0x280. Similarly for SC7280, I'm 
> seeing that length for INTF + tearcheck should be 0x2c4.

We have discussed INTF lengths in [1]. The current understanding of the 
block lengths can be found at [2]. Please comment there if any of the 
fixed lengths sounds incorrect to you.

[1] https://patchwork.freedesktop.org/patch/522187/
[2] https://patchwork.freedesktop.org/patch/522227/

[skipped the rest]

-- 
With best wishes
Dmitry

