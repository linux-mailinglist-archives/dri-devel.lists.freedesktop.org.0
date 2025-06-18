Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 646B5ADEE9D
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 15:58:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD76010E855;
	Wed, 18 Jun 2025 13:58:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KZ0QXeDB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCF1F10E854
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 13:58:09 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IBu57e013337
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 13:58:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xWNDuLjs61HKmyKQ2RsY6PEfjDT+y4fR+sdFhZngCW0=; b=KZ0QXeDBzvd6Mwq4
 eMA+TaaUD2+g74++ti18W5sHxyIUJIJ2kSFT0W7lb+A0Xc6BYG2vj8vlVui3ariX
 8jpvxvY8dZVDsTEG+GidvlPspaAKEkeV2NcatB50sMDmaw2Cdue6uzK68+qpQYWD
 8se0xUS5kCFqKkiR2SWffx78w/iPxFKG+q9Kz+7sVRhoInTh5ukrffhOHEMdFoQ3
 GFq5fbKDLjzNpWyllnGjKsg0lHZAE47QKMW+7yOlU8Tr7fGGbiVgMzAlKTYUQATB
 BOt+jBkzup7/cJ7U7G+1PfqgKdgSCyr9GmqITDMoOGO/E95pZYxfGP1llotGPEVe
 w0RoMA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hfme9x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 13:58:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7d3cbf784acso1275110285a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 06:58:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750255087; x=1750859887;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xWNDuLjs61HKmyKQ2RsY6PEfjDT+y4fR+sdFhZngCW0=;
 b=mOHfE38mdZskOwMl0NiVZkGnx+1P0F3aSEcBUc+KpILJHaZica0gUIBafmsegbCgTX
 xo21a4IGk/koPjUUkAWlWw7DLJp8k/7z3QQK8YofjRwoC/ouM2tV07sZRML2FEDlxZ58
 1PX2Bc/2oQRG9I5qCt2XYzTceiUoyM/7E0zy5GzpSLVADlNF/ZxoeLxxZzy9CHMyHEYO
 JuqQwd2E30cxkQZhtQsgG93hC2mhQNFPHAgehF9WiUbrmD7OGtRTScg2CChBW+Ho1b4Z
 o4oX0pM2mlvzSPXLm6Xb/OtjUBsyxc6X3WWUVnmZgM8euqRpEeA6DkRiOcioF0M/PK/U
 G9hQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSXLaVYZhCpWAvfC0JQt0ahVXh5ETV67CiK/dF81dXM+3NH39TTTlEIcZUv8C7YrVaqMj7FmvTiBk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2PBGoWomfxf0i7AVcNplEzmF5Rsi/CR8zZiAr62llFEL3RmRS
 uP9wF1CiwqzlpV1Wpk8+n+6MYLDqiXzQWNEriRF4Q0nh+nIkoasm9WPGzrkiGuXejX0B+4gHTTK
 FrgmCDWy9P9YX6f8Hdpbomre48Aix24zOn6OY2WpjJm+RT/cDMHDk3NnTxVfF8NC+R2lQa9c=
X-Gm-Gg: ASbGncvU4QfedpokhxWSNXvxxjX8T2ogkutycBopi2ZhUrCcfUj4VTSbo0cAzyduhdA
 y6o+U20NqmEO2h9NOxPTvfX/bzhAQ39LCptEaMVcv1L441aOPw1VTIx7r2wTZoutZY+Oagj9wlT
 wVMUgEQSCgHGR3lFgndVUOtEYfH5VdfBvqR/KlPdwBU0F3hhdfMXuQQVmDWkAD75ywVn+3NuVwB
 kYY3lna8T4GanmsW4+XKAmIgYhLr28/W6hPZgdLwTf10dXYxXL8NK753Gk9UiJl33M92YBKvhwX
 kvet3m4KUcj9BXPAIOAjrfZliWfYkDm0Zi5Bhw24xw==
X-Received: by 2002:a05:620a:4494:b0:7d3:c688:a4ee with SMTP id
 af79cd13be357-7d3c6c17879mr2527939585a.24.1750255087412; 
 Wed, 18 Jun 2025 06:58:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0At7/LCw5/M/SPoralsaQOAVP/W8VEhHHYH6eAAF5BZgq79hxI+OOdeDg1uWbxWnHFjh9Cg==
