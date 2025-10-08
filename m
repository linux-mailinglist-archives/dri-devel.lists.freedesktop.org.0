Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E4EBC689B
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 22:06:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7858410E8D6;
	Wed,  8 Oct 2025 20:06:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LMx6Ohwh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE43310E8A4
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 20:05:59 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5Kw8004532
 for <dri-devel@lists.freedesktop.org>; Wed, 8 Oct 2025 20:05:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=95/iYHyDl4vmA4hj/jHcPunB
 Q7LfZPuixFnm3qR123E=; b=LMx6OhwhRPYy3byRvajlWZ0h6d91KiH9Hg9+6QJI
 E1+ZIW9ydOhsHjiQI6cLTaGrrMWq2Im5D3mQyaXZar5/f2ae6JzA8YM29+c4aNgq
 2z0cpBNo+t5B7Zh2PbyAgVN2p6JO3wOv9V1V0nQ1HBfW3vZb7E5yvOuDid5R8UxO
 Qlu/Ywnrtl3oelhMmvqeE1UuKvSW9giWcwcttNES+mwRKm+1nzHLvNF+Bk1G0nB5
 9bGGAoJvL6EUkXx+9pS+45U/YxMy9QE7cj66eR7Pv6CC8YQ0bYG26h1LyJK4LlKH
 m1mcubK8SdOCwtuCl1za/2PCQey5edNG4Tb9TkktWucZKw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4krerr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 20:05:59 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id
 71dfb90a1353d-54aa5401327so103197e0c.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 13:05:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759953958; x=1760558758;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=95/iYHyDl4vmA4hj/jHcPunBQ7LfZPuixFnm3qR123E=;
 b=IiF352yxdsq/AfCAKINSuRwhEs3rEuy2tcfyjvLcqbMdYo6EMoAfVfuNJBLd9lfl1A
 SjCmCgZ5qOiHH0Lsb7LU3nyOOxuV529Z3nHE8sk4D7Agb+EVpovtrzfb7laPkXxb8M+Q
 NVcchLHAJJKNhST4fJI+9KnstngbJqHqwxmWc0sV2qYAbqX6HjosUxbnmrLHEP/xZwkb
 4oZDL4KBKyiphoVq52+GTs6zlCThPJ3gs3CMrrdUAmXSYJ5KpbzBHn22gWGRX4jgDc3e
 7108KPCSq2IoSwtni73U4I3A7bUj7LLvgTStymmeuKw0iEUDXh6fkUHwm6o+GY7D4OpJ
 eCsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIedNKGb0+bCKBt/0N+WtuaNBG5LQmkckSu8jO5WdX8OSIREqFiWFQjVPD4PypwyZYuVf/VEwwzkA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0udtmnGOCU7+RTHGjYY0pyG0rXqpj+OaUR5EP0yfaA9+AjWQJ
 cgoQGxceHl7Ep4odDk8GFpDXaAVmvSxxy1qpS9iUMvrSpgO3CviHkEQH7Y0k+5WnLY6ES8y9VzP
 AgVAD8BuX5cJuWOm8IrDsm3H/2r/vmuBzZKau+0TVHB2vg/5xyoMeFlKXZxpA3LQI7UCTEAE=
X-Gm-Gg: ASbGncvagLVs0TdDvJmA4gQMILE9fGtiw9sIcuqeygfclwGEU1Fyl5tle7ZKJ53Dj2Q
 pQa4iRo1loB60YbTcM9ubdVtUGh7N4gsk8ujjLWzlSRZjtb4wx+JhMNNKgiJZF2Nh/9ixBbSoTe
 k9N5m3eeqnGWzTs1zCU4yj/zwsh94++/IvU9eWiIsipBBa+FaxGdX2S7/NV6+RHBPkM2AxYlHvb
 WfKg/rbD5IXkwgC7Zr0TqP6Ni+/UnolF4MaicWMx9cWoAgzYYSNrOw2gFgnAZexfXzcH12Pn2ve
 8m+T5zASocSWvQumPz/L6l4iveFiBRAq/TLBSEzR5QFNzve3hAckG1+Q6k21TRNzcGXjFt/Eu7g
 pcjG5jgXQgzqZE3NpsCF15Svxoqz6qVNOtmT6rK6XHn4PLxaYKmqcEEh74g==
