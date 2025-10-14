Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B741CBDBA87
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 00:35:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D51810E060;
	Tue, 14 Oct 2025 22:35:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="h4qna4p7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D936B10E060
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 22:35:54 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EKRK8J000785
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 22:35:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pAchcL5TC5LbBHq3agrHPlQT9VzsE9lDZOq2eG6E55c=; b=h4qna4p7itb4daGx
 xQLC5WBad0xAoI9IgyrYQ7wmzhiEzCjcJNaDQXttlIZ8LRDwfZAevat9qdbncS4t
 45rpsHl1q9SnPDJKqAt/SUdj+cJ986b4a/5RDGiZIFgFoteRBOWc8jCIcj2+PES1
 cNkrfRAZJzecv1QrD0rpm4iOOF6KTw6ieP0eiCgL8XsE5QD02R6y9HsPmvEZ3f0l
 JRH9M0HzrV0vKFLhQkpY7FsTe/wfYJdlOoNodWfpS9j/ok6Y+QwFauF7vGDFZ13R
 soWvZ2xyctvttsw9an4gt16ReqbSu9CpZOWXnKViw2lfuExkxHsnPi8sDkNQEHB6
 9qF/PA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff0t7m5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 22:35:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8574e8993cbso1233281285a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 15:35:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760481353; x=1761086153;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pAchcL5TC5LbBHq3agrHPlQT9VzsE9lDZOq2eG6E55c=;
 b=W7qzeLYKWmeTBv63HKrr0Bq/TB8odgLuxpEsd8YWqNH5ozcFZhmscxrT7mlmHhrWq8
 nbza9khhYaduWC+yf/1rOMpqhWG27OmGdRQxHzKNp/347arsae8ZRlJV2G8sLBQtuBLf
 XUb3EPrUkOSYx7y5Ba4oaZtM6u4sI0EFuenRyMG76JrtFVMln43AA5+KwP4V3YsAhqLq
 NhtVPq8D/iiGQvXtaXURcFHDFTi3OJAZHvHIwGXYVWcmmO4wiXtwiZG2litCCeAgQxxI
 TcBgkfVE4i5YBGoEzSVKUYDFgBM/3lC/3xIwXl0dh5p7e6H8XsGtn3sy3RS9pX4nKC18
 NyDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW31+z0TyPaQ6llLhepDhxRjPq4uSC7JYkMtF8NjOKPRPglBd9umn7U2k7mg58/SVG66k8mxmeGCH4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNx0qYiKHy2hJXWOwY5D2ZQBWmCF7Z14E2cxCzgn58o+W/v9fb
 J/Br2bTkgOgE1AR6T3PT6yl4+VYetqkd+e8Ui288NuaLTxIk1mDPEwJYOpDAtK3RUQOFgJK+shF
 ndX7ZQMw3CkYvtYK3O47VdYnmWkKRyIASeknTAltJhOY1Aw+6m2Bre4Y1g62mTNZjK3dbags=
X-Gm-Gg: ASbGncvGJfFVsQLu/SBr0ekOTdcKmxcHrk3Ijy2fE8GuQaUcy6n5afrFDTOiG/ycKJm
 Or0vbXJKZSqtQBjkm61njjBWFpkVMDfrIZ/0m0ZVf/KvjYin4YZa9zyXveNO65QiR9eCJcoq/Sm
 gaxiAldE36CMbzmmSRGI7Fp4j+sTwtqFGq/1ZFYlRHtpMlONYanRI7VfB+q9pdqfXXcI0YOpGNV
 3gro+p1TrPxCwxRfcI0N+wTUqjgo3Mpwx4N1I6I9huqKwiAtJ4zqhqRyd12dQT+mB/GCkSh8q0+
 fOu5hb/jQRn0lMIuLoxei6+/YFhd2795OqSzAbN6OwGJa305VgtLMyY1FazrumVbWC97SfcqXFB
 DCmIhj3+RNnVsKBTa/cjTGqUm2qjW4kAmcwBuPmK+JF4Awv8k157j
X-Received: by 2002:a05:620a:1a82:b0:864:c4b9:da16 with SMTP id
 af79cd13be357-883570ce5e8mr3995522485a.73.1760481353144; 
 Tue, 14 Oct 2025 15:35:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGg3R+WhZNU3zN7K1TCOTqZWG3wcFOUoC1PkhWReIK96m9zDJw8r7qvxd4DQ0rvgcMg8Frt9A==
X-Received: by 2002:a05:620a:1a82:b0:864:c4b9:da16 with SMTP id
 af79cd13be357-883570ce5e8mr3995520185a.73.1760481352666; 
 Tue, 14 Oct 2025 15:35:52 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-591c990f5b4sm130549e87.9.2025.10.14.15.35.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 15:35:50 -0700 (PDT)
Date: Wed, 15 Oct 2025 01:35:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imre Deak <imre.deak@intel.com>
Cc: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 05/16] drm/dp_mst: Switch private_obj initialization to
 reset
