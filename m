Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7963B95702
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 12:30:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C9910E111;
	Tue, 23 Sep 2025 10:30:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SCSjZYGL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3401110E111
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 10:30:49 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58N8H5FF015977
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 10:30:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=rmYafpFQXnUuREV9KWT8YpXu
 +YN1bGGL9IDEPsJa/9k=; b=SCSjZYGL9TC8YvVreRTZ7mH2YiSeZKqsFZJXgaOu
 WLwMu9ZQVTWiyKlf9Vn5qy9+XU7+T4nb3oxFz1fWIftkjESLFNkYoIHu3V8CqToL
 rHSY17QCg1eIwQpT02Km9HUzt8jHbAQSaoTbZ5oZzbmUIZe6COC3FrtnLCyJnVXe
 mw+J8TJyUvzd6vJuPhpTkjnvk4aPrkUmDDlq+e1dDbVQ9fRrv0oNVVznjrLa+5y+
 s67I1/u55N983IQgdMXmFA9269miV5os/6wjd4hGO09NCLL8+flcvpMNtkQAgFI+
 dQhemkVzH1Y+kU5DIMSzkYh14VRV9ls/KZnIgw/qTRfmow==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bjpdsbx4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 10:30:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8544316ef6aso36173885a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 03:30:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758623447; x=1759228247;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rmYafpFQXnUuREV9KWT8YpXu+YN1bGGL9IDEPsJa/9k=;
 b=OE3PwxwOVT5FcYR8ic/wm9sllj+zczWIQBVzpBOIjdb1SkgVKmYVhvm2w0Z1Y5T+GC
 ceItZPobzVnGJoe/f9NOd9tRGy9hDK7NfRGoAJoUXeBrMWSqfHbSuADOnGpD2n3o2Al5
 zC1Ka6hrYlokmSU3HXVJ+O2zTG1qsCQjXKQcdoPrDZUTKH8r7+Sp1Yxqd1bNvyGo/q13
 /Y1RpEz5g6NQA3/cePa01ldAMI6MILYVgkPmIYWctOC5sakJo3VFNAxszjLMYsZGyCEC
 R64nL60b1yRK9AuxUUJbzV+n0/4tIRSDFM68cDjyu7Ec0pB7M9RDUCEWHCxSstKxBwZQ
 pZcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOqT5XPjMY719/9OVKIh7GMlvh9OgSLjR0Rj07Pp8g+U7rHCYRRf9+AdVhzWQdnz/0+9uA7Ouh1z8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+/IPWUnEleuQMJHCQ5Zzv0i4M3hENGWxfN6GbudSxSF88AMuw
 fGeINhhXM0trObGdRlPevHDLPw38PFJNX7IfwrEOJilaELGKIcu1OZr5ab/LBae6GVbpkMApT0E
 J0R8b1B7dlsAOISXzFP+LTSuk/19Epnwt4VmWEPpmRLO9iC+W39xHsJtwofiNx95h1x4lbAc=
X-Gm-Gg: ASbGncv/hGyGbI19J+Ha2C9t93Y8Qf3G7VsG9MynP0RMZMGomp1ItNblu0vaYfShDob
 uPlOOrPG6hQa5QGgQYQL8ERiWVx7ebL/krgYJrj9G7CMHZVIBQY+DG3hzS+MSrwOJT5O554UwZl
 Kx7cvIMcPrg+comlMhGfqvjhhL87jvWc6wW2Qn8hzVEluSd8okcwXIGdR/RUHwT97ZTxG8iKFXz
 vIwCKS8yRv/tvJ5mE0zFvWlKprt72FSb8kmgie6KTkLTJpiJx4ygizPvbWCo1olU733e+s3xLIF
 7OPlOTKjjjem1l8chEMpRV0YXRl2iG1U3urzLPFcWz2yC50RcFmuXyaJlVGzw2eyvs6HpJaXTVy
 iMYIPeiLPaimEYSjoaMxCU8zO9CjHKTqy0s3G921ByDuphtblkO//
X-Received: by 2002:a05:6214:260c:b0:78d:5c0b:eda5 with SMTP id
 6a1803df08f44-7e716783203mr24618456d6.45.1758623446852; 
 Tue, 23 Sep 2025 03:30:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtwhCVG3iS/ZEW5EfzF5O4nQC+BKSNVhZ2kuzs27fGTin6ba+1epQrvdKbopUgS7pPF4jSFg==
X-Received: by 2002:a05:6214:260c:b0:78d:5c0b:eda5 with SMTP id
 6a1803df08f44-7e716783203mr24617966d6.45.1758623446135; 
 Tue, 23 Sep 2025 03:30:46 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-578a5f44740sm4067725e87.14.2025.09.23.03.30.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Sep 2025 03:30:45 -0700 (PDT)
