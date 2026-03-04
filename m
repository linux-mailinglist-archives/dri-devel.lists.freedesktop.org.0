Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PtsA/NIqGnysQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 16:00:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 973862021C4
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 15:59:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7C0C10EA37;
	Wed,  4 Mar 2026 14:59:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="J6CBpzz7";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EBvBKHod";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65A3610EA35
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 14:59:56 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 624E0Xgv029304
 for <dri-devel@lists.freedesktop.org>; Wed, 4 Mar 2026 14:59:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=Hv70iVIdwRCyqz6gpBYfc+L9gnPewb44DgUQAd2IziA=; b=J6
 CBpzz729j7YRvYSk83icgykoKjI4sE96+e13QscHSGYJAx5n9Aq0k9uPMIgmnX6J
 J2skZuiD6e9YAECGdIWa48nkKTXWIBE0w9ynxD04dv7x2Pn9kvzqIFyqDEywG8Vi
 sZSulTmcwwVdeO2KRTODYesyS1BNvMlT/RAHwHDO23HtzYsxVZ4s2IWKtoJJ5yhx
 fm8kJ5fqUC/D0P1QTS2KBvx9UymSIKJc5qJr4OMnJf8zT/Vl4gnAOS6syQ4VSLBR
 unGbvR4BY/W5CBsg9bpWuHhGNEBMJtI4cWcFXgdfaKv1ufHx2ywTWaZg7WO3WuZh
 lcsrpChIcKOqxt294tRQ==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpp4fg60v-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 14:59:55 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id
 46e09a7af769-7d4502a80d0so77601219a34.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 06:59:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772636395; cv=none;
 d=google.com; s=arc-20240605;
 b=KUiPjfKhCXqF0dPMePFQY1z4Rx3K5y90FHpb0n8alUb+CNADt1bfx5jgCu219yhd0d
 AYoONG19ltqiZ4XBsj3VCR+p9EHS+LJPhVOVaURPxlB/+vOy1F+8uZRuNV6X4crzWUK4
 JnploH9q2Y1hA/JQkuWVsa6wPeg6b9VJHEzkCFBMkNg12pXcmJkQ4GZ2WofkeGwmOm8j
 p2aCXWaeRmqZOYH8g2SAl55yhncyolQSsM8kpY3M8klHdHzipZgXxOSLaCF7Njl1Ffmz
 ECbUxKtDponv27KWDcwmP4d2SRCZ9Tb2fjoHHM9Rj5dlLLO3kbz6hYfC2c4or5qnzM3L
 rUnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=Hv70iVIdwRCyqz6gpBYfc+L9gnPewb44DgUQAd2IziA=;
 fh=4wuM5uOIHS6cxkE9PIQNFB8AJzck9+kGDD/1DUNakec=;
 b=Bh8QIToiXAoiuLMdFrzaFf5bzJYTDxEKD7Dy5Y0EtLKi0PoiYhQk+Dw2LBcseW2JRy
 668UISUA9tWass1nlsQme4W23ImZj8FAKs7co4UTIgZrktxCNbuW/W4ejgybYefNfGW9
 qs7PnRKQohMkrOG+M2kFUyqoGis0Ei24ZQLT1RbdtqFGXSboiC/2nphksxtW+9JEyLrk
 qXbbSTIEr9sYF+vu0bk9QsI0B2f6H6ly5MqNJbdcrub+IMafBg/CSJPPdCPQ61txUIHs
 SGoYWTmod9HT+9IrQ1nSui64DxGcbHjMfy13Uj0ekfUTRDtRxyE2X7kiJD+h3jW6R4e7
 +TDw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772636395; x=1773241195;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Hv70iVIdwRCyqz6gpBYfc+L9gnPewb44DgUQAd2IziA=;
 b=EBvBKHodchrvDPNSx/FoDM06gdAOgf72D2kCsQofwc0meARq4GR5gECcm9uVN49dSE
 s7v/Xzj8PQtORT0ZEJrN+aYaXO1FdgT7FciNRxAAU3s+NYSWXjoqqbCiyhmchZpPdnpD
 nFFNkGx1EJzAElBQp1Jah0cOa+XuD+DwSTZ+4ZGlpOXX13S7yBHxks4XWkYklfuUPtGp
 ggPj1dh5cD2JwLXUywfhGN6JfGo3kdpkzprK1Va160Fb1NCuz0GXYgm/+aqChsDwH61S
 SrtL9WTyJHWTd8u46e7T/yBKQmZ7KPV2cwrdM4eIY7/WXMAQfwcIRltTsMALUE91qVhl
 P+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772636395; x=1773241195;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Hv70iVIdwRCyqz6gpBYfc+L9gnPewb44DgUQAd2IziA=;
 b=Lb2r/4w7gBoypGVDNYC3cGHMYmRqE7tZsYoj0w8sanQyKgyxNu5Fn8cGMvbZeNz+Yu
 xmJJhzsvfk4tJrGw27v/FavCbKkfDxzqKIdUJmsVdfHrrugSwCeMBnyOwcNyc99a9pfm
 Otc66IptXNVkWdlizBwKUieVWVjlXg/0OKBasITj80u7gWUNN6IPFt15th4f6ceMiPwK
 qRY8cxhL1msuK4Ub4wnIiTePVJSUs15EN5CHSa1aV/aY206K7gjQDZj+E7BJdOGbu0DA
 05sB4dzG586KJFfy5pmHA9VXySpjmAEfbmBlti9bVLg6Ofu3bFhEGwmR9oobnNZpCU1P
 mcAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGieCgYQ8Nhr2c5VigDNhDSvYuqjU2lvE4cMH/83SnZShZ4Maxy9zUvQFlQcnzlkk+z4fITcoSuts=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLEaHFcYWYCNbRiublnWfphhGqmGkJkulvAUH0xWNzxnHcrJAW
 gnE0RGRARgyBLT0mQlOzehpJbEUhqLaGRZaT9VKC7Mzsd9QyYBURs07Fpqo3xWJHvhtx8nzRVmE
 eP8v5akg3x0VT7smjsQ16FoE5Tj8TGQLadj38lavydQou5t2mxk/WNQfeJEqQ0G7iRUQhlXR7FZ
 20zoV0Plx6Oy2xzxUb53pBcHYS2St9L9P2UMTtBHTyGz75Iw==