X-Received: by 2002:a05:620a:4494:b0:7d3:c688:a4ee with SMTP id
 af79cd13be357-7d3c6c17879mr2527933285a.24.1750255086908; 
 Wed, 18 Jun 2025 06:58:06 -0700 (PDT)
Received: from [10.92.240.160] ([212.136.9.4])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-adec81bb9cesm1051140966b.49.2025.06.18.06.58.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jun 2025 06:58:06 -0700 (PDT)
Message-ID: <28992d6c-eb98-412e-86d8-d35a96f69fd1@oss.qualcomm.com>
Date: Wed, 18 Jun 2025 16:58:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/17] drm/msm/dsi/phy: Fix reading zero as PLL rates
 when unprepared
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Abel Vesa <abel.vesa@linaro.org>, Srinivas Kandagatla <srini@kernel.org>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
 <20250610-b4-sm8750-display-v6-8-ee633e3ddbff@linaro.org>
 <n5djafe2bm4cofoa3z4urfogchhfacybzou763nelttgfspo25@bywfd5febe6g>
 <dbcfcb3c-0cba-45f6-aaed-b79494d96cde@linaro.org>
 <738a889d-9bd5-40c3-a8f5-f76fcde512f4@oss.qualcomm.com>
 <8a986ebb-5c25-46d9-8a2f-7c0ad7702c15@linaro.org>
 <24xkss4bw6ww43x2gbjchcm4gtmqhdecncmxopnnhf7y2tblc2@iibgqhuix5rm>
 <f2654844-091f-46bf-88c6-6f6d4edc5533@linaro.org>
 <fa8d4af9-e822-4dec-a8dc-f3bbf5dd0100@oss.qualcomm.com>
 <07af3f49-6992-4897-acec-b2d46158fa00@linaro.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <07af3f49-6992-4897-acec-b2d46158fa00@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDExNyBTYWx0ZWRfX1YCWWNq5hy6V
 NI/Hi0QmIRzwN/GqA8V+FRNXdkyAiPS8QdBgSypJgPHrdUaAv27qrlq3EmWlOqFgi6Uj0vLUCGF
 mtSKpJfu3AYB/UtBFaZsfKBMlJWYrwLjhzdzNW786vxkUheQuJDJyuRPYmR3vNBFwhCzKBP42D7
 kKFwQTCJZtSqMrpwaRJp6CXgwQX5/Z9C8bljKgqtcTGJ25G9zHzIuF8FSg7JllOFQ6HfaNfkjdi
 H/HAbVYqKQhAfOovd15qTqlNeQQrga7v7EOdrMorZenJbWlhWcApt9YrR8yjL3AaNqBSf6GA0LW
 vXq8A5ITYO7DK7/HLUpM332bQyQIkt0MW/cy5ZO24C/Nkc007Icx6KhIgHtH+7JChJcIReMnz0s
 keSPOp7FngDZpMQbTBlkpJtxZiFxGZn/W8McSPBav9cs1oPGOPzGeLQbOYCN38DzF1dkymJ7
X-Authority-Analysis: v=2.4 cv=VvEjA/2n c=1 sm=1 tr=0 ts=6852c5f1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=Yv6ZAifYCY2YzpHKyskA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: ql2QOs9qBm-fuBbNSvzbRrzeGuQMKvxh
X-Proofpoint-ORIG-GUID: ql2QOs9qBm-fuBbNSvzbRrzeGuQMKvxh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180117
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

