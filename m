Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7D99F0632
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 09:18:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7886710EF36;
	Fri, 13 Dec 2024 08:18:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B766B10E1B3;
 Thu, 12 Dec 2024 15:11:06 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id
 e9e14a558f8ab-3a7e108b491so5825715ab.3; 
 Thu, 12 Dec 2024 07:11:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734016266; x=1734621066;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ssJbXj9S86ZMFq4AAoEMts4enR0+grFq1TTr+kMvQ1Y=;
 b=pb86oNWofJwzdDU12ECRIQRhhsAveP1lguRiGXfYd3MjWE7In4qHUWRXj1nmSAp7zH
 zM16jSmlPAv5Iu8ZPHJagUmDrIEe/hZGKCIFb+1NDBib/8LcWWNmfF7s5L7el6to/3Ip
 3Nz6DA1LFSx/O5sCf9a/RiT8o2diJ0Ng2J3pKJ1GORiuPOEpLyLLL022R/ATgTJWsLbW
 bIvq3tsfcYpDDzMnIRIaJGqt7dmbSEd+QeiMYbxyn0XEOIE5Iuv0zLZAC87t9s5Zo7e6
 WYcJkSw6zGP+xy2PeXfwRh0gfK1dQY+rFxP4TMvEi9HaBKeOvYVVUZ5w/0z1j8LO3JXp
 Dstw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPISye97dNPsTnygNBt55vH+BDjPvmRUEf9pFvhshQf0imBTF+5mipMBCUp+Gdixn3W2S1kWgHBVc=@lists.freedesktop.org,
 AJvYcCURm3bY1gNzrGFZZrvZHmDw1nXS5kk8MEhfq7yXtWpaqXUJ+nnZUwlwYauapAif5HUHpQtbRCUxdUnm@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMkN52B48p2Y7DMIZ5JJoCMQHzOJQNS1xJd9V5ylPNziMkM14e
 mDPZ3UkRrnP3XJTaQz1yIighL0/69MCQwwRDlaljzKnkUb4btWl0KGx1aSqhbWjRu+2I3xgVaUE
 wlEQgONgnVJrCG+6IFgnjOtiA2Co=
X-Gm-Gg: ASbGncs2Tdp4B5VZjOUoAdczMDjzw7i6fN41fXwcHNn01gVDbW7hdBl80gZzt6/KaM9
 0OcXCoLsJ2nMW8rHVT8ADedkVTREFsWl36WsJWXJx2PN3onpPGhEPpGw2dtGk06ePq+UHn/4K
X-Google-Smtp-Source: AGHT+IFmzQy4TG7fpPNkrw85OnyDlnJSmPxtT1qVj450PXJsE2+YhTAr0UDioDTcdqE0Yc236kDUiKhSDPkPrcWl+Us=
X-Received: by 2002:a05:6e02:1e0a:b0:3a7:d792:d6e9 with SMTP id
 e9e14a558f8ab-3ae58d8295dmr4221125ab.22.1734016265672; Thu, 12 Dec 2024
 07:11:05 -0800 (PST)
MIME-Version: 1.0
References: <20241208151727.71695-1-emaste@FreeBSD.org>
 <Z1jMZNgMssHyAzg2@intel.com>
 <2024121153-shawl-spearman-8e5f@gregkh>
In-Reply-To: <2024121153-shawl-spearman-8e5f@gregkh>
From: Ed Maste <emaste@freebsd.org>
Date: Thu, 12 Dec 2024 10:10:54 -0500
Message-ID: <CAPyFy2Aj4kKB7=dG+V32GCvGF1d+ekcyx5zamxjbr6rwLs24jQ@mail.gmail.com>
Subject: Re: [PATCH] drm/i915: Update license on selftest lists to MIT
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, 
 chris.p.wilson@intel.com, intel-gfx@lists.freedesktop.org, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 Arunpravin <Arunpravin.PaneerSelvam@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, 
 Jason Ekstrand <jason@jlekstrand.net>, Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 13 Dec 2024 08:18:23 +0000
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

