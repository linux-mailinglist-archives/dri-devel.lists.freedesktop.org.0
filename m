Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6A6B3FAAD
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 11:36:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB6910E631;
	Tue,  2 Sep 2025 09:36:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BYvIywrX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 187CE10E633
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 09:36:26 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822RlsL021655
 for <dri-devel@lists.freedesktop.org>; Tue, 2 Sep 2025 09:36:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=zwxseqR+TZhAlHd8nXn4rEVr
 gvLiKS1QfDCvUia9uDs=; b=BYvIywrX3heQ7ne5hRRZ5urv5nl4T7xAfnc+SZM1
 /i5UPcTEuA/pByNJR0mc3t+cw+DdPg8mYjpo8RAcOSuTkTWvJhpcr/BAuzYDC1x+
 rnip3mPByRZc1p/LcON3dNibvaAyzY99svf9HnmOiKPDPJleFdLGcTrDpp6oVQYG
 YBtCVvI1NloXtXqOOqMAPQwzgQVMWt3pOGGwo2GLlWkLvNsfm7A40wUSt179x/1w
 8joq2vla9hDBamSayx3Gjl0H/Mr0E1kpSqZSBgBke1+VmT1z00xLtZQb+j61CVRk
 Iua3yEjZh4VDVx8jhku+r7DMkHn+VWS04c6zZRYzguMKGQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnp7fbb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 09:36:24 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b327a79a30so60975521cf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 02:36:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756805784; x=1757410584;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zwxseqR+TZhAlHd8nXn4rEVrgvLiKS1QfDCvUia9uDs=;
 b=lzWZF2iazPvalunTMhhAnJGwxzN42iW/hmNj7y6ppRgJFh9T4sbvromWuqRY/PuNEo
 7isZo7ohQjKu6gMWAZS0hNWeDAEpjd0RCqRlEFgv+pON1Y5/3AeqJGtOVduQGfe8qmVm
 Nz70E/12AoGp/gHqsZT43LuS4T7htwQaxpimG6eBpn30IEGujUnkfLL3rSfSxYPOPkiX
 9oBZq2yI6LChl9r4H/pmoASjb/JOq9nLP82nO8dkBSDnY39OY6poCWgR6dy4SJU6IrfJ
 eswtz2SfNimqlggecwwcsWTaoix2wGHBB1jGo49Vv242WcnbAiSd8OZvffhAPskZ6WTW
 MXLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1W52n25j+yDTdRHiQYI7ZSdcpfpsKa9/qcoIYg8+iDiNDt1dfzPz/itt9L3/AdyLnTe1GpGWooss=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxeAfPPG1eQZ0+4gC2gtiGnSjaD5SKcCjboqVepZAw4PYE0R/2N
 RCacQDX9mcBOoBVmct9qdUCNkHZpFhzn2kCy/Nv/Ie7ffOQw1lwd5yhs7PjTV5S1MSjt69LiK2V
 HKrAyCYJ+50xXtjEGdIAfAkLi4Jo0s6HxloBEnk21Kg2zzIlh7W/lXfxcQIutrnfMF2A0PBc=
X-Gm-Gg: ASbGncsj6x5l13Lce6CO52iQTOWfGkaF0R9i9GVRRA2wv7CMaiw3bsmW31etceIFozK
 0gbrurfwhH42OtUXHcc2UTpnrkzeOiE7uTPa9qqulEsvxXDxaQARu9jnq/tBm4Qa0cJPQzxEjOB
 j3XjScEf7BjP8Sh9Xf1S7CCdlY0u6e0Rt7hIr32qohgpkgctBMyUIP5xMCOD6i2FTHM2MRsl+tu
 JK2BZ1prFnXE1y+bJizcUZGflGkqzycmu+FHk19LNzXIEiN8xDusN8brsFiOm471c313DkbsQhr
 W1mT98LprpH8nyRfALitBg/ONo3OxHb7U1UQ2sYGokYR+zkflSM+iGVf75fFUZ27AkwOlSJ7zlX
 BAhCFQN8tFHdBuIa8l/KO+OmQ2s0UfT56ATQkTT1wlSWPZR1PWLv0
X-Received: by 2002:a05:622a:5e0d:b0:4b3:459c:6eef with SMTP id
 d75a77b69052e-4b3459c7a6bmr18165961cf.47.1756805784114; 
 Tue, 02 Sep 2025 02:36:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHx6nrwggqsOXBxF3/OABMklDbP3IK5x4SRajgGDGpPKXyjhgzvQjkfyqsdwZoBMZXal4NHjQ==
