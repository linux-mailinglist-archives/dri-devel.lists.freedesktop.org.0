Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8B5A1032D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 10:39:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70E8210E058;
	Tue, 14 Jan 2025 09:39:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="B74Yyx5r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com
 [209.85.161.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3085F10E058;
 Tue, 14 Jan 2025 09:39:41 +0000 (UTC)
Received: by mail-oo1-f51.google.com with SMTP id
 006d021491bc7-5f2e32b44dfso464841eaf.2; 
 Tue, 14 Jan 2025 01:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736847520; x=1737452320; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2VAS4K/sNGxiVHFseAMlORHvXHwUZ8Ysg0nzNKjj9jc=;
 b=B74Yyx5rTibMnsoVuEQ/KtwnVOPauQV3wsRazQ0YtmQHF0I5N/hz5tsP3DGoShKtE5
 l//4zOlBrQnQT7TNJk+IzCI94zgvjaPgDBf1LvHPO3Nr+LZBk2orACGTpnn+BGBThpo6
 T94uRXUR2OpCzuUvbMjHY6jLX6UGmnPtkkJffAz2qjkQixLeJ6kQFYKXIU76z/bG0/IN
 d6Z/vyQZ5UtUYGT05sB1IN/DVmyYeocC+G60d9IveN1ADUmiAFig8e8q5A7Oq3ldb10P
 znZ3tXirK7LaN0vBkvO+sX7B7rWlkoytLbYL8Ki0yaApUhU6O2CsdZs991x/nTPXqfCd
 40BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736847520; x=1737452320;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2VAS4K/sNGxiVHFseAMlORHvXHwUZ8Ysg0nzNKjj9jc=;
 b=qaO0sAgWT7i1nk/I3RR//Ql4XQwM4gMoJA2pvw+PBwvtneJ2gEMVdZJDFhodsCcMsn
 WxUmfX27Hn70Xu2rcMtZ7ZPVvmTueEXu6MbCDAyWQdeu90tEe+aF6kAqkvSo3JkoUjqc
 cPKiVUjI/d94OUgztksTsy+2oHpeJBTVj6j6A93N2b9VUsaLT23yhLZ5OkhepM2BErQK
 KLR5KDfLb/35/r53sJqphzEMAP4RDJbndKQANgWGiSjNQKKfGm2wb5FAo8N31tu5Zt3V
 +sAsFwYFSLd2eG2aeAZZ61opjXHCjaW+FuvwpuTsFgvPeOOkOk92Fxm82bxHJdOty52+
 oZRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEX0fZ6VR8kLkW+U5MFLdi7M//Lu/ltOiPawRli7WTlwK6BjmeEdhH1ydpfsIgBGX4LFa1qeTbNaRZ@lists.freedesktop.org,
 AJvYcCWYQegLczve9SSvUSGSRDQxLD1c7VZDFy8nkIlczbxm/NXCRdy6674Mgcaw1ALExrD1jWYPpU1VjMk=@lists.freedesktop.org,
 AJvYcCX3xE9pS18WR6wiCIIhq84PLqWeGkEe2M+j0OWVUtccghH4t/P6z25LFmzzjAp2DblJ2UvAF+k+@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1ZHOReJRB1iAfNXECVQSVhdzpcAhSRUm+mt82mq25euHHdmbS
 sM24sD7qVBRe7AcEJ7JxQwFXnVSbrGxj+pxTaLjCkTTscSp51xXLd9B//SQqshzvjyGvOi5xtBF
 Cvq7etmL0rQ4fYzGhWt66zJiu6sI=
X-Gm-Gg: ASbGncu9+8ajRAArOF8amizfY7CFjs22FUhV8LyD+6FIOWmhpABW1zZjiJF0cnao2CN
 BZCfUMhQj5yGdOkLqa+cSLgV2hNlo5umyl7kwetk=
X-Google-Smtp-Source: AGHT+IE1N73mpCpMxK8RvuVe0OTnMDI6NGg4rTg4C4W0r5f4RSI2+TocWuUD2OQfHwYqze0QcmkbQhJmcgm/YUBSl1M=
X-Received: by 2002:a05:6820:1c10:b0:5f2:b6ac:280d with SMTP id
 006d021491bc7-5f73071a54cmr3840410eaf.0.1736847520327; Tue, 14 Jan 2025
 01:38:40 -0800 (PST)
MIME-Version: 1.0
References: <CAAxE2A5BkF13bFt8_UnuiqPM8W-ZESgmKEjqqGfv=DGzSfJ7aQ@mail.gmail.com>
 <uffsfaps6a75zmkyshkwfxgybcslqrnfqqtjzekegdptvwpugc@2ndpcuxyfp3f>
 <c64cb9d8-5ea7-4644-93c8-04a97b758fa0@mailbox.org>
 <h26quuebhpxwkc3fl4vtfteoqyvingnddgxbnzptfnxfg6xgkd@kkkmeqwplomv>
 <8dae97c9-9286-451a-8122-b309eb21b2f4@mailbox.org>
 <Z2Ki-lQH4Fbch6RO@phenom.ffwll.local>
 <q45c43j5kwwvemec7mcs4kqzt54pa3nz3jlhkcky2v63s2vfie@him4q253uw4p>
 <CAPj87rMFJ0JRvsKqZUsw_EGrFWr1VLO4Ne2w_bZ5cH+gs_d=og@mail.gmail.com>
 <Z2Rf7mpSuzZ0ObmT@phenom.ffwll.local>
 <07d08a42-c44a-477e-8057-721b270310cf@nvidia.com>
In-Reply-To: <07d08a42-c44a-477e-8057-721b270310cf@nvidia.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Tue, 14 Jan 2025 04:38:04 -0500
X-Gm-Features: AbW1kvZhrnVwIOXI-r0p9tnmG5LjtiiKGPBQvpF9JnVKKgR6NoZ8Fk0Mm-sThPQ
Message-ID: <CAAxE2A6N0xtgZmzTR9FXMN79xxy3T8zfhh1sz73h1h8=0ycJ2g@mail.gmail.com>
Subject: Re: [PATCH] drm/fourcc: add LINEAR modifiers with an exact pitch
 alignment
To: James Jones <jajones@nvidia.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>,
 Brian Starkey <brian.starkey@arm.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>, 
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>, nd@arm.com, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: multipart/alternative; boundary="0000000000007a7221062ba753c4"
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

--0000000000007a7221062ba753c4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I would keep the existing modifier interfaces, API extensions, and
expectations the same as today for simplicity.

The new linear modifier definition (proposal) will have these fields:
   5 bits for log2 pitch alignment in bytes
   5 bits for log2 height alignment in rows
   5 bits for log2 offset alignment in bytes
   5 bits for log2 minimum pitch in bytes
   5 bits for log2 minimum (2D) image size in bytes

The pitch and the image size in bytes are no longer arbitrary values. They
are fixed values computed from {width, height, bpp, modifier} as follows:
   aligned_width =3D align(width * bpp / 8, 1 << log2_pitch_alignment);
   aligned_height =3D align(height, 1 << log2_height_alignment);
   pitch =3D max(1 << log2_minimum_pitch, aligned_width);
   image_size =3D max(1 << log2_minimum_image_size, pitch * aligned_height)=
;

The modifier defines the layout exactly and non-ambiguously. Overaligning
the pitch or height is not supported. Only the offset alignment has some
freedom regarding placement. Drivers can expose whatever they want within
that definition, even exposing only 1 linear modifier is OK. Then, you can
look at modifiers of other drivers if you want to find commonalities.

DRM_FORMAT_MOD_LINEAR needs to go because it prevents apps from detecting
whether 2 devices have 0 compatible memory layouts, which is a useful thing
to know.

Marek

On Fri, Jan 10, 2025 at 4:23=E2=80=AFPM James Jones <jajones@nvidia.com> wr=
ote:

> On 12/19/24 10:03, Simona Vetter wrote:
> > On Thu, Dec 19, 2024 at 09:02:27AM +0000, Daniel Stone wrote:
> >> On Wed, 18 Dec 2024 at 10:32, Brian Starkey <brian.starkey@arm.com>
> wrote:
> >>> On Wed, Dec 18, 2024 at 11:24:58AM +0000, Simona Vetter wrote:
> >>>> For that reason I think linear modifiers with explicit pitch/size
> >>>> alignment constraints is a sound concept and fits into how modifiers
> work
> >>>> overall.
> >>>
> >>> Could we make it (more) clear that pitch alignment is a "special"
> >>> constraint (in that it's really a description of the buffer layout),
> >>> and that constraints in-general shouldn't be exposed via modifiers?
> >>
> >> It's still worryingly common to see requirements for contiguous
> >> allocation, if for no other reason than we'll all be stuck with
> >> Freescale/NXP i.MX6 for a long time to come. Would that be in scope
> >> for expressing constraints via modifiers as well, and if so, should we
> >> be trying to use feature bits to express this?
> >>
> >> How this would be used in practice is also way too underdocumented. We
> >> need to document that exact-round-up 64b is more restrictive than
> >> any-multiple-of 64b is more restrictive than 'classic' linear. We need
> >> to document what people should advertise - if we were starting from
> >> scratch, the clear answer would be that anything which doesn't care
> >> should advertise all three, anything advertising any-multiple-of
> >> should also advertise exact-round-up, etc.
> >>
> >> But we're not starting from scratch, and since linear is 'special',
> >> userspace already has explicit knowledge of it. So AMD is going to
> >> have to advertise LINEAR forever, because media frameworks know about
> >> DRM_FORMAT_MOD_LINEAR and pass that around explicitly when they know
> >> that the buffer is linear. That and not breaking older userspace
> >> running in containers or as part of a bisect or whatever.
> >>
> >> There's also the question of what e.g. gbm_bo_get_modifier() should
> >> return. Again, if we were starting from scratch, most restrictive
> >> would make sense. But we're not, so I think it has to return LINEAR
> >> for maximum compatibility (because modifiers can't be morphed into
> >> other ones for fun), which further cements that we're not removing
> >> LINEAR.
> >>
> >> And how should allocators determine what to go for? Given that, I
> >> think the only sensible semantics are, when only LINEAR has been
> >> passed, to pick the most restrictive set possible; when LINEAR
> >> variants have been passed as well as LINEAR, to act as if LINEAR were
> >> not passed at all.
> >
> > Yeah I think this makes sense, and we'd need to add that to the kerneld=
oc
> > about how drivers/apps/frameworks need to work with variants of LINEAR.
> >
> > Just deprecating LINEAR does indeed not work. The same way it was reall=
y
> > hard slow crawl (and we're still not there everywhere, if you include
> > stuff like bare metal Xorg) trying to retire the implied modifier. Mayb=
e,
> > in an extremely bright future were all relevant drivers advertise a ful=
l
> > set of LINEAR variants, and all frameworks understand them, we'll get
> > there. But if AMD is the one special case that really needs this I don'=
t
> > think it's realistic to plan for that, and what Daniel describe above
> > looks like the future we're stuck to.
> > -Sima
>
> I spent some time thinking about this over the break, because on a venn
> diagram it does overlap a sliver of the work we've done to define the
> differences between the concepts of constraints Vs. capabilities in the
> smorgasbord of unified memory allocator talks/workshops/prototypes/etc.
> over the years. I'm not that worried about some overlap being
> introduced, because every reasonable rule deserves an exception here and
> there, but I have concerns similar to Daniel's and Brian's.
>
> Once you start adding more than one special modifier, some things in the
> existing usage start to break down. Right now you can naively pass
> around modifiers, then somewhere either before or just after allocation
> depending on your usage, check if LINEAR is available and take your
> special "I can parse this thing" path, for whatever that means in your
> special use case. Modifying all those paths to include one variant of
> linear is probably OK-but-not-great. Modifying all those paths to
> include <N> variants of linear is probably unrealistic, and I do worry
> about slippery slopes here.
>
> ---
>
> What got me more interested though was this led to another thought. At
> first I didn't notice that this was an exact-match constraint and
> thought it meant the usual alignment constraint of >=3D, and I was
> concerned about how future variants would interact poorly. It could
> still be a concern if things progress down this route, and we have
> vendor A requiring >=3D 32B alignment and vendor B requiring =3D=3D 64B
> alignment. They're compatible, but modifiers expressing this would
> naively cancel each-other out unless vendor A proactively advertised =3D=
=3D
> 64B linear modifiers too. This isn't a huge deal at that scale, but it
> could get worse, and it got me thinking about a way to solve the problem
> of a less naive way to merge modifier lists.
>
> As a background, the two hard problems left with implementing a
> constraint system to sit alongside the format modifier system are:
>
> 1) A way to name special heaps (E.g., local vidmem on device A) in the
> constraints in a way that spans process boundaries using some sort of
> identifier. There are various ways to solve this. Lately the thinking is
> something around dma heaps, but no one's fleshed it out yet that I'm awar=
e.
>
> 2) A transport that doesn't require us to revise every userspace API,
> kernel API, and protocol that got revised to support DRM format
> modifiers, and every API/protocol introduced since.
>
> I haven't seen any great ideas for the latter problem yet, but what if
> we did this:
>
> - Introduced a new DRM format modifier vendor that was actually
> vendor-agnostic, but implied the format modifier was a constraint
> definition fragment instead of an actual modifier.
>
> - Constraint-aware code could tack on its constraints (The ones it
> requires and/or the ones it can support allocating) as a series of
> additional modifiers using this vendor code. A given constraint might be
> fragmented into multiple modifiers, but their definition and
> serialization/deserialization mechanism could be defined in drm_fourcc.h
> as macros all the clients could use.
>
> - Existing non-constraint-aware code in a modifier usage chain might
> filter these modifiers out using the existing strict intersection logic.
> Hence, any link in the chain not aware of constraints would likely block
> their use, but that's OK. We're muddling along without them now. It
> wouldn't make those situations any worse.
>
> - New code would be required to use some minimal library (Header-only
> perhaps, as Simon and I proposed a few years ago) to intersect format
> modifier lists instead, and this code would parse out the constraint
> modifiers from each input list and use the envisioned per-constraint
> logic to merge them. It would result in yet another merged
> modifier+constraint list encoded as a list of modifiers that could be
> passed along through any format-modifier-aware API.
>
> - One consideration that would be sort of tricky is that constraints are
> supposed to be advertised per-modifier, so you'd have to have a way to
> associate constraint modifiers in a given set with real modifiers in
> that set or in general. This is easily solved though. Some bits of the
> constraint modifiers would already need to be used to associate and
> order constraint fragments during deserialization, since modifier lists
> aren't strictly ordered.
>
> This effectively allows you to use format modifiers to encode
> arbitrarily complex constraint mechanisms by piggybacking on the
> existing format modifier definition and transport mechanisms without
> breaking backwards compatibility. It's a little dirty, because modifiers
> are being abused to implement a raw bitstream, but modifiers and
> constraints are related concepts, so it's not a complete hack. It still
> requires modifying all the implementations in the system to fully make
> use of constraints, but doesn't require e.g. revising X11 DRI3 protocol
> again to tunnel them through Xwayland, and in situations where the
> constraint-aware thing sits downstream of the non-constraint-aware thing
> in the allocation pipeline, you could get some benefit even when all the
> upstream things aren't updated yet, because it could still merge in its
> local constraints before allocating or passing the modifier list down
> the chain.
>
> Does this seem like something worth pursuing to others? I've been trying
> to decide how to best move the allocation constraints efforts forward,
> so it's potentially something I could put some time into this year.
>
> Thanks,
> -James
>

