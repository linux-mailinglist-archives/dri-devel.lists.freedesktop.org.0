Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB054C7BDC9
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 23:32:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB50A10E90E;
	Fri, 21 Nov 2025 22:32:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kH7WqefG";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="csDaHp/7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6634E10E90E
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 22:32:44 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ALFla2o3140679
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 22:32:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Pr453cERSmy1/J9J1l2SfVrp
 0cwlN0LwGQ0VuFEXJdQ=; b=kH7WqefGVNsFQj+gaR6mLFWKT1rqgfx9RKoagdyk
 MazkSWDV1TldXVvbJlvNhfQBaB2vAPc12HMsrllpzzq+C8U+RUTkfUTnfcSFW+7g
 ChHV8N/1BDarRlqSM1ql4cCgubBG3UqqAVRxNZU3HwVI55608t9MIkoYZVe1GRoJ
 idSLZpxDTXVQ9qsrghEqbYpv2vBrcfCkSXzDwZvay8oJU3usYmfNOwvKZgLnTMYI
 JnCgv0B/5E3IYNCapvMfwJ7cOe3B+mS3Jneg5jvOw5IkClAxRRxUGAWsUuC7SWaE
 oBldQ2dUrpr8GUTtyQQJg9ntnwz0GonSLABUv9EB2p3JYw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajmppjjt4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 22:32:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8b1d8f56e24so734692785a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 14:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763764363; x=1764369163;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Pr453cERSmy1/J9J1l2SfVrp0cwlN0LwGQ0VuFEXJdQ=;
 b=csDaHp/7Ehp084w5eTL06Yy9x7Cm5N5n1vRazoGDkhsYDw5v6JC7ZIQ3mN0BW+Vsmq
 EWDSTnoItFsOyZv+E38XaiIUztbt1b6WU61/XWypPzAl7qvMVzmifvtoFY9rxHU6sRw3
 50hEIMpB4qSlMxSbx7QfRs65hgcAROISG6zPR5SM/Z4ch5VUa/3QBIm3Aaug8EWE33uO
 iwGYKU2uY2Eia7BlztnfhoXdmWbZU9G3rSLRWC/WHNiMp+Wl+MUIl7FvwMnIGojjJAdD
 H8AkncLx5nBApMmQDVfff/86ICBCMImUvsJoCPnwM2I0bfYgDrVWceszacxqX/x/bsgU
 IU0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763764363; x=1764369163;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pr453cERSmy1/J9J1l2SfVrp0cwlN0LwGQ0VuFEXJdQ=;
 b=JHexP7JT7ZV/9Naa4/c9tW+a1/pwR7GWvgdiE8iC1edyenq2jY8fuyVky+8qbfAmc1
 D4eiIM5qT4ojJ9Q7pH/n9nfrd8AS4n6HHH71WBV5JP2Zzs+PbkLgt9g50q2pZTzKKUWZ
 W6fAmLVSTvDNiRKI5V5ugK8lQ+m6BRC+k1khoDjGBFJO5gyFQQ9Jho/Frp+6JpyF2Dpi
 ep1DUJ9b5Guxe87malZQitNQk826evyYUn6cz90aCtmJEEfrxJ0LO1rW+OjBG0TeJd6/
 b9Bxg8fAdxCf3BvbCKkSwakeCKwp3kqg7mOlxdIFxD0V9AjSn/i+lSYaB6RZoYfWtLbZ
 Z/zQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVF5lxl0VVyQrZy3cckjnDB8ylUYyod3aarLIJ3FvMg26mShyPRtCHMpu6mDMXdC1JQUM0cIpQNECA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKN2s0JkUB0Hg4mYr5MIyZR3lR4vwWz6tql3BUVrpff5MLc5nf
 v1K9M7WB3SNACvaQsgGj479L8LmcqRVKoj3G7wi3s/q1LPB1QTzQiY6kcjTkye3AFEQu00ta4Wt
 aoHaHuJfyYMBXctWxe8JX5jvL1G7G3kFl0AB1xTqZr8j05EBkl+VkLnacf3HY003JS/lBAqg=
