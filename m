Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5B1BA5618
	for <lists+dri-devel@lfdr.de>; Sat, 27 Sep 2025 01:26:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA64A10E0B9;
	Fri, 26 Sep 2025 23:26:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gtqeWwSd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1096710E0B9
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 23:26:55 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QEWqdn015964
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 23:26:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Vbe6hp57G+HSySRoh4rYc9OrCcfMPf0ZIXVK+DUyT9A=; b=gtqeWwSdlsxOu2Qy
 QRhQwVeigZSgtwbajicf/TtJlq7uM46vLQdRfoFNrblexGWhlo+qoDl2+R5Hr+Pi
 5qn2bTAYj4S0jeHCdc+qrIDs2igoAfgD1OPYjpZgx4d8Ki/T/IOvTJYh5cN0/gI7
 pmZsg52zHv41hHErD/k4grSDJopR7QgNyvLx23BKn/G91rbiaEqNnfWEgy6e7d1S
 JorGKR4QVoIKfhG3CqptWdZh4dukWp5bVtzdUQ6FruUPEAwRU0cCD6dbj/7naolg
 NEeor/QbWW8hTOm3lo2YGATQTx82diR2p6Z+3j8rmaO0B6Dc7STWaYPdHCenCYNG
 m5oonw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0u4cw5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 23:26:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4d77ae03937so74074841cf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 16:26:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758929213; x=1759534013;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vbe6hp57G+HSySRoh4rYc9OrCcfMPf0ZIXVK+DUyT9A=;
 b=c+b9bTctzxgaEPcpGVbLtbdSYUsFRZC1QqZJ4nwpchZx7Uz3y6zAFFzuYWzXb19bHZ
 jrbrlx5cyRuHWtDaFAwTkJ2CrVdToodvXXTkMerpmK4tWqWfowAoF20KI7CRIf9xn528
 o96qaghigI4vnlbWhHkwSCTiRmSMlUSvMAXOT+Jt/ws51xxHdDsK110+sBXEyJSFm9aF
 0jHeoraXQuynj8gcRnFhZKiXDSNdo9zspY75v1NK0UOAqugyBYv6H1rkpOGyD/QFZCXh
 zL/wWvQAnwWdBWdeR/j3hJMgXD9h3Uv9HuVRH56fUPTqTa88N/yDZmUD+vLci2jmcHSC
 POwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcTH2zW5akYq9bCDB+O+thb0u3jGSgarcS8uq75XWpqYXkAm51rJoS4vHEZ5a7pUExcC8PblS0BVo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxe13x7ahx5jnGkOSF3byfRiF8dM7HjcFbMViTou5vdIAx094+O
 NoWnL4fmzDS4uVaNdf5/+qZFM/C3Ug1grHdbJYUyS5yMmo4Tk3XGYFaRPJ2LPoha3IRWmLt5u7x
 u8CxYfzoVIqsSP7WzHuO9H5Gs6WxvhUQe/jP8zqOk3VCqAmh/xa5/SJZpbRZZr7yubsLrcfg=
X-Gm-Gg: ASbGncsstowdl+aT8pzlNC53zbZD3CUcyKZoNoxo+V4jwXBPPk2cm2NMgRU4Gq87bhb
 KylXob2qx4KqtQ5rPaTcGMA5SS+pNGg4ceoFqGa3WV7QSQd0EVXfyQI5BCubCBh5/a3cCk7Bg1X
 N4Z7Z5Scn7T+k/BjJIEfKaDOSVDQPCnWhzPxlrx8CyI2VIM6/lx0ShLs9QSnkWfoLRqVWFGdRjJ
 tLJpecX+CBmUPVPiHMpYHzPxmY5eNzZBNh37AvhvC511n2LkDY6mC24ANUE856/caflG9uVhWOC
 NblYpBEhtx8TeTh0GN8grdp3zZv3WS13XkG8iz1eAEzsqkl62zzzlT4mHIiBzDgjjb9Q2wHn5iN
 VE3HtsK9r1mlwJEqM0PrnS0yXPyG7uvP1JthRFaVaJqdcUCPoDH82
X-Received: by 2002:a05:622a:6a45:b0:4db:ca19:ee9c with SMTP id
 d75a77b69052e-4dbca19f128mr66939001cf.33.1758929213188; 
 Fri, 26 Sep 2025 16:26:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELrJY8dwk3DsAMV5wvPN2YoyXnuflBYxBuOtpwI7/6SG4aQ0Rj1J4QizyTejJRTJ0k/z72TQ==
X-Received: by 2002:a05:622a:6a45:b0:4db:ca19:ee9c with SMTP id
 d75a77b69052e-4dbca19f128mr66938841cf.33.1758929212731; 
 Fri, 26 Sep 2025 16:26:52 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-583139fb153sm2159779e87.46.2025.09.26.16.26.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 16:26:50 -0700 (PDT)
