Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A935DB8F7F1
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 10:26:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6494910E181;
	Mon, 22 Sep 2025 08:26:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gBPOekuy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA30D10E181
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 08:26:52 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58LKp35L027441
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 08:26:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5eooA/d0wFv524HBbqhcxXG4N6t67PHtqPoAMp99CLM=; b=gBPOekuy/TAuLDuw
 fYHLEtqZoWeB+TuYqIynVldqPB4Chu8KEJrz1Y/nSNhuA6KVMrMWQ2WMMALQHrWG
 tod986QwqjjTGkCzy0fa+kxiXGBnjh8DweQfKaRl66G52sKinHv7tfu7RC2y5Rqz
 gp6hEqCM7QaZyXb+OaihpmJz8RupD7umBfduqMvKLonFBpPYC6XyaGR0eyctEYub
 0qiIPjB7Qz/4lElNdcKVUsRRTbJ4YZHTvQKU+nhID+XzLCuz0eGaS9049JtfUR7s
 4xFFQALX11PAjG9og+4qFjMu9eeDSQeDgJcyXmVmopS+uQHJvYZ1MkSwtYczbRyu
 sXMxHA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499mg33x21-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 08:26:52 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-244582e9d17so14494165ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 01:26:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758529611; x=1759134411;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5eooA/d0wFv524HBbqhcxXG4N6t67PHtqPoAMp99CLM=;
 b=wSKi/Ru0k53tymVaS1uTbKXtN6SkJxC8fyCdc/HZkOC49zCMfR5SS6XbhhuLIh2coA
 q5ZFuePJGTqWcebBj9e4kX+FuHlbzREVblJkG60m+ksREaS9uoVBRVJGlA/nYxhr4kJr
 6rypUYVGnsb4tR0bn/ShExt3TB4p+Tq3yXTAuocQekfx0TsOJ/xmeOXOdb0MzeJpUeBN
 aQqf75x1PYRz0JJJukoArE6wSi5Ot69siB3FCPnIJqzNbJw5ENswqHW4cFiXzleRZHUI
 MhPqvizD8VQNIypDQoKvnfsawulehay4YDtUOQeAA4XVOy/tk1Bwh91F4fxfSFBRNuj3
 w6yA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMwQ95HCf1f9EodQgM5wz/NoDca9vh1mRhceMaSu60LzlDfH+wkZOa39srcgIqqWrlhwGvbZXvjCU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwO9XTuuXSTN16Q2HVCb1ogP7967YQLNP3Zme7YUat3c/1s99YF
 JdXjAMnCysK4Z/of/eQd0BG25JfgHL5yRN8FuP7B213oIghWQxlBfvnrQJHWpkmixwhm0BkQlf6
 0v8FAom2RYekf9N8kmfo40HvcimuOPJwG20he6QcTC0jj52XE027fC1YlOdyvhsR+5r0+Ety1iL
 o48Og=
X-Gm-Gg: ASbGnctxXiBqKm/ctesxYhes+ggwjGwU1Hvw+NrU8Qi95XkOSkQmbvsOqZq7bAqexSx
 HlTU4mPwfMxTZwEdwSVf4DFx1SW5oUeaT9/JgWqZuWMkgN/X/lpIJg9nekp2ZudC2/4QkoFTM/J
 9xkJAxbXp93ibJXctgMjWIGrKVK3NeqFya9IAq0dn71ox33obRbutQtqDVvHeW8Mp4/fbd4H1yG
 FqZTpaRL5wybIa0GbykB5fsgWPrq5fRb6VOANdyBDOHQ9RPhvjQzlNi3adMzxbXtfP2I1JHxvXP
 4QOrPLYnnsV6TrT45zhtK+LEyDsFR51b+ChjK8IK6GbCMu+jTimgddkFsXFeGBVb2W8JNkKEe/f
 tnkvssjO9swbLPQj0TOhQ1tj94Ige8hHdJQ==
X-Received: by 2002:a17:902:f706:b0:276:624c:6cb with SMTP id
 d9443c01a7336-276624c084cmr28410375ad.2.1758529611166; 
 Mon, 22 Sep 2025 01:26:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMC8JhklyE4iNEbU5+yB9CJsS1vFjF44g3zzVBlwELKRKjUfowiE8AinFLeQimo+OvsblUHg==
X-Received: by 2002:a17:902:f706:b0:276:624c:6cb with SMTP id
 d9443c01a7336-276624c084cmr28410225ad.2.1758529610654; 
 Mon, 22 Sep 2025 01:26:50 -0700 (PDT)
Received: from [10.133.33.87] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-26980053078sm125956445ad.10.2025.09.22.01.26.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Sep 2025 01:26:50 -0700 (PDT)
Message-ID: <d09b2b45-3ca9-4808-8ff1-72b98d6fed2e@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 16:26:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/14] phy: qcom: qmp-usbc: Add USB/DP switchable PHY
 clk register
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-6-eae6681f4002@oss.qualcomm.com>
 <xtosrpz6rzdvtmpyq73gboeckl3c2x23iqehlxzbaszqmzugjd@ixhj25qujqxo>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <xtosrpz6rzdvtmpyq73gboeckl3c2x23iqehlxzbaszqmzugjd@ixhj25qujqxo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzMiBTYWx0ZWRfX5eibo09SHzNf
 nJdw78iICsj1k5trG6N+GB8sbPydw6wFPWIfZrtnKLSsAaTWqhIf5USGSOCxIU+XDu6+eAMUXC/
 BCnMaVddvNP8bLEsQNZWSTDiQX96U/5CIpYA+xrylgV5uMKurzvFU/QA9WMpQ/VzDi+2kG1wfCN
 Ez6oqm7gZeRLLSC1yaq524HSkWggYS55t6K54S6Usl+W+kC51uGS3XjZwXcNFXc7jQo0Tgustr5
 Ox70ccElV2uui5tnfW0/GsFUHp34ZlHbQijwLt7gZiasSSmWPdBISKozm9m6cyF9AaYCfv8FFC8
 sJ1HLzCZ0ijP7wgm8UFJkPwiBdPgzVB5mPLiLvpFSurHG+X9ymCMhBSflXKz+w8n+TaD8XQC26p
 E/7zv40n
X-Proofpoint-GUID: U1s1QbTU9NaWMOmtCG7WvQr5WFO8bRpu
X-Authority-Analysis: v=2.4 cv=UvtjN/wB c=1 sm=1 tr=0 ts=68d1084c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=0ewKxBccC1tKemf2ImcA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: U1s1QbTU9NaWMOmtCG7WvQr5WFO8bRpu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200032
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


On 9/20/2025 12:46 AM, Dmitry Baryshkov wrote:
> On Fri, Sep 19, 2025 at 10:24:23PM +0800, Xiangxu Yin wrote:
>> Add USB/DP switchable PHY clock registration and DT parsing for DP offsets.
>> Extend qmp_usbc_register_clocks and clock provider logic to support both
>> USB and DP instances.
> Why?


Shall I update commit msg as below?

"phy: qcom: qmp-usbc: add DP link and vco_div clocks for DP PHY

USB3DP PHY requires link and vco_div clocks when operating in DP mode.
Extend qmp_usbc_register_clocks and the clock provider logic to register
these clocks along with the existing pipe clock, to support both USB and
DP configurations."


>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 210 ++++++++++++++++++++++++++++++-
>>  1 file changed, 204 insertions(+), 6 deletions(-)
>>
