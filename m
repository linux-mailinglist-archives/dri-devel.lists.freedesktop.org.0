Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNXZAAxxp2kEhgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 00:38:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BDD1F86DE
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 00:38:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D586610E8F0;
	Tue,  3 Mar 2026 23:38:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="W5rdZLB1";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ih7c7QVJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C47D10E0BE
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 23:38:48 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 623KspPw593181
 for <dri-devel@lists.freedesktop.org>; Tue, 3 Mar 2026 23:38:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=HETIh57/WN1W6G1iHYhqMK98fKdw83b/Ty3WTEl3N34=; b=W5
 rdZLB1os+9BHgXdvpx6KEzLqpVv1IQbZ8ACWO/kQ/gYq2GERHZZiRH/kXmQRsLY+
 MgujQvEeXbQJ+OA2Uvdpi5Kix4rnprxp1rgm/315N8tlZTkcF4Eyp0mDrlyzIfqw
 qb9W1jlK7RQ8yEt5zG+Rb8LE9A5jXUqPRrwo8A5FyYGL1CMWVXaF8gCp2Mb/bupk
 O2NkZrOhzQkrC7r/VRc0Ixp3PvmEzEMXLe4Nwl2ehSpvukotivsg4qys0R/Q4rpq
 UmsSbWyeWPTrgoEBssFF4kUh3BgfCPNk/Ur8zHCabb0h0tmEqWgX8ih+VzIdbsgJ
 aL20QY1W2ii8CgqW2OpA==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp73h8f9r-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 23:38:47 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id
 006d021491bc7-67999892f00so125280484eaf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 15:38:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772581127; cv=none;
 d=google.com; s=arc-20240605;
 b=By9B+XzH6hJQemDFVjAAKn8/pJ5iruQBKgn+zfexXKjyGh5j/RmbZ/tzlufgGgzUaN
 mWaEtPUxDdwl/t7uy/eKKYhyZjHsHxB50HeHllvSLD2y0DdydM2PVqWvGgfMkKbhYTdS
 bAyJItKL4zsskTUHKPnmG4NBObWI107kO15M6MAe8x/v9CJVFSkBSQDg2DEZOCUFdL8z
 AgUJRbf0GLgrbk/bxFAk7SAI9uvg/aAdytBK8YfYeKdQTghlSQfNlLaH+cFHqLtrbrte
 d79ADxFJ/cBtI6WENOD4Y5TBKXGY/S188nd9ZY8vWM0NER7CXSv/tUNSZkJ5aH7qx9g9
 Z9aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=HETIh57/WN1W6G1iHYhqMK98fKdw83b/Ty3WTEl3N34=;
 fh=0APlhFOu2ZB9rYjALvICxNXo6tQewA99+/QHOJEGvuk=;
 b=AbPT9bWAqYwOwPPsPMzOT5j2w+KoQGoouo48xXF6FXXzXuRYglCADmrxKKDT6zCXIy
 01Vg7mEa52ENZKHAPI2dLcsTAyGhMQTTsP6buiB5PoerR1CbHxDEgcod9HA9KtrGOC4I
 UgVjIfI7RAyOlpPZpatN1JLi4i1KhAqfK/clmtuCQg3uwkuIqlNERpWRQRYtUOgH/p/A
 PsERXoi9nxDmyzc+cAfF5gy87CMdGI02IOi7Bqp7smwNQ1Ke73bCepKr+TUXVhRzxGAp
 bYIg4KPfsNuFq1pw0moqfTWl2EQkU7KfYpym7aBbo6KjGi1XSDUKECGu8zdaqoqBXFN7
 TxrA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772581127; x=1773185927;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=HETIh57/WN1W6G1iHYhqMK98fKdw83b/Ty3WTEl3N34=;
 b=ih7c7QVJ1o9b/Zelo3C9abIRWl4+YxPLJz6DghtigswBa4j/4KoidIcv7LoyyQ2/V/
 YZziq1Er3LXW88ge0eOVATjq2mIFm95RrGJv+Xyh3EM8P1aHK1oGBJwbkQRBLARrtHma
 gsFo+OJ7mHsGlbJJhM5Ow8LgH9DBNZCGpMzpjn0F7gYW0K0jFxytJo6woN4qGm4O+yvm
 Dmt0imIsLFoA4OAnRrS9VmC1oh2ol+r7/2h5CPIFFryEbCtiug4PZ5vbBStHGrXthy4I
 OAqfe9AAjRw7u/d5KyRfEN3sgi2hHcKc3sWeuyeS8j/JZQi6/A4/5YWktMhM0beVPzzG
 veJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772581127; x=1773185927;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HETIh57/WN1W6G1iHYhqMK98fKdw83b/Ty3WTEl3N34=;
 b=EVrD6sS0XkCYJeWkZghKqLaPRaG+k+mYKf7zTRM6Kuxnx1CU8ZrEI0z2AzyK3HL9gr
 RR4xq24UEcg04Ej3DZdBOEi+FIGkK5Z+dAP0aTu8rUFDEdQvPn2uc9ZDMwhkFfwBygR7
 4F4dFjjHnAuZ7i7cmYBo3+O2Tek0WtK5BQkEeGnOjmBuqaRw+CwLHa5Ofouau67pthK9
 B0RPUNxVnnDy4KX1UnXO3krRTALPYHKf8mAiNwIf6Iy6PflepCXS/NxSzfvYh9RgTLTb
 fWVKR1cd2+jGeO5+jW4Iprbl+Ezd9Dfr8WC3hjryhNhVe3FnJb7l1UH7laCmEiyoKash
 MS4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaBD0vvTfoYeTaGptiuaOzivDsxvrlclskkVku2HAph0M7quvf4XAMyW0S+vTlzHNZROIuX0/MG5I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxICrFwKpaEZ6CCBeMbSZ2Z/TsP7dS6qoY4BdfhxhnU+CLhmJsF
 p9xDsH/epmx4pyMVXUcW8SvhxWlMGdLfRhWnI0gP/41M0YTOeeUBx28ypAhEsAUrVUiC7IzC9/7
 BUvL2WCntp9+ffqwBlUPHwTcCE9mGKY5PQgrhciZkc//8hrSInVzwBf9decznLKBLkHxBY3IrQq
 enBE8umH1VV6GAzUl5BN09Wxo/kiZ9VUjDtL5vViQuWF/Eaw==
