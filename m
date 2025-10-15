Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB21ABDBE6B
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 02:17:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC95510E6C4;
	Wed, 15 Oct 2025 00:17:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nMiTsaAF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3EAC10E6C8
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 00:17:18 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EKRDPU017039
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 00:17:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=GSA8IE0mdq+dAqjpVyxQIpbb
 q47ChJcfkwB+wY+12Vk=; b=nMiTsaAF9LXdEunLyt3bB6MJdhLVDmpBhutraKJ4
 FLoTH6Ua3xZNroGkylHJs2CLNW8bh25IUnzA8US6WxXcti2n/etbc8vWpDTZV8Zl
 0q2KpXvxXbypzn3r/s2kD+sncH1uTvF5MkyJufze1w+iJFpF9QJc55/sjMFnm7QH
 w0naD/mk9egD540nRD4RaTBQ485hJGtJwqYptqexC1SLh2C1Hmi5GkYYZpg2M+qC
 JzEEyupbqxdsXjB3xt4dBsGx98Do82t8TAOFY5rbOD09asMuCF5EKJzOLsGYB9h1
 8n2VTb3/QFKoXpOTQPsMB4FR9V1bE034IZLZDDhiiWFP+A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfbj2g9c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 00:17:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-88e2656b196so83464985a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 17:17:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760487437; x=1761092237;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GSA8IE0mdq+dAqjpVyxQIpbbq47ChJcfkwB+wY+12Vk=;
 b=Dr4kuroeVMKHz9G2FOmGMAZVPA0tZF80fh3BOMT0/IcHuTy1248d8tG3Sqsb5JDUbl
 92I2vzyxb2MgQ1dyQRi3AXlzmxZH6H6JKXd00Mq+6Z0wilblrjW3SbUd//uMLy79lX05
 bZprO9BedPrbYzqrGxXBPljFnpBwsTP1D7+R9Hr/CjdOBovYvCC9+QxaoOE6D13TCp/X
 gyMxidJ/7scvWyjN2qBaLrqxJceu/xeMNej05lvneAqoEfuvxgbjUQs/otMBukw9Y32g
 H3PZsEJE5ZoWNes9Z4ZNjRMJ4HApSEhvh1DKLAH7e7+JigaQY9dBhYZnLQTXbAzfhBJA
 YhWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfQ2WOZQr5M10Y3E2WhVmBJJuKghWjVxN1VYm28r5dJFG/y1O4kxiycOeyQmZ3aaJ1LZzncAPhUTk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3l8E/YuvV4BDGaykKphw1pvM9gf1MSMAc35XH3QyctP9jPNZc
 5KOhJs3uk9Xgny9mNFOUO1cTcfXFZ2VRnqcXZZXCOT7ieJ6er2eZKuo90XcvskT2amA9m+guddt
 oLbRyhOH72miGUwJnqQKSqKrmg6et39Ya1z/XHcXGgb21/zBDJS5hIS335g2ZQHzuMdiv5Zo=
X-Gm-Gg: ASbGncunJnAd2TrJcRVsLUVRtI+7V2qQYIk1cV9euwuLmJrZSdkVGlno93Yp+9RUQO6
 1GQ/GvuGC/9BPK9AP+w7O94AqqA0D6FUnRW6Hb+ffCZjU2h4CHKSNMCSszTRGnLfs14sJUJ48v8
 7twcR0uZMpvvd4sbaFPrExTsT9rvREMyrJtZiVfSy1HVggyqdvhZf4auN5nFwyoXUteDO1uo+XD
 J67g7yt1USejQy6LEkDLk9TIvYPWRkd/3Fzbiqq/nYge0GgHqTYB6laeAYrmqI/IfMnhEXjuMhS
 DdU/JZO2rWAoOCcXKwYq/hhJF4Jmph6+PTTuWWXx8dfY1CHPucOWLGKR64CccnIcRqHi2lqg9QA
 Yta1lVuQ9V5DI4kpYNqq+IO4R2mVBobjMioKsaWEhcW/XZtt2yzW9
