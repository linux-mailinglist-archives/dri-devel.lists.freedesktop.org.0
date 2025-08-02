Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 401DEB18DEE
	for <lists+dri-devel@lfdr.de>; Sat,  2 Aug 2025 12:19:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ED1F10E0AE;
	Sat,  2 Aug 2025 10:19:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="M8IKCKUD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F8910E0AE
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Aug 2025 10:18:58 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5725fCpb022938
 for <dri-devel@lists.freedesktop.org>; Sat, 2 Aug 2025 10:18:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Jx+kGc1/RtPDFH2kU0Zb9HbE
 qcdsxBgONzyUhmEa04Q=; b=M8IKCKUDEC+Bd7QZtmEsqmYVwRAdDw/7z3Lfae+m
 uSnhCG4cChirryJxvVQGcObJPaHmBNSxKmt5xFy95jUK8OH1c3hkCCETqnEDaVUb
 gNzM7e+qacgNXr4mIyeu1ttimWpDBxqOeVRVXewtT7w8jmX+9ThOzUerngFF8frX
 kwenYUebvafcly5XthVInTotUAO8FRpCnrE/J6CGRUyRk17WbCcd6KytPLrfHMXT
 Fxbye/W9+xQVto+0xrQ+DVdTxCEnyogYo777Xxvu0KObV+2aH9z+ugb6fR3zHm+a
 xHZIP3IX0WFPDvkx3XvNh0YigwyME2cTsU7hcoJ2AmF+Sg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48981rgwpu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Aug 2025 10:18:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c5cd0f8961so300273485a.1
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Aug 2025 03:18:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754129937; x=1754734737;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jx+kGc1/RtPDFH2kU0Zb9HbEqcdsxBgONzyUhmEa04Q=;
 b=NZsA1wLo7IVjZU3Xe4W0SlezU3XQStFnTw8tRkCNu5WiOtGtSjQjksBgx+6pl+sLqe
 Z+HSloepJga9A+nRJVpprUOy7kthqOHEDjL96A91y6jkWMJFzdIlRfDwxx98cgn3A95F
 LmCKVJM9cN2q/cqJj4uVmiPecQZIoZyxQ6qXxJFqH1DKw7wu/SQHOT+6f6ui4P6pAvyW
 YyI6oWvAzto3q0NnTWv25a54AWAvM5YYzrlRVdVKiyq7AvvtvpZlyh2gI/JwgwzjUd3M
 pQn04EhiL2snmUTPtEh1Py1AEav4I0H4O723GLnyiZlNn4FGJ4vSP17Z7fQkupwihWfG
 1sUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVCrUkEaSDTkq7RrXHi7CACwwVYlVR9vJToG46AWrnc8N/bKthcHPLSGldIzPNdgVtlxNyKo8CAAI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyS5Pn55CdvCYtRa7I/bVQjvXUil3kghLYj5NblikUIgD8PnDHi
 KkxO5iKHTElwwC/YnqxOy9NYojznhMrEnGb0IcYFOt4DpT9Wl0qebdEt4qeLO9poarVHaFQn/70
 3HOyy7tV6ai0by0vxQPh4SX1JRzlcLHlmDkzugAzVE5irMoNzkaGFwbIdeZE/fNWO9DvwtSeoiG
 8DQ24=
X-Gm-Gg: ASbGnctVyBPgSWSgK7UBQ5R7ZKyv33R2a6mAovQqTRlL5wc2dV0C2M+Hj5RvEGih3sQ
 3xlkMLfs4XgcphPD1MbAEmKHxgcBdRihTDxXxarCwG/jkhyH1JVMbI3SK4tncR9Zqm9kRf/5e3p
 wNwLYMqEXkAXE8kjwF/oD8IihcBiHa9/EOPMR9NhD+f5OcbludPkVn1IeDsWD6C9NIwk2cSgXpz
 KzNqSVItGjLd+fpOl1qLSIavLdTE3tRgJYSFdB+Y7KvdUWG3ILcxAzyBtqI7Q8FN7aNePzo1uSq
 gmb+QNK183v8UyAupUOMHpUVTFPc6W/BC9Mk9zaGw6VwzJlCs7RBzF7NZlygMQIK2Yr/aqvDE35
 Af/TNL9T1OSAfmQ3Yufj8LmM8QGXD/hTrTgs7ZylrYyGui9adSVB7
X-Received: by 2002:ae9:f716:0:b0:7e3:48a2:b978 with SMTP id
 af79cd13be357-7e696371059mr347570885a.49.1754129936733; 
 Sat, 02 Aug 2025 03:18:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkTnIMpLeKTQssFIE7XgfKnhYV45kHZ+Dp3zZITljw76FcrvhI8dE+FJ/ar1u/0l7+mkctwQ==
X-Received: by 2002:ae9:f716:0:b0:7e3:48a2:b978 with SMTP id
 af79cd13be357-7e696371059mr347568285a.49.1754129936298; 
 Sat, 02 Aug 2025 03:18:56 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b8898c2e9sm918063e87.4.2025.08.02.03.18.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 03:18:55 -0700 (PDT)