Date: Tue, 23 Sep 2025 13:30:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Devarsh Thakkar <devarsht@ti.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/29] drm/atomic: Add atomic_state_readout infrastructure
Message-ID: <hd7gjmsbxjfaffxaxvnafzlq6rf625nxqfmcrllnndl6yigtaq@o6vaotpu55by>
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
 <20250902-drm-state-readout-v1-10-14ad5315da3f@kernel.org>
 <zvqtehg66dbrrdmik6ylo2kdk74umfzo5hbfkizwsb352nlyqv@jgouvmbfwa4x>
 <20250923-rigorous-tamarin-of-cookies-2f1a25@penduick>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923-rigorous-tamarin-of-cookies-2f1a25@penduick>
X-Proofpoint-ORIG-GUID: 7XpjwxPfGy7tQcgpAxnFNLX091uWk7U_
X-Authority-Analysis: v=2.4 cv=Pc//hjhd c=1 sm=1 tr=0 ts=68d276d8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=gJwGxJFpRMUGz6KCoQ4A:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 7XpjwxPfGy7tQcgpAxnFNLX091uWk7U_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAyMCBTYWx0ZWRfX9u8rx6sB3Xer
 kz3W3kCTQvG6t7Dy4GoPziWlIafr4Cq5q+P4hrO46OaN2pu8Bbx9g7Tkk0z5dQqaI3FK2L04ldG
 leetHLFp9xcx3lkCcvv6eEhJFEZ5SUmb1ecX2xaQOQ2tFUml6kDk2X1v1XkUkpHrmvZTKa/ddaR
 0j3WNsf5uc1p2Y10eLS9WpF0utic3fzonmRXcFNahpkmvsk8GYe9v3caAGdGAhVQMvouqaSBM+J
 ZAPKDReIeJnXmzv/gg9HmAkxw3kw6NcT4PZmjQr3tHTcjlJ9ZUZQ4KxBHERHptpet8+LOvE0QD0
 Ay9zwobWQndiYwvO0IE9qzo3GZztYbCYs02mI27ED/2OW4YACpy0Mygl+M2XBC+fCH+6sTl0oxO
 OrEdHLTQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_02,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230020
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

On Tue, Sep 23, 2025 at 11:45:49AM +0200, Maxime Ripard wrote:
> On Mon, Sep 15, 2025 at 09:40:57PM +0300, Dmitry Baryshkov wrote:
> > On Tue, Sep 02, 2025 at 10:32:38AM +0200, Maxime Ripard wrote:
> > > In order to enable drivers to fill their initial state from the hardware
> > > state, we need to provide an alternative atomic_reset helper.
> > > 
> > > This helper relies on each state having its own atomic_state_readout()
> > > hooks. Each component will thus be able to fill the initial state based
> > > on what they can figure out from the hardware.
> > > 
> > > It also allocates a dummy drm_atomic_state to glue the whole thing
> > > together so atomic_state_readout implementations can still figure out
> > > the state of other related entities.
> > > 
> > > Link: https://lore.kernel.org/dri-devel/CAKMK7uHtqHy_oz4W7F+hmp9iqp7W5Ra8CxPvJ=9BwmvfU-O0gg@mail.gmail.com/
> > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > ---
> > >  drivers/gpu/drm/drm_atomic_helper.c | 382 ++++++++++++++++++++++++++++++++++++
> > >  drivers/gpu/drm/drm_mode_config.c   |   1 +
> > >  include/drm/drm_atomic_helper.h     |   1 +
> > >  include/drm/drm_bridge.h            |  21 ++
> > >  include/drm/drm_connector.h         |  26 +++
> > >  include/drm/drm_crtc.h              |  19 ++
> > >  include/drm/drm_plane.h             |  27 +++
> > >  7 files changed, 477 insertions(+)
> > > 
> > > +	drm_for_each_encoder(encoder, dev) {
> > > +		struct drm_connector_state *enc_conn_state;
> > > +		struct drm_crtc_state *enc_crtc_state;
> > > +		struct drm_bridge *bridge;
> > > +
> > > +		/*
> > > +		 * It works a bit differently for bridges. Because they are
> > > +		 * using a drm_private_state, and because
> > > +		 * drm_atomic_private_obj_init() asks for its initial state when
> > > +		 * initializing, instead of doing it later on through a reset
> > > +		 * call like the other entities, we can't have reset xor
> > > +		 * readout.
> > 
> > Would it make sense to unify the way the bridges / priv_obj handle the
> > state with the rest of the object types?
> 
> I would be all for it, but I think this is pretty much the same
> conversation we had in my recent bridge improvement series. Aren't
> bridges not assumed to have atomic support and thus we can't really do
> something better here?
> 
> Or should we move all bridges to be atomic?

I think I had something smaller on my mind: make drm_private_obj /
drm_bride provide the initial state during the reset call, like all
other entities.

-- 
With best wishes
Dmitry
