Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIPOLkSbqWm7AgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 16:03:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0FF2141B1
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 16:03:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B7E610EBF7;
	Thu,  5 Mar 2026 15:03:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y8gCH7L4";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SBq21iN7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 152C710E2B7
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 15:03:28 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 625AFuMv4171110
 for <dri-devel@lists.freedesktop.org>; Thu, 5 Mar 2026 15:03:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=ejTcTE2T1qRg/5f0YDJu8m4fa4521jxxFWERnh0RJe0=; b=Y8
 gCH7L45JWn/HjUc3BfuZ9xnEPbncSbpCEdBBjfN8kz14pSFI9Ua8RSKa4uroPCia
 PELpbRGQWV7h6iHPXi7JLlZwMM7OhoK4fdFUcpfLIbbqJtnoq5kgB1egGrTAKDOj
 dtn/1Fn7KWd5nDw3GNKUanXvI4KY9Hun50QtRkPBTZjKqysRQ+AP4YdnU4gLHcbn
 NjO3CPzLB5dDCWX1gQXLAdSC+a7v7zOnltxSMLJuEpmRtUrWdeAxc+NzYiI6bn2u
 0Owkiq/gP7WhCIYmVVtYgToFGomlvbj+ZTDYM0linp54IJAD4/Mu/lyGz+CPUVtS
 7DNERbpmRU4ziL+rHbFw==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpuhb37yj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 15:03:27 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id
 006d021491bc7-679dda090fbso140123057eaf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 07:03:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772723007; cv=none;
 d=google.com; s=arc-20240605;
 b=W0xjeeqaKi3UKvHkgsJeniVxK+OpuG7Ywa5X4s/5JwtxOLWvgBme64qd70+Fkx5+Md
 VteiQ5raB8pnVY5Fc5BoMn/cGqxwLOQ6GuEvLo0Ll6phXyJWX1RAHLE3jFiSAUDXoNQs
 RYsPdgvUnz8u76kBBfOFftMzz1ejnSd28MCe9+vy5Bx8aZfVkEGGLu6wFCv1W9Yq1ZYI
 R16vB8hGWznrXWfDBL63sxNNcw9Ku2aaPOh7DQaG2f2U68GK2Rxt+is/QhpUBXlzZ6SD
 6fXDuYr+iJssZkE2Hrzz/q55Vif3TRlRXi6Un8J59MfJvGoIogyulyottmCtzCpeDbgY
 nUmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=ejTcTE2T1qRg/5f0YDJu8m4fa4521jxxFWERnh0RJe0=;
 fh=uHh6AG3CQjbH5A1JkRi6MLTrXtOB1TRpSZwep+VaM+Y=;
 b=DlB414kvrEDQolgifieuqqsqgvZ0FjyvwHLjyMob5ocVgXfHPrtAj5623mbQcLdZhz
 op9dyA2t4exvswUxdKFvcJggNxTX9e8Vh9Lq7vLnAwnCWcetG4835YaQyDUFlWGzhen4
 T4CNP8urTD1ivangttz+NvhjrIjErh3MRLkptSxO3efSrta7MIetBgM79XDjhkx+AsLG
 MCIYFoX5M9MatH8DNJwxO26V+k4C/5cyrB/w1bm7ajxYJb8Y+ra2RNZZHxkv1NNahwmd
 A/BkDn29+vln08HdqpDNbSi4D6Rae4RuY9493lsgjj3uJiR2fQXX49GHjcqOmOhIx+oH
 ZB+Q==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772723007; x=1773327807;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ejTcTE2T1qRg/5f0YDJu8m4fa4521jxxFWERnh0RJe0=;
 b=SBq21iN7jcG1KVqX+36k4tcXpDuGjQ+3aVSLRUq6ZUXEnjQD7Jd4995m4Rp83ZqDBs
 vfXpciXgTvtYLtbUt4H6sBqAMB+U3XFoRxNuV4L+/HG48mwkSdjxHptGQQBEYdEEAYpc
 A1xCev5QpJ4fQIyoXfmShhMc+1QkaQMbVz8W3KRdAQ2146h9hp08bNYpyHTDNEZes6K2
 M97jcyA4tfx7iDlM8jWNZT7zXH517h1QiZXrEPYAXlBibIMWB1TwRNranJi4m/JsXzMB
 Q7dZWgGkwn6QdPvM2ILaK+dZAr9Hxu6TwnVbChQvwuyOxTDoG9Pve4vKT/CQij0YC6XK
 8fmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772723007; x=1773327807;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ejTcTE2T1qRg/5f0YDJu8m4fa4521jxxFWERnh0RJe0=;
 b=unAvTJ++aL6mmuiNV7ZHZf9QKMmC48TueyRMZ5TW7oUP9+8i6ugSIAFtQnr9/1221U
 lru++vUsAp73FGU+D9YdWmlk2PSQ13Vm9saBasHqPEerg6CcP2gEBS5XiZI1kQl58chs
 1OGqlx9j1sXCpbtB794GCBzlGgYIxu/o7LGPVHAMuwkcrxAkd8Ca2tIVzAcblnW/Xzof
 y1STyjJxor3ajIzn7PUtv7R69us9JDc/BIZmAPVKXw9SDQN3UNobon+iwwxFiQo8RYo3
 H6YhrQL3aMrV4I1SFTwUPSDJdWHocnkF3NLBf8WCgG+0EiwUqvdC1husCZ0oYIyf/PTM
 LiRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUd3pm26+EJo38y5PqtaXQa8bP2g+U17YFpMGvWvw7eDVhrEvbK/Oi8Bug85k6r4e5uPJiInZrnS8Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXGPULCGDO+l/D1H3Dc3qu3I2zLpUp8Smcx2W1wwuR6OeesX2e
 be/r+VlTMeL2oM7MSIbwAmmtb4a+pxhnt6x9/DUNxPphb8wyjc3OOQOGFCIG+n6prwYfJmWaknd
 l9/dy2VOQste2oIRVAf5GoeKswqn882j/qhKmV+3eMekbXYTeorVnnxSTY+OfyVqxIPiFoqBIB1
 3ypAq7k+I5Pjq2qr0leZpKjlwQO7RfmGGFsfd1+vDqp9ddMw==