--0000000000007a7221062ba753c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I would keep the existing modifier interfaces, API ex=
tensions, and expectations the same as today for simplicity.</div><div><br>=
</div><div><div>The new linear modifier definition (proposal) will have the=
se fields:</div><div>=C2=A0=C2=A0 5 bits for log2 pitch alignment in bytes<=
/div><div>=C2=A0=C2=A0 5 bits for log2 height alignment in rows<br></div><d=
iv>=C2=A0=C2=A0 5 bits for log2 offset alignment in bytes</div><div><div>=
=C2=A0=C2=A0 5 bits for log2 minimum pitch in bytes<br></div><div><div>=C2=
=A0=C2=A0 5 bits for log2 minimum (2D) image size in bytes<br></div><div><b=
r></div></div></div><div>The
 pitch and the image size in bytes are no longer arbitrary values. They=20
are fixed values computed from {width, height, bpp, modifier} as=20
follows:</div><div>=C2=A0=C2=A0 aligned_width =3D align(width * bpp / 8, 1 =
&lt;&lt; log2_pitch_alignment);<br></div><div>=C2=A0=C2=A0 aligned_height =
=3D align(height, 1 &lt;&lt; log2_height_alignment);</div><div>=C2=A0=C2=A0=
 pitch =3D max(1 &lt;&lt; log2_minimum_pitch, aligned_width);<br></div><div=
