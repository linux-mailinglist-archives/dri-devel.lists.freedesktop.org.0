Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NmhCYxXd2lkeQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 13:01:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C907387EE3
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 13:01:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1204010E40C;
	Mon, 26 Jan 2026 12:01:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WXmJho0s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E2F410E40C
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 12:01:12 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-7945838691aso12032797b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 04:01:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769428871; cv=none;
 d=google.com; s=arc-20240605;
 b=PLKIU50MWg+hUVTRMiv8kivwDf+0ABoCaH6n7yNmAaQ85ZobNUBMcg22gfYadjufR3
 UIXJ4wqVnSSUql+VBoQLKX4OccZSKMeTln65oqZ5I44fvMByK644fakVasSWo9gG/z23
 6ZeZS1ohHthjQOjMkYOwWC2pLZFRfzMd1YFKNRalnNTreOs5zhrjBLyXMvGTq0pjGZ5I
 GU15WdCKgymuKJhl5FWlXuRnAZbFNmbYy3A03+MGvqYDK2ng7kDeqGdCeXI5/kfLjyuD
 d6nmdV5EBzrwhJnMsUidwEENwyhsoDQdHUSR2vZL+sDXItsUKm1ULRrEt0UqKnNGtupf
 TN0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Mw4KTn7OReF9P8qDWL30dcxwGr9P25yZho6xXb2IBG8=;
 fh=SDI48nR5MNzRllcX7FU/09vqJ8Zl51LPVOcEmOgkmW0=;
 b=Xolhs7OOJa5CalMXmGfL/sQFPRB5edP0Hi9DZxn4JX4Rq9Tn67s5EV+a0WtLP1ox7X
 wtybumnA/3OIjQzLl8Du+SeSG3Za46HpIN2UZYs78WrFq563lJVVD6IXa/XlgdAOh9p7
 NCDurU4iLze0cIMG9Q0pwYBkxWJqHK/PgnohQg1o0xKnTTFnsiNIz6o+fR6NZTwrRs9U
 jN+jmF4FowbO6AfKFNrM8KD75X6k4kCJmuw76FcYxiQe4xHX1PwB/oCXJkfXzG6kMiz5
 Gj4rkbnF05OX16tKPIjpBk5M5f4tMo33blApbR+EQsIGlUadALaipX96K3t4+6OTFNdn
 NpOQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769428871; x=1770033671; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mw4KTn7OReF9P8qDWL30dcxwGr9P25yZho6xXb2IBG8=;
 b=WXmJho0szDCGybM3aRh2m3GamKGOu9hlMCBZb3CadpTWy0CbXm0ZQw5RqVpr6sVG0z
 YmVyTsraGKupI7RgqRtcuaxWZZ+MhO15KZOY0v87V5vhVMKTrMLViD+0n7EOuOd0AAYh
 D5ylT61YAOewwkzHloDgxwMwRPui+J1hteCVuJKoRh/nk2icWOQvcPTjrswCA9HsmUvU
 6lT5kOaAGSoPTfGkgSdJJzad/LW3IBjJIZgSwYmGoB3ZnwBacvMuC6xHfyoTUkxhkA0z
 BrxdXJuofUlCNBytEDRabuVbrDyUNkLBUDj8TOumKIm6KYPtg+8fPQFNBKokpLfvQv5O
 Nwwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769428871; x=1770033671;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Mw4KTn7OReF9P8qDWL30dcxwGr9P25yZho6xXb2IBG8=;
 b=pRgNQ2bjCwl7ZmvxZKMxJ9oNXmUJhLBzn8AjvAON97LFbc2o8IPICDZkjrb+D0va9r
 nH3OhDOUieFyzHD5jPDFYu/vURcIImbO6vjo4eBNreCmcSu0Bae9EMdw94dy7pwTvwVz
 HlCqlFFmmYKHcR9y+4lF30srpAITlpLhSjmn6AR9FeeLsYvrjuKxqYCrFdDk8nOCTIlL
 hMD+SaFdCnURFCRh9Aexl9SgxKW4WDK3A+ItS2k6YYMF3ZjnqaB8XWjYFu0/KA7abR2W
 UQpyNTPUoCGkLrE5NLRr/aZMMePaECQ5GfipmnLERJoY4s3/v7HTO1DXfzzuX0NN41WE
 jC4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXP7cVJ4jOvoJaXuO8Ver02YZbNY7sdAMTWflnkHs9NjA2e31wp+pj2cRQ11/r6qdRwGsE+YxIRMco=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxzSowYhH+PUk2rhw+wVh5QO7piSm1kSqGEVlkLCb6DW4Sv67dV
 2NaTwPCtVdCszVLWIHCbv1HvYTwuFpANSNa2muhkoYngf4skosmBGKjSPL2+dgHiBUPAAbkTxeC
 mq19bnkMwGLWK3R6NJVgkoddS9XtrJ0D6FI0/0z7n6w==
