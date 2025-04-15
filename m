Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32944A89870
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 11:44:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4309E10E6B1;
	Tue, 15 Apr 2025 09:44:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OMlBxtQq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6B2910E6B0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 09:44:27 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tFZt025191
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 09:44:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 rW9FWPSdQt2D+614W81JrfXlNn32mGwhXPgp/tUuSmk=; b=OMlBxtQqJGmWEZFV
 EBm4SupL8+T0JUt9IMgpIMdoOcxKuu4vkazTH74g/ms5JkQFxD6BGlgW/GiNrktZ
 8pdiBvJ09qTbFOGWs3llxl+r9dIstAw4eqWC/kHp5Y1WpS6awHLao4zz/wDnehl8
 mg8OSuY3VOTHHHpLSkylrJ3GlYr9xm3gxzO0vPRZhJrGQHm3HpHA4enuKJ8+T2lU
 bmU0SmpBA9sma7PTDW8+pjUDf+JQlw2JCX/ZCDXQKhJFpxjlmh/YYEvNKzcMTyok
 U2Te52FfUql3eX3kJTjdQUs1j7T8POnCNoMwBHUNu6NUVSJj6CzfWGdEBpGiMnfe
 np79ng==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yg8wfhtm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 09:44:26 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6e8fd4ef023so9522116d6.2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 02:44:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744710266; x=1745315066;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rW9FWPSdQt2D+614W81JrfXlNn32mGwhXPgp/tUuSmk=;
 b=w3jSHMvi4FfDhZ3SZ0+/8TR94xQ+1lR28a0XYPFHXgNI794IF+RONhWAQZf3GdwbZP
 J7mjc/LYPBwWqAJ+4BSqjAHVC+KKQ0OwTkZIxf/gIuRANYj8Txwo2LifGmnDe/UO+6HT
 Tv1GJDaT6Ok7rgNqdtwqq6SUORDaxSPWUUDw8hTScSFcN0c4wa+BlSHarUKIIzUkBiQm
 8x0Ls5mjVfV7G0dt8hBsrH+qG+S+AifpOxu8m5y3ZApf7IWI0Q3tiLwfEjpnmeDEDiiQ
 lQrNAM6yBSAf/n/2NucOw1bJQIn7HylULLxhjwWkmaMFk0BZ/b5NcpEWkBWg7HC0HOTw
 MpmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtmW144i6Ys73cr5gmqxcW1NDGfUjUyaGYpY73zT4/cAQAIjeZZzg3U7C292XFYSBja6LXVje/2G0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+MjliUFzLINOtd7PskOUfYJ63/K56sLDdh47oH1epEpq6XXK8
 poqiLKSqir6Fb6yztI0lElCDCPZON/QolCOFT/nnd+vrJM48NqeGwuVByrSbmNmlXVy0zATnLCE
 CFg5YN1tNI2bAURIsW28Zwn9ItYb/X53mgccfa8ba8fbU6T5V38hPJ94pJvN/n3Fy7PY=
X-Gm-Gg: ASbGncsazzAnamOMJmoWDqSanzmkb43S6roOhJQjCPbWjELy2N1k4H8dSvUqSPorT0e
 5YGx6jonZcHfFinJGbnycIB87q4PCEyZ0VQw9KcvnwykKY7g6HujRZIFhCpPPklw8RqFkqs2Mt4
 Aq8MBvjt6UcT2Y7lytuchvJ6KjkiQUPhCKlrNycvmt+oNU+d+K+hDs5LWQzFS1KozoARzKUHVre
 i3BoRT4zuZbBqB5/lsK01BoUfOTyHik7/V05+IGYGFO50bABD7QmanEBOp421SDzL9D9EQsxD4Z
 9/V5NPYIlZmMkd7Jla9k0+fC25qUww8s9aOWhJW1G3KqITxRYGzBnxZW67XH0Ycyfxs=
X-Received: by 2002:ac8:7e96:0:b0:472:6bd:f620 with SMTP id
 d75a77b69052e-4797753cf0bmr78171471cf.5.1744710265933; 
 Tue, 15 Apr 2025 02:44:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJjjs62RJ3mQbU5ZqHBwBsMfWuvAGXOnlnbzwKsb07Asi8nZzrMPgemoIu+Bz/6N9J+heGTQ==
X-Received: by 2002:ac8:7e96:0:b0:472:6bd:f620 with SMTP id
 d75a77b69052e-4797753cf0bmr78171241cf.5.1744710265610; 
 Tue, 15 Apr 2025 02:44:25 -0700 (PDT)
Received: from [192.168.65.246] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f36f06c5desm6431552a12.48.2025.04.15.02.44.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 02:44:24 -0700 (PDT)
Message-ID: <96e38ebb-5847-485a-8bf6-50e7b10ce572@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 11:44:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/10] arm64: dts: qcom: sar2130p: add display nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Bjorn Andersson <andersson@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20250415-sar2130p-display-v3-0-62314b1c9023@oss.qualcomm.com>
 <20250415-sar2130p-display-v3-10-62314b1c9023@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250415-sar2130p-display-v3-10-62314b1c9023@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=E9TNpbdl c=1 sm=1 tr=0 ts=67fe2a7a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=RooFfVGkvEW2JHd4kGkA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: M1DNm8kozvKub-ASqQ4odcYwRDonSdF_
X-Proofpoint-GUID: M1DNm8kozvKub-ASqQ4odcYwRDonSdF_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150067
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

On 4/15/25 11:39 AM, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <lumag@kernel.org>
> 
> Add display controller, two DSI hosts, two DSI PHYs and a single DP
> controller. Link DP to the QMP Combo PHY.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> +			interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
> +			interconnect-names = "mdp0-mem", "cpu-cfg";

The first path should be always on, so that if CPUSS collapses,
the display may stay on

other than that

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
