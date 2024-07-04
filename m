Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED557927A50
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 17:40:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96AB010E05D;
	Thu,  4 Jul 2024 15:40:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="m4JWzJvC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED5110E05D
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 15:40:41 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-650866942aeso7490197b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2024 08:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720107641; x=1720712441; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b8vUQfPP5qfjsHmNkQpkzRi4mKAODyLaS8loX1ps5Bw=;
 b=m4JWzJvCWHhXN1TOKOrqNOHghXkAKm2sqzJU1IHOn6QSkvmLBHcV7AivIHIozVc3jE
 SSXJ8JIA5BDSRfcRcqmizZThpv0rEJRu43t8JDnHw2sTzeIFcM8FXD0wLgpaIqvifJxe
 9HDJR0Ur3CX/fyb5B0rjCYQ3iSjPupJroCo+YprCNg+iw6lh4AbggN+gtqplngD3RSeN
 TFm2DlLHA6LZJh46iuI01OWWeJi95C10qBgbeNJ9/EJkyGkymg+A7006tqniw7dRnwH2
 DX3lRhcbuMrcttgOY4gMHfgXICuVICzV1bnQ44XRBOOx8xUI483NNWWQP+Gxzra076u/
 0MaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720107641; x=1720712441;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b8vUQfPP5qfjsHmNkQpkzRi4mKAODyLaS8loX1ps5Bw=;
 b=EMtvofBxjnXT539OFxSO61m2IhYxcChCzzmKAYXF2cwV1GlTnKYkNXZ1KFknQaco5U
 J/GdWqTu0JQ58X3/fvfY2YqaoigiIALC+x7UAODBNr22peFBqLKoFq5oe5VngAuqpHzE
 qoMpzlF8bKwj6euOiewiBM7Vnp65SnVyg2P1+nxyl+GzECMX9EST5BpMii0A3iOkYMo2
 3u34ILZEFluZc+/ppBY4tjgufKNpqHE887aqvfXZB023JtFQYiQkaGQQl4aFOWpX4ICZ
 4A96mvlzCnSRB42x+RTn+ZChqMGrOcpMmvUzN4ryntrTKgdOnGVwq326nDsumgh5wOsH
 Jf/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUT2ZF235YUvZ8o0httQcXmZUTXB4nin/xB85DTj7WPXsPCxo3ChbKXB2uEQrvZnYE3SZg25gR4FQpqtK/LNM1igCuroIE35tYEIY2QX1Kd
X-Gm-Message-State: AOJu0Yz0nqrmrJ/Y20EVmnVyrgBZhGUNgXdXHIXGtiSvNO2DPJ6ALeYA
 C0KMYKv6eaDYTXE5Axx69r0Yz3chxH16ZjG6Z+cqBcQBO/OlvZtuPlEhVAYXuVLW0Fl0q+uhED/
 /Aa2l/It4yOP4s2sp1j53a7vdmAI=
X-Google-Smtp-Source: AGHT+IEt5IOEMx5F0wUrUuNebsjqZT+TbhoUaKQvk0HZ63ynjlKo6D2HmTR2q7qx7NAAh2Itt99330LwhQA2AtOWqwg=
X-Received: by 2002:a81:8b43:0:b0:651:6e6f:32d2 with SMTP id
 00721157ae682-652db2d0830mr18355977b3.43.1720107640839; Thu, 04 Jul 2024
 08:40:40 -0700 (PDT)
MIME-Version: 1.0
References: <87a5mzrgie.fsf@intel.com>
 <CAF6AEGt=8mz8S+nBQ1a3mCNLFhBrfcc5XfmNrTQ=62J-m+_3Jg@mail.gmail.com>
 <44196cb4-bc07-4dba-bf1d-9d3d0e3bc88d@collabora.com>
 <f20f80a7-c905-4a9e-8fa6-985d6b3b1662@collabora.com>
 <ZnvEHEIEJIYcsQgN@phenom.ffwll.local>
 <f6kf3smgaza7r7zif4frz6ugrdzcl4u3xqidgwgvuffydhjfzp@66afcetzo3uw>
 <ZnxUP8H5oATEYNBt@phenom.ffwll.local>
 <CAF6AEGu0X43O0-p=LaVmDgZrHnkHctuv=uLeqG+JEJXbfh=mjg@mail.gmail.com>
 <Zn72laHlmWW3So9f@phenom.ffwll.local>
 <CAF6AEGv6Hd65OPJm6DBB=yPRtLLB1BZpRodLr-Bk5stGzULMew@mail.gmail.com>
 <Zoas4JJ3uhrR9lH7@phenom.ffwll.local>
