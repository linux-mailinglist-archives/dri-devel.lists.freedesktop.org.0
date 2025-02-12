Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB15FA33392
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 00:42:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6002D10E280;
	Wed, 12 Feb 2025 23:42:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bYnMGUNl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 090CE10E2DA
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 23:42:01 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CGEavL008278
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 23:42:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KSm1Wh4boltPJscGteudVGzud4m6a9zHZcX6TdAxYAk=; b=bYnMGUNlpjFydcu+
 hSacCR2pty43ivLXkV+zJn8PIspcR0a1msqiNfwdkFffTmjqlxnVBOGLefV7DhQH
 dq5WmRCyebm7ZGE0/74t/AeRwZYy7MHQPRwEvqnooV/KW9IG6FRa+3D2OHpoteMg
 evg36haJt9JVFCLQDHHMG8e52stqvWgcVjgSv8y5gWAP8pempl0x5Xs6CqGg4Zf+
 YwZDN4s3zMoD/Pb3+xRn0WmTPub2MFoRS5DqXwb5qSGiB+n6XrysBTH8S4s12PIC
 1vJbt2kcC9c2w00lAOyZNZb6b4cnDlkjW4j8Wp35vslvqrl6Ejq9VZFwd6qKR3fv
 LNvyNQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qewh91q0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 23:42:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-46a32c5cdbdso491001cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 15:42:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739403720; x=1740008520;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KSm1Wh4boltPJscGteudVGzud4m6a9zHZcX6TdAxYAk=;
 b=m1jvclxCQ4lgkbuE80BK/6e9yvn4FNX4YFipUCppjsF9WjHeaEJWkU4EHxDDjbTqqW
 hv5mRd9EHtNl9BP6D2VrZPXz6YnKgUeGYaB0ubcQx46rpshdQRBS+6X5pltBNA19rYqA
 YclyeMQ5GEqbxmEyFM0Mh2wYK6V2fu9tEYuQFQQBq6cwP+oA2dixXm6ti6gjowvPseF/
 2us0CFV2NNaPZfmTy8LBDtulJWENqGGGi9Cy5mngci41Vx3ce074IP6mhIzZH77bWzGn
 Bx3LYh3/x5bmdQzaSlqe8XrKCLF8ImGpOiFaLstOiQcp3+Hk2XLN/MXHBD3TcwyU/NWz
 lT2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeyuwDtwsyfO+OJnIxQjJa7TJV6RqEvN9nCxVHD3UI73FkLxwUe7uRLpC0HaJBWL/UcPSmHZd5gTQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUg9GYg5GrBiYKjxKbVFWVcC3cEANYVgzpI4DLmFgyZaZff4Gu
 wLrKAxGbKzmUFsW7XEX6Dez9ksX0nWtuC7RZ5LWx6S5jM8dpHroUV98nTNWIx2YwcgD7jgQY7k7
 ZcMvlRalBUCQ6u4AxGhR+31It5q0XLZtIcdp7pKdpgy/NVV4UTlI/4OYaxVYdtKA+C58=
X-Gm-Gg: ASbGnctY85M5nK4lpmD6LppTbO3dq2vyqoPZYq6mcLVvEIYQBtssoyGjchGqxyLLFct
 d0Uqdu3z0epCo1Vt0CGHkeUXu6Q9QlX+s5RXDzYMAPlzOPwcnwJOutlLdpvat8ax7uz1eqlBCJj
 wu8RbRMufZyhkYfudCmt46BFTBM6UZbEaiMvUyJPcb5VXIkt6e3cFcpji6GXWBrn8FSdgkVa/zX
 krWkKOTY2o8dH2nqMDgdAh+9bNfBXmH+Nij/pljJ7psz7p56g/CggzlXghWFCyBjT4TYhNA0aXA
 tEZB6hp91MsmCtrEuFEatAvawvQWcE/qF27XmPaqCQSepiza1ue0VFtuXLg=
X-Received: by 2002:ad4:452a:0:b0:6e6:5d69:ec2f with SMTP id
 6a1803df08f44-6e65d69ecbdmr1695396d6.8.1739403720085; 
 Wed, 12 Feb 2025 15:42:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCEcBxmtmcHlTzFNoW46Xr2T8lcEbl+S4lmcASGxCetdh2aIQm3gF77JovXY1V0uJjnJAe8w==
X-Received: by 2002:ad4:452a:0:b0:6e6:5d69:ec2f with SMTP id
 6a1803df08f44-6e65d69ecbdmr1695246d6.8.1739403719675; 
 Wed, 12 Feb 2025 15:41:59 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba53376769sm13987766b.96.2025.02.12.15.41.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 15:41:59 -0800 (PST)
Message-ID: <9c188b0a-5137-4f8d-b8c7-2eb31c5b8424@oss.qualcomm.com>
Date: Thu, 13 Feb 2025 00:41:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: qcs8300: Add support for stream 1
 clk for DP MST
To: Yongxing Mou <quic_yongmou@quicinc.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250212-mst_qcs8300-v1-0-38a8aa08394b@quicinc.com>
 <20250212-mst_qcs8300-v1-4-38a8aa08394b@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250212-mst_qcs8300-v1-4-38a8aa08394b@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cmDjE5KNI-SUtnRbDWoh3M4LPBa6vpb2
X-Proofpoint-GUID: cmDjE5KNI-SUtnRbDWoh3M4LPBa6vpb2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_07,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 impostorscore=0 mlxlogscore=810 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502120167
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

On 12.02.2025 8:12 AM, Yongxing Mou wrote:
> Add 2 streams MST support for qcs8300. Compatile with qcs8300 dp
> controller driver and populate the stream clock for qcs8300 DP0
> controller in MST mode.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---

Please add all required resources for quad-MST operation

Konrad