X-Received: by 2002:a05:6122:8c7:b0:53b:1998:dbf5 with SMTP id
 71dfb90a1353d-554b8b39aa1mr2239510e0c.1.1759953957629; 
 Wed, 08 Oct 2025 13:05:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEl7fOxPxx20GF4ALLTOqSR9r8TJV/qd+qF65hUWvLJA7cdPGmSfYQqV14+SKxf9ofMClXmnw==
X-Received: by 2002:a05:6122:8c7:b0:53b:1998:dbf5 with SMTP id
 71dfb90a1353d-554b8b39aa1mr2239490e0c.1.1759953957141; 
 Wed, 08 Oct 2025 13:05:57 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5907ad9e048sm301512e87.75.2025.10.08.13.05.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 13:05:55 -0700 (PDT)
Date: Wed, 8 Oct 2025 23:05:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Garg, Nemesa" <nemesa.garg@intel.com>
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "G M, Adarsh" <adarsh.g.m@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH 01/10] drm/drm_crtc: Introduce sharpness strength property
Message-ID: <mqvmv3bqikoekjhhwqifzatzouxym4yy4eab6bb2zjhzlv2tfw@l5iumy2ybngl>
References: <20251001063500.1259687-1-nemesa.garg@intel.com>
 <20251001063500.1259687-2-nemesa.garg@intel.com>
 <epzspujsf2o4wq5ykswe7a3hvrb3vy5wgenglfopmkuepyfstm@5kkpxstpyc3r>
 <IA1PR11MB6467E47D1D61DE21DCC2B9EAE3E1A@IA1PR11MB6467.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA1PR11MB6467E47D1D61DE21DCC2B9EAE3E1A@IA1PR11MB6467.namprd11.prod.outlook.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX5Vrx7MEWZdqK
 dZFQQGGpf5ErKf1o1z3tbckfHnxfMrlGAzhB0mitnSkt4kZK3EIdklkgUEW1AO6gQGQFajjX/RT
 mU1S1B5jhccntmZdlUFS9KQ+Hc4PiCzEu7+HdD4tE9NGZYUEWrxE3t4Ge7kaMDtMxfaRrljO94b
 m1ospEXn8O5FjVXtt9NibkZfuBNPHmLVlY7SGYi8D4HtkodltgxVTmD6FKF2bqyJlCmBqfO8AYB
 xhNcGYc3IG3CAa/0cp5tnoXQGH7FVlFfBU5ifezTwyyClA5TrHl5yccEGOMbHM4QCMFJoU5RcLX
 VKjw/EGQvkKZNBFFoBxwyFPmenKpZ88xSP3mFWP4pVlmiMTw8Vm3Py8dlAiwsEhX7LWICdqUIdS
 nfLYu4ocTi7liCqO0JHTZ7ZKZU9ldw==
X-Proofpoint-GUID: cf-rWvUnXQdM2KMPqFSOnnHSLUVJyE5h
X-Proofpoint-ORIG-GUID: cf-rWvUnXQdM2KMPqFSOnnHSLUVJyE5h
X-Authority-Analysis: v=2.4 cv=SJxPlevH c=1 sm=1 tr=0 ts=68e6c427 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=e5mUnYsNAAAA:8
 a=a-h1K1YzEVxaE0wpvGgA:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
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

