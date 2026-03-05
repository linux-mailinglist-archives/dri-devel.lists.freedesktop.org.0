Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOZLLeHRqGmlxgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 01:44:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 658E02098BE
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 01:44:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3893410E1BB;
	Thu,  5 Mar 2026 00:44:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="o61VpSjt";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eSfSPJTR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7084510E1BB
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 00:44:13 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 624HHQ2d3838681
 for <dri-devel@lists.freedesktop.org>; Thu, 5 Mar 2026 00:44:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1qjb7z5s0N2q3yCobyGnPBx0md1zq9nKGhUYC8xCUWs=; b=o61VpSjt8lo6QSVf
 K2IhZXUY/IcTJOF9KR63Qqskas7imsruU0cyfGX9sES3ZeBCJfrMrFNkNmIpX7sZ
 JbIR6s0hfSp7dsoPsV3BEEdrmpeuekFnsJbBsBBvpdxJifE9h7NwhR2pt9KpjFgm
 j9idRo1ntVCENhMkT+S5iiPfnDD7qdMY/OO7Vx/+9LeXVWkpBtmcciycqy6YbQZS
 X+H6QRvSh7l2/XUTaZe940ht5Y8LXP+uaikQDjksQHAqJBLQAWUWqOI38JjTafTN
 WngOyrsd8fIY6U8qj4lQsYKzb/c4TQ8KTjutNiVvKs+ZkVaSCEF3TqBWZwwjqenu
 tAgYlg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0m15xd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 00:44:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8cb5359e9d3so4860131985a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 16:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772671452; x=1773276252;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=1qjb7z5s0N2q3yCobyGnPBx0md1zq9nKGhUYC8xCUWs=;
 b=eSfSPJTR7iPZeTa7jmH11oiwxibdYfveQs0MU0okTp92BG7vC0Imx6biwpMq7wdRlK
 bFrJAEpLJRKTg1SVbXF8XvrAoiZwD5cD/2JX7Ot3rnWwI0FONUR0FIwBjNvgOOdm0V75
 vtoPYOXqZYQMBwPRIgbJAh9lF/XsR2tBcvqtopQ9vBDvHhyO28OW/ZuH6aOfYV7mrsTt
 Qp47FKkplp0PeR87O1XpBkRp0kJwbCUskjhBMoA5UlJpEGxW+62VAe/aedTHn46fJLa2
 Tbfg+ALloZ8azeZDW3hF7z/sy0pkJ+81Mla5Fxw14SWCBBuc2Qoh4xT9MQY7I6pQ1jdb
 Ek/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772671452; x=1773276252;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1qjb7z5s0N2q3yCobyGnPBx0md1zq9nKGhUYC8xCUWs=;
 b=N9sRweIh6ei5mKzMYKlLmgNXX812JEdP4gMc0fjUTY5WHK4AJE7eaFnBfxtck1DdUK
 Peu+XXE9+w6wQvFtghM7oc8P4ontQf0jByNf8VveDEMTo9lea8j1UXYLQ1IyqqsNC/3Z
 YSWf2QBXjodNrfoYm6GdMyh/heA9IFcyFQmFhtTzxc/M3pUtmKJnaAdxoBPq0RNE4208
 +Vw9h7NpJivGWNNK/h6YN+9bXDOlL82YiItUrX2So6RXDIe+Lxbt46rlu1fjNXn5CBY+
 fNgBIser2tCgoBHjg7H0jg2abKWBOnsLftnHMeG/ZiwT26cCYvVQSYMdnibxx+dmjJVQ
 NS9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2VkI5ftgC169GboM8uYH40L2PzdIozLNR0uOphemskxyd6Vsd2fNJH1daqvXwngGsJGd5UPAzaIk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzI5PqhyNyf1MTJMUEoSMX1gUuiTQ0jXxUqYkd6P+0i7NAqDO9b
 czwiPgRce5RshVG0ol1ruHzcap6aUySQFI+gQsdJBI+lgl1ieFAFg7Bp4Ab/+VJlLdlfdyuYr2X
 428HNjRDYrZ1ooyWzoIMQKbg89pqmMnT9U7FqT4SC53uQVVvLUS/uNVMcB0bOcXqldQrFLf4=
