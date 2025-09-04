Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBC6B4376C
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 11:44:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7555E10E9CF;
	Thu,  4 Sep 2025 09:44:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gewxwi96";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44BEF10E9CF
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 09:44:46 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849XAiq014005
 for <dri-devel@lists.freedesktop.org>; Thu, 4 Sep 2025 09:44:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 E2xB4mOu1znNlqIuZSQ4Z+wcSguLgnn57cS+nmkr+d0=; b=Gewxwi96DHWLyRnl
 0I6AomO/tXIH2bpeT6tA4neoerto4S+D6wEGsrLaGEURauh+MRsnYWWhoFZb/xuW
 dcfk1ixR/BLpIcvJAjGINn1h5OG3kG793S2dcoq8d/CgfI6nPafdgJ/HBLpag8xB
 fuqv2/LbVrioAf+xIiV5kBb2ytEi6EhnZsVD+K5zxgAfZhaA1bCReMSGUjDS/YtX
 dCHDINqcl4VuTl3cYnp1oouKVl8Kqa7GvR6C8Yd+ENjI4Q8wYOTFZnikxabAg5Zt
 anjJ/05MuZZcF1ntXhALny1s7XMMOMJ+joO+f0dINDS0rlQglsZB5z3cRfleBfdX
 sGKkKQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscv762g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 09:44:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b32216a52cso2039171cf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 02:44:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756979084; x=1757583884;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E2xB4mOu1znNlqIuZSQ4Z+wcSguLgnn57cS+nmkr+d0=;
 b=HbcPYZS3Dw/dWNsj80kXDj615y2Lk+7UFeNQU0zWOMYcU7lI21sziauUS6igmBXRXw
 XvPWEPUTA3PW6fOSwBr9+ShA6NBpF9WHbbR4DJldpAwlBRgsLEiBxozoD6jy23Ggi3NV
 4AHl4DOJJ0s4U/kqn990IK0DzbWkgpqxIl08RscJmWZjDKIgr666/7IJ8wZJFWQzMk7j
 4NkjFXvjcNU79lDET1ctWJ2w5jW6Iio/RiMstGmyZAU3C9Rb2+odKpmi4+vyvREnUQrL
 uxte6sQPxdsZIOxrdRJxSgEV3fn1vctCf/7ViklZo1ZHQKivhsEdRmz6Ddnp/cmKBUYd
 w2Dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+ouTDM1UL+ThJIY88JRoKmOMb8Am+/eD08g1Xbge3BAzhvuhOWQkw7ZX/cVxuoQgCJgVZaT0bjBU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvyUYWJfweJ0rIKGpx/XuH82vrBlKOPl9WlBMhN12FlN4itBpa
 RZPy2MOl+cL8HqwlqD3Y+2tsj6BwY3Mu5AnSRwfmlEJRC8l3/mr92WRh4CNvOt/GdeY1Qya/Vnb
 OsghGgl3BqEo0rjhzD2Vlpv2Wzme0nwOoMrFUymXx6FyMVGonS+GJrDe5Jz+eL6dQyW9/w8o=
X-Gm-Gg: ASbGncv37aKz1l0aYpNqHDrP/eSWmh6+RInIMtYrgD1hlPB97JoHR/p7/+RrxYoABoW
 uoQfz10jLc2E6KKS5SB2VZbfUn9CaY2yvQOLGYD/KahqfYPNlUwoDI9VoJNR8YRGIRk+1e6Wm1p
 qB3bF6i0qPKgKBIAl6vwsPRskicXNiyIIUtOsdr68ROA2BN90DAFDowBxt4wX7k13u/+AdMl/Ot
 3N0c/O98ackQS34zMF4sHisL9lb90quNRorteVdLAoMU/PLUaFdMPeXRVrCKkxowp6RPfduiLpY
 qGtOZqVlCmHdqyCCRPFplgIeN0wCBSW52deosElMylxUKJ+IMFMzFi/suXBreTdK2ue00D6L7SI
 X1qLdJ30pIlnN0rR8WHh2tA==
X-Received: by 2002:a05:622a:1449:b0:4b5:e0f9:7c3e with SMTP id
 d75a77b69052e-4b5e0f97cf7mr2002241cf.7.1756979083640; 
 Thu, 04 Sep 2025 02:44:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFddkcfy6H/u8rC5iQgUBLStJm7u9VMl1822a43BBpyhJ0gD+RIQDDoUmYuegytNw98TCK13g==
