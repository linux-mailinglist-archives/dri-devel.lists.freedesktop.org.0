Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6510BA15B1E
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jan 2025 03:39:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D526910E332;
	Sat, 18 Jan 2025 02:39:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KfFm2YMc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com
 [209.85.160.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7583B10E32C;
 Sat, 18 Jan 2025 02:39:20 +0000 (UTC)
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-2a016ef0822so63568fac.0; 
 Fri, 17 Jan 2025 18:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737167899; x=1737772699; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IAbJVSBhvKB/Vnp4nWOV0+x50/nKWwhXDTl4//4/izo=;
 b=KfFm2YMcT67aRqBBP0qgbLw1oOpASuOkh8BFyzSQ9RKyqND0PUbcbeoZOIVnhz/ygv
 QpMvjfX/UeJ8zEvjrE+eX6upQl5p1JLgOSehLAoNRcTlaCU3kTYJ7N5MzjsMNhRb+qp6
 9sGYJQXF+PWDUV6AcOMdyoB4tG1+RcXsj1FLqoUmnLZv/kGSybItFq/TKxRS8CxonLzE
 fOTGZ5/Xk4SG3FNveiSnaGOfN+drRawObwiMEVkAfVnv+EV7/BLXI8tOtEM7i4lVgsF4
 4xcpJEt7W6oL0DuXngupwf7H2XpzN81go6xf51AoKDYmu6hv71aUy/Ldt4nrxuB6XEZy
 g4dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737167899; x=1737772699;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IAbJVSBhvKB/Vnp4nWOV0+x50/nKWwhXDTl4//4/izo=;
 b=Zk2pTHCzNLZkuS9g7JiAhnWZEBegMX0Z677Xg1ePLBzmswY46OeLO4EgAPdL5jLQMh
 DYKNcguaXby8l750oKq0KKRyjjvjh9voOR01zjHjSe0bFUridrFH9S1qx0da4oSkBGDN
 q6harTd7p4Ak+WjiX/UZaY5MvX5q4PP+7jc068qUR/WrBypJdCw0oRjov5yUkBQ0RplJ
 jv9r5Qy9X45icCg9+WtLTs9e9/Cu9u36p9mt1gp4FewbuuPblklHRutwRc/1WBKJtOH6
 sBmqqZVSO3FDUozCZxunuqpFcpsbJCNj+CnZqwUPME77skSniXJh/U9H3ewKqC+PQ/uE
 Wh4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUg6DXQyXlcgPvSFddWq6owLc7XEvd2JS+DbdA2Axap9qlpYoRW/e8w7+eVZYcecQbYStPxFo4TMkzM@lists.freedesktop.org,
 AJvYcCWdX36xG0qz8lFF1RlBIrYLUqncesq83VI40Dg5+onlLi9LWhRefMPcNsA3lAqeqRFUQVVLSbgZ@lists.freedesktop.org,
 AJvYcCX4UyWiku+oXIrvz8Sn+CZBxbhHZ+AU4EoweYCRyhe2mUiRG/MfCHXL3mqI/ZSX21eOfc1sHLPZfrk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzbf6ieMzjmV5yNJz3JZgkY1qdPSFQfJkcSgxESQckVEutt3Q5C
 TV+7SIAMU4J0D+nNH+fs0xv+6ssJ+GbBGUq0KUzIxNisjM/NiKI3cm4UC79eeJMQ8ARlx7OHDNB
 FOYLW889wyjgLJ2zsfPAm8LShrjk=
X-Gm-Gg: ASbGncsUl+FvToxDPQUjFGoblHfjqtecX62yq+ziZcHp/abLdJX+Pi4sITmqqCfU5cP
 363dQ/WMrKVV5ZJUJNsaVNVFy6j98hWCNfdQFO7Iw+PB8p1T1cEE+6A==
X-Google-Smtp-Source: AGHT+IFl/o/xQp6BQ9SLIjW4Y2taoTl/ofjk45viDlxxUGX3NtQrOFqy9xX4SdlzjK5YRhkwKKfXUyb+0oqSYmByzow=
X-Received: by 2002:a05:6870:224b:b0:29e:4111:fef4 with SMTP id
 586e51a60fabf-2b1c0aafb52mr1021706fac.6.1737167899483; Fri, 17 Jan 2025
 18:38:19 -0800 (PST)
MIME-Version: 1.0
References: <8dae97c9-9286-451a-8122-b309eb21b2f4@mailbox.org>
 <Z2Ki-lQH4Fbch6RO@phenom.ffwll.local>
 <q45c43j5kwwvemec7mcs4kqzt54pa3nz3jlhkcky2v63s2vfie@him4q253uw4p>
 <CAPj87rMFJ0JRvsKqZUsw_EGrFWr1VLO4Ne2w_bZ5cH+gs_d=og@mail.gmail.com>
 <Z2Rf7mpSuzZ0ObmT@phenom.ffwll.local>
 <07d08a42-c44a-477e-8057-721b270310cf@nvidia.com>
 <CAAxE2A6N0xtgZmzTR9FXMN79xxy3T8zfhh1sz73h1h8=0ycJ2g@mail.gmail.com>
 <CAPj87rP4r4q-wBx1dHsEkZ7=S2c2XsbA1Pz4Skw1ETt_2yD2Ag@mail.gmail.com>
 <CAAxE2A6ghBK2VTLkNXgk1c61UG1ZQAzWQ4q=wO-OShAUC9eRmQ@mail.gmail.com>
 <CAPj87rNFy7GLAjjxDYGLN-f8M0F7yMX6PED94O4kBJ=pwtPVyA@mail.gmail.com>
 <Z4pmnTy1NYD3rLwS@phenom.ffwll.local>
In-Reply-To: <Z4pmnTy1NYD3rLwS@phenom.ffwll.local>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Fri, 17 Jan 2025 21:37:43 -0500
X-Gm-Features: AbW1kvY5IuxtPnPVKEKRkX4PWmyPXyweVxRigqqH0P53rbUjRCvTfoymuD2Dn1o
Message-ID: <CAAxE2A6iDsN=YKW2F7WyyZxn4Sw4Dr5CxZminQGwf8awBivovQ@mail.gmail.com>
Subject: Re: [PATCH] drm/fourcc: add LINEAR modifiers with an exact pitch
 alignment
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Daniel Stone <daniel@fooishbar.org>, James Jones <jajones@nvidia.com>, 
 Brian Starkey <brian.starkey@arm.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>, 
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>, nd@arm.com, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: multipart/alternative; boundary="0000000000009066f8062bf1eb7f"
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

--0000000000009066f8062bf1eb7f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

If DRM_FORMAT_MOD_LINEAR stays, then most of this discussion is irrelevant.
If you don't like the new linear modifiers, don't use them. If that's you,
bye.

For the rest, there are multiple solutions:

1) New vendor-agnostic linear modifiers. The reason why we would want them
is that they define robust functions for (x,y,w)->address, (w,h)->size, and
alignment. All 2^32 (roughly) AMD modifiers have such functions in Mesa
(really). Linear modifiers would work in the same way.

