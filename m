Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPRGGyV0p2ljhgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 00:52:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 104CC1F87F2
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 00:52:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB9E710E8F4;
	Tue,  3 Mar 2026 23:52:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HIy5APdd";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dI2lxUBM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9114A10E8F4
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 23:52:00 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 623H1GfB728215
 for <dri-devel@lists.freedesktop.org>; Tue, 3 Mar 2026 23:52:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CE5lYpP2aMiXtRB/B3W0vuQdbhu9XMpSGv7rYRroDAM=; b=HIy5APddJ9u4c1Xw
 Mu69MPWGx052oDqrLJaFBcZ67LEKt7cp1OElVNA84/Fi6widK5zf6Es3YJr9iBOb
 AOkcq6grglkiRRvv54hfJDsV0Xr5wmBFw+LzY5Y+QxwXB8bMoiu5qs/SjHY7j7Kr
 w01T2TVZkiheX+PkE9wERgvunXTKS2KJDv+aHdr0TjRi4LtZYydbhiT2y50K8JsH
 N+fbirHHZ21YGpNKZvQhdJUc5BYT/J4Gf0HZvXBfLw9FjfNNNMi8q18NeUaDiEVI
 TR7Z5izlD3xR3LBw0RpO/drb6a50Gp5a3vaLSW1xT3TQbWd+eQQ/ah32DTfNisxQ
 Xx6pCQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cns5fumm9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 23:52:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-506b4005ab7so672552401cf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 15:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772581919; x=1773186719;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=CE5lYpP2aMiXtRB/B3W0vuQdbhu9XMpSGv7rYRroDAM=;
 b=dI2lxUBM2FHqm4uTwcn5qH6jOTpMAnxfoXtr8GO60ts/VS7u5uztkFCeSaykrhG+Wf
 4DRmRzrBzhdqpOBo1noTVMHp2U1+DKVIn8rFstX9gUByf/JOWgdk34BIwCHBrJ8UngZ7
 De4TSIqqMfzD9gd7yrGKo59VzrQH4bCcAP7+J+miuLNz9wbI/SEXXlqfq9R/doe4OGjf
 71JBuc6eBOoxKwoWX2tEgw2Wbf3iMnKSBs7fVzPzkesj70i5jym+Un7/tgkR+5wN9+Px
 tw5Nifq7yyDDXxWGJevVDj+B8a+ku2JAzxs1zwDQG46u9dXyXgF63j2nuRNMIfkV6949
 fu7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772581919; x=1773186719;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CE5lYpP2aMiXtRB/B3W0vuQdbhu9XMpSGv7rYRroDAM=;
 b=KBe1TQzyruyu23QCpQkW+iEmYig6h8/+MvjXRiTa0eJUhQVvtguXCGbAHp5qVGvCGS
 mGNWl41Db4Tx74aztLD1umjtVP0BKObImuWwo9G+kJs3neZv1P5i0HRiVVW41MeD8dV+
 BHz881PUhNYRxzk7OQ92UJvfKvv3iAZK2HUH7e3M8ccHGejpnquSyc4+h6mIXUxXt+6X
 tRmOLOl++kOMm5P7GrYRnLela+TYX45qbLgTJq0EN3l3PS7vDqhZJcRnsQSfp8F0dVC7
 RKbEk5u9K8GGaRy8cSU9TBpolfFFWKx2+WYe3I1wgJ8u+hb3ZL6XPhHJH5ah0GeEHnBa
 lrwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOA9LtWxx5gIWhjGwY/FmwDebs96+QwOZgUNYzAc7lINIyzAEsPQWmkh+yLzFs7gSzFNlKbkxIZdE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXkjkb6QsSKJ8I4PqfL1sKbpDwdAOQ/pkucrSmd2j8frOUd02p
 wtu4bueEAeHtk6FMWqKyc33fGkDBBMxgMofA+dMYIeb/G4quB7+DtVlQASzoJywqqouJLlMxvy/
 TD5pRB9bIjeES8eBR8rzCOLoBjG6QYeE7YM9UQEsk/pSpNkXwXAkMTZv53bMGFjPKzVz1l2g=
