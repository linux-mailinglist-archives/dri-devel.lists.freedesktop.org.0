Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8CE6EAD6F
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 16:50:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A61B10EE27;
	Fri, 21 Apr 2023 14:50:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 789FD10E0F9;
 Fri, 21 Apr 2023 14:50:36 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-38c00f19654so965239b6e.2; 
 Fri, 21 Apr 2023 07:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682088635; x=1684680635;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uRjexQPiKz+B2BoQne8GUJoVgOLR1S5xgnBzy2+vwS4=;
 b=S7tpiJ76bxam24ay+dcwU+lkgG2ZoXHiFLIxoeyfj0+byI5iBcx2l450tz/2E9W8Wv
 b2h1L2cKiG0giw0hS0j98+cO3L366V7krcddHCwHkASJvfLpeM1FNBX29DeFzKVh3G34
 a7b/LCvTbz5lb1xvsNRe1aDyrIZsxnCXKJpbsDu6xDE9mCJT3BNOINWuQIRouVYItqSR
 kFKqhN1jMPp49WdARMC+fHrYBKjrrzAV2Ur6+K8MVn5ogGN8b/LAW60v9wpnfwGVi2ch
 BDETaur+SB248K1SD7jdeJlFEBGJj7fplxuO+978tWeU85YbmzhZcOSHTvnuH1lmYFI5
 6H7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682088635; x=1684680635;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uRjexQPiKz+B2BoQne8GUJoVgOLR1S5xgnBzy2+vwS4=;
 b=G+vPZxQcbn4ueJVXo+1c43f6crz8fLlj63QCVhMouraO9h3G/c/BMk4kY2fCUCuS0I
 Ycgu/Ph/a6NwtzwUDk4Baksuj0Rlea7HVlelVFqZ4yIkrS/qhE+WRPTCh/oVcX9CBkEl
 3kezR+M03h3ubihI3NuQNBx4CuD1hu4L06lWmsgdpFqlCit7EDkxs4rreoyLvZlkX3hl
 h6VKLS6GmxcdUToikmtgQBT4u4E+tldv1Ny0kTst+TEIqGWRst798jUFbmkRdJINb2zo
 bDIkas8xrzuf48V83Yk0erzWLP/WzNhVwJ+JDEI5pR9B/+Ug2jwvujK7VacRXUWt10/7
 fXuQ==
X-Gm-Message-State: AAQBX9drr2kZAaO8+TRY5ItHAuc8Q/qoxaMIyTLNN40q+MtWRWRKJp/D
 GHLrcjK+LDYG1C1ZeTWkZZSaEsjQI48TAjtxOf4=
X-Google-Smtp-Source: AKy350bmODRxJ669T9aGlnSwZYMJcgHKiq97d08P1iIzkniXSqIQpuU4ytOyTsxnikkTRNNNv7oGLN7hwliarNBmLVQ=
X-Received: by 2002:a05:6808:f03:b0:38d:ef77:d720 with SMTP id
 m3-20020a0568080f0300b0038def77d720mr3059404oiw.52.1682088635133; Fri, 21 Apr
 2023 07:50:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230412224311.23511-1-robdclark@gmail.com>
 <20230412224311.23511-6-robdclark@gmail.com>
 <CACvgo525ogS4LSZDUyaqjSqjJWj=qLRkphji5469=3obFXoMrQ@mail.gmail.com>
 <f2a423c2-302a-024a-cf65-199f4be6caec@linux.intel.com>
 <CACvgo53dP03r1BuxntyyoYjua5k6XPvVhu4iTGqXJq31UMUgxg@mail.gmail.com>
 <e16dc626-30bf-be19-8668-bdc14dfd051a@linux.intel.com>
In-Reply-To: <e16dc626-30bf-be19-8668-bdc14dfd051a@linux.intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 21 Apr 2023 07:50:24 -0700
Message-ID: <CAF6AEGv1B3gzM5sazA5kaPbU29aP-njygx-nOnsVjip1ZwERLg@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] drm: Add fdinfo memory stats
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, linux-arm-msm@vger.kernel.org,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 21, 2023 at 4:59=E2=80=AFAM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 21/04/2023 12:45, Emil Velikov wrote:
> > On Fri, 21 Apr 2023 at 12:23, Tvrtko Ursulin
> > <tvrtko.ursulin@linux.intel.com> wrote:
> >
> >> On 21/04/2023 11:26, Emil Velikov wrote:
> >>> On Wed, 12 Apr 2023 at 23:43, Rob Clark <robdclark@gmail.com> wrote:
> >>>
> >>>> +/**
> >>>> + * enum drm_gem_object_status - bitmask of object state for fdinfo =
reporting
> >>>> + * @DRM_GEM_OBJECT_RESIDENT: object is resident in memory (ie. not =
unpinned)
> >>>> + * @DRM_GEM_OBJECT_PURGEABLE: object marked as purgeable by userspa=
ce
> >>>> + *
> >>>> + * Bitmask of status used for fdinfo memory stats, see &drm_gem_obj=
ect_funcs.status
> >>>> + * and drm_show_fdinfo().  Note that an object can DRM_GEM_OBJECT_P=
URGEABLE if
> >>>> + * it still active or not resident, in which case drm_show_fdinfo()=
 will not
> >>>
> >>> nit: s/can/can be/;s/if it still/if it is still/
> >>>
> >>>> + * account for it as purgeable.  So drivers do not need to check if=
 the buffer
> >>>> + * is idle and resident to return this bit.  (Ie. userspace can mar=
k a buffer
> >>>> + * as purgeable even while it is still busy on the GPU.. it does no=
t _actually_
> >>>> + * become puregeable until it becomes idle.  The status gem object =
func does
> >>>
> >>> nit: s/puregeable/purgeable/
> >>>
> >>>
> >>> I think we want a similar note in the drm-usage-stats.rst file.
> >>>
> >>> With the above the whole series is:
> >>> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
> >>
> >> Have you maybe noticed my slightly alternative proposal? (*) I am not =
a
> >> fan of putting this flavour of accounting into the core with no way to
> >> opt out. I think it leaves no option but to add more keys in the futur=
e
> >> for any driver which will not be happy with the core accounting.
> >>
> >> *) https://patchwork.freedesktop.org/series/116581/
> >>
> >
> > Indeed I saw it. Not a fan of it, I'm afraid.
>
> Hard to guess the reasons. :)
>
> Anyway, at a minimum I suggest that if the no opt out version has to go
> in, it is clearly documented drm-*-memory-* is *not* about the full
> memory use of the client, but about memory belonging to user visible
> buffer objects *only*. Possibly going as far as naming the keys as
> drm-user-bo-memory-... That way there is a way to implement proper
> drm-*-memory- in the future.

I'll go back to the helper approach, just been distracted by a few
other balls in the air.. should hopefully get to it in the next couple
days

BR,
-R

> Regards,
>
> Tvrtko
>
> >>> Fwiw: Keeping the i915 patch as part of this series would be great.
> >>> Sure i915_drm_client->id becomes dead code, but it's a piece one can
> >>> live with for a release or two. Then again it's not my call to make.
> >>
> >> Rob can take the i915 patch from my RFC too.
> >>
> >
> > Indeed.
> >
> > -Emil
