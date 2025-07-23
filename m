Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 561BEB0F2D5
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 15:03:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD37F10E7C8;
	Wed, 23 Jul 2025 13:03:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TMIodODB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F86C10E7C2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 13:03:17 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9F5VP021749
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 13:03:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=HFQXzphQuSnwMWSCOzGzS0tR
 CSVlyDO4GAoV1UJnlAM=; b=TMIodODBr50HYsW3q7fVLc0cNlu/rVO8GRCYhzJx
 eVCOne+qNIuwo2L4P5jT3B2pNxH6NdvxAvAUTDKOMcJmcVWMplguDvbNQpclLixh
 TBphMA1DVNlelKWmJ3yh9qHPCJE9g2b1rAM9l7uV6hAwWCP+p1YPZI4uUR85R3Mt
 f32PQd9dctZA4MTXWEnutWFDVqQ2kiNqi9cy9uga2zBsfAo2EgdNi5sq8R/ZorMB
 uMS9F9N6kp7euZL9hBHw0Egf7jp3WGk/r7zsc0ic3Hc0IarBDRvqxbtNzR8iBbc5
 G5kW+SZWrMJhMkK2bpxkd09OS82lT++gRvWnFpCByCIylA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481g3er0k8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 13:03:16 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b3510c0cfc7so4616630a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 06:03:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753275795; x=1753880595;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HFQXzphQuSnwMWSCOzGzS0tRCSVlyDO4GAoV1UJnlAM=;
 b=BtlVFsHkVaARhb3OVX3oyzglApq18RdKMjZDRhYxRbxU19SD17soqWqXRnaREugYni
 s0sLoxnugyhCnX/8BIlCcuMs7kd8MJ7Bp4ueas1icr/5uJlXhLLT3Sy26/gciNIOUaOY
 ZQZS5rpv3irpcDTU3q6Tgq4Q05gHNgdPD41EFcA9AGP7DJSkB0iIiBPY17a4bb4qh1Da
 tDDU8riBFegxT86rKcxAHa9dUZos7xq2/EqU47U5+gBdbq1xkCrE4HgDBZs7C54S7w3P
 jzOlU5rcaR2H6sDgfay9p4G7wu2QCJsza5D1pENJXdPktwBqd+uyKse0D1YkQLTcnDPx
 czmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFOrLcllVhlFnib4lwVODQKa7YfVvPNh4aTSWukzIVFxGowTmLzCjxYb6YMrHDXtvAeZsjO2b63t0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKyioMRwv62g+SrlL2fu64cZy8l+xLY+5PNGnJeVzQDZbL3qZh
 IXKXfXUWhpMgSEH34Kl6ZwXSuVOQvPUGCoLuvZLJmk2wlA2mdOVjg359gyIejggZQ03h1fG60cx
 EeTUza+ihdK6K4vgNrfgM8lTvfSXL1cFoNAS4xXRv2M4hQbwv/AoA1yBshNNbKg5zH4CO7Kk=
X-Gm-Gg: ASbGncss4kec380QpGlPQ3YDIDDbOrQs7Sr81Fnv5n3bRmdfaE7z1bcOvFQYxtY034M
 5Aj/n1aMK+9P9zBKMXPz3KfZLG6lBtBDqXEH2QHCkxkE2t0b8BWpTxfLubCRCUvMqvffFFLGu6Q
 0+wIwB+Dzp2+rc4ieJhwMdPm0Q1/N8aq9MwFKAHPxyQeZ3rYut5upa5CaiM9vk+JvJOeOxrnfRj
 ge/BqttdokcHXsezJZ3I8zTUPl1ngG2UAHNMCQJnL0mHNvvQaoOmJ1J0r4mzsV7/oJC6f6x4WQ2
 vEiR3X6dZKqjdIeAz1M1wiqQ1Ok/ie8HvRHJcaQg9sqiTLc0aiqetnx1o0lgEGPmt0ilC1ifPXk
 r1Jn5pSj/nC+eCoNGnbMNPLtzJMoo1Vhse08XDHH/kwl+fg1d3NXx
X-Received: by 2002:a05:6a20:938c:b0:237:c17f:9813 with SMTP id
 adf61e73a8af0-23d49122377mr4530000637.28.1753275793972; 
 Wed, 23 Jul 2025 06:03:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFDmJryhdzdFntFB7Y2SSkvALhrP5nnK2pjFKNUd1foxAq5uu1XUGR7+ZT77bYOMHIDv5jdw==
X-Received: by 2002:a05:6a20:938c:b0:237:c17f:9813 with SMTP id
 adf61e73a8af0-23d49122377mr4529923637.28.1753275793474; 
 Wed, 23 Jul 2025 06:03:13 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a31ab0fe9sm2317001e87.80.2025.07.23.06.03.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 06:03:12 -0700 (PDT)
Date: Wed, 23 Jul 2025 16:03:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: ubwc: provide no-UBWC configuration
Message-ID: <3qlbyt3n6cmrrsh7srbxqwczf73mgd63embvlqvyugop4t7vxl@w367alhkh7zy>
References: <20250706-ubwc-no-ubwc-v1-1-e39552aa04df@oss.qualcomm.com>
 <DBJG7C0L3EFP.BOWGHS7WB4RM@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DBJG7C0L3EFP.BOWGHS7WB4RM@fairphone.com>
