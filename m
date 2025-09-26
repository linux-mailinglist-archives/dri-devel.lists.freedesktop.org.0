Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0442BA4077
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 16:05:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 184ED10EA71;
	Fri, 26 Sep 2025 14:05:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LT6uGOFX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C439A10E0A8
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 14:05:46 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QBb8Sl003270
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 14:05:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=584nrbDAdLBURaO0cgXzCKXy
 eOmRtZu/VSbhHT0wC+M=; b=LT6uGOFX0SR1QZQJx9bkXdGg/dXzjHdSfKJWmOwi
 ljGQn5xCogB1rQaZbF7TQjvv7rqySxM4f8vz4W6EG0xvvsZZrHZ9+SGW+CAxZouq
 jbIx+2yFc+TajvJYxuLkLkwq2r4AlML6lXHXq58vVNXIwulwRXy8K3dcrc5kAXs+
 bOSMYW4IoVT3BYgfwM5/aIuqPlfz5yfZrMNrlcqI/0JNMYRVd5jjoTX9FyXjEvgw
 +Ffqrkn8clA6GSCPx8HXzIAiH3F9NFhxq/nq6j4rNwCSs7yAO6X9WiITkQYpY45h
 lu4DSs0+DyP9uSx+QdYxo91+dHCp/jQYgSKX+pR25euFjA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49dt3g8c1c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 14:05:45 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4dd932741cfso17633741cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 07:05:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758895545; x=1759500345;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=584nrbDAdLBURaO0cgXzCKXyeOmRtZu/VSbhHT0wC+M=;
 b=M1lrHLdZWSZ4pxHK609ooQ3K8AygIQDiM18wEj2msZuzsHVSp2dG6SvPmHdR8BYtJz
 0BkXsB+llOdPXmsZ6KdkqW7MKMpGZ8QwGONB4oAcelFLqC+4rkXB8zNF3yub0fDbZYmc
 dpRBw1ldfRAmQsDXBr5VWGVPdfNFcgAgpFaiW1ey/xnJCtMQaxMO8Kt5CdbCYGtHT2kp
 OO760OP2volGs2lC0XMVJpB0VEuOTeZSE0DLd0xhTRTpv33/rql3fIp/N/M6rcbapsAw
 r9PYGIX5IJF/PQxWk9JTMsbSLgNjJRloEVgzxxVw4PVEr1xpksxDoWUlLgRJdrE3tDxJ
 brhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4s4dSee9p3TRb2Oh9SYYUWAgw74+wHq0U4Xggv87nf0igJvs7F2cMw3WVu9oqYKdwEx8xq8Dsw54=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKQQgWOEc9sd6x+gKZikmMdqXyo4sLMGM1d2gxqnxdvtYGfQHe
 GdJHaj8xWSH4ekqkyUL57LNASFe6bXyF/gwzlUUc+5FdvP3CptpJbwJIwKHD9PQegTQhHHASQdV
 ZLvCI9WyUErJ2cxirCtKeZJDXPkO+12jWDt5VP4zihhVjJeFEYZxcSYH8CmoW6kal49ZwNhY=
X-Gm-Gg: ASbGncuqfAH4cK0iO1+zRej3Q69uc4gjo5D9k0sr7JmSYKAllbWo0pytluMgBuK2Vdi
 2os9ungB/3odfMKlqvkwabSFm4wtTmElkrsSc3DbonlZwtLDZ3MS2ztHvOd4HdZ3wuKLLXDt63i
 1BFELF3Y3vy6apR7cjalt9k3ico8kQ4Fo5Ic6i6Q1bJEenihwxHcbv2bzAKSmHlkchyME4EH8DZ
 pH0nrxcoCojvnqqeUiMKNifVw1Sw/txds3+hZHz4bs1JC8dVWpzMVhDhIgjk8KUhFrg+DAnLa8b
 e3hbDWtDq0mipi9TG8wdGm3Nz0shBT3npC5kb9YYFYp3lImiDCu7YF4k2iWsEyLkeXi697Pd5Pz
 pvgkgdUpbJ8jhTFQ8fm1NQjYMdz1PHvkav1EPf4DX73F1Ok3hdtLi
