Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C43B3E2F8
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 14:33:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0CA310E443;
	Mon,  1 Sep 2025 12:33:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TR+ed2qp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD9FC10E443
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 12:33:05 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 581B4DFY028840
 for <dri-devel@lists.freedesktop.org>; Mon, 1 Sep 2025 12:33:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EB7F4mbxiHQX5qGhCQQlDNKpKVWf7VS3kp1B8SPd9Do=; b=TR+ed2qpL1UMcFGf
 c2LYRYswDisk5QfEcmEK8cdrYfIWWWnqNxjAjNGDTHk2kw4pT99AHy2DJpoyH0zw
 0wRIyxAyqebxwYZP5J6xOqCGBAU5sQe6XjgfyDZv4LHM5r6H5gOUN3Fs+LiCc1NC
 FENrX9MDHrVpkemQsZ5dnuNfj5zxS0L00bIg7tU7wsOYDMkwZhbfUahPg9yJrbPM
 uWu2ViZyYUenjHCGXUmIX+Vm1QNDdztFLAUkWDcnuB0V4Z+zg7EUBn0vIb+n1Jr7
 Y+xfLEUpNK6ExbYNoSmtjR/INenarXJg/cDuhRDrVwXKSSXEtWryBytQbVNlkW1G
 dTusaw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjcssw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 12:33:04 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2493b48a268so8629925ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 05:33:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756729983; x=1757334783;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=EB7F4mbxiHQX5qGhCQQlDNKpKVWf7VS3kp1B8SPd9Do=;
 b=VpTDOiTwXL+Qjt80hNEjdgN12qbm0RJ7aJ/2K+Yd++IGQRdVQiuN74hWojyE6n2IcX
 WDCaXjrnOFe7gk7a+UX9oJnJ6wd8y3w2UYP1sinYTaLxh7z4ds3+8tFP6XApcWT00xom
 TaMwzBZifvpeXxMxoEjvDU265IWHBegrpwtB4jWB4zR831kdofxjxSJ2S8Pwn03zOaBA
 7lgNYtyjbasLTwy8Q2z5qEqhb+i+CmUVS8lz1Ph5t5TMjApET3/eMdVlv9WtTyyYuzMW
 MRSCvc6qUOl/w8bQbl/cMOzonqwqpdHu8YWPYH/XyjwuHY0cvwgBKcC/qG5X9n1Ebsle
 pWXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhizfmqHovU7gOeEBybt2VAyJto1Xdjf3Qp+D3MDDzBlaZhsgMeAW92/h3rPZOgiBY8Az/CYU4EPc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzwz2V0DhlN/zebZH8VZ6NY8BVgNohPyDTGExtXPbRqJZbKlv9G
 aRpO0/s+tnlOK7NkrY1OvLTDnuZmI31ZCzSh7cgLo0o2keyKNFg1eFd4E2yWeYaMNRC4vWfmk+M
 cmUO3EUBKWoDl8gg1DLPQLROTfcfyMx24aKFHk0BqFWyv83idqF3cVN5Y6EpXrKz0lY9eUcs=
X-Gm-Gg: ASbGnctD6GqaOPZeuq4vbWcSfT620AaDdhFBocgH5BsaPZBp1T3I2ZGYI0DrjPiqEhE
 6BiRml7Lk6dgETs/mMpyOKjdWWT8pvs4Ajk4uHE/hPYeIDpAuzWjDHAn+EmS1NfyjaIVNuFaGpm
 lUkHCNCrXfhhE3nROp22vrBqCWQYtdwXePDLA9oAknBk7goyLnl9w/hYH5f4fBQk0F2e6PC5J+8
 M9EIwLfvxfIhLwHyLIqQcdFaWJdzFtTBtiYthbgyCkJJ1hZ4Mt+Gg09wWNXrsOyT9Vja0hwzN27
 RerhQHkzO59NVCbvO353/cHkQQqjRjKVRNs5L3leU9FUOf7VsdKs3bWL03RxmRhoDHkChDYHXlv
 NLIMoM+KOoN6m8OhJswExxBqOl8j24g==
X-Received: by 2002:a17:902:ea0e:b0:246:a152:2afc with SMTP id
 d9443c01a7336-2490f6e2a41mr89139205ad.3.1756729983481; 
 Mon, 01 Sep 2025 05:33:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvdBSg+GSkVZYutloMzMAPl9JCliwrB8npGb8PaTRixqyTmb5uK1ODr7IHrQZgoOD9FV9l1A==
X-Received: by 2002:a17:902:ea0e:b0:246:a152:2afc with SMTP id
 d9443c01a7336-2490f6e2a41mr89138865ad.3.1756729982941; 
 Mon, 01 Sep 2025 05:33:02 -0700 (PDT)