X-Gm-Gg: ATEYQzxnhhdahcKmFlmshucQWaN5ExmOCxAif622fcKXcWFJM/Iw9o5qxr/o7WiFypo
 EgyOj4s8XWuNePrGGVC0qbY5Hs62S3F+8egQ3xLIrRAkpn/3J0zX0M8lSNM3HmBlRHJJvRmjEv7
 dli4ZgM0V01zU7Ik8V1WP7tjV0B4zeAinzi1W+fH2Kb1Uf+eLFl3TpqRe3BdPKLz213qTagzZC+
 CoVDhM7uV/8VsfVtnjgLYHuiY/tKkSndzAtNQ==
X-Received: by 2002:a05:6820:480a:b0:679:e85c:10d0 with SMTP id
 006d021491bc7-67b1775532dmr136153eaf.49.1772581126689; 
 Tue, 03 Mar 2026 15:38:46 -0800 (PST)
X-Received: by 2002:a05:6820:480a:b0:679:e85c:10d0 with SMTP id
 006d021491bc7-67b1775532dmr136141eaf.49.1772581126306; Tue, 03 Mar 2026
 15:38:46 -0800 (PST)
MIME-Version: 1.0
References: <20260223-seperate_gpu_kms-v1-1-e8231e7f1685@oss.qualcomm.com>
 <srjcr7fosp2zvkpw4q63tbguu3edrg6ojv5zabtjbej5lr5opq@slodmuzofzyi>
 <CACSVV014AxTbB-M-Tg4X0yn=kUFnEncdc+Oc=kKrOevuAKJmAQ@mail.gmail.com>
 <7q7czu7kwkmnnx3ntuduxf36lkzod4mph7ky6334xarbipivcp@3jfhc6ahdhbr>
In-Reply-To: <7q7czu7kwkmnnx3ntuduxf36lkzod4mph7ky6334xarbipivcp@3jfhc6ahdhbr>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 15:38:35 -0800
X-Gm-Features: AaiRm51_hWr4aVxd4N5ut8lsjNQFrYU8njlJN0yxFr2wb8YZM9tMut-iMO_Jk-4
Message-ID: <CACSVV029s0xBDgUXp+g+JjKJQu-jv5n_nSCQHyXdtfDgyjzVFA@mail.gmail.com>
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
X-Proofpoint-GUID: rD4lvIHqMBpcn7rWh-0LgOovdyw-II1-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDE5NCBTYWx0ZWRfX1PhpTEpsQS5B
 dAQwxoywlmoZ/2TthNim57XPZEFBQ1Ow4XCnaHEIkdBbYcomstEWhmNtiTgvZ7pK1vcy2pf+INW
 QuvyBDay/GMQnEN7MMi4W8qZRuXGDQAxSNj4OgxWX/nbrqhjqAUrMWCDQYSfHmc6vH3wyPTOokh
 q717s+vC/40C01A6qWRoU77d9Qe/oborexX7ZzgMD1Z/uNBuQ7ZwYe1X/vSU0BOSM4FE17XDX6Q
 JNpJOy717qFAMdBeWUuC2aBF9RTLfRGokSMZPvUPeqdfJDAZws/DsUYC2iZ8MS/HBwNUdUOe27G
 Lxd5jXLnX1QXy2wLWeeJc+EOVEoer3mOcZzQnpG2bRMWN1VBZQJHmbJWdbWPag0zV4h7HiKTUee
 PGtEHUQUFSAPEwD4gxr/XTVzArxTy0as4JTCJeNdb5x8KZTnIec8LDPWAT/cVINAn9LyCyTUMZU
 8dH6VKYfebBfE+uEyrg==
