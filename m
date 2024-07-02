Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B68D4923DEA
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 14:32:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1134C10E5E5;
	Tue,  2 Jul 2024 12:32:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EIJhuuRU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7951B10E5E5
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 12:32:53 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a725041ad74so164218766b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2024 05:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719923572; x=1720528372; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b9be5BwgYK0mjmR0lvJnebW4p++eDRuSqbbpH/u0iy4=;
 b=EIJhuuRUJ2ovB4THCJExL//Pz6ZXAk05hy9MqfSZ3jHP2EF5ScJsQLrpbWE31T7ZQG
 dPxS6OkbmIAZbTmb7/xBtXE7VWKWh6ltp/nNkW3UU9/IIlTDGeNpozpZ2Sp59ZeSDFPb
 PZausrxOBh+Tjp+XzJAjZCriSaFCJK9CGsgpRcl4Hy5rAXHdwiXdppVvUTm7+jyIcJvN
 9pBIdo/TSxJH0RaZOGqoqL78glX0r1U1oNrtvnZOyiLNjEuiaQFwJfvPh1XCof6uB0XM
 E94PiYIRVAypWB+hash29olp1GBnkfw3GNBfVxZbQ0I2NDsRNQxKRdD/OYxRH/g7a6WW
 yFrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719923572; x=1720528372;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b9be5BwgYK0mjmR0lvJnebW4p++eDRuSqbbpH/u0iy4=;
 b=uCmN1u4SfYLMblDwzYWkD0VE6IveqDjHIkR91NaJglftYzukgYByMT3STO4BkLtgBv
 ae/CEtmVuyKd01lK8bTFmdaxvWE1pSqYdPjKMV5Xdx16w2CMzrYEMU6d3NOtpm6hmjkR
 2JlWMuh0eBJiYVVvqKMn3Cysl3m0LAgI0hk8oeSubue+NonHX7UKFHEHgRgOoTXRYVjX
 wCei+iG+MwgQMClzXHCBjKFk4HQ7pv64I/GJYYHfAzvFzDwupeY5dYWzBg+hNtg5OKjZ
 3qNx8SKYJuSpX7bYP+b6vv1qhP6AUxWosjyX33W5K68VvCgnmRsBL6XDDZttH61gkzz0
 f0Lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/UKE3pXgjpBBjZJS1SEDWqYLyVwH4il1/RrL4ywlgyU0BIbaHMza1W+yfufSIDZWkJCLXRIrCu7TfBWdwrmVwdh51q6z4M5Q2NXMkbIHG
X-Gm-Message-State: AOJu0YxU8SR097GC9LVc2JoD4+KlmxymRfKNNoBg2j8f8y8oq3rt0E2S
 7TdcdgEOdWTqUY19dzrRvBHR/wmvjMogj6tTuhI0IfRMEAvgjOrYVb13JbLC9R4Be9AaQfLHIyb
 +5UDLsRNLdYu3apC7soDLtnxSDMY=
X-Google-Smtp-Source: AGHT+IFeoRC2RDpqN9thMrJZmyRPyYaBcRwtqfmuU3M9Me8Die8CBUn4LwMBFpnc8DkIWWSmo4KEFtMHzREaia+u03s=
X-Received: by 2002:a05:6402:84b:b0:57c:5f77:1136 with SMTP id
 4fb4d7f45d1cf-5879f69b7bemr7459201a12.24.1719923571399; Tue, 02 Jul 2024
 05:32:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAF6AEGsRLPqddgc2MKCXKD1TDFuwxRs_6Pj=oDuj4gah0D-07Q@mail.gmail.com>
 <87a5mzrgie.fsf@intel.com>
 <CAF6AEGt=8mz8S+nBQ1a3mCNLFhBrfcc5XfmNrTQ=62J-m+_3Jg@mail.gmail.com>
 <44196cb4-bc07-4dba-bf1d-9d3d0e3bc88d@collabora.com>
 <f20f80a7-c905-4a9e-8fa6-985d6b3b1662@collabora.com>
 <ZnvEHEIEJIYcsQgN@phenom.ffwll.local>
 <f6kf3smgaza7r7zif4frz6ugrdzcl4u3xqidgwgvuffydhjfzp@66afcetzo3uw>
 <ZnxUP8H5oATEYNBt@phenom.ffwll.local>
 <CAF6AEGu0X43O0-p=LaVmDgZrHnkHctuv=uLeqG+JEJXbfh=mjg@mail.gmail.com>
 <Zn72laHlmWW3So9f@phenom.ffwll.local>
