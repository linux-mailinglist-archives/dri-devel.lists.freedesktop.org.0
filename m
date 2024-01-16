Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C18882F576
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 20:36:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45B1B10E0E0;
	Tue, 16 Jan 2024 19:36:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3409110E324;
 Tue, 16 Jan 2024 16:11:32 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-50eaabc36bcso12386082e87.2; 
 Tue, 16 Jan 2024 08:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705421430; x=1706026230; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nTj+8ShIjW0CqDZ0eu0ySWN/Px6r1NE46iq3YQxGY50=;
 b=XKizjOJY+HTr0JhGVSkV6AcDCtWCF8FF4iU0IbtcaqhuV7J0P4IseEEJLOdfieRycS
 9vh0Nser/bRyW5jIfWmJ8wUfwquoTgRGBuNI6YKDRHr/YbZ3AqqnQgsUl2r6PnyetKQK
 Ckvl5gMGtJUr7m9QCQfIYWL0l6Pt7gPiAkrFN41rO3i6VEOI8xmoDwwPTlojy59HPCBB
 MDs88WL6u4EMlxPjn9B5wQGca7LmH0IqFHVUl3jk8UTI2HmDiFvvWx+96eui7ZudwOmC
 0liOFg7sUtGUjw6Q50ubOjiXGVp12txe0mTnylyE67WvjOg8DwwztPlfeI4zosvkQNsX
 /26Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705421430; x=1706026230;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nTj+8ShIjW0CqDZ0eu0ySWN/Px6r1NE46iq3YQxGY50=;
 b=ugxZ3fXTzwLJ2bVM5whvEkZ174wlWiNIQdzuuKHD+XyCMzuuXSAWg74s1JHAJqx3xd
 xhff8u3Ohcho87fpoGiIBCNrjRRQ+IuCwzWwjRfKU5wcaWbx8dG2UkUfWhPhwHBIWV8S
 IOZ7NNi19w+s6biNWaHy0A2puLsvPgSQbhrzw0QkmbEsskfgF8oKUUwZfdYU2M2nbYr+
 pbYIDSxm59rX8biz5lHkSrtit4B5aHRQKYMuUhxYdBpPgFsDIcRpFQ3OKM7Bv+XllgjM
 GMoZ93kZUDdWTTJI/ldbhIy6f6E33ruTYgvehfvc2wsr1kSiRsESqEor04A3JUyo8t2n
 p3JA==
X-Gm-Message-State: AOJu0YznVohPi0IZ4a9+5B8UWSp2mEejp/wDHqQVVgPx1er1MReHPtyc
 GBU/x9POTWOZEc5eGcRe5aZLf1g2d+UMwhHXeLg=
X-Google-Smtp-Source: AGHT+IHc1l+WDhQLVzoZGQLrcaHr/yF/ah+NpIaLLNahedAvfukeUhqkNvrKaJux849CVbxl1ffKJhsXv9IhYg5GDNg=
X-Received: by 2002:ac2:4157:0:b0:50e:682a:3303 with SMTP id
 c23-20020ac24157000000b0050e682a3303mr3147895lfi.54.1705421430132; Tue, 16
 Jan 2024 08:10:30 -0800 (PST)
MIME-Version: 1.0
References: <20240116045159.1015510-1-andrealmeid@igalia.com>
 <20240116114522.5b83d8b6@eldfell>
 <a6099681-1ae9-48ef-99bc-d3c919007413@igalia.com>
 <20240116151414.10b831e6@eldfell>
 <47c6866a-34d6-48b1-a977-d21c48d991dc@igalia.com>
In-Reply-To: <47c6866a-34d6-48b1-a977-d21c48d991dc@igalia.com>
From: Xaver Hugl <xaver.hugl@gmail.com>
Date: Tue, 16 Jan 2024 17:10:18 +0100
Message-ID: <CAFZQkGyOQ5Tfu++-cHqgZ9NOJxqxm8cAF5XT18LmisuPAUbXAg@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm/atomic: Allow drivers to write their own plane
 check for async
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Content-Type: multipart/alternative; boundary="00000000000089121c060f125e90"
X-Mailman-Approved-At: Tue, 16 Jan 2024 19:36:11 +0000
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
Cc: daniel@ffwll.ch, =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Pekka Paalanen <ppaalanen@gmail.com>, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, alexander.deucher@amd.com,
 Joshua Ashton <joshua@froggi.es>, Dave Airlie <airlied@gmail.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000089121c060f125e90
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

