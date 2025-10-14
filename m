Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F34F1BD8763
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 11:36:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6161C10E586;
	Tue, 14 Oct 2025 09:36:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ErIKlQPZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC1010E521
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 09:36:35 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87Lq9008581
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 09:36:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=RBVC+5/5ABafrPQ+4V6HCdRE
 5Qnnq6FFZbvfYQ5jpT4=; b=ErIKlQPZQMOrg/qnmzemszHado82YkEIlTM5k+Ng
 SHK2L/l+BM4TdVruAnnOwh8LzH0kStRIjZ5qkSTSaiSf045I47edY9lctn284X+Q
 03oOOW1yFDf9mWP6ofnHDlBXtZb0dHMCWPqIQkyTv2QoOCe+HJTG/hTbmg2pdCGA
 hGhlxuzTlViBKodnkYMk7zdDvgUvD2bN8xtZQMN+pt0Xi47tAkukQ70Igwukc822
 m929KjMPQdhFHrA3qZL/UBaA0n1Mi4/pso3yqeQddVyXj6927t41f0jeGLMiwpgm
 r4GkKnnqbzrhepUJUqgzK+meRFin0yLc5Wr8CxcP2NC1WQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rtrt4rvk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 09:36:34 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-87bfeecc483so1497386d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 02:36:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760434593; x=1761039393;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RBVC+5/5ABafrPQ+4V6HCdRE5Qnnq6FFZbvfYQ5jpT4=;
 b=CFere1kmCiJc9QNkQUtsmQYpmAC/d07EchMpLnDfv63g9OnadgQ30L00xGNqQHIM1o
 WEeq/afjkl/xMCSGWmQlivXfNr+cFBbyzQ+RIoEbNnQLsvoiSaC+NBJVh9hTA4pNaG74
 Ea5P6BPMaHYFkOo76Q2SZtQV5grDDzFPuYUiahSr8YzzLj8Z5jW92WZcK2bXkFbdxx0I
 T4WVjM4NwqOwxu77vvtcizOTq81N3gTd3/5YhcQ24eQoM5AapC91k61y/BQ/fpfcxEzA
 glw+XxTq27SoSYPEDKNNlvpW+7tjWNoOsk7tTKLFOmoByLiQzQ80E79ttJ2AlurgDwC3
 8s5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBDxcR94AO/mHEuLr39L40JX+RCdebkob6QMKMUgfRMmIPLgMStrB12/rJEPRkwi7/Kbd1n0yEFow=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwAYTQHyit05L30lYSD3l8ZUiPmHaM3BSdpd9Q1Kqev1OasEi5O
 GIPs4ItrK3QAWrxzHlY+Kjgc4ibzYM1pSaH/Rm/2gNoWiO3mCBW9Bwm8u1RF1fkj9mFfvLR/I8f
 nY6xYTU2XYCy1U1fDNzhgazpxMwnEKSp+0GzrSECz4xhxupEqoT0dOw5rWFNRlJWwwhLD+dA=
X-Gm-Gg: ASbGncuLQr9esskqs3DD0ZG4nJtPQUq+ZQBt0RMiOAQtvgZIc1vnJDn9WJwJoJXgZYf
 /DCRgTwDdkLFw+G5tz92p65SVHG6R7S4wftez1LRmz4n/1ryg2b88yQzxB3EVp1oXKcRRLELwiY
 9Gv3/hUD0Sz6g80YBGUgBvsPPsSPTMgo6qUDM9HpO6js1DKeQ74fJ5eM76115XwNde1ef0Hw3KM
 nUI9byyD4aDDAFYlnZCQJ241diS2l/cKZEi5IaE9+tX5wnftxKd1LOg1OLBV0zVfqemgpNBJHRd
 0Lg7nRDy04BZXz2Wa+Elyyt/gR/TXOPZZfcZtrdZhmrkdG2ewlDbO7aBSnLI8VhwOv92gRT6wNM
 kcfNse82+7yDaodjaNybH6mQm8WFYxd2h77ThueYq/SlaFc3aTI8e