X-Received: by 2002:a05:622a:768f:b0:4db:dd57:e093 with SMTP id
 d75a77b69052e-4dbdd57fb69mr58371521cf.51.1758895544716; 
 Fri, 26 Sep 2025 07:05:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHltJA6GbWIV/+igvGWnl22Iv/P1bx9gnuRDpBgQL59uVz2fnVyjK+CDBIlVIjHHYtcOin3WA==
X-Received: by 2002:a05:622a:768f:b0:4db:dd57:e093 with SMTP id
 d75a77b69052e-4dbdd57fb69mr58370611cf.51.1758895543827; 
 Fri, 26 Sep 2025 07:05:43 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-36fb7710256sm12274671fa.45.2025.09.26.07.05.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 07:05:42 -0700 (PDT)
Date: Fri, 26 Sep 2025 17:05:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com, quic_jesszhan@quicinc.com
Subject: Re: [PATCH 2/3] arm64: dts: qcom: qcs8300: add Display Serial
 Interface device nodes
Message-ID: <5irzdmwxs2j4ppti35hc5235yxqq576doerrrk6fhcpj7f726a@eh5rl2jwb5kg>
References: <20250925053602.4105329-1-quic_amakhija@quicinc.com>
 <20250925053602.4105329-3-quic_amakhija@quicinc.com>
 <vsty7sy7gi2eeyifokwcqpoycmarxietkijmlkymwrmzmdsfws@x64f4ulbc6ja>
 <8c248bf8-2f25-443d-a08f-6504c349b72b@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c248bf8-2f25-443d-a08f-6504c349b72b@quicinc.com>
X-Authority-Analysis: v=2.4 cv=df6NHHXe c=1 sm=1 tr=0 ts=68d69db9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=fWuQbBWbtaeYDtlrs1EA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: qRlmnLIL6doLrVunIi9qWnjxCNa8AeY-
X-Proofpoint-GUID: qRlmnLIL6doLrVunIi9qWnjxCNa8AeY-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDEwNiBTYWx0ZWRfXw9YyLoegzK/D
 aJgcZjLgBd5oBJFLQrXASljnD8idnzSVVcNCmRMV4x5XLH0yrHvVElBYIaDRwOHNci/PQk3T2T9
 GZp5RPVgCSF0Ut5PxyklDIgREEv72qyTPoSU6DsH4dufUcjvllpP8lYcWskaOgjaBkgE8EOyd9S
 4G2lHIgvM5pmc7veV/GXKqyeW36Zlx6QPJ6bKuNTKgQI2CNFcox9cXdWcjv0sNjI5FoP8kSqoe2
 4thrULJeKDS1vzHuYxO30Y2wwMP1FvWeDbZDBMYsFAGvgfEBeNMgwq5IDezgoVzBV2bwl5wkFY2
 /7OpIRZI+MJ6+Vhm9R2kx9cyTikZmOc6CiIs1W6h1XIBPSlEyZfpmCWE0aVV8clZH/4+s47CE0L
 daVVXCHVDID09fwKc+ciWgI9Zsua3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_04,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509260106
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

On Fri, Sep 26, 2025 at 02:55:19PM +0530, Ayushi Makhija wrote:
> On 9/26/2025 3:32 AM, Dmitry Baryshkov wrote:
> > On Thu, Sep 25, 2025 at 11:06:01AM +0530, Ayushi Makhija wrote:
> >> Add device tree nodes for the DSI0 controller with their corresponding
> >> PHY found on Qualcomm QCS8300 SoC.
> >>
> >> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 95 ++++++++++++++++++++++++++-
> >>  1 file changed, 94 insertions(+), 1 deletion(-)
> >>
> >> +
> >> +			mdss_dsi0_phy: phy@ae94400 {
> >> +				compatible = "qcom,sa8775p-dsi-phy-5nm";
> > 
> > Add qcs8300-specific compatible and use sa8775p as a fallback
> > 
> 
> Hi Dmitry,
> 
> I have one doubt, even though the ctrl and phy versions for sa8775p(LeMans) and qcs8300(Monaco) are same.
> Why can't we use the same compatible string that we have used for LeMans ctrl and phy ? what is the need to define a separate
> compatible string for monaco ctrl and phy ?

Konrad responded with the reason. But also, this question should have
been asked when you took a first look at the qcom,qcs8300-mdss.yaml.
It has two compats for DPU, DP and eDP PHY blocks (for exactly the same
reason).

-- 
With best wishes
Dmitry
