Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFB3A11841
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 05:06:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5078510E4B6;
	Wed, 15 Jan 2025 04:06:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cVZO4FM7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B31410E4B3;
 Wed, 15 Jan 2025 04:06:39 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 46e09a7af769-71e2ddb6fc1so375516a34.3; 
 Tue, 14 Jan 2025 20:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736913938; x=1737518738; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VNlMIWi0gY/hfVQr64EfXRiIAdvNPqESu2NexPnqTZI=;
 b=cVZO4FM7OTghsfRsuwtR6vCBd8/xj+KVfnczWQe23RnV/23CPrBHazSZ6R0YP6Kq2e
 DCL2bWa3zraY7S1vaV0igtNdFKB3GAd1Q20DAZyPntPmigFC3dGsYKpsU79gJSRc1h3N
 PeE0G0BLwG4YV1jzRJkMy/Ch80uH07mnEbUoIANczSBPqqpl/UcML2bxc8ZO96GyB+UU
 fjLNv8VXYVPmEBF02FD/Y5whk4kwhlkfJyOd1ERsOn3UCXQ6i/X1ph3v24h7lNE910pH
 DU8+/2nw/sDvAG97UIbmfr/7WzWfXD6304HTUEfihctNnGQWOmGaFhU67vWha7HCgX1u
 zqSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736913938; x=1737518738;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VNlMIWi0gY/hfVQr64EfXRiIAdvNPqESu2NexPnqTZI=;
 b=vAMZppsTnhmzMfEHj6omwgKxq5rOMFyC5LmqXV6Q9mgHui98Wg2FqA/vQg9GNXhcIp
 xctV5obevKxWGNOVmeq3seyKpbMVK4tqf99ZqEmLOtemecwpZkAhsvpHyWybPJdYNFbQ
 ITty5zxjPV9R7zDct6IMPftvyQaMKaGfUlW8oWVd3pGgVuRytcalZETQbToaFSGi5rCY
 E+XxLoXvUVCu9CoIa37lrumioz5KD5XMcbubNb5Ft2wmoaJEz0y/j2OM+/mcXbGQP8hm
 sNPm172qzpSUcSXShRpHkc4H7XVuYbb8ro1sszzoH9UwEldoPzaajlpw6itHIpvVuGuW
 0zlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6DVxANM11BUuzAhMOtoGPGCha4wqq99wtz9QItSxUav5eBt3snNcFTyk3X2P4LA3XXuYp1MCw@lists.freedesktop.org,
 AJvYcCVyOGrcrmbi4aW8R4VSthOEKSp51ovVjpLD3tLQ/M4lAdV8aks8+801neI4t+EzNuqVkt8NfIxOu4Ct@lists.freedesktop.org,
 AJvYcCXiJrTeN8vIwKHYsgbQkslcgRM05EI1hPpz088nrQQyH2cDDMrHSEysvoHV/zvtk4D1BKbx3tCKD38=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUUX4Tvh+j2eMq/KiT/yh0KZwPakGMsYKMG3mQgwHvk9XRuh4p
 PGtJd9DBtxs/mN7X5VDe3kQk28mmpDK/B68iHZX+lhegWboitsUuPotOkfPJKT/DFNH/a7/q+QV
 1NurgVUQLM8/LazvTFgQ4LvPSLRI=
X-Gm-Gg: ASbGncuJikvICO2N8dAJX+bJlhLDs9pY9ZukQxcG0vCfZcSDpzbu8nx1tjlPGkI6dkH
 kuCmndW8uSfq8lOJbCpiA16jjA4Fa7s/ghx8Osd+Z
X-Google-Smtp-Source: AGHT+IEtAB9S4YUX9ue1Ah5uC59BOBmr7VbVt+m1q9kChuaAY02RhjE+jWafBN4rMjBoFpVCbXuKenzWHy2ppt8ivW0=
X-Received: by 2002:a05:6808:1c05:b0:3eb:8a9a:2c02 with SMTP id
 5614622812f47-3ef2ed44f98mr6743619b6e.6.1736913938530; Tue, 14 Jan 2025
 20:05:38 -0800 (PST)
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
 <CAAxE2A6N0xtgZmzTR9FXMN79xxy3T8zfhh1sz73h1h8=0ycJ2g@mail.gmail.com>
 <CAPj87rP4r4q-wBx1dHsEkZ7=S2c2XsbA1Pz4Skw1ETt_2yD2Ag@mail.gmail.com>