Date: Sat, 2 Aug 2025 13:18:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <quic_yongmou@quicinc.com>
Subject: Re: [PATCH 18/19] drm/msm/dp: Move link training to atomic_enable()
Message-ID: <qz725rrbpae5iw6tmx2s2pbaxl7pliyxf7dd3gyev64zqrbq5t@aeacyijbswl3>
References: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
 <20250711-hpd-refactor-v1-18-33cbac823f34@oss.qualcomm.com>
 <cofa377vptj7on637u3c3mnxndplcmaegsb5h6idinz5wrvm6s@toylno4uapq4>
 <a085fb45-91e2-4827-b8e9-8af90796cc49@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a085fb45-91e2-4827-b8e9-8af90796cc49@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: sbcdKvFFrpNhczaqWlm06GHYBHDVsAru
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAyMDA4NCBTYWx0ZWRfX7ETAXr7Fs1sE
 p/iQeqzPc3ckEygqG7+i78ZQeGGyVmRZS0264gFD8x5F+8sLsPFqkJy3Mron9wCdBjOEg6cmQU7
 EjBvTS/kSo+JzW7VmlISOSsEbz49c3EmNYzL7swnOS4VFbVvIM/jWhAnxsZ20yIHaQbZ2L6D8J+
 KfTzzvJDJUEkJZGoSXQSBgH5w8HqaQxdhGFFUd8Bf2KjQt3qTsRM8IGGHwQL436w98vdGFcOAd3
 a83Q5462b4iTYRdHSqQKHkrHC5n4MTg9yOUFrAGdMLWLFrP3YLLB+Au52/k/yQThNlej4hvXOXC
 ZtSWj4dhqgq//Ejr3PKHhwRnQWfgv6rGVIzmNdAJjHfLDfACyL2PlU6VAp86jo3lcr12/YmjsXi
 zdE/0OvgHUeizyZwEmqnfGqnP7UQ72HiMYY+vj6i1g8uJTmkXS3JuidTAQlfBQt3HMs2KfC/
X-Proofpoint-GUID: sbcdKvFFrpNhczaqWlm06GHYBHDVsAru
X-Authority-Analysis: v=2.4 cv=a8Mw9VSF c=1 sm=1 tr=0 ts=688de611 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=alj5FwM-wW7eLBos5QIA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_08,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508020084
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

On Fri, Aug 01, 2025 at 04:58:55PM -0700, Jessica Zhang wrote:
> 
> 
> On 7/14/2025 4:54 AM, Dmitry Baryshkov wrote:
> > On Fri, Jul 11, 2025 at 05:58:23PM -0700, Jessica Zhang wrote:
> > > Currently, the DP link training is being done during HPD. Move
> > > link training to atomic_enable() in accordance with the atomic_enable()
> > > documentation.
> > > 
> > > In addition, don't disable the link until atomic_post_disable() (as part
> > > of the dp_ctrl_off[_link_stream]() helpers).
> > > 
> > > Since the link training is moved to a later part of the enable sequence,
> > > change the bridge detect() to return true when the display is physically
> > > connected instead of when the link is ready.
> > 
> > These two parts should be patch #2 in the series.
> > 
> > > 
> > > Finally, call the plug/unplug handlers directly in hpd_notify() instead
> > > of queueing them in the event thread so that they aren't preempted by
> > > other events.
> > > 
> > > Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++-------
> > >   drivers/gpu/drm/msm/dp/dp_drm.c     |  6 +++---
> > >   2 files changed, 11 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > index 87f2750a99ca..32e1ee40c2c3 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > @@ -410,11 +410,6 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
> > >   	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
> > >   	msm_dp_link_reset_phy_params_vx_px(dp->link);
> > > -	rc = msm_dp_ctrl_on_link(dp->ctrl);
> > > -	if (rc) {
> > > -		DRM_ERROR("failed to complete DP link training\n");
> > > -		goto end;
> > > -	}
> > >   	msm_dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
> > > @@ -1561,6 +1556,12 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
> > >   		force_link_train = true;
> > >   	}
> > > +	rc = msm_dp_ctrl_on_link(msm_dp_display->ctrl);
> > > +	if (rc) {
> > > +		DRM_ERROR("Failed link training (rc=%d)\n", rc);
> > > +		dp->connector->state->link_status = DRM_LINK_STATUS_BAD;
> > > +	}
> > > +
> > >   	msm_dp_display_enable(msm_dp_display, force_link_train);
> > >   	rc = msm_dp_display_post_enable(dp);
> > > @@ -1706,7 +1707,7 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
> > >   		return;
> > >   	if (!msm_dp_display->link_ready && status == connector_status_connected)
> > > -		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
> > > +		msm_dp_hpd_plug_handle(dp, 0);
> > >   	else if (msm_dp_display->link_ready && status == connector_status_disconnected)
> > > -		msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
> > > +		msm_dp_hpd_unplug_handle(dp, 0);
> > 
> > This chunk should be separated from this patch. I'd ask to drop
> > EV_HPD_PLUG_INT / EV_HPD_UNPLUG_INT completely and call DRM functions
> > all over the place instead. You can do it in a single patch, which comes
> > after this one.
> 
> Hi Dmitry,
> 
> Sure I can split this into a separate patch.
> 
> Is the goal here to remove the event queue entirely?

I think so.

> 
> I can drop EV_USER_NOTIFICATION,

With the link training being moved to atomic_enable, there should be no
need for an extra event here, I agree.

> but I'm not sure if I can completely drop
> EV_HPD_[UN]PLUG_INT entirely without major refactor of the plug/unplug
> handlers since they are used for the HPD IRQ handling.

And one of the pieces of the problem is that it's not doing its job
correctly.

The code flow should be:
- Inside the IRQ handler notify DRM core about HPD events from the
  bridge, don't do anything else.
- Inside detect() callback read DPCD bits and identify if there is a
  valid branch device.
- Inside hpd_notify() check if DPRX has sent IRQ_HPD pulse, handle the
  rest of the tasks: link events, etc.

Note: we might want to duplicate DPCD reading between detect() and
hpd_notify() in order to relieve detect from updating the DP structures.

-- 
With best wishes
Dmitry
