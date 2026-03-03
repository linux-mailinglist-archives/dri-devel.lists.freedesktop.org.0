Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLC2HRMqp2nSfAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 19:36:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B56B1F55F0
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 19:36:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37D4910E8A7;
	Tue,  3 Mar 2026 18:36:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="o3+zq8+P";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BchTX2pN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1154110E8A6
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 18:35:59 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 623H0NNA3708632
 for <dri-devel@lists.freedesktop.org>; Tue, 3 Mar 2026 18:35:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=K11JTMzrY4tqogafe1mi+aYPy++iaZNSLYHBRvG8myg=; b=o3
 +zq8+Pvz6Rs4uhse1bEPp2oWJBdcbNObJ6eom0YUDf8rRxo5sq2IWfz+82Pht0Kf
 T3ckTc8YDB4N//t642TC3Z63LmD4RCTl+8Zi4/T0qGhhVJzv7ApYfDfxNWazU8SK
 h/mMlBXHXdVqV/1ifU6Y1Qlky3Ku0D2C72Ccta6QTesB2qknEE9lSb66EgnoVEQw
 MiPmjcp0xLz45hDAEl7CPeZbMh40uRcUPIafIJWA75L512OI47W+VzHiIx+NQXJw
 FSI+oCu2gOex3q+fpijtauzczihunVLnEoshO05xJTnxkmng9OqvNcT0rkBb/RXm
 fo95gklPY8RUfwLLCnRQ==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnsjm2m81-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 18:35:58 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id
 46e09a7af769-7d4c1b2651fso31372331a34.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 10:35:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772562958; cv=none;
 d=google.com; s=arc-20240605;
 b=Glf2DYcK/j3SUixZXp2PU1yY0OjuQaVFbIOayOE9tDuD86kAXk4Lolms4avS9TrRqN
 bQR3ncw0inlmm+SR2u5F0z0Jfv1xf3VL1sjp76SEqwpwQ9EcR3TulvyeB3ODI/j3jWO2
 9su/wLpUOVhRJagZ6g4luf57QMi6IkAYgWWc93GZ8JxLfwFWgPlwRu54F8fDaIpEUl0l
 fDSKopgeLNRLzhjrpgYbVGt58mcK8wqH+LwSiB973tleyGnep1G5G4MjjPMrgjr2b+44
 j4REVwngNWcH/fiHDoeJwgwphHREWXXD0PBHVIwBmHhgeykGRvOkax/Ki4ubiJvCd1bt
 EXqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=K11JTMzrY4tqogafe1mi+aYPy++iaZNSLYHBRvG8myg=;
 fh=IEJlzCTVAFJxNleEfNhcgixJ/bxv7iLNEAd1RhsS7XA=;
 b=KPx6GNekq8CB/XLOS+8ixLGB5sMfamqyo1a9nEVQWhZFv63TanqpVkFjX032p2FpWM
 KMjPM21sxVHEb8OKH+Gq1O/pA6HR6TnQWtbu0msFwzh2nHvgepV/8JyXB6soNpg4ct5b
 JFLx3NE0IL2FUMLlQV33RdPfSNVN21ZxpjGPAZTIXZa5nbk+lu14KAczXgJ/LRkZDruh
 pTY4hTLGOoFnZAlVUoVqgBYlenzgP3difTuZQ0ujWIrmRw/1QBNhsGkPhTfWBDdodq0W
 6CMPvKgLx/Ojo+zVRF/yfysGUYdQULPqeCif2KnQDlurt167nd0QlyNgbhIw7L+iDL4Y
 NtYw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772562958; x=1773167758;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=K11JTMzrY4tqogafe1mi+aYPy++iaZNSLYHBRvG8myg=;
 b=BchTX2pN/1vAK7oIcn2EdvY3eTa+wIYAsq8rNvLt18+WGIwI19iDGWG2OoXlJqiM72
 wIRqsE9VhG/puEl4+NBOd8mVdi/xKq3hZ/A4jdQVAhxJI5oBDnYbzrUXlkyaaKpsuwak
 A5Mqp5or01+y90KGM8F1X19x6TAASZ+4QTCnGXkumSGSotegoh0GZUjoGzcZJ9Alj0pS
 Z1Bs94fGI3nTvAnE4RFlxVkTDyBWyDsY6PFuMHKrJ1KmByDmZKQpBD9+o8Gp9wmWqv5V
 pGown5vp0pN2TiFPX0h2862LBWeBiugoYC0+WNL5ya+MP4Y0KHNe2XVHmYIQ+PcLjOSA
 h+EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772562958; x=1773167758;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K11JTMzrY4tqogafe1mi+aYPy++iaZNSLYHBRvG8myg=;
 b=SJPvsS9VBM9tSrL/1tnugiHG+Ql7K5lhgRTnkomWIRQfyB9VL8uMew3sbO0U+s3b6g
 g5e6jSiVMfCJOXzJbVx9dyeLWoA92wmIJmvvvPx9he1inaNUTeWQmbLyIBA/7QXT/fvn
 7YnrGXp2b7AHwZjINaGv+1Q/y16cGOIu5QtfHKN6smZXvYMvw+JTaRzVTpWbOmm5t3/i
 73/0OS4GmXF4OJaHKs3nFo6PKxXvaYXPKJEOZTRjMZqte/Oe2QDPJvnd9BYY2G2Q6ugP
 JVRKdORbAppoEshKV8MMIdgazH4JdkXWj21Y1Ju9Q3Ed5xBC04gOyufusrfCCtJTki33
 h05g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8F3RZyjuBwOoLLqjc+iQDH5UySEyrKJY5WliA4GkWyHGMFeLYPIwOQ1HMrxfRym1yf6dUbZGkIpQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6j5YDaGILO7HAjv9fFQn188wXzHVC5Cm252sm+b+cdv25afPG
 uU59uqrCtlVGLqVt0m0TXj4BcydjY8hwUf8lUSoSaQ2kyiajPav1VPpn+OBD9b6cPNzCMG49xny
 55GZXH6fRx+f6sVkdEpoe2mluetc0Ga4nAz+9Agd3V5mNcw3JInNUGUAoCGgHz/eRzhla05s9/L
 rcvCxqnLANeauNQCH26tGohg+L8B7fC5KLUnZp9KDdiToI/A==
