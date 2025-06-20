Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B930AE21E5
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 20:14:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0E8C10EBB6;
	Fri, 20 Jun 2025 18:14:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nbbZblG7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 711C410EBB1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 18:14:08 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KHGHnd020751
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 18:14:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9LhI2Xwe2pXBEvWnMtQOowUyXjOfB/3ScM2SDxNRahE=; b=nbbZblG7kIq7wyu3
 xw+eI9ITeOlHnddSN3xlHIuqi1GvqX9jIW2+o+5cVs3J6MAJTTzQSCP3spNtDM+s
 8mTI3L9kwB0HooUQ/wXwH6f/OgbGjOzmYbfhUw0Nq9YZK/uRV73+OpIHbj6OEgNK
 lyDG4rwz3I3HOEWBOyZYx+GsL/EwsJZZZLSp0SVuUOKDEAEypOZLVVooLySrRSDN
 /Jj4++tOh/OpKZ5CYGxosN3RTyxVURar7wyjs/t33Z9FZosk2MQvZZvejzlqIkXH
 gnxL705oMEaf3muEC16bjRqupwVtCS2waPuh6B6DUQMZd7a17XmHX7tUBajyS/cr
 8/dYfQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47dbvtr61b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 18:14:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7d38f565974so344113485a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 11:14:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750443247; x=1751048047;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9LhI2Xwe2pXBEvWnMtQOowUyXjOfB/3ScM2SDxNRahE=;
 b=PXcLgNtOVcEkLkFtSyiB4Doe+CijR0db+En0gzybLti1y+el7U+klm5bEMR8ngcSU4
 mW2aQyx6vI+JWyCqnYDaEW0Pnv39VMpmSKYwex6w947XE/rVYQJNUlK5tKhaNKdzvFwM
 a1tdQlk2dJc21oBIQZ5dWbQvkos7F/yMqBpT+25ueDqWinnRuxYGMBpJ2Tl61YWiHAHg
 yGNft5tYQ2QNMIVhCZqGgZqfE8/4h0FRIukOcu3cRXMXI4XbA/jRPNiXwVuwaP/j6qTt
 1GjhiaheNEDyI5EIPZ76MU7iEJntGWfpwUEXqAh8lIz9xurYKMc+VbTXzOsfTjZoWCc1
 /jxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyLNiJRBcATez0+zAlZMCOC64XoCY9TMWToVuvkHhhtZTUk7+8NcxQpnlktf5VlNtItog6o/CH+0s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQnMVBY7FQVz9sliraGpntO6ky+VHl21esjTq3sJw80LXhn6hU
 m9+rvSVGHsb774yQJzoKwLmbJG0HdbMIzZsZjSplEr0caQGD5KaY92en0ODjlNzZDq/UmzdD/je
 pcyKQpefIZNS/Kr9vOs40n5a23fcRMqSTRphULLhhafE4ZSTOTEf4kxjE/jwgkaabbUBnzxI=
X-Gm-Gg: ASbGncuGa4kkeyj6kjjsfu3IeHkm8svjZC8TyrbZcOfQ4guQr16iqPI3oa/N+KgPZOf
 5EI77nizIOu/e74XGSrf2rlqhKCPocGR9y45U1QnDCSB660oGxcAosetH/ldgmOIIQrXLNzgyJC
 KdnqSoJ+aLphRjA2tQiOZzJaoom58Fui1rIWOBSs1xJw3Lb5IfwuASbmg6mI1DEfu+xD03g3wrR
 /PUmSnwvFbMAcUboeTfXW5Lhj0mJU8iKcZXkxagUIMyAQ6NCz+vUFmIkHkGfzVyvHllTzxVclde
 mw6tLTg0xHXxsBrxI/AGoOxS6bnHx99H1G8OEhpElJacUxlIJxyPnnC+SmOz5mO5Xy2SBQgGSVf
 j2OnqBSA/62OpWMJMruAzWaIXw9bPPhB/KY8=
X-Received: by 2002:a05:620a:4115:b0:7d0:9a17:7b93 with SMTP id
 af79cd13be357-7d3fc06d5f4mr385720985a.25.1750443246640; 
 Fri, 20 Jun 2025 11:14:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGF8a5iG3F+DfIN05T64ynCvLmjJR9evM/gfCnKmC2l0p9LUB+rWiOYDNmodaY5O6qyN66eA==
