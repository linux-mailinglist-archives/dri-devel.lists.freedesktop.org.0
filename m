Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OBmO5Rhp2lvhAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 23:32:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A147A1F8027
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 23:32:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0FF610E8E8;
	Tue,  3 Mar 2026 22:32:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cddr5VaV";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OvQnjk3V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46FBD10E8E8
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 22:32:48 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 623H0fGH4030535
 for <dri-devel@lists.freedesktop.org>; Tue, 3 Mar 2026 22:32:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1egK9oyG2ALjxRz8MaOfLt1kpaF+JjzamWBrBKBCyUY=; b=cddr5VaVmVXykzRj
 cx3cakWNvDoLzY1BgQ6gMnlzMHsl6giVCxiRmxB1yX7RfXUWK5KTIrVEcu8Vo+RR
 WbYBDWE6FoUCNgwDmEBjp5F2detpVxt5bG7OP3HByXxD9EfS2OdAL0i6EwhkAQ1V
 snA1K5E2vaexC3sZ8Th7G1ytUXjoLh61LmLkdi2zL542CUJcqtu1Znvq6rrQN1hE
 T9/gZRQtL87FmUK1MF7eIQNZcgqMttFtexF91IuaEiEM7mSYSx7ztvai/KeabxGZ
 SRXx80+A93HtAHidEx3ghNo9mMQixHb1hjlOnb3oftRQQpfKBcRLomPTuvobhpin
 zcNMmw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnuqu2vg5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 22:32:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-506a81bbb50so78926771cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 14:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772577166; x=1773181966;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=1egK9oyG2ALjxRz8MaOfLt1kpaF+JjzamWBrBKBCyUY=;
 b=OvQnjk3VGlB8gg+shXXq3CAIGFng2q+fUVi9Lt+gt/wqF6f0akkmy7VD6WNJFhndH0
 eG20LDLO7Bn6sUqvlxt8GbWcnWB0ol7UXkPSPBUWcstwWBJHbcXfRZJrIBGs70Z4l2Nw
 8qWCYoTkWMkbRdQhOsAvdro3vxjD9SBjJRNEbVK55T3ntqUp63Q2JZ8yuSEsKCvH7QWM
 UlV+4eAJgCMAmvdGTWFybvkLnDTwoZ75/uRO0hUcPWr64yUQNtAsLpZj46h41RSnaGpy
 TlHqxoN0L9IJvDDr68yxPhML9CNx+Wtb1vFwH6sjCSnXxFp1Jz8lQSWYHiV7nbvV2wrA
 psCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772577166; x=1773181966;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1egK9oyG2ALjxRz8MaOfLt1kpaF+JjzamWBrBKBCyUY=;
 b=EHOb7PH++yGpRoW90+7f+fWSqQpT9YpOoh6lyvmMcW9t75rORsi+crtu6gShqIqg3g
 jn5n2IEPdx6zFxI2dVK1Jh7FBN23Pem503SS5kZmQT4iLd19jaU1lEnOnJ4GBKc9pZa3
 yjuZPkikB6ZZXraphc+hohAAQEb7PLX6FpsBtb+/8AsLmUzstu9uKjtMMhIKUvnPHRxg
 V/I8o7icgjsTWoLu1HV35u497I8R7FhZjx+jqCHJvRsimkVNuLl9u10qb6/UOogGDtBo
 OHTcrmB/Vv7S7tWTBs5JMxg772cjjOnrEHZWO7UNd6IzAwkT9I6vBUljZIVCUavF76HS
 Fp5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnjaTcOXDq9XMewzYIzYTbKWBPECC3p47vddF8LQaLYt6KY13uJKMExvpPG2rkaymfCF94V2hxTmM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSk2hrFZZQuS342riZ9QsVAyk7WkYm1GKjINbw4tdzpOsofmkR
 pGvWXH/7EPUQ2q7FkcbsdHYnP8ZDaJ/CGOMwimQE4NjgPbRE1xfswjSAR0SzSmvepVlHFlBXQqC
 WGJXM0Ye1KppY/iQmuQRXK5YAKRaRMCjs8p5U7rYqS/Xj6FCUunxs9tchqIFonBp4tC4w9V8=
X-Gm-Gg: ATEYQzweE1g+kPTlnw6kIPJv8ogHTBYnisNCrvi5jIr7XyRZpUxYUnm+Z+ioii4DMiI
 H/3gLhibnBe2dC1UWvbM6CTYZ1u0RRMH3OIyPk2+ar1HceediFAbXINczLHjN3DaFnL288CMJE2
 Iykxo0bCGk0Thh1hRDMQCwxySa4woCzi6yM18iCKziiUOQQWKAtuSsdWKXCh+Q/Da6UI0AncP1/
 U5NfBPMdoazGR8Xr44TmNX0LviHmbCEEHlgW5c26ZBUyiR4UclJw2g8f6prmXWyZxitPn274dis
 M8aslIHcQZvdeZ+Mp4t4pa3UhPc6LVWAkpVqRbqHvOECCdI05YPwtM55gCovf9ShFcRCXllQ+gb
 5v/P5qP/je/6Smgpi2lL+dd/R6+46ccvvYiSSfu+XlswVKS9rHU/F+33JdvoA7hHQrFcGDmI76O
 TqoAKuTD65t0HL7aCsGcVKAl17PSBw3jzO1KI=
