Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A43CDB43586
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 10:21:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FC0E10E349;
	Thu,  4 Sep 2025 08:21:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JPB3uAve";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1823910E2DD
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 08:21:45 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58413nXW021016
 for <dri-devel@lists.freedesktop.org>; Thu, 4 Sep 2025 08:21:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 G7vuEYezAclQnGX21qrANx4NW0HHSU2TfxUcHGP8ds8=; b=JPB3uAveMgUrSI7/
 911ArKRLgZ4O/OmBy4WFH/QceijOt6uCIoHlTldWGrpLQzwMsVDRCx663rJKZkj0
 nlv7YjWR2HP/qZ43SQ1FbT1/jcgceLFPlGXEYQ5HE7J3r39cBPZ1rCJ6UW158vs8
 3YuzBzlKlMaT/PGemRUQTo3PRCrwBgQJf9bV6Mds50ncPNxODQwc6WYHcQzNB4Op
 hTYo2KYSgzw1S+4g2kLwbU2vRgTrHLOfVA3S4Ea4qStZ4NKsIpnfwS1cN0660fqp
 sDrTX5gEV2jved0YOZmsL7nP06tAZWmctqQotuKIXcyqu51rTftjFbFUF8oO7tNe
 Ojm5tw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2fpmp1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 08:21:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b32216a52cso1830131cf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 01:21:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756974101; x=1757578901;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G7vuEYezAclQnGX21qrANx4NW0HHSU2TfxUcHGP8ds8=;
 b=G0/sGNsPufzBq3wFdIMSeVdWN+fI31YZXi+Nmxw6TfAy1ZbFqc8tF3SG24gkqmBEHT
 h8W9tEiZmVtJQ8SHkPcIdc5uFsS6cpsOFMdsg2ObXHwIOymkO8rD73vCSQp/6nKpQard
 krNWerZ/wZIUszoe1BhGi4jw1lICNvBYYpNftS0rhTPf6JVhot7HcXdUturGIWx4kzZB
 Zly6rZNKZ8CVqy0WSo+AFf9MUW7fm35VerZz7KqpEbHA+hiPh4o7sOwkiO/lkcFNlrAE
 rOOxoW+bPYj6T3FN3Z7kofDwD4GWQ7NZ9Y9Vx09LRuIDxaUC+zWBEAMK8yTSTMyHA+zP
 bJWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUs5PP/eqKYiZP62u48l8kM26RIA8XmNMDcHs2bPCwIDceVtl0roNokQ00jqCbaCTmWNtAo0uBdvL4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCYVXnk2SFnzjHQuZk2ReTCnu8PEbgAsOpf6kECcv6ZncEqqFT
 1WnSvKYScGHAoNMi5UZ5Uga60M8HMDRJcUgpXFes324Ucsd5A98jm56j7q6L8bKWM/nn/HK0He6
 IsWtLu+A/378dSKFOsAPXqdg9RJEbbJEeWYw1KrY7KIBR6jhTKdulDuV3FqX4yA7jkf/62eY=
X-Gm-Gg: ASbGncvEvShdpDmA3i7XS9c8z+4JXQqJHVjfhXh04vVwx8QdzndTWmC0ZMkwJN2YjIa
 foUbOOnHYJ2gCX/GeTV9P35JQbn6jeFUHjeOaEiePnpnCgI043CibDAQH5qmtGqcaVVSTTp4qHw
 8IYFVwQ/6pWYbWMJSCTOnp/poirkFTA1RWKds2b9+jPBN9sciOrPtghMaWgfK66FHpJEAbNys5b
 wyMqTtHK+628TQfjP3pcahZCIxUXH6Tw5crJ03szDzsmGBx+xGBgzj7DhjLFcpsQ5PB6k8CeLG7
 NihjxvyeiXLTE1c5Dh/zRGbiUJb7nZkQZV3ZTJGxR17TnnXQxrmrYM7NJWIhKwdk5iNZZLVKUfW
 oMZxlQp0mFbSBRkP5Ie607g==
X-Received: by 2002:ac8:57c5:0:b0:4b2:d4ff:9ef1 with SMTP id
 d75a77b69052e-4b30e91ece8mr193805521cf.5.1756974101244; 
 Thu, 04 Sep 2025 01:21:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhpdB1EGq/rqFX09t8O7MeDdp3MZRYztL04B/dtliw3WnUXk0wRSxWriQ2b/SMaKMgYlG0yg==
X-Received: by 2002:ac8:57c5:0:b0:4b2:d4ff:9ef1 with SMTP id
 d75a77b69052e-4b30e91ece8mr193805301cf.5.1756974100631; 
 Thu, 04 Sep 2025 01:21:40 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0416e878a2sm1087490866b.95.2025.09.04.01.21.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Sep 2025 01:21:39 -0700 (PDT)