My plan is to require support for IN_FENCE_FD at least. If the driver
doesn't
allow tearing with that, then tearing just doesn't happen.

For overlay planes though, it depends on how the compositor prioritizes
things.
If the compositor prioritizes overlay planes and would like to do tearing
if possible,
then this patch works.
If the compositor prioritizes tearing and would like to do overlay planes
if possible,
it would have to know that switching to synchronous commits for a single
frame,
setting up the overlay planes and then switching back to async commits
works, and
that can't be figured out with TEST_ONLY commits.
So I think having a CAP or immutable plane property to signal that async
commits
with overlay and/or cursor planes is supported would be useful.

Am Di., 16. Jan. 2024 um 14:35 Uhr schrieb Andr=C3=A9 Almeida <
andrealmeid@igalia.com>:

> + Joshua
>
> Em 16/01/2024 10:14, Pekka Paalanen escreveu:
> > On Tue, 16 Jan 2024 08:50:59 -0300
> > Andr=C3=A9 Almeida <andrealmeid@igalia.com> wrote:
> >
> >> Hi Pekka,
> >>
> >> Em 16/01/2024 06:45, Pekka Paalanen escreveu:
> >>> On Tue, 16 Jan 2024 01:51:57 -0300
> >>> Andr=C3=A9 Almeida <andrealmeid@igalia.com> wrote:
> >>>
> >>>> Hi,
> >>>>
> >>>> AMD hardware can do more on the async flip path than just the primar=
y
> plane, so
> >>>> to lift up the current restrictions, this patchset allows drivers to
> write their
> >>>> own check for planes for async flips.
> >>>
> >>> Hi,
> >>>
> >>> what's the userspace story for this, how could userspace know it coul=
d
> do more?
> >>> What kind of userspace would take advantage of this and in what
> situations?
> >>>
> >>> Or is this not meant for generic userspace?
> >>
> >> Sorry, I forgot to document this. So the idea is that userspace will
> >> query what they can do here with DRM_MODE_ATOMIC_TEST_ONLY calls,
> >> instead of having capabilities for each prop.
> >
> > That's the theory, but do you have a practical example?
> >
> > What other planes and props would one want change in some specific use
> > case?
> >
> > Is it just "all or nothing", or would there be room to choose and pick
> > which props you change and which you don't based on what the driver
> > supports? If the latter, then relying on TEST_ONLY might be yet another
> > combinatorial explosion to iterate through.
> >
>
> That's a good question, maybe Simon, Xaver or Joshua can share how they
> were planning to use this on Gamescope or Kwin.
>
> >
> > Thanks,
> > pq
> >
> >>>> I'm not sure if adding something new to drm_plane_funcs is the right
> way to do,
> >>>> because if we want to expand the other object types (crtc, connector=
)
> we would
> >>>> need to add their own drm_XXX_funcs, so feedbacks are welcome!
> >>>>
> >>>>    Andr=C3=A9
> >>>>
> >>>> Andr=C3=A9 Almeida (2):
> >>>>     drm/atomic: Allow drivers to write their own plane check for asy=
nc
> >>>>       flips
> >>>>     drm/amdgpu: Implement check_async_props for planes
> >>>>
> >>>>    .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 30 +++++++++
> >>>>    drivers/gpu/drm/drm_atomic_uapi.c             | 62
> ++++++++++++++-----
> >>>>    include/drm/drm_atomic_uapi.h                 | 12 ++++
> >>>>    include/drm/drm_plane.h                       |  5 ++
> >>>>    4 files changed, 92 insertions(+), 17 deletions(-)
> >>>>
> >>>
> >
>

--00000000000089121c060f125e90
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>My plan is to require support for IN=
_FENCE_FD at least. If the driver doesn&#39;t</div><div>allow tearing with =
that, then tearing just doesn&#39;t happen.</div><div><br></div>For overlay=
 planes though, it depends on how the compositor prioritizes things.</div><=
