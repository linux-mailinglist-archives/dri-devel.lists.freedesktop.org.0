Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B0FA673C5
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 13:24:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5997C10E46E;
	Tue, 18 Mar 2025 12:24:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cP/aKPBG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E274C10E475
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 12:24:20 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IBTmic002934
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 12:24:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=EDN4zD1N+DunuKV6N3O+L5Yt
 WP/lxLEnoiHEUOXeOZo=; b=cP/aKPBG9s3vx4Hdf72/D3QdvS1KhRO5zz17XOnk
 7cjlNesi62VajSyHwTUYBfZ0xRhoOdp1/Oct7T3ABolIZ+39zcc2CetYT9SnVata
 y29IhJSV4MrjFv7KpcPrYOitMsdbuKDTUfuHd1lM49gkivSu/ag5rXprxfYeeAJV
 jPN2ZRnKb8VOwUmbKxP07dOQbg1Rc7at7Olr7smEA4TGo02DYTAHr6snVWfFCAEl
 p1xTyQH1os5oXAgISy/XorPaGgp/GMG3AIIAlTbQE3UhKqO5XuuO8NFakOXhY+0/
 EFN7U5mT/+bkB2ggfiXhff+0d5+ARnt3dKgvjn323KGNCQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45f010hjfm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 12:24:20 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6e91d8a7183so105514246d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 05:24:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742300659; x=1742905459;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EDN4zD1N+DunuKV6N3O+L5YtWP/lxLEnoiHEUOXeOZo=;
 b=cMaNwBT8zCYMAHy8OXJ+2iqiX83t1KucObe8TjzzEUeuB1obzcby3Og48p0ONfYUwH
 o65Ris9R6nt2oEPuKnh12LhIsqrGiGNLh8Jm4e4ZxtvOFrGE8gOutF8r/kwcNMZ0Q09F
 FkUAW1UwzMJKRWVfQKwsEPmipXe4x5Y4CA4R64Nw8qkISafrhrs6NjDPGwcNufbTBlg3
 ur1TFi8KQWJ92Qjoi3w9l2MJObQvvewhvR1kRqc4wrriWiO47EqBLrsD4MCKDqhlYZAV
 UfOk+yJ6+GfXQja4Rr1gzV7n5CE3WjME5F9T5iMPYl+miMbVp7l0okoHi83uM/30yE9R
 0rTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5b04VvpiL9XOUyQDLbFrFia0CqOBa2sgllHV7ixYW6KSmE8nA9dx8HUeZROneQKDLmMkE/lepjSw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1GIJK5d/rIqvYx0AD0TsRUkSqXDBaCXIUWbJqsofynZurQhoj
 +biT2lQDgz6B+YvaP+8wfAToPS9MeRdHWor537T89HlgveFkdGqi2f63sQemkRaTd+tmcZsTluT
 p4j3eA9aIaj+J4jqUHZDIcQeuyow7XExQiN2MYK6ZuNojePXZ9tgAFYBpjnjE8g4d+no=
X-Gm-Gg: ASbGncuM/k0jK0WFb3dViuv9yT1KYL/fLCAgAPuLBjwGcfQ9HKxQuEkjCo81Ov9KoBs
 yVbEI+LFfyMbuv+ed8CqZASmBZZ+J9QIDr8azUHJtdbPeozqnkLmBW6zH/FZoTnvZhxLzB7WbwD
 /zjm0VgjJ9SJrzKpY91egh3ZKtLFVJjdpjabWVppwwus1eJCazGqk/0ULcKKSqncnK5nNpo8+R8
 ejXovNicUaA750y+sQphN/u8ZjAYguuDWO/FI8kxw18j32AMTtsNLnYfuZ5vACRB1IA+2VzZkoE
 vVWrJ0tNQmh2J+/JFkR/3AxPUe/O7n9ixuhFmzmRQBH3wVm1TtAcci1aBBkkXoyoddltR/WCSiy
 1rRs=
