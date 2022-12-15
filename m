Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C56E64DFA6
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 18:31:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D69D10E409;
	Thu, 15 Dec 2022 17:31:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D527F10E401;
 Thu, 15 Dec 2022 17:30:54 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-143ffc8c2b2so159131fac.2; 
 Thu, 15 Dec 2022 09:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LBYglHLeZPJlQ/c59d7S7j/ILPAtaoUZXSkNu4AjQqk=;
 b=o1tPEFg57Ajfz7POwUhqZPsNTvlo3Bs815L0LLV6cJzqO3p+D2rwnYFcn1sXwnZP4+
 I5Hui9j2ZsWhErLAF+C6vORkDYC+7BYOjtCP5yi/X5ACw62vkBuEmrxbpd+pTkIRbKrV
 puwnse4w+PPYsQwUdnczal/tX1eiNh8/JaKBDYSLEew0lVn8rHzV+X4hzv+0ZKRMbbLA
 JYyAVRkDDRcTpUWe6F4hIvMCzC1zNd89a8MuKawQrMwyVTUn9pyD+5vSojvKni3RHrxm
 CPO3t8HKtqZ8jGhpnhyEZ4ng2LsdOA32t+nC9Wzok9wTW4Or8ui9tj+1LTTUzdUEv7vo
 PWQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LBYglHLeZPJlQ/c59d7S7j/ILPAtaoUZXSkNu4AjQqk=;
 b=qnO9KfsbUyw6o15zZowNJXcGpYN0+McV/sg95MBH0VcSdRclm3voKB9SXoopNAO3g1
 cZJeZOQAJUBzCn7freA1wmOCbK/VaVVmSFEgUIBk2FrGXatw+FuIv49133hg+On4GRDl
 u7+yhh45HpQ9QynLWPWpoDOHJQc5NNZLuIOSFkeXmECTePi2Q5d72UEWDcHPL/2UX85v
 JJyp15xtKJqSIpaX3vNovfXQZDJvAM3T2aFFLtL3+j2BAlJQXLuex8XO3VSYMJnw48IO
 rKjiVypA39Jd9uaHGWTAKNA5WnMPp7UEI4X7IB/FXb5V4WKf0rxqwxPucV4pL0M6DQVs
 rDSQ==
X-Gm-Message-State: AFqh2kohhgWe8O8CAtP6MNUxCvsQvvUQ6HIvFqinuFLRoc8PPqQRV78A
 xeIsDC/1lOwYCTApxMayBgXP4pM9qqmDINbCExY=
X-Google-Smtp-Source: AMrXdXslPumyL68vwChsFlSTn4bge8AlJJ2Y9CiaNp/mn8hRJ8SlQhWsbiqXh3QMc7DV1fDgxWJW51DB7TSRPGLebbc=
X-Received: by 2002:a05:6870:4687:b0:143:8a81:116c with SMTP id
 a7-20020a056870468700b001438a81116cmr749551oap.96.1671125454019; Thu, 15 Dec
 2022 09:30:54 -0800 (PST)
MIME-Version: 1.0
References: <20221212182137.374625-1-harry.wentland@amd.com>
 <20221212182137.374625-17-harry.wentland@amd.com>
 <114c2e02-41c8-8576-f88d-1c50f41deb9e@mailbox.org>
 <20221214110128.1cd58dea@eldfell>
 <CADnq5_M8Z2QRze60AFtmF6jTw8zpTpM-MPPmgejoUCb7Rv1ZrA@mail.gmail.com>
 <57d2c440-a622-bcff-c3b5-e22404ef7eb6@mailbox.org>
In-Reply-To: <57d2c440-a622-bcff-c3b5-e22404ef7eb6@mailbox.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 15 Dec 2022 12:30:42 -0500
Message-ID: <CADnq5_OLLe6FSY6eL=o7Ws=6VzvX4e7eagJnMB+e7Bysyc0DiQ@mail.gmail.com>
Subject: Re: [PATCH 16/16] drm/amd/display: Don't restrict bpc to 8 bpc
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org,
 Pekka Paalanen <ppaalanen@gmail.com>, Uma Shankar <uma.shankar@intel.com>,
 amd-gfx@lists.freedesktop.org, Joshua Ashton <joshua@froggi.es>,
 Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 15, 2022 at 4:07 AM Michel D=C3=A4nzer
<michel.daenzer@mailbox.org> wrote:
>
> On 12/14/22 16:46, Alex Deucher wrote:
> > On Wed, Dec 14, 2022 at 4:01 AM Pekka Paalanen <ppaalanen@gmail.com> wr=
ote:
> >> On Tue, 13 Dec 2022 18:20:59 +0100
> >> Michel D=C3=A4nzer <michel.daenzer@mailbox.org> wrote:
> >>> On 12/12/22 19:21, Harry Wentland wrote:
> >>>> This will let us pass kms_hdr.bpc_switch.
> >>>>
> >>>> I don't see any good reasons why we still need to
> >>>> limit bpc to 8 bpc and doing so is problematic when
> >>>> we enable HDR.
> >>>>
> >>>> If I remember correctly there might have been some
> >>>> displays out there where the advertised link bandwidth
> >>>> was not large enough to drive the default timing at
> >>>> max bpc. This would leave to an atomic commit/check
> >>>> failure which should really be handled in compositors
> >>>> with some sort of fallback mechanism.
> >>>>
> >>>> If this somehow turns out to still be an issue I
> >>>> suggest we add a module parameter to allow users to
> >>>> limit the max_bpc to a desired value.
> >>>
> >>> While leaving the fallback for user space to handle makes some sense
> >>> in theory, in practice most KMS display servers likely won't handle
> >>> it.
> >>>
> >>> Another issue is that if mode validation is based on the maximum bpc
> >>> value, it may reject modes which would work with lower bpc.
> >>>
> >>>
> >>> What Ville (CC'd) suggested before instead (and what i915 seems to be
> >>> doing already) is that the driver should do mode validation based on
> >>> the *minimum* bpc, and automatically make the effective bpc lower
> >>> than the maximum as needed to make the rest of the atomic state work.
> >>
> >> A driver is always allowed to choose a bpc lower than max_bpc, so it
> >> very well should do so when necessary due to *known* hardware etc.
> >> limitations.
> >>
> >
> > In the amdgpu case, it's more of a preference thing.  The driver would
> > enable higher bpcs at the expense of refresh rate and it seemed most
> > users want higher refresh rates than higher bpc.
>
> I wrote the above because I thought that this patch might result in some =
modes getting pruned because they can't work with the max bpc. However, I s=
ee now that cbd14ae7ea93 ("drm/amd/display: Fix incorrectly pruned modes wi=
th deep color") should prevent that AFAICT.
>

Yeah, maybe that has been fixed now.  IIRC, the max bpc hack was added
a long time ago.

Alex

> The question then is: What happens if user space tries to use a mode whic=
h doesn't work with the max bpc? Does the driver automatically lower the ef=
fective bpc as needed, or does the atomic commit (check) fail? The latter w=
ould seem bad.
>
>
> > I guess the driver can select a lower bpc at its discretion to produce
> > what it thinks is the best default, but what about users that don't wan=
t
> > the default?
>
> They can choose the lower refresh rate?
>
>
> --
> Earthling Michel D=C3=A4nzer            |                  https://redhat=
.com
> Libre software enthusiast          |         Mesa and Xwayland developer
>