>=C2=A0=C2=A0 image_size =3D max(1 &lt;&lt; log2_minimum_image_size, pitch =
* aligned_height);<br></div><div></div><div><br></div><div>The
 modifier defines the layout exactly and non-ambiguously. Overaligning the =
pitch or height is not supported. Only the=20
offset alignment has some freedom regarding placement. Drivers can
 expose whatever they want within that definition, even exposing only 1 lin=
ear modifier is OK. Then, you can look at modifiers of other drivers if you=
 want to find commonalities.<br></div><div><br></div></div><div>DRM_FORMAT_=
MOD_LINEAR needs to go because it prevents apps from detecting whether 2 de=
vices have 0 compatible memory layouts, which is a useful thing to know.<br=
></div><div><br></div><div>Marek<br></div></div><br><div class=3D"gmail_quo=
te gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan=
 10, 2025 at 4:23=E2=80=AFPM James Jones &lt;<a href=3D"mailto:jajones@nvid=
ia.com">jajones@nvidia.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">On 12/19/24 10:03, Simona Vetter wrote:<br>
&gt; On Thu, Dec 19, 2024 at 09:02:27AM +0000, Daniel Stone wrote:<br>
&gt;&gt; On Wed, 18 Dec 2024 at 10:32, Brian Starkey &lt;<a href=3D"mailto:=
brian.starkey@arm.com" target=3D"_blank">brian.starkey@arm.com</a>&gt; wrot=
e:<br>
&gt;&gt;&gt; On Wed, Dec 18, 2024 at 11:24:58AM +0000, Simona Vetter wrote:=
<br>
&gt;&gt;&gt;&gt; For that reason I think linear modifiers with explicit pit=
ch/size<br>
&gt;&gt;&gt;&gt; alignment constraints is a sound concept and fits into how=
 modifiers work<br>