X-Gm-Gg: ATEYQzyvAoHoPyO0+ejm/F8m971DtpivyCoREfxjh5aC41xwNTHUKHINWIp+XFWLKcC
 5wwApP3ugxEFqDLy8YMth+E1msYuIQwukL+pvQp0C4HQ5PzIrbgNmJJ+P3Q67X/HD0c2qFfJGMz
 txwB2fX9wPVzdEsaIJCk+uZHPQSfb/mNZbTCwZMQiJQxeXVu5OD/3v3RhitV2LagYSrHHoawim8
 88wd7EAIBUM+yq14VpPQ/r56N3OqSYL/3FDeNtVG0BMvxPiYSmS+kCyxTgEjwFL2ppDXCm4gcLT
 a2NI2ma9FfFNeDtb/e5+aIRhC2lf86XRwhijxzo9M8Z0Dsj9eoLNdmx1C+Nc+A5mxf6nCTBCQ0y
 +H8NEVrhSxlInKTjGsj7GQmx10g0dZQ/WhAEiYF0Bm3EyVY69BzaLn86a21eR5H20AQdkcLDJay
 6jfzp9jayTOuktmtBIibI18ki7tcmzO7Img9M=
X-Received: by 2002:a05:620a:4496:b0:8ca:4288:b170 with SMTP id
 af79cd13be357-8cd5aee9e27mr556938385a.3.1772671451808; 
 Wed, 04 Mar 2026 16:44:11 -0800 (PST)
X-Received: by 2002:a05:620a:4496:b0:8ca:4288:b170 with SMTP id
 af79cd13be357-8cd5aee9e27mr556934985a.3.1772671451351; 
 Wed, 04 Mar 2026 16:44:11 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a129a21432sm952961e87.82.2026.03.04.16.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 16:44:10 -0800 (PST)
Date: Thu, 5 Mar 2026 02:44:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: restore GEM-related IOCTLs for KMS devices
Message-ID: <puvl5tg6ovr45oncwcvx5phrkdp6uv6mrtqss2i6x6wsmeixaq@me3hztknlscc>
References: <20260304-msm-restore-ioctls-v1-1-b28f9231fcd2@oss.qualcomm.com>
 <CACSVV00Z0gDW8aGOvO_YaB6AZ7cOR01mTsCHZvxp0qeO85Mqdg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV00Z0gDW8aGOvO_YaB6AZ7cOR01mTsCHZvxp0qeO85Mqdg@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=e6wLiKp/ c=1 sm=1 tr=0 ts=69a8d1dc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=uh5CrAVrB7YgaaNdy8UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: eCGmu-UlanX81lo9RUG4IOZbUmdPpJc5
