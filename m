Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06645CE03BA
	for <lists+dri-devel@lfdr.de>; Sun, 28 Dec 2025 01:53:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE84810FDBD;
	Sun, 28 Dec 2025 00:53:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZIVlJJTe";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BHHiiJJF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC65710FDBD
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 00:53:16 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BRMfHNF474008
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 00:53:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 tKcMbFWNjzITwh4/Q6d8qQItR8/b+qZfIJdqdqrqAIo=; b=ZIVlJJTez2/C/3Gp
 Ga2/gIIf13Achz47vReZB6U29hpq24HkzTtz7JTG1HZkoTf7aW85g8rDcAG2knhA
 EEg90YktD7icwRf2Zd3gLgFS2d/txWqn5gY5iLUFbgfed2h38rW3/g4e+t8ElfVs
 HTYBl2J2OwUATBC803XKE+2M/QWR0vgg1rTwxNeOdNYKfpGEupBV5Gg5qBBVs3At
 jE4Q+bL0tjaPiE8ZyEAcbCwfsg05ibD8xbOjAGytJxXsXofOVtWjY3r0pc0+cprE
 TGF6VfJNQeZCHqNOvYijWYxjnfwDtUmOg7puW1qd7cS11A2rQa08kGhfqZdmnVnM
 X91dSw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba4tnsj0q-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 00:53:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4f183e4cc7bso152582821cf.0
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 16:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766883195; x=1767487995;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=tKcMbFWNjzITwh4/Q6d8qQItR8/b+qZfIJdqdqrqAIo=;
 b=BHHiiJJFvXNnySBuZirJlIleASYiAt2RZv9i+EKiYbolVAOzfUllf5Ck/MkYwf0qyX
 HwhEeKu0t+1EmnK4SZbAKfrCadvugIUkuZkngDAnrIdM4bVDCavjIddjbvBNAwWvDayh
 MBU1N1TUDb9cmoGiaGsNE6AeoRwGADlPxIK1pJI3EHmd9VvzBEO5LQllmZh8d7ZsOA67
 noLpq0YYmadhZwF6c7Ri2uxvNv8xfAkNpworPohQnTF4iGPr3hESsY039vXLEoWRkxxX
 T1T+F1Svf1F1RwQeXZkf5BP06SwA5emrx/0irT3mYSxn5yCdXHhrX+o2qu3CvvtCsn9z
 ZsAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766883195; x=1767487995;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tKcMbFWNjzITwh4/Q6d8qQItR8/b+qZfIJdqdqrqAIo=;
 b=l5YX1yE2pRUtOsGfjgs5iFuXDS01rTOLyYHS2ITElZEDIEBav4/bLuNZWtT+3HG/wy
 CxRgqe53cL4lb9HZ3MWWylsRJ1LTw3OO+HFKdXAnf7rj3X/MY1tMWpdkBfOw9m9lwO1e
 WC/1mBC0lHBqDMnAGojT1WtekbmmoezDZgKb64nODjQD3nxqA00BYF6+p/O8cCretyWl
 l91V2NLXp9y4hQx9ofhz5Kex5cpX3a3mlJQoZeVmI9S5RhVZDbV3Z8I2Qx8/KRFeer0p
 Gxc1/+Dvf/qCZOpWjOxzmenXqBf3fS3ND61nQjUDoWQUtU3YRFA5LFma/2azqmlSajNJ
 v4Gw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnUGuIjFd+VpxlR2D7I/5gqyE4qatGQRAp7u5uZL+piMjy/1Sre10kXOa+Bo6vHfpG5AQlN3D/VXo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbXr1lHzbkzriyK0XbJ98AzDnfFdMXRuP2rumg5quLFTy+DtuL
 PmkCXygG9Gpp8Qzfh8QO7vUmKD52XynIj3FBLmZ0idyC6pyIKrfiKa0pJ3STkGZ58FVCdUo+rDi
 9HKFKz1jyAU27OWmDQWyfhBzkZZxmgt5KUliw+fd5hlLlZpvQ96Qv2m9iXxegMtRY2BhO6oc=
X-Gm-Gg: AY/fxX5gmKqUE6s07tnTZC3PMU59V1aCWDV/BdWP0ynZRks4DoLvDV2S7Yvsv+LYVuu
 vLLyAA0XLILj+mA3+EL9KnS0XCOLW4pwOWuRZ/EM8Gv2GPiexrdP0dIXjY2Rz8iZ9U0KHU5lQ2n
 4ZOhj5vZTI2KocoG/W+5YUNbVh5EOZ9TvhUfflE6N1FAdYOZ37cmkGcOnMBEaJDVhDJ/dTJSn/b
 2+DihiN3zoxAdh+3aIeXFtmboABDKoJKcWZel2KZk+Gszc8T3rMbwxi7Yqq/mu6j2bzXYZtkvLH
 mc+HbUC1qcUHUnE9Uct2uNOBt/D5hW2ENpVDJ/VnVBUmAxZ77c0gUZ3puCc03wjEC/HPEeLppez
 fBSLz7YoLdPYfZLoUWF+KCyKwZyy0iuSBZR7nnC1J+jNytWZgkubPrCw5TBDj4XDAQCyEVjUkFq
 /syDJ0HDLx5Xb8GaMbI6sawzA=
X-Received: by 2002:a05:622a:17ce:b0:4f0:165e:c1fe with SMTP id
 d75a77b69052e-4f4abd93127mr424542061cf.54.1766883194741; 
 Sat, 27 Dec 2025 16:53:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEjmHVj87RMWxad1vU+LeGO5zKfAvU7D8dJVfdrvgUQiGJzJGjaCj9tS+wJF0GBZO/Kg7fzIw==