Message-ID: <d2940186-7baf-41d3-80dd-fbc860ac5acb@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 10:21:36 +0200
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5bc0203c-21a1-4948-96ff-8eae844bfb93@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfX/3uHDodzNGrQ
 L90pJ6bTHxwNI9RDQMsSD5wSCzDdZRMErGtX1E41s/sgCLA5goDuHBGA26UFzCVIy6r+v/WwHSz
 c1i0R6iCPQGOzUJG/h9CPcM+cFFhYVdhrqdlXuEH1DRnw8ogyVL2B73ZVG37uX4EmneJPMlAjfr
 qDHFczQOeGKjJ6n5wpc/NDT3EUSJi3CSECFw9OmLiSGlhiCaYxmfUCyMnTRQfIVUMRiKRLwB8/K
 Gb8kYOn9dK7w3+6MxmjFXypsfYYAf0cEEjAk1/+rGYrojEnxE0fBxISFTyIny2ycPtRwhSGrrIf
 Q1U2QlWeTYUrLMLwtfh4qkrPoWKf/nHBsqmsJwS5HHLrEk0EqTIr6EVOTs/yhb9G/JsVS9ociGJ
 Ix2CepWL
X-Proofpoint-ORIG-GUID: Apco9ebOiWF8sl1gdXFDV9mCba3WlD7x
X-Proofpoint-GUID: Apco9ebOiWF8sl1gdXFDV9mCba3WlD7x
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68b94c18 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=QEN1f650Fdx1fgK6Dx0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038
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