X-Proofpoint-ORIG-GUID: rD4lvIHqMBpcn7rWh-0LgOovdyw-II1-
X-Authority-Analysis: v=2.4 cv=BpWQAIX5 c=1 sm=1 tr=0 ts=69a77107 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=gJtko_qlBpcEJjb-Y0AA:9 a=QEXdDO2ut3YA:10 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_03,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030194
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
X-Rspamd-Queue-Id: A9BDD1F86DE
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:replyto,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Tue, Mar 3, 2026 at 2:32=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, Mar 03, 2026 at 10:35:46AM -0800, Rob Clark wrote:
> > On Sun, Feb 22, 2026 at 12:32=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > On Mon, Feb 23, 2026 at 12:40:10AM +0530, Mahadevan P wrote:
> > > > On targets with multiple display subsystems, such as SA8775P, the G=
PU
> > > > binds to the first display subsystem that probes. This implicit bin=
ding
> > > > prevents subsequent display subsystems from probing successfully,
> > > > breaking multi-display support.
> > > >
> > > > Enable separate_gpu_kms by default to decouple GPU and display subs=
ystem
> > > > probing. This allows each display subsystem to initialize independe=
ntly,
> > > > ensuring that all display subsystems are probed.
> > > >
> > > > Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> > > > ---
> > > > Depends on:
> > > >       https://lore.kernel.org/lkml/20260124-adreno-module-table-v1-=
1-9c2dbb2638b4@oss.qualcomm.com/
> > > >       https://lore.kernel.org/all/20260217071420.2240380-1-mkuntuma=
@qti.qualcomm.com/
> > >
> > > What exactly depends on this patchset?
> > >
> > > > ---
> > > >  drivers/gpu/drm/msm/msm_drv.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/ms=
m_drv.c
> > > > index ed2a61c66ac9..65119fb3dfa2 100644
> > > > --- a/drivers/gpu/drm/msm/msm_drv.c
> > > > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > > > @@ -54,7 +54,7 @@ static bool modeset =3D true;
> > > >  MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=3Don (d=
efault), 0=3Ddisable)");
> > > >  module_param(modeset, bool, 0600);
> > > >
> > > > -static bool separate_gpu_kms;
> > > > +static bool separate_gpu_kms =3D true;
> > > >  MODULE_PARM_DESC(separate_gpu_drm, "Use separate DRM device for th=
e GPU (0=3Dsingle DRM device for both GPU and display (default), 1=3Dtwo DR=
M devices)");
> > > >  module_param(separate_gpu_kms, bool, 0400);
> > >
> > > The patch LGTM, but I'd prefer to get confirmation from Rob.
> >
> > I prefer to be a bit more paranoid.. perhaps switch this to a tri-state=
:
> >
> >  -1: separate drm devices if there is more than one dpu or gpu,
> >      otherwise, single combined drm device [default]
> >   0: single drm device (matching up pairs of dpu and gpu if needed)
> >   1: separate drm devices
> >
> > This way we aren't changing (or breaking) things for existing users.
>
> I'd rather break things and hear about them being broken.

You are assuming you'd hear about the non-obvious breakages
immediately..  I don't think that is a good assumption.

To be clear, I'll NAK any change to the default for "normal" hw
configurations.  If you want to change the modparam to tri-state so
that "weird" hw configurations get split devices, I guess I'd be ok
with that.  At least it limits the potential fallout.

BR,
-R

> >
> > BR,
> > -R
> >
> > > BTW: have you tested it with X11? Are you still getting accelerated G=
PU?
> > >
> > > --
> > > With best wishes
> > > Dmitry
>
> --
> With best wishes
> Dmitry