Message-ID: <hzj77xgrwfcsv5zsuknazt3kgdctvtho7wgagu5bonq2nfwb2l@rubsf75usj46>
References: <20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org>
 <20251008-drm-private-obj-reset-v1-5-805ab43ae65a@kernel.org>
 <aOZv88NgbjmT49N1@intel.com> <aOaQLx-7EpsHRwkH@ideak-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aOaQLx-7EpsHRwkH@ideak-desk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX2YucsnIfNcMK
 o0SE3O9GR2cWj3dyrxlN4LrU+DpYAtus9DKkPo/+PH/uJwDE1eWMQUNIXj7OZWjoGVAsemtzxyW
 qe7p5NqxjDO+wkX/VBu+iDdceohESAgsd7xCUBUlzF/dIUeNEFO5L4jSMNH51/awrIiopeMA56J
 RgQkPk/Ss8iWcNjYzT0dmnTphUlDAMKIF2EMOhJrKX1Q34sQWoU0e3/QaEGkIRvjL1rPEfuN5tH
 1+/8Vab5QnukkUUj6zUFa8t7/jVdlE/cxcBA573wdmVggZ3Th2v/v9KevsUDdMsDJQZBcFC8lrY
 QhqepEmCOtA6IG7vha3YsAEMtGk/QSZQ+VY8qz2DA==
X-Proofpoint-GUID: dcdTTQIFqmQBXhLEXEIDI6PjhFAJtz84
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68eed04a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8
 a=xkrmkk9xm9al6zzcAa0A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: dcdTTQIFqmQBXhLEXEIDI6PjhFAJtz84
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
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

On Wed, Oct 08, 2025 at 07:24:15PM +0300, Imre Deak wrote:
> On Wed, Oct 08, 2025 at 05:06:43PM +0300, Ville Syrjälä wrote:
> > On Wed, Oct 08, 2025 at 02:04:03PM +0200, Maxime Ripard wrote:
> > > The DP MST implementation relies on a drm_private_obj, that is
> > > initialized by allocating and initializing a state, and then passing it
> > > to drm_private_obj_init.
> > > 
> > > Since we're gradually moving away from that pattern to the more
> > > established one relying on a reset implementation, let's migrate this
> > > instance to the new pattern.
> > > 
> > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > ---
> > >  drivers/gpu/drm/display/drm_dp_mst_topology.c | 39 ++++++++++++++++++---------
> > >  1 file changed, 26 insertions(+), 13 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > index 64e5c176d5cce9df9314f77a0b4c97662c30c070..255fbdcea9f0b6376d15439e3da1dc02be472a20 100644
> > > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > @@ -5181,10 +5181,34 @@ static void drm_dp_mst_destroy_state(struct drm_private_obj *obj,
> > >  
> > >  	kfree(mst_state->commit_deps);
> > >  	kfree(mst_state);
> > >  }
> > >  
> > > +static void drm_dp_mst_reset(struct drm_private_obj *obj)
> > > +{
> > > +	struct drm_dp_mst_topology_mgr *mgr =
> > > +		to_dp_mst_topology_mgr(obj);
> > > +	struct drm_dp_mst_topology_state *mst_state;
> > > +
> > > +	if (obj->state) {
> > > +		drm_dp_mst_destroy_state(obj, obj->state);
> > > +		obj->state = NULL;
> > 
> > I'm not a big fan of this "free+reallocate without any way to handle
> > failures" pattern.
> > 
> > Currently i915 does not do any of this, and so there are no unhandled
> > points of failure. But the mst and tunneling changes here force it
> > on i915 as well.
> > 
> > I think for the common things it would be nicer to just implement
> > the reset as just that "a reset of the current state", and leave
> > the "let's play fast and loose with kmalloc() failures" to the
> > drivers that want it.
> > 
> > That said I haven't even thought through whether this mst and
> > tunneling state reset might have some undesired side effects
> > since we previously did none of it. I suspect it should be fine,
> > but at least the mst code does some questionable things with
> > the state so not 100% sure.
> > 
> > Imre, do you recall if we might somehow depend on preserving
> > the state across drm_mode_config_reset()?
> 
> Yes, the stream payload info in the MST state and the stream BW info in
> the tunnel state is computed for the active streams (i.e. CRTCs) before
> suspend and this info is reused after resume. These active streams must
> be restored to their pre-suspend state after resume, which will need the
> above payload/BW info.
> 
> The restore should happen without recomputing the state for CRTCs, so
> the payload/BW info should be also preserved across suspend/resume.
> 
> crtc/plane/connector objects which have the reset semantic added now in
> this patch for private objects do preserve their state across
> suspend/resume, see drm_atomic_helper_duplicate_state() and
> drm_atomic_helper_commit_duplicated_state().

Doesn't this mean that we should implement handling of private objects
in those functions too? E.g. we track resource allocation in the private
object. It should also be restored to exactly the same state as it was
before suspend.


-- 
With best wishes
Dmitry