X-Received: by 2002:a05:620a:4115:b0:7d0:9a17:7b93 with SMTP id
 af79cd13be357-7d3fc06d5f4mr385713285a.25.1750443245901; 
 Fri, 20 Jun 2025 11:14:05 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553e4144306sm363384e87.18.2025.06.20.11.14.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jun 2025 11:14:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
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
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Abel Vesa <abel.vesa@linaro.org>, Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v7 00/13] drm/msm: Add support for SM8750
Date: Fri, 20 Jun 2025 21:13:54 +0300
Message-Id: <175044313808.2014621.17398212116401078001.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250618-b4-sm8750-display-v7-0-a591c609743d@linaro.org>
References: <20250618-b4-sm8750-display-v7-0-a591c609743d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: yv9eR4F8ZvEhMdYAPhDhDEmr2BcVfOUN
X-Authority-Analysis: v=2.4 cv=NZHm13D4 c=1 sm=1 tr=0 ts=6855a4ef cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=e5mUnYsNAAAA:8 a=edIzf9TL5m76aqoGtVoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: yv9eR4F8ZvEhMdYAPhDhDEmr2BcVfOUN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEyNyBTYWx0ZWRfX38Slh+7b9gc/
 tURW8JSZ+RfGkOMRms31Di/9GS/jXBGRJH/liEmBegM5VkMzTVI+ehr4tk34TGF/YB9g1DOC6aD
 eX/60Vs1CtJ4vJiV4XoBpW6vsvvyH+Oc5t56Os7+qNvFCALDawzme3IQZB2DTYyuuH+/NobFAJP
 2aunk0D91BPLZA1BcKXP3is7KZvWgwjc9JEjDolhvsI81RHoHDSJeNlHdXLQT6FfhnNYJDgJLGe
 psxVAvhAoil35W5VOlMnz4X5dHB5HJyDGsvGUHc7neTpK6TBO8FwFUmh+P972SAUozP4dXSlIOW
 4w+5C8Gv1TL81mej3tzMGfSbqhm3KlN7lkILc/X73pLYmFAXLIVVPOotdK6rua2XOckJ5NXV2jX
 C9xBhdK3fkTWwTwYkT8OFT83Vl9txWqHM9OWBHkw0T3u1KiaImwq+5poyXfBpJtl9AnqCN4u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_07,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200127
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


On Wed, 18 Jun 2025 16:32:29 +0200, Krzysztof Kozlowski wrote:
> Dependency / Rabased on top of
> ==============================
> https://lore.kernel.org/r/20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com/
> 
> Changes in v7:
> =============
> - Add ack/rb tags
> - Drop unrelated DSI enablement as requested by Dmitry:
>   https://lore.kernel.org/all/fa8d4af9-e822-4dec-a8dc-f3bbf5dd0100@oss.qualcomm.com/
>   These will be sent in separate patchset.
>   Such split allows to have SM8750 patchset fully reviewed, without
>   continuous requests of doing some more fixes in DSI PHY drivers
>   (related and unrelated like 10nm).
> - Link to v6: https://lore.kernel.org/r/20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org
> 
> [...]

Applied, thanks!

[01/13] dt-bindings: display/msm: dsi-phy-7nm: Add SM8750
        https://gitlab.freedesktop.org/lumag/msm/-/commit/f8976415b669
[02/13] dt-bindings: display/msm: dsi-controller-main: Add SM8750
        https://gitlab.freedesktop.org/lumag/msm/-/commit/65e6647eda4f
[03/13] dt-bindings: display/msm: dp-controller: Add SM8750
        https://gitlab.freedesktop.org/lumag/msm/-/commit/0122acd798ba
[04/13] dt-bindings: display/msm: qcom,sm8650-dpu: Add SM8750
        https://gitlab.freedesktop.org/lumag/msm/-/commit/12c9c014f83b
[05/13] dt-bindings: display/msm: qcom,sm8750-mdss: Add SM8750
        https://gitlab.freedesktop.org/lumag/msm/-/commit/ea982597d19e
[06/13] drm/msm/dsi/phy: Add support for SM8750
        https://gitlab.freedesktop.org/lumag/msm/-/commit/714495a41634
[07/13] drm/msm/dsi: Add support for SM8750
        https://gitlab.freedesktop.org/lumag/msm/-/commit/f4b6ecb62b7f
[08/13] drm/msm/dpu: Add support for SM8750
        https://gitlab.freedesktop.org/lumag/msm/-/commit/9eff92a3ed18
[09/13] drm/msm/dpu: Consistently use u32 instead of uint32_t
        https://gitlab.freedesktop.org/lumag/msm/-/commit/f409019fb4e7
[10/13] drm/msm/dpu: Implement 10-bit color alpha for v12.0 DPU
        https://gitlab.freedesktop.org/lumag/msm/-/commit/dd968c6e3e85
[11/13] drm/msm/dpu: Implement CTL_PIPE_ACTIVE for v12.0 DPU
        https://gitlab.freedesktop.org/lumag/msm/-/commit/82f64dae7f0d
[12/13] drm/msm/dpu: Implement LM crossbar for v12.0 DPU
        https://gitlab.freedesktop.org/lumag/msm/-/commit/d96d8ba9a96b
[13/13] drm/msm/mdss: Add support for SM8750
        https://gitlab.freedesktop.org/lumag/msm/-/commit/0b385dc8d1b2

Best regards,
-- 
With best wishes
Dmitry

