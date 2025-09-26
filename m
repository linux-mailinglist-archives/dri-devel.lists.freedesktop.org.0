Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B902BA558A
	for <lists+dri-devel@lfdr.de>; Sat, 27 Sep 2025 00:36:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AB1210E515;
	Fri, 26 Sep 2025 22:36:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CQiNTdtY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06DE910E515
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 22:36:48 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QEWppa031500
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 22:36:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ZLSUvcCXErFMAa2Q2lMIRtHl
 4lWxdH0fa1UAKAdTCQI=; b=CQiNTdtY95/oqBY14jdxzCB/FODcD14EBxyK92e9
 pYgq7LkBwEWHJECiVY9S5MBspcP7Hr1XpT66Qd5ElEeoRiFhNu5W83wLIYG8KDTn
 1CsI/9TQfPEvvRcXVeXoFYvbYsXgWSYvxhC/Pq6AUZangYhEYcmJT9ccCRPfzcba
 OjLezSP5ux8960lM6KZ9cPs9Sa4gyFkfDgnQRia0wrNjrsD5A3ciD+Ij4BBSHolD
 G0vWer46rUVY+9bAv/hfnHo+VdtVRRR77QOSfspIT9M3pnnlw4Mo6CBxdQguQZqd
 N3PbZ6xEz5WEq6IwNGX2njmSa3+V7ommfa/dChqPwQOC+w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0tcaw9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 22:36:48 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-773e990bda0so49184386d6.3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 15:36:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758926207; x=1759531007;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZLSUvcCXErFMAa2Q2lMIRtHl4lWxdH0fa1UAKAdTCQI=;
 b=VzSRM8kkCbVUtWagkGHrUDBMquaB+eWsW5KnaBh1p57gTsz5bilvz9w9Ts9UGOy0N8
 9Aqn7hfP74t040bGIZgHE1lCv7efrpZYsCzrnqQ56/52j66zz9krvRCYctnrhCNtCTCD
 On4Lz1WKSneVuGTge5tkJqilTfbE2p3NM339Hm804zsisf0n9e6o6XTzu7vZ2dbn81da
 UG55TjoNP0PCeZEbDpRCoV72bdRJ1h+OvMlBz3rq6p4k6RSQjZTrNWj4xstaGGJXY9UW
 qdRpfwkApGXA2mB4OLTFa1dKNC7vlzl8iYZ3RCvUuVdtlccmGEl0kYrg+uFQ2IC8oCOG
 0bMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSFzoDzSFzRYdVTkwGk+RGBkD9Y7HlJT8Aw0nQjIedW6iwbor7nMQaY2SOvOE1bthUCn4jT7vSqdw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxq3ns5PHP5LzBaPrq/l++FrzFmyl45sHWeLf67aE7LqmR02OQz
 liYgLnpmKcZ1qt3e+H/6FbtZLtuXFZAaUvSkjpxj5ezpty5KtCeuKTJS0RuWQlmxY3ZeSm9NAtI
 c8POzLzztAJXrHPUETNpJw5qtHxph+ePtX/1et/BPhFb3w1P5ZXXswKwqfcMev5j/YrmBHpM=
X-Gm-Gg: ASbGncvl5MDoArWeRGpgE2/vnv85CDu1iBL7uVvpoXqn2tcdvXYQ9DUzZIXQllvrSqq
 trqyhACVSqD+NmWhO+nRnX3bWpHiSDc1bYMoZKiVhvov8AKQkZqAD1K7xCW/1CsL+ywpt1IcOUO
 SnrxZwcGn1VgWUNdlWcAe1bZgJ8dwlu4VtVdKfAFSGe6OzdawCHi692sGxgS9XR18D2h8adB1Kl
 D6Bib3c3SJzTxB1aFfKAEQW2pFk44+tSiP4u/cxGtZ9hP26WcqRdLH3uqpVKRZ7ncFCQtqqqACx
 qzzwjVpotV0MDhssVn2/m/CtX/4jo0GdXXtRR1mzNqVMhC63O6k/XtEqjslKSjVsbzIyisEJZt7
 frt0QaMkUj1uQn2CorP4jvZuJr6pcPg4/4V7OdYT2yGgf9nyhH4yy
