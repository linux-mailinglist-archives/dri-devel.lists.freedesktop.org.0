Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EFAD27C6C
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 19:51:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5115A10E23A;
	Thu, 15 Jan 2026 18:50:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TWOQR84e";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HBRIAKjD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E23D10E225
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 18:50:56 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FFY6X22817319
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 18:50:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=JTDQ8EZQyOUY5F7DTRAbDbUi
 E/JxgTUqlUKictmW1Sc=; b=TWOQR84eZh365MSByIFKohPlhylJL/6ZlMf9ykoU
 BWHTI0fPZexY3/bM5SH+09khdKH0w3MJJ69dhPbePUAlAQ49TW+QeWpzlDDOofTx
 b+nm581QF4v8D55wJww87SxKdCzNumYhgcwwZgIF1KsXW7l3iJcejNZAH4Quyuum
 I+EAq3Ot6rdPFO9P+92ZObrkg6HQOYMa7eHfDQUCzWvWQk+gKWkuRjpTx19UKhvb
 Fu2xvNsAKTCj//4kQagsDcm/Ai8Jwduqjhj4XUZ2Cyh7Y+3fDPKdFeRBza+ajp8h
 ZtNCc0W3lVHMzi+/3PyaLua8N25rc+SoLU+msSyzjNWhHA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpwpxhmsb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 18:50:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8bc4493d315so352096385a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 10:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768503055; x=1769107855;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=JTDQ8EZQyOUY5F7DTRAbDbUiE/JxgTUqlUKictmW1Sc=;
 b=HBRIAKjDPgHKaGKCGm/XIDwfePqMKNq887EhHiYzwNc9eqHaDsYdu6KAcgJNXR7OHf
 K9llQcOmZj2UzRPejj0plrVR0/QWjlob32gssbc41iNlFNmv66UIH3UIw4/bZHuwvvxV
 Ds8jQcdSfLFa0hsibqwP24S7soJOSY1HBeZed/CWhDR8ln1YxyMi4o6tdfp590YVoWej
 R4+3EfWfvNvYUZsuu8vXbK22bFoSho/h6bOUsrx5o6i1Cyso8PyYthwHIeEyC+6FuiAS
 P+W2AkoPVuZE4cOeW7KCJ9jz1QHPZv6wnazWAz+Zdcxe+zwMRXYHMdkpL5o9kamI8+u2
 QLMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768503055; x=1769107855;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JTDQ8EZQyOUY5F7DTRAbDbUiE/JxgTUqlUKictmW1Sc=;
 b=JpyWdapzWemezm5dD6wpAZYfm1flbHXtHSbky+kLpspibFnVG0ttTjLZ7Yb01ym8BI
 m1n0+p7JTKUSg7QKF9EQO0D3APQYWlEkp6xE+3XNSU+2boDUINexC/ZALvZ2kNRyixeT
 mpNFum6M24EsY2aiU+BX+Vok8A1uDtnlHASL53ZP2wnOtON4l9Oow5vEyEdrDtC3ub9P
 u0JX2WIMs1zIabDI/Pxb9u3lWFaE7HXV8W74V56GP12/akF4Zxk5Zp+/BDh198j2KNRi
 EaSc7xc4cCub/YfZB92G7SSlqS0HX7froHmnlg6F1E9tIGONJ54j+c9BteAtKRkuTdMa
 /8Zg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUo8FrpJjVNEzr4JYGDa1nY31Bb2fNWH0HFbDMznH6ATxNg+Y77Hd5Zy+yoDxBN2SEs9MEhMJoSW4s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVvEMhETSj+w6pQty3WGU0D3P/R1bZGm5dFS3rV8+WhUqdgdjq
 ePNA6T/dUBJ5wrwLYcXmI+hVhSuZEw6gGlPg+lDB2kYjLqmawPzBYjIcHGAvChuDw3zghg8tm0B
 nBvJGqCMgOS29q5MHxYq9qK7nqRZymAFaO8d3KPA2ILjmwPYeFcgkFZgKnDhy/P49yiHdWYg=
X-Gm-Gg: AY/fxX7jyaHB9hXCN4fY7vBFJDZolyrHtC1iBQ60bi/1EPHWEdDnGInnHw7QphgiIfp
 +4GcaLHBXcb2QV9GRD2ClGjk9T2yu+AuvUQ7CPsngCneo90R+rQ8IEnWdHimwfjRdHXj7B4nk3C
 KcoM4tFCKvq1yD7VpMn7QI//dZ7gBBWw7NZ+Q/oWfcsATbHtK4fjrPrY8AkOPwSxSGi0RvS4+P9
 iXc0RaCCgnlSNAp6hBXCm5ijMhs3rP4BxuNzE/9/jh3RrgGh6CKZ1vkND7AnORke3UDJM6yQnq2
 plrY+B5z790xq7NscZsC1/WU/WioNichRr+X0lBRLDl50SFGSDLUxwvZgga+8qXpJiBXcpMGmVD
 2JxBhFV43rPMb/UJUWNvz55NgSaXnLzcnj65bJAezTKCAxbqhfgqXH3uU48eUyZwQ1P1e83mFIG
 B64M7HNYAKAfj9kXcBpTxKJL4=
X-Received: by 2002:a05:620a:7102:b0:8b2:7679:4d2d with SMTP id
 af79cd13be357-8c6a6948169mr44166285a.63.1768503054554; 
 Thu, 15 Jan 2026 10:50:54 -0800 (PST)