2) New cross-vendor modifier defining 1 layout for the existing case. This
is not less effort than 1). It's just a different #define, but limited to
only 1 case. Why bother. Is it really worth debating so much whether
#define should have 0 parameters instead of 5? If nobody else uses 1), so
what?

3) Implementing DRM_FORMAT_MOD_LINEAR as having 256B pitch and offset
alignment. This is what we do today. Even if Intel and some AMD chips can
do 64B or 128B alignment, they overalign to 256B. With so many AMD+NV
laptops out there, NV is probably next, unless they already do this in the
closed source driver.

Marek

On Fri, Jan 17, 2025 at 9:18=E2=80=AFAM Simona Vetter <simona.vetter@ffwll.=
ch>
wrote:

> On Wed, Jan 15, 2025 at 12:20:07PM +0000, Daniel Stone wrote:
> > On Wed, 15 Jan 2025 at 04:05, Marek Ol=C5=A1=C3=A1k <maraeo@gmail.com> =
wrote:
> > > On Tue, Jan 14, 2025 at 12:58=E2=80=AFPM Daniel Stone <daniel@fooishb=
ar.org>
> wrote:
> > >> AMD hardware is the only hardware I know of which doesn't support
> > >> overaligning. Say (not hypothetically) we have a GPU and a display
> > >> controller which have a minimum pitch alignment of 32 bytes, no
> > >> minimum height alignment, minimum 32-byte offset alignment, minimum
> > >> pitch of 32 bytes, and minimum image size of 32 bytes.
> > >>
> > >> To be maximally compatible, we'd have to expose 28 (pitch align) * 3=
2
> > >> (height align) * 28 (offset align) * 28 (min pitch) * 28 (min size) =
=3D=3D
> > >> 19668992 individual modifiers when queried, which is 150MB per forma=
t
> > >> just to store the list of modifiers.
> > >
> > > Maximum compatibility is not required nor expected.
> > >
> > > In your case, only 1 linear modifier would be added for that driver,
> which is: [5 / 0 / 5 / 5 / 5]
> > >
> > > Then if, and only if, compatibility with other devices is desired, th=
e
> driver developer could look at drivers of those other devices and determi=
ne
> which other linear modifiers to add. Ideally it would be just 1, so there
> would be a total of 2.
> >
> > Mali (actually two DRM drivers and sort of three Mesa drivers) can be
> > paired with any one of 11 KMS drivers (really 12 given that one is a
> > very independent subdriver), and something like 20 different codecs
> > (at least 12 different vendors; I didn't bother counting the actual
> > subdrivers which are all quite different). The VeriSilicon Hantro G2
> > codec driver is shipped by five (that we know of) vendors who all have
> > their own KMS drivers. One of those is in the Rockchip RK3588, which
> > (don't ask me why) ships six different codec blocks, with three
> > different drivers, from two different vendors - that's before you even
> > get to things like the ISP and NPU which really need to be sharing
> > buffers properly without copies.
> >
> > So yeah, working widely without having to encode specific knowledge
> > everywhere isn't a nice-to-have, it's a hard baseline requirement.
> >
> > >> > DRM_FORMAT_MOD_LINEAR needs to go because it prevents apps from
> detecting whether 2 devices have 0 compatible memory layouts, which is a
> useful thing to know.
> > >>
> > >> I get the point, but again, we have the exact same problem today wit=
h
> > >> placement, i.e. some devices require buffers to be in or not be in
> > >> VRAM or GTT or sysram for some uses, and some devices require physic=
al
> > >> contiguity. Solving that problem would require an additional 4 bits,
> > >> which brings us to 2.3GB of modifiers per format with the current
> > >> scheme. Not super viable.
> > >
> > > Userspace doesn't determine placement. The kernel memory management
> can move buffers between heaps to accommodate sharing between devices as
> needed. This is a problem in which userspace has no say.
> >
> > It really does though!
> >
> > None of these devices use TTM with placement moves, and doing that
> > isn't a fix either. Embedded systems have so low memory bandwidth that
> > the difference between choosing the wrong placement and moving it
> > later vs. having the right placement to begin with is the difference
> > between 'this does not work' and 'great, I can ship this'. Which is
> > great if you're a consultancy trying to get paid, but tbh I'd rather
> > work on more interesting things.
> >
> > So yeah, userspace does very much choose the placement. On most
> > drivers, this is either by 'knowing' which device to allocate from, or
> > passing a flag to your allocation ioctl. For newer drivers though,
> > there's the dma-heap allocation mechanism which is now upstream and
> > the blessed path, for which userspace needs to explicitly know the
> > desired placement (and must, because fixing it up later is a
> > non-starter).
> >
> > Given that we need to keep LINEAR ~forever for ABI reasons, and
> > because there's no reasonably workable alternative, let's abandon the
> > idea of abandoning LINEAR, and try to work with out-of-band signalling
> > instead.
> >
> > One idea is to actually pursue the allocator idea and express this
> > properly through constraints. I'd be super in favour of this,
> > unsurprisingly, because it allows us to solve a whole pile of other
> > problems, rather than the extremely narrow AMD/Intel interop case.
> >
> > Another idea for the out-of-band signalling would be to add
> > information-only modifiers, like
> > DRM_FORMAT_MOD_LINEAR_PITCH_ALIGN_EQ(256), or
> > DRM_FORMAT_MOD_LINEAR_PITCH_ALIGN_GE(32). But then that doesn't really
> > work at all with how people actually use modifiers: as the doc
> > describes, userspace takes and intersects the declared modifier lists
> > and passes the result through. The intersection of LINEAR+EQ256 and
> > LINEAR+GE32 is LINEAR, so a userspace that follows the rules will just
> > drop the hints on the floor and pick whatever linear allocation it
> > feels like.
>
> Yeah I think latest when we also take into account logical image size (no=
t
> just pitch) with stuff like it needs to be aligned to 2 pixels in both
> directions just using modifiers falls apart.
>
> And the problem with linear, unlike device modifiers is that we can't jus=
t
> throw up our hands and enumerate the handful of formats in actual use for
> interop. There's so many produces and consumers of linera buffers
> (Daniel's list above missed camera/image processors) that save assumption
> is that anything really can happen.
>
> > I think I've just talked myself into the position that passing
> > allocator constraints together with modifiers is the only way to
> > actually solve this problem, at least without creating the sort of
> > technical debt that meant we spent years fixing up implicit/explicit
> > modifier interactions when it really should've just been adding a
> > !)@*(#$ u64 next to the u32.
>
> Yeah probably.
>
> Otoh I know inertia, so I am tempted to go with the oddball
> LINEAR_VEDNOR_A_VENDOR_B_INTEROP thing and stretch the runway for a bit.
> And we just assign those as we go as a very special thing, and the driver=
s
> that support it would prefer it above just LINEAR if there's no other
> common format left.
>
> Also makes it really obvious what all userspace/kernel driver enabling
> would be needed to justify such a modifier.
> -Sima
>
> >
> > Cheers,
> > Daniel
>
> --
> Simona Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>

--0000000000009066f8062bf1eb7f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>If <span class=3D"gmail-im">DRM_FORMAT_MOD_LINEAR sta=
ys, then most of this discussion is irrelevant. If you don&#39;t like the n=
ew linear modifiers, don&#39;t use them. If that&#39;s you, bye.</span></di=
v><div><span class=3D"gmail-im"><br></span></div><div><span class=3D"gmail-=
im">For the rest, there are multiple solutions:</span></div><div><span clas=
s=3D"gmail-im"><br></span></div><div><span class=3D"gmail-im">1) New vendor=
-agnostic linear modifiers. The reason why we would want them is that they =
define robust functions for </span><span class=3D"gmail-im">(x,y,w)-&gt;add=
ress, (w,h)-&gt;size, and alignment. All 2^32 (roughly) AMD modifiers have =
such functions in Mesa (really).</span><span class=3D"gmail-im"> Linear mod=
ifiers would work in the same way.<br></span></div><div><span class=3D"gmai=
l-im"><br></span></div><div><span class=3D"gmail-im">2) New cross-vendor mo=
difier defining 1 layout for the existing case.=C2=A0</span><span class=3D"=
gmail-im">This is not less effort than 1). It&#39;s just a different #defin=
e, but limited to only 1 case.</span><span class=3D"gmail-im"> Why bother. =
Is it really worth debating so much whether #define should have 0 parameter=
s instead of 5? If nobody else uses 1), so what?<br></span></div><div><span=
 class=3D"gmail-im"><br></span></div><div><span class=3D"gmail-im">3) Imple=
