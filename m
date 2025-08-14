Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1593EB260D5
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 11:27:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8163310E0A2;
	Thu, 14 Aug 2025 09:27:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oBLjGASS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9158510E0A2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 09:27:16 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E9CAAb028898
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 09:27:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=zvxCWSRBlZv5hDIRk34myOM8
 a1Wew5iutKQ7yJWvhmc=; b=oBLjGASSkhi5Jx8pEoMRu8jNPs+eaB126S8Gjm3X
 KdDVYScRqmwQidLE5b7vEvkYaf/ckR6NA4AXwrJhSayXjTcSUyQbXixsLFGHHS1V
 kuTV4/iOsA/Um0A82sgfwGsAk1wrV0b6MayHVJNjms8MT9UwJAz/wivsewOl4Cc0
 vVZmFIN420+NFp7rHESUjcGEciqdNVlTZoCnumRrAPm7h7arbtwyvCFM1Tb4Ic2r
 G1xh69Dlz5YgN7xB6gnnj6YGzb4DQZ9jqYUact+8wsaFULzWEDyQFEFsaZemaQWH
 0E3pYh701SdXkF2SRrR+XJdHZoA53rKMYFw60QARpr6b6g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g9q9x72r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 09:27:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b10946ab41so21215171cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 02:27:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755163635; x=1755768435;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zvxCWSRBlZv5hDIRk34myOM8a1Wew5iutKQ7yJWvhmc=;
 b=O9v0JFkUVsZ+E8rvFo7mRAR86cEKXuDCFDBla5OXo0yPyp6EqOfTWIOiXyf876fH+q
 gcv/qQ5oYumr/51nUct2E1VmWQgRPyChs8VpZltOttikXKgxFPh7TUvy6i9cOQCn3Oxl
 gAvvHSxk9TazcZL3WffmnOwN+qXie2g9twFqMou15YFd8H/+oa7EPEDP2BMaqfcZPdSf
 YzsQXxnxVzDRLFQPXiPRa6+Q/odieXTaQS02EGG+X4JPjDREhQet4kicUF2u9x7T6Qwe
 2QlELcPyY/vSKe37oX3tWa98ZOs5AgSnaHhJGDSL65EDYYr3Ztx65KhECwUge6fifEjS
 c3sA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+kgVfSBcXBAEhSUZalp8kE53oiGBkUusVH1nIJKZpwLm9hy1ru0RazHbWkl7A2k7nK9AvD2NSbso=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmrfL+3U0brShmBbUgJWW2gwVzgTugqoE+DEMalgxHM6OZN251
 73DrOXR5/qsjmebLAIR+KjzKIyykkOhi7dDcWiTKdvbAI+QWQzRJ1T9+1iw3CLCHy2uxVLY+wmV
 bw7k55+r57iKNenRPcih2tYGkQOoRALzLKHP8lyEIu4tseyna3QIsdHxw4gdsmRjkemvnZ40=
X-Gm-Gg: ASbGncvCdPmj6Bl5hEWVFmk4UYALgv1NiPYeZ0gqUw7uVFUirmt2NKpfPnfLSWz4aeb
 RWKUFcjM1Q6Jbl0fegYQ84OP7BECATzMN8frSkILWjeSzLSzDnQLIttxy28eBFF6owC2v8CTpxT
 Y8OurpKm9rzBot564OcL3y+/AuZb21uDs7CwJzhk991dKNxDEB5pNohYzP69WcF8TutHfoxdBY9
 RQYYou/8z98ZNi3P6Rd2TWNcuymlFTMAkPzHal+QfdaFe1zt4Pm+atCTnuLZhbv0u9WTn5TOhkk
 A2Hs1FLxAfpBN78xJts0hm6lYiacqJuDxvHoDGIhN6wor6VLCysQSdVr9kOEC71HZBYGKdESsU/
 NWaP6MqvVqTNU25uuTeI2/lTvXaZvPBhJrDGrNGCteI0CagAr1Asy
X-Received: by 2002:ac8:7d8a:0:b0:4b0:69ef:8209 with SMTP id
 d75a77b69052e-4b10c03f7e8mr20699811cf.26.1755163634719; 
 Thu, 14 Aug 2025 02:27:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBjVvw/Dh9L2WDNaCrSVxcKNewmCQ7QcEKe6lAOLf6M3q1psXddyfkwfj70vcyEZ6Y9oS9JQ==