X-Received: by 2002:ac8:58c1:0:b0:4db:9c75:abad with SMTP id
 d75a77b69052e-4e6ead675e6mr362283341cf.74.1760434593429; 
 Tue, 14 Oct 2025 02:36:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERrjyZhC8WYF5QIYCGn45rVK5JIGxvjZP4pOiPgTYBQZVXJXtDIxnFvrzcK8U0iF1Mgp1g4g==
X-Received: by 2002:ac8:58c1:0:b0:4db:9c75:abad with SMTP id
 d75a77b69052e-4e6ead675e6mr362282921cf.74.1760434592949; 
 Tue, 14 Oct 2025 02:36:32 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59088584806sm5055024e87.123.2025.10.14.02.36.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 02:36:32 -0700 (PDT)
Date: Tue, 14 Oct 2025 12:36:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: qcs8300-ride: add anx7625 DSI
 to DP bridge node
Message-ID: <acfvx2smpoco3hakkhas3w3fybu36it65lpelbuigcyg2f4thh@qjbtzgxcsrxj>
References: <20251006013924.1114833-1-quic_amakhija@quicinc.com>
 <20251006013924.1114833-8-quic_amakhija@quicinc.com>
 <vj3pwikzgbflzwqwkbvdfac44llinsmrhrqnvu6gx756xz4h3e@2lspa6zx5xgr>
 <3597f849-fe69-48a5-91cb-7a0bdc9f3e7d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3597f849-fe69-48a5-91cb-7a0bdc9f3e7d@quicinc.com>
X-Proofpoint-ORIG-GUID: TxsR4Eu6Y2Q8WdLbN36TF8GzoTOMn0Wi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAyMiBTYWx0ZWRfX3vn2kseATzKO
 74pLwhSaH9Oq9ZF4w2/to3WVd9aVpe4rWEVdkqpM/14uzX3SH6Ml3P1KLtASvKiPs9FT3DtD1DU
 /LUZAe8ugHQLt4xJy81LthChQUqMA/nXwMo88D421jQZRuzk4m4rCHWOwgSqQXLy+r83HJPan8w
 Qjq/m2X1A+kUCg0yyO0pwyFxRAbwe/8CgxCYaLmP97iJ5mXX9mtcq0qpidzpnvSZuDa85526eZW
 k7zi2pI6KKsrlDg12xIzDkMihiGJjr0LDIeFfOq+aBCx+PIr6UiHtYTZtyQ2BAhIxoHWZEkDgTQ
 OhQRLfMmWNrFePNCcnA9g8md6rbUw2y9XKxtpxpEnjdp/d2V4l2Heim/BoW3dPKu9RaDyYMoOm5
 E29FcYyG9G2I/mPQxIOw+/cI/B5rfA==
X-Authority-Analysis: v=2.4 cv=SfD6t/Ru c=1 sm=1 tr=0 ts=68ee19a2 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=mWwphNQy6DiE2YH7zW4A:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: TxsR4Eu6Y2Q8WdLbN36TF8GzoTOMn0Wi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130022
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

On Tue, Oct 14, 2025 at 12:06:13PM +0530, Ayushi Makhija wrote:
> On 10/6/2025 3:46 PM, Dmitry Baryshkov wrote:
> > On Mon, Oct 06, 2025 at 07:09:24AM +0530, Ayushi Makhija wrote:
> >> Add anx7625 DSI to DP bridge device node.
> >>
> >> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> >> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 170 ++++++++++++++++++++++
> >>  1 file changed, 170 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> >> index 891e49602c97..5d4040376857 100644
> >> --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> >> +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> >> @@ -24,6 +24,64 @@ chosen {
> >>  		stdout-path = "serial0:115200n8";
> >>  	};
> >>  
> >> +	vreg_12p0: vreg-12p0-regulator {
> > 
> > Why are these nodes not in a correct place? Also, why are they named
> > differently from all other regulators in this board file?
> 
> Hi Dmitry,
> 
> Will keep the nodes at their correct place based on alphabetical order in next patchset.
> Similar names I have used in LeMans for these regulators. We have kept these name based on the information of these regulator we got from SW doc for monaco.

There is a slight difference between two DTSIs. LeMans RIDE uses
vreg-foo-regulator, while qcs8300-ride.dtsi got regulator-usb2-vbus
(which is close to what other platforms use). I think we should also be
using regulator-vreg-12p0.

-- 
With best wishes
Dmitry
