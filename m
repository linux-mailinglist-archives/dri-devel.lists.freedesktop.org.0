Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E39BDBB4D
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 00:49:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DBC110E068;
	Tue, 14 Oct 2025 22:49:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WzAIvDQy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 740C010E068
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 22:49:40 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EKROlY014658
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 22:49:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=KeHJEAXCDe/SdA6n+gSjbykg
 qNw7fG1eF0u1NLgvswk=; b=WzAIvDQyNOrQUS5nJgh5bUxl/d7g12Gb60Q1Y8KR
 1YnE6+DNynkPgPwQVjvKRgaxA27LIYk9SKYSvxYG68WySEX4oHLs5G4+9fNB2oHI
 tGRo9m6HWmxX79BzEa9w+U/PKGQUqWjsipJWdQ5cToOa3Msbqmo7MsSXaYf9PO++
 PqUz6dglWhVxvn53AvgFMD3TyNcpxkmA0vXLebaBF2yFdokwYUOwcllI+JDVJHXl
 wM4mTypsme5k8nLB0IC0pt5QsERts3n5wLY4L6ntJ3nZ6pCCOKnHmdA1r45fd6S4
 8mA1XmUAOIQXUHARvCRXIoRyc75gRXbj4lb2WABgp8DnEg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdka90t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 22:49:39 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-78f6250f0cdso258167246d6.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 15:49:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760482178; x=1761086978;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KeHJEAXCDe/SdA6n+gSjbykgqNw7fG1eF0u1NLgvswk=;
 b=ZhSrBJwy609IYroUiQTcoMqeM1TVejuZ9B6z5oOIC6RGjxrWGIXs3gO5C8kOqCYY/M
 uVy/48yTLecdFp9FZEsz6EICbQ1wCZyaGW6F1DofbPcJ4YZ750WrNTK76NNOatTEjvEr
 RkK1ZjlS2Df5lutmARoKJzr5d1wH1FlQl45qejLiuelOdGmSib7pLazLaWArQ2dqLx4V
 nmlSCBqRnHyDbhK0Z7/iIT4AvbFv7FsHG/la6MpY4BDLVz4aF6TFlr2kGgfjJQI/GYgO
 2PltAioyv5Y+kk/KrbFY/Ffm+Aq+Ss+3ZmesPrPoQNaIQwqovLGUKWDeGf0wvdNXE3cf
 q5ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkP0tj/i+/2M0k0EZS3FAn8gdALiQsqq9cx9KqYOo3Ac/HTjRka0EHdylSaBYqSSY0Y7Qv09QcAUc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLbbbTPByqAnKfpgXs359KZId243IuzLaWtwVV8ss5hzOVWspj
 v0EfcRU/9DjKCr7/7zM2oPJzWTGGk/KrA21IjzHuK7PYWFr/A1YeDl+uDIr4JMIm2RQXc31xYKy
 ZraECmEu2KZizjWf8Fimm7Guly/Lnd+LjDM3JoRIu72u87Btmch7akDVnlCl8kovFiSy0ejg=
X-Gm-Gg: ASbGncvcqZHpZUVbh3X3xDQ8kMGRIQv2ukV2XUFqaCfce4TlYszrr855gaI7JnTKCjG
 6XXltpUe7AF2sdUs6CtD6tCG1ubvE+RrGEjJIEHzdCa7L1fZP0fbt+hnsUMIaZ+8wGDfD8R7qKM
 S3cNqR//8Eon6BzWbPLJq9Y3pnUaEg+qShY9BfnFlAZGckwW39GOUIbN7qhVRx86VwlcLs9tF4s
 /w7BO+JVg3uCZGBwbAOHrB0MtZJM/ep7+WTt6z5F/Y+H2y8kv69h/ViNV0inwDbRb6xjryrd2eY
 JXyJF+c5tppLp/FRbaXlBZuyy+sv7K2m5TgvN6BQfMDilYnrOFzUNavM7tL/llSqArIDhqkhBi5
 Y6fgVpqdDo6ExG1r/IcFf2QdNGHC+R+rb0h5tPiPcunbogbTSbfSC
X-Received: by 2002:a05:622a:6a95:b0:4e6:fdd5:9a03 with SMTP id
 d75a77b69052e-4e6fdd5aea3mr189498621cf.28.1760482178498; 
 Tue, 14 Oct 2025 15:49:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2Mw6dnNbvDWV6rvdZKEtX3VWIANo8s0KhpGW1BehetQ+uxJu8bXEGC6t0H/EOO98HvtUVlQ==
X-Received: by 2002:a05:622a:6a95:b0:4e6:fdd5:9a03 with SMTP id
 d75a77b69052e-4e6fdd5aea3mr189498501cf.28.1760482178016; 
 Tue, 14 Oct 2025 15:49:38 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3762eb6264asm42578751fa.54.2025.10.14.15.49.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 15:49:36 -0700 (PDT)
Date: Wed, 15 Oct 2025 01:49:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 03/16] drm/atomic: Add new atomic_create_state
 callback to drm_private_obj
Message-ID: <c43t73qbgrimpuinjsjyxcit6cvjflusomjayzv62nvvvmtwuo@elo37btubnul>
References: <20251014-drm-private-obj-reset-v2-0-6dd60e985e9d@kernel.org>
 <20251014-drm-private-obj-reset-v2-3-6dd60e985e9d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014-drm-private-obj-reset-v2-3-6dd60e985e9d@kernel.org>
