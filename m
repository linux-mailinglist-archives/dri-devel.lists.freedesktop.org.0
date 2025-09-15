Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00229B57BF1
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 14:54:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C5710E48E;
	Mon, 15 Sep 2025 12:54:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eu/s6Ih9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 053FB10E48E
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 12:54:19 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F8FgVD014076
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 12:54:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=o0T8uyDJ7tOU3W9Euxtpr2nB
 WWgLIb6UxinGBw7EkVs=; b=Eu/s6Ih9acp92r/ty4Em8hZPAU92SYR2vN58BaoB
 NWe1Ls6CQll88f2PgD9zLmkJWD3vQDKqyjq9HVEl8Hdxn6+qWdj+3q2ZGkUNvjuy
 +Jf61RdNv57W1pucmcann7nGZwp3aI27yl8mmM6cJpv+TCNliOdiw84ZEGlbISJR
 kFmE2xhqzg/CeXgtdLAYblQ3KEMNxxumz56DF/LCdIbyA8TJzoU/WKnrdiBm671y
 SZvvZI8mW8d1+WKoJHt4Gimai72RSn/6Hrs25pS+5/WwAU5QqSFrpyI5xv8EYZwS
 NTgC+9JTlhCVYiGy1y/vYhYdM/EZyuNhKO4GtI4mALlOOw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494wyr55em-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 12:54:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b5f290579aso89682541cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 05:54:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757940858; x=1758545658;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o0T8uyDJ7tOU3W9Euxtpr2nBWWgLIb6UxinGBw7EkVs=;
 b=VXYcDfdBqF8MEud92RbjUcoyVHJnRJ4nP683wsnBp5D/AZlY1KKUMK65durOrZEaig
 1KNMWD+9o15Yy8UgZT7yn8m4gkeRRzyr3D/ezlVZX0JrxIokTVE6cZ0DDTZszARhy0NW
 mDjBQ8M7xi7+3E1XPBkpNLnV8QIY0kr5M6kdRnchwHX+8LHZBhGM7lAu0xXJzcB2WD/j
 RrV2LwFbYeAGLWNyRrwdAfn39x5WzmHzn3WuEM1Tln/oSXh16BIduL7PGtXbZoipN62e
 u9tUaBXSPeddgMJUgAVuNvnOfoAsFWB/hFYnPrnntPtE8fTULvBqav5N4YAAdARzZTAl
 /XPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2YJCH86KN9mwRHwwj1Am5vD1Xzd5M9m/ZnMwsdCOr3AF+tHoJWqn6dOsjHeNNloomAGXoWGe4hFM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxgJYnFctRkH5NMj39Q12XbY6XnEx3eMDvdWdMrB6/knnf1kCRh
 KuFBs4xqS+towJ2WeZ6isNBvOv1kycEm9rrTaDT+TLccPIz6Fl4o2QFZ2+oQtHV6FGfTzGsHbuV
 KG6VH2ByuXWLsUQcTulh3mndmo7j/e3HiKBPBIrUPXOFMInxu7aLMElQF52jF20gBW8Xiko0=
X-Gm-Gg: ASbGncssWR/Ug7bS8Z2oboMPErRaz+6YhxARdRJVsiLH+og/t8znrcfLBbKtaJcAHWK
 FdnI3cDTD1lNOrZgqLiUsDd9aOSlFs93GGJO22ov0yyMYkLQKDEDYhyWK1vysHTXwH/8Y0gn94u
 UZHMOpmmvPEs4Q6jB037HoNeQ8rFQl9KzT/p6Kibz1wXLuf4AVY5o+DcEuQpepBR3N/HX5VbKx7
 nkPUsn7Pl6Wb5yeXPSjpZ0gtooBFn3hGOfu+8ri0ohNLXeVtdFUju6Y2YA/eh3ETkedvZ+I4Nsp
 RWXMNmwXubpOUq5rM5cdi6FaGtdtkF/YVTNozbgAGNnZdP+V672PJ8zR5oY79aIygwcHKralOjx
 Vneh8FELU6Ux5JQK7aRoCbBpGF4+QT1JUs5KPAD1r9/8KSUgA5sLu
X-Received: by 2002:a05:622a:114b:b0:4b2:f786:92dd with SMTP id
 d75a77b69052e-4b77d057aaamr140665771cf.57.1757940857949; 
 Mon, 15 Sep 2025 05:54:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFK/Dntm41+HPvtouzaomkvJm85bXcfqIOmnG7ih6nBJsgKKnkSKf2PgTx38rP0sVjrJYYKiQ==
X-Received: by 2002:a05:622a:114b:b0:4b2:f786:92dd with SMTP id
 d75a77b69052e-4b77d057aaamr140665411cf.57.1757940857417; 
 Mon, 15 Sep 2025 05:54:17 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-34f1a8212d8sm25926991fa.36.2025.09.15.05.54.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 05:54:16 -0700 (PDT)