menting </span><span class=3D"gmail-im">DRM_FORMAT_MOD_LINEAR as having 256=
B pitch and offset alignment. This is what we do today. Even if Intel and s=
ome AMD chips can do 64B or 128B alignment, they overalign to 256B. </span>=
<span class=3D"gmail-im">With so many AMD+NV laptops out there, NV is proba=
bly next, unless they already do this in the closed source driver.</span></=
div><div><span class=3D"gmail-im"><br></span></div><div><span class=3D"gmai=
l-im">Marek<br></span></div><div><span class=3D"gmail-im"></span></div></di=
v><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Fri, Jan 17, 2025 at 9:18=E2=80=AFAM Simona Vetter &lt=
;<a href=3D"mailto:simona.vetter@ffwll.ch">simona.vetter@ffwll.ch</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Ja=
n 15, 2025 at 12:20:07PM +0000, Daniel Stone wrote:<br>
&gt; On Wed, 15 Jan 2025 at 04:05, Marek Ol=C5=A1=C3=A1k &lt;<a href=3D"mai=
lto:maraeo@gmail.com" target=3D"_blank">maraeo@gmail.com</a>&gt; wrote:<br>
&gt; &gt; On Tue, Jan 14, 2025 at 12:58=E2=80=AFPM Daniel Stone &lt;<a href=
=3D"mailto:daniel@fooishbar.org" target=3D"_blank">daniel@fooishbar.org</a>=
&gt; wrote:<br>
&gt; &gt;&gt; AMD hardware is the only hardware I know of which doesn&#39;t=
 support<br>
