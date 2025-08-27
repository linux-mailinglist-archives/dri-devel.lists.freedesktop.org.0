Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A55B38788
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 18:12:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4D1310E868;
	Wed, 27 Aug 2025 16:12:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="S2tooOSH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CE7D10E868
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 16:12:18 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57R6kBxm029013
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 16:12:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UG7xbcS5Tii6txkMjvrtxmVb1b0CdEdYm68Ud4Hqmfw=; b=S2tooOSHVLC5jxH+
 5USDj1+Mi/aN5PSszo1VkCxJsEZp/x2NNSseIlr8mFtMLZt2Z9bTIhx43UIJwMI8
 XuSGehcUGTpAOnkZNGFpS7iyGXS8sDO0lS/DWDLX0Tn0fCOhNEzdbeFX/lvP0vh6
 aRnaZg1Rrbby+gHpjcSypvx1yjLPXcrNCOOGhalKV+MKRAsoSICM4WC9Ka5aiWZS
 ElUMcr2afmOO+pnp4wlqhwDeVQrUke27BL9fjUqiWiPlNML/Oda7a91QpfD1twCt
 Atn0miSKh6FSqzz832FzCbmbnd1CyqRCosKWTC4SYhjU98z8E7SSeezbCp/lvdub
 ZGo2Yg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5umdcaq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 16:12:18 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70db892e7b2so1641076d6.1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 09:12:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756311137; x=1756915937;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UG7xbcS5Tii6txkMjvrtxmVb1b0CdEdYm68Ud4Hqmfw=;
 b=D0dxMbobsDfLIaRyGWouQiPlzj6qI6d9568gM/eVhaPfe8rneoWbVmAsXBKI8LBOXm
 gbdXT5TkTZfGEomI5SEuefX+2nZHRUzoQ9nuMtLGVRDHTSJn0WEp/Tg5SCwJEMqiT5u1
 L8rvDBV5fkuck46TA79HPLnsHQLEtZUl3UeKtkCXJr9wri/9AeFDD5+ZJsWMOLQ+gmZ6
 qVaR07p9mviROovqcOkBcSM/JNIfCpKycGEITBg3Bawy1Bur3IfeX6DHf/O/bHFppjhr
 i3AF9/0YGvyQti0K1Z1S1UaO4Q/kEYAdUaZQ4t0ytupN4Dx31t3ixjN4464hwQS3fVd0
 h7Lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVG4O0vRT2aoI4N3USmlKK+NsYSknlnqd9pO8xuKoeAQ3IrEoYhbhnjwbzsM7mrcj2Qm3FATaY9Apw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz21SLIXKmokhxppglLFtlRodcOqFlBRx7AOqLw8w0NsSGWDyDS
 ybgNUstNWd9JYsuR87QS93eP3fPJl/TB3vqA1hT4QV7jdAJitDRZ7gc0xxf+KMcSd9ukmf+NyUN
 NoIsvgCZ7z5lIX0Z11l47zFxmcSIBp+llk1AWeY+cV5hBXuEQp6DyIhDYDSGgA7ss2ox+pXo=
X-Gm-Gg: ASbGnctlvTKx5uj/V0mzc2VhCbncL47yh1S1sN1a/eVyP9rb7hDUMZxqMzOshWZ3kbU
 UhAfXR6dDXeL1T3g3fLXUtdH4zp68xAHA4utCXT892xyQuwdVZYF5MwM8UiRKPRkuXckkKezgL3
 fBvvSxMSvmLTluGcVWUJQ9+RsPKn8QoGKzJRBBjONxws3xXTsTpSaNny1a1csx9MU1fLYNHKooV
 vxDrn7zlbAxZS30lY8XZcDZ/R/l0/t/25i+OrJcu1iLrTacr3iqDrjOVd4Ettng/RtANrexsMj0
 dsCOBh/2Wnc2LmgAkcp3Xla4lIpZQXNuiU0cIcEVf8iHVo8T2WStlTWIAH+FpuBqdjDKY4L3ooH
 LuUNeQwXXy73tbiA+Jfm8GoPNL2I0+sMcrUhv8bLXE+Sh7VGp+OhE
X-Received: by 2002:a05:6214:20e6:b0:70b:acef:3c85 with SMTP id
 6a1803df08f44-70d970976d8mr247393276d6.4.1756311136359; 
 Wed, 27 Aug 2025 09:12:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtHCsOyM9I3rbi3EujqFjTjTxiDfCaPiXddil+SIYuI0DqIfUpa9RqPP6k9YnaNKG73ul6bw==
