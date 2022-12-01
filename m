Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76ED263F890
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 20:47:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B51A10E155;
	Thu,  1 Dec 2022 19:47:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38A4410E155
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 19:47:44 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id z92so3819904ede.1
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Dec 2022 11:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2IeJEHmY/lt7Ci8FmOQFUUQubl0gF9oPZcD64jEPEN0=;
 b=mkL0+bmUAlRN7XzJGkztmtObz8t0NP7FGQvgur75IiDYBYBDWvbGaCGHb2qPj0qBQ1
 P5DbAAT/E9Jn6jDtJPx4e74fe1j0BeElyBaQC5I69K8b+OkSI9tenJb/KSBqlDcDgaox
 UL5oFqUmRv5pfsYRnmm5t4rYa3zeCEROqK3rRHiB0rjoOr1xxYsaZa2mC6A3shwbotX8
 BTBWqxkfKUGMA623Om2kWOlM5Tduti1uo5lxp86XwXW4P/wJOvYatNW8tifj23GKJl1a
 W7lDzMNw6nkGAdHrhXfS+8Ya/nWWJ3Xu/i2rrR6+rtEppga+AhgttXFD8OuZMb+1prG6
 zxuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2IeJEHmY/lt7Ci8FmOQFUUQubl0gF9oPZcD64jEPEN0=;
 b=rP9d+VBbuzIrXa/Jh6grP4rQelpeNntCVN18ZG4wpO0Kpwalsy2Z7gD+hJZ9e1nbCt
 yqFFUnpwv5+0EqRssQWPZIgQdbPYv4D6W22RcCNxJPnUWSVv6Q4Rtm1OmURgqbIef6my
 3ga6F6iVczFNIEju5NAOf7tjDWn9FNwXdNa2zO8fxtXCqqPAWpZ4+I6RMo8LdPAMULCM
 kDejeWYtA3s2lPIaqBa2GhX7txwORuGv08TxVSyBqEpDw7IlVQtw5Sq8n1yoMtOX5ws6
 NNFWZsmMPZchp/ldMJlsNlFVDKO+LZTQITUhfUIwdCkAflgS7idT3xkNmPTwoR1ZZPFT
 SAkw==
X-Gm-Message-State: ANoB5plpoHSxwJilYzSc02kC8TNzKnPcuxAEhFiKFsQuzxWmFKNQenU2
 b2/bs6DbmPIpZwMGAA/4YUBH9DKC0fq6cNa52fcXHA==
X-Google-Smtp-Source: AA0mqf4qS2f2EMdECtDliGjRR7HGVhgP39Nc6a+AqKCk2ECEqQy5EsS2yZ8zidVpXtfkMjsWfI0TmfKXab2117s8V9A=
X-Received: by 2002:aa7:dc19:0:b0:461:f94:913 with SMTP id
 b25-20020aa7dc19000000b004610f940913mr46101314edu.102.1669924062626; 
 Thu, 01 Dec 2022 11:47:42 -0800 (PST)
MIME-Version: 1.0
References: <20221123192437.1065826-1-daniel.vetter@ffwll.ch>
 <Y4h85n6krZ3CVkQp@phenom.ffwll.local>
 <CAKMK7uErF0THyGHcke=AizGhJkaoQpN6PzjykbFFCX6eJ6DoJQ@mail.gmail.com>
In-Reply-To: <CAKMK7uErF0THyGHcke=AizGhJkaoQpN6PzjykbFFCX6eJ6DoJQ@mail.gmail.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 1 Dec 2022 13:47:29 -0600
Message-ID: <CAOFGe96bgSSSrW-KXBBtmgB+4j9D55x1KMW3k-vrFxQ7P-to-g@mail.gmail.com>
Subject: Re: [PATCH] drm/fourcc: Document open source user waiver
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: multipart/alternative; boundary="0000000000008e199505eec97e62"
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
Cc: Neil Trevett <ntrevett@nvidia.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000008e199505eec97e62
Content-Type: text/plain; charset="UTF-8"

Acked-by: Jason Ekstrand <jason.ekstrand@collabora.com>

On Thu, Dec 1, 2022 at 4:22 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:

> On Thu, 1 Dec 2022 at 11:07, Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Wed, Nov 23, 2022 at 08:24:37PM +0100, Daniel Vetter wrote:
> > > It's a bit a FAQ, and we really can't claim to be the authoritative
> > > source for allocating these numbers used in many standard extensions
> > > if we tell closed source or vendor stacks in general to go away.
> > >
> > > Iirc this was already clarified in some vulkan discussions, but I
> > > can't find that anywhere anymore. At least not in a public link.
> > >
> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > Cc: Maxime Ripard <mripard@kernel.org>
> > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > Cc: David Airlie <airlied@gmail.com>
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > Cc: Alex Deucher <alexdeucher@gmail.com>
> > > Cc: Daniel Stone <daniel@fooishbar.org>
> > > Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> > > Cc: Jason Ekstrand <jason@jlekstrand.net>
> > > Cc: Neil Trevett <ntrevett@nvidia.com>
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> >
> > From irc:
> >
> > <airlied> danvet: ack from me
>
> Also from irc:
>
> <mareko> danvet: Acked
>
> -Daniel
>
> > > ---
> > >  include/uapi/drm/drm_fourcc.h | 12 ++++++++++++
> > >  1 file changed, 12 insertions(+)
> > >
> > > diff --git a/include/uapi/drm/drm_fourcc.h
> b/include/uapi/drm/drm_fourcc.h
> > > index bc056f2d537d..de703c6be969 100644
> > > --- a/include/uapi/drm/drm_fourcc.h
> > > +++ b/include/uapi/drm/drm_fourcc.h
> > > @@ -88,6 +88,18 @@ extern "C" {
> > >   *
> > >   * The authoritative list of format modifier codes is found in
> > >   * `include/uapi/drm/drm_fourcc.h`
> > > + *
> > > + * Open Source User Waiver
> > > + * -----------------------
> > > + *
> > > + * Because this is the authoritative source for pixel formats and
> modifiers
> > > + * referenced by GL, Vulkan extensions and other standards and hence
> used both
> > > + * by open source and closed source driver stacks, the usual
> requirement for an
> > > + * upstream in-kernel or open source userspace user does not apply.
> > > + *
> > > + * To ensure, as much as feasible, compatibility across stacks and
> avoid
> > > + * confusion with incompatible enumerations stakeholders for all
> relevant driver
> > > + * stacks should approve additions.
> > >   */
> > >
> > >  #define fourcc_code(a, b, c, d) ((__u32)(a) | ((__u32)(b) << 8) | \
> > > --
> > > 2.37.2
> > >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>

--0000000000008e199505eec97e62
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Acked-by: Jason Ekstrand &lt;<a href=3D"mailto:jason.ekstr=
and@collabora.com">jason.ekstrand@collabora.com</a>&gt;<br></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 1, 2=
022 at 4:22 AM Daniel Vetter &lt;<a href=3D"mailto:daniel.vetter@ffwll.ch">=
daniel.vetter@ffwll.ch</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">On Thu, 1 Dec 2022 at 11:07, Daniel Vetter &lt;<a hre=
f=3D"mailto:daniel@ffwll.ch" target=3D"_blank">daniel@ffwll.ch</a>&gt; wrot=
e:<br>
&gt;<br>
&gt; On Wed, Nov 23, 2022 at 08:24:37PM +0100, Daniel Vetter wrote:<br>
&gt; &gt; It&#39;s a bit a FAQ, and we really can&#39;t claim to be the aut=
horitative<br>
&gt; &gt; source for allocating these numbers used in many standard extensi=
ons<br>
&gt; &gt; if we tell closed source or vendor stacks in general to go away.<=
br>
&gt; &gt;<br>
&gt; &gt; Iirc this was already clarified in some vulkan discussions, but I=
<br>
&gt; &gt; can&#39;t find that anywhere anymore. At least not in a public li=
nk.<br>
&gt; &gt;<br>
&gt; &gt; Cc: Maarten Lankhorst &lt;<a href=3D"mailto:maarten.lankhorst@lin=
ux.intel.com" target=3D"_blank">maarten.lankhorst@linux.intel.com</a>&gt;<b=
r>
&gt; &gt; Cc: Maxime Ripard &lt;<a href=3D"mailto:mripard@kernel.org" targe=
t=3D"_blank">mripard@kernel.org</a>&gt;<br>
&gt; &gt; Cc: Thomas Zimmermann &lt;<a href=3D"mailto:tzimmermann@suse.de" =
target=3D"_blank">tzimmermann@suse.de</a>&gt;<br>
&gt; &gt; Cc: David Airlie &lt;<a href=3D"mailto:airlied@gmail.com" target=
=3D"_blank">airlied@gmail.com</a>&gt;<br>
&gt; &gt; Cc: Daniel Vetter &lt;<a href=3D"mailto:daniel@ffwll.ch" target=
=3D"_blank">daniel@ffwll.ch</a>&gt;<br>
&gt; &gt; Cc: Alex Deucher &lt;<a href=3D"mailto:alexdeucher@gmail.com" tar=
get=3D"_blank">alexdeucher@gmail.com</a>&gt;<br>
&gt; &gt; Cc: Daniel Stone &lt;<a href=3D"mailto:daniel@fooishbar.org" targ=
et=3D"_blank">daniel@fooishbar.org</a>&gt;<br>
&gt; &gt; Cc: Bas Nieuwenhuizen &lt;<a href=3D"mailto:bas@basnieuwenhuizen.=
nl" target=3D"_blank">bas@basnieuwenhuizen.nl</a>&gt;<br>
&gt; &gt; Cc: Jason Ekstrand &lt;<a href=3D"mailto:jason@jlekstrand.net" ta=
rget=3D"_blank">jason@jlekstrand.net</a>&gt;<br>
&gt; &gt; Cc: Neil Trevett &lt;<a href=3D"mailto:ntrevett@nvidia.com" targe=
t=3D"_blank">ntrevett@nvidia.com</a>&gt;<br>
&gt; &gt; Signed-off-by: Daniel Vetter &lt;<a href=3D"mailto:daniel.vetter@=
intel.com" target=3D"_blank">daniel.vetter@intel.com</a>&gt;<br>
&gt;<br>
&gt; From irc:<br>
&gt;<br>
&gt; &lt;airlied&gt; danvet: ack from me<br>
<br>
Also from irc:<br>
<br>
&lt;mareko&gt; danvet: Acked<br>
<br>
-Daniel<br>
<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 include/uapi/drm/drm_fourcc.h | 12 ++++++++++++<br>
&gt; &gt;=C2=A0 1 file changed, 12 insertions(+)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm=
_fourcc.h<br>
&gt; &gt; index bc056f2d537d..de703c6be969 100644<br>
&gt; &gt; --- a/include/uapi/drm/drm_fourcc.h<br>
&gt; &gt; +++ b/include/uapi/drm/drm_fourcc.h<br>
&gt; &gt; @@ -88,6 +88,18 @@ extern &quot;C&quot; {<br>
&gt; &gt;=C2=A0 =C2=A0*<br>
&gt; &gt;=C2=A0 =C2=A0* The authoritative list of format modifier codes is =
found in<br>
&gt; &gt;=C2=A0 =C2=A0* `include/uapi/drm/drm_fourcc.h`<br>
&gt; &gt; + *<br>
&gt; &gt; + * Open Source User Waiver<br>
&gt; &gt; + * -----------------------<br>
&gt; &gt; + *<br>
&gt; &gt; + * Because this is the authoritative source for pixel formats an=
d modifiers<br>
&gt; &gt; + * referenced by GL, Vulkan extensions and other standards and h=
ence used both<br>
&gt; &gt; + * by open source and closed source driver stacks, the usual req=
uirement for an<br>
&gt; &gt; + * upstream in-kernel or open source userspace user does not app=
ly.<br>
&gt; &gt; + *<br>
&gt; &gt; + * To ensure, as much as feasible, compatibility across stacks a=
nd avoid<br>
&gt; &gt; + * confusion with incompatible enumerations stakeholders for all=
 relevant driver<br>
&gt; &gt; + * stacks should approve additions.<br>
&gt; &gt;=C2=A0 =C2=A0*/<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #define fourcc_code(a, b, c, d) ((__u32)(a) | ((__u32)(b) &=
lt;&lt; 8) | \<br>
&gt; &gt; --<br>
&gt; &gt; 2.37.2<br>
&gt; &gt;<br>
&gt;<br>
&gt; --<br>
&gt; Daniel Vetter<br>
&gt; Software Engineer, Intel Corporation<br>
&gt; <a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer" target=3D"_blank">=
http://blog.ffwll.ch</a><br>
<br>
<br>
<br>
-- <br>
Daniel Vetter<br>
Software Engineer, Intel Corporation<br>
<a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer" target=3D"_blank">http:=
//blog.ffwll.ch</a><br>
</blockquote></div>

--0000000000008e199505eec97e62--