On Wed, 11 Dec 2024 at 02:25, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Dec 10, 2024 at 06:19:00PM -0500, Rodrigo Vivi wrote:
> > On Sun, Dec 08, 2024 at 03:17:27PM +0000, Ed Maste wrote:
> > > These two files (i915_live_selftests.h, i915_mock_selftests.h) were
> > > introduced in commit 953c7f82eb89 ("drm/i915: Provide a hook for
> > > selftests") and are effectively just a list of selftests.
> > >
> > > The selftest implementation itself is largely in i915_selftest.c, and
> > > uses a MIT license.  Graphics drivers are shared with other operating
> > > systems and have long used a permissive license (or dual license) to
> > > facilitate this.
> > >
> > > The two selftest list files carried no license when introduced in
> > > 953c7f82eb89, presumably as they were considered trivial.  Notably th=
e
> > > general selftest header i915_selftest.h (which does have non-trivial
> > > content) also has an MIT license.
> > >
> > > The GPL-2.0 SPDX tag in these two files came from b24413180f56, where
> > > Greg Kroah-Hartman added the tag to all files that had no license.  T=
his
> > > makes sense in general, but it is clear from the context of the origi=
nal
> > > selftest commit here that these files are a trivial part of an otherw=
ise
> > > MIT-licensed patch to a MIT-licensed component, and should have an MI=
T
> > > license.
>
> No, that is not clear, by default, anything without a license gets the
> GPL2 license as that is the license of the entire body of code.

I mean the intent is clear from looking at the original patch in 953c7f82eb=
89:
- drivers/gpu/drm/i915 is generally MIT licensed
- 953c7f82eb89 added these two trivial files with no license text
- that patch also added nontrivial new files with an MIT license

The same sort of issue affected drm/radeon, fixed in b7019ac550eb:

    drm/radeon: fix incorrrect SPDX-License-Identifiers

    radeon is MIT.  This were incorrectly changed in
    commit b24413180f56 ("License cleanup: add SPDX GPL-2.0 license
identifier to files with no license")
    and
    commit d198b34f3855 (".gitignore: add SPDX License Identifier")
    and:
    commit ec8f24b7faaf ("treewide: Add SPDX license identifier -
Makefile/Kconfig")

    Fixes: d198b34f3855 (".gitignore: add SPDX License Identifier")
    Fixes: ec8f24b7faaf ("treewide: Add SPDX license identifier -
Makefile/Kconfig")
    Fixes: b24413180f56 ("License cleanup: add SPDX GPL-2.0 license
identifier to files with no license")
    Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/2053
    Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
    Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

and drm/noveau, fixed in b7019ac550eb:

    drm/nouveau: fix bogus GPL-2 license header

    The bulk SPDX addition made all these files into GPL-2.0 licensed files=
.
    However the remainder of the project is MIT-licensed, these files
    (primarily header files) were simply missing the boiler plate and got
    caught up in the global update.

    Fixes: b24413180f5 (License cleanup: add SPDX GPL-2.0 license
identifier to files with no license)
    Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
    Acked-by: Emil Velikov <emil.l.velikov@gmail.com>
    Acked-by: Karol Herbst <kherbst@redhat.com>
    Signed-off-by: Ben Skeggs <bskeggs@redhat.com>

> > Chris, do you confirm your intention of MIT and not GPL for these files=
?
> >
> > Cc: Greg KH <gregkh@linuxfoundation.org>
> >
> > Greg, is this acceptable?
>
> You need to get a signed-off-by from everyone who has touched these
> files, which is not what you have done here :(

Most of the contributions to these files were done by 13 Intel
employees. Presumably a signed-off-by from someone at Intel is
sufficient for all of them? I've CC'd other contributors to these two
files for a signed-off-by.