X-Received: by 2002:ac8:7d8a:0:b0:4b0:69ef:8209 with SMTP id
 d75a77b69052e-4b10c03f7e8mr20699641cf.26.1755163634235; 
 Thu, 14 Aug 2025 02:27:14 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-333f8cbc6f4sm2275421fa.9.2025.08.14.02.27.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 02:27:13 -0700 (PDT)
Date: Thu, 14 Aug 2025 12:27:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v2 26/38] drm/msm/dp: skip reading the EDID for MST cases
Message-ID: <pbbisppntd7fntghbjbyjmdvbxqc7uux42kiuryau4trgf3w47@4d5fi6zpcdf5>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-26-a54d8902a23d@quicinc.com>
 <lusd35wv2pj5sy6mdiw7axqxnei2wqo57pf6ju5ys2ibfrkidu@63lkbckuu2n6>
 <e3b5721d-cf37-4b35-9851-5e822fa16c09@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e3b5721d-cf37-4b35-9851-5e822fa16c09@quicinc.com>
X-Authority-Analysis: v=2.4 cv=CNMqXQrD c=1 sm=1 tr=0 ts=689dabf4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=jWxsxo1frd0NMcvgwksA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: lHHyHjVFALfoVdtoh8aKh8nhJCDpKcjY
X-Proofpoint-ORIG-GUID: lHHyHjVFALfoVdtoh8aKh8nhJCDpKcjY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDE2NCBTYWx0ZWRfX8Sn4cJO26V9O
 HJ/XiDCAQU9sIGertJAIfUAQwKtjrkWHArsLWx2KjO4ap3Wy8WOw30MVR5MotLyxrJjReL1a5ry
 lhfoAxNFrBuWTZoQ/FCyHtrkIWjwZVNRJGQk4x3lODWdzLnSZ0VmdRomnYiHBOw+19ELuuLur1S
 SjcOUJhqUoDFa6suMS3o6cueg3Fk2aHsbZP5wtr5nSvcaE+qS5pJ5lGvGZToppuRNXnyaKsrrp4
 xJuFvOcXSd1eI99SfQ9Jl1dUMOO4BsE0hCzgIHrNPFRAnwgTIqEGtnTgOl+WwGAvNe6IExJInpl
 sTOQaOicHX0Ur8F+2482eb9x0U9t/h1B1Rl5YC5+Qbk54MYJFTZWV2LF9BfqHxE9zQPs6JT1of8
 ilkUp4l0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120164
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

On Thu, Aug 14, 2025 at 04:22:44PM +0800, Yongxing Mou wrote:
> 
> 
> On 2025/6/9 23:58, Dmitry Baryshkov wrote:
> > On Mon, Jun 09, 2025 at 08:21:45PM +0800, Yongxing Mou wrote:
> > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > 
> > > For MST cases, EDID is handled through AUX sideband messaging.
> > > Skip the EDID read during hotplug handle for MST cases.
> > 
> > Why? It makes sense to read it during the HPD processing, ping HDMI
> > codec, update CEC info, etc.
> > 
> For MST case to read EDID. we will use drm_dp_mst_edid_read when MST
> connetors .get_modes() called.

I see that other MST drivers indeed read EDID from get_modes(). The only
issue that I can foresee is the audio handling. We've discussed that
some time ago (for the HDMI implementation) and it's generally expected
that we notify ASoC (and provide ELD) from the HPD (detect) path rather
than the get_modes() or e.g. atomic_enable().

Note: AMD / Radeon, Nouveau and Intel drivers don't have this problem
since they don't use ASoC and hdmi_codec ops.

> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_display.c | 8 +++++---
> > >   1 file changed, 5 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > index 88cae0ca66015377e59bee757462edeae5ae91bf..b1b025d1d356046f8f9e3d243fc774185df24318 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > @@ -438,9 +438,11 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
> > >   	if (rc)
> > >   		goto end;
> > > -	rc = msm_dp_panel_read_edid(dp->panel, connector);
> > > -	if (rc)
> > > -		goto end;
> > > +	if (!dp->mst_supported || !drm_dp_read_mst_cap(dp->aux, dp->panel->dpcd)) {
> > > +		rc = msm_dp_panel_read_edid(dp->panel, connector);
> > > +		if (rc)
> > > +			goto end;
> > > +	}
> > >   	msm_dp_link_process_request(dp->link);
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> 

-- 
With best wishes
Dmitry
