Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F1B1ED66A
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 20:53:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F184898BC;
	Wed,  3 Jun 2020 18:53:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 569C689704
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jun 2020 18:53:45 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id e9so2339686pgo.9
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jun 2020 11:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0hZctjpjXBU6tKmcpp2xKs+mPpkiV+HKnE+JG/fpbyY=;
 b=Uf4G+Wds/EztGhP93rKQBZMbebO0qsg96y5iXs1QlgRfqiYfryL9rmO5ddCwm01Os5
 skXI858Bh3kqXvAVhPPutcJkiQExPqnwPeGwT9N3gfopvuDrsWBHvyIw6MmWxUyywIcx
 D9RZEztd2KQeus7ScrNWwh3PJSQ+4L6L8os6KfbY+Vcfp/THD68V6vWgzJew1vOxwNd0
 BHQn2vL8vQbMQLkpepPaBKEgldkH2zj2sROtjxaGecTKpSa3Zl2GSFV86igrU6vqYP5q
 Nk6k1cV3OgkekDW9ZAfXBQfhtiq0/8EzwszU4zUD2MJXgMQyn9L8VxMCzbXbi0U++kAo
 9QhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0hZctjpjXBU6tKmcpp2xKs+mPpkiV+HKnE+JG/fpbyY=;
 b=im3UtCfR1P7NXAdGslVR5uFuHRd3ciJzNrpSMMGTxqg19CCo/XHoi3ut+U6l2+XAH3
 r8RynXWywjq1Mf4TBVq6O/T1YhfsfT9GqhTGnUr9mvr0AsFxQGxyfTXk0972+1l7xAPa
 6sb/E11jmrgUsJW6+2lo2hTVIZ3ZL1Cy+nU+UiPMKdY1rQxs4PD/Ymw1N0Uv/9AoRdwb
 0FXDGbVDpXA2/5eftro0UoTeI8KRvjL78BEHWup3n5tqcGstFT6Y37bPltRUGYuUIkVD
 NzDL8FzbSRcHue5DDJWq7GkDDBPw1Bwhv3iZRrW2CM6meGi593xzCvu4e8qP1XgW/zzx
 N9JA==
X-Gm-Message-State: AOAM533QgVXX9NTBZoLVzi8rwGoPXzuEQZsmm/sDz428F2j6eYdYJFFf
 Xbp+9NyGpmSFbKX8zSPJ/3BbYQysyWLEb8mFYog=
X-Google-Smtp-Source: ABdhPJwq+SBmlXhD7Fs+juQC2W+ttHwAIp5P2TTT2Kvj8gw8EdftQfStcXQMBlVWHhq+9ub/KxV/aLSFehPxxNVLQEg=
X-Received: by 2002:a17:90a:9604:: with SMTP id
 v4mr1452331pjo.198.1591210424788; 
 Wed, 03 Jun 2020 11:53:44 -0700 (PDT)
MIME-Version: 1.0
References: <WOsdNGp0dhyp8Modsrt7DYpd0fVk7Yk264FISQ1Yls30bhlSXbxzgKTpmOCJ9H2WV1XHyUjCXu7nwBOWQ6n1NCbIcVl1-1IZ4rMMGN1dN-U=@emersion.fr>
 <CAAxE2A4NCo_KMkemUOHKbZ7P=GR4p-zwhpmP7Get18x4Ydb-Gg@mail.gmail.com>
 <bbZABMxDckHUj5JW5DW0pSewqQ-rAIW0gvNnTlI4np7o1A2bDrpPGIeyk5tXGMDr_cAI1l_R9qw6ykJ8OEhQlbKruJ8IG579jqADaPAnUbA=@emersion.fr>
 <CADnq5_MEFM_2k_uboU6E9d3_j18K+tz=Axtie-80PSSwJ2vkYw@mail.gmail.com>
 <CAPj87rMrJLNNbFJVvf081=eRqPqAe1H7=+PM21N22Jdsg7FzVQ@mail.gmail.com>
 <CADnq5_OX9o5_Gc4SjU5M4B=fthT9++J-FjX3UqTS7x_u6cJHOQ@mail.gmail.com>
 <CAPj87rP+Hxhohb4dEjRwtZzy34fYk+hAdgVfCkLF1u4JufJ=CQ@mail.gmail.com>
 <CADnq5_Pzj+AWQZWOcwvf8WQDVJrpc2DyG6Z1ZYqgfHA-8AXpMA@mail.gmail.com>
 <CAPj87rNO62i5JmRLdMhAg9XbiJUyrrRO7fj1ruXRCh-oxHnifQ@mail.gmail.com>
 <CADnq5_PVZ_DS65SCS=OFW0m7Dz10pMAZVZ33pWf86KBwg4oQKw@mail.gmail.com>
 <CAPj87rNrJtJeVd0ba768D2VMiEKvhXOCozAhkq6QV6mu3WsFVQ@mail.gmail.com>