In-Reply-To: <CAPj87rP4r4q-wBx1dHsEkZ7=S2c2XsbA1Pz4Skw1ETt_2yD2Ag@mail.gmail.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Tue, 14 Jan 2025 23:05:02 -0500
X-Gm-Features: AbW1kvaAD-Kqgx7Y-SxVT7ib0Lmm3tX-CJebiKiBVNHZGc1GrjRUKdTgD4gagkw
Message-ID: <CAAxE2A6ghBK2VTLkNXgk1c61UG1ZQAzWQ4q=wO-OShAUC9eRmQ@mail.gmail.com>
Subject: Re: [PATCH] drm/fourcc: add LINEAR modifiers with an exact pitch
 alignment
To: Daniel Stone <daniel@fooishbar.org>
Cc: James Jones <jajones@nvidia.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
 Brian Starkey <brian.starkey@arm.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>, 
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>, nd@arm.com, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: multipart/alternative; boundary="0000000000004fc923062bb6caee"
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

--0000000000004fc923062bb6caee
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 12:58=E2=80=AFPM Daniel Stone <daniel@fooishbar.org=
> wrote:

> Hi,
>
> On Tue, 14 Jan 2025 at 09:38, Marek Ol=C5=A1=C3=A1k <maraeo@gmail.com> wr=
ote:
> > I would keep the existing modifier interfaces, API extensions, and
> expectations the same as today for simplicity.
>
> Well yes, not just for simplicity, but because everything stops
> working if you don't.
>
> > The new linear modifier definition (proposal) will have these fields:
> >    5 bits for log2 pitch alignment in bytes
> >    5 bits for log2 height alignment in rows
> >    5 bits for log2 offset alignment in bytes
> >    5 bits for log2 minimum pitch in bytes
> >    5 bits for log2 minimum (2D) image size in bytes
> >
> > The pitch and the image size in bytes are no longer arbitrary values.
> They are fixed values computed from {width, height, bpp, modifier} as
> follows:
> >    aligned_width =3D align(width * bpp / 8, 1 << log2_pitch_alignment);
> >    aligned_height =3D align(height, 1 << log2_height_alignment);
> >    pitch =3D max(1 << log2_minimum_pitch, aligned_width);
> >    image_size =3D max(1 << log2_minimum_image_size, pitch *
> aligned_height);
> >
> >
> > The modifier defines the layout exactly and non-ambiguously.
> Overaligning the pitch or height is not supported. Only the offset
> alignment has some freedom regarding placement. Drivers can expose whatev=
er
> they want within that definition, even exposing only 1 linear modifier is
> OK. Then, you can look at modifiers of other drivers if you want to find
> commonalities.
>
> I don't see how this squares with the first statement.
>
> AMD hardware is the only hardware I know of which doesn't support
> overaligning. Say (not hypothetically) we have a GPU and a display
> controller which have a minimum pitch alignment of 32 bytes, no
> minimum height alignment, minimum 32-byte offset alignment, minimum
> pitch of 32 bytes, and minimum image size of 32 bytes.
>
> To be maximally compatible, we'd have to expose 28 (pitch align) * 32
> (height align) * 28 (offset align) * 28 (min pitch) * 28 (min size) =3D=
=3D
> 19668992 individual modifiers when queried, which is 150MB per format
> just to store the list of modifiers.
>

Maximum compatibility is not required nor expected.

In your case, only 1 linear modifier would be added for that driver, which
is:
log2 pitch alignment =3D 5
log2 height alignment =3D 0
log2 offset alignment =3D 5
log2 minimum pitch =3D 5
log2 minimum image size =3D 5

Then if, and only if, compatibility with other devices is desired, the
driver developer could look at drivers of those other devices and determine
which other linear modifiers to add. Ideally it would be just 1, so there
would be a total of 2.


>
> > DRM_FORMAT_MOD_LINEAR needs to go because it prevents apps from
> detecting whether 2 devices have 0 compatible memory layouts, which is a
> useful thing to know.
>
> I get the point, but again, we have the exact same problem today with
> placement, i.e. some devices require buffers to be in or not be in
> VRAM or GTT or sysram for some uses, and some devices require physical
> contiguity. Solving that problem would require an additional 4 bits,
> which brings us to 2.3GB of modifiers per format with the current
> scheme. Not super viable.
>

Userspace doesn't determine placement. The kernel memory management can
move buffers between heaps to accommodate sharing between devices as
needed. This is a problem in which userspace has no say.

Marek

