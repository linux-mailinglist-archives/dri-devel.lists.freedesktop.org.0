Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D786E6A9B
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 19:10:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E93FA10E172;
	Tue, 18 Apr 2023 17:10:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 156C910E0DA;
 Tue, 18 Apr 2023 17:10:21 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-6a5f7341850so687638a34.2; 
 Tue, 18 Apr 2023 10:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681837820; x=1684429820;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OqU64dyNyVLph1P/qhZx/WkaDVjQQSDBNOAh/YSWiWY=;
 b=o28TKI5HN7PX9OwD+OvcSKCoMpLqS0tQsJ9AnHj+JNxmFq5YbFLM9ABw7YTnEg1E3f
 IMCFObk7uQK7G/PniHux0t/aCah7rAWPVUPw4OyYnd99YnVYUb4FdRRpgfswiTQKwdAQ
 B9CKE+fA4rK+mzKcfAfM6kXDCWAEjqzLkF1htaZW07e/F0qzKkhsLawi/aRtEcm1XgFM
 YTGJJZAw6f5vX1ZeV031ReYz6RgfgdeWMdCpmYsLv4DR7Ew7rsgx00WPT0sb5DiN1uir
 7NHc5EGMQaLvamSQWgMAEj26E4fbwPWmsgiRk85j6QdU2EHmIBIapAe0uk/OBM1jeES6
 CbWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681837820; x=1684429820;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OqU64dyNyVLph1P/qhZx/WkaDVjQQSDBNOAh/YSWiWY=;
 b=i5j5F8oeFozdLwTKVc8LvLXaOa2P7eFziOUrf30Kw4zLwGZMKkC4QjgQsGeGQt0Kdf
 JT6f8/TqhrkEdQrA/Mw2zJQQQwrYwnTUcYkLtEplNv9lnNqJyuMhAudrp+CP7FuhZO7b
 RUGskG59IhglEfQyM19s9oURkuk9aX12uR6siRJa/XrtfaB9jgKr2ndQFBve3xY9M0Uc
 sdjozLesn5RhtbDgGkvfGwvStsprAY27pXbXMRoS+f/qb38VtsQqTjx1tuR87/a6vMP9
 BPSdV5f/4yB9sQqVd3z3ghoDc6uAWXSkpfBOgCLD9rnswFRklJOByen4ONw12O/TIPP8
 HGhQ==
X-Gm-Message-State: AAQBX9d//YXQcF/xYxmeeMpp3STsc9F+EZGq9AH4z1nDyH58NQRaWBqR
 zGsauUdA9iC9d73mT4uhNPpT0Sblvqnp+X6gdEI=
X-Google-Smtp-Source: AKy350YC0VW+TMXuCCTkHujC3cG7rneXim8MUyV9WJC+o0/7FKXmfOCzZMG/oDLnt9Jz2SAZtp2DmC2BD0jfVUpQgig=
X-Received: by 2002:a9d:7ccc:0:b0:6a5:dcaf:e152 with SMTP id
 r12-20020a9d7ccc000000b006a5dcafe152mr917545otn.7.1681837820660; Tue, 18 Apr
 2023 10:10:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230417155613.4143258-1-tvrtko.ursulin@linux.intel.com>
 <20230417155613.4143258-4-tvrtko.ursulin@linux.intel.com>
 <CAF6AEGu3oagVYqBcgqKFO6-gbLbVdFn51fKeV7CfWTJXJjTNYA@mail.gmail.com>
 <fca966cf-df17-a937-8330-b2353f1a352c@linux.intel.com>
 <CAF6AEGswZZZxwRTOXbCVKmhUYwz8BSu-GDVCJ=FfyJ-w=e4dLQ@mail.gmail.com>
 <0faa3b0f-342c-87e0-9587-f8c11131689e@linux.intel.com>
 <CAF6AEGu+AbQnPV-1goqJi_RJR7TB8Ta5FXTKn-j6Aq4fiuPN2w@mail.gmail.com>
 <8a16f714-d20a-7608-a08f-88b20dc05d86@linux.intel.com>
 <CAF6AEGuhYNY6z0rHBufVJvXmXrpb9yQRqGrdJkzBK_kFcE0Vtg@mail.gmail.com>
 <b2241375-ba94-750d-7b4e-2e008e11d421@linux.intel.com>
In-Reply-To: <b2241375-ba94-750d-7b4e-2e008e11d421@linux.intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 18 Apr 2023 10:10:09 -0700
Message-ID: <CAF6AEGs9wuE2Av36cZ1BvvV35vRVALBba_PVDijUyYUjwVCJiQ@mail.gmail.com>
Subject: Re: [RFC 3/6] drm: Add fdinfo memory stats
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Intel-gfx@lists.freedesktop.org,
 Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 18, 2023 at 9:44=E2=80=AFAM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 18/04/2023 17:13, Rob Clark wrote:
> > On Tue, Apr 18, 2023 at 7:46=E2=80=AFAM Tvrtko Ursulin
> > <tvrtko.ursulin@linux.intel.com> wrote:
> >> On 18/04/2023 15:36, Rob Clark wrote:
> >>> On Tue, Apr 18, 2023 at 7:19=E2=80=AFAM Tvrtko Ursulin
> >>> <tvrtko.ursulin@linux.intel.com> wrote:
> >>>>
> >>>>
> >>>> On 18/04/2023 14:49, Rob Clark wrote:
> >>>>> On Tue, Apr 18, 2023 at 2:00=E2=80=AFAM Tvrtko Ursulin
> >>>>> <tvrtko.ursulin@linux.intel.com> wrote:
> >>>>>>
> >>>>>>
> >>>>>> On 17/04/2023 20:39, Rob Clark wrote:
> >>>>>>> On Mon, Apr 17, 2023 at 8:56=E2=80=AFAM Tvrtko Ursulin
> >>>>>>> <tvrtko.ursulin@linux.intel.com> wrote:
> >>>>>>>>
> >>>>>>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> >>>>>>>>
> >>>>>>>> Add support to dump GEM stats to fdinfo.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> >>>>>>>> ---
> >>>>>>>>      Documentation/gpu/drm-usage-stats.rst | 12 +++++++
> >>>>>>>>      drivers/gpu/drm/drm_file.c            | 52 ++++++++++++++++=
+++++++++++
> >>>>>>>>      include/drm/drm_drv.h                 |  7 ++++
> >>>>>>>>      include/drm/drm_file.h                |  8 +++++
> >>>>>>>>      4 files changed, 79 insertions(+)
> >>>>>>>>
> >>>>>>>> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentati=
on/gpu/drm-usage-stats.rst
> >>>>>>>> index 2ab32c40e93c..8273a41b2fb0 100644
> >>>>>>>> --- a/Documentation/gpu/drm-usage-stats.rst
> >>>>>>>> +++ b/Documentation/gpu/drm-usage-stats.rst
> >>>>>>>> @@ -21,6 +21,7 @@ File format specification
> >>>>>>>>
> >>>>>>>>      - File shall contain one key value pair per one line of tex=
t.
> >>>>>>>>      - Colon character (`:`) must be used to delimit keys and va=
lues.
> >>>>>>>> +- Caret (`^`) is also a reserved character.
> >>>>>>>
> >>>>>>> this doesn't solve the problem that led me to drm-$CATEGORY-memor=
y... ;-)
> >>>>>>
> >>>>>> Could you explain or remind me with a link to a previous explanati=
on?
> >>>>>
> >>>>> How is userspace supposed to know that "drm-memory-foo" is a memory
> >>>>> type "foo" but drm-memory-foo^size is not memory type "foo^size"?
> >>>>
> >>>> Are you referring to nvtop?
> >>>
> >>> I'm not referring to any particular app.  It could even be some app
> >>> that isn't even written yet but started with an already existing
> >>> kernel without this change.  It is just a general point about forward=
s
> >>> compatibility of old userspace with new kernel.  And it doesn't reall=
y
> >>> matter what special character you use.  You can't retroactively defin=
e
> >>> some newly special characters.
> >>
> >> What you see does not work if we output both legacy and new key with
> >> extra category? Userspace which hardcode the name keep working, and
> >> userspace which parses region names as opaque strings also keeps worki=
ng
> >> just shows more entries.
> >
> > well, it shows nonsense entries.. I'd not call that "working"
> >
> > But honestly we are wasting too many words on this.. we just can't
> > re-use the "drm-memory-<anything>" namespace, it is already burnt.
> > Full stop.
> >
> > If you don't like the "drm-$CATEGORY-$REGION" workaround then we can
> > shorten to "drm-mem-$REGION-$CATEGORY" since that won't accidentally
> > match the existing "drm-memory-" pattern.
>
> I can live with that token reversal, it was not the primary motivation
> for my RFC as we have discussed that side of things already before I
> sketched my version up.
>
> But I also still don't get what doesn't work with what I described and
> you did not really address my specific questions with more than a
> "doesn't work" with not much details.
>
> Unless for you it starts and ends with "nonsense entries". If so then it
> seems there is no option than to disagree and move on. Again, I can
> accept the drm-$category-memory-$region.

Yeah, it's about "nonsense entries".. and I am perhaps being a bit
pedantic about compatibility with old userspace (not like there are
100's of apps parsing drm fdinfo), but it is the principle of the
matter ;-)

BR,
-R
