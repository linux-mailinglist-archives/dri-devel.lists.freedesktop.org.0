Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD36B44C83
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 05:56:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B4C910EB14;
	Fri,  5 Sep 2025 03:56:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BjPWPrKH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A6D010E2B2
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 03:56:06 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584IIvfr007622
 for <dri-devel@lists.freedesktop.org>; Fri, 5 Sep 2025 03:56:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 t4U00jwPam/6fp+vB6GN6T1ZOYywfy88ibIe8PM3Pls=; b=BjPWPrKHNdQvvz9l
 nRL1EnBxmFRKejkyw5QKgATkqRSd8qLzreZAqeRTPquaVXtr5BfYdE7H7cotDivg
 rh8Hot41txmFO1PEEmi8iR34CUqg+8oU2t+b6qAwXvSIYAC6GESS7lmxLjIIJUU2
 OQmJ0sACUuqhXDCSc/KzRGdprupmVUtEUXqBOZLaaRTnOSbRRYs4kK+1V4dqn7NT
 EQ1fCy070D5B5Eg77w9MoSj/u+Ibknd8OuJArvaudI1tlEP/ebUg1HRTjyf2ZqBI
 cqse8rt5SPKH8iZybL+A1bh6w47HCplFzgXTh5xQi/XlK5Bcia9LTr5wItWgITzU
 h9AKKg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura91mja-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Sep 2025 03:56:05 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-7725a76dcb4so2029484b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 20:56:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757044563; x=1757649363;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t4U00jwPam/6fp+vB6GN6T1ZOYywfy88ibIe8PM3Pls=;
 b=lDfONp+X8fp6c1OQvsL3KrUctTnfHoMZVhbTS4mW6gP7/iTkiPUXyaEQjREsMQ1q0S
 HB8O1dpWKWL2lTi88lq5irzzl66eOYrpEWSi/sczEcCaXj2P4R3ksYBBddlGHEQxr5k/
 UWBXqGQyixYS0TwjqXwlnjg/l50bvpNNndGx8ijN7jJnOIDUOW+uAAdV8nrYy0M2msqo
 x5PCiUTEXqLsGiNuapo2oQYReadqSmSYuOLDXOKjj9LioTjiYugUx5c6218NN/Rrrkr3
 kh+dda8huqaKh7A9/m/sHJn8pfaAf2K2MZxMsYKtRNfpAz3bYUjY6+iBZc83czh6+1jK
 8/bA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4GnzCe4pqCxVQHKb3cicVAebesUaOo581kST147efaXv+Vga54KKtGxiMo8gtKCrp2xEk6Wi0/qk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6JUXkKRGzBEshIZJAKGyGyOFc0ql79MpfyXRcf6MelbWBUF3N
 WTCeE3PJ3iAzSp7ZdLoLctWyRyD19APIsIV5PzWYpxFnL0KG4t/sqWiXm13ydKnpvtWenEfsyr1
 GEHonYXr/lwxEeYOslE8rw2TDBJ22Zftmmv01749DdsXDlct/CX2A1SQ1PfN8M2dE5NlD5zU=
X-Gm-Gg: ASbGncvGn3yajL0AkYbcdvcj9ZQi1ZaIzQDN+ChmnO7tO/i9TbjC+JjPaom0/778NfR
 GEjeGeym+ttvsfqA84xmQ2Lz7scsuW8tho0qjXjhCTUgEcNP9f41/MRZx9o8mB1mwnOl6lmmElW
 SFwxcw+ZZRkgWdPIsLRg85FVBkqs8D/TLUzN8JFYUc/dX/iqWY1iNvRcBMq6ss4FL3xnCJtKDtk
 zsU6gs2bJK4TB0mmUXlVKv+2v21kdpEhXVeFAZcs09IIPTPEtBoF0k0IIRaSLFfoWupHu7X9Z9Q
 J7bKi21PiD2goPJ0PFauPpO1nlbGR0S35HLXFA3d+m34UVrBVY3L79AGvlOP40m+xVtYxzmZBWJ
 Do4mljgkdYe8iC/Pw46XBV/2mLCReIw==
X-Received: by 2002:a05:6a20:1611:b0:246:5be:ca90 with SMTP id
 adf61e73a8af0-24e7e83cc89mr2634192637.10.1757044562461; 
 Thu, 04 Sep 2025 20:56:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqP3WckW3fa7ibrVA31oor3NOjH0qAdC4pvGViB84QmxNjn0RVQ5IS9R/kwsuVr8+x6wnSTA==