X-Received: by 2002:a05:6214:21a9:b0:6d8:ada3:26c9 with SMTP id
 6a1803df08f44-6eaeaa4282emr238045626d6.10.1742300658861; 
 Tue, 18 Mar 2025 05:24:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPP6bwgBzTV1pHyJ776Y2OqHo+uHrhx19IfFmQmbn8H0Ej5qHdf7EgW3rLl5dPKhTFj/jdAQ==
X-Received: by 2002:a05:6214:21a9:b0:6d8:ada3:26c9 with SMTP id
 6a1803df08f44-6eaeaa4282emr238044836d6.10.1742300658446; 
 Tue, 18 Mar 2025 05:24:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30c3f1170dbsm19027101fa.64.2025.03.18.05.24.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 05:24:17 -0700 (PDT)
Date: Tue, 18 Mar 2025 14:24:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Leo Yan <leo.yan@linux.dev>, Kumar Gala <galak@codeaurora.org>,
 Andy Gross <agross@codeaurora.org>,
 "Ivan T. Ivanov" <ivan.ivanov@linaro.org>,
 Andy Gross <andy.gross@linaro.org>, Georgi Djakov <djakov@kernel.org>,
 David Heidelberg <david@ixit.cz>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 6/9] ARM: dts: qcom: apq8064 merge hw splinlock into
 corresponding syscon device
Message-ID: <5g5ni3xoeliy4xs7wlhjjeust32qerutt4tdkkdvgeisdvbc6d@shlkxbzsw3vw>
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
 <20250317-fix-nexus-4-v1-6-655c52e2ad97@oss.qualcomm.com>
 <579cd909-8a0f-4998-88a6-47073ecc0eae@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <579cd909-8a0f-4998-88a6-47073ecc0eae@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 9w5d3AyqrPOjgxAUIzwuXllGmYEgQ878
X-Proofpoint-GUID: 9w5d3AyqrPOjgxAUIzwuXllGmYEgQ878
X-Authority-Analysis: v=2.4 cv=G50cE8k5 c=1 sm=1 tr=0 ts=67d965f4 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=DJPKDmouk0REp9whk4oA:9 a=CjuIK1q_8ugA:10
 a=IFyWz7IVXAM99tgoijJH:22 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_06,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=677 phishscore=0 adultscore=0
 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503180092
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

On Tue, Mar 18, 2025 at 01:08:00PM +0100, Konrad Dybcio wrote:
> On 3/17/25 6:44 PM, Dmitry Baryshkov wrote:
> > Follow up the expected way of describing the SFPB hwspinlock and merge
> > hwspinlock node into corresponding syscon node, fixing several dt-schema
> > warnings.
> > 
> > Fixes: 24a9baf933dc ("ARM: dts: qcom: apq8064: Add hwmutex and SMEM nodes")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 11 +++--------
> >  1 file changed, 3 insertions(+), 8 deletions(-)
> > 
> > diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> > index ba99e794dcd2236f65f2f3d8c49213cfdaee5f6e..3728875a5506397b36a4c0d6a5ad12c067bbdd8c 100644
> > --- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> > +++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> > @@ -213,12 +213,6 @@ sleep_clk: sleep_clk {
> >  		};
> >  	};
> >  
> > -	sfpb_mutex: hwmutex {
> > -		compatible = "qcom,sfpb-mutex";
> > -		syscon = <&sfpb_wrapper_mutex 0x604 0x4>;
> > -		#hwlock-cells = <1>;
> > -	};
> > -
> >  	smem {
> >  		compatible = "qcom,smem";
> >  		memory-region = <&smem_region>;
> > @@ -305,9 +299,10 @@ tlmm_pinmux: pinctrl@800000 {
> >  			pinctrl-0 = <&ps_hold_default_state>;
> >  		};
> >  
> > -		sfpb_wrapper_mutex: syscon@1200000 {
> > -			compatible = "syscon";
> > +		sfpb_mutex: hwmutex@1200000 {
> > +			compatible = "qcom,sfpb-mutex";
> >  			reg = <0x01200000 0x8000>;
> 
> The mutex is at +0x600

Indeed...

-- 
With best wishes
Dmitry