X-Gm-Gg: ATEYQzxqcJ8fqI7JZzBAO9o6kFXYGvD49R2rCO/O1NsrCrmR5P04cynZLwGF3/cfkB1
 t1WG8YSD8H6zh2ZrLMqjCAm2qmemiblxEnPcQyBtN+3pqM4g74fYHUoiglEJ8QCvYF33tvQNXEv
 QXsZqtQy7A+bKfWll44EFXLDX/00hukOSmzf5ebvfkAp2FkIQGFkAmR7jO6/mkSNL1+qkg/lpHd
 mr0Cy50y/GWwLasK+SRWjeFy/6lTv7xdJu+qQE5I5RhDOOU3Vxl9uoY33j77DiJDirPyZhIdqTD
 6ytgdpuGFgFTLLjH/hMKSMFRqvpVq0dtumqa2eu0fesCdz9OdyVGX74ARPSwavwHKJC4fOsiO4B
 LxIy/wN+kFRAtchOzO4fV00ag37w9Dk4uH8kCOpytXh0Gn5gI8XZheY71JFFarZZall4JnsnCyf
 TTiHsxKqaR5jJM9O/arV5Rgvx913kDBtzRI7U=
X-Received: by 2002:a05:622a:11d4:b0:501:4858:a6d0 with SMTP id
 d75a77b69052e-508db3dd455mr2777481cf.56.1772581918952; 
 Tue, 03 Mar 2026 15:51:58 -0800 (PST)
X-Received: by 2002:a05:622a:11d4:b0:501:4858:a6d0 with SMTP id
 d75a77b69052e-508db3dd455mr2777131cf.56.1772581918485; 
 Tue, 03 Mar 2026 15:51:58 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a123581491sm888398e87.25.2026.03.03.15.51.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 15:51:57 -0800 (PST)
Date: Wed, 4 Mar 2026 01:51:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Mahadevan P <mahadevan.p@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: enable separate_gpu_kms by default
Message-ID: <44apren32murp7v5lsntsqu6hpfc55lblj6cykamryylrmvgtr@e6zzqy4rjqz2>
References: <20260223-seperate_gpu_kms-v1-1-e8231e7f1685@oss.qualcomm.com>
 <srjcr7fosp2zvkpw4q63tbguu3edrg6ojv5zabtjbej5lr5opq@slodmuzofzyi>
 <CACSVV014AxTbB-M-Tg4X0yn=kUFnEncdc+Oc=kKrOevuAKJmAQ@mail.gmail.com>
 <7q7czu7kwkmnnx3ntuduxf36lkzod4mph7ky6334xarbipivcp@3jfhc6ahdhbr>
 <CACSVV029s0xBDgUXp+g+JjKJQu-jv5n_nSCQHyXdtfDgyjzVFA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV029s0xBDgUXp+g+JjKJQu-jv5n_nSCQHyXdtfDgyjzVFA@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=Pv2ergM3 c=1 sm=1 tr=0 ts=69a77420 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=SOO4GjgBUA4BacKhc9gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 8ZOeDRdoV1MF9L1BuJnhfP_bY67FAge5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDE5NiBTYWx0ZWRfXzF42hzcyxBy3
 N2K74B/tCiTlzh9mvx6/YuMv5n8Jr+tmPZd3n6T5A76ifyvrUskq2kdyHDWKXGq7wG0axgOgo8n
 4nXfihnw5fD46lC5cb8RoakaVneJIaHH4rYGi68f106beNJ4G1qI+dAzUAOFp+5NDzZciMJq27F
 hSWe/iLS5HA1yw3KHnEI1r/Fay24hRAk5C4I6yTdOx84nORzHGFzLhmd1NEk/TCk4cjHTdNdS3D
 Fwvyb+o6+urhd/E2eNRk6VsteCwXMdppYeIwgLwGM4CVsUoANvQUS0ALlifqJeQCGQOFbc9XLzz
 LszGAF7kLIGfvVFKCUP8+nn5Cob0Boked3AM88YYArz9K46zyHeNc9RjllXQRTjdr3QW6TQ+QCC
 QbIG3DJA9bcD825wL33jrrLWnvBasihbNdAsXOLs18fX5RSdBlzkPVRoOXNcj2BhrKn98St0pkc
 91KohQooVgDfd5OdCQQ==
