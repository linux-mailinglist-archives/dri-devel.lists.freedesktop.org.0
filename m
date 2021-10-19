Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA654330B1
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 10:05:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A74336EB46;
	Tue, 19 Oct 2021 08:05:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 779216EB46
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 08:05:49 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id i24so5496054lfj.13
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 01:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=TOgHgcMwG2T4LdCnfiP/Sf2u4JL85Q6aYFTHg56s5DU=;
 b=N4pf0PD+WEHoP8RpEOoRSrP1Hh8UcxuvtMlabfUt1nUw5/NdB4mPY1Oo2OeEmf8N+I
 Ihco8spJsF+1CVb/+j02ithrKa8xp80a+IQZrdYZZnJ0p88sVGzYkxjTZDwRKbiKFDw/
 blmDnBVfZW6Q2uNhZY/Ye7tDq/Z9BAhXbmXWhd37XCVNhOM47XtHBlHojMlnzbgeTUW1
 cbSJcsHsiEOdqt8oGGzLJyYT+wPkjTKcnGsu8aHYIH0F/vG5VI/+vR0NN4dw1LNyzKKm
 kZZ+W0P7xj+oNGUfmIVF5XFd/TYbR7Nkvwv62OflF7RNRWNoJh7OLNzCztVli4lZzGQP
 wHdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=TOgHgcMwG2T4LdCnfiP/Sf2u4JL85Q6aYFTHg56s5DU=;
 b=XGGMwWTdPzPvrS6xcB6N+E1f1xtfpV1cVgWe9QyqOVnM3GIcLF8XbloR52eFpsYqqD
 Ywbbc6xWrI7QD8cvPTzo6jrsucwoCR3UufbIvwVLtEKqPDgQ/RakzRauPoRy4crBEpdI
 TodmPVPUJucd1/G7BC4jRSWUw0McUgk23mhV+4xQlHq+iSK6zUR1Zi/JIGQJdxZZ/mK9
 +LV5KI2nXGfJJHIGa4wSpI9jhUp3AdIuw3iiPcNSw/hX3JEDhWmg1U+skBnYl3+dc/GA
 ewPv3EgaDG5Yxk71tNeWPS+RX3oDOLdGeX6a6CPmdryEYwVg5cSN7RlAQ/63r6h4cTkx
 BFKw==
X-Gm-Message-State: AOAM533WQwBF3xkkI4P9DPK5Gr3fk40nuEliFIR8Aqg+AXsOX2UHEbVp
 RMygmmSjTSuRWH5map7vYLo=
X-Google-Smtp-Source: ABdhPJy3OcUXgFagjD8gh11icUMMmbB0xPHxhCi/51g4d1EL9CwGQKVK+Ga5r7xep8u/0yhB9zkJ+Q==
X-Received: by 2002:ac2:54a6:: with SMTP id w6mr4719757lfk.277.1634630747626; 
 Tue, 19 Oct 2021 01:05:47 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id a25sm1607526lfo.197.2021.10.19.01.05.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 01:05:46 -0700 (PDT)
Date: Tue, 19 Oct 2021 11:05:35 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
Cc: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 hamohammed.sa@gmail.com, daniel@ffwll.ch, airlied@linux.ie,
 contact@emersion.fr, leandro.ribeiro@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lkcamp@lists.libreplanetbr.org
Subject: Re: [PATCH 6/6] drm: vkms: Refactor the plane composer to accept
 new formats
Message-ID: <20211019110535.18f56272@eldfell>
In-Reply-To: <d5f92494-9c55-2b7d-6107-6048abb41759@gmail.com>
References: <20211005201637.58563-1-igormtorrente@gmail.com>
 <20211005201637.58563-7-igormtorrente@gmail.com>
 <20211018113009.5519457c@eldfell>
 <d5f92494-9c55-2b7d-6107-6048abb41759@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/y.0ESSWVeFW=WgObJd32FkV";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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

--Sig_/y.0ESSWVeFW=WgObJd32FkV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 18 Oct 2021 16:26:06 -0300
Igor Matheus Andrade Torrente <igormtorrente@gmail.com> wrote:

> Hi Pekka,
>=20
> On 10/18/21 5:30 AM, Pekka Paalanen wrote:
> > On Tue,  5 Oct 2021 17:16:37 -0300
> > Igor Matheus Andrade Torrente <igormtorrente@gmail.com> wrote:
> >  =20
> >> Currently the blend function only accepts XRGB_8888 and ARGB_8888
> >> as a color input.
> >>
> >> This patch refactors all the functions related to the plane composition
> >> to overcome this limitation.
> >>
> >> Now the blend function receives a format handler to each plane and a
> >> blend function pointer. It will take two ARGB_1616161616 pixels, one
> >> for each handler, and will use the blend function to calculate and
> >> store the final color in the output buffer.
> >>
> >> These format handlers will receive the `vkms_composer` and a pair of
> >> coordinates. And they should return the respective pixel in the
> >> ARGB_16161616 format.
> >>
> >> The blend function will receive two ARGB_16161616 pixels, x, y, and
> >> the vkms_composer of the output buffer. The method should perform the
> >> blend operation and store output to the format aforementioned
> >> ARGB_16161616. =20
> >=20
> > Hi,
> >=20
> > here are some drive-by comments which you are free to take or leave.
> >=20
> > To find more efficient ways to do this, you might want research Pixman
> > library. It's MIT licensed.
> >=20
> > IIRC, the elementary operations there operate on pixel lines (pointer +
> > length), not individual pixels (image, x, y). Input conversion function
> > reads and converts a whole line a time. Blending function blends two
> > lines and writes the output into back one of the lines. Output
> > conversion function takes a line and converts it into destination
> > buffer. That way the elementary operations do not need to take stride
> > into account, and blending does not need to deal with varying memory
> > alignment FWIW. The inner loops involve much less function calls and
> > state, probably. =20
>=20
> I was doing some rudimentary profiling, and I noticed that the code=20
> spends most of the time with the indirect system call overhead and not=20
> the actual computation. This can definitively help with it.

Hi,

I suppose you mean function (pointer) call, not system call?

Really good that you have already profiled things. All optimisations
should be guided by profiling, otherwise they are just guesses (and I
got lucky this time I guess).

> > Pixman may not do exactly this, but it does something very similar.
> > Pixman also has multiple different levels of optimisations, which may
> > not be necessary for VKMS.
> >=20
> > It's a trade-off between speed and temporary memory consumed. You need
> > temporary buffers for two lines, but not more (not a whole image in
> > full intermediate precision). Further optimisation could determine
> > whether to process whole image rows as lines, or split a row into
> > multiple lines to stay within CPU cache size.
> >  =20
>=20
> Sorry, I didn't understand the idea of the last sentence.

If an image is very wide, a single row could still be relatively large
in size (bytes). If it is large enough that the working set falls out
of a faster CPU cache into a slower CPU cache (or worse yet, into RAM
accesses), performance may suffer and become memory bandwidth limited
rather than ALU rate limited. Theoretically that can be worked around
by limiting the maximum size of a line, and splitting an image row into
multiple lines.

However, this is an optimisation one probably should not do until there
is performance profiling data showing that it actually is useful. The
optimal line size limit depends on the CPU model as well. So it's a bit
far out, but something you could keep in mind just in case.

> > Since it seems you are blending multiple planes into a single
> > destination which is assumed to be opaque, you might also be able to do
> > the multiple blends without convert-writing and read-converting to/from
> > the destination between every plane. I think that might be possible to
> > architect on top of the per-line operations still. =20
>=20
> I tried it. But I don't know how to do this without looking like a mess.=
=20

Dedicate one of the temporary line buffers for the destination, and
instead of writing it out and loading it back for each input plane,
leave it in place over all planes and write it out just once at the end.

I do expect more state tracking needed. You need to iterate over the
list of planes for each output row, extract only the used part of an
input plane's buffer into the other temporary line buffer, and offset
the destination line buffer and length to match when passing those into
a blending function.

It's not an obvious win but a trade-off, so profiling is again needed.