div>If the compositor prioritizes overlay planes and would like to do teari=
ng if possible,</div><div>then this patch works.</div><div>If the composito=
r prioritizes tearing and would like to do overlay planes if possible,</div=
><div>it would have to know that switching to synchronous commits for a sin=
gle frame,</div><div>setting up the overlay planes and then switching back =
to async commits works, and</div><div>that can&#39;t be figured out with TE=
ST_ONLY commits.</div><div>So I think having a CAP or immutable plane prope=
rty to signal that async commits</div><div>with overlay and/or cursor plane=
s is supported would be useful.<br></div><div><br></div><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">Am Di., 16. Jan. 2024 um 14:3=
5=C2=A0Uhr schrieb Andr=C3=A9 Almeida &lt;<a href=3D"mailto:andrealmeid@iga=
lia.com">andrealmeid@igalia.com</a>&gt;:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">+ Joshua<br>
<br>
Em 16/01/2024 10:14, Pekka Paalanen escreveu:<br>
&gt; On Tue, 16 Jan 2024 08:50:59 -0300<br>
&gt; Andr=C3=A9 Almeida &lt;<a href=3D"mailto:andrealmeid@igalia.com" targe=
t=3D"_blank">andrealmeid@igalia.com</a>&gt; wrote:<br>
&gt; <br>
&gt;&gt; Hi Pekka,<br>
&gt;&gt;<br>
&gt;&gt; Em 16/01/2024 06:45, Pekka Paalanen escreveu:<br>
&gt;&gt;&gt; On Tue, 16 Jan 2024 01:51:57 -0300<br>
&gt;&gt;&gt; Andr=C3=A9 Almeida &lt;<a href=3D"mailto:andrealmeid@igalia.co=
m" target=3D"_blank">andrealmeid@igalia.com</a>&gt; wrote:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 <br>
&gt;&gt;&gt;&gt; Hi,<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; AMD hardware can do more on the async flip path than just =
the primary plane, so<br>
&gt;&gt;&gt;&gt; to lift up the current restrictions, this patchset allows =
drivers to write their<br>
&gt;&gt;&gt;&gt; own check for planes for async flips.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Hi,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; what&#39;s the userspace story for this, how could userspace k=
now it could do more?<br>
&gt;&gt;&gt; What kind of userspace would take advantage of this and in wha=
t situations?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Or is this not meant for generic userspace?<br>
&gt;&gt;<br>
&gt;&gt; Sorry, I forgot to document this. So the idea is that userspace wi=
ll<br>
&gt;&gt; query what they can do here with DRM_MODE_ATOMIC_TEST_ONLY calls,<=
br>
&gt;&gt; instead of having capabilities for each prop.<br>
&gt; <br>
&gt; That&#39;s the theory, but do you have a practical example?<br>
&gt; <br>
&gt; What other planes and props would one want change in some specific use=
<br>
&gt; case?<br>
&gt; <br>
&gt; Is it just &quot;all or nothing&quot;, or would there be room to choos=
e and pick<br>
&gt; which props you change and which you don&#39;t based on what the drive=
r<br>
&gt; supports? If the latter, then relying on TEST_ONLY might be yet anothe=
r<br>
&gt; combinatorial explosion to iterate through.<br>
&gt; <br>
<br>
That&#39;s a good question, maybe Simon, Xaver or Joshua can share how they=
 <br>
were planning to use this on Gamescope or Kwin.<br>
<br>
&gt; <br>
&gt; Thanks,<br>
&gt; pq<br>
&gt; <br>
&gt;&gt;&gt;&gt; I&#39;m not sure if adding something new to drm_plane_func=
s is the right way to do,<br>
&gt;&gt;&gt;&gt; because if we want to expand the other object types (crtc,=
 connector) we would<br>
&gt;&gt;&gt;&gt; need to add their own drm_XXX_funcs, so feedbacks are welc=
ome!<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 Andr=C3=A9<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Andr=C3=A9 Almeida (2):<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0drm/atomic: Allow drivers to write thei=
r own plane check for async<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0flips<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0drm/amdgpu: Implement check_async_props=
 for planes<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c=
=C2=A0 =C2=A0| 30 +++++++++<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 drivers/gpu/drm/drm_atomic_uapi.c=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 62 ++++++++++++++-----<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 include/drm/drm_atomic_uapi.h=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 12 ++++<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 include/drm/drm_plane.h=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 5 ++<=
br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 4 files changed, 92 insertions(+), 17 deletio=
ns(-)<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 <br>
&gt; <br>
</blockquote></div></div>

--00000000000089121c060f125e90--