X-Gm-Gg: ATEYQzxCsu/+MR5RbZCs14WhCIxaCkQaivJp8/MjMNRp7/S61bOEcX2M/l90bfFKrnp
 3SwRIVEJWsVjCw8cy48fxo6joaPPRxWkjZXhc3HnClvmoEONfUH9nkptrK16HSlfg/Hgx6PJK1M
 PtmF34oxPeMPU8mGihTlhLnt5YZKC+OJ/Ry57juWBIezhl/1348VzoeSzSEBiBpeYt2wAJAn4zq
 /0DSqxBCCKc8PqRuM+DO0nRYg8A/o83uaXcqA==
X-Received: by 2002:a05:6830:4709:b0:7cf:d819:a2d2 with SMTP id
 46e09a7af769-7d6d38f9de4mr1354768a34.31.1772636395045; 
 Wed, 04 Mar 2026 06:59:55 -0800 (PST)
X-Received: by 2002:a05:6830:4709:b0:7cf:d819:a2d2 with SMTP id
 46e09a7af769-7d6d38f9de4mr1354741a34.31.1772636394669; Wed, 04 Mar 2026
 06:59:54 -0800 (PST)
MIME-Version: 1.0
References: <20260304-msm-restore-ioctls-v1-1-b28f9231fcd2@oss.qualcomm.com>
 <CACSVV03T5ceDADxbdgpitczk6rExcRpkQQ8vcedR0gEK3bLQkw@mail.gmail.com>
In-Reply-To: <CACSVV03T5ceDADxbdgpitczk6rExcRpkQQ8vcedR0gEK3bLQkw@mail.gmail.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 06:59:42 -0800
X-Gm-Features: AaiRm53q2Lnqqf6i6iUSVbAXPETTfxfsXanwpvbBC4vy0B_vFlelVg_-LGAl_JU
Message-ID: <CACSVV01M7YmW1OCjUQ+QFRpXHoY055MEnBCczeG1zRuQyi8z_w@mail.gmail.com>
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
X-Proofpoint-ORIG-GUID: N7nJfOE4wWPQZS-J9y-J7xtsvuIvvTH3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEyMSBTYWx0ZWRfX+VlS0e/zlift
 i4Urz+ORcPCCIzc9dgKizriRm+doez44nE4t8RfJO5vZB8whEj+iSxSFFz0+y5K2IxQTCv7SPml
 RO3KK3gzEAmy7gXpyrTiPID7V1YXTOrRQP+zNzwiiDTNDqxLUk2dgZqDQta50wmZT3KfAofpslV
 Zvo36ewg4Okearrp3zO4S0CXdSs9HOnehaeN6YzLeGuwgqPuVZ6Wd9O3GnRDbhe+7/enpzptFUw
 eKZfhfxU3D6lpuNFwsVvOF+cMtBYfaiP8teNvYaYbB684gRdEYaHwwo5buuhnSqH44PupQstlem
 I5Ih81EPmECSPpmnIEzTlCQLU+QSimM1BuCwW73P36F/2+RK0LFAMLidk3m0Cv4/IVKMx0MIxpc
 l4Zv6WtUtRaZJlBtYgn+jZEmMXdgZddbQv2HK4/4+q8sJ65qYcbbEO0RbPX0tHHhzq6OzK80Q+I
 /Tjqe5irR1C1Qp6PYDg==
