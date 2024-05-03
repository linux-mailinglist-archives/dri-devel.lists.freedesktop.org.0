Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF2A8BB074
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 17:58:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C5A910F981;
	Fri,  3 May 2024 15:58:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NhWT/WL7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA2310E50A;
 Fri,  3 May 2024 15:58:39 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-2b346712919so1990637a91.2; 
 Fri, 03 May 2024 08:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714751919; x=1715356719; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=72UIEfLXF/6zj8meHlKcjDQs+enqdmnO7yPDtKWxD2Q=;
 b=NhWT/WL7i7CoPyLrSt9CrMqEwOL9+QDWmOGiKkf+LDMHeXz1D7g+zuVE2pxFs0vAl4
 1ZCIvhGLtykjXQMtQ+PTS4RQDYtGFQlxlaxh/0lKHa1u+zrXJHLo0eTfQM7tAaHpUR9o
 cJ/8yP0pFXMdBk79ZYEjN3WoPfbJa8q36LlEAbHGbQ6gl2n2/5k8trb5M4FWSKBWSVKZ
 P4+Th2YPjpiVviDfjhlwQfQmy4MOtk/P0+rq32O3RM4DZfTyyn8tlzwhjGiGoYjdPsj+
 paCy3JiLZ6xSBhXGS05//4Saz5aYAEi3PYF8TuxuFBuBNjVf2nO4sOLr8YrgCzU1ztdn
 dfRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714751919; x=1715356719;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=72UIEfLXF/6zj8meHlKcjDQs+enqdmnO7yPDtKWxD2Q=;
 b=nFmRwoHm/P33O/A2bb2pqSNbjAY0t+wmLJ78pJjOQJiUj7s38mBl1eiFYW/6rDwXho
 gZ1/KOzdT5enf1n3B81NWsrBNAMlr/oxk8bQtjJtpVDyVLfqxcRWfL4LHNbsRrmuS7/b
 42JeIp/u7JZ11o6SVgwSvRV8PEdA+hyXP6EQ6DvdpOG0mPNm5UUYoE8loPRXXofQvBrI
 UiBerTXxgfgMeldsKS+HRHUS5Bl+gFyxhUy7OkoJ0A57isW/Ie19WvytilXuUzbczRp4
 3SgrE5gh+RQvbKxHLIHBO/ey40ugcobBr79MGFv3m/1sgXu9fznsXPoUNYoS2OyZR099
 dYkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHqhkCp72zDwUZLLru+rBlk63GT0A727U3nVRWB1NBAljdrATal8zgEKSIezJIw03OIYmswphB1WY1gGr6dQoxDOO0snq4XnmChx23qUEGWxI2OKG6nXkSu913Qfs1jZ59KyG3gdqL7ceLavqmBg==
X-Gm-Message-State: AOJu0Yzp+WyC1c/0QFmC0PMNu3+8ARPADhEwgscgqqwmDahFdPc+BfMV
 WK74NCjT7EMDX9ZlduSNq6lt03pmOWPy405cJRxBw37mp7X68B/L0Eil4hWDNb6ObUfZdixiH+f
 OE6pKfPRSEaVrjh0MrhqrEHfVD1Q=
X-Google-Smtp-Source: AGHT+IGI9RioxbGs0cl4y6tjZPnF9YrSFVSf9rTIcEzzHe8FI/9Ptf6NLRyfv9HlIV8aJkCqDPeZzMiWpI/hgbLu7os=
X-Received: by 2002:a17:90b:1294:b0:2b3:28df:92b7 with SMTP id
 fw20-20020a17090b129400b002b328df92b7mr2827811pjb.4.1714751918986; Fri, 03
 May 2024 08:58:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240503123657.9441-1-tursulin@igalia.com>
 <736ba0a2-035b-4727-bbcc-437029420377@igalia.com>
 <2cdee989-f48d-4923-b12a-f09a1cc2b34d@igalia.com>
 <ZjUDsRIHHmJ0oM-1@phenom.ffwll.local>
In-Reply-To: <ZjUDsRIHHmJ0oM-1@phenom.ffwll.local>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 3 May 2024 11:58:26 -0400
Message-ID: <CADnq5_Mp0y559dGHuK2HWJp_UuiknOhvQB90yw_tdOuo1eV8gQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation/gpu: Document the situation with
 unqualified drm-memory-
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, 
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com, 
 Alex Deucher <alexander.deucher@amd.com>, Rob Clark <robdclark@chromium.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 dri-devel <dri-devel@lists.freedesktop.org>
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