X-Gm-Gg: ATEYQzyuhphmpg0evoc1ru3nMYHf0lbXOtcKLUSS+7FIhX8jr5mKj8bjwpNJ/UNNCMD
 y1MbIZMvajhtza6r+Vwtw3zlF1X8ALGA/0GXsieJBGLChk9XZgsYu+hf/Q6ep8Ny+RjMBpajchn
 J+iAgZcWwKC7wGZ8T19jx59GE3ihDAx7JPlpip/Vuvz7gNaF/hXw+AJco2jyjUyVFsOjkpxwrqz
 06vDRV0qKHlrFUjYIM4seuzXNIV1MgsE+cIuA==
X-Received: by 2002:a05:6820:208a:b0:659:9a49:8f9a with SMTP id
 006d021491bc7-67b176f9f67mr3931563eaf.19.1772723006306; 
 Thu, 05 Mar 2026 07:03:26 -0800 (PST)
X-Received: by 2002:a05:6820:208a:b0:659:9a49:8f9a with SMTP id
 006d021491bc7-67b176f9f67mr3931529eaf.19.1772723005755; Thu, 05 Mar 2026
 07:03:25 -0800 (PST)
MIME-Version: 1.0
References: <20260304-msm-restore-ioctls-v1-1-b28f9231fcd2@oss.qualcomm.com>
 <CACSVV03T5ceDADxbdgpitczk6rExcRpkQQ8vcedR0gEK3bLQkw@mail.gmail.com>
 <CACSVV01M7YmW1OCjUQ+QFRpXHoY055MEnBCczeG1zRuQyi8z_w@mail.gmail.com>
 <fpeatj5yrhp45rdd2qzcdtltrofr67noqc7fygsisyaquzx36o@ek3mfy32z5rv>