Date: Mon, 15 Sep 2025 15:54:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Devarsh Thakkar <devarsht@ti.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/29] drm/atomic_state_helper: Fix bridge state
 initialization
Message-ID: <epllmgesjxcnadjjsaeotgsdw63eu4uyx5q7zifn2gkudfi7e7@oirj5aiv47qf>
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
 <20250902-drm-state-readout-v1-5-14ad5315da3f@kernel.org>
 <9f17dfd9-a4d4-41e9-b988-bd8ca858e5e7@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f17dfd9-a4d4-41e9-b988-bd8ca858e5e7@suse.de>
X-Proofpoint-ORIG-GUID: xFT74Yvk74XAsqivBtFyILrMggVtPGLa
X-Authority-Analysis: v=2.4 cv=SouQ6OO0 c=1 sm=1 tr=0 ts=68c80c7a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=ZlCgwJgu-Kaulvl6kbsA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAwMCBTYWx0ZWRfX+nac1vzRDRGJ
 rbIdBzI/8yOxQDkQrFTWwKWQVO4HVoQs4caBRtyQgwymb3KZNJuxgAzrG7MHEvMmcXIY52aK4VA
 ot2svyhsaCHYOGGdLMPJbXWO7BuDl77hA04FP6J/QCZfm5a5NsXz+5OEdJJ9ivhPjPWpgDBpdNm
 7NnIhIkO/uajisTAwXVGEO4+3Tn5W1Gpzmgf9v5GMrsq9zuzWX5YX70zySDWbdMgK7CoJfiUA1T
 oxqixvAyOMOTF3CnF25dAdHQJ1fb1MvzTRY/7z2GCpOGEc9DTW4zFdd+Xa6rpEVr/NbN9cTOYOn
 HTrBYbE3ry1KroQ0rEar31S6z+t/ywrgU21Jfhwib5ffH2nIjty0vhFwZhfXf/gBh4Jwd9mhWGX
 uVvbJGV9
X-Proofpoint-GUID: xFT74Yvk74XAsqivBtFyILrMggVtPGLa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_05,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130000
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

On Tue, Sep 02, 2025 at 03:18:17PM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 02.09.25 um 10:32 schrieb Maxime Ripard:
> > Bridges implement their state using a drm_private_obj and an
> > hand-crafted reset implementation.
> > 
> > Since drm_private_obj doesn't have a set of reset helper like the other
> > states, __drm_atomic_helper_bridge_reset() was initializing both the
> > drm_private_state and the drm_bridge_state structures.
> > 
> > This initialization however was missing the drm_private_state.obj
> > pointer to the drm_private_obj the state was allocated for, creating a
> > NULL pointer dereference when trying to access it.
> > 
> > Fixes: 751465913f04 ("drm/bridge: Add a drm_bridge_state object")
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >   drivers/gpu/drm/drm_atomic_state_helper.c | 8 ++++++++
> >   1 file changed, 8 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> > index 7142e163e618ea0d7d9d828e1bd9ff2a6ec0dfeb..b962c342b16aabf4e3bea52a914e5deb1c2080ce 100644
> > --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> > @@ -707,10 +707,17 @@ void drm_atomic_helper_connector_destroy_state(struct drm_connector *connector,
> >   	__drm_atomic_helper_connector_destroy_state(state);
> >   	kfree(state);
> >   }
> >   EXPORT_SYMBOL(drm_atomic_helper_connector_destroy_state);
> > +static void __drm_atomic_helper_private_obj_reset(struct drm_private_obj *obj,
> > +						  struct drm_private_state *state)

Which should probably be used for other private objects. Do we have a
good place to add a warning on state->obj being NULL for all private
objects? It looks like we have only drm_atomic_helper_swap_state(), but
it feels weird.

> > +{
> > +	memset(state, 0, sizeof(*state));
> 
> This argument is guaranteed to be zero'd, I think. No need for a memset.

In this case, but not in case of a generic object.

> 
> > +	state->obj = obj;
> > +}
> > +
> >   /**
> >    * __drm_atomic_helper_private_obj_duplicate_state - copy atomic private state
> >    * @obj: CRTC object
> >    * @state: new private object state
> >    *
> > @@ -796,10 +803,11 @@ EXPORT_SYMBOL(drm_atomic_helper_bridge_destroy_state);
> >    */
> >   void __drm_atomic_helper_bridge_reset(struct drm_bridge *bridge,
> >   				      struct drm_bridge_state *state)
> >   {
> >   	memset(state, 0, sizeof(*state));
> 
> Another unnecessary memset?
> 
> Best regards
> Thomas
> 
> > +	__drm_atomic_helper_private_obj_reset(&bridge->base, &state->base);
> >   	state->bridge = bridge;
> >   }
> >   EXPORT_SYMBOL(__drm_atomic_helper_bridge_reset);
> >   /**
> > 
> 
> -- 
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
> 
> 

-- 
With best wishes
Dmitry