&gt; &gt;&gt; overaligning. Say (not hypothetically) we have a GPU and a di=
splay<br>
&gt; &gt;&gt; controller which have a minimum pitch alignment of 32 bytes, =
no<br>
&gt; &gt;&gt; minimum height alignment, minimum 32-byte offset alignment, m=
inimum<br>
&gt; &gt;&gt; pitch of 32 bytes, and minimum image size of 32 bytes.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; To be maximally compatible, we&#39;d have to expose 28 (pitch=
 align) * 32<br>
&gt; &gt;&gt; (height align) * 28 (offset align) * 28 (min pitch) * 28 (min=
 size) =3D=3D<br>
&gt; &gt;&gt; 19668992 individual modifiers when queried, which is 150MB pe=
r format<br>
&gt; &gt;&gt; just to store the list of modifiers.<br>
&gt; &gt;<br>
&gt; &gt; Maximum compatibility is not required nor expected.<br>
&gt; &gt;<br>
&gt; &gt; In your case, only 1 linear modifier would be added for that driv=
er, which is: [5 / 0 / 5 / 5 / 5]<br>
&gt; &gt;<br>
&gt; &gt; Then if, and only if, compatibility with other devices is desired=
, the driver developer could look at drivers of those other devices and det=
ermine which other linear modifiers to add. Ideally it would be just 1, so =
there would be a total of 2.<br>
&gt; <br>
&gt; Mali (actually two DRM drivers and sort of three Mesa drivers) can be<=
br>
&gt; paired with any one of 11 KMS drivers (really 12 given that one is a<b=
r>
&gt; very independent subdriver), and something like 20 different codecs<br=
>
&gt; (at least 12 different vendors; I didn&#39;t bother counting the actua=
l<br>
&gt; subdrivers which are all quite different). The VeriSilicon Hantro G2<b=
r>
&gt; codec driver is shipped by five (that we know of) vendors who all have=
<br>
&gt; their own KMS drivers. One of those is in the Rockchip RK3588, which<b=
r>
&gt; (don&#39;t ask me why) ships six different codec blocks, with three<br=
>
&gt; different drivers, from two different vendors - that&#39;s before you =
even<br>
&gt; get to things like the ISP and NPU which really need to be sharing<br>
&gt; buffers properly without copies.<br>
&gt; <br>
&gt; So yeah, working widely without having to encode specific knowledge<br=
>
&gt; everywhere isn&#39;t a nice-to-have, it&#39;s a hard baseline requirem=
ent.<br>
&gt; <br>
&gt; &gt;&gt; &gt; DRM_FORMAT_MOD_LINEAR needs to go because it prevents ap=
ps from detecting whether 2 devices have 0 compatible memory layouts, which=
 is a useful thing to know.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; I get the point, but again, we have the exact same problem to=
day with<br>
&gt; &gt;&gt; placement, i.e. some devices require buffers to be in or not =
be in<br>
&gt; &gt;&gt; VRAM or GTT or sysram for some uses, and some devices require=
 physical<br>
&gt; &gt;&gt; contiguity. Solving that problem would require an additional =
4 bits,<br>
&gt; &gt;&gt; which brings us to 2.3GB of modifiers per format with the cur=
rent<br>
&gt; &gt;&gt; scheme. Not super viable.<br>
&gt; &gt;<br>
&gt; &gt; Userspace doesn&#39;t determine placement. The kernel memory mana=
gement can move buffers between heaps to accommodate sharing between device=
s as needed. This is a problem in which userspace has no say.<br>
&gt; <br>
&gt; It really does though!<br>
&gt; <br>
&gt; None of these devices use TTM with placement moves, and doing that<br>
&gt; isn&#39;t a fix either. Embedded systems have so low memory bandwidth =
that<br>
&gt; the difference between choosing the wrong placement and moving it<br>
&gt; later vs. having the right placement to begin with is the difference<b=
r>
&gt; between &#39;this does not work&#39; and &#39;great, I can ship this&#=
39;. Which is<br>
&gt; great if you&#39;re a consultancy trying to get paid, but tbh I&#39;d =
rather<br>
&gt; work on more interesting things.<br>
&gt; <br>
&gt; So yeah, userspace does very much choose the placement. On most<br>
&gt; drivers, this is either by &#39;knowing&#39; which device to allocate =
from, or<br>
&gt; passing a flag to your allocation ioctl. For newer drivers though,<br>
&gt; there&#39;s the dma-heap allocation mechanism which is now upstream an=
d<br>
&gt; the blessed path, for which userspace needs to explicitly know the<br>
&gt; desired placement (and must, because fixing it up later is a<br>
&gt; non-starter).<br>
&gt; <br>
&gt; Given that we need to keep LINEAR ~forever for ABI reasons, and<br>
&gt; because there&#39;s no reasonably workable alternative, let&#39;s aban=
don the<br>
&gt; idea of abandoning LINEAR, and try to work with out-of-band signalling=
<br>
&gt; instead.<br>
&gt; <br>
&gt; One idea is to actually pursue the allocator idea and express this<br>
&gt; properly through constraints. I&#39;d be super in favour of this,<br>
&gt; unsurprisingly, because it allows us to solve a whole pile of other<br=
>
&gt; problems, rather than the extremely narrow AMD/Intel interop case.<br>
&gt; <br>
&gt; Another idea for the out-of-band signalling would be to add<br>
&gt; information-only modifiers, like<br>
&gt; DRM_FORMAT_MOD_LINEAR_PITCH_ALIGN_EQ(256), or<br>
&gt; DRM_FORMAT_MOD_LINEAR_PITCH_ALIGN_GE(32). But then that doesn&#39;t re=
ally<br>
&gt; work at all with how people actually use modifiers: as the doc<br>
&gt; describes, userspace takes and intersects the declared modifier lists<=
br>
&gt; and passes the result through. The intersection of LINEAR+EQ256 and<br=
>
&gt; LINEAR+GE32 is LINEAR, so a userspace that follows the rules will just=
<br>
&gt; drop the hints on the floor and pick whatever linear allocation it<br>
&gt; feels like.<br>
<br>
Yeah I think latest when we also take into account logical image size (not<=
br>
just pitch) with stuff like it needs to be aligned to 2 pixels in both<br>
directions just using modifiers falls apart.<br>
<br>
And the problem with linear, unlike device modifiers is that we can&#39;t j=
ust<br>
throw up our hands and enumerate the handful of formats in actual use for<b=
r>
interop. There&#39;s so many produces and consumers of linera buffers<br>
(Daniel&#39;s list above missed camera/image processors) that save assumpti=
on<br>
is that anything really can happen.<br>
<br>
&gt; I think I&#39;ve just talked myself into the position that passing<br>
&gt; allocator constraints together with modifiers is the only way to<br>
&gt; actually solve this problem, at least without creating the sort of<br>
&gt; technical debt that meant we spent years fixing up implicit/explicit<b=
r>
&gt; modifier interactions when it really should&#39;ve just been adding a<=
br>
&gt; !)@*(#$ u64 next to the u32.<br>
<br>
Yeah probably.<br>
<br>
Otoh I know inertia, so I am tempted to go with the oddball<br>
LINEAR_VEDNOR_A_VENDOR_B_INTEROP thing and stretch the runway for a bit.<br=
>
And we just assign those as we go as a very special thing, and the drivers<=
br>
that support it would prefer it above just LINEAR if there&#39;s no other<b=
r>
common format left.<br>
<br>
Also makes it really obvious what all userspace/kernel driver enabling<br>
would be needed to justify such a modifier.<br>
-Sima<br>
<br>
&gt; <br>
&gt; Cheers,<br>
&gt; Daniel<br>
<br>
-- <br>
Simona Vetter<br>
Software Engineer, Intel Corporation<br>
<a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer" target=3D"_blank">http:=
//blog.ffwll.ch</a><br>
</blockquote></div>

--0000000000009066f8062bf1eb7f--