X-Received: by 2002:a05:622a:17ce:b0:4f0:165e:c1fe with SMTP id
 d75a77b69052e-4f4abd93127mr424541881cf.54.1766883194270; 
 Sat, 27 Dec 2025 16:53:14 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b30f7c322sm3152128e87.59.2025.12.27.16.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Dec 2025 16:53:13 -0800 (PST)
Date: Sun, 28 Dec 2025 02:53:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH RESEND 2/3] drm/atomic: add max_size check to
 drm_property_replace_blob_from_id()
Message-ID: <kxlk3cb6tsge6wf45xs74i6u6cmmkvw4sbujir54vuwqkwvriu@halwo27swzll>
References: <20251210-drm-fix-lut-checks-v1-0-10ae38519f43@oss.qualcomm.com>
 <20251210-drm-fix-lut-checks-v1-2-10ae38519f43@oss.qualcomm.com>
 <f211044d-c797-4e10-a06e-10dce071f704@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f211044d-c797-4e10-a06e-10dce071f704@suse.de>
X-Authority-Analysis: v=2.4 cv=G+YR0tk5 c=1 sm=1 tr=0 ts=69507f7b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=iox4zFpeAAAA:8 a=CKk-xbJTmnNh4yQCEWIA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=dawVfQjAaf238kedN5IG:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-GUID: kKFiSHGos2VJk3DCoROjhEfOFZ2KVD_Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDAwNSBTYWx0ZWRfX8vZv2GIyEF4F
 OrghwBc52ZKxPf5zGyxi6KaPHMJvTSFWCLupLSyModFSyYGgxmT7BTBotUCdfhZcU6qicLMqeN8
 Jktn/HqRqgGn//LvP1a9PfQ+6Ut2X/65mZb0JUF6f7mW8BQSJ7OGVVGNV9YAHZ+FPcOEFNRZp9D
 F/vbbFsnG2sAR2XLkQlC/7KA8LTkt3WgAjl6YVfNa/5fgO589RbxE1wC4RKsfPDG+ic2SxjPTfi
 4QmKQyLAPW5HTv4eOQEyVJt4zboGWRYHcDeNrYRO9vvTIve3IBi5s6zLytu0/55q0oJg64HoJ0J
 VdcpiWA0YxVwBJNZhCCXqEedeeT3L51YtEUdvUFfKhFjVBvAwTt9amoDtJywb+o2AUZHltM4K7z
 IIuB+82zS2zw2L4GZbgay9vCwvzF7xAGJfD+7S1M/JPaugYEWCAsVo244de99AMgXJt4GAknU68
 Hv821hCgI6WqiWNkYcQ==
X-Proofpoint-ORIG-GUID: kKFiSHGos2VJk3DCoROjhEfOFZ2KVD_Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-27_06,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512280005
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

On Thu, Dec 11, 2025 at 08:46:26AM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 10.12.25 um 20:42 schrieb Dmitry Baryshkov:
> > The function drm_property_replace_blob_from_id() allows checking whether
> > the blob size is equal to a predefined value. In case of variable-size
> > properties (like the gamma / degamma LUTs) we might want to check for
> > the blob size against the maximum, allowing properties of the size
> > lesser than the max supported by the hardware. Extend the function in
> > order to support such checks.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c |  5 +++++
> >   drivers/gpu/drm/drm_atomic_uapi.c                       |  7 +++++--
> >   drivers/gpu/drm/drm_property.c                          | 11 +++++++++++
> >   include/drm/drm_property.h                              |  1 +
> >   4 files changed, 22 insertions(+), 2 deletions(-)
> > 
> > @@ -801,6 +803,15 @@ int drm_property_replace_blob_from_id(struct drm_device *dev,
> >   			drm_property_blob_put(new_blob);
> >   			return -EINVAL;
> >   		}
> > +
> > +		if (max_size > 0 &&
> > +		    new_blob->length > max_size) {
> > +			drm_dbg_atomic(dev,
> > +				       "[BLOB:%d] length %zu greater than max %zu\n",
> > +				       new_blob->base.id, new_blob->length, max_size);
> > +			drm_property_blob_put(new_blob);
> > +			return -EINVAL;
> > +		}
> 
> I'd first test for max_size before testing for expected size.
> 
> And shouldn't you also test for (max_size % expected_elem_size == 0)?

No, why? We are testing the values passed from the userspace, not the
kernel itself. E.g. we also don't have a test that (expected_size %
expected_elem_size == 0).

> 
> Best regards
> Thomas
> 
> >   	}
> >   	*replaced |= drm_property_replace_blob(blob, new_blob);
> > diff --git a/include/drm/drm_property.h b/include/drm/drm_property.h
> > index 082f29156b3e..aa49b5a42bb5 100644
> > --- a/include/drm/drm_property.h
> > +++ b/include/drm/drm_property.h
> > @@ -284,6 +284,7 @@ int drm_property_replace_blob_from_id(struct drm_device *dev,
> >   				      uint64_t blob_id,
> >   				      ssize_t expected_size,
> >   				      ssize_t expected_elem_size,
> > +				      ssize_t max_size,
> >   				      bool *replaced);
> >   int drm_property_replace_global_blob(struct drm_device *dev,
> >   				     struct drm_property_blob **replace,
> > 
> 
> -- 
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
> GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)
> 
> 

-- 
With best wishes
Dmitry
