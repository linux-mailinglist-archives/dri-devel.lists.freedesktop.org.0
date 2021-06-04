Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D829739B05A
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 04:27:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 116646F564;
	Fri,  4 Jun 2021 02:27:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 411706F562;
 Fri,  4 Jun 2021 02:27:09 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id h9so8345078oih.4;
 Thu, 03 Jun 2021 19:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pE5R9j4HEkPd8MdPqUgxVbiZqCWuyrT3IDLp/mbt3qY=;
 b=Np2g+MNLp25WhMdkzaTHezh5gMyacMltrtvwl7SZF6bT2q3BfvHaKJW1n2DSpPcRZk
 0aNsbWUHE0H2ETqjGD5wAQoxdHK9J1ulleTkRBNhLFmlP8r8JrDy4n+N9wx7CB7sfSBA
 BXjuGHNQQas3bptTIstPMc8pLCGXGWEXQTnnZpewxX4BEwviB8DJBtNL0j5OICj1OLwC
 UoZX7he46V4vT8dYRScKOvSYQ2iSZL1uko6Gd4qPPwKGMlNEBsIG8zXxaiIJ2z15IsEf
 EXHaDUL2OPV6NVnmUkypSBba3EdsPYH+1CLxeNjqpeuA9DL1m4ybo4kiMv/bgHY8I/lC
 MAKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pE5R9j4HEkPd8MdPqUgxVbiZqCWuyrT3IDLp/mbt3qY=;
 b=K9sErgWC4yS6T9/61gNHppd4iepn+6ASMtw3TsDWPE8lv1apQeuG03Le2ov08S9M52
 j3s8TzaoLW5VbtBrJ7UcynOlPNJNLWvL4SVAyA/BjJjYZ+CsDqZES6uGQtDPYCcRXqma
 EV+YYTgYxE59t5A5+8ZcZWLa7FPYb4iA00xAY+/xjvlGUrNYbZkRtk4zCdR4QaUK5KK+
 JXnc2lVgSUkK3Lqq1/Xnm93KTPFj+5ly+7K+E8wCJ2rhFle6TbO0fTEu4J+x5bsFURhS
 f4lOLKZoqi16cbGJP57LU78ipGfivb1PCsL2MTofgxDYYLA20Xky0YeZByduZKT7Qa1o
 IQSA==
X-Gm-Message-State: AOAM532rXWgzgiWaEC/hhqq8J0HlmbaNRQfkGIhykbTClTGo8/B0sMZF
 ty7Iez4hSntM0gMDwv+goNDvsp8xC5aMl0sTfh0=
X-Google-Smtp-Source: ABdhPJyDcRuVRzgC8zDo9W6dLEycPTgTGFW2pEFgCL3sMqXZzx0a4PKbnKfzlUBri+5gjHGvn5BOUDiTctWAtio7YMo=
X-Received: by 2002:a05:6808:1592:: with SMTP id
 t18mr1466289oiw.123.1622773628625; 
 Thu, 03 Jun 2021 19:27:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210601201702.23316-1-andrey.grodzovsky@amd.com>
 <CADnq5_Nfs_j9XE1Siou2wGYuwd5cvTD1T7m9gFpS9z74D=AuAQ@mail.gmail.com>
 <SN6PR12MB46230F8575C786B53056FE79EA3C9@SN6PR12MB4623.namprd12.prod.outlook.com>
In-Reply-To: <SN6PR12MB46230F8575C786B53056FE79EA3C9@SN6PR12MB4623.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 3 Jun 2021 22:26:57 -0400
Message-ID: <CADnq5_OHQ3Dtq3ZikvDPR=pSubSBq0pN_uRkXW8FaVcbr2pWAQ@mail.gmail.com>
Subject: Re: [PATCH 0/7] libdrm tests for hot-unplug fe goature
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Code review happens on gitlab now for libdrm.

Alex

On Thu, Jun 3, 2021 at 6:02 PM Grodzovsky, Andrey
<Andrey.Grodzovsky@amd.com> wrote:
>
> Is libdrm on gitlab ? I wasn't aware of this. I assumed code reviews stil=
l go through dri-devel.
>
> Andrey
>
> ________________________________
> From: Alex Deucher <alexdeucher@gmail.com>
> Sent: 03 June 2021 17:20
> To: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>
> Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>; amd-g=
fx list <amd-gfx@lists.freedesktop.org>; Deucher, Alexander <Alexander.Deuc=
her@amd.com>; Christian K=C3=B6nig <ckoenig.leichtzumerken@gmail.com>
> Subject: Re: [PATCH 0/7] libdrm tests for hot-unplug feature
>
> Please open a gitlab MR for these.
>
> Alex
>
> On Tue, Jun 1, 2021 at 4:17 PM Andrey Grodzovsky
> <andrey.grodzovsky@amd.com> wrote:
> >
> > Adding some tests to acompany the recently added hot-unplug
> > feature. For now the test suite is disabled until the feature
> > propagates from drm-misc-next to drm-next.
> >
> > Andrey Grodzovsky (7):
> >   tests/amdgpu: Fix valgrind warning
> >   xf86drm: Add function to retrieve char device path
> >   test/amdgpu: Add helper functions for hot unplug
> >   test/amdgpu/hotunplug: Add test suite for GPU unplug
> >   test/amdgpu/hotunplug: Add basic test
> >   tests/amdgpu/hotunplug: Add unplug with cs test.
> >   tests/amdgpu/hotunplug: Add hotunplug with exported bo test
> >
> >  tests/amdgpu/amdgpu_test.c     |  42 +++-
> >  tests/amdgpu/amdgpu_test.h     |  26 +++
> >  tests/amdgpu/basic_tests.c     |   5 +-
> >  tests/amdgpu/hotunplug_tests.c | 357 +++++++++++++++++++++++++++++++++
> >  tests/amdgpu/meson.build       |   1 +
> >  xf86drm.c                      |  23 +++
> >  xf86drm.h                      |   1 +
> >  7 files changed, 450 insertions(+), 5 deletions(-)
> >  create mode 100644 tests/amdgpu/hotunplug_tests.c
> >
> > --
> > 2.25.1
> >
> > _______________________________________________
> > amd-gfx mailing list
> > amd-gfx@lists.freedesktop.org
> > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flis=
ts.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=3D04%7C01%7Candr=
ey.grodzovsky%40amd.com%7C8fb7f614798b4d19572e08d926d57530%7C3dd8961fe4884e=
608e11a82d994e183d%7C0%7C0%7C637583520507282588%7CUnknown%7CTWFpbGZsb3d8eyJ=
WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;=
sdata=3DozqlNQACGvLJugQ2GNvFl8CKgAH0thqMRpWjHpURlyc%3D&amp;reserved=3D0