X-Received: by 2002:a05:620a:7102:b0:8b2:7679:4d2d with SMTP id
 af79cd13be357-8c6a6948169mr44161785a.63.1768503053988; 
 Thu, 15 Jan 2026 10:50:53 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38384d3ded3sm1016811fa.9.2026.01.15.10.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 10:50:53 -0800 (PST)
Date: Thu, 15 Jan 2026 20:50:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/8] drm/msm/dp: Move link training to atomic_enable()
Message-ID: <i2cjyphx5olz4l25pdbt2yso7ryoc4usbnl27ovrou3ih6rptl@prp5lhv56bt7>
References: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
 <20260115-hpd-refactor-v3-4-08e2f3bcd2e0@oss.qualcomm.com>
 <5b4870fc-911d-4574-a0ce-59428cbdf103@oss.qualcomm.com>
 <s5u3th3xw5rbaokoky3zhqhirbmfjljd32oqvyprabkx3xy4uo@tmc2l5domvpk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5u3th3xw5rbaokoky3zhqhirbmfjljd32oqvyprabkx3xy4uo@tmc2l5domvpk>
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=6969370f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=hGIm1wR9W1a6VHt1PZMA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: BxIRk3C9J_iPvW3S7Ua1yh6QIfoF0pmy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE0NCBTYWx0ZWRfX3BF3gxX5aEyU
 LDxsFpv+pKOZ8DotuFiTJPbw/c2d4VsRCkeI+mLZ/tXchfL93HSeYvqTXdEVpPDfVyo/Q99Z0bM
 IUTlBl+MOh6OB10A2Tl3UlsXNgQyQEACxC8tryd9ABwJh6iw6ml8TLVapqaKm74xf1LLVs7lekB
 DFZpWYSosrrcmnBhpmr6sqoVtcV5+oMNdzg4WSptyWN6xAF9ts2ME8UIMayNrPFl1UhbmX9MBZf
 RFXekGBTnWfvohp255Zx9OPojPU8vedii/sDPwUumje5sob7joCkwQ6LNy4puagvEv7zu/KmQ3c
 VLG6MiBSSC7PFkka+Ne+MFut2nJ3xM4I+9/B8ZizVfXsJRD7rmSOwQvwOjcPIaDXy3nUSgtf9bF
 QV17mWmaPvKuBWoNWC/pBMbI+6NGaChlmBzcvCctwGxj3cXDARi3vBkLL1jQxPrBZH1iNkUUkTe
 7AfT468zVJJaKLm5NnQ==
X-Proofpoint-ORIG-GUID: BxIRk3C9J_iPvW3S7Ua1yh6QIfoF0pmy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_05,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150144
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

On Thu, Jan 15, 2026 at 09:39:29AM -0600, Bjorn Andersson wrote:
> On Thu, Jan 15, 2026 at 10:30:49AM +0100, Konrad Dybcio wrote:
> > On 1/15/26 8:29 AM, Dmitry Baryshkov wrote:
> > > From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > > 
> > > Currently, the DP link training is being done during HPD. Move
> > > link training to atomic_enable() in accordance with the atomic_enable()
> > > documentation.
> > > 
> > > Link disabling is already done in atomic_post_disable() (as part of the
> > > dp_ctrl_off_link_stream() helper).
> > > 
> > > Finally, call the plug/unplug handlers directly in hpd_notify() instead
> > > of queueing them in the event thread so that they aren't preempted by
> > > other events.
> > 
> > I think this part of the commit message no longer applies 
> > 
> > > 
> > > Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > ---
> > >  drivers/gpu/drm/msm/dp/dp_display.c | 11 ++++++-----
> > >  1 file changed, 6 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > index a05144de3b93..3184066adb15 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > @@ -436,11 +436,6 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
> > >  	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
> > >  
> > >  	msm_dp_link_reset_phy_params_vx_px(dp->link);
> > > -	rc = msm_dp_ctrl_on_link(dp->ctrl);
> > > -	if (rc) {
> > > -		DRM_ERROR("failed to complete DP link training\n");
> > > -		goto end;
> > > -	}
> > >  
> > >  	msm_dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
> > >  
> > > @@ -1695,6 +1690,12 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
> > >  		force_link_train = true;
> > >  	}
> > >  
> > > +	rc = msm_dp_ctrl_on_link(msm_dp_display->ctrl);
> > > +	if (rc) {
> > > +		DRM_ERROR("Failed link training (rc=%d)\n", rc);
> > > +		drm_connector_set_link_status_property(dp->connector, DRM_LINK_STATUS_BAD);
> > > +	}
> > 
> > Previously failure in this call would have propagated an error
> > 
> > msm_dp_ctrl_on_link() enables mainlink clocks, so 
> > 
> 
> Missed that one. I guess in practice it's not much difference from the
> previous behavior - where the display just wouldn't work either, except
> for the crash you point out below.
> 
> It seems to be that it would make sense to return an error to userspace
> when this happens, but the kernel-doc says:
> 
> """
> The bridge can assume that the display pipe (i.e. clocks and timing
> signals) feeding it is running when this callback is called.
> """
> 
> What's the expected error path here?

None. The only thing we can do in atomic paths is to set the bad
link_status and be ready not to crash (especially at the disable()
path).

> 
> Regards,
> Bjorn
> 
> > > +
> > >  	msm_dp_display_enable(msm_dp_display, force_link_train);
> > 
> > IIUC this will crash the machine if the above fails
> > 
> > Konrad
> > 

-- 
With best wishes
Dmitry