On Fri, May 3, 2024 at 11:33=E2=80=AFAM Daniel Vetter <daniel@ffwll.ch> wro=
te:
>
> On Fri, May 03, 2024 at 01:58:38PM +0100, Tvrtko Ursulin wrote:
> >
> > [And I forgot dri-devel.. doing well!]
> >
> > On 03/05/2024 13:40, Tvrtko Ursulin wrote:
> > >
> > > [Correcting Christian's email]
> > >
> > > On 03/05/2024 13:36, Tvrtko Ursulin wrote:
> > > > From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > >
> > > > Currently it is not well defined what is drm-memory- compared to ot=
her
> > > > categories.
> > > >
> > > > In practice the only driver which emits these keys is amdgpu and in=
 them
> > > > exposes the total memory use (including shared).
> > > >
> > > > Document that drm-memory- and drm-total-memory- are aliases to
> > > > prevent any
> > > > confusion in the future.
> > > >
> > > > While at it also clarify that the reserved sub-string 'memory' refe=
rs to
> > > > the memory region component.
> > > >
> > > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > > Cc: Christian K=C3=B6nig <christian.keonig@amd.com>
> > >
> > > Mea culpa, I copied the mistake from
> > > 77d17c4cd0bf52eacfad88e63e8932eb45d643c5. :)
> > >
> > > Regards,
> > >
> > > Tvrtko
> > >
> > > > Cc: Rob Clark <robdclark@chromium.org>
> > > > ---
> > > >   Documentation/gpu/drm-usage-stats.rst | 10 +++++++++-
> > > >   1 file changed, 9 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/Documentation/gpu/drm-usage-stats.rst
> > > > b/Documentation/gpu/drm-usage-stats.rst
> > > > index 6dc299343b48..ef5c0a0aa477 100644
> > > > --- a/Documentation/gpu/drm-usage-stats.rst
> > > > +++ b/Documentation/gpu/drm-usage-stats.rst
> > > > @@ -128,7 +128,9 @@ Memory
> > > >   Each possible memory type which can be used to store buffer
> > > > objects by the
> > > >   GPU in question shall be given a stable and unique name to be
> > > > returned as the
> > > > -string here.  The name "memory" is reserved to refer to normal
> > > > system memory.
> > > > +string here.
> > > > +
> > > > +The region name "memory" is reserved to refer to normal system mem=
ory.
> > > >   Value shall reflect the amount of storage currently consumed by
> > > > the buffer
> > > >   objects belong to this client, in the respective memory region.
> > > > @@ -136,6 +138,9 @@ objects belong to this client, in the respectiv=
e
> > > > memory region.
> > > >   Default unit shall be bytes with optional unit specifiers of 'KiB=
'
> > > > or 'MiB'
> > > >   indicating kibi- or mebi-bytes.
> > > > +This is an alias for drm-total-<region> and only one of the two
> > > > should be
> > > > +present.
>
> This feels a bit awkward and seems to needlessly complicate fdinfo uapi.
>
> - Could we just patch amdgpu to follow everyone else, and avoid the
>   special case? If there's no tool that relies on the special amdgpu
>   prefix then that would be a lot easier.
>
> - If that's not on the table, could we make everyone (with a suitable
>   helper or something) just print both variants, so that we again have
>   consisent fdinfo output? Or breaks that a different set of existing
>   tools.
>
> - Finally maybe could we get away with fixing amd by adding the common
>   format there, deprecating the old, fixing the tools that would break an=
d
>   then maybe if we're lucky, remove the old one from amdgpu in a year or
>   so?

I'm not really understanding what amdgpu is doing wrong.  It seems to
be following the documentation.  Is the idea that we would like to
deprecate drm-memory-<region> in favor of drm-total-<region>?
If that's the case, I think the 3rd option is probably the best.  We
have a lot of tools and customers using this.  It would have also been
nice to have "memory" in the string for the newer ones to avoid
conflicts with other things that might be a total or shared in the
future, but I guess that ship has sailed.  We should also note that
drm-memory-<region> is deprecated.  While we are here, maybe we should
clarify the semantics of resident, purgeable, and active.  For
example, isn't resident just a duplicate of total?  If the memory was
not resident, it would be in a different region.

Alex

>
> Uapi that's "either do $foo or on this one driver, do $bar" is just
> guaranteed to fragement the ecosystem, so imo that should be the absolute
> last resort.
> -Sima
>
> > > > +
> > > >   - drm-shared-<region>: <uint> [KiB|MiB]
> > > >   The total size of buffers that are shared with another file (e.g.=
,
> > > > have more
> > > > @@ -145,6 +150,9 @@ than a single handle).
> > > >   The total size of buffers that including shared and private memor=
y.
> > > > +This is an alias for drm-memory-<region> and only one of the two
> > > > should be
> > > > +present.
> > > > +
> > > >   - drm-resident-<region>: <uint> [KiB|MiB]
> > > >   The total size of buffers that are resident in the specified regi=
on.
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