Date: Sat, 27 Sep 2025 02:26:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
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
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 3/5] dt-bindings: display/msm: Document MDSS on QCS8300
Message-ID: <rkuihu3pmhexeahfch6j7bvwn5rn4ecccbhamluh7fas5qgaup@av2foeiwmcz3>
References: <20250911-qcs8300_mdss-v12-0-5f7d076e2b81@oss.qualcomm.com>
 <20250911-qcs8300_mdss-v12-3-5f7d076e2b81@oss.qualcomm.com>
 <20250918-spectral-seahorse-of-witchcraft-69553c@kuoka>
 <b745c515-2264-42aa-8d92-663efc7f6276@oss.qualcomm.com>
 <6c195b42-d994-4d24-9c40-48d8069304e3@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6c195b42-d994-4d24-9c40-48d8069304e3@kernel.org>
X-Proofpoint-GUID: rrHa5_60i2biYs_SG8OW0inMM8J2mvm2
X-Authority-Analysis: v=2.4 cv=PYXyRyhd c=1 sm=1 tr=0 ts=68d7213e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=VWPR2QegcKdD6PkuNicA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfXyFCRYdOZmXQ5
 hxxt81rb+R6cqu2/DDB79FqRmgvQc6yce8G0RZyGzEH3Y9JbAHMgpTG3itdfUP20KWsYWBrXg/i
 pvtLReNlerNWHOpbqxpFmyYMNetysbJV6iQnbftwj6qVa0+4wpM+8Lzg+OEw8KFBCkUq5IWPxhx
 RAD9AYm9O1EUdjxt1IW/LTpoxYQk+ASV23G/Nywirbwi139Vlz10qXYPJZ6cb1/LYCJC7RKYGze
 gC0nwF15GMIggFZ08mrz2+h2Xde4kjdMzN3s79ZfvKp78ze8gvcphrN6DSw0lNR72mPx4WcYZES
 r1fn9DnbXVdhkZYS0b30qSjW8H2DjzhPrUHLbDMlUvEEZXdM4TTMfMAeErEOSQ1sRQjDxV85MYW
 KDi9kZFQNIQg8lDXD/6+dpZ6frtNfA==
X-Proofpoint-ORIG-GUID: rrHa5_60i2biYs_SG8OW0inMM8J2mvm2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_08,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
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

On Fri, Sep 19, 2025 at 01:34:39PM +0900, Krzysztof Kozlowski wrote:
> On 18/09/2025 13:14, Yongxing Mou wrote:
> > 
> > 
> > On 9/18/2025 9:01 AM, Krzysztof Kozlowski wrote:
> >> On Thu, Sep 11, 2025 at 07:24:03PM +0800, Yongxing Mou wrote:
> >>> Document the MDSS hardware found on the Qualcomm QCS8300 platform.
> >>>
> >>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> >>
> >> Patch v11 and still basic issues. I am very dissapointed.
> >>
> >> <form letter>
> >> This is a friendly reminder during the review process.
> >>
> >> It looks like you received a tag and forgot to add it.
> >>
> >> If you do not know the process, here is a short explanation:
> >> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
> >> versions of patchset, under or above your Signed-off-by tag, unless
> >> patch changed significantly (e.g. new properties added to the DT
> >> bindings). Tag is "received", when provided in a message replied to you
> >> on the mailing list. Tools like b4 can help here. However, there's no
> >> need to repost patches *only* to add the tags. The upstream maintainer
> >> will do that for tags received on the version they apply.
> >>
> >> Please read:
> >> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
> >>
> >> If a tag was not added on purpose, please state why and what changed.
> >> </form letter>
> >>
> >> Best regards,
> >> Krzysztof
> >>
> > Hi,
> > Sorry for the confusion. I did intend to remove the Reviewed-by tag, and 
> > I mentioned this in the cover letter, but maybe explanation in 
> > cover-letter was probe not clear at all.
> > 
> > This patch includes three changes:
> > 
> > 1.In the displayport-controller compatible property, "items" was changed 
> > to "contains".
> > 2.Use "qcom,sa8775p-dp" as fallback.
> > 
> > These changes might not be considered significant. So I’ll be more 
> > careful next time. Thanks~
> 
> 
> I really do not expect v12 to receive so significant changes in the
> first place. If you keep sending us buggy code, which then you keep
> changing after review, I will just not do the review. It's easier for me
> to wait for v20...

I'm not sure how to react to this missage. The changes reflect the
process in other patchsets and in my understanding on how to describe
the particular hardware block. The changes were reflected in the
changelog. If you plan to review this patchset once you get back from
your vacation, that's fine. If you don't plan to, I can ask Yongxing to
send v20 just for that number.

-- 
With best wishes
Dmitry
