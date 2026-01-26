Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBDPJFlsd2nCfQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 14:30:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8B188D5E
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 14:30:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D2AE10E418;
	Mon, 26 Jan 2026 13:29:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CfBPjVFw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB3F410E418
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 13:29:57 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-78fc3572431so43092277b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 05:29:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769434196; cv=none;
 d=google.com; s=arc-20240605;
 b=kTfwM1eJGGr9wdwEKSvmr2R4XwA8sx/dwC3WVu54+WIaf6Sr1D2y38R8DcsSjRHsau
 huxmeGG33gwnPYavTQjEXypxv/P85FtGrVZPcsPqa/noFaRJNzQkUdfddBQeu2e+XpnN
 2dnLH/UVcQd/uFhCNlqHpQ8fm44XphMWcqPfU9P1WNNyi//iH4R2+E6Br2ETs9AMsz9T
 PNXrqhuhwcc/BxdOK98SfDRU+iwtiFjaxfIbcaTRNaaY/RtOJ8xz30mPk9TuoRSgqoCL
 pWaR5KYm9UU1lgkX249CHQy4G5enaVyiOoj2g+u5leoE7MsaTAFbOOtu7hrVYrgLzAaW
 JG5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ajOlSiOtNMWfjsoQse/ifbqmB3q8/dPWLyWb9EMEP9E=;
 fh=oCRyJewTfWWqzsbgfG6fNBtWWW9XqXQXpjNB0YAHtPE=;
 b=Y1x4oHxiqX9LaW4pogdjeWEZ9NaYD0a3lnPm7vdTcizifr2plDOeuhliJY+V3xgE7T
 O16aNJcLmuiURitpf9A3HGBFqwhFCNL8pyo/EqQRLc8NNtUJstz2ggpmhtcvurb5nsYB
 6fKcjL/W706HlMNDVAPqLZbEMVyIs1GS9G9X9n8Gt8JPU13n7J9T+QClmB7iu9MWgBqX
 JQPkyMnU6ialYEJpEelvH8o1Gdsz52HbiLV2fB1HOnoB7YRC6zUoD6R/AnlqkN6ZGZL1
 40ZBMP48fZt1Xfz1GYR4t0wzs0EXnlrg3VzhP2jfU/dWgzx9LO6XZ4l2chZqtbc2oDTi
 z6vw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769434196; x=1770038996; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ajOlSiOtNMWfjsoQse/ifbqmB3q8/dPWLyWb9EMEP9E=;
 b=CfBPjVFw4F2p6tW2XFfqk31RrXuvg3dQDz8vs85QHqYl00EmZBYhoMmVxtRC0sSXQ1
 3qP3eK9e+buXO+krpGAdoDmHB1k81KPGKoY2XfOwDVdItd465R2gOhAi2wWrtH0QwfQu
 MRl5ugOVuCuTe+Zeya5TafDGeEfhnLOUpBoctB4UwQniQ348TwLR7BhfHVxkVkD2lwlX
 ths3LSZCsL+bfldT8QvmIMW41LRKv88oOqf1RLxOlM1gitekqAdOUYG0QuQrzb+7kOe7
 mkGWB4tBpbf80Lkj1pFuDOJHjXPsxUDniLQ+rU0Xiu7IhsNn7TrZ9MdyNVq5zNd0Ede/
 1stg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769434196; x=1770038996;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ajOlSiOtNMWfjsoQse/ifbqmB3q8/dPWLyWb9EMEP9E=;
 b=Wrf7+CPWpyzXMau2riXl71GHoTnAxiFTo/aqy7YA6oJsORijoHps9yB3u8zaRq5Rqx
 E9Qr14amyCS8xqvlgwuzww2/CfeQh4SAQ+l5HqAWseBNbAvoaeDai1WHOe8D2/Ys42eA
 fkqlDnmC4K/Qg7qjc33ha5FTqj94IZSdPxFUK7jdr/XW0N0qENHWZmbmQMdWaHUKinei
 pAmbXh6TmHxmhVWYMYikfjXL2TkGswfCaBtBl0PHqJohQ5Sa32sNAI3IDyU02xaubkYZ
 1uujFbP9CegoQs0/81pxVCaFd6ozQxgGpPNJZw9Jw8+OgEJWXCcGMxdIIKkmoGiZXTFx
 4J5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWq+g3LsW/J18ceQYXDoIVRC19+t4uefX2VwbCJ2rng0MOoQ1NQeXJwndUw8c6hzu9VbG4mVvYy8kE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBHp5aak3oWLvuEpaHSf2xt5Rtn00tTNtT+4UgiS8zYORSOQAW
 RodfKPwAdcP2O93hki1JVHYUiGHDXFwYJ+XuPdIPL53r5e/xDAIJlso39TvaJpAjpYObb8VQtpu
 op5E2G6I9Ek8RATKE8VdprFFWEeODCUgtrHTOags00Q==