X-Received: by 2002:a05:622a:5a85:b0:4db:f72a:b816 with SMTP id
 d75a77b69052e-4e6eacd2be4mr417127191cf.22.1760487436666; 
 Tue, 14 Oct 2025 17:17:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGmUgx4O+pVpNnyAyHvYfcG3kqfMLo5IhchaRSoTS6CeT3T5N2YBTNDnX1AJcza4n9BxrDrg==
X-Received: by 2002:a05:622a:5a85:b0:4db:f72a:b816 with SMTP id
 d75a77b69052e-4e6eacd2be4mr417126881cf.22.1760487436190; 
 Tue, 14 Oct 2025 17:17:16 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5908856e480sm5699406e87.94.2025.10.14.17.17.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 17:17:14 -0700 (PDT)
Date: Wed, 15 Oct 2025 03:17:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 03/16] drm/atomic: Add new atomic_create_state
 callback to drm_private_obj
Message-ID: <tx6dccjku67hgkydr5nxgfi7gifxdij7z2e4eslacb35wz6erp@qsqkwcr5mnya>
References: <20251014-drm-private-obj-reset-v2-0-6dd60e985e9d@kernel.org>
 <20251014-drm-private-obj-reset-v2-3-6dd60e985e9d@kernel.org>
 <c43t73qbgrimpuinjsjyxcit6cvjflusomjayzv62nvvvmtwuo@elo37btubnul>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c43t73qbgrimpuinjsjyxcit6cvjflusomjayzv62nvvvmtwuo@elo37btubnul>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX4D0b3Pe3AL0Z
 1St/hvmiLrdDryA79Wol8Ueu1tmXYMAb6hBw0m/7b8dFrQSJxtXgdOg76+Jr5IyMGcq8rCddYky
 2Iagq1uuqa9hBz5Ks7RZNfoK05mFNNWSYzc2nxaqieZW4rOSzYIe2ZklxVPK84y4L6jeU61X/63
 QpuVtR+ftK+dMBY53lg4slVIzjb1jksk9D6qkm5DDQSfRcuHk1+Kaflx5mVFk+o3fRwaSBa1Nze
 /WKAwllBcw7aHawlsgClf9bEaAFuhLEyxFb7BdEUXemcXSbOySBwM7FFB+AmIjEx7roeHN8p4sD
 Iw7ZDsY9ow+zORvyFSrbGm20PyVgtun/aet8LQ6bAkYU9nR8b+t7eKKH6yip4X+nMyqVJfTP8f7
 j7OWR4gtY2htjdyflSfF1dVTbycJQw==
X-Proofpoint-ORIG-GUID: ezDeTN8M-hT1Ou203rFxQx4cGaKVEPzE
X-Authority-Analysis: v=2.4 cv=bodBxUai c=1 sm=1 tr=0 ts=68eee80d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8
 a=2abdinQX6STuU-YpCiQA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: ezDeTN8M-hT1Ou203rFxQx4cGaKVEPzE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018
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