In-Reply-To: <Zoas4JJ3uhrR9lH7@phenom.ffwll.local>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 4 Jul 2024 08:40:26 -0700
Message-ID: <CAF6AEGtCEbhBo2CXLQymf2g5RogtdYv2LLXUNQO7Tvuw7x6ujA@mail.gmail.com>
Subject: Re: Time for drm-ci-next?
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Helen Koike <helen.koike@collabora.com>,
 Vignesh Raman <vignesh.raman@collabora.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, Dave Airlie <airlied@gmail.com>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Stone <daniels@collabora.com>, Rob Clark <robdclark@chromium.org>
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

On Thu, Jul 4, 2024 at 7:08=E2=80=AFAM Daniel Vetter <daniel.vetter@ffwll.c=
h> wrote:
>
> On Tue, Jul 02, 2024 at 05:32:39AM -0700, Rob Clark wrote:
> > On Fri, Jun 28, 2024 at 10:44=E2=80=AFAM Daniel Vetter <daniel@ffwll.ch=
> wrote:
> > >
> > > On Thu, Jun 27, 2024 at 11:51:37AM -0700, Rob Clark wrote:
> > > > On Wed, Jun 26, 2024 at 10:47=E2=80=AFAM Daniel Vetter <daniel@ffwl=
l.ch> wrote:
> > > > >
> > > > > On Wed, Jun 26, 2024 at 11:38:30AM +0300, Dmitry Baryshkov wrote:
> > > > > > On Wed, Jun 26, 2024 at 09:32:44AM GMT, Daniel Vetter wrote:
> > > > > > > On Mon, Jun 24, 2024 at 10:25:25AM -0300, Helen Koike wrote:
> > > > > > > >
> > > > > > > >
> > > > > > > > On 24/06/2024 02:34, Vignesh Raman wrote:
> > > > > > > > > Hi,
> > > > > > > > >
> > > > > > > > > On 15/03/24 22:50, Rob Clark wrote:
> > > > > > > > > > Basically, I often find myself needing to merge CI patc=
hes on top of
> > > > > > > > > > msm-next in order to run CI, and then after a clean CI =
run, reset HEAD
> > > > > > > > > > back before the merge and force-push.  Which isn't real=
ly how things
> > > > > > > > > > should work.
> > > > > > >
> > > > > > > This sounds more like you want an integration tree like drm-t=
ip. Get msm
> > > > > > > branches integrated there, done. Backmerges just for integrat=
ion testing
> > > > > > > are not a good idea indeed.
> > > >
> > > > But AFAIU this doesn't help for pre-merge testing, ie. prior to a
> > > > patch landing in msm-next
> > > >
> > > > My idea was to have a drm-ci-next managed similar to drm-misc-next,=
 if
> > > > we have needed drm/ci patches we could push them to drm-ci-next, an=
d
> > > > then merge that into the driver tree (along with a PR from drm-ci-n=
ext
> > > > to Dave).
> > >
> > > I guess I'm confused about what kind of pre-merge testing we're talki=
ng
> > > about then ... Or maybe this just doesn't work too well with the linu=
x
> > > kernel. The model is that you have some pile of trees, they're split =
up,
> > > and testing of all the trees together is done in integration trees li=
ke
> > > linux-next or drm-tip.
> >
> > pre-merge: for msm we've been collecting up patches from list into a
> > fast-forward MR which triggers CI before merging to msm-next/msm-fixes
> >
> > Ideally drm-misc and other trees would do similar, we'd catch more
> > regressions that way.  For example, in msm-next the nodebugfs build is
> > currently broken, because we merged drm-misc-next at a time when
> > komeda was broken:
> >
> > https://gitlab.freedesktop.org/drm/msm/-/jobs/60575681#L9520
> >
> > If drm-misc was using pre-merge CI this would have been caught and the
> > offending patch dropped.
>
> That sounds more like we should push on the drm-misc pre-merge CI boulder
> to move it uphill, than add even more trees to make it even harder to get
> there long term ...
>
> Short term it helps locally to have finer trees, but only short term and
> only very locally.

The path to have fewer trees (ideally only one for all of drm) is to
use gitlab MRs to land everything :-)

drm-ci-next is only a stop-gap.. but one that we need.  The
${branchname}-external-fixes trick covers _most_ cases where we need
unrelated patches (ie. to fix random ToT breakage outside of drm or in
core drm), but it doesn't help when the needed changes are yml
(because gitlab processes all the yml before merging the
-external-fixes branch).  This is where we need drm-ci-next, otherwise
we are having to create a separate MR which cherry-picks drm/ci
patches for doing the CI.  This is a rather broken process.

I could conceivably see a scenario where we are landing both drm/ci
and drm/msm changes via the same tree.  But only if we were using
gitlab MRs and CI for landing all changes in that tree.

BR,
-R

> -Sima
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
