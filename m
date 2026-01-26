Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGauMQxCd2mMdQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 11:29:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A00786EDA
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 11:29:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0C4410E406;
	Mon, 26 Jan 2026 10:29:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="twR1cFma";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4136510E3FE
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 10:29:30 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-79456d5dda4so11056717b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 02:29:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769423369; cv=none;
 d=google.com; s=arc-20240605;
 b=ZzMy4drW95u4QbhrlbdzTjCFA+ndqnAEIimBowD/bm9V5EBPoOgPAh/mJMQ1yjOKK/
 320C8ax6drQ8SHPABePOfPRowQJeGvV+q+GbQ5D39LmOK2j1qrjvrpA4WCpOdevZC5Qf
 PHZ73cN8Bp36BUw3uLl2SzC6taNpnWZQer5VrEZnBWiY+XZ90auPf9nAaWMEb7Io0gu3
 fYPqdO8WOO6kzmZ3wMxK9SfX9WpzGr8ydgrnCWOQrhJc2DRn1QwKDYlzTJROqjGQjHJC
 rdICHsWGQca7wS/Paw+SDCLptX8UD3bOLxJRictxoFjdQoOTnrPNfKQYEYJZYMf/xeDA
 zJaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=D8wHCysE8LHeMFG24bZPtzAt13gzC6maYCVRG65FC2k=;
 fh=2AalAmt4rOLe59JFxcPL+q8LJIzvrah0UdolZS7f8FE=;
 b=gDiTSZSUea9thOVC48MFMf0Fw77S0dVdThIki0X23lJ+Hur8IOXCQI73oQ8fcY1UJV
 VJzaP/+Lk+kuwAprUeVuyew+U6C/HqgkKDyoPELT/jY8RL2NQFLhpFbtp181g1DugkpH
 bD9nw9zt5RLK3Q8/s6dcEIo1jFGZ//d0t6qHWFzCI4qQejq6Ao0gTXEoA3TGeGRZsvq4
 OA1gQJoFWUEVVZRmYcR4gWr1Q1VGwZQzAOCMm1u6AUZ8Zwwl/SpvaHRzXnS6aL8HtSuV
 qRZDCDboVW/2iSUTiyMyrRHk78vmkyp/V9PjK5xXv4NH+PBAbfPONEoC7hIg7CLpeiET
 R5xQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769423369; x=1770028169; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D8wHCysE8LHeMFG24bZPtzAt13gzC6maYCVRG65FC2k=;
 b=twR1cFmaYgGVCeudlh9QWanCoXbgGrmjAAvtsiKO/XRNd7zUN/UE4Ea87S+f4G3drT
 cVhW/HpWpK98c+YleR5mhJ9HnL1BCyLfBcudc/inxiwfWliLiOKUWiUV0Vbku6V2OMBN
 uMkog6l+H31MSP1SKVwmLOY+HeAOA42UdR6Fkq79wKh49113/x4RWPEWq3GEH2ouC4Dh
 Hu9BDEAcPf80wWSzCqrUgm4wru/USmbyvCzf2pS3fCcjWTdag/ohwBCFvRC38ICNpOu4
 BoRUZqBFeB1QLv3L+6XnhrBUlSAOj2NhDB1hRdOzTW1HXR+RVosaF7HGVBfmeBTD7GKi
 l6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769423369; x=1770028169;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=D8wHCysE8LHeMFG24bZPtzAt13gzC6maYCVRG65FC2k=;
 b=LXBVjok43jYjkB4l6nGoWe0nDqRnNtelucBMLygCaBNjX7c9Wo4LY+thApgueZi1lT
 7Pr2JNpcKviMwiuD+Xmzv5zzhvmDcUo/lCsLGYdMxOZYj8ATij1QD7H1SGjeXEheHGqx
 e9pll6RVZFb88J8DBXd2LBWQoz1SFd1lg8Xxdw3g713uskJ+CP/a0Edh/4fUl86sZANP
 oyqUOVo8v8UyBB5NxCHtj35ecrNFwIa8+IbPd8aaMy2y7PFBu5rIXBDTmH6G8mb6O1as
 twZ8tTwKvz9+SEIr8xA2cQCI0i1c2NkHwiDP24rM+T3GXz9GPCJp+PGI0AkulvULOL3G
 gSZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3y+BR4aZrbDmeLo57+Dy95sXUTmqAccBLi4Sm4RNN/q8sSo0+KgfYS1WpOFZSiVXNEaX+jQVvRxc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHoV4bF9FCI9RucVn5GksfAVWpkpq7yIh22F9MPt/t2OEn6T7Z
 pyJf96XPw3eEOj3eUjG5VfA3Rav8uXxFPjTOme8NkAMlywjH5wwBGzrLJ2NPx/XGQk2s0NgoRHv
 2WD+fAwZfY762VZ5wqAAU9QkMo4wQSKeSENxce7BMvg==
X-Gm-Gg: AZuq6aIyGeukvSJ+hTWPOkzXxKIw9WknSzf01NQAulwlINFd64GLbxpK0TwlFbTtNlU
 gM8v4HkZ4CW1488Q5brOGGbf8lIAW4wCG3vHKUE3gdA5Wmc+E1botB5UH/ExPuLYOUlzXAb7XBM
 FuvvKcw5JaIegPKgCdksn9FZy4gcrs2+U2KwCsBZYfAawFlrPcm8B9fuM4EX8Yx+CA4rqh1HiP1
 OCThxS5U2uLC/6O5AHXtp8wYMjH4WSBhFJF9WVtnNDMEVVzMq7wlxmgVFZ864zgTX1aCesE0L6e
 ydAQWg==