X-Gm-Gg: AZuq6aIto6/Ha6maPuutqKfZ12ZVPlv6d/uzabABD3Thdlz1KkYYomvXx/vcWuUwXJm
 nygn3BYV/QyofwYGAFm4D/w5zsj6A80eKW707yMssZT2J3ugHGop4VRRKDLdFnyuB7K+DgpnhTt
 i+wd0715r8naVlUDpUAuhEv5jRJ4MXwIWrTQd2wyvOZSWq7orbXv28BxuTsxGbWbfoeQA6d5ROV
 zr0ubaZz3vDvCMUU8JVH3jMgjLpyt/YQIqxB5i4bKj1hShsB3GOHRuEPVvuKJAR0dfA7YiWfDOU
 RiPrNg==
X-Received: by 2002:a05:690e:d85:b0:649:60a9:bd84 with SMTP id
 956f58d0204a3-6497146c00emr2614295d50.43.1769428871187; Mon, 26 Jan 2026
 04:01:11 -0800 (PST)
MIME-Version: 1.0
References: <20260121-msm-next-quad-pipe-split-v17-0-6eb6d8675ca2@linaro.org>
 <20260121-msm-next-quad-pipe-split-v17-2-6eb6d8675ca2@linaro.org>
 <6kzd2g4hgffqz5ipaqbourgiefuxxh3njj44n35blo37z6hhhj@us7lzlgmjuld>
 <CABymUCMf8LxX6VWUuzNJP+G1y3Xi5-CVYhaqLR7F=kU6ZgdcgA@mail.gmail.com>
 <c56e4ylgwcqni23btaxegdbfg3tbkyp2vtjtboeb3kbvcfk27u@vrlh276djtfr>
 <CABymUCP6ZDGtEJeQSZ48x8TZyJ4gKVDC+JzJRz-tZ0ksCUCqsA@mail.gmail.com>
 <91d590de-fa00-4df3-923f-b49ad00cd9da@oss.qualcomm.com>
 <CABymUCOqxtYS7BaDMHeN2npn=4+Y-6kxLDOS6oskiiH58epR5w@mail.gmail.com>
 <bbd8e584-4398-40da-9759-0c27f34214d3@oss.qualcomm.com>