X-Received: by 2002:a05:6214:20e6:b0:70b:acef:3c85 with SMTP id
 6a1803df08f44-70d970976d8mr247392546d6.4.1756311135723; 
 Wed, 27 Aug 2025 09:12:15 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35ca7437sm2866204e87.146.2025.08.27.09.12.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Aug 2025 09:12:14 -0700 (PDT)
Date: Wed, 27 Aug 2025 19:12:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, quic_lliu6@quicinc.com
Subject: Re: [PATCH v3 09/14] phy: qcom: qmp-usbc: Add DP PHY ops for USB/DP
 switchable Type-C PHYs
Message-ID: <hy66bjkygfz2qdhatdyxpw2cktaeohguwdg3ydowubarqebfzr@2rjjxghmhdya>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-9-a43bd25ec39c@oss.qualcomm.com>
 <3pr7ninjxr4pgsz56dr6ojjmx27fzzszmtt6mx4r6qaqt25tnc@nrgx5qiqc7z4>
 <9bf7f51b-dcfb-4ff8-848e-dcf144936f2e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9bf7f51b-dcfb-4ff8-848e-dcf144936f2e@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68af2e62 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=D5wNQ9JKZfep0icmKmAA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX2tP2nV9xDETY
 p1iOFCrUfyPVBIqZL7tJniHCozBqCP/Ddkny/Kjr5BhualhVqwHoW6sjjsDuQLneIVqcYeUgwNt
 teku2G8lY74b0YfA6nYon8ngqhNDo6NNgt83sfqtPiuarbOW29DNfy5zTbx43kKDTQIfEtio1u+
 5TvEXGZue5JIm2ANrps4HUG6THXwQouw9bRe2EMbSkKlWnvHynKk5UIm4ZBTnK1oCjVcVo9p4/p
 TwLJmtE26zeKhnP+0y7TJNDEeHvoCj5rfxXA6vL+vhvHtVCqI228pj+NRuzAYskPdHGj+l0s1Bp
 HKw+71wMaQbcCcs1dDLImhUJXMeOZ2g2a2/iENqt2gMFrivcmMpQr9xSKkvqb3YsBiqYjP1jbUe
 jKz8xJ9i
X-Proofpoint-GUID: L_N-djwJph6d68NBYmRQDzY9oTnOnn3H
X-Proofpoint-ORIG-GUID: L_N-djwJph6d68NBYmRQDzY9oTnOnn3H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_04,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032
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

On Wed, Aug 27, 2025 at 08:17:39PM +0800, Xiangxu Yin wrote:
> 
> On 8/20/2025 7:45 PM, Dmitry Baryshkov wrote:
> > On Wed, Aug 20, 2025 at 05:34:51PM +0800, Xiangxu Yin wrote:
> >> Define qmp_usbc_dp_phy_ops struct to support DP mode on USB/DP
> >> switchable PHYs.
> >>
> >> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> >> ---
> >>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 163 +++++++++++++++++++++++++++++++
> >>  1 file changed, 163 insertions(+)
> >>
> >> @@ -1095,6 +1248,16 @@ static const struct phy_ops qmp_usbc_usb_phy_ops = {
> >>  	.owner		= THIS_MODULE,
> >>  };
> >>  
> >> +static const struct phy_ops qmp_usbc_dp_phy_ops = {
> > Please try restructuring your patches so that there are no unused
> > warnings in the middle of the series. You can split the next patch into
> > 'parse' and 'enable' parts, then squash this patch into the 'enable'
> > one.
> 
> 
> You mean it's better to define and register new functions in the same patch 
> 
> where they're first used, to avoid unused warnings? And for things like parse_dt and phy_ops,
> 
> it's fine to split them into separate patches if each part is used right away?

Yes.

> 
> 
> >
> >> +	.init		= qmp_usbc_dp_enable,
> >> +	.exit		= qmp_usbc_dp_disable,
> >> +	.configure	= qmp_usbc_dp_configure,
> >> +	.calibrate	= qmp_usbc_dp_calibrate,
> >> +	.power_on	= qmp_usbc_dp_power_on,
> >> +	.power_off	= qmp_usbc_dp_power_off,
> >> +	.owner		= THIS_MODULE,
> >> +};
> >> +
> >>  static void qmp_usbc_enable_autonomous_mode(struct qmp_usbc *qmp)
> >>  {
> >>  	const struct qmp_phy_cfg *cfg = qmp->cfg;
> >>
> >> -- 
> >> 2.34.1
> >>

-- 
With best wishes
Dmitry