On Wed, Oct 08, 2025 at 07:22:00AM +0000, Garg, Nemesa wrote:
> 
> 
> > -----Original Message-----
> > From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Sent: Saturday, October 4, 2025 3:38 PM
> > To: Garg, Nemesa <nemesa.garg@intel.com>
> > Cc: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org; dri-
> > devel@lists.freedesktop.org; Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>;
> > G M, Adarsh <adarsh.g.m@intel.com>; Simona Vetter
> > <simona.vetter@ffwll.ch>
> > Subject: Re: [PATCH 01/10] drm/drm_crtc: Introduce sharpness strength
> > property
> > 
> > On Wed, Oct 01, 2025 at 12:04:51PM +0530, Nemesa Garg wrote:
> > > Introduce a new crtc property "SHARPNESS_STRENGTH" that allows the
> > > user to set the intensity so as to get the sharpness effect.
> > > The value of this property can be set from 0-255.
> > > It is useful in scenario when the output is blurry and user want to
> > > sharpen the pixels. User can increase/decrease the sharpness level
> > > depending on the content displayed.
> > >
> > > v2: Rename crtc property variable [Arun]
> > >     Add modeset detail in uapi doc[Uma]
> > > v3: Fix build issue
> > > v4: Modify the subject line[Ankit]
> > >
> > > Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> > > Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> > > Tested-by: Adarsh G M <Adarsh.g.m@intel.com>
> > > Acked-by: Simona Vetter <simona.vetter@ffwll.ch>
> > > ---
> > >  drivers/gpu/drm/drm_atomic_uapi.c |  4 ++++
> > >  drivers/gpu/drm/drm_crtc.c        | 35 +++++++++++++++++++++++++++++++
> > >  include/drm/drm_crtc.h            | 18 ++++++++++++++++
> > >  3 files changed, 57 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/drm_atomic_uapi.c
> > > b/drivers/gpu/drm/drm_atomic_uapi.c
> > > index 85dbdaa4a2e2..b2cb5ae5a139 100644
> > > --- a/drivers/gpu/drm/drm_atomic_uapi.c
> > > +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> > > @@ -419,6 +419,8 @@ static int drm_atomic_crtc_set_property(struct
> > drm_crtc *crtc,
> > >  		set_out_fence_for_crtc(state->state, crtc, fence_ptr);
> > >  	} else if (property == crtc->scaling_filter_property) {
> > >  		state->scaling_filter = val;
> > > +	} else if (property == crtc->sharpness_strength_property) {
> > > +		state->sharpness_strength = val;
> > >  	} else if (crtc->funcs->atomic_set_property) {
> > >  		return crtc->funcs->atomic_set_property(crtc, state, property,
> > val);
> > >  	} else {
> > > @@ -456,6 +458,8 @@ drm_atomic_crtc_get_property(struct drm_crtc
> > *crtc,
> > >  		*val = 0;
> > >  	else if (property == crtc->scaling_filter_property)
> > >  		*val = state->scaling_filter;
> > > +	else if (property == crtc->sharpness_strength_property)
> > > +		*val = state->sharpness_strength;
> > >  	else if (crtc->funcs->atomic_get_property)
> > >  		return crtc->funcs->atomic_get_property(crtc, state, property,
> > val);
> > >  	else {
> > > diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> > > index 46655339003d..a7797d260f1e 100644
> > > --- a/drivers/gpu/drm/drm_crtc.c
> > > +++ b/drivers/gpu/drm/drm_crtc.c
> > > @@ -229,6 +229,25 @@ struct dma_fence *drm_crtc_create_fence(struct
> > drm_crtc *crtc)
> > >   * 		Driver's default scaling filter
> > >   * 	Nearest Neighbor:
> > >   * 		Nearest Neighbor scaling filter
> > > + * SHARPNESS_STRENGTH:
> > > + *	Atomic property for setting the sharpness strength/intensity by
> > userspace.
> > > + *
> > > + *	The value of this property is set as an integer value ranging
> > > + *	from 0 - 255 where:
> > > + *
> > > + *	0: Sharpness feature is disabled(default value).
> > > + *
> > > + *	1: Minimum sharpness.
> > > + *
> > > + *	255: Maximum sharpness.
> > > + *
> > > + *	User can gradually increase or decrease the sharpness level and can
> > > + *	set the optimum value depending on content.
> > > + *	This value will be passed to kernel through the UAPI.
> > > + *	The setting of this property does not require modeset.
> > > + *	The sharpness effect takes place post blending on the final composed
> > output.
> > > + *	If the feature is disabled, the content remains same without any
> > sharpening effect
> > > + *	and when this feature is applied, it enhances the clarity of the
> > content.
> > 
> > I can repeat my question from XDC: should we extend this to negative values,
> > allowing softening (unsharpening) the image?
> > 
> Hi Dmitry,
> The un-sharpening or blurring is a very valid usecase in pre-blending where certain layers (data
> From clients) can be un-sharpened while some other layers can be enhanced with sharpening.
> This helps give  focus to the particular content and suppress the background.
> 
> However, this current property is targeted for post blending so will be
> applied to the entire frame on screen, here sharpening only is the intended objective.
> 
> We can pursue a pre-blending solution to target the un-sharpening case as well as a separate interface.

Indeed, I'm more interested in a per-plane sharpen / unsharpen property.

> Hope this is fine.

-- 
With best wishes
Dmitry