Received: from [10.133.33.251] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-249066e1158sm104253735ad.144.2025.09.01.05.32.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 05:33:02 -0700 (PDT)
Message-ID: <75f8789d-9d97-49d9-97b0-908a5692c325@oss.qualcomm.com>
Date: Mon, 1 Sep 2025 20:32:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/14] dt-bindings: display/msm: dp-controller: Add
 sm6150
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, quic_lliu6@quicinc.com
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-1-a43bd25ec39c@oss.qualcomm.com>
 <75ra2ofecqu6tid6kr4hnyuztpl6jjaq2ksyquafyajhq2sa4d@4tkggrdqky7y>
 <8918feef-219e-4e69-8901-367189f5066d@oss.qualcomm.com>
 <28b33851-24eb-428f-b046-b145342fd982@oss.qualcomm.com>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <28b33851-24eb-428f-b046-b145342fd982@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b59280 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=ZffzQ4fVxSrCOw2gOQ0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: oBYeBzHGqF_oWl2SV8Ae-DeCwYvZjo9Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX12c8uqjWllVd
 nbML3qoD1vAKf9Fd48oOyES/SUOZqUsNBQAZ9RYZ/Qu5zfxhFqluF4XzvmS/rnBJDayvXpeRURg
 oU8/jj9KFWe/t7J/Ahvq+zaVQ5oU05U5aBlgHGoI+VqOwlib2SJqszLANTATp4m8x84/F3cYz3U
 9IO/dtFzyOLAVTJuVwLHYG16gyH1zP6vlFR+3jsvrRnrgIyCcXwN98Bta5rB6KwiQqCT9R5h1fU
 m+Dbxk/Z/uYXKYwp73KhTFXvEeVkySFG3n3UJMeuyriePwwwPKxYG0r1ePDNRu2jaPphItXSwfP
 vnRhsEzX+4mjYHyVD87v/h3Usyl7VX6XsYoMNIBPmr1UW+Rqhx7SAhJzNo6mxpiDDR4Z86VrsAQ
 uj0LYJoJ
X-Proofpoint-ORIG-GUID: oBYeBzHGqF_oWl2SV8Ae-DeCwYvZjo9Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024
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


On 8/28/2025 7:05 PM, Dmitry Baryshkov wrote:
> On 28/08/2025 07:51, Xiangxu Yin wrote:
>>
>> On 8/20/2025 6:18 PM, Dmitry Baryshkov wrote:
>>> On Wed, Aug 20, 2025 at 05:34:43PM +0800, Xiangxu Yin wrote:
>>>> Add DisplayPort controller for Qualcomm SM6150 SoC.
>>>> While SM6150 currently shares the same configuration as SC7180,
>>>> its hardware capabilities differ. Explicitly listing it ensures clarity
>>>> and avoids potential issues if SC7180 support evolves in the future.
>>> I assume, it has no MST support. Am I right?
>>
>>
>>  From sm6150 ipcat, I found MST-related registers and pixel1 clk definition.
>
> Then please describe MST as the main difference between SM6150 and SC7180 (which doesn't have MST).
>
> Also this needs to be rebased on top of the MST bindings. I've picked up the latest posted revision, but basing on the on-list discussion I might need to drop it and post another iteration. 
>

Would you prefer I keep the current patch and update the description of the
MST capability difference with SC7180 in the commit message, or rebase on
your series and update the dt-binding accordingly?
https://lore.kernel.org/all/20250829-dp_mst_bindings-v7-0-2b268a43917b@oss.qualcomm.com

Since MST support is not yet mainlined in the DP driver, even if I rebase
now, the final implementation may require redefining msm_dp_desc for
SM6150 in both the dt-binding and the driver once MST lands.


>>
>> According to the hardware spec, MST is supported, but due to limitations in clock and pipe resources,
>>
>> the maximum concurrency capability is restricted to 1920x1200@60 + 1280x720@60.
>>
>>
>>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>>> ---
>>>>   Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
>>>>   1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>> index 9923b065323bbab99de5079b674a0317f3074373..996d0132e084d401db85014a1a4e445d00d62ed8 100644
>>>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>> @@ -27,6 +27,7 @@ properties:
>>>>             - qcom,sc8280xp-dp
>>>>             - qcom,sc8280xp-edp
>>>>             - qcom,sdm845-dp
>>>> +          - qcom,sm6150-dp
>>>>             - qcom,sm8350-dp
>>>>             - qcom,sm8650-dp
>>>>         - items:
>>>>
>>>> -- 
>>>> 2.34.1
>>>>
>
>
