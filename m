Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A7726ADB2
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 21:36:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B13589DCF;
	Tue, 15 Sep 2020 19:36:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F12189DCF;
 Tue, 15 Sep 2020 19:35:59 +0000 (UTC)
IronPort-SDR: GEnHvclrNCFesRp7qorwpXpp9DA4EFC4Pt+ZE1UIQTsAuubsaLOWsC0D1YIu9lrbYnWYBAaYle
 HWNkJVC5GbaQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9745"; a="159386765"
X-IronPort-AV: E=Sophos;i="5.76,430,1592895600"; d="scan'208";a="159386765"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2020 12:35:54 -0700
IronPort-SDR: i2m5jk7nUWDhIcarS7CMsRRt9ERB90Cv8RG/ApZVbBpRKGqGU6fG49uc78PWAFvbeTy9FLSCUx
 hUSdv5ho7g7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,430,1592895600"; d="scan'208";a="288114814"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga008.fm.intel.com with SMTP; 15 Sep 2020 12:35:49 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 15 Sep 2020 22:35:49 +0300
Date: Tue, 15 Sep 2020 22:35:49 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH -next 0/8] drm/amd/amdgpu: fix comparison pointer to bool
 warning
Message-ID: <20200915193549.GP6112@intel.com>
References: <20200909130720.105234-1-zhengbin13@huawei.com>
 <1fce0f2a-3777-e6d8-5a09-30261f843cfd@amd.com>
 <CADnq5_NoeFbBAMT6s_ictVXsUc2tx1U48MLxnMbAr2Sd58jyYA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_NoeFbBAMT6s_ictVXsUc2tx1U48MLxnMbAr2Sd58jyYA@mail.gmail.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: yi.zhang@huawei.com, Dave Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Zheng Bin <zhengbin13@huawei.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 15, 2020 at 03:16:32PM -0400, Alex Deucher wrote:
> I question the value of these warnings.  Why even have a boolean type
> if you are going to get warnings when you use them...
> That said, applied to avoid getting these patches again and again
> every time someone sees this.

if (this_is_sparta)
if (this_is_sparta =3D=3D true)
if (this_is_sparta !=3D false)

I think the first one reads the best, and avoids having to
decide between truth and falsehood :)

> =

> Alex
> =

> On Wed, Sep 9, 2020 at 9:21 AM Christian K=F6nig <christian.koenig@amd.co=
m> wrote:
> >
> > Acked-by: Christian K=F6nig <christian.koenig@amd.com> for the series.
> >
> > Am 09.09.20 um 15:07 schrieb Zheng Bin:
> > > Zheng Bin (8):
> > >    drm/amd/amdgpu: fix comparison pointer to bool warning in gfx_v9_0=
.c
> > >    drm/amd/amdgpu: fix comparison pointer to bool warning in gfx_v10_=
0.c
> > >    drm/amd/amdgpu: fix comparison pointer to bool warning in sdma_v5_=
0.c
> > >    drm/amd/amdgpu: fix comparison pointer to bool warning in sdma_v5_=
2.c
> > >    drm/amd/amdgpu: fix comparison pointer to bool warning in si.c
> > >    drm/amd/amdgpu: fix comparison pointer to bool warning in uvd_v6_0=
.c
> > >    drm/amd/amdgpu: fix comparison pointer to bool warning in
> > >      amdgpu_atpx_handler.c
> > >    drm/amd/amdgpu: fix comparison pointer to bool warning in sdma_v4_=
0.c
> > >
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_atpx_handler.c | 4 ++--
> > >   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c           | 2 +-
> > >   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c            | 2 +-
> > >   drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c           | 4 ++--
> > >   drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c           | 2 +-
> > >   drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c           | 2 +-
> > >   drivers/gpu/drm/amd/amdgpu/si.c                  | 2 +-
> > >   drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c            | 4 ++--
> > >   8 files changed, 11 insertions(+), 11 deletions(-)
> > >
> > > --
> > > 2.26.0.106.g9fadedd
> > >
> >
> > _______________________________________________
> > amd-gfx mailing list
> > amd-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/amd-gfx
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