X-Proofpoint-GUID: 8ZOeDRdoV1MF9L1BuJnhfP_bY67FAge5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_03,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030196
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
X-Rspamd-Queue-Id: 104CC1F87F2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:rob.clark@oss.qualcomm.com,m:mahadevan.p@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
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
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 03:38:35PM -0800, Rob Clark wrote:
> On Tue, Mar 3, 2026 at 2:32 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Tue, Mar 03, 2026 at 10:35:46AM -0800, Rob Clark wrote:
> > > On Sun, Feb 22, 2026 at 12:32 PM Dmitry Baryshkov
> > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > >
> > > > On Mon, Feb 23, 2026 at 12:40:10AM +0530, Mahadevan P wrote:
> > > > > On targets with multiple display subsystems, such as SA8775P, the GPU
> > > > > binds to the first display subsystem that probes. This implicit binding
> > > > > prevents subsequent display subsystems from probing successfully,
> > > > > breaking multi-display support.
> > > > >
> > > > > Enable separate_gpu_kms by default to decouple GPU and display subsystem
> > > > > probing. This allows each display subsystem to initialize independently,
> > > > > ensuring that all display subsystems are probed.
> > > > >
> > > > > Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> > > > > ---
> > > > > Depends on:
> > > > >       https://lore.kernel.org/lkml/20260124-adreno-module-table-v1-1-9c2dbb2638b4@oss.qualcomm.com/
> > > > >       https://lore.kernel.org/all/20260217071420.2240380-1-mkuntuma@qti.qualcomm.com/
> > > >
> > > > What exactly depends on this patchset?
> > > >
> > > > > ---
> > > > >  drivers/gpu/drm/msm/msm_drv.c | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > > > > index ed2a61c66ac9..65119fb3dfa2 100644
> > > > > --- a/drivers/gpu/drm/msm/msm_drv.c
> > > > > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > > > > @@ -54,7 +54,7 @@ static bool modeset = true;
> > > > >  MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=on (default), 0=disable)");
> > > > >  module_param(modeset, bool, 0600);
> > > > >
> > > > > -static bool separate_gpu_kms;
> > > > > +static bool separate_gpu_kms = true;
> > > > >  MODULE_PARM_DESC(separate_gpu_drm, "Use separate DRM device for the GPU (0=single DRM device for both GPU and display (default), 1=two DRM devices)");
> > > > >  module_param(separate_gpu_kms, bool, 0400);
> > > >
> > > > The patch LGTM, but I'd prefer to get confirmation from Rob.
> > >
> > > I prefer to be a bit more paranoid.. perhaps switch this to a tri-state:
> > >
> > >  -1: separate drm devices if there is more than one dpu or gpu,
> > >      otherwise, single combined drm device [default]
> > >   0: single drm device (matching up pairs of dpu and gpu if needed)
> > >   1: separate drm devices
> > >
> > > This way we aren't changing (or breaking) things for existing users.
> >
> > I'd rather break things and hear about them being broken.
> 
> You are assuming you'd hear about the non-obvious breakages
> immediately..  I don't think that is a good assumption.
> 
> To be clear, I'll NAK any change to the default for "normal" hw
> configurations.  If you want to change the modparam to tri-state so
> that "weird" hw configurations get split devices, I guess I'd be ok
> with that.  At least it limits the potential fallout.

Ack :-)

> 
> BR,
> -R
> 
> > >
> > > BR,
> > > -R
> > >
> > > > BTW: have you tested it with X11? Are you still getting accelerated GPU?
> > > >
> > > > --
> > > > With best wishes
> > > > Dmitry
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