X-Received: by 2002:a05:6a20:1611:b0:246:5be:ca90 with SMTP id
 adf61e73a8af0-24e7e83cc89mr2634157637.10.1757044561910; 
 Thu, 04 Sep 2025 20:56:01 -0700 (PDT)
Received: from [10.133.33.41] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4d96829a66sm16860662a12.6.2025.09.04.20.55.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Sep 2025 20:56:01 -0700 (PDT)
Message-ID: <2b986468-59b3-4586-9d4c-3ec34dc36c2c@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 11:55:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 0/6] Display enablement changes for Qualcomm QCS8300
 platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250904-qcs8300_mdss-v11-0-bc8761964d76@oss.qualcomm.com>
 <5bc0203c-21a1-4948-96ff-8eae844bfb93@oss.qualcomm.com>
 <d2940186-7baf-41d3-80dd-fbc860ac5acb@oss.qualcomm.com>
 <f3aa35bb-5ac7-4fe3-904e-2dd97b9c034a@oss.qualcomm.com>
 <fgzptkddxhgqpsylthgo4a465jwypcu2oxo6woeihyukpn3zqd@hitdv3ujjhvc>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <fgzptkddxhgqpsylthgo4a465jwypcu2oxo6woeihyukpn3zqd@hitdv3ujjhvc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: KG_WLOuuitQ_NijcomrMzAj-73OEjkU7
X-Proofpoint-GUID: KG_WLOuuitQ_NijcomrMzAj-73OEjkU7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfX3YJO3oW/73sz
 OY1z9AWkJwBmWYYKxNeArkfJtsRMEhD+xqx5boQuAdrwL5Ls4T3BkvsnNilUrzqDat4adKpO7VV
 4UbYzxegoCEp4vhpr3ITmB8SRCXk4dJY7bjsYqdCX5iLc6KN2eovmua+rEn+QyZMY5aeKRYYeo2
 LrNgaMtSPJ68Wi+PO62LueYKc0JMw2HqsvdvuyhsRlVTjrbKPrkA33I7cGuDGUfaYpl8avHhGBn
 nPsY1YIp88SgEX8WXnv3bITHnEyBUmbLZOVpLj2hDvNiVgvW0mEoZOUe0hc5goKyq0ofKhZfHto
 K5yuS3ab9QEpwoHgBR9QJaijRN4mMa95U0fLjamaSuQEqb0GYf7PwqmduM29kym3CRQIVZa2oDn
 BkBSPCQt
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68ba5f55 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=1XWaLZrsAAAA:8 a=KKAkSRfTAAAA:8 a=_0dYuvDVJydFRCGzEJUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_01,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020
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