X-Gm-Gg: ASbGncvT1J2GhxhbwXDlE+7cx095ihatUK35v+LQCf5HqIWEd8IU02QFojLxn7lT4Ok
 Qwj/61GuEKsIZQ2+WHZl+mx06ENiDMgAlD49RYW92cXHvpfebVBO0CHo/J4+Q08K57MlUOiOzVM
 3bD5ceWi1E77JryGuOLlcDoqBAkJ1b6sp1A40/j6d0c6OC2LpSrSf1rWKV4mzmB2WH23Q+dHu7g
 3eaYnRMbVPAyf2ngukK1ievgmled+WkKLCUwy4I3i6jRSjnNNRrj7SSwrjL1XXX0vkrZfMP+vmL
 Atq7CyPN1ktMr2EbEO3KlEjAGb3b8445fHe7CkgNWby7Pd8jLAocBI/by6YZ2rJ3+tDoosNj/DC
 m0+hozs1RcWpyAYt8SSysm5VTbkoWof1oRVULzOmylD4mgLHEAf30W0mPjEjs1LfdRu/yN4xbmC
 uyvKW4BnvEW03cPbxyIXg7jhU=
X-Received: by 2002:a05:620a:1aa7:b0:8b2:bf20:f0ef with SMTP id
 af79cd13be357-8b33d47997fmr497571485a.54.1763764362818; 
 Fri, 21 Nov 2025 14:32:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGrQuCX6VXqTt+aYIlduBf1Y7uPpB2QJUvC4Ki9sjnl/6lrwFmlUsH69t4JWc63uH1+2GbDVg==
X-Received: by 2002:a05:620a:1aa7:b0:8b2:bf20:f0ef with SMTP id
 af79cd13be357-8b33d47997fmr497568285a.54.1763764362337; 
 Fri, 21 Nov 2025 14:32:42 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5969dbd2817sm1914260e87.100.2025.11.21.14.32.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Nov 2025 14:32:41 -0800 (PST)
Date: Sat, 22 Nov 2025 00:32:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Qingqing Zhou <quic_qqzhou@quicinc.com>,
 Jie Zhang <jie.zhang@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/6] arm64: dts: qcom: sm6150: add the GPU SMMU node
Message-ID: <7dd6deirm7p7jgbjzev2hcxcfmsx5dtijfaglynmqaicpxr7rf@p2zev7mayq6l>
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-4-9f4d4c87f51d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251122-qcs615-spin-2-v3-4-9f4d4c87f51d@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ev5Pdz_PvlytBTF9n14js0lfTJ12CSMj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDE3MyBTYWx0ZWRfXxkLMYIinHJs2
 SRR7H86dcmdd2fbH9FWcAl9sdWHZznGxJBR37Tf5j5JCW8DHqvx8GKhg20sLOlmd7K1wI9bKe/0
 PdcXY0/SS8rcHcm1b783slDtQvz0hGCUjbVdMddlCGJgFbgdJtQzik7ZzaIFw+THLZckTob4Tyg
 XOlk6DIuQrDfKXsJIG1IKN512QVf54gGUIu1mZuIFGm1a1Ul9sHudojVqCKvTQNEIBd1xGrDOrB
 +KYAQqEPhNGbtgWcIcspc/nqPcbzC3UIIcRHLXmKeHqqOKUMf3F09p9yVlZ3isV+uTYYV/rwJvg
 vYzX6fsJ26DZwEEaW9mTLuWU8LG8hF7ajxnAbaE+ujACcCtazdcxp6hEddaGhPz+iutpI4KNlWM
 R89KbCDOpml1gHUomkZ2icqIdhRuHQ==
X-Proofpoint-GUID: ev5Pdz_PvlytBTF9n14js0lfTJ12CSMj
X-Authority-Analysis: v=2.4 cv=CK4nnBrD c=1 sm=1 tr=0 ts=6920e88b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=UQAiW8fk4jwks4S4FoYA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_07,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210173
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

On Sat, Nov 22, 2025 at 03:22:18AM +0530, Akhil P Oommen wrote:
> From: Qingqing Zhou <quic_qqzhou@quicinc.com>
> 
> Add the Adreno GPU SMMU node for QCS615 platform.
> 
> Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/talos.dtsi | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
