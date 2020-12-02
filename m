Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D50682CB246
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 02:26:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B56056E99A;
	Wed,  2 Dec 2020 01:26:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D9A56E99A
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Dec 2020 01:26:10 +0000 (UTC)
IronPort-SDR: FQDj0BYwIGM4IxuOPjI9ZjvNhODJBNQjG/HUuFaWtccNlyvD40spRhH2rbz/t4fsuzxkL3rX5q
 uBSQ5R0FbY5A==
X-IronPort-AV: E=McAfee;i="6000,8403,9822"; a="173032776"
X-IronPort-AV: E=Sophos;i="5.78,385,1599548400"; d="scan'208";a="173032776"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2020 17:26:09 -0800
IronPort-SDR: 7E1A3p49cuTtTS+7zsM0/iv47juIqaLTWRUXLCeLkO4ukMZqSUxLoNshY/zqKORzcc61DHu1+5
 yieFGEbTdJ2Q==
X-IronPort-AV: E=Sophos;i="5.78,385,1599548400"; d="scan'208";a="405330191"
Received: from msotoflo-mobl2.amr.corp.intel.com (HELO intel.com)
 ([10.213.166.26])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2020 17:26:08 -0800
Date: Tue, 1 Dec 2020 17:26:07 -0800
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: Dim blowing up in my face
Message-ID: <20201202012607.GA1383659@intel.com>
References: <3a1d46a8-cefe-cebb-2ab9-7bee1dea1d82@amd.com>
 <CAKMK7uHZmsMmJGu_wj7L=XjJcay_VLW8V=0mPiN_FcbRQB5LgQ@mail.gmail.com>
 <CAKMK7uG7xt7N265oi+HnWJkKU=B3TWfW4CWs-PAPVhiEqwnBUg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uG7xt7N265oi+HnWJkKU=B3TWfW4CWs-PAPVhiEqwnBUg@mail.gmail.com>
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
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 01, 2020 at 06:24:56PM +0100, Daniel Vetter wrote:
> On Tue, Dec 1, 2020 at 6:22 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Tue, Dec 1, 2020 at 5:58 PM Christian K=F6nig <christian.koenig@amd.=
com> wrote:
> > >
> > > Hi Daniel,
> > >
> > > I've just pushed a minor TTM cleanup and dim is complaining that
> > > drm-intel/drm-intel-gt-next merge into drm-tip failed.
> > >
> > > Investigating that looks like something completely unrelated and I do=
n't
> > > know the Intel code well enough to fix it myself.
> > >
> > > How to we proceed?
> >
> > Probably just someone concurrently pushing and hasn't resolved their
> > conflicts yet. Best is to ask on #intel-gfx who did it to make sure it
> > gets fixed.
> =

> btw gitk --merge (and not --merges, that's a totally different knob)
> in the conflicting branch is really good to figure out what's
> conflicting with what and whom to blame for the mess. Looks like it
> was Rodrigo and already resolved.

yeap, caused by the drm-intel-fixes' cherry-picks from drm-intel-gt-next.

All of them solved by simply going with the drm-intel-gt-next side.

(Well, plus a silent conflict which left a duplication and broken the compi=
lation)

Sorry for any temporary inconvenience.

> -Daniel
> =

> > -Daniel
> >
> > >
> > > Thanks,
> > > Christian.
> >
> >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
> =

> =

> =

> -- =

> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