&gt;&gt;&gt;&gt; overall.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Could we make it (more) clear that pitch alignment is a &quot;=
special&quot;<br>
&gt;&gt;&gt; constraint (in that it&#39;s really a description of the buffe=
r layout),<br>
&gt;&gt;&gt; and that constraints in-general shouldn&#39;t be exposed via m=
odifiers?<br>
&gt;&gt;<br>
&gt;&gt; It&#39;s still worryingly common to see requirements for contiguou=
s<br>
&gt;&gt; allocation, if for no other reason than we&#39;ll all be stuck wit=
h<br>
&gt;&gt; Freescale/NXP i.MX6 for a long time to come. Would that be in scop=
e<br>
&gt;&gt; for expressing constraints via modifiers as well, and if so, shoul=
d we<br>
&gt;&gt; be trying to use feature bits to express this?<br>
&gt;&gt;<br>
&gt;&gt; How this would be used in practice is also way too underdocumented=
. We<br>
&gt;&gt; need to document that exact-round-up 64b is more restrictive than<=
br>
&gt;&gt; any-multiple-of 64b is more restrictive than &#39;classic&#39; lin=
ear. We need<br>
&gt;&gt; to document what people should advertise - if we were starting fro=
m<br>
&gt;&gt; scratch, the clear answer would be that anything which doesn&#39;t=
 care<br>