--0000000000004fc923062bb6caee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Jan 14, 2025 at 12:58=E2=80=AFPM Dani=
el Stone &lt;<a href=3D"mailto:daniel@fooishbar.org">daniel@fooishbar.org</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi=
,<br>
<br>
On Tue, 14 Jan 2025 at 09:38, Marek Ol=C5=A1=C3=A1k &lt;<a href=3D"mailto:m=
araeo@gmail.com" target=3D"_blank">maraeo@gmail.com</a>&gt; wrote:<br>
&gt; I would keep the existing modifier interfaces, API extensions, and exp=
ectations the same as today for simplicity.<br>
<br>
Well yes, not just for simplicity, but because everything stops<br>
working if you don&#39;t.<br>
<br>
&gt; The new linear modifier definition (proposal) will have these fields:<=
br>
&gt;=C2=A0 =C2=A0 5 bits for log2 pitch alignment in bytes<br>
&gt;=C2=A0 =C2=A0 5 bits for log2 height alignment in rows<br>
&gt;=C2=A0 =C2=A0 5 bits for log2 offset alignment in bytes<br>
&gt;=C2=A0 =C2=A0 5 bits for log2 minimum pitch in bytes<br>
&gt;=C2=A0 =C2=A0 5 bits for log2 minimum (2D) image size in bytes<br>
&gt;<br>
&gt; The pitch and the image size in bytes are no longer arbitrary values. =
They are fixed values computed from {width, height, bpp, modifier} as follo=
ws:<br>
&gt;=C2=A0 =C2=A0 aligned_width =3D align(width * bpp / 8, 1 &lt;&lt; log2_=
pitch_alignment);<br>
&gt;=C2=A0 =C2=A0 aligned_height =3D align(height, 1 &lt;&lt; log2_height_a=
lignment);<br>
&gt;=C2=A0 =C2=A0 pitch =3D max(1 &lt;&lt; log2_minimum_pitch, aligned_widt=
h);<br>
&gt;=C2=A0 =C2=A0 image_size =3D max(1 &lt;&lt; log2_minimum_image_size, pi=
tch * aligned_height);<br>
&gt;<br>
&gt;<br>
&gt; The modifier defines the layout exactly and non-ambiguously. Overalign=
ing the pitch or height is not supported. Only the offset alignment has som=
e freedom regarding placement. Drivers can expose whatever they want within=
 that definition, even exposing only 1 linear modifier is OK. Then, you can=
 look at modifiers of other drivers if you want to find commonalities.<br>
<br>
I don&#39;t see how this squares with the first statement.<br>
<br>
AMD hardware is the only hardware I know of which doesn&#39;t support<br>
overaligning. Say (not hypothetically) we have a GPU and a display<br>
controller which have a minimum pitch alignment of 32 bytes, no<br>
minimum height alignment, minimum 32-byte offset alignment, minimum<br>
pitch of 32 bytes, and minimum image size of 32 bytes.<br>
<br>
To be maximally compatible, we&#39;d have to expose 28 (pitch align) * 32<b=
r>
(height align) * 28 (offset align) * 28 (min pitch) * 28 (min size) =3D=3D<=
br>
19668992 individual modifiers when queried, which is 150MB per format<br>
just to store the list of modifiers.<br></blockquote><div><br></div><div>Ma=
ximum compatibility is not required nor expected.<br></div><div><br></div><=
div>In your case, only 1 linear modifier would be added for that driver, wh=
ich is:</div><div>log2 pitch alignment =3D 5</div><div>log2 height alignmen=
t =3D 0</div><div>log2 offset alignment =3D 5</div><div>log2 minimum pitch =
=3D 5</div><div>log2 minimum image size =3D 5</div><div><br></div><div>Then=
 if, and only if, compatibility with other devices is desired, the driver d=
eveloper could look at drivers of those other devices and determine which o=
ther linear modifiers to add. Ideally it would be just 1, so there would be=
 a total of 2.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
<br>
&gt; DRM_FORMAT_MOD_LINEAR needs to go because it prevents apps from detect=
ing whether 2 devices have 0 compatible memory layouts, which is a useful t=
hing to know.<br>
<br>
I get the point, but again, we have the exact same problem today with<br>
placement, i.e. some devices require buffers to be in or not be in<br>
VRAM or GTT or sysram for some uses, and some devices require physical<br>
contiguity. Solving that problem would require an additional 4 bits,<br>
which brings us to 2.3GB of modifiers per format with the current<br>
scheme. Not super viable.<br></blockquote><div><br></div><div>Userspace doe=
sn&#39;t determine placement. The kernel memory management can move buffers=
 between heaps to accommodate sharing between devices as needed. This is a =
problem in which userspace has no say.<br></div></div><div class=3D"gmail_q=
uote gmail_quote_container"><br></div><div class=3D"gmail_quote gmail_quote=
_container">Marek<br></div></div>

--0000000000004fc923062bb6caee--
