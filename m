Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33604B4A6E7
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 11:12:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B51810E676;
	Tue,  9 Sep 2025 09:12:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="j91VP4Gv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5331E10E676
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 09:12:13 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5896SeDO007486
 for <dri-devel@lists.freedesktop.org>; Tue, 9 Sep 2025 09:12:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7/LZ7jld6Mn4TzxL+e3wR4fKEsF+dhJ3GAlByrhuIjw=; b=j91VP4GvonjXVqJG
 g7UJdf4R4krV5SI1hisRHQTgpAYDp99pUNmaH0VbNzRwikm4gD+lpc/O97k/rzaZ
 ldmX0ZDowjWc8kfCWE2m6WJoUqn7gM8RWHgHbMlXcJ+ZoyJYcNUozb/gAWa3ys6E
 xQJA91IUsus+fR4iYRPl7qWpOpSfp6ut6oIJbGYYeopXtVI6IQjHVme9nJRTOck3
 Bc7TSKCQavDYO8j1+qu+zLdk0sHDEDq9C90RRR1XuXUW+yj2pZTx5rQypvKhiEPc
 fMH03JwEx6Q8l5+DjRi9+rhY6OUHB7Rl4JQZwS34qhVLbA8/NARnpTmQI/Golbfx
 TJDfeQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0qmu4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 09:12:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b6023952f6so11622081cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 02:12:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757409131; x=1758013931;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7/LZ7jld6Mn4TzxL+e3wR4fKEsF+dhJ3GAlByrhuIjw=;
 b=C5OCVVxeojDVSkgT6dviOc6CwgzYvvAlaZ9y7FbSZF5VpkuU8m2PEPPXWilOVqN2/L
 gyI03KnH2TW+LxblJPevpcGg5isGIZKvBnGVUfdLQjJcC/AZt1iSdZ8KY8lD2eCn5XxB
 XrfEQ5bxNEUj3ShGsgeONiMk8nYguMNZ+I7LDLLVUwond8LXUhl2Zj84hUyGroy2ml5d
 Y56Je54FVTrs8+y3Cw7z/cmYpaV3JxOf59K7fgwOKDd8VvdwX1hBYj5no/bZeQZah9PG
 593A5xu3D6s8p7lhF2oaz0ritOCD9bp74XxpsnObCzzJ1O65cNS1sO32AQkDCjnYhf6H
 QqXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWP7p6FoYKU7YpCCMkTHtyOtylbKzv0NIoeP1okpPSeH+eW5NrrKqg8bR50B+Wzew2IOWJzm3gY03E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqtTXATNLrkWEw18FpYusuHIO2zh84WgiNHqokHOo7xcwD98Fc
 DhOwfjYpz1frE0fcWnL49GPpee27JeTWlso2OHZls1IbId4O4lsDMDl7FpJvBt2G/5uAv03BnOF
 tqrTnrRORj3lQcQRePfgcgsh75Z2TjhZZ+qZ+f17R7zS1kQJ3JCv4kmgn/xAV9bCcH45K2pE=
X-Gm-Gg: ASbGncvf18i+YKkMl/EMuyLLBAv+FL5sqFRaLCzm7PviVc3Z+XHsamS9eCHRfCAxm3d
 V82Pqy57rNaXpbJ8s79rXJIzEx9a9oxVLmzT9z9j2hZRShwm0kQDIzLzwkIiCPymBFnLaxbvR1u
 63h+MoiPJeELov6t0skYtHHrlDhNaAZ8bL/wl5MpNRFWbMlYhx28Oaw8Ph5t0OhkRhZEVY9Sq3t
 rY25tV8m6qRRNwbGdtmtivHG/LLMRDWexAmTyUws8/TFa/GzjXayNZ7W0kIkTXhVp1ELwbccT0x
 Ny0D6Audixt7+DNc7zh7H0E7+tcC8hN7md3AzMsdVaeOELPj2/zbWVbI9xou7vy/CU+ISid/QqE
 eNK9gABOW3cGnGdWU2eqX/A==
X-Received: by 2002:a05:622a:199a:b0:4ab:6d02:c061 with SMTP id
 d75a77b69052e-4b5f847af12mr81429391cf.6.1757409131404; 
 Tue, 09 Sep 2025 02:12:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGT8WcnSygf6bNTgYYy0/PkzY2w1a4gXks9/FKqoCWfWHg07YtEpBTM6SSkzd5fxyaeTOsD6w==
X-Received: by 2002:a05:622a:199a:b0:4ab:6d02:c061 with SMTP id
 d75a77b69052e-4b5f847af12mr81429211cf.6.1757409130769; 
 Tue, 09 Sep 2025 02:12:10 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b047373afcesm1359797266b.57.2025.09.09.02.12.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Sep 2025 02:12:10 -0700 (PDT)
Message-ID: <25df0f78-68a0-4459-a5a1-eb035b0a5395@oss.qualcomm.com>
Date: Tue, 9 Sep 2025 11:12:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/6] arm64: dts: qcom: sa8775p: Add gpu and gmu nodes
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Connor Abbott <cwabbott0@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
References: <20250909-a663-gpu-support-v5-0-761fa0a876bf@oss.qualcomm.com>
 <20250909-a663-gpu-support-v5-3-761fa0a876bf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250909-a663-gpu-support-v5-3-761fa0a876bf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cR-wAFDiqPTTQSZvuURDayuJJn0HqXLe
X-Proofpoint-GUID: cR-wAFDiqPTTQSZvuURDayuJJn0HqXLe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfXxtTTWIi/kW3V
 IaBHdcPj/nJRb+YsgNHWxn2tWzWObQWMkNcJBXFsfpPtyqwT3NP78Cz0vfYbZ79CM6qDRVZcduK
 YZK6lZnxvXOXP9RDFXEQXk5LCxjI/o/n8NFMRIWusmvUFP+nSs+3WLcz6Uc9RcMkWagLWVlww1o
 +MleF/ugOn1YZw4R84b4Q6VoLTd9qUfjAIGvICxlMeRPKTDsjyGpmfc/NKOlgo1CkO/hP71EKbo
 K3dFeSNWpprWXfDyW9udNWDAZ9xvAPh+090Yewlz3QvQoT436qsDSk87/0rGK1ZhEsgLYDWWpwo
 o1Ftn/Qh3YztjQK7n0xEhhqF5fUwTwle3uqA08e76r7qPsw10E/jsrT6PWRNNJYIqxBegaF4TVC
 Zw5FdOzf
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68bfef6c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=bBjZtXtOduL1R7AEkPMA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024
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

On 9/8/25 9:39 PM, Akhil P Oommen wrote:
> From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> 
> Add gpu and gmu nodes for sa8775p chipset. Also, add the speedbin
> qfprom node and wire it up with GPU node.
> 
> Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

None of my comments on v4 were addressed (we agreed to drop the
GMU MMIO range one but others still stand)

https://lore.kernel.org/all/f11b778d-eba1-4712-81c7-b83f2cb38b46@oss.qualcomm.com/

Konrad
