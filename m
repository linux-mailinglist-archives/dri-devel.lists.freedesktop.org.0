Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E02B249FE
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 14:59:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B832010E70E;
	Wed, 13 Aug 2025 12:59:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Icnrw6NI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C37010E70E
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 12:59:39 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DBMrWl000971
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 12:59:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=89undOGSCm/t00epashw1SYp
 cyoRiHj2yOfvXPYa4Gc=; b=Icnrw6NI3VZBRsPQEIn3O/rHU03NXKW8iaSfsR+W
 xjm7lwQianwOHArGJIew0ymKsdw9+Zge40Fb4e8ZLrR8Q9RagIh4Od+Dv4Ft/Q/9
 Jfl9uTN3Wzx4Py6BSiOWqUv3FofupRi3rpIQLOJNalPZjAecOXpH4nw3nVm3Au60
 zsnrA1agm0TRClxCLwdBJKvoJ6cI3pDHm4FUbpX2XDSdz9+3Y8PObwl3JIxWkcjw
 du/Ctlu/TQiWN5yPHz1m6Jl2VY3caVdz28/kPIlJe1+RPcLNLRD9KWYBdvukpll7
 2UbWeqFFAY3a5zp7XdjzCDbIRSumaBVsYnix3ODCBnfB0g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fm3vpr37-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 12:59:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b0ca325530so29256401cf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 05:59:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755089977; x=1755694777;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=89undOGSCm/t00epashw1SYpcyoRiHj2yOfvXPYa4Gc=;
 b=MyNaiQIzfW5a2nXtGmmeB23pE6CiMlHS9Xn8ovQiibEYcioDBA5G587kKbWQLwjNUZ
 0sxRuyv2Jg02oDr277LqiUguoTup2Z7HULZLWk4ocC6BUpdpH6Q9SnBj2KdWU+rOVNqD
 bPfGkKa1PguyT/wzV3/EZC23iFG2JBOaX0p1Wo6hsI3QEmS2OWtvA2aiCkA5K8noW9/s
 UqxAGTn//GaAeLlId+95PyeQD63IbQX49KO9CDM7cOSdi4QsplH975TKIzB1o0WtmUmO
 GWUK7VkBMM1sEuyqXWdUHpQogY0ihPtMeKkm0WgAbUIfOsi4lU9ty8nurdILnH0K4PaW
 qmgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVy5FoYUIRoSbx+7OVzA7lZt76dKnN2Emi8psp7oXBOlpYy6yieyw4AQ8jE4vyKGioMzgJGCxYtrgw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/2BbActty1Mt2D0jNwFcuzqNraRLzZHloeSqIwJ5F1QQ9h7cJ
 +rjyITA6aMcRxcAsIktygXEVF/I5hMQ3f4FkY35zna5rPlhcj+TjjERAMLfBWP4MbtTwEdbUBo+
 lu4W6AjBukRHDMWiYrVm+Oh8oKgsx1UVGqrcusrkaT5HmLxYNpZQBIUSWInwaeCFX1D28yLY=
X-Gm-Gg: ASbGncuDBioYj+PK9snvRso8CCdBwRMUx7c7F7MEeht3iJY8pJdg7PcSVJ8PCrVK4qo
 yLcTQF9YbGKaIuanTup5qIAHMXIV0uNhWZIewwU11A97qrhPsWNeX6uR7DmIGD4NEcrtf5zdUIZ
 OaXe5q4hAOtOAFe9JNrlMOSuILcROpSAhPJMk57xiF1V7x7ws5ObYJDB8ZHRBb04kSHVVk7Fgfu
 u4d5ftsHFmei6Bt4kk+xagObA8hKXPnzeJ9KYZxK1iQUW6VZ5sYmvPpkH/d13XcPGtWn2boCRzU
 yYaIWjTZ6K8xHjQqAXSwZVNTUz4HirbR/XhJZV9lqL7v4rMq9dBAtFpXkUDaYeRlJoaDQYIKJxj
 Dex+m75BueNg6+nnub86HDkk4C9UPyq5oHXwFm/owb0A4FrhGNxoz
X-Received: by 2002:a05:622a:590b:b0:4ab:5277:a5ab with SMTP id
 d75a77b69052e-4b0fc6f1fc4mr43132681cf.6.1755089977093; 
 Wed, 13 Aug 2025 05:59:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYZUZcRFNXr1nwU79ordj5X3vkd99gbFsAKVm6AbEVLEEMy/o0VEZaEaiD7x9HvcpYcqpeHA==
X-Received: by 2002:a05:622a:590b:b0:4ab:5277:a5ab with SMTP id
 d75a77b69052e-4b0fc6f1fc4mr43132151cf.6.1755089976524; 
 Wed, 13 Aug 2025 05:59:36 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-332388fef31sm49861901fa.70.2025.08.13.05.59.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 05:59:35 -0700 (PDT)
