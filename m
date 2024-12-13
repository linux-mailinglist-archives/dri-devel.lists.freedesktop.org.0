Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D899F0A1B
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 11:53:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D7B10EFBB;
	Fri, 13 Dec 2024 10:53:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="awszngcr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1FD910EFBB
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 10:53:27 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDA3bao012385
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 10:53:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 irpyIGk/Q0YF6woDF/wcVcUCJnQrVPx3H7tZ92Jopi8=; b=awszngcrShQZzvPi
 n0hEB9bmooPgpZMyxjWdWzE1FdZbWqj0rY+4baPFg33/WXHP3sYkcH1MER0bcb6Z
 GBGQjqtFicTO4Yk9za0JTmJt2w6+krDe2OHTzo5nuRsE5p0Up7e48hfHCCIqzanN
 ONm+ZGMnJOX6QL4cIFPm37VsovtYSR5hKAz+MfvvFwelvo1ibQl0cvbrVbt7HVYK
 SWiU54j9uq/1MS8IVskDjcrdGgbqi0ji2l4eu3VdtD5bCBpA66+SxUMCz5pXgJPT
 Dy4Yt8Jp5w/4gCsdPuiTxiUnxJwrrWXyjNyk7q4FVCFEYnr/JED9weoKVI/ZlaeC
 8P2jqg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43gjudg5bx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 10:53:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-467a437e5feso1865341cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 02:53:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734087206; x=1734692006;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=irpyIGk/Q0YF6woDF/wcVcUCJnQrVPx3H7tZ92Jopi8=;
 b=gC6vhlfmb1sI2k4meGVkE4N5e72lgh6RWK5N/XlZyexfvOGXu2YehvD7hHanB/ptEs
 C6JQ9pp1UXThS/4FtATXdS+9B+nZH2KvQ1wOCuB7ewO/vgVPaqAUq0CA7N8e4dmYdDWc
 fXkS9O5kXEzJ3Ic7S5xV8Ggf0EDg8yLpwO0e6kaE6Q/g2v3cfRhP0SEk6p6uSbz2I5CX
 L5Wx04uiI4TplZen2gBo2o5WPxjHmbSEC4cOQVaCgGxy0wRBg4PragdjGHhfhS5Br3n2
 NoxNKp8ROOrzP2Z7ho6Xf2/QUQtBBQB/MIPuKtzxJLLrSWnXnGMD1XZ/stGIK5VqqrKB
 m85Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX73NkXjoGEl4mt3ShzlD4hnfKIEAA6cIttaZfBtwqipM4Oz9ED40jRvA63Yj+UBi1j8CsVrkYuL/k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw133+XvPpGZ6cLTzQ2YpBGWHLxZCZjhSh3b6KQDukEnrPivC2J
 heq9Sec6E92OM8eODqwLkIKFKbz6Noedcg0D5tqBuOmSFqqK6Sz6IhCooqxu5okD8r/j24DIN8/
 VBeDyfV0HLp0LCTExJAK5BuNncH1429f6+XCtTuenEOlE586Hj6iTY6ND44smCUp6A3o=
X-Gm-Gg: ASbGncsaDH2YQyhgt7UOhLw8ooRfA23djc9O+FYHsKgOwksOI3oYjl8TDAj2LOJYN47
 qWX2K6adIt77IJDyYjAFijpH/6NTo+O0ouLF6pF6hLlNzrqSoI+mKynA+RVp3p2XXGzYxnHW2W+
 Wg+G6CntSD0FvqzjCR8Vg0hrWeUjxJtI4AVyLuga4wCpgxiZ7ktn7QIDX55bOnSDqf1K2bOB9Ni
 zrHwPJzN1Xb80gneJI1n9suh2rAX5J3XiVoNOpp3gsf53lUn0sTWspa3wQt+JY2TYoX+Oe96fXV
 F3GdwVOjIU+nz1CiVbD2EvZ9m50DHAyr6Wr3
X-Received: by 2002:a05:622a:13d1:b0:467:825e:133b with SMTP id
 d75a77b69052e-467a582600cmr13964361cf.13.1734087206059; 
 Fri, 13 Dec 2024 02:53:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IECRFHuS1VOciP42gwRe9QYsYpR8HsKDaOPO2V5MwSaCuCKb67oOndG87qRS6M/GWLhkhClaA==
X-Received: by 2002:a05:622a:13d1:b0:467:825e:133b with SMTP id
 d75a77b69052e-467a582600cmr13964081cf.13.1734087205613; 
 Fri, 13 Dec 2024 02:53:25 -0800 (PST)
Received: from [192.168.58.241] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d3bf50397csm10148990a12.79.2024.12.13.02.53.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Dec 2024 02:53:24 -0800 (PST)
Message-ID: <28bf46a5-dedb-4491-b9be-23fdfb99035f@oss.qualcomm.com>
Date: Fri, 13 Dec 2024 11:53:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: display/msm/gmu: Document RGMU
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 20241104-add_initial_support_for_qcs615-v5-4-9dde8d7b80b0@quicinc.com,
 20241022-qcs615-clock-driver-v4-3-3d716ad0d987@quicinc.com,
 20240924143958.25-2-quic_rlaggysh@quicinc.com,
 20241108-qcs615-mm-clockcontroller-v3-7-7d3b2d235fdf@quicinc.com,
 20241108-qcs615-mm-dt-nodes-v1-1-b2669cac0624@quicinc.com,
 20241122074922.28153-1-quic_qqzhou@quicinc.com
References: <20241213-qcs615-gpu-dt-v2-0-6606c64f03b5@quicinc.com>
 <20241213-qcs615-gpu-dt-v2-2-6606c64f03b5@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241213-qcs615-gpu-dt-v2-2-6606c64f03b5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: s6NEb0axuyUDOn5alCjlQxAN-H34UPoY
X-Proofpoint-ORIG-GUID: s6NEb0axuyUDOn5alCjlQxAN-H34UPoY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130074
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

On 13.12.2024 11:35 AM, Akhil P Oommen wrote:
> RGMU a.k.a Reduced Graphics Management Unit is a small state machine
> with the sole purpose of providing IFPC support. Compared to GMU, it
> doesn't manage GPU clock, voltage scaling, bw voting or any other
> functionalities. All it does is detect an idle GPU and toggle the
> GDSC switch. So it doesn't require iommu & opp table.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---

The bindings file exists so that people that are not in the know, can
reference it and learn about the hardware. Please spell out IFPC, as
that's a non-obvious, hw-specific  acronym.

Otherwise looks ok

Konrad
