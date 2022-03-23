Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9D14E54D4
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 16:04:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70FBB10E772;
	Wed, 23 Mar 2022 15:04:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DA4010E772
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 15:04:08 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id v35so3172599ybi.10
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 08:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/q655hlpcKbYdO9fJyRr0g9SmFAUcvg0z56HSQrgBXs=;
 b=qaBK8sKppcaRzErNHs7XlKcRTafbewC4j9oQigOyjY+1s0DB/UVnbR2vqwyYSSVBmC
 9mSet1LA5w51T3rypL0RtYttSwMvpfGcHmyDFwpkgH/Z0sVuJkHy6754X9Atm2DRqH8K
 z+ZIeNy7BKAPSUH66Cucd2p1FCxNRax/c0fd9eJYtC9eAj0VGJShMuo0Ob0CoKy8LlBd
 Is+4Sj1BeQDIyGI1XUzAVUqXg3lpF0HBxCY5D8Eo69tpkaEJYLTWNGTEdxbZ9IXhu5bw
 z90PuLKPDYRsFMNE4zSeNGnzmhmTLDPRv/g2FEcX8uRShNbC4SsRP0KJ3qQ9DI3QP9no
 AImg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/q655hlpcKbYdO9fJyRr0g9SmFAUcvg0z56HSQrgBXs=;
 b=3PuwSVuJ5hbFiqLGdVXG2c8MjuU3pKgN+vk1vEfzqzBfdBcHT6t/lzTt8YEXVxuyOC
 b2oZbaVcGv3nZ8R5JB1VC5SExI074MAw0iqxV8wHxXH6dhr1shFseBtgudVqg2yDhRCX
 2hviVzsJ2Tj1zoJcWZbGnpjr2YCwkvSkQoASbxEksxOJNgAG7bAEsGl9iL57p2/EQ7Km
 XqU8dhY2RDlDjl5jSATf8tniL/QSekVItJVfFDeUYgaeXtLNqEgvIfjJkU3vIxhAXyCt
 7h698glV9O4pXbewmDdw72lbbz9ru1Zi31Aq9Cf7x5wGlCxtTM6O+JAJswYnkAvGiWqt
 /P/A==
X-Gm-Message-State: AOAM533BvJi7EOqR5fLSc0RUoRjCVJy7gSB/7klU59mpGgFNky8e1CmP
 ahkr/9JonYnoCekbIXyfAEoMfSbJreEhUzKyoyLW/Q==
X-Google-Smtp-Source: ABdhPJxcMJ6+Hr2/I5UkaYfdaVtR0YnwOzthjjTl3lrRLZf4luG1nyVOV8v2NzvJt/qNmoaX0MFmxJtsdmgiECwWvn8=
X-Received: by 2002:a25:b7c8:0:b0:633:5650:781e with SMTP id
 u8-20020a25b7c8000000b006335650781emr339945ybj.466.1648047847294; Wed, 23 Mar
 2022 08:04:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220323062552.228429-1-Arunpravin.PaneerSelvam@amd.com>
 <7addb3e7-d265-c1a7-d449-7d0056f06d63@molgen.mpg.de>
 <fc60c561-c12a-c031-9558-abae3e3474ec@amd.com>
 <6f0888a2-f74d-f41f-d593-a8362e7dc673@molgen.mpg.de>
 <398f8851-d37b-4020-24ce-8f2ab9723e40@amd.com>
 <CAPj87rMETV9UkpbGRYAT3mjVhRtW75m0e9OLON6_+gdcD0Fo2Q@mail.gmail.com>
 <CADnq5_NuaN_ZziNipdqvvTQ41you==VqJg5oxQovowokaJ2K1Q@mail.gmail.com>
In-Reply-To: <CADnq5_NuaN_ZziNipdqvvTQ41you==VqJg5oxQovowokaJ2K1Q@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 23 Mar 2022 15:03:56 +0000
Message-ID: <CAPj87rNyjd1xkEEARMoiaEdjLxy2rvcKa03fnNCnpN91DLhF1A@mail.gmail.com>
Subject: Re: Commit messages (was: [PATCH v11] drm/amdgpu: add drm buddy
 support to amdgpu)
To: Alex Deucher <alexdeucher@gmail.com>
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
 Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alex,

On Wed, 23 Mar 2022 at 14:42, Alex Deucher <alexdeucher@gmail.com> wrote:
> On Wed, Mar 23, 2022 at 10:00 AM Daniel Stone <daniel@fooishbar.org> wrot=
e:
> > On Wed, 23 Mar 2022 at 08:19, Christian K=C3=B6nig <christian.koenig@am=
d.com> wrote:
> > > Well the key point is it's not about you to judge that.
> > >
> > > If you want to complain about the commit message then come to me with
> > > that and don't request information which isn't supposed to be publicl=
y
> > > available.
> > >
> > > So to make it clear: The information is intentionally hold back and n=
ot
> > > made public.
> >
> > In that case, the code isn't suitable to be merged into upstream
> > trees; it can be resubmitted when it can be explained.
>
> So you are saying we need to publish the problematic RTL to be able to
> fix a HW bug in the kernel?  That seems a little unreasonable.  Also,
> links to internal documents or bug trackers don't provide much value
> to the community since they can't access them.  In general, adding
> internal documents to commit messages is frowned on.

That's not what anyone's saying here ...

No-one's demanding AMD publish RTL, or internal design docs, or
hardware specs, or URLs to JIRA tickets no-one can access.

This is a large and invasive commit with pretty big ramifications;
containing exactly two lines of commit message, one of which just
duplicates the subject.

It cannot be the case that it's completely impossible to provide any
justification, background, or details, about this commit being made.
Unless, of course, it's to fix a non-public security issue, that is
reasonable justification for eliding some of the details. But then
again, 'huge change which is very deliberately opaque' is a really
good way to draw a lot of attention to the commit, and it would be
better to provide more detail about the change to help it slip under
the radar.

If dri-devel@ isn't allowed to inquire about patches which are posted,
then CCing the list is just a fa=C3=A7ade; might as well just do it all
internally and periodically dump out pull requests.

Cheers,
Daniel