X-Gm-Gg: AZuq6aIwrCJNHgGCfcpgwF0/2Xc3fLd4t098ujuiQ7vOYlbMTOT0zwI/vWc8a9h7xVT
 tOApNGZi62gE3CEw7YQhK8oE5nhhRxBQKRUQB7HY8QbXMf8kfXNvyxAgEoekA/kmhY23pOETUK3
 1zUJzxJnJUX246ceHIh9WfemSfKP4mVKYEsbpmbRwg5ysT3qJClAmDIbz4akAc86Y1loIQ4bybJ
 bM9VbxNjdZTZDnCMbXdMzojME6pZjufPoxWzddkU+VBL6gt2oguh9+63SiQUFiWqHiy6yLBb/SS
 2E5Zthl2n7kLMvBP
X-Received: by 2002:a53:ac89:0:b0:649:6074:9d3c with SMTP id
 956f58d0204a3-64970c9fdf9mr3532659d50.54.1769434196536; Mon, 26 Jan 2026
 05:29:56 -0800 (PST)
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
 <CABymUCMivNJt4fikx8XJ8KFZB-y4zc2RaqjBksxWrQFD9foEkg@mail.gmail.com>
 <7c3yxfkadtkd6xs6aiupcamykx75c2tieakc7n4a2jyymz6kzz@4gflcto2nbkj>
In-Reply-To: <7c3yxfkadtkd6xs6aiupcamykx75c2tieakc7n4a2jyymz6kzz@4gflcto2nbkj>
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 26 Jan 2026 21:29:44 +0800
X-Gm-Features: AZwV_QhrhzX3QFcHeAIEwxeWZf4Y6oIwMBcL2-B9HiItZYabjyPzZqC41KwRdrs
Message-ID: <CABymUCMeS7cWgEProyWnMUJ1fF1rfba3dy4VB0mwTmPbpTvanA@mail.gmail.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 3B8B188D5E
X-Rspamd-Action: no action

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B4=
1=E6=9C=8826=E6=97=A5=E5=91=A8=E4=B8=80 20:31=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Jan 26, 2026 at 08:01:00PM +0800, Jun Nie wrote:
> > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=
=B9=B41=E6=9C=8826=E6=97=A5=E5=91=A8=E4=B8=80 18:49=E5=86=99=E9=81=93=EF=BC=
=9A
> > >
> > > On 26/01/2026 12:29, Jun Nie wrote:
> > > > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=
=E5=B9=B41=E6=9C=8826=E6=97=A5=E5=91=A8=E4=B8=80 18:13=E5=86=99=E9=81=93=EF=
=BC=9A
> > > >>
> > > >> On 26/01/2026 12:06, Jun Nie wrote:
> > > >>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E202=
6=E5=B9=B41=E6=9C=8822=E6=97=A5=E5=91=A8=E5=9B=9B 18:22=E5=86=99=E9=81=93=
=EF=BC=9A
> > > >>>>
> > > >>>> On Thu, Jan 22, 2026 at 02:03:25PM +0800, Jun Nie wrote:
> > > >>>>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2=
026=E5=B9=B41=E6=9C=8821=E6=97=A5=E5=91=A8=E4=B8=89 17:30=E5=86=99=E9=81=93=
=EF=BC=9A
> > > >>>>>>
> > > >>>>>> On Wed, Jan 21, 2026 at 04:01:51PM +0800, Jun Nie wrote:
> > > >>>>>>> Currently, plane splitting and SSPP allocation occur during t=
he plane
> > > >>>>>>> check phase. Defer these operations until dpu_assign_plane_re=
sources()
> > > >>>>>>> is called from the CRTC side to ensure the topology informati=
on from
> > > >>>>>>> the CRTC check is available.
> > > >>>>>>
> > > >>>>>> Why is it important? What is broken otherwise?
> > > >>>>>
> > > >>>>> I see. Thanks! Will add below lines in next version.
> > > >>>>>
> > > >>>>> By default, the plane check occurs before the CRTC check.
> > > >>>>> Without topology information from the CRTC, plane splitting
> > > >>>>> cannot be properly executed. Consequently, the SSPP
> > > >>>>> engine starts without a valid memory address, which triggers
> > > >>>>> an IOMMU warning.
> > > >>>>
> > > >>>> What is plane splitting? Write commit message for somebody who d=
oesn't
> > > >>>> exactly know what is going on.
> > > >>>
> > > >>> Thanks for the suggestion! Any more revise is needed?
> > > >>
> > > >> Sadly enough the text below is not a significant improvement.
> > > >>
> > > >>>
> > > >>> Currently, splitting plane into SSPP rectangles the allocation oc=
cur
> > > >>> during the plane check phase, so that a plane can be supported by
> > > >>> multiple hardware pipe.
> > > >>
> > > >> What does this mean? Without virtual planes in place, there are no
> > > >> multiple hardware pipes.
> > > >>
> > > >>> While pipe topology is decided in CRTC check.
> > > >>
> > > >> ?? What does it mean here?
> > > >>
> > > >>> By default, the plane check occurs before the CRTC check in DRM
> > > >>> framework. Without topology information from the CRTC, plane spli=
tting
> > > >>> cannot be properly executed.
> > > >>
> > > >> What does 'properly' mean here? How is it executed? What happens?
> > > >>
> > > >>> Consequently, the SSPP engine starts
> > > >>> without a valid memory address, which triggers IOMMU warning.
> > > >>
> > > >> IOMMU faults. There are no "warnings".
> > > >>
> > > >>>
> > > >>> Defer above plane operations until dpu_assign_plane_resources()
> > > >>> is called from the CRTC side to ensure the topology information f=
rom
> > > >>> the CRTC check is available.
> > > >>
> > > >>
> > > > Thanks for the patience!
> > > >
> > > >
> > > > Currently, splitting plane into SSPP rectangles and allocation occu=
r
> > > > during the plane check phase. When virtual plane is enabled to supp=
ort
> > > > quad-pipe topology later, 2 SSPPs with 4 rect will be needed, so th=
at
> > > > a plane can be supported by 4 hardware pipes. And pipe number is
> > >
> > > number of pipes
> > >
> > > > decided in CRTC check per interface number, resolution and hardware
> > > > feature.
> > >
> > > Okay, but IOMMU errors were reported with virtual planes being disabl=
ed.
> > > So how is it relevant?
> >
> > After revise of splitting plane into pipes, the number of pipes will be=
 decided