X-Received: by 2002:a05:690c:81:b0:794:7a4:c847 with SMTP id
 00721157ae682-7945a9ae0f4mr67768577b3.43.1769423369077; Mon, 26 Jan 2026
 02:29:29 -0800 (PST)
MIME-Version: 1.0
References: <20260121-msm-next-quad-pipe-split-v17-0-6eb6d8675ca2@linaro.org>
 <20260121-msm-next-quad-pipe-split-v17-2-6eb6d8675ca2@linaro.org>
 <6kzd2g4hgffqz5ipaqbourgiefuxxh3njj44n35blo37z6hhhj@us7lzlgmjuld>
 <CABymUCMf8LxX6VWUuzNJP+G1y3Xi5-CVYhaqLR7F=kU6ZgdcgA@mail.gmail.com>
 <c56e4ylgwcqni23btaxegdbfg3tbkyp2vtjtboeb3kbvcfk27u@vrlh276djtfr>
 <CABymUCP6ZDGtEJeQSZ48x8TZyJ4gKVDC+JzJRz-tZ0ksCUCqsA@mail.gmail.com>
 <91d590de-fa00-4df3-923f-b49ad00cd9da@oss.qualcomm.com>
In-Reply-To: <91d590de-fa00-4df3-923f-b49ad00cd9da@oss.qualcomm.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 26 Jan 2026 18:29:18 +0800
X-Gm-Features: AZwV_Qidxbgft8poJJthLOL2vexuHqw3nVMNWpER_nv0oJLwqI4juuemdIOjfJA
Message-ID: <CABymUCOqxtYS7BaDMHeN2npn=4+Y-6kxLDOS6oskiiH58epR5w@mail.gmail.com>
Subject: Re: [PATCH v17 2/4] drm/msm/dpu: Defer SSPP allocation until CRTC
 check
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:lumag@kernel.org,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:robin.clark@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[jun.nie@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jun.nie@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email,linaro.org:dkim,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 7A00786EDA
X-Rspamd-Action: no action

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B4=
1=E6=9C=8826=E6=97=A5=E5=91=A8=E4=B8=80 18:13=E5=86=99=E9=81=93=EF=BC=9A
>
> On 26/01/2026 12:06, Jun Nie wrote:
> > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=
=B9=B41=E6=9C=8822=E6=97=A5=E5=91=A8=E5=9B=9B 18:22=E5=86=99=E9=81=93=EF=BC=
=9A
> >>
> >> On Thu, Jan 22, 2026 at 02:03:25PM +0800, Jun Nie wrote:
> >>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=
=B9=B41=E6=9C=8821=E6=97=A5=E5=91=A8=E4=B8=89 17:30=E5=86=99=E9=81=93=EF=BC=
=9A
> >>>>
> >>>> On Wed, Jan 21, 2026 at 04:01:51PM +0800, Jun Nie wrote:
> >>>>> Currently, plane splitting and SSPP allocation occur during the pla=
ne
> >>>>> check phase. Defer these operations until dpu_assign_plane_resource=
s()
> >>>>> is called from the CRTC side to ensure the topology information fro=
m
> >>>>> the CRTC check is available.
> >>>>
> >>>> Why is it important? What is broken otherwise?
> >>>
> >>> I see. Thanks! Will add below lines in next version.
> >>>
> >>> By default, the plane check occurs before the CRTC check.
> >>> Without topology information from the CRTC, plane splitting
> >>> cannot be properly executed. Consequently, the SSPP
> >>> engine starts without a valid memory address, which triggers
> >>> an IOMMU warning.
> >>
> >> What is plane splitting? Write commit message for somebody who doesn't
> >> exactly know what is going on.
> >
> > Thanks for the suggestion! Any more revise is needed?
>
> Sadly enough the text below is not a significant improvement.
>
> >
> > Currently, splitting plane into SSPP rectangles the allocation occur
> > during the plane check phase, so that a plane can be supported by
> > multiple hardware pipe.
>
> What does this mean? Without virtual planes in place, there are no
> multiple hardware pipes.
>
> > While pipe topology is decided in CRTC check.
>
> ?? What does it mean here?
>
> > By default, the plane check occurs before the CRTC check in DRM
> > framework. Without topology information from the CRTC, plane splitting
> > cannot be properly executed.
>
> What does 'properly' mean here? How is it executed? What happens?
>
> > Consequently, the SSPP engine starts
> > without a valid memory address, which triggers IOMMU warning.
>
> IOMMU faults. There are no "warnings".
>
> >
> > Defer above plane operations until dpu_assign_plane_resources()
> > is called from the CRTC side to ensure the topology information from
> > the CRTC check is available.
>
>
Thanks for the patience!


Currently, splitting plane into SSPP rectangles and allocation occur
during the plane check phase. When virtual plane is enabled to support
quad-pipe topology later, 2 SSPPs with 4 rect will be needed, so that
a plane can be supported by 4 hardware pipes. And pipe number is
decided in CRTC check per interface number, resolution and hardware
feature.

By default, the plane check occurs before the CRTC check in DRM
framework. Without topology information from the CRTC, plane splitting
will be skipped for the first time as pipe number is 0. Consequently,
the SSPP engine starts without a valid memory address, which triggers
IOMMU fault.

Defer above plane related operations until dpu_assign_plane_resources()
is called from the CRTC side to ensure the topology information from
the CRTC check is available.

Regards,
Jun
>
> --
> With best wishes
> Dmitry