Date: Wed, 13 Aug 2025 15:59:33 +0300
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
Subject: Re: [PATCH v2 03/38] drm/msm/dp: break up dp_display_enable into two
 parts
Message-ID: <ftlaxwogzz72rg4plguaet4wi64pmdfmd62qve4xffamxq4fsu@ytd4edwv6ixm>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-3-a54d8902a23d@quicinc.com>
 <gwib6zcvkxsxcz222cno5jbvsnt2abdoqfnymlxq7e6c6wdfvn@nlplodnco2sw>
 <48c61bce-21e6-488a-b976-da53004b6226@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48c61bce-21e6-488a-b976-da53004b6226@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDEwNyBTYWx0ZWRfX4Ahd3nBUGeVv
 KRrylTbRg6Tj+HZuLwG4TfmXqyUrQCvyJBwLRLdStv0u2uUxR31rqXAiX2J9iPUNG2+0P5tfsOE
 1yUMd/m+QusvywnOEha5vEx7DAFqniypkCFHKCf72hYPZH5LPYZie/s5CG3PGOPkd7lwNRQ6uHs
 j22KiD6Qk02TcVKxRKJpJ6fnncXA04joRSbkUI8ESDEsWWaB6sEXnvD0QcPOi8d2mw6st+nwvox
 bAQfNIbCYNxDuGCrOMH48EmxInxh8XSSKdAqWRU3d1L4MSim7mkrJSXQbSA2aCLFg+eI5m1epnD
 XkYzBqVdsPUeiFiqQ7fieIHfSffRqx2T5hIWrqPp9urnTwLDq215DhAaeEtU35VKQTUU0JQOm2c
 uyiteRxx
X-Proofpoint-GUID: WA9XknCYbreENHrZ7Ps4fTrEs00d_lRC
X-Authority-Analysis: v=2.4 cv=A+1sP7WG c=1 sm=1 tr=0 ts=689c8c3a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=bAkpl6uDeKY4ZaPGbNUA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: WA9XknCYbreENHrZ7Ps4fTrEs00d_lRC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110107
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

On Wed, Aug 13, 2025 at 05:36:10PM +0800, Yongxing Mou wrote:
> 
> 
> On 2025/6/9 20:59, Dmitry Baryshkov wrote:
> > On Mon, Jun 09, 2025 at 08:21:22PM +0800, Yongxing Mou wrote:
> > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > 
> > > dp_display_enable() currently re-trains the link if needed
> > > and then enables the pixel clock, programs the controller to
> > > start sending the pixel stream. Splite these two parts into
> > > prepare/enable APIs, to support MST bridges_enable inserte
> > 
> > typos
> > 
> > > the MST payloads funcs between enable stream_clks and programe
> > > register.
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 57 +++++++++++++--------
> > >   drivers/gpu/drm/msm/dp/dp_ctrl.h    |  3 +-
> > >   drivers/gpu/drm/msm/dp/dp_display.c | 99 +++++++++++++++++++++++++++----------
> > >   drivers/gpu/drm/msm/dp/dp_display.h |  1 +
> > >   4 files changed, 111 insertions(+), 49 deletions(-)
> > > 

> > > @@ -831,7 +831,37 @@ static int msm_dp_display_set_mode(struct msm_dp *msm_dp_display,
> > >   	return 0;
> > >   }
> > > -static int msm_dp_display_enable(struct msm_dp_display_private *dp, bool force_link_train)
> > > +static int msm_dp_display_prepare(struct msm_dp_display_private *dp)
> > > +{
> > > +	int rc = 0;
> > > +	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
> > > +	bool force_link_train = false;
> > > +
> > > +	drm_dbg_dp(dp->drm_dev, "sink_count=%d\n", dp->link->sink_count);
> > > +	if (msm_dp_display->prepared) {
> > > +		drm_dbg_dp(dp->drm_dev, "Link already setup, return\n");
> > > +		return 0;
> > > +	}
> > 
> > How can it be prepared here? It is called at the beginning of the
> > .atomic_enable() only, so there is no way this can be true.
> > 
> Emm, sorry for forget this case.. Whern MST enabled,
> msm_dp_display_prepare() will be called from mst_bridge_atomic_pre_enable,
> that means, when second stream called this func, it already prepared, so we
> should skip here. so this condition will really hit in MST case..

Then it should be refcounted. And, ideally, this should come later as a
part of one of MST-enablement patches, when it actually makes sense

> > > +
> > > +	rc = pm_runtime_resume_and_get(&msm_dp_display->pdev->dev);
> > > +	if (rc) {
> > > +		DRM_ERROR("failed to pm_runtime_resume\n");
> > > +		return rc;
> > > +	}
> > > +
> > > +	if (dp->hpd_state == ST_CONNECTED && !msm_dp_display->power_on) {
> > > +		msm_dp_display_host_phy_init(dp);
> > > +		force_link_train = true;
> > > +	}
> > > +

-- 
With best wishes
Dmitry
