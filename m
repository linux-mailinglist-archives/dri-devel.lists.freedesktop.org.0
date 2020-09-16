Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5455826BE85
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 09:52:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF3326E9D3;
	Wed, 16 Sep 2020 07:52:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA8B06E9D5
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 07:52:00 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id l9so1898115wme.3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 00:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=dVvKltWqBEU89BlHB4WRQdNVMd2wZl+8cOFR2ESkNKo=;
 b=Q2xM5bAJA/Q2WFGxfesK2VFF/My8eoWs6bHKJhos95mBiqc9lVTNUtWxEjtDNhw9P+
 o2nW4Oc7bpXzn5htepF+j+WG1QREUrbdjd8zyVZii+omDNhTHcBpXOgfr1/APV87AC2S
 +H6ZwmSx2gokn9FmGFszkLtNCBIMZ3a4lT/FM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=dVvKltWqBEU89BlHB4WRQdNVMd2wZl+8cOFR2ESkNKo=;
 b=Hauz0pQpgoaPE0/mY16SUuRGTsaSo8CBDguJPusncCa9tUTyvlfTwJ/68IaB1DS72n
 oQo2S5NcK6RzVO0eqEtG4qnSR2qXjjygBnoFj4ug47G/HO6uB88M5DlWxj/bKamYDHCg
 j5WWogW6isswZ9y02vNla38pT+xp/vRbmzq8vXlTlZnpXYsMhQy8cNAavWZjqSYJcRhM
 ipkTqdiPsxfwYndeChiOFZeSGmXkVLhBShHqabfOIPNaJgftG3/hHEQ3LZzZ5YJ9WxJi
 Jk0cuFNTBS/QsyJVpfjdqJBtK5w3bNkX1gPlSwLW33bjPqZbt7gClqHWRk1shtCgL3St
 IT6A==
X-Gm-Message-State: AOAM531Xuk5J2X/qGvCtjFijmhVeJonrcwbxhhvSGiJaJbHdoYwXjSD1
 ZSM/ZC09zwvDmIpMoHzaXRdCViM/lYbBVX0Q
X-Google-Smtp-Source: ABdhPJywveMidt4/e57hl8eEyBcYSOyCCUhd5x9XtTRmTYAj/r/rHiq9Oz3XsLdH6qy6VOddsTRFfg==
X-Received: by 2002:a1c:a551:: with SMTP id o78mr3315971wme.4.1600242719437;
 Wed, 16 Sep 2020 00:51:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m10sm3771805wmi.9.2020.09.16.00.51.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 00:51:58 -0700 (PDT)
Date: Wed, 16 Sep 2020 09:51:56 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: christian.koenig@amd.com
Subject: Re: [PATCH -next 0/8] drm/amd/amdgpu: fix comparison pointer to bool
 warning
Message-ID: <20200916075156.GU438822@phenom.ffwll.local>
Mail-Followup-To: christian.koenig@amd.com,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Alex Deucher <alexdeucher@gmail.com>, yi.zhang@huawei.com,
 Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Zheng Bin <zhengbin13@huawei.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "Deucher, Alexander" <alexander.deucher@amd.com>
References: <20200909130720.105234-1-zhengbin13@huawei.com>
 <1fce0f2a-3777-e6d8-5a09-30261f843cfd@amd.com>
 <CADnq5_NoeFbBAMT6s_ictVXsUc2tx1U48MLxnMbAr2Sd58jyYA@mail.gmail.com>
 <20200915193549.GP6112@intel.com>
 <6658f89f-6957-e6ea-af41-7625f1fd3cb1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6658f89f-6957-e6ea-af41-7625f1fd3cb1@gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Zheng Bin <zhengbin13@huawei.com>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 16, 2020 at 09:38:34AM +0200, Christian K=F6nig wrote:
> Am 15.09.20 um 21:35 schrieb Ville Syrj=E4l=E4:
> > On Tue, Sep 15, 2020 at 03:16:32PM -0400, Alex Deucher wrote:
> > > I question the value of these warnings.  Why even have a boolean type
> > > if you are going to get warnings when you use them...
> > > That said, applied to avoid getting these patches again and again
> > > every time someone sees this.
> > if (this_is_sparta)
> > if (this_is_sparta =3D=3D true)
> > if (this_is_sparta !=3D false)
> > =

> > I think the first one reads the best, and avoids having to
> > decide between truth and falsehood :)
> =

> +1

+1, especially because we also have the inversion when using negative
errno codes for failures and 0 as success, which results in

	if (errno =3D=3D 0) /* success case */

but
	if (bool =3D=3D 0) /* failure case */

now creative people do sometimes

	if (!errno) /* success case */

which I think is horribly confusing. So imo for more easier telling apart
of these too I think consistently using the short form for booleans, and
consistently using the more explicit long form for errno checks is a Very
Good Pattern :-)

Cheers, Daniel

> =

> Christian.
> =

> > =

> > > Alex
> > > =

> > > On Wed, Sep 9, 2020 at 9:21 AM Christian K=F6nig <christian.koenig@am=
d.com> wrote:
> > > > Acked-by: Christian K=F6nig <christian.koenig@amd.com> for the seri=
es.
> > > > =

> > > > Am 09.09.20 um 15:07 schrieb Zheng Bin:
> > > > > Zheng Bin (8):
> > > > >     drm/amd/amdgpu: fix comparison pointer to bool warning in gfx=
_v9_0.c
> > > > >     drm/amd/amdgpu: fix comparison pointer to bool warning in gfx=
_v10_0.c
> > > > >     drm/amd/amdgpu: fix comparison pointer to bool warning in sdm=
a_v5_0.c
> > > > >     drm/amd/amdgpu: fix comparison pointer to bool warning in sdm=
a_v5_2.c
> > > > >     drm/amd/amdgpu: fix comparison pointer to bool warning in si.c
> > > > >     drm/amd/amdgpu: fix comparison pointer to bool warning in uvd=
_v6_0.c
> > > > >     drm/amd/amdgpu: fix comparison pointer to bool warning in
> > > > >       amdgpu_atpx_handler.c
> > > > >     drm/amd/amdgpu: fix comparison pointer to bool warning in sdm=
a_v4_0.c
> > > > > =

> > > > >    drivers/gpu/drm/amd/amdgpu/amdgpu_atpx_handler.c | 4 ++--
> > > > >    drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c           | 2 +-
> > > > >    drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c            | 2 +-
> > > > >    drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c           | 4 ++--
> > > > >    drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c           | 2 +-
> > > > >    drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c           | 2 +-
> > > > >    drivers/gpu/drm/amd/amdgpu/si.c                  | 2 +-
> > > > >    drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c            | 4 ++--
> > > > >    8 files changed, 11 insertions(+), 11 deletions(-)
> > > > > =

> > > > > --
> > > > > 2.26.0.106.g9fadedd
> > > > > =

> > > > _______________________________________________
> > > > amd-gfx mailing list
> > > > amd-gfx@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/amd-gfx
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