X-Received: by 2002:a05:622a:5e0d:b0:4b3:459c:6eef with SMTP id
 d75a77b69052e-4b3459c7a6bmr18165671cf.47.1756805783493; 
 Tue, 02 Sep 2025 02:36:23 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-560827aabf5sm544368e87.137.2025.09.02.02.36.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 02:36:22 -0700 (PDT)
Date: Tue, 2 Sep 2025 12:36:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 01/38] drm/msm/dp: remove cached drm_edid from panel
Message-ID: <yarnaujunszlfrbduakodv7n63wjgh6og3t4qowhu3n6tz6fmn@4kb4crd5rqq7>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-1-01faacfcdedd@oss.qualcomm.com>
 <otmy4kttxflsxkvacwdsqynck4nqeww7jsxaq2xwjtlooxnhvx@gmpezdliskck>
 <5b142910-81e7-462d-8933-70705334ef0a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b142910-81e7-462d-8933-70705334ef0a@oss.qualcomm.com>
X-Proofpoint-GUID: mCy5vTSRAQKMwD8s-Tha4LNgSw4WNTt0
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b6ba99 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=kpPRz-UtyBwCQlaFug4A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: mCy5vTSRAQKMwD8s-Tha4LNgSw4WNTt0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX/FY3OctSUD0K
 aGj39yhHEQdZcf2oh+LbhavOoUKacYG6amItze2eTUcr1y57SV13Q5qWm6tj/8hdKIXVgFnuDV1
 ISY4NZq9w6dOxxeVJ7m3bFKd4WKvrCvwz4bCC0anwDfmZey5jnne+ecm2CVEgI/rAKnqM+/oI8M
 iDuQ1ETykTY5G8NXBz3cZ+sgjy5FzKwtt4SGu7mOx6XZAhveyRW3Gc2KEaGbm2EJKYGlJba+Ctr
 t9LkC8U+ee3o++70Wr7YztE4stFhM9onBH+SGZ/NPLBobN2Qvfsx+7w6DxwgRlxLXJWohGsMFPF
 LZf2zxq1JGpx3jRmY6n4ryAqb8Xr3fmDgQWxvGyqw8MN6PiGk4OGQFLtWmIukW+534YoFE+CJd2
 GvDNV+rY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001
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

On Tue, Sep 02, 2025 at 04:42:18PM +0800, Yongxing Mou wrote:
> 
> 
> On 8/26/2025 12:41 AM, Dmitry Baryshkov wrote:
> > On Mon, Aug 25, 2025 at 10:15:47PM +0800, Yongxing Mou wrote:
> > > The cached drm_edid in msm_dp_panel was redundant and led to unnecessary
> > > state management complexity. This change removes the drm_edid member from
> > 
> > Please see Documentation/process/submitting-patches.rst on how to write
> > commit messages. Please use imperative language instead of describing
> > the changes.
> > 
> > THe patch LGTM.
> > 
> Thanks, will update it in next version. Since the HPD refactor series are
> unlikely to be merged soon. Can I separate out some patches from the MST
> series that don't have dependencies and send them individually to make it
> get applied? This would help reduce the number of the MST series.

Yes, of course. Please keep version number monothonic for those patches
(e.g. by telling b4 that it should start from v4).

> 
> > > the panel structure and refactors related functions to use locally read
> > > EDID data instead.
> > > 
> > > - Replaces msm_dp_panel_read_sink_caps() with msm_dp_panel_read_link_caps()
> > > - Updates msm_dp_panel_handle_sink_request() to accept drm_edid as input
> > > - Removes msm_dp_panel_get_modes() and drm_edid caching logic
> > > - Cleans up unused drm_edid_free() calls
> > > 
> > > This simplifies EDID handling and avoids stale data issues.
> > > 
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_display.c | 28 +++++++++++++++-------
> > >   drivers/gpu/drm/msm/dp/dp_panel.c   | 47 ++++---------------------------------
> > >   drivers/gpu/drm/msm/dp/dp_panel.h   |  9 +++----
> > >   3 files changed, 26 insertions(+), 58 deletions(-)
> > > 
> > 
> 
> 

-- 
With best wishes
Dmitry