X-Received: by 2002:a05:622a:1449:b0:4b5:e0f9:7c3e with SMTP id
 d75a77b69052e-4b5e0f97cf7mr2002011cf.7.1756979083052; 
 Thu, 04 Sep 2025 02:44:43 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b044703f412sm701070366b.56.2025.09.04.02.44.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Sep 2025 02:44:42 -0700 (PDT)
Message-ID: <c60ace5f-d682-4373-9c45-66782162dd25@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 11:44:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 0/6] Display enablement changes for Qualcomm QCS8300
 platform
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250904-qcs8300_mdss-v11-0-bc8761964d76@oss.qualcomm.com>
 <5bc0203c-21a1-4948-96ff-8eae844bfb93@oss.qualcomm.com>
 <d2940186-7baf-41d3-80dd-fbc860ac5acb@oss.qualcomm.com>
 <f3aa35bb-5ac7-4fe3-904e-2dd97b9c034a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f3aa35bb-5ac7-4fe3-904e-2dd97b9c034a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfX7tX8lzeJWW6f
 Xvvwj+7Mr07O4HxRmTVCglz1GWeLSJy5OgMMCQkZ7ReRsSlflNTTdJTVHyex8JlqAPFk3L+2Tii
 WR6aD8wNPnJBaoO5EgdBAW5IogXtKcRKVW/RbXXXBR7asPQB5RcxMS89w0fsrErvmVTpq9JgdD2
 vboUTlxI8XS+kTmwjKETDGamj5wmPksOgTTqtYPPOvmp+Vik8t9JhdWdyIjgtDUlwVdBzyTbq32
 adn5/KEC//8SjN4KQmSJOmaCaWwmrtkHCUynoGUJ32hniM4jOpUitJaEjmRpuZhai6ADxQQvb6j
 YirMvTbZKtiojXePp0seSiStcu62uaR3SjI5VOIQXPfz22iizJ4f5mJw53etir0Ec9t8M8pCpAs
 gE3p5B+y
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b95f8d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=1XWaLZrsAAAA:8 a=KKAkSRfTAAAA:8 a=WFfk4irFjAd-BuTiO94A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: AsRh5Yqvi-F-Ujtx1LNh8GZbd7Ty4XIt
X-Proofpoint-GUID: AsRh5Yqvi-F-Ujtx1LNh8GZbd7Ty4XIt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031
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