In-Reply-To: <fpeatj5yrhp45rdd2qzcdtltrofr67noqc7fygsisyaquzx36o@ek3mfy32z5rv>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 07:03:14 -0800
X-Gm-Features: AaiRm51bDhvB43EfwoxoSRnaOyoFThqhuUzYzZWYldhnSsTl3epiIJCXPrkywEM
Message-ID: <CACSVV02U1+or3yo5biOZ6imkkoExNPeDCmgEUWKc04ObbsikuQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: restore GEM-related IOCTLs for KMS devices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDEyMCBTYWx0ZWRfXw3HU3bc1fwPS
 u3OddQOJdB408BEs6LJazN3SKXGL0SlnRBPdq+v+YjOJIeuexx9vpBXsskP/XVD0aJMHYJwYx0i
 49k3z7zM/WXdq/ayg9hvi6wfZYRcZ45DNS/4audYDogxHIMEwlolDV0FLbRKh2dsBlkpI+spZOM
 flJWpBTJiKHkTNFdupERZigbSDIIyJF36dw4Ka8JoXkbTvjdODZPGhTo6uKPR3P6HGlo3wyH/2H
 gsFuc2GDUXk1Gd43sfkRJBmmypEOgYBo57E77Pnx3Zw95LwazeEXOtnzuiWM82r6VTjkt/C7sU/
 /VcKlBqpR5T78VAsv2LSoUDKK6UMpMCQv9jmdRckvbyn7TZ/sr8S1+q/djTJUqwPbgOy+ImLwpU
 4derIj7wI1h9gbT1mOIuJ8bAAPW6N/o5C8H66X8J5O9/U3z9ZTY3vikR/gerCckWWLF2z6IUVB6
 k7WU6vKiyFkJXTk7Dnw==
X-Proofpoint-GUID: e-fh1FRjB_P9u8n7Xq215amT9218Sxiq
X-Authority-Analysis: v=2.4 cv=SqydKfO0 c=1 sm=1 tr=0 ts=69a99b3f cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=ASjFhuaS4dzjz75NzcQA:9
 a=QEXdDO2ut3YA:10 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-ORIG-GUID: e-fh1FRjB_P9u8n7Xq215amT9218Sxiq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050120
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
Reply-To: rob.clark@oss.qualcomm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: 6D0FF2141B1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[rob.clark@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com]
X-Rspamd-Action: no action

On Wed, Mar 4, 2026 at 5:03=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Wed, Mar 04, 2026 at 06:59:42AM -0800, Rob Clark wrote:
> > On Wed, Mar 4, 2026 at 6:57=E2=80=AFAM Rob Clark <rob.clark@oss.qualcom=
m.com> wrote:
> > >
> > > On Wed, Mar 4, 2026 at 5:34=E2=80=AFAM Dmitry Baryshkov
> > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > >
> > > > The MSM GBM backend uses MSM_GEM_NEW to allocate GEM buffers from t=
he
> > > > KMS driver, imports them into the GPU driver (msm or kgsl) and then
> > > > uses them for rendering / blending. Commit 98f11fd1cf92 ("drm/msm: =
Take
> > > > the ioctls away from the KMS-only driver") dropped all IOCTLs from =
the
> > > > MSM KMS devices, pointing out the need to use dumb buffers, however=
 dumb
> > > > buffers should not be used by the GPU for rendering. Restore GEM-re=
lated
> > > > IOCTLs for the KMS devices.
> > > >
> > > > Fixes: 98f11fd1cf92 ("drm/msm: Take the ioctls away from the KMS-on=
ly driver")
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > ---
> > > > Note, here I assume that dumb buffers generally should not be used =
for
> > > > rendering. That doesn't seem to be complete truth as Mesa kmsro on =
MSM
> > > > devices uses DRM_IOCTL_MODE_CREATE_DUMB to create buffers for resou=
rces.
> > >
> > > That is problematic in kmsro.. (but also unsure to what degree kmsro
> > > ever got used "in production".. the x86 drivers don't use it.  Androi=
d
> > > and chromeos didn't use it.  Etc.)
> >
> > (also, allocate from the gpu render node)
>
> I think Asahi and VC4 allocate buffers from the GPU node and then import
> them on the render side, but unfortunately iMX IPU driver doesn't seem
> to support PRIME_FD_TO_HANDLE.

I guess my general suggestion would be to allocate from GPU and import
to display first, and if that fails then try the other way around if
that fails.  For kmsro we could handle this by providing our own
ro->create_for_resource().

BR,
-R
