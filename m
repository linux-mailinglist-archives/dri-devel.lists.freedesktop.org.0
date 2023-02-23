Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A11EC6A0FBA
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 19:50:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C81C89453;
	Thu, 23 Feb 2023 18:50:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B1EA10E0E7;
 Thu, 23 Feb 2023 18:50:44 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id w7so13708148oik.13;
 Thu, 23 Feb 2023 10:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ARZg8CI0DmkxcAqakyNYDp5pNgWzgrAE0Y0kgWEl3S8=;
 b=piFKuwhzWdJUMIIQd02K8KLtj1aM6ocgBUJiRCQkBe1OFfWXkAyyNiZJveN4ZL6Yz3
 ffh55ELBSjJvWyhLjeRgRWND8ZYXdNCEunGlPIH093BlmknN6vCXavj6mJG8AEp+88xR
 Q6LRmW2TkY9Y98ki1KjlLu3u00/hoDSAosQgDpjLkuZRIOcrC/8SX8SxeL1DyDs+3+cb
 QHdJlq7gFzW3LAhtbUDdlSSs0Q9bzViD3TsRk9Nv4f+RiDTqiLxOF8wPwXhMw+DT0LYS
 VT+Hg075gGCGmd7jWKnBcTFxsWs/er3sGwPBApKpb40V61ozA0F+o08Dro11Gh9I9adf
 iOIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ARZg8CI0DmkxcAqakyNYDp5pNgWzgrAE0Y0kgWEl3S8=;
 b=OD8tk3QK71Y6xIEDY26AZ7Q+dxFHEi90DTlVZCZ/lJa5vLLYMgCfMULs6CaY55qYeU
 1wOJbGN2gt2sAsHn3dFZBFLb7zDgaMTogRT4gDYl/crWyD8wB2Bd7M/hv9jWr05kTUDQ
 tCvxKHcum+LhhQJCJXs3EuJMhr50XWcnFR9W7FFEnHUJfXaiYny+CAsH+VZ7i1kgp88G
 ini5N63hMI2ak9ZcExCNl3wlquOUIdPpyNtFruU3HbknEeBCsxGSkUGgfJdIbaGDNScX
 EFmzF3gBnc97mUcVSGtar0sEB1SUZ0skRG+YPpiLadK3aGuvhYdJjw4ZR9UqnccHS7Qo
 hQ4Q==
X-Gm-Message-State: AO0yUKXNI/LrEXK9OMmA9onOTP4E4KW5FCPU+RdYeo0aFg9KivyUZtnQ
 E7WXAkFIbioGx2Roh+FXvH9q1XWr7tlPZEc0GJY=
X-Google-Smtp-Source: AK7set9XAWuVurSF+q0ktwhVjKh68jhcdUgJm4/ILNF2HLzPSPqvFffvVRPyKJ/hTS7e9e5YWjUmsAroqhugyHs2CdQ=
X-Received: by 2002:a54:4019:0:b0:37f:a2d3:db8d with SMTP id
 x25-20020a544019000000b0037fa2d3db8dmr260469oie.8.1677178242062; Thu, 23 Feb
 2023 10:50:42 -0800 (PST)
MIME-Version: 1.0
References: <20230216162729.219979-1-thomas.hellstrom@linux.intel.com>
 <Y+6PqOdRf+vu8rZc@phenom.ffwll.local>
 <699c33d7-6788-99ab-6787-1cebff0bf70e@linux.intel.com>
In-Reply-To: <699c33d7-6788-99ab-6787-1cebff0bf70e@linux.intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 23 Feb 2023 13:50:30 -0500
Message-ID: <CADnq5_Mfp4pCnVcsWn_vMO-hWcMhH_yb8MHccyp_jEL=XxgZNg@mail.gmail.com>
Subject: Re: [PATCH 0/1] drm: Add a gpu page-table walker
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 23, 2023 at 10:03 AM Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> Hi, Daniel,
>
> On 2/16/23 21:18, Daniel Vetter wrote:
> > On Thu, Feb 16, 2023 at 05:27:28PM +0100, Thomas Hellstr=C3=B6m wrote:
> >> A slightly unusual cover letter for a single patch.
> >>
> >> The page table walker is currently used by the xe driver only,
> >> but the code is generic so we can be good citizens and add it to drm
> >> as a helper, for possible use by other drivers,
> >> If so we can merge the commit when we merge the xe driver.
> >>
> >> The question raised here is
> >> *) Should it be a generic drm helper or xe-specific with changed
> >>     prefixes?
> > I think if there's some other drivers interested in using this, then th=
is
> > sounds like a good idea. Maybe more useful if it's also integrated into
> > the vm/vma helpers that are being discussed as an optional part?
> >
> > Maybe some good old sales pitching here to convince people would be goo=
d.
> >
> > Maybe one of the new accel drivers is interested in this too?
>
> Thanks for your thoughts on this. Yeah, I think it's a bit awkward to
> push for having code generic when there is only one user, and the
> prospect of having other drivers rewrite their page-table building code
> based on this helper in the near future is probably small. Perhaps more
> of interest to new drivers. I think what will happen otherwise is that
> during some future cleanup this will be pushed down to xe claiming it's
> the only user.
>
> I wonder whether it might be an idea to maintain a small document where
> driver writers can list suggestions for code that could be lifted to
> core drm and be reused by others. That way both reviewers and writers of
> other drivers can keep an eye on that document and use it to avoid
> duplicating code. The procedure would then be to lift it to core drm and
> fix up prefixes as soon as we have two or more users.
>
> Thoughts?

FWIW, when we originally wrote the GPU scheduler it was part of
amdgpu, but we consciously kept any AMD-isms out of it so it could be
lifted up to a core component when another user came along.  Maybe
some comments in the top of those files to that effect to maintain the
separation.

Alex


>
> Thomas
>
>
> >
> >> *) If a drm helper, should we use a config option?
> > I am no fan of Kconfig things tbh. Maybe just include it in the vma
> > helpers, or perhaps we want to do a drm-accel-helpers with gem helpers,
> > drm/sched, this one here, vm/vma helpers or whatever they will be and s=
o
> > on? Kinda like we have modeset helpers.
> >
> > I'd definitely not go for a Kconfig per individual file, that's just
> > excessive.
> > -Daniel
> >
> >> For usage examples, see xe_pt.c
> >> https://gitlab.freedesktop.org/drm/xe/kernel/-/blob/drm-xe-next/driver=
s/gpu/drm/xe/xe_pt.c
> >>
> >> Thanks,
> >> Thomas
> >>
> >> Thomas Hellstr=C3=B6m (1):
> >>    drm: Add a gpu page-table walker helper
> >>
> >>   drivers/gpu/drm/Makefile      |   1 +
> >>   drivers/gpu/drm/drm_pt_walk.c | 159 ++++++++++++++++++++++++++++++++=
+
> >>   include/drm/drm_pt_walk.h     | 161 ++++++++++++++++++++++++++++++++=
++
> >>   3 files changed, 321 insertions(+)
> >>   create mode 100644 drivers/gpu/drm/drm_pt_walk.c
> >>   create mode 100644 include/drm/drm_pt_walk.h
> >>
> >> --
> >> 2.34.1
> >>