X-Received: by 2002:a05:622a:a956:10b0:4b4:8dfb:33c3 with SMTP id
 d75a77b69052e-4dae3c29955mr91817551cf.59.1758926207257; 
 Fri, 26 Sep 2025 15:36:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbe1wxhgonW447Fgu4TmABd4aTg5zyqFc7Zo18GRYrwhFmA693k/yaZQWV+62ImRcaYWFxNw==
X-Received: by 2002:a05:622a:a956:10b0:4b4:8dfb:33c3 with SMTP id
 d75a77b69052e-4dae3c29955mr91817311cf.59.1758926206763; 
 Fri, 26 Sep 2025 15:36:46 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58316656973sm2136641e87.89.2025.09.26.15.36.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 15:36:44 -0700 (PDT)
Date: Sat, 27 Sep 2025 01:36:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>,
 Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
 Viken Dadhaniya <quic_vdadhani@quicinc.com>,
 Andi Shyti <andi.shyti@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, quic_vtanuku@quicinc.com
Subject: Re: [PATCH v8 2/2] i2c: i2c-qcom-geni: Add Block event interrupt
 support
Message-ID: <of4bwtpgxib3emdltnnlzy74yips4znmjy37hzdljhssikt37q@m6guijrjuxpt>
References: <20250925120035.2844283-1-jyothi.seerapu@oss.qualcomm.com>
 <20250925120035.2844283-3-jyothi.seerapu@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925120035.2844283-3-jyothi.seerapu@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: VoTjKhE8434fdzyLYW6yYe8CgzvRizT9
X-Proofpoint-GUID: VoTjKhE8434fdzyLYW6yYe8CgzvRizT9
X-Authority-Analysis: v=2.4 cv=Jvz8bc4C c=1 sm=1 tr=0 ts=68d71580 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=fvgdV2PV7z-sFcuOFeoA:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX00B3fvANRJJA
 zTy8KGYlGykewh6LasTIUYcPoSfvlDUHnaVGP5uVTSf1SHR9S87T9B1OQ5sZ5F6WWsfKPOZQXjq
 WBiObM3+rVzv+ncncSV4XGPCHNfTQOnmh3Fwc50TswzqCWu1z0ZKatbxg2PbWsevNrkxzB3jvYz
 7cG9FVjMnz6Y8GdROa+jhCOkCg3oLJtimrYjOvY8BJhgH8OSaqnxMJ6T3jDcaxI+BpqvyKfL/pY
 rglzDGnyBniAm73ofRvd2wlHupaT3Y1mDnB4nFm7oHuCzLNx3D3v837wNQorb+g3cs46dWJqXaC
 BzEJsf5GJd54yG7Zl2uo8iOAx/KuPaVSa5grpnKUqMW3AieXduXDXBBMZs6FsNbpb5pcyZEX2Gb
 RLxMDUzGRYZXmVqHrpSEFZwOHZF0FA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_08,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
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

On Thu, Sep 25, 2025 at 05:30:35PM +0530, Jyothi Kumar Seerapu wrote:
> From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> 
> The I2C driver gets an interrupt upon transfer completion.
> When handling multiple messages in a single transfer, this
> results in N interrupts for N messages, leading to significant
> software interrupt latency.
> 
> To mitigate this latency, utilize Block Event Interrupt (BEI)
> mechanism. Enabling BEI instructs the hardware to prevent interrupt
> generation and BEI is disabled when an interrupt is necessary.
> 
> Large I2C transfer can be divided into chunks of messages internally.
> Interrupts are not expected for the messages for which BEI bit set,
> only the last message triggers an interrupt, indicating the completion of
> N messages. This BEI mechanism enhances overall transfer efficiency.
> 
> BEI optimizations are currently implemented for I2C write transfers only,
> as there is no use case for multiple I2C read messages in a single transfer
> at this time.
> 
> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> ---
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