X-Gm-Gg: ATEYQzyeCDAy7j7MijU3uQLwvndOfu5HYj5WYw3Gt61ICYbfmJiC6sHQXylgpPj/Vpm
 h+0NBBMbqPkUgmAjRHZGeSyLwmkT0OgW08yT7VtT4878XKmGiaOvZSqpAwm4RiSnIImBrM5fme2
 C46TReBuDgQwY8F2hYDl3eBow+KmeLC1XW/yHe8SrE9zu+rD3uUtaxZDahduSonu+zOJbmidqWG
 gwKc1A2MuhLoMYkxE8VRWmrBx0UjNEEIBWtLw==
X-Received: by 2002:a4a:db49:0:b0:67a:6db:2330 with SMTP id
 006d021491bc7-67a06db25f7mr5039368eaf.14.1772562957692; 
 Tue, 03 Mar 2026 10:35:57 -0800 (PST)
X-Received: by 2002:a4a:db49:0:b0:67a:6db:2330 with SMTP id
 006d021491bc7-67a06db25f7mr5039319eaf.14.1772562957137; Tue, 03 Mar 2026
 10:35:57 -0800 (PST)
MIME-Version: 1.0
References: <20260223-seperate_gpu_kms-v1-1-e8231e7f1685@oss.qualcomm.com>
 <srjcr7fosp2zvkpw4q63tbguu3edrg6ojv5zabtjbej5lr5opq@slodmuzofzyi>