X-Proofpoint-ORIG-GUID: s2sOrvgI5rYjpMNr23ivICpDteVojedg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDExMiBTYWx0ZWRfX58zREVo9e2P5
 ZFbHO+PHP7XlOmRMsjOlWtdLUr85sM9BhaMFkG7lbr+5SwFvRtbk3ftrf3ovLryQK8bO5t7GALm
 vCnyDwqJ/+oq9CtCqonDHrg1BBpmfpM5YxF+5dQF/RPBTo88PAaCXdOwt/bqUp/IgeBrJBYWOQB
 m6VcCagts16t7apBlPsZiLiXDCQsuqC9felh3HeTYr080OqzlTtKNzAYag6lJWaQ/ZMGPpeqThw
 9Pn0R4JRMzaN9uAHvVqBNYaf3D2GDvATQ3iqEo+gl0C6SIf64TwPoW35E7EWs7iTl062lT7TWKh
 AvUiHT8CRxNb3kKjuZIAodvBYbqNNUGdOnxiaNZIo1nV0o9l1+rgAZxxSU8xv7W8zBJNMs7OO8G
 FVyW6CHzOK/i2G1Jsg4JKfAXygoO/ZURwN/2HAGApRC19mzsGNgnw6QASe5mwZYtW56GH/dI
X-Authority-Analysis: v=2.4 cv=Q+fS452a c=1 sm=1 tr=0 ts=6880dd94 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=EqyKFdb9TEg4igYaHI8A:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: s2sOrvgI5rYjpMNr23ivICpDteVojedg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230112
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

On Wed, Jul 23, 2025 at 02:54:04PM +0200, Luca Weiss wrote:
> On Sun Jul 6, 2025 at 1:01 PM CEST, Dmitry Baryshkov wrote:
> > After the commit 45a2974157d2 ("drm/msm: Use the central UBWC config
> > database") the MDSS driver errors out if UBWC database didn't provide it
> > with the UBWC configuration. Make UBWC database return zero data for
> > MSM8916 / APQ8016, MSM8974 / APQ8074, MSM8226 and MSM8939.
> >
> > Fixes: 1924272b9ce1 ("soc: qcom: Add UBWC config provider")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> > Note: the driver is a part of drivers/soc, but as it got merged through
> > drm/msm tree, this fix should also go through the drm/msm tree.
> > ---
> >  drivers/soc/qcom/ubwc_config.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
> > index bd0a98aad9f3b222abcf0a7af85a318caffa9841..df074520a8cae1a202a14ca094903bb1e7389066 100644
> > --- a/drivers/soc/qcom/ubwc_config.c
> > +++ b/drivers/soc/qcom/ubwc_config.c
> > @@ -12,6 +12,10 @@
> >  
> >  #include <linux/soc/qcom/ubwc.h>
> >  
> > +static const struct qcom_ubwc_cfg_data no_ubwc_data = {
> > +	/* no UBWC, no HBB */
> > +};
> > +
> >  static const struct qcom_ubwc_cfg_data msm8937_data = {
> >  	.ubwc_enc_version = UBWC_1_0,
> >  	.ubwc_dec_version = UBWC_1_0,
> > @@ -215,11 +219,17 @@ static const struct qcom_ubwc_cfg_data x1e80100_data = {
> >  };
> >  
> >  static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
> > +	{ .compatible = "qcom,apq8016", .data = &no_ubwc_data },
> 
> Isn't also qcom,apq8026 missing here? Not sure there's any more
> missing...

Yes...

> 
> Regards
> Luca
> 
> > +	{ .compatible = "qcom,apq8074", .data = &no_ubwc_data },
> >  	{ .compatible = "qcom,apq8096", .data = &msm8998_data },
> > +	{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },
> > +	{ .compatible = "qcom,msm8916", .data = &no_ubwc_data },
> >  	{ .compatible = "qcom,msm8917", .data = &msm8937_data },
> >  	{ .compatible = "qcom,msm8937", .data = &msm8937_data },
> > +	{ .compatible = "qcom,msm8939", .data = &no_ubwc_data },
> >  	{ .compatible = "qcom,msm8953", .data = &msm8937_data },
> >  	{ .compatible = "qcom,msm8956", .data = &msm8937_data },
> > +	{ .compatible = "qcom,msm8974", .data = &no_ubwc_data },
> >  	{ .compatible = "qcom,msm8976", .data = &msm8937_data },
> >  	{ .compatible = "qcom,msm8996", .data = &msm8998_data },
> >  	{ .compatible = "qcom,msm8998", .data = &msm8998_data },
> >
> > ---
> > base-commit: 8290d37ad2b087bbcfe65fa5bcaf260e184b250a
> > change-id: 20250706-ubwc-no-ubwc-3c5919273e03
> >
> > Best regards,
> 

-- 
With best wishes
Dmitry