X-Proofpoint-ORIG-GUID: ip2H9tQoJ8c0MujOE12YtGGeFldkcEE0
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68eed383 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8
 a=QIP46MeQ_TAT4ufz3jAA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: ip2H9tQoJ8c0MujOE12YtGGeFldkcEE0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX5PCNsIqWQqMZ
 nK/vZkrAUeLqstUBlTEfq8sg6lFLS4iHpzdBiyQ6RZpVsa/D5VeSHdTdPoSc0Bz88gSq1GM+Io8
 dKsn5lHFikbvmESmh7ZYBFGYrl86WpVIh1dlNiimRf+Dzo/Xzh7yRgNeN85Tc2/xnE6+T+fOZzP
 EZvKeBmGxNh8wZ6aU0c8FSzyraQvQrD2RaBlxJ/gTOhF2K00axJvk8uPXzvTQTMEJmn7IL6xOcI
 gwO5WcJFIOMjzRyc9n0OtDZ/Le47mGbqp0wsf4nFD2DUqXaFOVSeaKjkOQlQ1FXW2NKL36l1msC
 r158dS8AiLL/IMheQ7mT4rbgpou4SMLbsUSOGPkQfbqOwq8YW8sHdMw1r/1RMvgj72sAAkCcS0b
 H8yoAGjM1UzifgooxRj8LJv9YpTEAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
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

On Tue, Oct 14, 2025 at 11:31:47AM +0200, Maxime Ripard wrote:
> The drm_private_obj initialization was inconsistent with the rest of the
> KMS objects. Indeed, it required to pass a preallocated state in
> drm_private_obj_init(), while all the others objects would have a reset
> callback that would be called later on to create the state.
> 
> However, reset really is meant to reset the hardware and software state.
> That it creates an initial state is a side-effect that has been used in
> all objects but drm_private_obj. This is made more complex since some
> drm_private_obj, the DisplayPort ones in particular, need to be
> persistent across and suspend/resume cycle, and such a cycle would call
> drm_mode_config_reset().

Doesn't that mean that we need to save private objects's state in
drm_atomic_helper_duplicate_state() and restore it in
drm_atomic_helper_commit_duplicated_state()? Private objects don't have
.atomic_commit() callbacks, but they can be used by other objects during
drm_atomic_commit().

> Thus, we need to add a new callback to allocate a pristine state for a
> given private object.
> 
> This discussion has also came up during the atomic state readout
> discussion, so it might be introduced into the other objects later on.
> 
> Until all drivers are converted to that new allocation pattern, we will
> only call it if the passed state is NULL. This will be removed
> eventually.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic.c | 20 ++++++++++++++++++--
>  include/drm/drm_atomic.h     | 13 +++++++++++++
>  2 files changed, 31 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index a5c5617266ae1dfe6038baeee6dfa3828c626683..36b56c71cb4e1ddc57577df724efe7d89b4fb6a9 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -793,15 +793,31 @@ int drm_atomic_private_obj_init(struct drm_device *dev,
>  	memset(obj, 0, sizeof(*obj));
>  
>  	drm_modeset_lock_init(&obj->lock);
>  
>  	obj->dev = dev;
> -	obj->state = state;
>  	obj->funcs = funcs;
>  	list_add_tail(&obj->head, &dev->mode_config.privobj_list);
>  
> -	state->obj = obj;
> +	/*
> +	 * Not all users of drm_atomic_private_obj_init have been
> +	 * converted to using &drm_private_obj_funcs.reset yet. For the
> +	 * time being, let's only call reset if the passed state is
> +	 * NULL. Otherwise, we will fallback to the previous behaviour.

This comment does no longer reflect the code.

> +	 */
> +	if (!state) {
> +		if (obj->funcs->atomic_create_state) {
> +			state = obj->funcs->atomic_create_state(obj);
> +			if (IS_ERR(state))
> +				return PTR_ERR(state);
> +
> +			obj->state = state;
> +		}
> +	} else {
> +		obj->state = state;
> +		state->obj = obj;
> +	}
>  
>  	return 0;
>  }
>  EXPORT_SYMBOL(drm_atomic_private_obj_init);
>  
> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> index 9b3fb98b1e88c38877abdcb9df4d1c9540768833..10a71c4b6afc316f07023756be4cd3ed1d1d2974 100644
> --- a/include/drm/drm_atomic.h
> +++ b/include/drm/drm_atomic.h
> @@ -205,10 +205,23 @@ struct drm_private_state;
>   * added to the atomic states is expected to have an implementation of these
>   * hooks and pass a pointer to its drm_private_state_funcs struct to
>   * drm_atomic_get_private_obj_state().
>   */
>  struct drm_private_state_funcs {
> +	/**
> +	 * @atomic_create_state:
> +	 *
> +	 * Allocates a pristine, initialized, state for the private
> +	 * object and returns it.
> +	 *
> +	 * RETURNS:
> +	 *
> +	 * A new, pristine, private state instance or an error pointer
> +	 * on failure.
> +	 */
> +	struct drm_private_state *(*atomic_create_state)(struct drm_private_obj *obj);
> +
>  	/**
>  	 * @atomic_duplicate_state:
>  	 *
>  	 * Duplicate the current state of the private object and return it. It
>  	 * is an error to call this before obj->state has been initialized.
> 
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry
