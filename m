Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1060C4E546F
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 15:42:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2C198966B;
	Wed, 23 Mar 2022 14:42:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BD298966B;
 Wed, 23 Mar 2022 14:42:41 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-d4164acd34so1889490fac.4; 
 Wed, 23 Mar 2022 07:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=44hXVR38pi7uKbNL5EITTUlKNy1idCvTiYz/Dr/jHdc=;
 b=lX91QCZRfJrZI2GD8M44M5j8wfkEAn1YGm/S9YxpQfZVLAzfnCai8KNAu3GbaPxX0v
 MZJEcCrmnGI593Auw4rYf8M16OtnaRlvFydd3ziKGPIW1qVrJF0Yy+VPb8ga/LUklUkI
 Lj0x0QnT0aTaPxFu8zvfwgPU9BzIfVZfGsPmlyt7RQwCMb6oUg/voMDieBxcSCuh2azk
 ja1544Trrbz0KA/IDvcNgVRJI9E5V+1lmpIEe0TJO9ko0GP4JVPwZoEP3zQxE03qczOz
 6rWdvxfJmKZus5YQy4FMeQjl8+pDZWn1XIaxke6K7UhumcHnyw+mprA1m6BPegqv36Jd
 BpXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=44hXVR38pi7uKbNL5EITTUlKNy1idCvTiYz/Dr/jHdc=;
 b=KN4UeFKaVpWX3Oc8l7TadIJ8XpNrAv83jlUu5NWyXnQ4GUpgnogoVtGllRrN/aLHjx
 8YLcHeI8BgCFHFLSTbwrHFjevhslovBIAr4YV5suVAHLaJV6ZSX6xant+6niByv/6fqF
 XQHT7Yvy8QVpJBRMGw+Rhl2WMr2j9ibXKSoXi/1uvkjWFRrvTUac1AE+I5OJo2MdgMKE
 ax6zLcMCcUzBLpFgmOBLvcIvofcmAgzYZYPNSUWWx/uBV1qFrqgJ0+KGzcnPSb5ZqKr+
 FdLVNBOlPHfyUJfDmOX6vAx9YikTvo3rhe6c67LWPb6W5BEmaoGYVKyJCU2M7443rQu8
 /yZg==
X-Gm-Message-State: AOAM532K+1HoL3p0+Hmt+OGMiqGVCz/jcNSk017rK+rH3hQ2aWYcgmo/
 NGhDzlfBgszn3Ds2CY4V3D/Cr7S6OBlzZ4GowWI=
X-Google-Smtp-Source: ABdhPJyoqCpJsjN2C/2LC91cIdvD53OWoAYds46B1ezx8I7FBKcWppTvQlJnYLaUS/tYfurs48raWQTTszeE5bsXz9c=
X-Received: by 2002:a05:6871:8ab:b0:dd:b74b:409a with SMTP id
 r43-20020a05687108ab00b000ddb74b409amr4104995oaq.200.1648046560407; Wed, 23
 Mar 2022 07:42:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220323062552.228429-1-Arunpravin.PaneerSelvam@amd.com>
 <7addb3e7-d265-c1a7-d449-7d0056f06d63@molgen.mpg.de>
 <fc60c561-c12a-c031-9558-abae3e3474ec@amd.com>
 <6f0888a2-f74d-f41f-d593-a8362e7dc673@molgen.mpg.de>
 <398f8851-d37b-4020-24ce-8f2ab9723e40@amd.com>
 <CAPj87rMETV9UkpbGRYAT3mjVhRtW75m0e9OLON6_+gdcD0Fo2Q@mail.gmail.com>
In-Reply-To: <CAPj87rMETV9UkpbGRYAT3mjVhRtW75m0e9OLON6_+gdcD0Fo2Q@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 23 Mar 2022 10:42:29 -0400
Message-ID: <CADnq5_NuaN_ZziNipdqvvTQ41you==VqJg5oxQovowokaJ2K1Q@mail.gmail.com>
Subject: Re: Commit messages (was: [PATCH v11] drm/amdgpu: add drm buddy
 support to amdgpu)
To: Daniel Stone <daniel@fooishbar.org>
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

On Wed, Mar 23, 2022 at 10:00 AM Daniel Stone <daniel@fooishbar.org> wrote:
>
> On Wed, 23 Mar 2022 at 08:19, Christian K=C3=B6nig <christian.koenig@amd.=
com> wrote:
> > Am 23.03.22 um 09:10 schrieb Paul Menzel:
> > > Sorry, I disagree. The motivation needs to be part of the commit
> > > message. For example see recent discussion on the LWN article
> > > *Donenfeld: Random number generator enhancements for Linux 5.17 and
> > > 5.18* [1].
> > >
> > > How much the commit message should be extended, I do not know, but th=
e
> > > current state is insufficient (too terse).
> >
> > Well the key point is it's not about you to judge that.
> >
> > If you want to complain about the commit message then come to me with
> > that and don't request information which isn't supposed to be publicly
> > available.
> >
> > So to make it clear: The information is intentionally hold back and not
> > made public.
>
> In that case, the code isn't suitable to be merged into upstream
> trees; it can be resubmitted when it can be explained.

So you are saying we need to publish the problematic RTL to be able to
fix a HW bug in the kernel?  That seems a little unreasonable.  Also,
links to internal documents or bug trackers don't provide much value
to the community since they can't access them.  In general, adding
internal documents to commit messages is frowned on.

Alex
