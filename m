Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9056968F6B3
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 19:14:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB2210E2F1;
	Wed,  8 Feb 2023 18:14:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1603910E2F1
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 18:14:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 599E46177B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 18:14:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2858C4339C
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 18:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675880050;
 bh=/dGZn5sjaw9tAFJdtl2X6h0qoi/XZq443pE4DiHDQoI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FhVstkirvuh3WGxdccsP2vNNQYS9bzWU8fgtifVGyx8eAmV0Z5D0A/6DrOoPXjb26
 nNggok6K2RclucbBdhuWAiY5H7mNvq0iuOGoGZvGHO5oCgW/ppG9g39jgJDrY74Ijw
 EzZv8MUYwW8Z8hBvkNemW/MoRickP9aatNJetwm1I3oSAh5Ig/4UJ9T9IMR29pxSj3
 0yvImyK54DjgRVdSrlG9aoTh9as8hxit8klZuqj2hhMlAX7x2eYSUYdwC42A7Dqdbn
 mAebdACec5gfiIxOmEdeJp4KQEUl/b54fvYgH9NU+tgEzZfUYIzJHdq1yz8En561DS
 fxSloGwHUtDmg==
Received: by mail-yb1-f177.google.com with SMTP id 23so16092130ybf.10
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Feb 2023 10:14:10 -0800 (PST)
X-Gm-Message-State: AO0yUKWh0977U9rXA45rcBPoTQG2/nCxgRnqyWty/B1JcA73UG7A7/CU
 kVWKm8Sv8q6mtEHUVLMd7859rAYqzEA/1+PdNps=
X-Google-Smtp-Source: AK7set/a20myyU8UrcG3mBDQEv9g+tBiZ0ZIZGiMYfEfBSqWOna8e2D6/jj+RmtlJ6htNe5tPuXAkNUnQmVX6I2jAfc=
X-Received: by 2002:a25:8f83:0:b0:85b:3c60:78e6 with SMTP id
 u3-20020a258f83000000b0085b3c6078e6mr558324ybl.550.1675880049793; Wed, 08 Feb
 2023 10:14:09 -0800 (PST)
MIME-Version: 1.0
References: <20230201152003.GA2623449@linux.intel.com>
 <5dfdf605-55a2-28d3-aecf-713a632b2431@igalia.com>
 <5651b98b-ace8-5009-409f-d6032cb5374d@quicinc.com>
 <bdf077e8-87ff-108a-e1fe-44bd6db79674@igalia.com>
 <Y+Pk185JOBg7/AKN@phenom.ffwll.local>
In-Reply-To: <Y+Pk185JOBg7/AKN@phenom.ffwll.local>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Wed, 8 Feb 2023 20:13:43 +0200
X-Gmail-Original-Message-ID: <CAFCwf11-46pknoh_S=GYWeQFP3Q6x+k7EcqsOapPEEji5Dygnw@mail.gmail.com>
Message-ID: <CAFCwf11-46pknoh_S=GYWeQFP3Q6x+k7EcqsOapPEEji5Dygnw@mail.gmail.com>
Subject: Re: DRM accel and debugfs/sysfs
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 8, 2023 at 8:07 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Tue, Feb 07, 2023 at 01:17:47PM -0300, Ma=C3=ADra Canal wrote:
> > On 2/7/23 12:43, Jeffrey Hugo wrote:
> > > On 2/7/2023 4:31 AM, Ma=C3=ADra Canal wrote:
> > > > Hi Stanislaw,
> > > >
> > > > On 2/1/23 12:20, Stanislaw Gruszka wrote:
> > > > > Hi
> > > > >
> > > > > I was about to send debugfs support for ivpu and noticed that the=
re
> > > > > are current changes that deprecate drm_devel->debugfs_init callba=
ck.
> > > > >
> > > > > Further I looked at this commit [1], that stated we should not
> > > > > use drm_minor for debugfs and sysfs. What is quite contrary to
> > > > > what drm accel framework did in the first place.
> > > > >
> > > > > So my question is how we should use debugfs/sysfs in accel?
> > > > > Use it with old fashioned minor-centric way or change
> > > > > the framework somehow ?
> > > >
> > > > As we are trying to replace drm_debugfs_create_files() [1], it woul=
d
> > > > be nice to see the accel debugfs support use the new debugfs API. T=
his
> > > > would mean using the debugfs_list from the drm_device, deprecating
> > > > the debugfs_init callback, and adding the a similar code snippet to
> > > > accel_debugfs_init:
> > > >
> > > > list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
> > > >      debugfs_create_file(entry->file.name, 0444,
> > > >                  minor->debugfs_root, entry, &drm_debugfs_entry_fop=
s);
> > > >      list_del(&entry->list);
> > > >
> > > > Maybe Daniel has some more thoughts on this matter, but I guess it
> > > > would be better to drop the use of the old-fashioned minor-centric
> > > > implementation in accel.
>
> It was a simple case of two things landing in parallel and not being
> synchronized. Would be good if accel could be adapted to use the new
> debugfs infra, now that both accel and the new debugfs stuff have landed.
> -Daniel
Yes, definitely.
Does anyone volunteer to send a patch to align ?
If not, we will do it internally and send a patch.

Oded
>
> > > >
> > > > [1] https://cgit.freedesktop.org/drm/drm-misc/tree/Documentation/gp=
u/todo.rst#n511
> > > >
> > > > Best Regards,
> > > > - Ma=C3=ADra Canal
> > >
> > > Thank you for the details Maira.  It helps to explain what the todo i=
s suggesting.  Is there an example of a driver/drm_device that uses debugfs=
_list which you can easily point to?
> >
> > The implementation of this device-centered infrastructure is linked in =
[1]
> > and an example of the conversion of debugfs APIs is linked in [2], and =
other
> > drivers such as v3d, vkms, vc4 and gud use this new API as well.
> >
> > [1] https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3D1c9cacbea880=
513a896aee65a5c58007bcb55653
> > [2] https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3D2e3ab8a6994f=
265bbd4dbd00448b84548f18464c
> >
> > Best Regards,
> > - Ma=C3=ADra Canal
> >
> > >
> > > -Jeff
> > >
> > > >
> > > > >
> > > > > [1] https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3D99845f=
aae7099cd704ebf67514c1157c26960a26
> > > > >
> > > > > Regards
> > > > > Stanislaw
> > > > >
> > >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
