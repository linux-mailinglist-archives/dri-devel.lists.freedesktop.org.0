Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 335F3A10E8F
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 18:58:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABCC210E45F;
	Tue, 14 Jan 2025 17:58:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="APj3TrXP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B3610E45F
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 17:58:29 +0000 (UTC)
Received: by mail-qv1-xf2e.google.com with SMTP id
 6a1803df08f44-6d8f99cb0d9so41051416d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 09:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1736877509; x=1737482309;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9LXHsEntU5Ys95uVCIF8Zmb9U409KBpBciIBNlMO0m0=;
 b=APj3TrXP6ITSi1GObrL3ZYz2FkBuhDWwS/kvoQ3lLAt/JjeXsNtKHjsR+V6pQa1yZ9
 rOhwROkFaudB9P+yXpSaJYuFZtAANM+Qf7QDRcltO2BlkhejVSxoD3pbXk6OysCHWCoo
 KrgRDQoG4iXzcsw12yhgQlh3IhJUuTqe7O8RzP4YHvyzOSYPYIvoxjEz0WBh8hnffcMJ
 aLTIv9fhFr1V0SVQ22WtL0xUG2hERxVUjEcM5lOhgrdA1yeDUOXoI5o6+iC0E8OJA61c
 M4FyO+6NNmCaynQ9zuwdqza6qQLcj6E8D6kK/uLWzUg+1yc9goNDkpfwrM0JYqQiN/IM
 A1dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736877509; x=1737482309;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9LXHsEntU5Ys95uVCIF8Zmb9U409KBpBciIBNlMO0m0=;
 b=GsdrSJggiZJchxhyhFQTjxtuycJXPHBGaiMs8x2prINb7Owgn2Qz/xgd8upq1GpULS
 4b9Sgbw+yCpL1ludT4sMDDsC8ZTmh1CPqvEQS+udrlxP/FiYYgu8MuKohnunp5f9cM4b
 uNLG2xhsjubTbmB1zTnh3w33v6PP7Vs3iQxHnF+fAPkCN0QRbwGM0nh0qtVastv2+Z6A
 TBrTCdv0xLB1Y5UgftjDLwNOsBAiY+dOXr6lYzhp6bzTvLiNQRK68HLarB4GyfgZLU3w
 lADm9SFAFK/cOTYbyIuC30wzmpXTWL8MIkkPeCW9J8simkysP2sz1NoHAVEB4AdzHUfd
 JZPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVP1d0M+W17ngJGFbDexVTQv1Bg7N5BmGRCa2Cn44OaD5QJpw15K6+jS7rLWRDkPX+fh6hjDHXuFc4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7QZBGPTRPGE5kyi0ZgdQlxiZrT9/ff8nL51d2zfAy1tUtWIVm
 XFheoPF8r6LrJspCWHpOHjvEhdo/VUOm38qzn35iemyLfA9p1tWQF7GLUXJhVW+iGrhg2cqmlzr
 Y3vnjYXJkKdYboIiI3UNbS8UoXTNRtOAhvznUeQ==
X-Gm-Gg: ASbGncsFSGmynft7dYw+dP/nI0oFBZUIm2MFxdpvFZToaeJQwJigEz6HH7qKm87dnai
 S/yO4Hyl6wo19kdqihLixUR6vSXZ8UVatdDh1
X-Google-Smtp-Source: AGHT+IEWqpgKCTT/9ls0xmYdMPLOJRlFRN/Cz/iKnMnCoFc3cNEYBMkPMq7s1kBd0eoxzbWOzz7PqXH22Wfsdrp9eCY=
X-Received: by 2002:a05:6214:8111:b0:6e1:7223:19a9 with SMTP id
 6a1803df08f44-6e172231a99mr111298526d6.24.1736877508679; Tue, 14 Jan 2025
 09:58:28 -0800 (PST)
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
In-Reply-To: <CAAxE2A6N0xtgZmzTR9FXMN79xxy3T8zfhh1sz73h1h8=0ycJ2g@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 14 Jan 2025 17:58:16 +0000
X-Gm-Features: AbW1kva4ALOA0LOORdEv_TRtbfcne3GOqf3wkUfOV14MfYux7kBg8wr6Hf20vFk
Message-ID: <CAPj87rP4r4q-wBx1dHsEkZ7=S2c2XsbA1Pz4Skw1ETt_2yD2Ag@mail.gmail.com>
Subject: Re: [PATCH] drm/fourcc: add LINEAR modifiers with an exact pitch
 alignment
To: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Cc: James Jones <jajones@nvidia.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
 Brian Starkey <brian.starkey@arm.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>, 
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>, nd@arm.com, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
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

Hi,

On Tue, 14 Jan 2025 at 09:38, Marek Ol=C5=A1=C3=A1k <maraeo@gmail.com> wrot=
e:
> I would keep the existing modifier interfaces, API extensions, and expect=
ations the same as today for simplicity.

Well yes, not just for simplicity, but because everything stops
working if you don't.

> The new linear modifier definition (proposal) will have these fields:
>    5 bits for log2 pitch alignment in bytes
>    5 bits for log2 height alignment in rows
>    5 bits for log2 offset alignment in bytes
>    5 bits for log2 minimum pitch in bytes
>    5 bits for log2 minimum (2D) image size in bytes
>
> The pitch and the image size in bytes are no longer arbitrary values. The=
y are fixed values computed from {width, height, bpp, modifier} as follows:
>    aligned_width =3D align(width * bpp / 8, 1 << log2_pitch_alignment);
>    aligned_height =3D align(height, 1 << log2_height_alignment);
>    pitch =3D max(1 << log2_minimum_pitch, aligned_width);
>    image_size =3D max(1 << log2_minimum_image_size, pitch * aligned_heigh=
t);
>
>
> The modifier defines the layout exactly and non-ambiguously. Overaligning=
 the pitch or height is not supported. Only the offset alignment has some f=
reedom regarding placement. Drivers can expose whatever they want within th=
at definition, even exposing only 1 linear modifier is OK. Then, you can lo=
ok at modifiers of other drivers if you want to find commonalities.

I don't see how this squares with the first statement.

AMD hardware is the only hardware I know of which doesn't support
overaligning. Say (not hypothetically) we have a GPU and a display
controller which have a minimum pitch alignment of 32 bytes, no
minimum height alignment, minimum 32-byte offset alignment, minimum
pitch of 32 bytes, and minimum image size of 32 bytes.

To be maximally compatible, we'd have to expose 28 (pitch align) * 32
(height align) * 28 (offset align) * 28 (min pitch) * 28 (min size) =3D=3D
19668992 individual modifiers when queried, which is 150MB per format
just to store the list of modifiers.

> DRM_FORMAT_MOD_LINEAR needs to go because it prevents apps from detecting=
 whether 2 devices have 0 compatible memory layouts, which is a useful thin=
g to know.

I get the point, but again, we have the exact same problem today with
placement, i.e. some devices require buffers to be in or not be in
VRAM or GTT or sysram for some uses, and some devices require physical
contiguity. Solving that problem would require an additional 4 bits,
which brings us to 2.3GB of modifiers per format with the current
scheme. Not super viable.

The design for the allocator - communicating constraints ('pitch must
be exactly aligned to the next 256-byte boundary', 'pitch must be a
multiple of 32 bytes', 'buffer must be physically contiguous', etc)
separately from the chosen layout - would seem to fit this much
better. And since there doesn't seem to be a tractable solution we can
jam into the single 'intersect multiple sets of uint64s' API, we might
as well go through typing that out.

Cheers,
Daniel