X-Authority-Analysis: v=2.4 cv=CdMFJbrl c=1 sm=1 tr=0 ts=69a848eb cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=uh5CrAVrB7YgaaNdy8UA:9
 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-GUID: N7nJfOE4wWPQZS-J9y-J7xtsvuIvvTH3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040121
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
X-Rspamd-Queue-Id: 973862021C4
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
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORGED_SENDER(0.00)[rob.clark@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[12];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:replyto,qualcomm.com:dkim,qualcomm.com:email,mail.gmail.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Wed, Mar 4, 2026 at 6:57=E2=80=AFAM Rob Clark <rob.clark@oss.qualcomm.co=
m> wrote:
>
> On Wed, Mar 4, 2026 at 5:34=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > The MSM GBM backend uses MSM_GEM_NEW to allocate GEM buffers from the
> > KMS driver, imports them into the GPU driver (msm or kgsl) and then
> > uses them for rendering / blending. Commit 98f11fd1cf92 ("drm/msm: Take
> > the ioctls away from the KMS-only driver") dropped all IOCTLs from the
> > MSM KMS devices, pointing out the need to use dumb buffers, however dum=
b
> > buffers should not be used by the GPU for rendering. Restore GEM-relate=
d
> > IOCTLs for the KMS devices.
> >
> > Fixes: 98f11fd1cf92 ("drm/msm: Take the ioctls away from the KMS-only d=
river")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> > Note, here I assume that dumb buffers generally should not be used for
> > rendering. That doesn't seem to be complete truth as Mesa kmsro on MSM
> > devices uses DRM_IOCTL_MODE_CREATE_DUMB to create buffers for resources=
.
>
> That is problematic in kmsro.. (but also unsure to what degree kmsro
> ever got used "in production".. the x86 drivers don't use it.  Android
> and chromeos didn't use it.  Etc.)

(also, allocate from the gpu render node)

BR,
-R

> BR,
> -R
>
> > ---
> >  drivers/gpu/drm/msm/msm_drv.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_dr=
v.c
> > index ed2a61c66ac9..f82c9a36a166 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -799,6 +799,14 @@ static const struct drm_ioctl_desc msm_ioctls[] =
=3D {
> >         DRM_IOCTL_DEF_DRV(MSM_VM_BIND,      msm_ioctl_vm_bind,      DRM=
_RENDER_ALLOW),
> >  };
> >
> > +static const struct drm_ioctl_desc msm_kms_ioctls[] =3D {
> > +       DRM_IOCTL_DEF_DRV(MSM_GEM_NEW,      msm_ioctl_gem_new,      DRM=
_RENDER_ALLOW),
> > +       DRM_IOCTL_DEF_DRV(MSM_GEM_INFO,     msm_ioctl_gem_info,     DRM=
_RENDER_ALLOW),
> > +       DRM_IOCTL_DEF_DRV(MSM_GEM_CPU_PREP, msm_ioctl_gem_cpu_prep, DRM=
_RENDER_ALLOW),
> > +       DRM_IOCTL_DEF_DRV(MSM_GEM_CPU_FINI, msm_ioctl_gem_cpu_fini, DRM=
_RENDER_ALLOW),
> > +       DRM_IOCTL_DEF_DRV(MSM_GEM_MADVISE,  msm_ioctl_gem_madvise,  DRM=
_RENDER_ALLOW),
> > +};
> > +
> >  static void msm_show_fdinfo(struct drm_printer *p, struct drm_file *fi=
le)
> >  {
> >         struct drm_device *dev =3D file->minor->dev;
> > @@ -868,6 +876,8 @@ static const struct drm_driver msm_kms_driver =3D {
> >  #endif
> >         MSM_FBDEV_DRIVER_OPS,
> >         .show_fdinfo        =3D msm_show_fdinfo,
> > +       .ioctls             =3D msm_kms_ioctls,
> > +       .num_ioctls         =3D ARRAY_SIZE(msm_kms_ioctls),
> >         .fops               =3D &fops,
> >         .name               =3D "msm-kms",
> >         .desc               =3D "MSM Snapdragon DRM",
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