&gt;&gt; should advertise all three, anything advertising any-multiple-of<b=
r>
&gt;&gt; should also advertise exact-round-up, etc.<br>
&gt;&gt;<br>
&gt;&gt; But we&#39;re not starting from scratch, and since linear is &#39;=
special&#39;,<br>
&gt;&gt; userspace already has explicit knowledge of it. So AMD is going to=
<br>
&gt;&gt; have to advertise LINEAR forever, because media frameworks know ab=
out<br>
&gt;&gt; DRM_FORMAT_MOD_LINEAR and pass that around explicitly when they kn=
ow<br>
&gt;&gt; that the buffer is linear. That and not breaking older userspace<b=
r>
&gt;&gt; running in containers or as part of a bisect or whatever.<br>
&gt;&gt;<br>
&gt;&gt; There&#39;s also the question of what e.g. gbm_bo_get_modifier() s=
hould<br>
&gt;&gt; return. Again, if we were starting from scratch, most restrictive<=
br>
&gt;&gt; would make sense. But we&#39;re not, so I think it has to return L=
INEAR<br>
&gt;&gt; for maximum compatibility (because modifiers can&#39;t be morphed =
into<br>
&gt;&gt; other ones for fun), which further cements that we&#39;re not remo=
ving<br>
&gt;&gt; LINEAR.<br>
&gt;&gt;<br>
&gt;&gt; And how should allocators determine what to go for? Given that, I<=
br>
&gt;&gt; think the only sensible semantics are, when only LINEAR has been<b=
r>
&gt;&gt; passed, to pick the most restrictive set possible; when LINEAR<br>
&gt;&gt; variants have been passed as well as LINEAR, to act as if LINEAR w=
ere<br>
&gt;&gt; not passed at all.<br>
&gt; <br>
&gt; Yeah I think this makes sense, and we&#39;d need to add that to the ke=
rneldoc<br>
&gt; about how drivers/apps/frameworks need to work with variants of LINEAR=
.<br>
&gt; <br>
&gt; Just deprecating LINEAR does indeed not work. The same way it was real=
ly<br>
&gt; hard slow crawl (and we&#39;re still not there everywhere, if you incl=
ude<br>
&gt; stuff like bare metal Xorg) trying to retire the implied modifier. May=
be,<br>
&gt; in an extremely bright future were all relevant drivers advertise a fu=
ll<br>
&gt; set of LINEAR variants, and all frameworks understand them, we&#39;ll =
get<br>
&gt; there. But if AMD is the one special case that really needs this I don=
&#39;t<br>
&gt; think it&#39;s realistic to plan for that, and what Daniel describe ab=
ove<br>
&gt; looks like the future we&#39;re stuck to.<br>
&gt; -Sima<br>
<br>
I spent some time thinking about this over the break, because on a venn <br=
>
diagram it does overlap a sliver of the work we&#39;ve done to define the <=
br>
differences between the concepts of constraints Vs. capabilities in the <br=
>
smorgasbord of unified memory allocator talks/workshops/prototypes/etc. <br=
>
over the years. I&#39;m not that worried about some overlap being <br>
introduced, because every reasonable rule deserves an exception here and <b=
r>
there, but I have concerns similar to Daniel&#39;s and Brian&#39;s.<br>
<br>
Once you start adding more than one special modifier, some things in the <b=
r>
existing usage start to break down. Right now you can naively pass <br>
around modifiers, then somewhere either before or just after allocation <br=
>
depending on your usage, check if LINEAR is available and take your <br>
special &quot;I can parse this thing&quot; path, for whatever that means in=
 your <br>
