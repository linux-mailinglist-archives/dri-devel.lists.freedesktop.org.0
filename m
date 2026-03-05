Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sH5kF0/WqGnpxgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 02:03:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AD8209AD3
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 02:03:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C83410EADD;
	Thu,  5 Mar 2026 01:03:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nVsloXWb";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ts5w1qHx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 325BB10E1A3
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 01:03:07 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 624HHjt02611984
 for <dri-devel@lists.freedesktop.org>; Thu, 5 Mar 2026 01:03:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UGVzVQZRlFdbfhTLFkfDsWaL6JDxwkcRKucdgGZVBNM=; b=nVsloXWbcDlLhmWP
 AIVxAIZTCaPKqPWFbLmsztin+3B6KZLLghogAv5IERj57XfRsQaQJw+Twy3v3CDF
 6u7ba1nJwJO9DETN/VFjO+DFp8DYRVlgEuSqlYfWGAEFYWAgTfJaphUG0IVLilFf
 tVLpXNUQRLDgIP1J68akD0ULrS8Gks3y4F69oxIiwRgjxltP2wTRsaW+PWbcFd2w
 ttnCY5EIBsPHJPMKSneZOWJBh7rFl4FjwIjvy4HK1K1FKmpuIkXRibsvVyKHTDWx
 N7bnMnReIrarm8cwBhbpWXAEJIsXEMoHsIW3fjIUSOUtN+t0tON1zp7wDcT6yssP
 fhlrMA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0w96fr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 01:03:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8cb4e37a796so4383337985a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 17:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772672585; x=1773277385;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=UGVzVQZRlFdbfhTLFkfDsWaL6JDxwkcRKucdgGZVBNM=;
 b=Ts5w1qHxljUPfwggJ7QIuUawgb6EwoNajNS+/mvvUny1x6Yuh2H3UHaK9t5i6RCKRE
 9D8Bwcym7H8BN8wnT4v3p0hTCK8oe4bqFf+fikRhk3+xuEGrE6Yr8I0tytQ9Q5M/hOPt
 oODocO14n1ROdu9g0ySwzLEqLGCiaEivyYzOJYtOLV+rmySVbrHeaQ+oOWmhqByLc5nl
 Y+HzIYIJD3yLojb93vTYVnCxgYnOIF+IqdIo4tuMuXG1zkz91sSKcWBge09WzBmE2C7+
 xfDG/7dU/JLLdamPiIINIoa/6lYHjLAlkXR59gDK3Wa4YwwAV4D140WXOsth3gJ8curd
 5gOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772672585; x=1773277385;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UGVzVQZRlFdbfhTLFkfDsWaL6JDxwkcRKucdgGZVBNM=;
 b=HAeXQTZv0Shi5dF7QT7HLRj4f3e0V6w7yjfUEcTNzpq+dgZS5FMhtrbFlkYTsvd1AK
 I7G24KdzT4xpDnHDkEqSzlSJ8fSfOCyuiKa+Mjz86jz2cNTHb6481Jwd+D3WHHSEJtKv
 MbYWA1qqv+JPybhQstj7ygePjK9zrpOs5HbEheF3bh3FP9yoKlerHKEyQCDj7hLO9Qbo
 oS3frTGaA2dCFG4tLG+MWF+83Z0XAojxZDCRxWh25n9mYhz6mtU5Mzmv2CRd1uv+2shv
 3M80XnmZKkknde5G3zE/AKi/4z0Aa08M6AX+bXe/fIc/Hh4uF6O8rCp9L63LG3S/J9AW
 IDJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbhuEpPM4WwSGKjFFnRQmFQigPtu08q4usEbIsxIBAoKRXKeRh2NGYqVHKwvi7kmCToA/66m+0VQM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxezS0A0V2MkcrfQOlsepYWHKjqFhe4q+PCqjTBSUtZVlV4toY2
 LSpfaAes5Toyw8HjxQ+lzU4W+vBxyAYwxbj3mdwlOuKnDfvO/OQf++9+htR1PF/7XkhIKzvaTgf
 gZ6Ee4w6ZDJ+M7mbWG0ffWgkFUYNIwx3ZK6/X0c1DU4zv6/i5P147+YykcoS6Ms6uKdqPfVE=
X-Gm-Gg: ATEYQzzBL/H3vikHKlOXg87EhJGkdxtrYV9fMD8Q4/7l+GLNzn+m7Lycv5TKhAx84dP
 pLDHh4ceZHLXMvcVvHmk69UVokFZe4GFsOzRjpHxVm7HvppGLyT0lpT5LCm0czL1uUt8NI6PesX
 7VfcyFSUU+CyccY1Ws4K5zqklY5TpHB4dbV3pzmuROzUdrQxCefYMUEdJVZ+bjQ3YRs3/rD0Esj
 yibLgVW/oNGjExtibX4C+1EjKBfRbfhpvXsqYBtbUZz6m5w4aWd55xm57+6Chl4lKNz1/IitDOo
 anLrnso8/n53KLCEr+vVR72n54bJWiE/Ug9DevkO6NHAK5LczD+G6zOWeQN5LsB5hQVkiwrpYC7
 MyB3WW9nWHorqcWD3+88mP1Q5kIc1YNSuvn7Flkp07sDuQFrxXXAgkVQHuJf/SARx2Jhheeer86
 4MK0V+Fjo21MIRWwyPlj0e/lk+EX8ItGNbvhw=
