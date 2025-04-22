Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEE6A9752D
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 21:14:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EC2310E324;
	Tue, 22 Apr 2025 19:14:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AOk5D0rZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9820810E324
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 19:14:12 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MI6tep022109
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 19:14:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vDfBUzxdqcOodqK0x53+9B7Qwb91WQYtR62iZ46QXiI=; b=AOk5D0rZ8GXmkTGS
 OTj0/lfCOFxNMK6SvsP0kJMxehSGUc0NnT0KYybKGvV4ScuIejqCb4j8mPlBS2rI
 Aox8SXAC9p90WKSmW2geLKOFac/HW5/ox5X6ckOHiVskWuIqgcI1AZ/4GQF1fEWd
 PpoSYprpXpZPeNMzlS99PlhMZsi57RvZXde9En5AZ2JhkMe/XJ0bRgtf2l1vZ+iA
 S0nKczjlkspJohAj8QiANmAmkwPAWvSQD0ZV3+EivpDpvtv4BbftgRIT/K7Ke8Ns
 B0Hi9LNG2zx3RgFSTgV+jm5sjWZGKS787lg//pP8C1MvrYY8qfMK/i6YcLMpO1SB
 yx7UXw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4641hhrye5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 19:14:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c547ab8273so44449485a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 12:14:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745349250; x=1745954050;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vDfBUzxdqcOodqK0x53+9B7Qwb91WQYtR62iZ46QXiI=;
 b=U90DQ93WWhAc0Q8Mxg9kA+FvFXeIFMhwT9mbl2G9AfeqbUVYktkX1DfpzWbXvV3vCc
 F7U+hjjNaXRWMZueh/XszRnyn80I1OxtwemjV51QNz+nfBCI73KcofDcJ09j833toIBm
 4l/gM30u//pa08ClZN5e7yHBC6JYFpLiZd2Vu5BHq4DAkaeT0bme2bIRHin8yrFvCXJf
 DHSg4rMx1ogY+R62kUJ5Wg4nk7PIyr9aZKz8B1vyVdO+72AdLILvC7pXaxTJSINODhNN
 9FBJCTKu1kqxxztiBg1Y9CIoBRPTf1aDZpbnAZ0hV8PyJSLS/GBnPk0NZjyQb54eO1j/
 FLtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW83ukO9kp406kTKVFUgzP4QcjpEUWYHzFaEytHAYz6jmg3satJSDolS6pw/knFglVntG6oT3xN86s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YysL1ErM2ARrVySmY9FTRIgESuWYfq2gk0a9OjUpa2Vx8rLVZZ6
 QEYWkhryIkE0mKyR1Op9uxTa/2vRIC3/CUJ/DDTlToPofQCraJIzCoM4f9OMyKKYsOqtZBxvpS1
 shoqnvwy+eSZSQryc8Q8Igwk2uUBgl79dOkvjFW4YgTMYsZgijraFey4l9d3swEQTs4M=
X-Gm-Gg: ASbGncsqO8G3IhnhTrnn+PI5J91KYST1W3/Vsw+iWKx/RlfTrDHB2aoOTxyJJuri51s
 5I+Ts0KYJuV1bFWkMKXtsUeLMcKYi/CjbOfltziddKqxk8fdxIgavdL+qrlcbAuG1W8lIu9nBkB
 2TnbfRuWKqwFG7RGNJbJKLPckfGgwD1gUgV8IWKuekilZTQU+pe00pFec+4ziioKiJ4X8Fl8PoN
 TXQ2DxY1YHJe5+R++NK8dh0J3fe9quzecyX5hGZRcWq9BqnCL+wIiTh01hOlSExACU5AwbWXeKz
 iMyycU2ecpXTDQ8k1Yqwkd2SQ/Gj4HgRAzHrpDHTOhjjxukNOZ2wX4I0inPXqgrgKzk=
X-Received: by 2002:a05:620a:4095:b0:7c5:687f:d79d with SMTP id
 af79cd13be357-7c94d29ade9mr27753285a.8.1745349250474; 
 Tue, 22 Apr 2025 12:14:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7HiqvOyIsraSAjIugd3xjXilpVZSiFuqvb5lB5h6IcYI3MvuV9H6EVgiP8btR3FsQ1k8Z9g==
X-Received: by 2002:a05:620a:4095:b0:7c5:687f:d79d with SMTP id
 af79cd13be357-7c94d29ade9mr27749785a.8.1745349250048; 
 Tue, 22 Apr 2025 12:14:10 -0700 (PDT)
Received: from [192.168.65.141] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f625596138sm6572178a12.45.2025.04.22.12.14.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 12:14:09 -0700 (PDT)
Message-ID: <1f36d303-fcfc-4aed-8d8d-01a3c4dae57e@oss.qualcomm.com>
Date: Tue, 22 Apr 2025 21:14:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: msm8953: Add interconnects
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
References: <20250420-msm8953-interconnect-v2-0-828715dcb674@lucaweiss.eu>
 <20250420-msm8953-interconnect-v2-2-828715dcb674@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250420-msm8953-interconnect-v2-2-828715dcb674@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Fe43xI+6 c=1 sm=1 tr=0 ts=6807ea83 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=dlmhaOwlAAAA:8
 a=EUspDBNiAAAA:8 a=Dw-YgVe96UOjDrfUO-cA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-GUID: UCK4UIIj-YOINv2ctSPWDyQopS7Fk4q3
X-Proofpoint-ORIG-GUID: UCK4UIIj-YOINv2ctSPWDyQopS7Fk4q3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_09,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220144
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

On 4/20/25 5:12 PM, Luca Weiss wrote:
> From: Vladimir Lypak <vladimir.lypak@gmail.com>
> 
> Add the nodes for the bimc, pcnoc, snoc and snoc_mm. And wire up the
> interconnects where applicable.
> 
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> [luca: Prepare patch for upstream submission]
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