> > by CRTC check for both virtual plane and non-virtual plane case to unif=
y the
> > plane handling,  instead of assumption of 2 pipes at most.
>
> This needs to be explicitly written.
>
> > >
> > > >
> > > > By default, the plane check occurs before the CRTC check in DRM
> > > > framework. Without topology information from the CRTC, plane splitt=
ing
> > >
> > > WHat is plane splitting?
> >
> > How about: s/plane splitting/splitting plane into pipes ?
>
> This plane is not being split into anything. It's being mapped onto hw
> pipes. But before that, the number of necessary hw pipes is being determi=
ned
> based on foo, bar an baz,

Thanks for the correction!

Currently, plane is mapped onto at most 2 hardware pipes and 1 SSPP
allocation occur during the plane check phase. When virtual plane is
enabled to support quad-pipe topology later, 2 SSPPs with 4 rect will
be needed, so that a plane can be supported by 4 hardware pipes.

After revise of quad-pipe, the number of pipes is decided in CRTC
check per number of interfaces, resolution, clock rate constrain,
hardware feature and virtual plane enablement. The decidsion of
number of pipes will happen in CRTC check for both virtual plane and
non-virtual plane case to unify the plane handling. Before that, the
the number of necessary hw pipes is being determined based on
resolution and clock rate constrain.

By default, the plane check occurs before the CRTC check in DRM
framework. Without topology information from the CRTC, plane mapping
will be skipped for the first time as number of pipe is 0.
Consequently, the SSPP engine starts without a valid memory address,
which triggers IOMMU fault.

Defer above plane related operations until dpu_assign_plane_resources()
is called from the CRTC side to ensure the topology information from
the CRTC check is available.

>
> >
> > >
> > > > will be skipped for the first time as pipe number is 0. Consequentl=
y,
> > > > the SSPP engine starts without a valid memory address, which trigge=
rs
> > > > IOMMU fault.
> > > >
> > > > Defer above plane related operations until dpu_assign_plane_resourc=
es()
> > > > is called from the CRTC side to ensure the topology information fro=
m
> > > > the CRTC check is available.
> > > >
> > > > Regards,
> > > > Jun
> > > >>
> > > >> --
> > > >> With best wishes
> > > >> Dmitry
> > >
> > >
> > > --
> > > With best wishes
> > > Dmitry
>
> --
> With best wishes
> Dmitry