special use case. Modifying all those paths to include one variant of <br>
linear is probably OK-but-not-great. Modifying all those paths to <br>
include &lt;N&gt; variants of linear is probably unrealistic, and I do worr=
y <br>
about slippery slopes here.<br>
<br>
---<br>
<br>
What got me more interested though was this led to another thought. At <br>
first I didn&#39;t notice that this was an exact-match constraint and <br>
thought it meant the usual alignment constraint of &gt;=3D, and I was <br>
concerned about how future variants would interact poorly. It could <br>
still be a concern if things progress down this route, and we have <br>
vendor A requiring &gt;=3D 32B alignment and vendor B requiring =3D=3D 64B =
<br>
alignment. They&#39;re compatible, but modifiers expressing this would <br>
naively cancel each-other out unless vendor A proactively advertised =3D=3D=
 <br>
64B linear modifiers too. This isn&#39;t a huge deal at that scale, but it =
<br>
could get worse, and it got me thinking about a way to solve the problem <b=
r>
of a less naive way to merge modifier lists.<br>
<br>
As a background, the two hard problems left with implementing a <br>
constraint system to sit alongside the format modifier system are:<br>
<br>
1) A way to name special heaps (E.g., local vidmem on device A) in the <br>
constraints in a way that spans process boundaries using some sort of <br>
identifier. There are various ways to solve this. Lately the thinking is <b=
r>
something around dma heaps, but no one&#39;s fleshed it out yet that I&#39;=
m aware.<br>
<br>
2) A transport that doesn&#39;t require us to revise every userspace API, <=
br>
kernel API, and protocol that got revised to support DRM format <br>
modifiers, and every API/protocol introduced since.<br>
<br>
I haven&#39;t seen any great ideas for the latter problem yet, but what if =
<br>
we did this:<br>
<br>
- Introduced a new DRM format modifier vendor that was actually <br>
vendor-agnostic, but implied the format modifier was a constraint <br>
definition fragment instead of an actual modifier.<br>
<br>
- Constraint-aware code could tack on its constraints (The ones it <br>
requires and/or the ones it can support allocating) as a series of <br>
additional modifiers using this vendor code. A given constraint might be <b=
r>
fragmented into multiple modifiers, but their definition and <br>
serialization/deserialization mechanism could be defined in drm_fourcc.h <b=
r>
as macros all the clients could use.<br>
<br>
- Existing non-constraint-aware code in a modifier usage chain might <br>
filter these modifiers out using the existing strict intersection logic. <b=
r>
Hence, any link in the chain not aware of constraints would likely block <b=
r>
their use, but that&#39;s OK. We&#39;re muddling along without them now. It=
 <br>