On 9/4/25 11:31 AM, Yongxing Mou wrote:
> 
> 
> On 9/4/2025 4:21 PM, Konrad Dybcio wrote:
>> On 9/4/25 9:55 AM, Yongxing Mou wrote:
>>>
>>>
>>> On 9/4/2025 3:22 PM, Yongxing Mou wrote:
>>>> This series introduces support to enable the Mobile Display Subsystem (MDSS)
>>>> , Display Processing Unit (DPU), DisplayPort controller for the Qualcomm
>>>> QCS8300 target. It includes the addition of the hardware catalog, compatible
>>>> string, and their YAML bindings.
>>>>
>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>> ---
>>>> Changes in v11: Fixed review comments from Dmitry.
>>>> - Rebase to MST bindings V8.
>>>> - Update the clocks-name for QCS8300 in dp-controller.
>>>> - Link to v10: https://lore.kernel.org/r/20250901-qcs8300_mdss-v10-0-87cab7e48479@oss.qualcomm.com
>>>>
>>>> Changes in v10:
>>>> - Rebase to MST bindings V7.
>>>> - Update the P2/P3/MST2LINK/MST3LINK regions in MDSS yaml.
>>>> - Link to v9: https://lore.kernel.org/r/20250825-qcs8300_mdss-v9-0-ebda1de80ca0@oss.qualcomm.com
>>>>
>>>> Changes in v9: Fixed review comments from Dmitry.
>>>> - Updated the description of dp-controller DT binding.
>>>> - Add new clause only work for QCS8300(one DP controller with 4 streams).
>>>> - Link to v8: https://lore.kernel.org/r/20250821-qcs8300_mdss-v8-0-e9be853938f9@oss.qualcomm.com
>>>>
>>>> Changes in v8: Fixed review comments from Krzysztof, Dmitry.
>>>> - Fixed incorrect description for dp-controller in driver/dt-binding.[Krzysztof][Dmitry]
>>>> - Fixed incorrect description for ubwc change.[Dmitry]
>>>> - Link to v7: https://lore.kernel.org/r/20250819-qcs8300_mdss-v7-0-49775ef134f4@oss.qualcomm.com
>>>>
>>>> Changes in v7: Fixed review comments from Dmitry.
>>>> - Rebase to next-20250818 and 4 pixel stream series V6.
>>>> - Add more description for the dp-controller dt-bingding change.[Dmitry]
>>>> - Reorder the MDSS change and UBWC change.[Dmitry]
>>>> - Switch to the OSS email.
>>>> - Link to v6: https://lore.kernel.org/r/20250806-mdssdt_qcs8300-v6-0-dbc17a8b86af@quicinc.com
>>>>
>>>> Changes in v6: Fixed review comments from Konrad, Dmitry.
>>>> - Rewrite commit msg in dp-controller dt-binding change.[Dmitry]
>>>> - Optimize the description in MDSS dt-binding.[Dmitry]
>>>> - Pass the sc8280xp_data as fallback in the UBWC change.[Konrad]
>>>> - Add the DP controller driver change.
>>>> - Link to v5: https://lore.kernel.org/r/20250730-mdssdt_qcs8300-v5-0-bc8ea35bbed6@quicinc.com
>>>>
>>>> Changes in v5:Fixed review comments from Krzysztof, Dmitry.
>>>> - Rebase to next-20250717.
>>>> - Change DP compatible to qcs8300-dp due to add 4 streams support.
>>>> - Add QCS8300 UBWC config change due to rebase.
>>>> - Add 4 streams clk and phy in the mdss yaml.
>>>> - Link to v4: https://lore.kernel.org/r/20250120-mdssdt_qcs8300-v4-0-1687e7842125@quicinc.com
>>>>
>>>> Changes in v4:Fixed review comments from Krzysztof, Dmitry.
>>>> - Use the common style for the dt-bindings commits.[Dmitry]
>>>> - Update the commits msg for the mdss binding patch, explain why they
>>>>     reuse different platform drivers.[Krzysztof]
>>>> - Link to v3: https://lore.kernel.org/r/20250113-mdssdt_qcs8300-v3-0-6c8e93459600@quicinc.com
>>>>
>>>> Changes in v3:Fixed review comments from Krzysztof, Dmitry.
>>>> - Fix the missing space issue in commit message.[Krzysztof]
>>>> - Separate the patch for the phy from this series.[Dmitry]
>>>> - Remove unused dependencies and update in the cover letter.[Dmitry][Krzysztof]
>>>> - Link to v2: https://lore.kernel.org/r/20241226-mdssdt_qcs8300-v2-0-acba0db533ce@quicinc.com
>>>>
>>>> Changes in v2:Fixed review comments from Krzysztof, Dmitry, Rob.
>>>> - Decouple the devicetree changes from this series.[Dmitry][Krzysztof]
>>>> - Drop the dpu driver changes and reuse SA8775P DPU driver.[Dmitry]
>>>> - Fix compilation issues in MDSS bindings.[Rob][Krzysztof]
>>>> - Correct formatting errors and remove unnecessary status in MDSS
>>>>     bindings.[Krzysztof]
>>>> - Add the the necessary information in MDSS changes commit msg.[Dmitry]
>>>> - Rebase MDSS driver changes to https://lore.kernel.org/dri-devel/
>>>>     20241127-msm-mdss-ubwc-v3-0-9782a7c2b023@linaro.org/.[Dmitry]
>>>> - Package the DisplayPort controller and eDP PHY bindings document to
>>>>     this patch series.
>>>> - Collecting MDSS changes reviewd-by Dmitry.
>>>> - Reuse the sa8775p eDP PHY as a fallback compat.[Dmitry]
>>>> - Reuse the sm8650 DP controller as a fallback compat.[Dmitry]
>>>> - Link to v1: https://lore.kernel.org/r/20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com
>>>> ---
>>>> This series depend on 4 pixel streams dt-binding series:
>>>> https://lore.kernel.org/all/20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com/
>>>>
>>>> and separate eDP PHY binding:
>>>> https://lore.kernel.org/all/20250730072725.1433360-1-quic_yongmou@quicinc.com/
>>>>
>>>> ---
>>>> Yongxing Mou (6):
>>>>         dt-bindings: display/msm: Document the DPU for QCS8300
>>>>         dt-bindings: display/msm: dp-controller: document QCS8300 compatible
>>>>         dt-bindings: display/msm: Document MDSS on QCS8300
>>>>         soc: qcom: ubwc: Add QCS8300 UBWC cfg
>>>>         drm/msm: mdss: Add QCS8300 support
>>>>         drm/msm/dp: Add DisplayPort controller for QCS8300
>>>>
>>>>    .../bindings/display/msm/dp-controller.yaml        |  22 ++
>>>>    .../bindings/display/msm/qcom,qcs8300-mdss.yaml    | 286 +++++++++++++++++++++
>>>>    .../bindings/display/msm/qcom,sm8650-dpu.yaml      |  15 +-
>>>>    drivers/gpu/drm/msm/dp/dp_display.c                |   1 +
>>>>    drivers/gpu/drm/msm/msm_mdss.c                     |   1 +
>>>>    drivers/soc/qcom/ubwc_config.c                     |   1 +
>>>>    6 files changed, 321 insertions(+), 5 deletions(-)
>>>> ---
>>>> base-commit: 3ac864c2d9bb8608ee236e89bf561811613abfce
>>>> change-id: 20250818-qcs8300_mdss-a363f0d0ba0b
>>>> prerequisite-message-id: <20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com>
>>>> prerequisite-patch-id: ffeeb0739a4b3d310912f4bb6c0bd17802818879
>>>> prerequisite-patch-id: cdc3f4515ab23a8b2ce719bbdbcb56043803d03f
>>>> prerequisite-patch-id: 048b11765f49af4a728db1525fef1eb8ad48bf88
>>>> prerequisite-patch-id: f0f92109d1bfffa6a1142f2aaecbd72a29b858c0
>>>> prerequisite-patch-id: a8185cf3ddd85b9058691500b8dc0c57c8226e97
>>>> prerequisite-patch-id: a389a2e4eca44bf62bb2c861c96596368be7a021
>>>> prerequisite-patch-id: 09ec7f51de0a65c68c2c781750177017f32747ba
>>>> prerequisite-patch-id: f76ab0ae189df14acc851fa52f8f8e8faed9a505
>>>> prerequisite-patch-id: 983fc8a7bea459505c5b27db1a1ef7581936555c
>>>> prerequisite-message-id: <20250730072725.1433360-1-quic_yongmou@quicinc.com>
>>>> prerequisite-patch-id: 2ea89bba3c9c6ba37250ebd947c1d4acedc78a5d
>>>>
>>>> Best regards,
>>>
>>> Hi, maintainers:
>>> sorry for the inconvenience caused. This series is missing patch 5 and patch 6 due to network issues. May I resend it? The missed two changes are identical to V10.
>>
>> You can fix that manually by sending them both through
>>
>> b4 send -o /tmp/
>> git send-email --in-reply-to=<cover letter msgid> /tmp/0005-xyz-abc.patch
>> git send-email --in-reply-to=<cover letter msgid> /tmp/0006-xyz-abc.patch
>>
>> Konrad
> Thanks for guide, when i use cmd  "git send-email --in-reply-to="20250904-qcs8300_mdss-v11-0-bc8761964d76@oss.qualcomm.com" ~/tmpyongmou/0005-drm-msm-mdss-add-qcs8300-support.eml", seems something wrong, error log:
> mou@oss.qualcomm.com>,  Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>'
> (body) Adding cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> from line 'Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>'
> 5.1.3 The recipient address <y> is not a valid RFC 5321 address. For more
> 5.1.3 information, go to
> 5.1.3  https://support.google.com/a/answer/3221692 and review RFC 5321
> 5.1.3 specifications. d9443c01a7336-24b1ba1718bsm64512315ad.39 - gsmtpWould you mind sharing some suggestions for this? Thanks~~

Looks wrong, perhaps you pressed 'y' instinctively when git send-email asked you
whom (additionally) send the message to. Just to make sure b4 isn't broken I
tried something similar (ignore dry-run, I simply didn't want to send any emails): 

git send-email --dry-run /tmp/0014-illustrative_test.eml
To whom should the emails be sent (if anyone)? <enter>
Message-ID to be used as In-Reply-To for the first email (if any)? <enter>
<lots of email spam>

Result: OK