In-Reply-To: <CAPj87rNrJtJeVd0ba768D2VMiEKvhXOCozAhkq6QV6mu3WsFVQ@mail.gmail.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Wed, 3 Jun 2020 14:53:08 -0400
Message-ID: <CAAxE2A4wE0Q4NCQHmQhCa3nQn8VHWngtmuhg2DBtQYsCncTSFw@mail.gmail.com>
Subject: Re: [PATCH v3] drm/fourcc: document modifier uniqueness requirements
To: Daniel Stone <daniel@fooishbar.org>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: multipart/mixed; boundary="===============0141432801=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0141432801==
Content-Type: multipart/alternative; boundary="00000000000021e94805a7328c7e"

--00000000000021e94805a7328c7e
Content-Type: text/plain; charset="UTF-8"

TMZ is more complicated. If there is a TMZ buffer used by a command buffer,
then all other used buffers must also be TMZ or read only. If no TMZ
buffers are used by a command buffer, then TMZ is disabled. If a context is
not secure, TMZ is also disabled. A context can switch between secure and
non-secure based on the buffers being used.

So mixing secure and non-secure memory writes in one command buffer won't
work. This is not fixable in the driver - apps must be aware of this.

Marek

On Wed, Jun 3, 2020 at 5:50 AM Daniel Stone <daniel@fooishbar.org> wrote:

> Hi Alex,
>
> On Mon, 1 Jun 2020 at 15:25, Alex Deucher <alexdeucher@gmail.com> wrote:
> > On Fri, May 29, 2020 at 11:03 AM Daniel Stone <daniel@fooishbar.org>
> wrote:
> > > What Weston _does_ know, however, is that display controller can work
> > > with modifier set A, and the GPU can work with modifier set B, and if
> > > the client can pick something from modifier set A, then there is a
> > > much greater probability that Weston can leave the GPU alone so it can
> > > be entirely used by the client. It also knows that if the surface
> > > can't be directly scanned out for whatever reason, then there's no
> > > point in the client optimising for direct scanout, and it can tell the
> > > client to select based on optimality purely for the GPU.
> >
> > Just so I understand this correctly, the main reason for this is to
> > deal with display hardware and render hardware from different vendors
> > which may or may not support any common formats other than linear.
>
> It handles pretty much everything other than a single-context,
> single-GPU, single-device, tunnel.
>
> When sharing between subsystems and device categories, it lets us talk
> about capabilities in a more global way. For example, GBM lets you
> talk about 'scanout' and 'texture' and 'render', but what about media
> codecs? We could add the concept of decode/encode to something like
> GBM, and all the protocols like Wayland/X11 as well, then hope it
> actually works, but ...
>
> When sharing between heterogeneous vendors, it lets us talk about
> capabilities in a neutral way. For example, if you look at most modern
> Arm SoCs, your GPU, display controller, and media codec, will very
> likely all be from three totally different vendors. A GPU like
> Mali-T8xx can be shipped in tens of different vendor SoCs in several
> different revisions each. Just saying 'scanout' is totally meaningless
> for the Panfrost driver. Putting awareness for every different KMS
> platform and every different codec down into the Mesa driver is a
> synchronisation nightmare, and all those drivers would also need
> specific awareness about the Mesa driver. So modifiers allow us to
> explicitly describe that we want a particular revision of Arm
> Framebuffer Compression, and all the components can understand that
> without having to be specifically aware of 15 different KMS drivers.
> But even if you have the same vendor ...
>
> When sharing between multiple devices of the same class from the same
> vendor, it lets us surface and transit that information in a generic
> way, without AMD having to figure out ways to tunnel back-channel
> information between different instances of drivers potentially
> targeting different revisions. The alternatives seem to be deeply
> pessimal hacks, and we think we can do better. And when we get
> pessimal ...
>
> In every case, modifiers are about surfacing and sharing information.
> One of the reasons Collabora have been putting so much time and energy
> into this work is exactly _because_ solving those problems on a
> case-by-case basis was a pretty lucrative source of revenue for us.
> Debugging these kinds of issues before has usually involved specific
> driver knowledge, hacking into the driver to insert your own tracing,
> etc.
>
> If you (as someone who's trying to use a device optimally) are
> fortunate enough that you can get the attention of a vendor and have
> them solve the problem for you, then that's lucky for everyone apart
> from the AMD engineers who have to go solve it. If you're not, and you
> can't figure it out yourself, then you have to go pay a consultancy.
> On the face of it, that's good for us, except that we don't want to be
> doing that kind of repetitive boring work. But it's bad for the
> ecosystem that this knowledge is hidden away and that you have to pay
> specialists to extract it. So we're really keen to surface as much
> mechanism and information as possible, to give people the tools to
> either solve their own problems or at least make well-informed
> reports, burn down a toxic source of revenue, waste less engineering
> time extracting hidden information, and empower users as much as
> possible.
>
> > It
> > provides a way to tunnel device capabilities between the different
> > drivers.  In the case of a device with display and rendering on the
> > same device or multiple devices from the same vendor, it not really
> > that useful.
>
> Oh no, it's still super useful. There are a ton of corner cases where
> 'if you're on same same-vendor same-gen same-silicon hardware' falls
> apart - in addition to the world just not being very much
> same-vendor/same-gen/same-silicon anymore. For some concrete examples:
>
> On NVIDIA Tegra hardware, planes within the display controller have
> heterogeneous capability. Some can decompress and detile, others
> can't.
>
> On Rockchip hardware, AFBC (DCC equivalent) is available for scanout
> on any plane, and can be produced by the GPU. Great! Except that 'any
> plane' isn't 'every plane' - there's a global decompression unit.
>
> On Intel hardware, they appear to have forked the media codec IP,
> shipping two different versions of the codec, one as 'low-power' and
> one as 'normal', obviously with varying capability.
>
> Even handwaving those away as vendor errors - that performance on
> those gens will always be pessimal and they should do better next time
> - I don't think same-vendor/same-gen/same-silicon is a good design
> point anymore. Between heterogeneous cut-and-paste SoCs, multi-GPU and
> eGPU usecases, virtualisation and tunneling, etc, the usecases are
> starting to demand that we do better. Vulkan's memory-allocation
> design also really pushes against the model that memory allocations
> themselves are blessed with side-channel descriptor tags.
>
> 'Those aren't my usecases and we've made Vulkan work so we don't need
> it' is an entirely reasonable position, but then you're just
> exchanging the problem of describing your tiling & compression layouts
> in a 56-bit enum to make modifiers work, for the problem of
> maintaining a surprisingly wide chunk of the display stack. For all
> the reasons above, over the past few years, the entire rest of the
> ecosystem has settled on using modifiers to describe and negotiate
> buffer exchange across context/process/protocol/subsystem/device
> boundaries. All the effort of making this work in KMS, GBM, EGL,
> Vulkan, Wayland, X11, V4L2, VA-API, GStreamer, etc, is going there.
>
> Realistically, the non-modifier path is probably going to bitrot, and
> people are certainly resistant to putting more smarts into it, because
> it just adds complexity to a now-single-vendor path - even NVIDIA are
> pushing this forward, and their display path is much more of an
> encapsulated magic tunnel than AMD's. In that sense, it's pretty much
> accumulating technical debt; the longer you avoid dealing with the
> display stack by implementing modifiers, the more work you have to put
> into maintaining the display stack by fixing the non-modifier path.
>
> > It doesn't seem to provide much over the current EGL
> > hints (SCANOUT, SECURE, etc.).
>
> Well yeah, if those single bits of information are enough to perfectly
> encapsulate everything you need to know, then sure. But it hasn't been
> for others, which is why we've all migrated away from them.
>
> > I still don't understand how it solves
> > the DCC problem though.  Compression and encryption seem kind like
> > meta modifiers.  There is an under laying high level layout, linear,
> > tiled, etc. but it could also be compressed and/or encrypted.  Is the
> > idea that those are separate modifiers?  E.g.,
> > 0: linear
> > 1: linear | encrypted
> > 2. linear | compressed
> > 3: linear | encrypted | compressed
> > 4: tiled1
> > 5: tiled1 | encrypted
> > 6: tiled1 | compressed
> > 7: tiled1 | encrypted | compressed
> > etc.
> > Or that the modifiers only expose the high level layout, and it's then
> > up the the driver(s) to enable compression, etc. if both sides have a
> > compatible layout?
>
> Do you remember the old wfb from xserver? Think of modifiers as pretty
> much that. The format (e.g. A8R8G8B8) describes what you will read
> when you load a particular pixel/texel, and what will get stored when
> you write. The modifier describes how to get there: that includes both
> tiling (since you need to know the particular tiling layout in order
> to know the byte location to access), and compression (since you need
> to know the particular compression mechanism in order to access the
> pixel, e.g. for RLE-type compression that you need to access the first
> pixel of the tile if the 'all pixels are the identical' bit is set).
>
> The idea is that these tokens fully describe the mechanisms in use,
> without the drivers needing to do magic heuristics. For instance, if
> your modifier is just 'tiled', then that's not a full description. A
> full description would tell you about supertiling structures, tile
> sizes and ordering, etc. The definitions already in
> include/uapi/drm/drm_fourcc.h are a bit of a mixed bag - we've
> definitely learnt more as we've gone on - but the NVIDIA definitions
> are  pretty exemplary for something deeply parameterised along a lot
> of variable axes.
>
> Basically, if you have to have sets of heuristics which you keep in
> sync in order to translate from modifier -> hardware layout params,
> then your modifiers aren't expressive enough. From a very quick look
> at DC, that would be your tile-split, tile-mode, array-mode, and
> swizzle-mode parameters, plus whatever from dc_tiling_mode isn't
> completely static and deterministic. 'DCCRate' always appears to be
> hardcoded to 1 (and 'DCCRateChroma' never set), but that might be one
> to parameterise as well.
>
> With that expression, you don't have to determine the tiling layout
> from dimensions/usage/etc, because the modifier _is_ the tiling
> layout, ditto compression.
>
> Encryption I'm minded to consider as something different. Modifiers
> don't cover buffer placement at all. That includes whether or not the
> memory is physically contiguous, whether it's in
> hidden-VRAM/BAR/sysmem, which device it lives on, etc. As far as I can
> tell from TMZ, encryption is essentially a side effect of placement?
> The memory is encrypted, the encryption is an immutable property of
> the allocation, and if the device is configured to access encrypted
> memory (by being 'secure'), then the encryption is transparent, no?
>
> That being said, there is a reasonable argument to consume a single
> bit in modifiers for TMZ on/off (assuming TMZ is not parameterised),
> which would make its availability and use much more transparent.
>
> Cheers,
> Daniel
>

--00000000000021e94805a7328c7e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>TMZ is more complicated. If there is a TMZ buffer use=
d by a command buffer, then all other used buffers must also be TMZ or read=
 only. If no TMZ buffers are used by a command buffer, then TMZ is disabled=
. If a context is not secure, TMZ is also disabled. A context can switch be=
tween secure and non-secure based on the buffers being used.<br></div><div>=
<br></div><div>So mixing secure and non-secure memory writes in one command=
 buffer won&#39;t work. This is not fixable in the driver - apps must be aw=
are of this.<br></div><div><br></div><div>Marek<br></div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 3, 202=
0 at 5:50 AM Daniel Stone &lt;<a href=3D"mailto:daniel@fooishbar.org" targe=
t=3D"_blank">daniel@fooishbar.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hi Alex,<br>
<br>
On Mon, 1 Jun 2020 at 15:25, Alex Deucher &lt;<a href=3D"mailto:alexdeucher=
@gmail.com" target=3D"_blank">alexdeucher@gmail.com</a>&gt; wrote:<br>
&gt; On Fri, May 29, 2020 at 11:03 AM Daniel Stone &lt;<a href=3D"mailto:da=
niel@fooishbar.org" target=3D"_blank">daniel@fooishbar.org</a>&gt; wrote:<b=
r>
&gt; &gt; What Weston _does_ know, however, is that display controller can =
work<br>
&gt; &gt; with modifier set A, and the GPU can work with modifier set B, an=
d if<br>
&gt; &gt; the client can pick something from modifier set A, then there is =
a<br>
&gt; &gt; much greater probability that Weston can leave the GPU alone so i=
t can<br>
&gt; &gt; be entirely used by the client. It also knows that if the surface=
<br>
&gt; &gt; can&#39;t be directly scanned out for whatever reason, then there=
&#39;s no<br>
&gt; &gt; point in the client optimising for direct scanout, and it can tel=
l the<br>
&gt; &gt; client to select based on optimality purely for the GPU.<br>
&gt;<br>
&gt; Just so I understand this correctly, the main reason for this is to<br=
>
&gt; deal with display hardware and render hardware from different vendors<=
br>
&gt; which may or may not support any common formats other than linear.<br>
<br>
It handles pretty much everything other than a single-context,<br>
single-GPU, single-device, tunnel.<br>
<br>
When sharing between subsystems and device categories, it lets us talk<br>
about capabilities in a more global way. For example, GBM lets you<br>
talk about &#39;scanout&#39; and &#39;texture&#39; and &#39;render&#39;, bu=
t what about media<br>
codecs? We could add the concept of decode/encode to something like<br>
GBM, and all the protocols like Wayland/X11 as well, then hope it<br>
actually works, but ...<br>
<br>
When sharing between heterogeneous vendors, it lets us talk about<br>
capabilities in a neutral way. For example, if you look at most modern<br>
Arm SoCs, your GPU, display controller, and media codec, will very<br>
likely all be from three totally different vendors. A GPU like<br>
Mali-T8xx can be shipped in tens of different vendor SoCs in several<br>
different revisions each. Just saying &#39;scanout&#39; is totally meaningl=
ess<br>
for the Panfrost driver. Putting awareness for every different KMS<br>
platform and every different codec down into the Mesa driver is a<br>
synchronisation nightmare, and all those drivers would also need<br>
specific awareness about the Mesa driver. So modifiers allow us to<br>
explicitly describe that we want a particular revision of Arm<br>
Framebuffer Compression, and all the components can understand that<br>
without having to be specifically aware of 15 different KMS drivers.<br>
But even if you have the same vendor ...<br>
<br>
When sharing between multiple devices of the same class from the same<br>
vendor, it lets us surface and transit that information in a generic<br>
way, without AMD having to figure out ways to tunnel back-channel<br>
information between different instances of drivers potentially<br>
targeting different revisions. The alternatives seem to be deeply<br>
pessimal hacks, and we think we can do better. And when we get<br>
pessimal ...<br>
<br>
In every case, modifiers are about surfacing and sharing information.<br>
One of the reasons Collabora have been putting so much time and energy<br>
into this work is exactly _because_ solving those problems on a<br>
case-by-case basis was a pretty lucrative source of revenue for us.<br>
Debugging these kinds of issues before has usually involved specific<br>
driver knowledge, hacking into the driver to insert your own tracing,<br>
etc.<br>
<br>
If you (as someone who&#39;s trying to use a device optimally) are<br>
fortunate enough that you can get the attention of a vendor and have<br>
them solve the problem for you, then that&#39;s lucky for everyone apart<br=
>
from the AMD engineers who have to go solve it. If you&#39;re not, and you<=
br>
can&#39;t figure it out yourself, then you have to go pay a consultancy.<br=
>
On the face of it, that&#39;s good for us, except that we don&#39;t want to=
 be<br>
doing that kind of repetitive boring work. But it&#39;s bad for the<br>
ecosystem that this knowledge is hidden away and that you have to pay<br>
specialists to extract it. So we&#39;re really keen to surface as much<br>
mechanism and information as possible, to give people the tools to<br>
either solve their own problems or at least make well-informed<br>
reports, burn down a toxic source of revenue, waste less engineering<br>
time extracting hidden information, and empower users as much as<br>
possible.<br>
<br>
&gt; It<br>
&gt; provides a way to tunnel device capabilities between the different<br>
&gt; drivers.=C2=A0 In the case of a device with display and rendering on t=
he<br>
&gt; same device or multiple devices from the same vendor, it not really<br=
>
&gt; that useful.<br>
<br>
Oh no, it&#39;s still super useful. There are a ton of corner cases where<b=
r>
&#39;if you&#39;re on same same-vendor same-gen same-silicon hardware&#39; =
falls<br>
apart - in addition to the world just not being very much<br>
same-vendor/same-gen/same-silicon anymore. For some concrete examples:<br>
<br>
On NVIDIA Tegra hardware, planes within the display controller have<br>
heterogeneous capability. Some can decompress and detile, others<br>
can&#39;t.<br>
<br>
On Rockchip hardware, AFBC (DCC equivalent) is available for scanout<br>
on any plane, and can be produced by the GPU. Great! Except that &#39;any<b=
r>
plane&#39; isn&#39;t &#39;every plane&#39; - there&#39;s a global decompres=
sion unit.<br>
<br>
On Intel hardware, they appear to have forked the media codec IP,<br>
shipping two different versions of the codec, one as &#39;low-power&#39; an=
d<br>
one as &#39;normal&#39;, obviously with varying capability.<br>
<br>
Even handwaving those away as vendor errors - that performance on<br>
those gens will always be pessimal and they should do better next time<br>
- I don&#39;t think same-vendor/same-gen/same-silicon is a good design<br>
point anymore. Between heterogeneous cut-and-paste SoCs, multi-GPU and<br>
eGPU usecases, virtualisation and tunneling, etc, the usecases are<br>
starting to demand that we do better. Vulkan&#39;s memory-allocation<br>
design also really pushes against the model that memory allocations<br>
themselves are blessed with side-channel descriptor tags.<br>
<br>
&#39;Those aren&#39;t my usecases and we&#39;ve made Vulkan work so we don&=
#39;t need<br>
it&#39; is an entirely reasonable position, but then you&#39;re just<br>
exchanging the problem of describing your tiling &amp; compression layouts<=
br>
in a 56-bit enum to make modifiers work, for the problem of<br>
maintaining a surprisingly wide chunk of the display stack. For all<br>
the reasons above, over the past few years, the entire rest of the<br>
ecosystem has settled on using modifiers to describe and negotiate<br>
buffer exchange across context/process/protocol/subsystem/device<br>
boundaries. All the effort of making this work in KMS, GBM, EGL,<br>
Vulkan, Wayland, X11, V4L2, VA-API, GStreamer, etc, is going there.<br>
<br>
Realistically, the non-modifier path is probably going to bitrot, and<br>
people are certainly resistant to putting more smarts into it, because<br>
it just adds complexity to a now-single-vendor path - even NVIDIA are<br>
pushing this forward, and their display path is much more of an<br>
encapsulated magic tunnel than AMD&#39;s. In that sense, it&#39;s pretty mu=
ch<br>
accumulating technical debt; the longer you avoid dealing with the<br>
display stack by implementing modifiers, the more work you have to put<br>
into maintaining the display stack by fixing the non-modifier path.<br>
<br>
&gt; It doesn&#39;t seem to provide much over the current EGL<br>
&gt; hints (SCANOUT, SECURE, etc.).<br>
<br>
Well yeah, if those single bits of information are enough to perfectly<br>
encapsulate everything you need to know, then sure. But it hasn&#39;t been<=
br>
for others, which is why we&#39;ve all migrated away from them.<br>
<br>
&gt; I still don&#39;t understand how it solves<br>
&gt; the DCC problem though.=C2=A0 Compression and encryption seem kind lik=
e<br>
&gt; meta modifiers.=C2=A0 There is an under laying high level layout, line=
ar,<br>
&gt; tiled, etc. but it could also be compressed and/or encrypted.=C2=A0 Is=
 the<br>
&gt; idea that those are separate modifiers?=C2=A0 E.g.,<br>
&gt; 0: linear<br>
&gt; 1: linear | encrypted<br>
&gt; 2. linear | compressed<br>
&gt; 3: linear | encrypted | compressed<br>
&gt; 4: tiled1<br>
&gt; 5: tiled1 | encrypted<br>
&gt; 6: tiled1 | compressed<br>
&gt; 7: tiled1 | encrypted | compressed<br>
&gt; etc.<br>
&gt; Or that the modifiers only expose the high level layout, and it&#39;s =
then<br>
&gt; up the the driver(s) to enable compression, etc. if both sides have a<=
br>
&gt; compatible layout?<br>
<br>
Do you remember the old wfb from xserver? Think of modifiers as pretty<br>
much that. The format (e.g. A8R8G8B8) describes what you will read<br>
when you load a particular pixel/texel, and what will get stored when<br>
you write. The modifier describes how to get there: that includes both<br>
tiling (since you need to know the particular tiling layout in order<br>
to know the byte location to access), and compression (since you need<br>
to know the particular compression mechanism in order to access the<br>
pixel, e.g. for RLE-type compression that you need to access the first<br>
pixel of the tile if the &#39;all pixels are the identical&#39; bit is set)=
.<br>
<br>
The idea is that these tokens fully describe the mechanisms in use,<br>
without the drivers needing to do magic heuristics. For instance, if<br>
your modifier is just &#39;tiled&#39;, then that&#39;s not a full descripti=
on. A<br>
full description would tell you about supertiling structures, tile<br>
sizes and ordering, etc. The definitions already in<br>
include/uapi/drm/drm_fourcc.h are a bit of a mixed bag - we&#39;ve<br>
definitely learnt more as we&#39;ve gone on - but the NVIDIA definitions<br=
>
are=C2=A0 pretty exemplary for something deeply parameterised along a lot<b=
r>
of variable axes.<br>
<br>
Basically, if you have to have sets of heuristics which you keep in<br>
sync in order to translate from modifier -&gt; hardware layout params,<br>
then your modifiers aren&#39;t expressive enough. From a very quick look<br=
>
at DC, that would be your tile-split, tile-mode, array-mode, and<br>
swizzle-mode parameters, plus whatever from dc_tiling_mode isn&#39;t<br>
completely static and deterministic. &#39;DCCRate&#39; always appears to be=
<br>
hardcoded to 1 (and &#39;DCCRateChroma&#39; never set), but that might be o=
ne<br>
to parameterise as well.<br>
<br>
With that expression, you don&#39;t have to determine the tiling layout<br>
from dimensions/usage/etc, because the modifier _is_ the tiling<br>
layout, ditto compression.<br>
<br>
Encryption I&#39;m minded to consider as something different. Modifiers<br>
don&#39;t cover buffer placement at all. That includes whether or not the<b=
r>
memory is physically contiguous, whether it&#39;s in<br>
hidden-VRAM/BAR/sysmem, which device it lives on, etc. As far as I can<br>
tell from TMZ, encryption is essentially a side effect of placement?<br>
The memory is encrypted, the encryption is an immutable property of<br>
the allocation, and if the device is configured to access encrypted<br>
memory (by being &#39;secure&#39;), then the encryption is transparent, no?=
<br>
<br>
That being said, there is a reasonable argument to consume a single<br>
bit in modifiers for TMZ on/off (assuming TMZ is not parameterised),<br>
which would make its availability and use much more transparent.<br>
<br>
Cheers,<br>
Daniel<br>
</blockquote></div>

--00000000000021e94805a7328c7e--

--===============0141432801==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0141432801==--
