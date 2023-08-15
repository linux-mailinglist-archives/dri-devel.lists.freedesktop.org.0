Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5D577D3BE
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 21:59:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB4F410E28C;
	Tue, 15 Aug 2023 19:59:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECB4610E28C
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Aug 2023 19:59:20 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5256d74dab9so2556635a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Aug 2023 12:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692129559; x=1692734359;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dS3682mu41R84swNF5+hT9srqojwp9Qst5EvX4qVzLE=;
 b=s5olbKVdhKlvi640Pu+d6Uo1NM7DWFOxBE/fc/1wRI2KzhtFAeaikb4tld/eZCIIWG
 cLKDfsThY6LfoU2wsFcKVbBUU3Fc48mLb2Hw2WsJkPDxM7DpgGLuEMJ53t0K3k3oA8WU
 H8MNM9Lcq1PrqlewzhhZ5n9jFgATLuKJe9rJ+kE/giOW+OY6D/4bNn1wFGIDvZNUxE5n
 TzxM2SDt5JSUtM8cRfielD6Qfrkuz9+2TLSm4U+rf3CZorXZTgn5jBeg67aTu5zR+Z8W
 IAKiYzEtDaO3EtnE6AzTvSZMe5hNJzq9CJyjIHQe5pS/4tI8/b+EpkVRUZFsaRydjX0w
 sEOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692129559; x=1692734359;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dS3682mu41R84swNF5+hT9srqojwp9Qst5EvX4qVzLE=;
 b=L+6RTAfETx1NQcB0NLtIdnxXyDDl6op2OQMrlO9F6eL+VZwFyFJqkFd75ZZCpqmpct
 VoCJbcxzn2MwbkvhQ+OH6wekUJteFL/0mV6rmVZIoyPzZIKfRWjmHP6VhsqgagyR+rZm
 aWv56pMFCZe7J6D5oomWcsxYWNO19rMoL3jUQ9/KpaWRIFg1OeJTaV9Su//NUaB5a2zZ
 DRdWlpY9zTPxrKJ/OVOALIA0kCOhPNz6YABCBluxrIbPSa5Sj3N9R1F96WCmipIPTkvm
 LG8NoNXIoESqpSQ1PCBgro4VgfLNrCsIZN/oAH9Ye8EDqToVw1Meu9c0ZJQd9uLmj+ST
 NmHg==
X-Gm-Message-State: AOJu0YzV83F5R//hcbrVkS5h+FM2G6LAqnlW09qDQUez+wYSmQV4ecZC
 RyvRzuQ8xVxPa06SJocMEHj99+eZHboHeq81m8s=
X-Google-Smtp-Source: AGHT+IHHb56ttVQa6Oqj7RSVogcURFidJJbohelPmCf3855K7tcoy0NXMphXT9xQQGdX0OkVXYeV1e60uBdxWZTqyhA=
X-Received: by 2002:a05:6402:447:b0:523:bb8a:8dca with SMTP id
 p7-20020a056402044700b00523bb8a8dcamr11369118edw.16.1692129559165; Tue, 15
 Aug 2023 12:59:19 -0700 (PDT)
MIME-Version: 1.0
References: <389b-64db6700-1-3dc04b80@31442286>
 <b278375f-4644-2db6-9a14-9088470d528c@suse.de>
 <CAKMK7uF1hv3S--=jsmFWG_tkOKavgMBOkWQt6VOSV0d1U7C0VA@mail.gmail.com>
 <1b9ea227-b068-9d91-1036-28a4161b1744@suse.de>
 <CAF6AEGsr+2xaCeExm9wPmK=nU+jxevLcd8RDWTSFrwKR-yCvZg@mail.gmail.com>
 <CAPM=9tx16UoYoOw4hBChVNPcj57ox1XsybPPTGZn=r2DDQBJmw@mail.gmail.com>
In-Reply-To: <CAPM=9tx16UoYoOw4hBChVNPcj57ox1XsybPPTGZn=r2DDQBJmw@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 15 Aug 2023 12:59:07 -0700
Message-ID: <CAF6AEGu8mRB_wiFeWx17Z12Eu+NnP6VLFBr5sypcnxjQyj7_sQ@mail.gmail.com>
Subject: Re: [PULL for v6.6] drm-misc-next
To: Dave Airlie <airlied@gmail.com>
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
Cc: emma@anholt.net, daniels@collabora.com, robdclark@google.com,
 david.heidelberg@collabora.com, Daniel Vetter <daniel.vetter@ffwll.ch>,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 linux-kernel@vger.kernel.org, robclark@freedesktop.org,
 gustavo.padovan@collabora.com,
 Helen Mae Koike Fornazier <helen.koike@collabora.com>, anholt@google.com,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 15, 2023 at 12:23=E2=80=AFPM Dave Airlie <airlied@gmail.com> wr=
ote:
>
> > > Otherwise, there should be something like a drm-ci tree, from which y=
ou
> > > can fetch the changes directly.
> >
> > I asked for a pull request so that I could also merge it to msm-next
> > so that I can do CI this cycle.  (Unlike the earlier out-of-tree
> > version of the drm/ci yml, this version needs to be in the branch that
> > CI runs on, so I can't use the workaround that I had in previous
> > cycles.)
> >
> > Perhaps it should be a pull request targeting drm-next instead of drm-m=
isc-next.
> >
> > We were going to do this one-off for this cycle and then evaluate
> > going forward whether a drm-ci-next tree is needed.  But perhaps it is
> > a good idea.
>
>
> I'm still not 100% sure how this is going down, and I'm meant to be off t=
oday,
>
> Don't send this as patches to drm-misc-next, but I think we'd want
> this in drm-next for a cycle before sending it to Linus, but maybe
> it's not directly interfering with the kernel so it's fine
>
> Ideally when the real merge window opens and drm-next is merged I'd
> want to have a branch + PR written for this against drm-next that I
> can send to Linus separately and see how it goes.

The tricky thing is we need this patch in-tree to run CI in the first
place.. so soak time in drm-next on it's own isn't hugely useful.  (Or
at least I'd need to move msm-next forward to drm-next for it to be
useful.)

I guess that is a bit of an advantage to the earlier approach that
kept everything but the expectation files in a different git tree..

BR,
-R