X-Received: by 2002:a05:620a:f0e:b0:8cb:4cc2:c5d3 with SMTP id
 af79cd13be357-8cd5afc4322mr502515485a.73.1772672585530; 
 Wed, 04 Mar 2026 17:03:05 -0800 (PST)
X-Received: by 2002:a05:620a:f0e:b0:8cb:4cc2:c5d3 with SMTP id
 af79cd13be357-8cd5afc4322mr502510885a.73.1772672585079; 
 Wed, 04 Mar 2026 17:03:05 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a12a6e4c01sm870585e87.1.2026.03.04.17.03.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 17:03:04 -0800 (PST)
Date: Thu, 5 Mar 2026 03:03:01 +0200
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
Message-ID: <fpeatj5yrhp45rdd2qzcdtltrofr67noqc7fygsisyaquzx36o@ek3mfy32z5rv>
References: <20260304-msm-restore-ioctls-v1-1-b28f9231fcd2@oss.qualcomm.com>
 <CACSVV03T5ceDADxbdgpitczk6rExcRpkQQ8vcedR0gEK3bLQkw@mail.gmail.com>
 <CACSVV01M7YmW1OCjUQ+QFRpXHoY055MEnBCczeG1zRuQyi8z_w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV01M7YmW1OCjUQ+QFRpXHoY055MEnBCczeG1zRuQyi8z_w@mail.gmail.com>
X-Proofpoint-GUID: RhyFgXNm7K-lLKDxmqWkCvTbRCMUu3Pz
X-Authority-Analysis: v=2.4 cv=BNK+bVQG c=1 sm=1 tr=0 ts=69a8d64a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=yEwdYLOYgBwwZM1KkmAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDAwNiBTYWx0ZWRfX2n1xYePcd3Ip
 VQ4TnaEyH4DwifQFGkB89HEiHo8nc4eFbdwOzqjqxOta1lOa+pzLKyXnmjkkJUODBRY+5IBaiw4
 uua3LUydnc8d29uJqux3jcheLH+GCsIsZLdDX9rjsPhO7O9hvG7US7OBTzNW7uPdMhBa0YkehGP
 8y3QDQi+xwe+BRnihUXTixKgMSxuJ8OYJnkMTm260b1qWLBMi+z1JBNx8X3ShI3JotvWBFK8E5L
 UIjWuddcfHvHuhldl7DZyU1nyQQJ/XcZVB64xvjOIbNt4D4ziSpmwElJ0BSmJIBCS3F9Foa8wLx
 N3u+77k8hrfcz2ejW497l5CEMpxLv1B9rKmqezzxrHvomuhkTEI1R3+miABOoi22TZz2G+2xNA9
 328lsQuh2BigHWoXytAA6NgJNbg35J0Rkw/Gga+ul7C7X0P4o7SfqA955lyG/odggKKmSCU2bed
 RgAATzrJZwPZOKwZxtQ==
X-Proofpoint-ORIG-GUID: RhyFgXNm7K-lLKDxmqWkCvTbRCMUu3Pz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_09,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050006
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
X-Rspamd-Queue-Id: 11AD8209AD3
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 06:59:42AM -0800, Rob Clark wrote:
> On Wed, Mar 4, 2026 at 6:57 AM Rob Clark <rob.clark@oss.qualcomm.com> wrote:
> >
> > On Wed, Mar 4, 2026 at 5:34 AM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > The MSM GBM backend uses MSM_GEM_NEW to allocate GEM buffers from the
> > > KMS driver, imports them into the GPU driver (msm or kgsl) and then
> > > uses them for rendering / blending. Commit 98f11fd1cf92 ("drm/msm: Take
> > > the ioctls away from the KMS-only driver") dropped all IOCTLs from the
> > > MSM KMS devices, pointing out the need to use dumb buffers, however dumb
> > > buffers should not be used by the GPU for rendering. Restore GEM-related
> > > IOCTLs for the KMS devices.
> > >
> > > Fixes: 98f11fd1cf92 ("drm/msm: Take the ioctls away from the KMS-only driver")
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > ---
> > > Note, here I assume that dumb buffers generally should not be used for
> > > rendering. That doesn't seem to be complete truth as Mesa kmsro on MSM
> > > devices uses DRM_IOCTL_MODE_CREATE_DUMB to create buffers for resources.
> >
> > That is problematic in kmsro.. (but also unsure to what degree kmsro
> > ever got used "in production".. the x86 drivers don't use it.  Android
> > and chromeos didn't use it.  Etc.)
> 
> (also, allocate from the gpu render node)

I think Asahi and VC4 allocate buffers from the GPU node and then import
them on the render side, but unfortunately iMX IPU driver doesn't seem
to support PRIME_FD_TO_HANDLE.

-- 
With best wishes
Dmitry
