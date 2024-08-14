Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AE69522AF
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 21:30:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72D5E10E52F;
	Wed, 14 Aug 2024 19:30:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YD5zVgsF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28D9810E52F;
 Wed, 14 Aug 2024 19:30:10 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-1ff67158052so1759695ad.0; 
 Wed, 14 Aug 2024 12:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723663809; x=1724268609; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2orC+qE4+JgnSpowxeNtJQNLuO+iy/rKh6rk9hYX5eQ=;
 b=YD5zVgsFpqP/dC0ulSGCcTv+ptVgDwD/n/517LMXoDo1k8kVfKD1+pDMR9aoAmKHuJ
 IKWNMV547VUe8ZzsHCE5fSimO7tE/+VHRwFOt8YhfHth+m0rl6iF0hUGycCFs7Vun0XX
 6K7jTYUfa9Pm2FmEN6d55wK1hhNmXgjlNc+1LNDTwluxjNEPAU/r180ahKHLlNyt/Vi0
 4CLk0WsY9F4/zk+/qjpR3b0JM/pJoz7vCa005Z4pP0pLQVg7A6T71Xu7qB4FhZIRuf3Z
 ymuydmp9WMIBqIozKPtVVk5jl9IIbejFpeQOIBy6zGVttXz9+1NQ9uiChgooKx+nvyVF
 urOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723663809; x=1724268609;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2orC+qE4+JgnSpowxeNtJQNLuO+iy/rKh6rk9hYX5eQ=;
 b=GaYfh0w/GyEO41s0nHrF/C91xF64gupjzNOQJxYMxUjIwdf5nGzWJPlza9xbc/Su3T
 Y2gbWsyFTZCE3XRotI7qkbTGuSdY/IcM1+NQjFaMtz6Ki+w6LzwK0M5+N4IkW4h2ZG36
 geUJYKEXfXHN1ZUTUV7fJVquRRpzzXQ6qdgiz9Ec328qNAp42pZLHKu5U5Uf+h5537zN
 ko23BleCmXY6m4bN9IMyDw5V/OVemOcxOabjXcyyPoErDd/RsBbIfiFUWx/EBi5BU6MK
 heVH3iC0CpXUiBbGg0vNDEHoRUUqvbNrUbk/Kwwv4/4KCSM+AYpngGpgfW5krVhxPSsw
 0AIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaqq+zsC2tbJzt9aGRetJoYkBNWVFefxi4JWNwMTsTE3hzbTSs7WvGIjllUY/wiJyscOVOJduEzZahRXjZHkau04UKYh90FHez4OjRTjBl
X-Gm-Message-State: AOJu0YzPPP5uoEhMZshUHRUCIfyz8DD4gNepNxFhaFy67Mmn8J/AyOsp
 WEo0hfpwM2MOByRVsGJt5qBnDADJCsFfmNVf+67hAcYR4HEs3c2QOH5zf7zUP+0uRRcN9J3YHte
 FZXL9JjHVGZk/WbRethzRcjWtZLM=
X-Google-Smtp-Source: AGHT+IHzARyOZOqSFNAjYmj2+ulO0fvklY9400IzG1zvOPK+AV5vzIrPm4MC4kcom2idbw8b65sYapngSwa3msyPS6E=
X-Received: by 2002:a17:902:ecc4:b0:1ff:54a2:161b with SMTP id
 d9443c01a7336-201d647e620mr51176815ad.39.1723663809469; Wed, 14 Aug 2024
 12:30:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230724211428.3831636-1-michal.winiarski@intel.com>
 <CADnq5_NwDn5DXPadzZtegUJ=y=LfVHykO7kG3edmiqRTTCxMNQ@mail.gmail.com>
 <nqsuaaibncfcnu3d5376ulujxfswbjwq3ptrivh6djpmvcpuih@fepbhcbik272>
In-Reply-To: <nqsuaaibncfcnu3d5376ulujxfswbjwq3ptrivh6djpmvcpuih@fepbhcbik272>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 14 Aug 2024 15:29:57 -0400
Message-ID: <CADnq5_Nsx4ii4RnhB4J878naLajOWM6aAHYHzJ6mZyzdAEj7tA@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] drm: Use full allocated minor range for DRM
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, 
 Pekka Paalanen <pekka.paalanen@collabora.com>, David Airlie <airlied@linux.ie>,
 Oded Gabbay <ogabbay@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Emil Velikov <emil.l.velikov@gmail.com>, Matthew Wilcox <willy@infradead.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, James Zhu <James.Zhu@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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

On Tue, Aug 13, 2024 at 8:19=E2=80=AFPM Micha=C5=82 Winiarski
<michal.winiarski@intel.com> wrote:
>
> On Mon, Aug 12, 2024 at 01:38:38PM GMT, Alex Deucher wrote:
> > Are there any objections to this series?  We have been running into
> > this limit as a problem for a while now on big servers.
>
> I don't think there were any objections, just a general lack of
> interest - so there are no R-b / Acks.
> If you're interested to have a go at it - I can resend it.
> It should still apply on latest drm-tip.

Yeah that would be great!

Thanks,

Alex

>
> -Micha=C5=82
>
> >
> > Alex
> >
> > On Mon, Jul 24, 2023 at 5:15=E2=80=AFPM Micha=C5=82 Winiarski
> > <michal.winiarski@intel.com> wrote:
> > >
> > > 64 DRM device nodes is not enough for everyone.
> > > Upgrade it to ~512K (which definitely is more than enough).
> > >
> > > To allow testing userspace support for >64 devices, add additional DR=
M
> > > modparam (force_extended_minors) which causes DRM to skip allocating =
minors
> > > in 0-192 range.
> > > Additionally - convert minors to use XArray instead of IDR to simplif=
y the
> > > locking.
> > >
> > > v1 -> v2:
> > > Don't touch DRM_MINOR_CONTROL and its range (Simon Ser)
> > >
> > > v2 -> v3:
> > > Don't use legacy scheme for >=3D192 minor range (Dave Airlie)
> > > Add modparam for testing (Dave Airlie)
> > > Add lockdep annotation for IDR (Daniel Vetter)
> > >
> > > v3 -> v4:
> > > Convert from IDR to XArray (Matthew Wilcox)
> > >
> > > v4 -> v5:
> > > Fixup IDR to XArray conversion (Matthew Wilcox)
> > >
> > > v5 -> v6:
> > > Also convert Accel to XArray
> > > Rename skip_legacy_minors to force_extended_minors
> > >
> > > Micha=C5=82 Winiarski (4):
> > >   drm: Use XArray instead of IDR for minors
> > >   accel: Use XArray instead of IDR for minors
> > >   drm: Expand max DRM device number to full MINORBITS
> > >   drm: Introduce force_extended_minors modparam
> > >
> > >  drivers/accel/drm_accel.c      | 110 +++----------------------------=
--
> > >  drivers/gpu/drm/drm_drv.c      | 105 ++++++++++++++++---------------
> > >  drivers/gpu/drm/drm_file.c     |   2 +-
> > >  drivers/gpu/drm/drm_internal.h |   4 --
> > >  include/drm/drm_accel.h        |  18 +-----
> > >  include/drm/drm_file.h         |   5 ++
> > >  6 files changed, 69 insertions(+), 175 deletions(-)
> > >
> > > --
> > > 2.41.0
> > >
