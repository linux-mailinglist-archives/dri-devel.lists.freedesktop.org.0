Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DD391AF54
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 20:51:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE0DD10E318;
	Thu, 27 Jun 2024 18:51:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GRCvceUf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80DA510EB1D
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 18:51:52 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2ec50a5e230so65274901fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 11:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719514310; x=1720119110; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NXfA1mNN74NByq5pI6pBUzQ7xjIdDC/0xEMnCMK2pOA=;
 b=GRCvceUfNMvB2iFUVp1y6oqEGFlQVHNET5k6JnnwD5ZqEkakstk6k8Pe96fjxkWlJh
 BqZqYsgX3Feh01gprgIK2e0bSoMHSaY3ounBurXjBVGftdUXug1UxwSMpv2vW8EbmNdk
 DZcnGLVK4CEyUrICAFdfbyKXwagXkPdCg9EjrqZSAl8ly4TcEgiHD6z5Cm7ZhQd3LVNo
 eP7PGIJma9V2lHry+/AieSgtAd77LSpJegNbzwjkpyg4VhMHohp475WitUDPY4to/q6Y
 VEttWuslm1OVAquwwSbevxjajQL5dKHKNbS3qloNRPMqGen2vi+Yd0y9udIREfcTUbOd
 K1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719514310; x=1720119110;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NXfA1mNN74NByq5pI6pBUzQ7xjIdDC/0xEMnCMK2pOA=;
 b=fvbnXDEtFCEdHHzztbx5ykS71/vlcL2yZyk3K7oJSooBkv3JzVRRkmw+wwO/5np6Yl
 uV1kOAQi9/rdDySo6TuoC+wyCbT6OWbMVSYqqzhPPg+2Ui8WwENgBVXZjJCS6+aow2WO
 6NB34Bd5rsQFkUUxsodDfU708VfwDpLWkL1pMe4gzBPPRW8TfDfdmTYPgtXoxkLJJVsq
 OxdTbUXV3/Lx0oBQWOmF8cs7G+LjkwAHDhfus8RUQ2nsoQd3XCoMBAinVIJfTEN0D0RL
 Tj5PNL5iSzrBFgso5sV0dVPXUCViv8WEuc4poG4kDlobjosehQSWaMY10tTnEkGjtFCz
 EZow==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCBY6DfAJ0ZMm4i1Rgxgd6047yTnVdPdtiN2Maa324nKSVBQfNBvwkcHeIdO/pDqMNygNJCZFASwKdGaREeUupdst2/jBZZgFnKon5beq1
X-Gm-Message-State: AOJu0YzTXymg5gHnN5pRgi/jCaq+eUWNnxyLouC/Qg9ydWMnv5l5EqRj
 ibtTS+GfEVs+yakgr5T1B/ixYH+HhlS9n6sGuQyyFJ+rjHmZ9bfKeyEze2DJD42hGhtWC2KCC+y
 DLbxpJSQrXnmoxzTx74C9kpmLhJw=
X-Google-Smtp-Source: AGHT+IEBk6fJ88CpL9TFO26tjaJabXKBv28zmY5Gj713njzbMRGfEAuymxMBJ9jB8PPPFtAu5GjOAtO5BogkFrBQXzU=
X-Received: by 2002:a2e:b0f5:0:b0:2ec:4086:ea6d with SMTP id
 38308e7fff4ca-2ec5b2695d9mr95945991fa.4.1719514309868; Thu, 27 Jun 2024
 11:51:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAF6AEGsRLPqddgc2MKCXKD1TDFuwxRs_6Pj=oDuj4gah0D-07Q@mail.gmail.com>
 <87a5mzrgie.fsf@intel.com>
 <CAF6AEGt=8mz8S+nBQ1a3mCNLFhBrfcc5XfmNrTQ=62J-m+_3Jg@mail.gmail.com>
 <44196cb4-bc07-4dba-bf1d-9d3d0e3bc88d@collabora.com>
 <f20f80a7-c905-4a9e-8fa6-985d6b3b1662@collabora.com>
 <ZnvEHEIEJIYcsQgN@phenom.ffwll.local>
 <f6kf3smgaza7r7zif4frz6ugrdzcl4u3xqidgwgvuffydhjfzp@66afcetzo3uw>
 <ZnxUP8H5oATEYNBt@phenom.ffwll.local>