On 18/06/2025 16:54, Krzysztof Kozlowski wrote:
> On 18/06/2025 15:39, Dmitry Baryshkov wrote:
>> On 18/06/2025 16:34, Krzysztof Kozlowski wrote:
>>> On 18/06/2025 15:07, Dmitry Baryshkov wrote:
>>>> On Wed, Jun 18, 2025 at 10:28:10AM +0200, Krzysztof Kozlowski wrote:
>>>>> On 13/06/2025 16:04, Dmitry Baryshkov wrote:
>>>>>> On 13/06/2025 17:02, Krzysztof Kozlowski wrote:
>>>>>>> On 13/06/2025 15:55, Dmitry Baryshkov wrote:
>>>>>>>>>     
>>>>>>>>> @@ -361,24 +373,47 @@ static int dsi_pll_7nm_lock_status(struct dsi_pll_7nm *pll)
>>>>>>>>>     
>>>>>>>>>     static void dsi_pll_disable_pll_bias(struct dsi_pll_7nm *pll)
>>>>>>>>>     {
>>>>>>>>> +	unsigned long flags;
>>>>>>>>>     	u32 data;
>>>>>>>>>     
>>>>>>>>> +	spin_lock_irqsave(&pll->pll_enable_lock, flags);
>>>>>>>>> +	--pll->pll_enable_cnt;
>>>>>>>>> +	if (pll->pll_enable_cnt < 0) {
>>>>>>>>> +		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>>>>>>>>> +		DRM_DEV_ERROR_RATELIMITED(&pll->phy->pdev->dev,
>>>>>>>>> +					  "bug: imbalance in disabling PLL bias\n");
>>>>>>>>> +		return;
>>>>>>>>> +	} else if (pll->pll_enable_cnt > 0) {
>>>>>>>>> +		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>>>>>>>>> +		return;
>>>>>>>>> +	} /* else: == 0 */
>>>>>>>>> +
>>>>>>>>>     	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>>>>>>>>>     	data &= ~DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
>>>>>>>>>     	writel(0, pll->phy->pll_base + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES);
>>>>>>>>>     	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>>>>>>>>> +	spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>>>>>>>>>     	ndelay(250);
>>>>>>>>
>>>>>>>> What is this ndelay protecting? Is is to let the hardware to wind down
>>>>>>>> correctly? I'm worried about dsi_pll_disable_pll_bias() beng followed up
>>>>>>>> by dsi_pll_enable_pll_bias() in another thread, which would mean that
>>>>>>>> corresponding writes to the REG_DSI_7nm_PHY_CMN_CTRL_0 can come up
>>>>>>>> without any delay between them.
>>>>>>>>
>>>>>>>
>>>>>>> Great question, but why do you ask me? The code was there already and
>>>>>>> MSM DRM drivers are not something I know and could provide context about.
>>>>>>
>>>>>> Because it's you who are changing the code as you've faced the issue
>>>>>> with recalc_rate.
>>>>>>
>>>>> Heh, the answer is then: I don't know. I think authors of the code could
>>>>> know.
>>>>
>>>> The 10nm HPG documents a 250ns interval between enabling PLL bias and
>>>> and enabling the PLL via the CMN_PLL_CNTRL register. There is no extra
>>>> delay between disabling the PLL, disabling FIFO and remobing PLL bias.
>>>> Please adjust the code for 7nm and 10nm PHYs accordingly.
>>>>
>>>>
>>>
>>> I can drop this 250 ns here, if that's what you ask me. But fixing
>>> anything in 10nm is not relevant to this patchset. You were already
>>> asking me for different fixes for some different things and I find it
>>> not acceptable anymore. Stop blocking this patchset with every little
>>> existing issue.
>>
>> I think that it is a common practice to ask to fix the issue in relevant
> 
> No, it is not.
> 
> It is common practice to fix things everywhere, but you rejecting the
> patches on that basis (coming again with some requests for unrelated
> issues) is not common and not correct.
> 
>> pieces. For example, we frequently ask to fix all the DT files if there
>> was an issue / workaround reported against a selected set of those.
> 
> And you reject the submitted fix of one DT file based because
> contributor did not fix the rest? Really? Since when do you employ such
> practice?

On a case-by-case basis. See the USB snps workarounds for an example.

> 
>>
>> In this case you can send a fix for 10nm separately, but please post a
>> fix for that platform too.
>>
>>>
>>> Or merge this code without this patch if a fix for reading PLL as zero
>>> anyhow is questionable for you.
>>
>> I think I've asked it at some point, to split the generic code parts and
>> the DSI enablement into two different patch series, so that they could
>> be picked up separately.
>>
>> No, the fix is not questionable. The patch causes questions though.
> 
> I have no interests in fixing DRM code. This is not my subsystem, this
> is not part I am responsible for. If it raises questions, why not
> devoting your time to fix it?

Then why are you submitting patches towards the DRM driver? I think the 
usual rules apply, you not having interest doesn't lower the bar for 
your submissions.

> 
> Best regards,
> Krzysztof


-- 
With best wishes
Dmitry