X-Proofpoint-GUID: eCGmu-UlanX81lo9RUG4IOZbUmdPpJc5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDAwMyBTYWx0ZWRfX0Qp3xTdM2Mjb
 alNgaf+GJKOYQASgfA1ionqGtYNh3aGT96VSfYDBI2uYxEanmlfduxKPkVEADjCZdoIyyPmVhni
 Z6k3fT6LWtIYRv1VBXsghQ0eN9wIl4k/kf7IVJ+i0wfgPJYHPmb7twLCiOw5dzODGpwYohsJud3
 0Mn0TQu0esuHpJpqf2XOW2Ze3J3qkGPqMk/OB06YKJpEdSOKFiS01Wv4cd/faABFimoxEJQ4VbL
 g5rRE5VA8P1wDYHegpS3thJD2svan1sCdHTRr9cDK2HDoRLwsx/Y5lN1TufRwyxy1wjKFkgXEuE
 Bz/+amRHTO31nVAUx2fd9V+dM5m5FzRW7ml0Yyd3hc3+erwaVQ4ijPG6n2qCRAANSUzKC2E2oCC
 2B4IADpPvBQdNIc2wJEyUk2v0Jt0v96iiUvHTgcPtEp4Qq9k+jyqoMCJgCgnq6u4IS7NCfwodPt
 iGfRoqaVcBbRYEgmxHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_09,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050003
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
X-Rspamd-Queue-Id: 658E02098BE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rob.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 07:57:34AM -0800, Rob Clark wrote:
> On Wed, Mar 4, 2026 at 5:34 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > The MSM GBM backend uses MSM_GEM_NEW to allocate GEM buffers from the
> > KMS driver, imports them into the GPU driver (msm or kgsl) and then
> > uses them for rendering / blending. Commit 98f11fd1cf92 ("drm/msm: Take
> > the ioctls away from the KMS-only driver") dropped all IOCTLs from the
> > MSM KMS devices, pointing out the need to use dumb buffers, however dumb
> > buffers should not be used by the GPU for rendering. Restore GEM-related
> > IOCTLs for the KMS devices.
> 
> We shouldn't be exposing DRIVER_RENDER on KMS-only nodes.  If msm gbm
> is allocating from a primary node, that is problematic, since there is
> no guarantee that anything but the compositor has access to the
> primary node.

We are not exposing DRIVER_RENDER for KMS-only nodes. I'll check with
the correponding colleagues, what exactly is their use case, if the
allocation is happening in the compositor or in the app. In the latter
case, I agree, the buffers should be allocated from the GPU.

> 
> BR,
> -R
> 
> >
> > Fixes: 98f11fd1cf92 ("drm/msm: Take the ioctls away from the KMS-only driver")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> > Note, here I assume that dumb buffers generally should not be used for
> > rendering. That doesn't seem to be complete truth as Mesa kmsro on MSM
> > devices uses DRM_IOCTL_MODE_CREATE_DUMB to create buffers for resources.
> > ---
> >  drivers/gpu/drm/msm/msm_drv.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > index ed2a61c66ac9..f82c9a36a166 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -799,6 +799,14 @@ static const struct drm_ioctl_desc msm_ioctls[] = {
> >         DRM_IOCTL_DEF_DRV(MSM_VM_BIND,      msm_ioctl_vm_bind,      DRM_RENDER_ALLOW),
> >  };
> >
> > +static const struct drm_ioctl_desc msm_kms_ioctls[] = {
> > +       DRM_IOCTL_DEF_DRV(MSM_GEM_NEW,      msm_ioctl_gem_new,      DRM_RENDER_ALLOW),
> > +       DRM_IOCTL_DEF_DRV(MSM_GEM_INFO,     msm_ioctl_gem_info,     DRM_RENDER_ALLOW),
> > +       DRM_IOCTL_DEF_DRV(MSM_GEM_CPU_PREP, msm_ioctl_gem_cpu_prep, DRM_RENDER_ALLOW),
> > +       DRM_IOCTL_DEF_DRV(MSM_GEM_CPU_FINI, msm_ioctl_gem_cpu_fini, DRM_RENDER_ALLOW),
> > +       DRM_IOCTL_DEF_DRV(MSM_GEM_MADVISE,  msm_ioctl_gem_madvise,  DRM_RENDER_ALLOW),
> > +};
> > +
> >  static void msm_show_fdinfo(struct drm_printer *p, struct drm_file *file)
> >  {
> >         struct drm_device *dev = file->minor->dev;
> > @@ -868,6 +876,8 @@ static const struct drm_driver msm_kms_driver = {
> >  #endif
> >         MSM_FBDEV_DRIVER_OPS,
> >         .show_fdinfo        = msm_show_fdinfo,
> > +       .ioctls             = msm_kms_ioctls,
> > +       .num_ioctls         = ARRAY_SIZE(msm_kms_ioctls),
> >         .fops               = &fops,
> >         .name               = "msm-kms",
> >         .desc               = "MSM Snapdragon DRM",
> >
> > ---
> > base-commit: ac47870fd795549f03d57e0879fc730c79119f4b
> > change-id: 20260304-msm-restore-ioctls-2a1792311a09
> >
> > Best regards,
> > --
> > With best wishes
> > Dmitry
> >

-- 
With best wishes
Dmitry