In-Reply-To: <Zn72laHlmWW3So9f@phenom.ffwll.local>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 2 Jul 2024 05:32:39 -0700
Message-ID: <CAF6AEGv6Hd65OPJm6DBB=yPRtLLB1BZpRodLr-Bk5stGzULMew@mail.gmail.com>
Subject: Re: Time for drm-ci-next?
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Helen Koike <helen.koike@collabora.com>, 
 Vignesh Raman <vignesh.raman@collabora.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Dave Airlie <airlied@gmail.com>, dri-devel <dri-devel@lists.freedesktop.org>, 
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

On Fri, Jun 28, 2024 at 10:44=E2=80=AFAM Daniel Vetter <daniel@ffwll.ch> wr=
ote:
>
> On Thu, Jun 27, 2024 at 11:51:37AM -0700, Rob Clark wrote:
> > On Wed, Jun 26, 2024 at 10:47=E2=80=AFAM Daniel Vetter <daniel@ffwll.ch=
> wrote:
> > >
> > > On Wed, Jun 26, 2024 at 11:38:30AM +0300, Dmitry Baryshkov wrote:
> > > > On Wed, Jun 26, 2024 at 09:32:44AM GMT, Daniel Vetter wrote:
> > > > > On Mon, Jun 24, 2024 at 10:25:25AM -0300, Helen Koike wrote:
> > > > > >
> > > > > >
> > > > > > On 24/06/2024 02:34, Vignesh Raman wrote:
> > > > > > > Hi,
> > > > > > >
> > > > > > > On 15/03/24 22:50, Rob Clark wrote:
> > > > > > > > Basically, I often find myself needing to merge CI patches =
on top of
> > > > > > > > msm-next in order to run CI, and then after a clean CI run,=
 reset HEAD
> > > > > > > > back before the merge and force-push.  Which isn't really h=
ow things
> > > > > > > > should work.
> > > > >
> > > > > This sounds more like you want an integration tree like drm-tip. =
Get msm
> > > > > branches integrated there, done. Backmerges just for integration =
testing
> > > > > are not a good idea indeed.
> >
> > But AFAIU this doesn't help for pre-merge testing, ie. prior to a
> > patch landing in msm-next
> >
> > My idea was to have a drm-ci-next managed similar to drm-misc-next, if
> > we have needed drm/ci patches we could push them to drm-ci-next, and
> > then merge that into the driver tree (along with a PR from drm-ci-next
> > to Dave).
>
> I guess I'm confused about what kind of pre-merge testing we're talking
> about then ... Or maybe this just doesn't work too well with the linux
> kernel. The model is that you have some pile of trees, they're split up,
> and testing of all the trees together is done in integration trees like
> linux-next or drm-tip.

pre-merge: for msm we've been collecting up patches from list into a
fast-forward MR which triggers CI before merging to msm-next/msm-fixes

Ideally drm-misc and other trees would do similar, we'd catch more
regressions that way.  For example, in msm-next the nodebugfs build is
currently broken, because we merged drm-misc-next at a time when
komeda was broken:

https://gitlab.freedesktop.org/drm/msm/-/jobs/60575681#L9520

If drm-misc was using pre-merge CI this would have been caught and the
offending patch dropped.

BR,
-R

> Criss-cross merging of trees just for integration testing is no-go. And
> that seems to be the only reason you want drm-ci-next?
>
> Also, this sounds more like msm being in a separate tree is the pain poin=
t
> here, and solving "we have too many trees" by adding more isn't a good
> idea ...
>
> Or I'm just totally confused.
> -Sima
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