In-Reply-To: <ZnxUP8H5oATEYNBt@phenom.ffwll.local>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 27 Jun 2024 11:51:37 -0700
Message-ID: <CAF6AEGu0X43O0-p=LaVmDgZrHnkHctuv=uLeqG+JEJXbfh=mjg@mail.gmail.com>
Subject: Re: Time for drm-ci-next?
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Helen Koike <helen.koike@collabora.com>, 
 Vignesh Raman <vignesh.raman@collabora.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Dave Airlie <airlied@gmail.com>, dri-devel <dri-devel@lists.freedesktop.org>, 
 Daniel Stone <daniels@collabora.com>
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

On Wed, Jun 26, 2024 at 10:47=E2=80=AFAM Daniel Vetter <daniel@ffwll.ch> wr=
ote:
>
> On Wed, Jun 26, 2024 at 11:38:30AM +0300, Dmitry Baryshkov wrote:
> > On Wed, Jun 26, 2024 at 09:32:44AM GMT, Daniel Vetter wrote:
> > > On Mon, Jun 24, 2024 at 10:25:25AM -0300, Helen Koike wrote:
> > > >
> > > >
> > > > On 24/06/2024 02:34, Vignesh Raman wrote:
> > > > > Hi,
> > > > >
> > > > > On 15/03/24 22:50, Rob Clark wrote:
> > > > > > Basically, I often find myself needing to merge CI patches on t=
op of
> > > > > > msm-next in order to run CI, and then after a clean CI run, res=
et HEAD
> > > > > > back before the merge and force-push.  Which isn't really how t=
hings
> > > > > > should work.
> > >
> > > This sounds more like you want an integration tree like drm-tip. Get =
msm
> > > branches integrated there, done. Backmerges just for integration test=
ing
> > > are not a good idea indeed.

But AFAIU this doesn't help for pre-merge testing, ie. prior to a
patch landing in msm-next

My idea was to have a drm-ci-next managed similar to drm-misc-next, if
we have needed drm/ci patches we could push them to drm-ci-next, and
then merge that into the driver tree (along with a PR from drm-ci-next
to Dave).

BR,
-R

> >
> > Is it fine to get drm/msm{-fixes,-next} into drm-tip?
>
> Should be.
>
> > > What exactly is the issue in backmerging drm-misc-next (well through
> > > drm-next really)?
> >
> > drm-misc-next is its own tree with separate cadence, its own bugs and
> > misfeatures. But probably just picking up drm-next for the tests should
> > be fine.
>
> Well, more CI should make the situation better for everyone. And I don't
> think you can avoid issues with topic branches, since usually there's
> enough stuff going on that you still often need parts of drm-next. The
> clean topic branches only tend to happen with other subsystems, where the
> interactions are much less.
>
> I think aim for more integration testing first with something like
> drm-tip, one-off topic branches if really needed for e.g. the gitlab
> version upgrade (but still prefer backmerges if that's enough) and see
> where it goes?
>
> If other trees introduce bugs it's imo much better to hit them early than
> in the middle of the next merge window, which is what you'd get with
> maximum amount of topic branches and tree separation. And the merge windo=
w
> is already really wobbly, we need to make that better.
>
> Cheers, Sima
>
> > > Also if there is an issue, generally we do ad-hoc topic branches.
> > >
> > > I'm very very skeptical of boutique trees with tiny focus, we've had =
that
> > > before drm-misc, it's a mess. Definitely no enthusiasm for getting ba=
ck
> > > to that kind of world.
> > > -Sima
> >
> > --
> > With best wishes
> > Dmitry
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