Btw. the use of temporary line buffers should also help with
implementing scaling. You could do the filtering during reading of the
input buffer. If the filter is not nearest, meaning you need to access
more than one input pixel per pixel-for-blending, there are a few ways
to go about that. You could do the filtering during the input buffer
reading, or you could load two input buffer rows into temporary line
buffers and do filtering as a separate step into yet another line
buffer. As the composition advances from top to bottom, only one of the
input buffer rows will change at a time (during up-scaling) so you can
avoid re-loading a row by swapping the line buffers.

This is getting ahead of things, so don't worry about scaling or
filtering yet. The first thing is to see if you can make the line
buffer approach give you a significant speed-up.

> Does the pixman perform some similar?

No, Pixman composition operation has only three images: source,
mask, and destination. All those it can handle simultaneously, but
since there is no "multi-blending" API, it doesn't need to take care of
more.

IIRC, Pixman also has a form of optimised operations that do blending
and converting to destination in the same pass. The advantage of that
is that blending can work with less precision when it knows what
precision the output will be converted to and it saves some bandwidth
by not needing to write-after-blending and read-for-conversion
intermediate precision values. The disadvantage is that the number of
needed specialised blending functions explodes by the number of
possible destination formats. Pixman indeed makes those specialised
functions optional, falling back to more generic C code. I would hope
that VKMS does not need to go this far in optimisations though.