X-Received: by 2002:a05:622a:118c:b0:506:a4f1:32a9 with SMTP id
 d75a77b69052e-508db2c0253mr193671cf.31.1772577166290; 
 Tue, 03 Mar 2026 14:32:46 -0800 (PST)
X-Received: by 2002:a05:622a:118c:b0:506:a4f1:32a9 with SMTP id
 d75a77b69052e-508db2c0253mr193331cf.31.1772577165819; 
 Tue, 03 Mar 2026 14:32:45 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a1237b81b0sm844996e87.50.2026.03.03.14.32.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 14:32:43 -0800 (PST)
Date: Wed, 4 Mar 2026 00:32:42 +0200
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
Message-ID: <7q7czu7kwkmnnx3ntuduxf36lkzod4mph7ky6334xarbipivcp@3jfhc6ahdhbr>
References: <20260223-seperate_gpu_kms-v1-1-e8231e7f1685@oss.qualcomm.com>
 <srjcr7fosp2zvkpw4q63tbguu3edrg6ojv5zabtjbej5lr5opq@slodmuzofzyi>
 <CACSVV014AxTbB-M-Tg4X0yn=kUFnEncdc+Oc=kKrOevuAKJmAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV014AxTbB-M-Tg4X0yn=kUFnEncdc+Oc=kKrOevuAKJmAQ@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=M85A6iws c=1 sm=1 tr=0 ts=69a7618f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=6Tb7KvMF9jvO1snUnhQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: NdYsrLwq6usYhix-6y5G_ccyDznCrmAk
X-Proofpoint-ORIG-GUID: NdYsrLwq6usYhix-6y5G_ccyDznCrmAk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDE4NSBTYWx0ZWRfX3glwdFhf4IVQ
 AtKbswAda4aShxXih+wM4ZFO6p+V75VRsF2MBixByReYsTlLQfNr/+pXVC9VOEpG2pd9LDiDZxf
 ADRd/lP/0mjYJUGrMMbz2s+gvx12pAJTdvN0hezOAmeTCTQVefBrOuJxukhm+sE5isXo9C1zoMS
 98hTWi/QukwIKn4XdwND3+q+SlF4vjI6vNzh+C4f/8PHicWvZEEm3bo9QbqbZv0ohlaGMnO53My
 vE727Mmbx1k73QCipR9KgwoFQYAHhAPqxjATtVI1cQL7hAYFvG1EesWHuHbVj3Q4gms0F3E7vW+
 gB1idDPdwjjOwmzFTDsvOH9Ka08BKvekOtyfTjPuZul4ekvS+lWEzUpQE2oA+tPONuDIF7iezMH
 EmaAAg5zI3GGWuo7H4ShU5DzldD+ja+3IQEIX0E35/+51PE4hwxH52Lb2dN7kmwq5pdHlamuY2D
 HstMoMcTgOoNK7Tle9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_03,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030185
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
X-Rspamd-Queue-Id: A147A1F8027
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
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rob.clark@oss.qualcomm.com,m:mahadevan.p@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 10:35:46AM -0800, Rob Clark wrote:
> On Sun, Feb 22, 2026 at 12:32 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Mon, Feb 23, 2026 at 12:40:10AM +0530, Mahadevan P wrote:
> > > On targets with multiple display subsystems, such as SA8775P, the GPU
> > > binds to the first display subsystem that probes. This implicit binding
> > > prevents subsequent display subsystems from probing successfully,
> > > breaking multi-display support.
> > >
> > > Enable separate_gpu_kms by default to decouple GPU and display subsystem
> > > probing. This allows each display subsystem to initialize independently,
> > > ensuring that all display subsystems are probed.
> > >
> > > Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> > > ---
> > > Depends on:
> > >       https://lore.kernel.org/lkml/20260124-adreno-module-table-v1-1-9c2dbb2638b4@oss.qualcomm.com/
> > >       https://lore.kernel.org/all/20260217071420.2240380-1-mkuntuma@qti.qualcomm.com/
> >
> > What exactly depends on this patchset?
> >
> > > ---
> > >  drivers/gpu/drm/msm/msm_drv.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > > index ed2a61c66ac9..65119fb3dfa2 100644
> > > --- a/drivers/gpu/drm/msm/msm_drv.c
> > > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > > @@ -54,7 +54,7 @@ static bool modeset = true;
> > >  MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=on (default), 0=disable)");
> > >  module_param(modeset, bool, 0600);
> > >
> > > -static bool separate_gpu_kms;
> > > +static bool separate_gpu_kms = true;
> > >  MODULE_PARM_DESC(separate_gpu_drm, "Use separate DRM device for the GPU (0=single DRM device for both GPU and display (default), 1=two DRM devices)");
> > >  module_param(separate_gpu_kms, bool, 0400);
> >
> > The patch LGTM, but I'd prefer to get confirmation from Rob.
> 
> I prefer to be a bit more paranoid.. perhaps switch this to a tri-state:
> 
>  -1: separate drm devices if there is more than one dpu or gpu,
>      otherwise, single combined drm device [default]
>   0: single drm device (matching up pairs of dpu and gpu if needed)
>   1: separate drm devices
> 
> This way we aren't changing (or breaking) things for existing users.

I'd rather break things and hear about them being broken.

> 
> BR,
> -R
> 
> > BTW: have you tested it with X11? Are you still getting accelerated GPU?
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