On 9/4/25 9:55 AM, Yongxing Mou wrote:
> 
> 
> On 9/4/2025 3:22 PM, Yongxing Mou wrote:
>> This series introduces support to enable the Mobile Display Subsystem (MDSS)
>> , Display Processing Unit (DPU), DisplayPort controller for the Qualcomm
>> QCS8300 target. It includes the addition of the hardware catalog, compatible
>> string, and their YAML bindings.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>> Changes in v11: Fixed review comments from Dmitry.
>> - Rebase to MST bindings V8.
>> - Update the clocks-name for QCS8300 in dp-controller.
>> - Link to v10: https://lore.kernel.org/r/20250901-qcs8300_mdss-v10-0-87cab7e48479@oss.qualcomm.com
>>
>> Changes in v10:
>> - Rebase to MST bindings V7.
>> - Update the P2/P3/MST2LINK/MST3LINK regions in MDSS yaml.
>> - Link to v9: https://lore.kernel.org/r/20250825-qcs8300_mdss-v9-0-ebda1de80ca0@oss.qualcomm.com
>>
>> Changes in v9: Fixed review comments from Dmitry.
>> - Updated the description of dp-controller DT binding.
>> - Add new clause only work for QCS8300(one DP controller with 4 streams).
>> - Link to v8: https://lore.kernel.org/r/20250821-qcs8300_mdss-v8-0-e9be853938f9@oss.qualcomm.com
>>
>> Changes in v8: Fixed review comments from Krzysztof, Dmitry.
>> - Fixed incorrect description for dp-controller in driver/dt-binding.[Krzysztof][Dmitry]
>> - Fixed incorrect description for ubwc change.[Dmitry]
>> - Link to v7: https://lore.kernel.org/r/20250819-qcs8300_mdss-v7-0-49775ef134f4@oss.qualcomm.com
>>
>> Changes in v7: Fixed review comments from Dmitry.
>> - Rebase to next-20250818 and 4 pixel stream series V6.
>> - Add more description for the dp-controller dt-bingding change.[Dmitry]
>> - Reorder the MDSS change and UBWC change.[Dmitry]
>> - Switch to the OSS email.
>> - Link to v6: https://lore.kernel.org/r/20250806-mdssdt_qcs8300-v6-0-dbc17a8b86af@quicinc.com
>>
>> Changes in v6: Fixed review comments from Konrad, Dmitry.
>> - Rewrite commit msg in dp-controller dt-binding change.[Dmitry]
>> - Optimize the description in MDSS dt-binding.[Dmitry]
>> - Pass the sc8280xp_data as fallback in the UBWC change.[Konrad]
>> - Add the DP controller driver change.
>> - Link to v5: https://lore.kernel.org/r/20250730-mdssdt_qcs8300-v5-0-bc8ea35bbed6@quicinc.com
>>
>> Changes in v5:Fixed review comments from Krzysztof, Dmitry.
>> - Rebase to next-20250717.
>> - Change DP compatible to qcs8300-dp due to add 4 streams support.
>> - Add QCS8300 UBWC config change due to rebase.
>> - Add 4 streams clk and phy in the mdss yaml.
>> - Link to v4: https://lore.kernel.org/r/20250120-mdssdt_qcs8300-v4-0-1687e7842125@quicinc.com
>>
>> Changes in v4:Fixed review comments from Krzysztof, Dmitry.
>> - Use the common style for the dt-bindings commits.[Dmitry]
>> - Update the commits msg for the mdss binding patch, explain why they
>>    reuse different platform drivers.[Krzysztof]
>> - Link to v3: https://lore.kernel.org/r/20250113-mdssdt_qcs8300-v3-0-6c8e93459600@quicinc.com
>>
>> Changes in v3:Fixed review comments from Krzysztof, Dmitry.
>> - Fix the missing space issue in commit message.[Krzysztof]
>> - Separate the patch for the phy from this series.[Dmitry]
>> - Remove unused dependencies and update in the cover letter.[Dmitry][Krzysztof]
>> - Link to v2: https://lore.kernel.org/r/20241226-mdssdt_qcs8300-v2-0-acba0db533ce@quicinc.com
>>
>> Changes in v2:Fixed review comments from Krzysztof, Dmitry, Rob.
>> - Decouple the devicetree changes from this series.[Dmitry][Krzysztof]
>> - Drop the dpu driver changes and reuse SA8775P DPU driver.[Dmitry]
>> - Fix compilation issues in MDSS bindings.[Rob][Krzysztof]
>> - Correct formatting errors and remove unnecessary status in MDSS
>>    bindings.[Krzysztof]
>> - Add the the necessary information in MDSS changes commit msg.[Dmitry]
>> - Rebase MDSS driver changes to https://lore.kernel.org/dri-devel/
>>    20241127-msm-mdss-ubwc-v3-0-9782a7c2b023@linaro.org/.[Dmitry]
>> - Package the DisplayPort controller and eDP PHY bindings document to
>>    this patch series.
>> - Collecting MDSS changes reviewd-by Dmitry.
>> - Reuse the sa8775p eDP PHY as a fallback compat.[Dmitry]
>> - Reuse the sm8650 DP controller as a fallback compat.[Dmitry]
>> - Link to v1: https://lore.kernel.org/r/20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com
>> ---
>> This series depend on 4 pixel streams dt-binding series:
>> https://lore.kernel.org/all/20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com/
>>
>> and separate eDP PHY binding:
>> https://lore.kernel.org/all/20250730072725.1433360-1-quic_yongmou@quicinc.com/
>>
>> ---
>> Yongxing Mou (6):
>>        dt-bindings: display/msm: Document the DPU for QCS8300
>>        dt-bindings: display/msm: dp-controller: document QCS8300 compatible
>>        dt-bindings: display/msm: Document MDSS on QCS8300
>>        soc: qcom: ubwc: Add QCS8300 UBWC cfg
>>        drm/msm: mdss: Add QCS8300 support
>>        drm/msm/dp: Add DisplayPort controller for QCS8300
>>
>>   .../bindings/display/msm/dp-controller.yaml        |  22 ++
>>   .../bindings/display/msm/qcom,qcs8300-mdss.yaml    | 286 +++++++++++++++++++++
>>   .../bindings/display/msm/qcom,sm8650-dpu.yaml      |  15 +-
>>   drivers/gpu/drm/msm/dp/dp_display.c                |   1 +
>>   drivers/gpu/drm/msm/msm_mdss.c                     |   1 +
>>   drivers/soc/qcom/ubwc_config.c                     |   1 +
>>   6 files changed, 321 insertions(+), 5 deletions(-)
>> ---
>> base-commit: 3ac864c2d9bb8608ee236e89bf561811613abfce
>> change-id: 20250818-qcs8300_mdss-a363f0d0ba0b
>> prerequisite-message-id: <20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com>
>> prerequisite-patch-id: ffeeb0739a4b3d310912f4bb6c0bd17802818879
>> prerequisite-patch-id: cdc3f4515ab23a8b2ce719bbdbcb56043803d03f
>> prerequisite-patch-id: 048b11765f49af4a728db1525fef1eb8ad48bf88
>> prerequisite-patch-id: f0f92109d1bfffa6a1142f2aaecbd72a29b858c0
>> prerequisite-patch-id: a8185cf3ddd85b9058691500b8dc0c57c8226e97
>> prerequisite-patch-id: a389a2e4eca44bf62bb2c861c96596368be7a021
>> prerequisite-patch-id: 09ec7f51de0a65c68c2c781750177017f32747ba
>> prerequisite-patch-id: f76ab0ae189df14acc851fa52f8f8e8faed9a505
>> prerequisite-patch-id: 983fc8a7bea459505c5b27db1a1ef7581936555c
>> prerequisite-message-id: <20250730072725.1433360-1-quic_yongmou@quicinc.com>
>> prerequisite-patch-id: 2ea89bba3c9c6ba37250ebd947c1d4acedc78a5d
>>
>> Best regards,
> 
> Hi, maintainers:
> sorry for the inconvenience caused. This series is missing patch 5 and patch 6 due to network issues. May I resend it? The missed two changes are identical to V10.

You can fix that manually by sending them both through

b4 send -o /tmp/
git send-email --in-reply-to=<cover letter msgid> /tmp/0005-xyz-abc.patch
git send-email --in-reply-to=<cover letter msgid> /tmp/0006-xyz-abc.patch

Konrad