In-Reply-To: <srjcr7fosp2zvkpw4q63tbguu3edrg6ojv5zabtjbej5lr5opq@slodmuzofzyi>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 10:35:46 -0800
X-Gm-Features: AaiRm51LGMLCAU88Ei_EydE8BOitRPr20YiRYude_pQJj4IRN1sA3qdNhQLo5i4
Message-ID: <CACSVV014AxTbB-M-Tg4X0yn=kUFnEncdc+Oc=kKrOevuAKJmAQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: enable separate_gpu_kms by default
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Mahadevan P <mahadevan.p@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 7L6jCvCDdqcowaco1jmc_a-X3Pq896PK
X-Authority-Analysis: v=2.4 cv=GIUF0+NK c=1 sm=1 tr=0 ts=69a72a0e cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=f9mbHagqO0joi95MoiEA:9 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-ORIG-GUID: 7L6jCvCDdqcowaco1jmc_a-X3Pq896PK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDE1MCBTYWx0ZWRfX8ulwiRHvjUyU
 sXxbyTbp+gPVEjbRInPPAbOVybVhBkxzFiEIr6uPxeha93GGyMgalBFqpxPPByUS7j4Sr9hy4H2
 XRDoikhz8X2DPT4ll4GTruC/BboA+soeCrA4JVFWkzdOfN3QhWNT04v5SuIVCXINNuk5a4nx3H4
 1BUdRaWXUTNt/qsnWJTVfy8hcedtXP0SNED1yNqZSGu0K7RjeFL+orswf1YF/+5eZY6kCws6ygX
 AlHfb/0aWEhtSoBRK+UJDbs8rmTyctaMpyD9slM3B+9rBNta1Q3EP3m+lttiSg63k1v/Ckdm8q3
 f3TBol5BibLujy3sz82qVlH1RQCU7ivopYUmocBXlCwgiJWSesERguyaVOT1Y6DTRMtVHrxa5vL
 BozsD/sTeaETs7Se/TccVKTfzDNQj5hgp75OucT2BejV8zkykNiuBpLWQgDsSUGVqhgVd9dtiGe
 5lERQwdjnDJVFhDbRXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_02,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030150
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
X-Rspamd-Queue-Id: 1B56B1F55F0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:mahadevan.p@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORGED_SENDER(0.00)[rob.clark@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:replyto,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Sun, Feb 22, 2026 at 12:32=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Mon, Feb 23, 2026 at 12:40:10AM +0530, Mahadevan P wrote:
> > On targets with multiple display subsystems, such as SA8775P, the GPU
> > binds to the first display subsystem that probes. This implicit binding
> > prevents subsequent display subsystems from probing successfully,
> > breaking multi-display support.
> >
> > Enable separate_gpu_kms by default to decouple GPU and display subsyste=
m
> > probing. This allows each display subsystem to initialize independently=
,
> > ensuring that all display subsystems are probed.
> >
> > Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> > ---
> > Depends on:
> >       https://lore.kernel.org/lkml/20260124-adreno-module-table-v1-1-9c=
2dbb2638b4@oss.qualcomm.com/
> >       https://lore.kernel.org/all/20260217071420.2240380-1-mkuntuma@qti=
.qualcomm.com/
>
> What exactly depends on this patchset?
>
> > ---
> >  drivers/gpu/drm/msm/msm_drv.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_dr=
v.c
> > index ed2a61c66ac9..65119fb3dfa2 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -54,7 +54,7 @@ static bool modeset =3D true;
> >  MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=3Don (defau=
lt), 0=3Ddisable)");
> >  module_param(modeset, bool, 0600);
> >
> > -static bool separate_gpu_kms;
> > +static bool separate_gpu_kms =3D true;
> >  MODULE_PARM_DESC(separate_gpu_drm, "Use separate DRM device for the GP=
U (0=3Dsingle DRM device for both GPU and display (default), 1=3Dtwo DRM de=
vices)");
> >  module_param(separate_gpu_kms, bool, 0400);
>
> The patch LGTM, but I'd prefer to get confirmation from Rob.

I prefer to be a bit more paranoid.. perhaps switch this to a tri-state:

 -1: separate drm devices if there is more than one dpu or gpu,
     otherwise, single combined drm device [default]
  0: single drm device (matching up pairs of dpu and gpu if needed)
  1: separate drm devices

This way we aren't changing (or breaking) things for existing users.

BR,
-R

> BTW: have you tested it with X11? Are you still getting accelerated GPU?
>
> --
> With best wishes
> Dmitry
