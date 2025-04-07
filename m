Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FB9A7D875
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 10:50:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19EC510E3CD;
	Mon,  7 Apr 2025 08:50:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CVVDZL/g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB06B10E3D5
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 08:50:06 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378dm0N010450
 for <dri-devel@lists.freedesktop.org>; Mon, 7 Apr 2025 08:50:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 A7W/suLq2UM8HkanTs1604dpOyHgBjMoRJIiCRyj9+s=; b=CVVDZL/gws/Rm+jT
 YWCrTw9nhBzrno64L/nvG3wxIxarrWOLWV/RhmuPrTZ4uA/GkKdNvaDa25pR5lVT
 WIi1R+8kUyxISodhlpcpZwEVdKIGZTbOCjNoM1bWOTznfU1IaBj7lNsy1ecjOnTB
 wMv+bUs4AM/UyiLPhVuvWE3xV9VXuCFGhgkSWYdvGscXy1oGaoT5Pd4D55dGoyrq
 OwkC/NYXb/HZ5nWb3bBxknxfBtzRjwy6Nub+5Zvz9dTMiABGhd3lxUpKGLeqEl4y
 MDxoOChXlFyEhwHTM7OskUXKfWQTreg851nWAjUkGAgBDWAsxYIPdwgaABaG0Lqr
 LYHTmQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd2kn31-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 08:50:01 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6ece59c3108so9376416d6.2
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 01:50:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744015800; x=1744620600;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A7W/suLq2UM8HkanTs1604dpOyHgBjMoRJIiCRyj9+s=;
 b=PxiSWMYO4wCi8ruU1lgAE+FTt/Mwiyp5oybM9yHmvsQEc9Xl1beRqsKOzuJS3n0lma
 DJbxqhFV9NVyYDuQb2wm1jBUPcn0d865zeFgfur70bEFdPo3FHjo/KdKyvgz+CnzZSrl
 yCT/SNjJHTS6DTpxuEJfvznNz6RqQY4hQ8BA8/gWnSEpDW/fI0MiOq2sjzAOldpFxXvk
 AghSN048PtZHssidmdrX3sCeoPxxDcSoLyLlm6iozCsemQNmWuuIkvOVRG4O0Q9gpep5
 ys3nFIQhKbRyP5Sj2Q1kyefoqj/6VDQaiuTAZxFtVy+b7wbqtfHmCAf1cPukQntS0Efa
 kPMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVF+QKfjAUzFIGQW6TSfyHccXSuetz14JXgDw6o1SagenRRr7b0RitSX8VeIPaqVWFq0i1JBqN6n34=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyMARGgNrDjSTr84h3OKRUQNhaesmWW625oQdxQ/OMuUrbODXXf
 odeRA16vxcpKLcPuJbBdcyO/4d88HTigcZCRbn4iVNQd/OzqpGHUAJ4xpQCN2ums01eIbnU1V3B
 fgreAgPaey0kQ38XQ/e3FR6COGUwnmuj+enHxQ8I/0zdib93NC+C1pmptFwNXGpTkTLI=
X-Gm-Gg: ASbGncuJA+XacsCBvzJiw6nFSeH7A8ybRse/24oOWsOkkpM66mDn1D4ZJHqKVQ7mds8
 3UU7ys3t6YLWvhLVCAIDc5Z+poBfuyL6XPWg7rMY+xkO0HlozIwDWI4vTEKuqeFyC2Ic97Ma5fO
 n2IzAnO7KLGd0BFv5GZGZqqrO8i3LRfSUvtEuAgxyBch7xRVEqAGOdl6ckxhIoQJRYb2+EtGNKQ
 h8fZctEdQmGoQ7p3G2oiY7N+/nTbA+z5A262dKTNnztRSXmOpmH+ZJ2Udr5bN7CJK1OHFBwGOKj
 lcW6vKW2ZYwdYQhVVEm0qmAarBY8Ds3Cr3a4hNLGPjgPJCGkmitb1gzwBcb+vWspkgZGxQ==
X-Received: by 2002:a05:620a:454e:b0:7c0:c42a:707d with SMTP id
 af79cd13be357-7c774def534mr617002985a.15.1744015800128; 
 Mon, 07 Apr 2025 01:50:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHM3ImiIeUKkCnXzozuTunhbkQzhWJNYwKRsFjSxrcYnNZn6j0yjPM2Ovp2gCk1ymCBdM3FPw==
X-Received: by 2002:a05:620a:454e:b0:7c0:c42a:707d with SMTP id
 af79cd13be357-7c774def534mr617000985a.15.1744015799813; 
 Mon, 07 Apr 2025 01:49:59 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f0880a55aasm6468304a12.78.2025.04.07.01.49.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Apr 2025 01:49:59 -0700 (PDT)
Message-ID: <9583f74f-2dce-4535-bdff-92b1da1566b5@oss.qualcomm.com>
Date: Mon, 7 Apr 2025 10:49:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: msm8953: Add interconnects
To: Luca Weiss <luca@lucaweiss.eu>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250406-msm8953-interconnect-v1-0-a23e22e236e0@lucaweiss.eu>
 <20250406-msm8953-interconnect-v1-2-a23e22e236e0@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250406-msm8953-interconnect-v1-2-a23e22e236e0@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: j7fDG1WUbk3-6gJnru2zq_3fKsDTywCo
X-Proofpoint-GUID: j7fDG1WUbk3-6gJnru2zq_3fKsDTywCo
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f391b9 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=dlmhaOwlAAAA:8
 a=Dw-YgVe96UOjDrfUO-cA:9 a=QZKuY7mROTJmt8fO:21
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_02,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070062
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

On 4/6/25 10:55 PM, Luca Weiss wrote:
> From: Vladimir Lypak <vladimir.lypak@gmail.com>
> 
> Add the nodes for the bimc, pcnoc, snoc and snoc_mm. And wire up the
> interconnects where applicable.
> 
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> [luca: Prepare patch for upstream submission]
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---

[...]

> +			interconnects = <&snoc_mm MAS_MDP RPM_ACTIVE_TAG
> +					 &bimc SLV_EBI RPM_ACTIVE_TAG>,
> +					<&bimc MAS_APPS_PROC RPM_ACTIVE_TAG
> +					 &pcnoc SLV_DISP_SS_CFG RPM_ACTIVE_TAG>;

RPM_ACTIVE_TAG is akin to QCOM_ICC_TAG_ACTIVE_ONLY, keep it on the CPUs
and on the cpu-cfg paths, use RPM_ALWAYS_TAG otherwise

Konrad