On Wed, Oct 15, 2025 at 01:49:33AM +0300, Dmitry Baryshkov wrote:
> On Tue, Oct 14, 2025 at 11:31:47AM +0200, Maxime Ripard wrote:
> > The drm_private_obj initialization was inconsistent with the rest of the
> > KMS objects. Indeed, it required to pass a preallocated state in
> > drm_private_obj_init(), while all the others objects would have a reset
> > callback that would be called later on to create the state.
> > 
> > However, reset really is meant to reset the hardware and software state.
> > That it creates an initial state is a side-effect that has been used in
> > all objects but drm_private_obj. This is made more complex since some
> > drm_private_obj, the DisplayPort ones in particular, need to be
> > persistent across and suspend/resume cycle, and such a cycle would call
> > drm_mode_config_reset().
> 
> Doesn't that mean that we need to save private objects's state in
> drm_atomic_helper_duplicate_state() and restore it in
> drm_atomic_helper_commit_duplicated_state()? Private objects don't have
> .atomic_commit() callbacks, but they can be used by other objects during
> drm_atomic_commit().
> 
> > Thus, we need to add a new callback to allocate a pristine state for a
> > given private object.
> > 
> > This discussion has also came up during the atomic state readout
> > discussion, so it might be introduced into the other objects later on.
> > 
> > Until all drivers are converted to that new allocation pattern, we will
> > only call it if the passed state is NULL. This will be removed
> > eventually.
> > 
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >  drivers/gpu/drm/drm_atomic.c | 20 ++++++++++++++++++--
> >  include/drm/drm_atomic.h     | 13 +++++++++++++
> >  2 files changed, 31 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> > index a5c5617266ae1dfe6038baeee6dfa3828c626683..36b56c71cb4e1ddc57577df724efe7d89b4fb6a9 100644
> > --- a/drivers/gpu/drm/drm_atomic.c
> > +++ b/drivers/gpu/drm/drm_atomic.c
> > @@ -793,15 +793,31 @@ int drm_atomic_private_obj_init(struct drm_device *dev,
> >  	memset(obj, 0, sizeof(*obj));
> >  
> >  	drm_modeset_lock_init(&obj->lock);
> >  
> >  	obj->dev = dev;
> > -	obj->state = state;
> >  	obj->funcs = funcs;
> >  	list_add_tail(&obj->head, &dev->mode_config.privobj_list);
> >  
> > -	state->obj = obj;
> > +	/*
> > +	 * Not all users of drm_atomic_private_obj_init have been
> > +	 * converted to using &drm_private_obj_funcs.reset yet. For the
> > +	 * time being, let's only call reset if the passed state is
> > +	 * NULL. Otherwise, we will fallback to the previous behaviour.
> 
> This comment does no longer reflect the code.
> 
> > +	 */
> > +	if (!state) {
> > +		if (obj->funcs->atomic_create_state) {

Shouldn't this callback be mandatory here? Otherwise we can easily end
up with the object without a connected state, if the driver doesn't
implement it.

> > +			state = obj->funcs->atomic_create_state(obj);
> > +			if (IS_ERR(state))
> > +				return PTR_ERR(state);
> > +
> > +			obj->state = state;
> > +		}
> > +	} else {
> > +		obj->state = state;
> > +		state->obj = obj;
> > +	}
> >  
> >  	return 0;
> >  }
> >  EXPORT_SYMBOL(drm_atomic_private_obj_init);
> >  
> > diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> > index 9b3fb98b1e88c38877abdcb9df4d1c9540768833..10a71c4b6afc316f07023756be4cd3ed1d1d2974 100644
> > --- a/include/drm/drm_atomic.h
> > +++ b/include/drm/drm_atomic.h
> > @@ -205,10 +205,23 @@ struct drm_private_state;
> >   * added to the atomic states is expected to have an implementation of these
> >   * hooks and pass a pointer to its drm_private_state_funcs struct to
> >   * drm_atomic_get_private_obj_state().
> >   */
> >  struct drm_private_state_funcs {
> > +	/**
> > +	 * @atomic_create_state:
> > +	 *
> > +	 * Allocates a pristine, initialized, state for the private
> > +	 * object and returns it.
> > +	 *
> > +	 * RETURNS:
> > +	 *
> > +	 * A new, pristine, private state instance or an error pointer
> > +	 * on failure.
> > +	 */
> > +	struct drm_private_state *(*atomic_create_state)(struct drm_private_obj *obj);
> > +
> >  	/**
> >  	 * @atomic_duplicate_state:
> >  	 *
> >  	 * Duplicate the current state of the private object and return it. It
> >  	 * is an error to call this before obj->state has been initialized.
> > 
> > -- 
> > 2.51.0
> > 
> 
> -- 
> With best wishes
> Dmitry

-- 
With best wishes
Dmitry
