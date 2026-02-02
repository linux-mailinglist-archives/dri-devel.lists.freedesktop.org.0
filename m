Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Ki0mHhRPgGkF6QIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 08:15:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8587C91CE
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 08:15:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3B8910E170;
	Mon,  2 Feb 2026 07:15:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="E6L7tcrp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com
 [74.125.224.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 164C910E170
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 07:15:27 +0000 (UTC)
Received: by mail-yx1-f46.google.com with SMTP id
 956f58d0204a3-649bff225d4so661428d50.2
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Feb 2026 23:15:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770016526; cv=none;
 d=google.com; s=arc-20240605;
 b=czSGZ64WitD2FHbGKuR6YBIWaouvQW/fRgFKC4Ozj65UjrTsVbSkUEDzNee6LfQ9x4
 +Htj9pBg3iB9X8xlWLjvnyaSpGnUHGKXp1YPwjOLgZe+ABgYq3J1o+oy2Cf/JovUKwhM
 4v+sjbJcvjGQMd7CVLBQhIEIM0v8sGCGA2p9plnJYzmnszT+bw5XSvCvArcvWgIP8N0b
 nHQ7n/oOsVCHpxmIt3ASiCOqQBKzFOdlMj/AE3dpQP8PJGCpHAIOQ81+nu0Tuhi4yMD5
 T9OYAhs+/ADWb6StNAJllLKd7YIuh3Pkvd4bK9MeunVNky538UsR/E6MNkoEC1aqnxDj
 IslQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=AOhIjuxpp6TSu7OUXd09SI4wwYt5TFMCJ2RUNnmG8u4=;
 fh=ng+1Zg/Q4DToZbFzipmB3yuJ6faByKwG/lJAmDy7288=;
 b=lt3I1A98UiNoGCyObqx85NO5alr+gE6lmTlaMNaQ6gSox9jOAOEgGpM5Bru7iyqyOr
 v0Oh3aH6wSnVUvM1maoLm5zWr5sc0t4O5+Cv8AbOIYdwIpxW71fwfdk32Jstpa3gDt6K
 SWDmr/+VmTU0iDMJFM3DJt+c/I4TaHq/NUczFR7NgpnW90aob52Ch5ivSBN95pp3KlCj
 IVFDB6IoX0yk2/QUcoLEFmdPByu8NkbsHR2UTFX+YkKLwsGsqCmllIvvTypLo8J49MxL
 4khdQWahfvvVe+sj3XjSF1JxDI/CxqLkgCUQDkbosDhjcWw8DCeZmRb5P200FO8/g0AJ
 5hsw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770016526; x=1770621326; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AOhIjuxpp6TSu7OUXd09SI4wwYt5TFMCJ2RUNnmG8u4=;
 b=E6L7tcrpSSR4h6mNihUxpIVDLDTngM8B8mlF3fwd9eOGuLNcozqg1Gexi1febiUplI
 I/Mj5pHy2SneIIsxTmRm1D5HAVFh/D8QPVdmVZt7XVwtyD5QTXNW1OqLZb9hPhsEpKpU
 nTAzuZT6wrt3hkUWixj8dMJId+Nk9VAwsIG/7xW151JnB1TGz0Lg2i9RTpKkwrYAgyT3
 3b5gcQVCxR2TdBNS1QYZpDvxO1JPX+A/9/F5aPsPk1DqDyVc0E+50vh9JCGqDso3cXFJ
 CJwBdV6/Tr/0yC/40sAyzYewjFtHyGHXKjwRgwtrLgFjX9j2/3dCg/KNelc/fgoZPUr0
 ALDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770016526; x=1770621326;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AOhIjuxpp6TSu7OUXd09SI4wwYt5TFMCJ2RUNnmG8u4=;
 b=fF8IOpu9+g9ese0krkDX8wKjvZ49nj+iqxyqZAHZ9wlFxZzvtlcJaeg7pkeCnhiVZj
 ypv47FXadhs0vNf6nLfNHXLdOsSxdY56LfzKvGXQYApGS6LSxLexNgsmN3qrH3AbAdqH
 prnsqO2XyUU3ma4aRZ57PsOYR9+/nEWfAW+4gd2aWeohwnGrkV53DYd/lVUKWbYkDzCH
 tHsLlSrjZF4GDlGEsWsveE/ggZ/6PzZr1OqfiJieyXRb9JVlbmTI77R3e9+Od4Y6cgJe
 n9V1MVGzPgVKWjRKYHqTQeytbmbYdifDqH9iGfNjmi0LBIKiKCQKQkARW56eSw2E5PLV
 iCdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjKdC4oNklUE0T4gMIjFdSxEBiW6V0rgqEvhPkfMlvVbxUU6njVnIE98ijrflrsz1yqgdD+WAiuZQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwV3mVA6SJjbGqN4ZFvw9GU1ZMwUR2sdn2uUfKbKCArvC3KOlDN
 TdkT/8KR3OWZYNI+A1TOpgJ67wPqOZcGGwSZGb1/p/+C+T6FkKqH7iXX77oa5axigmc8udapFj/
 Nbwa8tao4VpVfzrTk4z26IEYgau69tCU//Ssr/55eWA==
X-Gm-Gg: AZuq6aIj4jSkKBLBBb0jr5EXNyNtRXylfaAT8WcFBCKhQCr29k52X8jN/1ZntlwaAKN
 H8xsMMwrrIgES0UcBFWFgUtKWvOkqI6czNxsWwldHaVP8fMrTZvvRP8LwBCd41RH810xXp62YXG
 xpORfokJg/4ULUWjPsET90doYj8UiFc8d7BebkT0LQLfCFnqi7ZzOPsT+qu5ueLVoHNeiLMKgHn
 +dA4HHBkRbxvgqsrCgnJfnavx4xYyX6BKatUaq0A+xMsk8GgFaXdTUu+McadW/+DnKlNDVYFL7F
 g2c=
X-Received: by 2002:a05:690e:1347:b0:649:b002:2553 with SMTP id
 956f58d0204a3-649b0022aaamr6055975d50.79.1770016525726; Sun, 01 Feb 2026
 23:15:25 -0800 (PST)
MIME-Version: 1.0
References: <6kzd2g4hgffqz5ipaqbourgiefuxxh3njj44n35blo37z6hhhj@us7lzlgmjuld>
 <CABymUCMf8LxX6VWUuzNJP+G1y3Xi5-CVYhaqLR7F=kU6ZgdcgA@mail.gmail.com>
 <c56e4ylgwcqni23btaxegdbfg3tbkyp2vtjtboeb3kbvcfk27u@vrlh276djtfr>
 <CABymUCP6ZDGtEJeQSZ48x8TZyJ4gKVDC+JzJRz-tZ0ksCUCqsA@mail.gmail.com>
 <91d590de-fa00-4df3-923f-b49ad00cd9da@oss.qualcomm.com>
 <CABymUCOqxtYS7BaDMHeN2npn=4+Y-6kxLDOS6oskiiH58epR5w@mail.gmail.com>
 <bbd8e584-4398-40da-9759-0c27f34214d3@oss.qualcomm.com>
 <CABymUCMivNJt4fikx8XJ8KFZB-y4zc2RaqjBksxWrQFD9foEkg@mail.gmail.com>
 <7c3yxfkadtkd6xs6aiupcamykx75c2tieakc7n4a2jyymz6kzz@4gflcto2nbkj>
 <CABymUCMeS7cWgEProyWnMUJ1fF1rfba3dy4VB0mwTmPbpTvanA@mail.gmail.com>
 <g2kzzrfmcsmzs6wz7alzjjycytpuebxwbehkco7yimdg2jam5a@uqsrt7mov7la>
In-Reply-To: <g2kzzrfmcsmzs6wz7alzjjycytpuebxwbehkco7yimdg2jam5a@uqsrt7mov7la>
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 2 Feb 2026 15:15:14 +0800
X-Gm-Features: AZwV_QgxNMYnRxQupdZOrh2Yv4jbFQ5rsdru-fR7eVF3kXxCsbW0Ix_tK3sAtyQ
Message-ID: <CABymUCOmq_FVOQRVQSz97wjF_gtdji4dXz0CucChvFyqmyw06w@mail.gmail.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: B8587C91CE
X-Rspamd-Action: no action

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B4=
1=E6=9C=8827=E6=97=A5=E5=91=A8=E4=BA=8C 03:06=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Jan 26, 2026 at 09:29:44PM +0800, Jun Nie wrote:
> > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=
=B9=B41=E6=9C=8826=E6=97=A5=E5=91=A8=E4=B8=80 20:31=E5=86=99=E9=81=93=EF=BC=
=9A
> > >
> > > On Mon, Jan 26, 2026 at 08:01:00PM +0800, Jun Nie wrote:
> > > > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=
=E5=B9=B41=E6=9C=8826=E6=97=A5=E5=91=A8=E4=B8=80 18:49=E5=86=99=E9=81=93=EF=
=BC=9A
> > > > >
> > > > > On 26/01/2026 12:29, Jun Nie wrote:
> > > > > > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2=
026=E5=B9=B41=E6=9C=8826=E6=97=A5=E5=91=A8=E4=B8=80 18:13=E5=86=99=E9=81=93=
=EF=BC=9A
> > > > > >>
> > > > > >> On 26/01/2026 12:06, Jun Nie wrote:
> > > > > >>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=
=8E2026=E5=B9=B41=E6=9C=8822=E6=97=A5=E5=91=A8=E5=9B=9B 18:22=E5=86=99=E9=
=81=93=EF=BC=9A
> > > > > >>>>
> > > > > >>>> On Thu, Jan 22, 2026 at 02:03:25PM +0800, Jun Nie wrote:
> > > > > >>>>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=
=8E2026=E5=B9=B41=E6=9C=8821=E6=97=A5=E5=91=A8=E4=B8=89 17:30=E5=86=99=E9=
=81=93=EF=BC=9A
> > > > > >>>>>>
> > > > > >>>>>> On Wed, Jan 21, 2026 at 04:01:51PM +0800, Jun Nie wrote:
> > > > > >>>>>>> Currently, plane splitting and SSPP allocation occur duri=
ng the plane
> > > > > >>>>>>> check phase. Defer these operations until dpu_assign_plan=
e_resources()
> > > > > >>>>>>> is called from the CRTC side to ensure the topology infor=
mation from
> > > > > >>>>>>> the CRTC check is available.
> > > > > >>>>>>
> > > > > >>>>>> Why is it important? What is broken otherwise?
> > > > > >>>>>
> > > > > >>>>> I see. Thanks! Will add below lines in next version.
> > > > > >>>>>
> > > > > >>>>> By default, the plane check occurs before the CRTC check.
> > > > > >>>>> Without topology information from the CRTC, plane splitting
> > > > > >>>>> cannot be properly executed. Consequently, the SSPP
> > > > > >>>>> engine starts without a valid memory address, which trigger=
s
> > > > > >>>>> an IOMMU warning.
> > > > > >>>>
> > > > > >>>> What is plane splitting? Write commit message for somebody w=
ho doesn't
> > > > > >>>> exactly know what is going on.
> > > > > >>>
> > > > > >>> Thanks for the suggestion! Any more revise is needed?
> > > > > >>
> > > > > >> Sadly enough the text below is not a significant improvement.
> > > > > >>
> > > > > >>>
> > > > > >>> Currently, splitting plane into SSPP rectangles the allocatio=
n occur
> > > > > >>> during the plane check phase, so that a plane can be supporte=
d by
> > > > > >>> multiple hardware pipe.
> > > > > >>
> > > > > >> What does this mean? Without virtual planes in place, there ar=
e no
> > > > > >> multiple hardware pipes.
> > > > > >>
> > > > > >>> While pipe topology is decided in CRTC check.
> > > > > >>
> > > > > >> ?? What does it mean here?
> > > > > >>
> > > > > >>> By default, the plane check occurs before the CRTC check in D=
RM
> > > > > >>> framework. Without topology information from the CRTC, plane =
splitting
> > > > > >>> cannot be properly executed.
> > > > > >>
> > > > > >> What does 'properly' mean here? How is it executed? What happe=
ns?
> > > > > >>
> > > > > >>> Consequently, the SSPP engine starts
> > > > > >>> without a valid memory address, which triggers IOMMU warning.
> > > > > >>
> > > > > >> IOMMU faults. There are no "warnings".
> > > > > >>
> > > > > >>>
> > > > > >>> Defer above plane operations until dpu_assign_plane_resources=
()
> > > > > >>> is called from the CRTC side to ensure the topology informati=
on from
> > > > > >>> the CRTC check is available.
> > > > > >>
> > > > > >>
> > > > > > Thanks for the patience!
> > > > > >
> > > > > >
> > > > > > Currently, splitting plane into SSPP rectangles and allocation =
occur
> > > > > > during the plane check phase. When virtual plane is enabled to =
support
> > > > > > quad-pipe topology later, 2 SSPPs with 4 rect will be needed, s=
o that
> > > > > > a plane can be supported by 4 hardware pipes. And pipe number i=
s
> > > > >
> > > > > number of pipes
> > > > >
> > > > > > decided in CRTC check per interface number, resolution and hard=
ware
> > > > > > feature.
> > > > >
> > > > > Okay, but IOMMU errors were reported with virtual planes being di=
sabled.
> > > > > So how is it relevant?
> > > >
> > > > After revise of splitting plane into pipes, the number of pipes wil=
l be decided
> > > > by CRTC check for both virtual plane and non-virtual plane case to =
unify the
> > > > plane handling,  instead of assumption of 2 pipes at most.
> > >
> > > This needs to be explicitly written.
> > >
> > > > >
> > > > > >
> > > > > > By default, the plane check occurs before the CRTC check in DRM
> > > > > > framework. Without topology information from the CRTC, plane sp=
litting
> > > > >
> > > > > WHat is plane splitting?
> > > >
> > > > How about: s/plane splitting/splitting plane into pipes ?
> > >
> > > This plane is not being split into anything. It's being mapped onto h=
w
> > > pipes. But before that, the number of necessary hw pipes is being det=
ermined
> > > based on foo, bar an baz,
> >
> > Thanks for the correction!
> >
> > Currently, plane is mapped onto at most 2 hardware pipes and 1 SSPP
> > allocation occur during the plane check phase. When virtual plane is
> > enabled to support quad-pipe topology later, 2 SSPPs with 4 rect will
> > be needed, so that a plane can be supported by 4 hardware pipes.
> >
> > After revise of quad-pipe, the number of pipes is decided in CRTC
> > check per number of interfaces, resolution, clock rate constrain,
>
> Where?

The pipe is decided in dpu_crtc_get_topology(). Change to quad-pipe
 is made in later patch. So I drop this in this patch message below.
>
> > hardware feature and virtual plane enablement. The decidsion of
>
> decision
>
> > number of pipes will happen in CRTC check for both virtual plane and
> > non-virtual plane case to unify the plane handling. Before that, the
>
> will? Do you mean, after this patch? If so, please use imperative
> language. See Documentation/process/submitting-patches.rst

Yes, it is in later patch. So drop it in this patch message.

It is possible to keep plane check unchanged, and rely on re-allocation
in later stage to support quad-pipe, if quad-pipe use case is detected.
But to unify the allocation logic for both non-virtual and virtual plane
use cases, and to centralize resource management, we'd better defer
the allocation.


>
> > the number of necessary hw pipes is being determined based on
> > resolution and clock rate constrain.
> >
> > By default, the plane check occurs before the CRTC check in DRM
> > framework. Without topology information from the CRTC, plane mapping
> > will be skipped for the first time as number of pipe is 0.
> > Consequently, the SSPP engine starts without a valid memory address,
> > which triggers IOMMU fault.
> >
> > Defer above plane related operations until dpu_assign_plane_resources()
> > is called from the CRTC side to ensure the topology information from
> > the CRTC check is available.
> >
> > >
> > > >
> > > > >
> > > > > > will be skipped for the first time as pipe number is 0. Consequ=
ently,
> > > > > > the SSPP engine starts without a valid memory address, which tr=
iggers
> > > > > > IOMMU fault.
> > > > > >
> > > > > > Defer above plane related operations until dpu_assign_plane_res=
ources()
> > > > > > is called from the CRTC side to ensure the topology information=
 from
> > > > > > the CRTC check is available.
>
How about this commit message? It is more coherent with the change
in this patch.


Currently, a plane maps to at most two hardware pipes, and SSPP
allocation occurs during the plane check phase. However, when virtual
planes are enabled, SSPP re-allocation can occur within
dpu_assign_plane_resources() during the CRTC check.

To support future quad-pipe topologies, which require allocating two
SSPPs with four rectangles by default, it is more efficient to perform
the primary allocation in a single pass rather than relying on later
re-allocations. So defer the allocation to CRTC check phase by default.
Allocation logic for both non-virtual and virtual plane use cases is
unified in this way.

> --
> With best wishes
> Dmitry