> >  =20
> >> Signed-off-by: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
> >> ---
> >>   drivers/gpu/drm/vkms/vkms_composer.c | 275 ++++++++++++++-----------=
--
> >>   drivers/gpu/drm/vkms/vkms_formats.h  | 125 ++++++++++++
> >>   2 files changed, 271 insertions(+), 129 deletions(-)
> >>   create mode 100644 drivers/gpu/drm/vkms/vkms_formats.h =20
> >=20
> > ...
> >  =20
> >> +
> >> +u64 ARGB8888_to_ARGB16161616(struct vkms_composer *composer, int x, i=
nt y)
> >> +{
> >> +	u8 *pixel_addr =3D packed_pixels_addr(composer, x, y);
> >> +
> >> +	/*
> >> +	 * Organizes the channels in their respective positions and converts
> >> +	 * the 8 bits channel to 16.
> >> +	 * The 257 is the "conversion ratio". This number is obtained by the
> >> +	 * (2^16 - 1) / (2^8 - 1) division. Which, in this case, tries to get
> >> +	 * the best color value in a color space with more possibilities. =20
> >=20
> > Pixel format, not color space. > =20
> >> +	 * And a similar idea applies to others RGB color conversions.
> >> +	 */
> >> +	return ((u64)pixel_addr[3] * 257) << 48 |
> >> +	       ((u64)pixel_addr[2] * 257) << 32 |
> >> +	       ((u64)pixel_addr[1] * 257) << 16 |
> >> +	       ((u64)pixel_addr[0] * 257); =20
> >=20
> > I wonder if the compiler is smart enough to choose between "mul 257"
> > and "(v << 8) | v" operations... but that's probably totally drowning
> > under the overhead of per (x,y) looping. =20
>=20
> I disassembled the code to check it. And looks like the compiler is=20
> replacing the multiplication with shifts and additions.
>=20
> ARGB8888_to_ARGB16161616:
>     0xffffffff816ad660 <+0>:     imul   0x12c(%rdi),%edx
>     0xffffffff816ad667 <+7>:     imul   0x130(%rdi),%esi
>     0xffffffff816ad66e <+14>:    add    %edx,%esi
>     0xffffffff816ad670 <+16>:    add    0x128(%rdi),%esi
>     0xffffffff816ad676 <+22>:    movslq %esi,%rax
>     0xffffffff816ad679 <+25>:    add    0xe8(%rdi),%rax
>     0xffffffff816ad680 <+32>:    movzbl 0x3(%rax),%ecx
>     0xffffffff816ad684 <+36>:    movzbl 0x2(%rax),%esi
>     0xffffffff816ad688 <+40>:    mov    %rcx,%rdx
>     0xffffffff816ad68b <+43>:    shl    $0x8,%rdx
>     0xffffffff816ad68f <+47>:    add    %rcx,%rdx
>     0xffffffff816ad692 <+50>:    mov    %rsi,%rcx
>     0xffffffff816ad695 <+53>:    shl    $0x8,%rcx
>     0xffffffff816ad699 <+57>:    shl    $0x30,%rdx
>     0xffffffff816ad69d <+61>:    add    %rsi,%rcx
>     0xffffffff816ad6a0 <+64>:    movzbl (%rax),%esi
>     0xffffffff816ad6a3 <+67>:    shl    $0x20,%rcx
>     0xffffffff816ad6a7 <+71>:    or     %rcx,%rdx
>     0xffffffff816ad6aa <+74>:    mov    %rsi,%rcx
>     0xffffffff816ad6ad <+77>:    shl    $0x8,%rcx
>     0xffffffff816ad6b1 <+81>:    add    %rsi,%rcx
>     0xffffffff816ad6b4 <+84>:    or     %rcx,%rdx
>     0xffffffff816ad6b7 <+87>:    movzbl 0x1(%rax),%ecx
>     0xffffffff816ad6bb <+91>:    mov    %rcx,%rax
>     0xffffffff816ad6be <+94>:    shl    $0x8,%rax
>     0xffffffff816ad6c2 <+98>:    add    %rcx,%rax
>     0xffffffff816ad6c5 <+101>:   shl    $0x10,%rax
>     0xffffffff816ad6c9 <+105>:   or     %rdx,%rax
>     0xffffffff816ad6cc <+108>:   ret

Nice!

> >  =20
> >> +}
> >> +
> >> +u64 XRGB8888_to_ARGB16161616(struct vkms_composer *composer, int x, i=
nt y)
> >> +{
> >> +	u8 *pixel_addr =3D packed_pixels_addr(composer, x, y);
> >> +
> >> +	/*
> >> +	 * The same as the ARGB8888 but with the alpha channel as the
> >> +	 * maximum value as possible.
> >> +	 */
> >> +	return 0xffffllu << 48 |
> >> +	       ((u64)pixel_addr[2] * 257) << 32 |
> >> +	       ((u64)pixel_addr[1] * 257) << 16 |
> >> +	       ((u64)pixel_addr[0] * 257);
> >> +}
> >> +
> >> +u64 get_ARGB16161616(struct vkms_composer *composer, int x, int y)
> >> +{
> >> +	__le64 *pixel_addr =3D packed_pixels_addr(composer, x, y);
> >> +
> >> +	/*
> >> +	 * Because the format byte order is in little-endian and this code
> >> +	 * needs to run on big-endian machines too, we need modify
> >> +	 * the byte order from little-endian to the CPU native byte order.
> >> +	 */
> >> +	return le64_to_cpu(*pixel_addr);
> >> +}
> >> +
> >> +/*
> >> + * The following functions are used as blend operations. But unlike t=
he
> >> + * `alpha_blend`, these functions take an ARGB16161616 pixel from the
> >> + * source, convert it to a specific format, and store it in the desti=
nation.
> >> + *
> >> + * They are used in the `compose_active_planes` and `write_wb_buffer`=
 to
> >> + * copy and convert one pixel from/to the output buffer to/from
> >> + * another buffer (e.g. writeback buffer, primary plane buffer).
> >> + */
> >> +
> >> +void convert_to_ARGB8888(u64 argb_src1, u64 argb_src2, int x, int y,
> >> +			 struct vkms_composer *dst_composer)
> >> +{
> >> +	u8 *pixel_addr =3D packed_pixels_addr(dst_composer, x, y);
> >> +
> >> +	/*
> >> +	 * This sequence below is important because the format's byte order =
is
> >> +	 * in little-endian. In the case of the ARGB8888 the memory is
> >> +	 * organized this way:
> >> +	 *
> >> +	 * | Addr     | =3D blue channel
> >> +	 * | Addr + 1 | =3D green channel
> >> +	 * | Addr + 2 | =3D Red channel
> >> +	 * | Addr + 3 | =3D Alpha channel
> >> +	 */
> >> +	pixel_addr[0] =3D DIV_ROUND_UP(argb_src1 & 0xffffllu, 257);
> >> +	pixel_addr[1] =3D DIV_ROUND_UP((argb_src1 & (0xffffllu << 16)) >> 16=
, 257);
> >> +	pixel_addr[2] =3D DIV_ROUND_UP((argb_src1 & (0xffffllu << 32)) >> 32=
, 257);
> >> +	pixel_addr[3] =3D DIV_ROUND_UP((argb_src1 & (0xffffllu << 48)) >> 48=
, 257); =20
> >=20
> > This could be potentially expensive if the compiler ends up using an
> > actual div instruction.
> >  =20
> Yes, I'm using the DIV_ROUND_UP because I couldn't figure out how the=20
> "Faster div by 255" works to adapt to 16 bits.

But does the compiler actually do a div instruction? If not, then no
worries. If it does, then maybe something to look into, *if* this shows
up in profiling.


Thanks,
pq

> > Btw. this would be shorter to write as
> >=20
> > 	(argb_src1 >> 16) & 0xffff
> >=20
> > etc. =20
> I will use it in the V2. Thanks.
>=20
> >=20
> > Thanks,
> > pq
> >  =20
> >> +}
> >> +
> >> +void convert_to_XRGB8888(u64 argb_src1, u64 argb_src2, int x, int y,
> >> +			 struct vkms_composer *dst_composer)
> >> +{
> >> +	u8 *pixel_addr =3D packed_pixels_addr(dst_composer, x, y);
> >> +
> >> +	pixel_addr[0] =3D DIV_ROUND_UP(argb_src1 & 0xffffllu, 257);
> >> +	pixel_addr[1] =3D DIV_ROUND_UP((argb_src1 & (0xffffllu << 16)) >> 16=
, 257);
> >> +	pixel_addr[2] =3D DIV_ROUND_UP((argb_src1 & (0xffffllu << 32)) >> 32=
, 257);
> >> +	pixel_addr[3] =3D 0xff;
> >> +}
> >> +
> >> +void convert_to_ARGB16161616(u64 argb_src1, u64 argb_src2, int x, int=
 y,
> >> +			     struct vkms_composer *dst_composer)
> >> +{
> >> +	__le64 *pixel_addr =3D packed_pixels_addr(dst_composer, x, y);
> >> +
> >> +	*pixel_addr =3D cpu_to_le64(argb_src1);
> >> +}
> >> +
> >> +#endif /* _VKMS_FORMATS_H_ */ =20
> >  =20