In-Reply-To: <bbd8e584-4398-40da-9759-0c27f34214d3@oss.qualcomm.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 26 Jan 2026 20:01:00 +0800
X-Gm-Features: AZwV_Qjj_g2I7w5tIIriV_jOh7_nPwC9Miffd_hKixfAlcPtTCAzZn6knZ1J8uU
Message-ID: <CABymUCMivNJt4fikx8XJ8KFZB-y4zc2RaqjBksxWrQFD9foEkg@mail.gmail.com>
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linaro.org:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C907387EE3
X-Rspamd-Action: no action

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B4=
1=E6=9C=8826=E6=97=A5=E5=91=A8=E4=B8=80 18:49=E5=86=99=E9=81=93=EF=BC=9A
>
> On 26/01/2026 12:29, Jun Nie wrote:
> > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=
=B9=B41=E6=9C=8826=E6=97=A5=E5=91=A8=E4=B8=80 18:13=E5=86=99=E9=81=93=EF=BC=
=9A
> >>
> >> On 26/01/2026 12:06, Jun Nie wrote:
> >>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=
=B9=B41=E6=9C=8822=E6=97=A5=E5=91=A8=E5=9B=9B 18:22=E5=86=99=E9=81=93=EF=BC=
=9A
> >>>>
> >>>> On Thu, Jan 22, 2026 at 02:03:25PM +0800, Jun Nie wrote:
> >>>>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=
=E5=B9=B41=E6=9C=8821=E6=97=A5=E5=91=A8=E4=B8=89 17:30=E5=86=99=E9=81=93=EF=
=BC=9A
> >>>>>>
> >>>>>> On Wed, Jan 21, 2026 at 04:01:51PM +0800, Jun Nie wrote:
> >>>>>>> Currently, plane splitting and SSPP allocation occur during the p=
lane
> >>>>>>> check phase. Defer these operations until dpu_assign_plane_resour=
ces()
> >>>>>>> is called from the CRTC side to ensure the topology information f=
rom
> >>>>>>> the CRTC check is available.
> >>>>>>
> >>>>>> Why is it important? What is broken otherwise?
> >>>>>
> >>>>> I see. Thanks! Will add below lines in next version.
> >>>>>
> >>>>> By default, the plane check occurs before the CRTC check.
> >>>>> Without topology information from the CRTC, plane splitting
> >>>>> cannot be properly executed. Consequently, the SSPP
> >>>>> engine starts without a valid memory address, which triggers
> >>>>> an IOMMU warning.
> >>>>
> >>>> What is plane splitting? Write commit message for somebody who doesn=
't
> >>>> exactly know what is going on.
> >>>
> >>> Thanks for the suggestion! Any more revise is needed?
> >>
> >> Sadly enough the text below is not a significant improvement.
> >>
> >>>
> >>> Currently, splitting plane into SSPP rectangles the allocation occur
> >>> during the plane check phase, so that a plane can be supported by
> >>> multiple hardware pipe.
> >>
> >> What does this mean? Without virtual planes in place, there are no
> >> multiple hardware pipes.
> >>
> >>> While pipe topology is decided in CRTC check.
> >>
> >> ?? What does it mean here?
> >>
> >>> By default, the plane check occurs before the CRTC check in DRM
> >>> framework. Without topology information from the CRTC, plane splittin=
g
> >>> cannot be properly executed.
> >>
> >> What does 'properly' mean here? How is it executed? What happens?
> >>
> >>> Consequently, the SSPP engine starts
> >>> without a valid memory address, which triggers IOMMU warning.
> >>
> >> IOMMU faults. There are no "warnings".
> >>
> >>>
> >>> Defer above plane operations until dpu_assign_plane_resources()
> >>> is called from the CRTC side to ensure the topology information from
> >>> the CRTC check is available.
> >>
> >>
> > Thanks for the patience!
> >
> >
> > Currently, splitting plane into SSPP rectangles and allocation occur
> > during the plane check phase. When virtual plane is enabled to support
> > quad-pipe topology later, 2 SSPPs with 4 rect will be needed, so that
> > a plane can be supported by 4 hardware pipes. And pipe number is
>
> number of pipes
>
> > decided in CRTC check per interface number, resolution and hardware
> > feature.
>
> Okay, but IOMMU errors were reported with virtual planes being disabled.
> So how is it relevant?

After revise of splitting plane into pipes, the number of pipes will be dec=
ided
by CRTC check for both virtual plane and non-virtual plane case to unify th=
e
plane handling,  instead of assumption of 2 pipes at most.
>
> >
> > By default, the plane check occurs before the CRTC check in DRM
> > framework. Without topology information from the CRTC, plane splitting
>
> WHat is plane splitting?

How about: s/plane splitting/splitting plane into pipes ?

>
> > will be skipped for the first time as pipe number is 0. Consequently,
> > the SSPP engine starts without a valid memory address, which triggers
> > IOMMU fault.
> >
> > Defer above plane related operations until dpu_assign_plane_resources()
> > is called from the CRTC side to ensure the topology information from
> > the CRTC check is available.
> >
> > Regards,
> > Jun
> >>
> >> --
> >> With best wishes
> >> Dmitry
>
>
> --
> With best wishes
> Dmitry