On 9/4/2025 9:41 PM, Dmitry Baryshkov wrote:
> On Thu, Sep 04, 2025 at 05:31:01PM +0800, Yongxing Mou wrote:
>>
>>
>> On 9/4/2025 4:21 PM, Konrad Dybcio wrote:
>>> On 9/4/25 9:55 AM, Yongxing Mou wrote:
>>>>
>>>>
>>>> On 9/4/2025 3:22 PM, Yongxing Mou wrote:
>>>>> This series introduces support to enable the Mobile Display Subsystem (MDSS)
>>>>> , Display Processing Unit (DPU), DisplayPort controller for the Qualcomm
>>>>> QCS8300 target. It includes the addition of the hardware catalog, compatible
>>>>> string, and their YAML bindings.
>>>>>
>>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>>> ---
>>>>> Changes in v11: Fixed review comments from Dmitry.
>>>>> - Rebase to MST bindings V8.
>>>>> - Update the clocks-name for QCS8300 in dp-controller.
>>>>> - Link to v10: https://lore.kernel.org/r/20250901-qcs8300_mdss-v10-0-87cab7e48479@oss.qualcomm.com
>>>>>
>>>>> Changes in v10:
>>>>> - Rebase to MST bindings V7.
>>>>> - Update the P2/P3/MST2LINK/MST3LINK regions in MDSS yaml.
>>>>> - Link to v9: https://lore.kernel.org/r/20250825-qcs8300_mdss-v9-0-ebda1de80ca0@oss.qualcomm.com
>>>>>
>>>>> Changes in v9: Fixed review comments from Dmitry.
>>>>> - Updated the description of dp-controller DT binding.
>>>>> - Add new clause only work for QCS8300(one DP controller with 4 streams).
>>>>> - Link to v8: https://lore.kernel.org/r/20250821-qcs8300_mdss-v8-0-e9be853938f9@oss.qualcomm.com
>>>>>
>>>>> Changes in v8: Fixed review comments from Krzysztof, Dmitry.
>>>>> - Fixed incorrect description for dp-controller in driver/dt-binding.[Krzysztof][Dmitry]
>>>>> - Fixed incorrect description for ubwc change.[Dmitry]
>>>>> - Link to v7: https://lore.kernel.org/r/20250819-qcs8300_mdss-v7-0-49775ef134f4@oss.qualcomm.com
>>>>>
>>>>> Changes in v7: Fixed review comments from Dmitry.
>>>>> - Rebase to next-20250818 and 4 pixel stream series V6.
>>>>> - Add more description for the dp-controller dt-bingding change.[Dmitry]
>>>>> - Reorder the MDSS change and UBWC change.[Dmitry]
>>>>> - Switch to the OSS email.
>>>>> - Link to v6: https://lore.kernel.org/r/20250806-mdssdt_qcs8300-v6-0-dbc17a8b86af@quicinc.com
>>>>>
>>>>> Changes in v6: Fixed review comments from Konrad, Dmitry.
>>>>> - Rewrite commit msg in dp-controller dt-binding change.[Dmitry]
>>>>> - Optimize the description in MDSS dt-binding.[Dmitry]
>>>>> - Pass the sc8280xp_data as fallback in the UBWC change.[Konrad]
>>>>> - Add the DP controller driver change.
>>>>> - Link to v5: https://lore.kernel.org/r/20250730-mdssdt_qcs8300-v5-0-bc8ea35bbed6@quicinc.com
>>>>>
>>>>> Changes in v5:Fixed review comments from Krzysztof, Dmitry.
>>>>> - Rebase to next-20250717.
>>>>> - Change DP compatible to qcs8300-dp due to add 4 streams support.
>>>>> - Add QCS8300 UBWC config change due to rebase.
>>>>> - Add 4 streams clk and phy in the mdss yaml.
>>>>> - Link to v4: https://lore.kernel.org/r/20250120-mdssdt_qcs8300-v4-0-1687e7842125@quicinc.com
>>>>>
>>>>> Changes in v4:Fixed review comments from Krzysztof, Dmitry.
>>>>> - Use the common style for the dt-bindings commits.[Dmitry]
>>>>> - Update the commits msg for the mdss binding patch, explain why they
>>>>>      reuse different platform drivers.[Krzysztof]
>>>>> - Link to v3: https://lore.kernel.org/r/20250113-mdssdt_qcs8300-v3-0-6c8e93459600@quicinc.com
>>>>>
>>>>> Changes in v3:Fixed review comments from Krzysztof, Dmitry.
>>>>> - Fix the missing space issue in commit message.[Krzysztof]
>>>>> - Separate the patch for the phy from this series.[Dmitry]
>>>>> - Remove unused dependencies and update in the cover letter.[Dmitry][Krzysztof]
>>>>> - Link to v2: https://lore.kernel.org/r/20241226-mdssdt_qcs8300-v2-0-acba0db533ce@quicinc.com
>>>>>
>>>>> Changes in v2:Fixed review comments from Krzysztof, Dmitry, Rob.
>>>>> - Decouple the devicetree changes from this series.[Dmitry][Krzysztof]
>>>>> - Drop the dpu driver changes and reuse SA8775P DPU driver.[Dmitry]
>>>>> - Fix compilation issues in MDSS bindings.[Rob][Krzysztof]
>>>>> - Correct formatting errors and remove unnecessary status in MDSS
>>>>>      bindings.[Krzysztof]
>>>>> - Add the the necessary information in MDSS changes commit msg.[Dmitry]
>>>>> - Rebase MDSS driver changes to https://lore.kernel.org/dri-devel/
>>>>>      20241127-msm-mdss-ubwc-v3-0-9782a7c2b023@linaro.org/.[Dmitry]
>>>>> - Package the DisplayPort controller and eDP PHY bindings document to
>>>>>      this patch series.
>>>>> - Collecting MDSS changes reviewd-by Dmitry.
>>>>> - Reuse the sa8775p eDP PHY as a fallback compat.[Dmitry]
>>>>> - Reuse the sm8650 DP controller as a fallback compat.[Dmitry]
>>>>> - Link to v1: https://lore.kernel.org/r/20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com
>>>>> ---
>>>>> This series depend on 4 pixel streams dt-binding series:
>>>>> https://lore.kernel.org/all/20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com/
>>>>>
>>>>> and separate eDP PHY binding:
>>>>> https://lore.kernel.org/all/20250730072725.1433360-1-quic_yongmou@quicinc.com/
>>>>>
>>>>> ---
>>>>> Yongxing Mou (6):
>>>>>          dt-bindings: display/msm: Document the DPU for QCS8300
>>>>>          dt-bindings: display/msm: dp-controller: document QCS8300 compatible
>>>>>          dt-bindings: display/msm: Document MDSS on QCS8300
>>>>>          soc: qcom: ubwc: Add QCS8300 UBWC cfg
>>>>>          drm/msm: mdss: Add QCS8300 support
>>>>>          drm/msm/dp: Add DisplayPort controller for QCS8300
>>>>>
>>>>>     .../bindings/display/msm/dp-controller.yaml        |  22 ++
>>>>>     .../bindings/display/msm/qcom,qcs8300-mdss.yaml    | 286 +++++++++++++++++++++
>>>>>     .../bindings/display/msm/qcom,sm8650-dpu.yaml      |  15 +-
>>>>>     drivers/gpu/drm/msm/dp/dp_display.c                |   1 +
>>>>>     drivers/gpu/drm/msm/msm_mdss.c                     |   1 +
>>>>>     drivers/soc/qcom/ubwc_config.c                     |   1 +
>>>>>     6 files changed, 321 insertions(+), 5 deletions(-)
>>>>> ---
>>>>> base-commit: 3ac864c2d9bb8608ee236e89bf561811613abfce
>>>>> change-id: 20250818-qcs8300_mdss-a363f0d0ba0b
>>>>> prerequisite-message-id: <20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com>
>>>>> prerequisite-patch-id: ffeeb0739a4b3d310912f4bb6c0bd17802818879
>>>>> prerequisite-patch-id: cdc3f4515ab23a8b2ce719bbdbcb56043803d03f
>>>>> prerequisite-patch-id: 048b11765f49af4a728db1525fef1eb8ad48bf88
>>>>> prerequisite-patch-id: f0f92109d1bfffa6a1142f2aaecbd72a29b858c0
>>>>> prerequisite-patch-id: a8185cf3ddd85b9058691500b8dc0c57c8226e97
>>>>> prerequisite-patch-id: a389a2e4eca44bf62bb2c861c96596368be7a021
>>>>> prerequisite-patch-id: 09ec7f51de0a65c68c2c781750177017f32747ba
>>>>> prerequisite-patch-id: f76ab0ae189df14acc851fa52f8f8e8faed9a505
>>>>> prerequisite-patch-id: 983fc8a7bea459505c5b27db1a1ef7581936555c
>>>>> prerequisite-message-id: <20250730072725.1433360-1-quic_yongmou@quicinc.com>
>>>>> prerequisite-patch-id: 2ea89bba3c9c6ba37250ebd947c1d4acedc78a5d
>>>>>
>>>>> Best regards,
>>>>
>>>> Hi, maintainers:
>>>> sorry for the inconvenience caused. This series is missing patch 5 and patch 6 due to network issues. May I resend it? The missed two changes are identical to V10.
>>>
>>> You can fix that manually by sending them both through
>>>
>>> b4 send -o /tmp/
>>> git send-email --in-reply-to=<cover letter msgid> /tmp/0005-xyz-abc.patch
>>> git send-email --in-reply-to=<cover letter msgid> /tmp/0006-xyz-abc.patch
>>>
>>> Konrad
>> Thanks for guide, when i use cmd  "git send-email
>> --in-reply-to="20250904-qcs8300_mdss-v11-0-bc8761964d76@oss.qualcomm.com"
>> ~/tmpyongmou/0005-drm-msm-mdss-add-qcs8300-support.eml", seems something
>> wrong, error log:
>> mou@oss.qualcomm.com>,  Dmitry Baryshkov
>> <dmitry.baryshkov@oss.qualcomm.com>'
>> (body) Adding cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> from
>> line 'Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>'
>> 5.1.3 The recipient address <y> is not a valid RFC 5321 address. For more
>> 5.1.3 information, go to
>> 5.1.3  https://support.google.com/a/answer/3221692 and review RFC 5321
>> 5.1.3 specifications. d9443c01a7336-24b1ba1718bsm64512315ad.39 - gsmtpWould
>> you mind sharing some suggestions for this? Thanks~~
> 
> When `git send-email` asks you, just press 'Enter', no extra chars. Or
> it migth be easier to just `b4 send --resend`.
> 
Thanks for the guidance — that was the mistake I made. It has now been 
sent upstream. It looks like the patch wasn't archived into the V11 
series. So does this ok?