--Sig_/y.0ESSWVeFW=WgObJd32FkV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmFufE8ACgkQI1/ltBGq
qqdJTBAAsA9jIx1H3pqczUELzjTjeW0X++r5w6MqjHjpS6z/naOIIaN09Eh8tybc
5S+STRuO5VJkN7zixO5KGpKz/cenh/sm12/AGrF5/qgudrCWYoCQwPxpmzLeuv7P
fGdDyeos+5fZcUbEE7N0gBXS72zclBfHNPF29hhvXSfkb8VvwvEwbVHFr+h5BZf/
sYM5czjZk2wCRII8l+mRaSuDOjLirnlfv98rUvaZ7e7sKFr0tOxnUxTeytE+6/qG
1wSmLMBa6zGl9f5RLT2NZkIbLHEt9eYiiTiX0E++RRIuXsZW4C7gCel5wmhmFMAu
IIyirGofmqYBSHuvYUthmtp5ZsWkdaxfE1ittlGR28ODnpQr/jATPEhvj+km8AX1
x11niADVHv5saBzkZ5fhF1hrj0UF1LSG1KxnqHksfzBKU7te9WvCbQZR9lO2xcca
mz3gwuyi1ijeBz9YD/h3QsXkTIkjXGKk1GXkULeXXonO4Un/ffWXneHzSHSzM7nC
XLy/EnvEKiRc1+3EMRRtK2ILssXFbnP5ZtAPOkzS3X97FUtb4weNjuk9S78TO6r4
53zK0M20LNPLzI+Xh2TQUTJ0ocIrGwef31srWQc9/5VXbVQgb+M9rRcej7NhEYdR
X3cF3OzgSnENtrLmq9qWA3USYL3zhKeaScQ3B0YKDkvvb5ukHlI=
=2n/U
-----END PGP SIGNATURE-----

--Sig_/y.0ESSWVeFW=WgObJd32FkV--