wouldn&#39;t make those situations any worse.<br>
<br>
- New code would be required to use some minimal library (Header-only <br>
perhaps, as Simon and I proposed a few years ago) to intersect format <br>
modifier lists instead, and this code would parse out the constraint <br>
modifiers from each input list and use the envisioned per-constraint <br>
logic to merge them. It would result in yet another merged <br>
modifier+constraint list encoded as a list of modifiers that could be <br>
passed along through any format-modifier-aware API.<br>
<br>
- One consideration that would be sort of tricky is that constraints are <b=
r>
supposed to be advertised per-modifier, so you&#39;d have to have a way to =
<br>
associate constraint modifiers in a given set with real modifiers in <br>
that set or in general. This is easily solved though. Some bits of the <br>
constraint modifiers would already need to be used to associate and <br>
order constraint fragments during deserialization, since modifier lists <br=
>
aren&#39;t strictly ordered.<br>
<br>
This effectively allows you to use format modifiers to encode <br>
arbitrarily complex constraint mechanisms by piggybacking on the <br>
existing format modifier definition and transport mechanisms without <br>
breaking backwards compatibility. It&#39;s a little dirty, because modifier=
s <br>
are being abused to implement a raw bitstream, but modifiers and <br>
constraints are related concepts, so it&#39;s not a complete hack. It still=
 <br>
requires modifying all the implementations in the system to fully make <br>
use of constraints, but doesn&#39;t require e.g. revising X11 DRI3 protocol=
 <br>
again to tunnel them through Xwayland, and in situations where the <br>
constraint-aware thing sits downstream of the non-constraint-aware thing <b=
r>
in the allocation pipeline, you could get some benefit even when all the <b=
r>
upstream things aren&#39;t updated yet, because it could still merge in its=
 <br>
local constraints before allocating or passing the modifier list down <br>
the chain.<br>
<br>
Does this seem like something worth pursuing to others? I&#39;ve been tryin=
g <br>
to decide how to best move the allocation constraints efforts forward, <br>
so it&#39;s potentially something I could put some time into this year.<br>
<br>
Thanks,<br>
-James<br>
</blockquote></div>

--0000000000007a7221062ba753c4--
