Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7435B84DD27
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 10:40:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A73A10E21C;
	Thu,  8 Feb 2024 09:40:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="e40Vp8Y3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF24210E5B7
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 09:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RsyuEJcIq9uxUv9TZ3/vzUqTZoTz8iHFtMHbuYDtRL0=; b=e40Vp8Y3qq6UEQtnukPuIlMv1t
 Ntu4QsD1Fj5NdwPe10J89VYk8Dhme3io/CAQKi1AZootvMEmFGclJAW9jdyGGiHNJe0Ckd96Yuva5
 o9iaEDFoD3VwJEHh1bKcmk/jD4mq/gRry3OrnGNA9o6bmZygeHO3uwwij9kh+ZDQnV90wEb2C+sW1
 ffSXvPWmhn1huiGejsweZMCwDm+SpETProjcboW+z4uo0utUmCJ0qtGjPd+84AIjDzBxc6qOAI/j/
 olzQXFCd6EKxUdJWdkMSW3hPVjg6wz+zYwYBSSO9yZjNIBTGCbv/ccvxSO//Vzoi1WeBWF/kXh8C/
 N8wYSE6Q==;
Received: from [194.136.85.206] (port=42524 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <pekka.paalanen@haloniitty.fi>) id 1rY0t0-0001Y0-2E;
 Thu, 08 Feb 2024 11:40:02 +0200
Date: Thu, 8 Feb 2024 11:39:51 +0200
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: arthurgrillo@riseup.net, miquel.raynal@bootlin.com, mripard@kernel.org,
 rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 mairacanal@riseup.net, hamohammed.sa@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 marcheu@google.com, seanpaul@google.com, nicolejadeyee@google.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com
Subject: Re: [PATCH 2/2] drm/vkms: Use a simpler composition function
Message-ID: <20240208113951.1f5f9f40@eldfell>
In-Reply-To: <ZcOmpInszAOVeKes@localhost.localdomain>
References: <20240205121913.379e28a4@eldfell>
 <ZcOmpInszAOVeKes@localhost.localdomain>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HIpi0=kZuRyS8Mj77A1H+/H";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - whm50.louhi.net
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - haloniitty.fi
X-Get-Message-Sender-Via: whm50.louhi.net: authenticated_id:
 pekka.paalanen@haloniitty.fi
X-Authenticated-Sender: whm50.louhi.net: pekka.paalanen@haloniitty.fi
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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

--Sig_/HIpi0=kZuRyS8Mj77A1H+/H
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 7 Feb 2024 16:49:56 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Hello Pekka, Arthur, Maxime,

Hi all

> > > > >>>>>> Change the composition algorithm to iterate over pixels inst=
ead of lines.
> > > > >>>>>> It allows a simpler management of rotation and pixel access =
for complex formats.
> > > > >>>>>>
> > > > >>>>>> This new algorithm allows read_pixel function to have access=
 to x/y
> > > > >>>>>> coordinates and make it possible to read the correct thing i=
n a block
> > > > >>>>>> when block_w and block_h are not 1.
> > > > >>>>>> The iteration pixel-by-pixel in the same method also allows =
a simpler
> > > > >>>>>> management of rotation with drm_rect_* helpers. This way it'=
s not needed
> > > > >>>>>> anymore to have misterious switch-case distributed in multip=
le places.           =20
> > > > >>>>>
> > > > >>>>> Hi,
> > > > >>>>>
> > > > >>>>> there was a very good reason to write this code using lines:
> > > > >>>>> performance. Before lines, it was indeed operating on individ=
ual pixels.
> > > > >>>>>
> > > > >>>>> Please, include performance measurements before and after thi=
s series
> > > > >>>>> to quantify the impact on the previously already supported pi=
xel
> > > > >>>>> formats, particularly the 32-bit-per-pixel RGB variants.
> > > > >>>>>
> > > > >>>>> VKMS will be used more and more in CI for userspace projects,=
 and
> > > > >>>>> performance actually matters there.
> > > > >>>>>
> > > > >>>>> I'm worrying that this performance degradation here is signif=
icant. I
> > > > >>>>> believe it is possible to keep blending with lines, if you ad=
d new line
> > > > >>>>> getters for reading from rotated, sub-sampled etc. images. Th=
at way you
> > > > >>>>> don't have to regress the most common formats' performance.  =
       =20
>=20
> I tested, and yes, it's significant for most of the tests. None of them=20
> timed out on my machine, but I agree that I have to improve this. Do you=
=20
> know which tests are the more "heavy"?

I don't, but considering that various userspace projects (e.g. Wayland
compositors) want to use VKMS more and more in their own CI, looking
only at IGT is not enough. Every second saved per run is a tiny bit of
data center energy saved, or developers waiting less for results.

I do have some expectations that for each KMS property, Wayland
compositors tend to use the "normal" property value more than any other
value. So if you test different pixel formats, you probably set
rotation to normal, since it's completely orthogonal in userspace. And
then you would test different rotations with just one pixel format.

At least I would personally leave it to IGT to test all the possible
combinations of pixel formats + rotations + odd sizes + odd positions.
Wayland compositor CI wants to test the compositor internals, not VKMS
internals.

> > > > >>>> While I understand performance is important and should be take=
n into
> > > > >>>> account seriously, I cannot understand how broken testing coul=
d be
> > > > >>>> considered better. Fast but inaccurate will always be signific=
antly
> > > > >>>> less attractive to my eyes.         =20
> > > > >>>
> > > > >>> AFAIK, neither the cover letter nor the commit log claimed it w=
as fixing
> > > > >>> something broken, just that it was "better" (according to what
> > > > >>> criteria?).       =20
>=20
> Sorry Maxime for this little missunderstanding, I will improve the commit=
=20
> message and cover letter for the v2.
>=20
> > > > >> Today's RGB implementation is only optimized in the line-by-line=
 case
> > > > >> when there is no rotation. The logic is bit convoluted and may p=
ossibly
> > > > >> be slightly clarified with a per-format read_line() implementati=
on,
> > > > >> at a very light performance cost. Such an improvement would defi=
nitely
> > > > >> benefit to the clarity of the code, especially when transformati=
ons
> > > > >> (especially the rotations) come into play because they would be =
clearly
> > > > >> handled differently instead of being "hidden" in the optimized l=
ogic.
> > > > >> Performances would not change much as this path is not optimized=
 today
> > > > >> anyway (the pixel-oriented logic is already used in the rotation=
 case). =20
>=20
> [...]
>=20
> > > > > I think it would, if I understand what you mean. Ever since I pro=
posed
> > > > > a line-by-line algorithm to improve the performance, I was thinki=
ng of
> > > > > per-format read_line() functions that would be selected outside o=
f any
> > > > > loops. =20
>=20
> [...]
>=20
> > > > > I haven't looked at VKMS in a long time, and I am disappointed to=
 find
> > > > > that vkms_compose_row() is calling plane->pixel_read() pixel-by-p=
ixel.
> > > > > The reading vfunc should be called with many pixels at a time whe=
n the
> > > > > source FB layout allows it. The whole point of the line-based fun=
ctions
> > > > > was that they repeat the innermost loop in every function body to=
 make
> > > > > the per-pixel overhead as small as possible. The VKMS implementat=
ions
> > > > > benchmarked before and after the original line-based algorithm sh=
owed
> > > > > that calling a function pointer per-pixel is relatively very expe=
nsive.
> > > > > Or maybe it was a switch-case.     =20
>=20
> [...]
>=20
> > > > But, I agree with Miquel that the rotation logic is easier to imple=
ment
> > > > in a pixel-based way. So going pixel-by-pixel only when rotation oc=
curs
> > > > would be great.   =20
> > >=20
> > > Yes, and I think that can very well be done in the line-based framewo=
rk
> > > still that existed in the old days before any rotation support was
> > > added. Essentially a plug-in line-getter function that then calls a
> > > format-specific line-getter pixel-by-pixel while applying the rotatio=
n.
> > > It would be simple, it would leave unrotated performance unharmed (use
> > > format-specific line-getter directly with lines), but it might be
> > > somewhat less performant for rotated KMS planes. I suspect that might
> > > be a good compromise.
> > >=20
> > > Format-specific line-getters could also be parameterized by
> > > pixel-to-pixel offset in bytes. Then they could directly traverse FB
> > > rows forward and backward, and even FB columns. It may or may not have
> > > a penalty compared to the original line-getters, so it would have to
> > > be benchmarked. =20
> >=20
> > Oh, actually, since the byte offset depends on format, it might be
> > better to parametrize by direction and compute the offset in the
> > format-specific line-getter before the loop.
> >  =20
>=20
> I'm currently working on this implementation. The algorithm would look=20
> like:
>=20
>     void blend(...) {
>         for(int y =3D 0; y < height; y++) {
> 		for(int plane =3D 0; plane < nb_planes; plane++) {
> 			if(planes[plane].read_line && planes[plane].rotation =3D=3D DRM_ROTATI=
ON_0) {

I would try to drop the rotation check here completely. Instead, when
choosing the function pointer to call here, outside of *all* loops, you
would check the rotation property. If rotation is a no-op, pick the
read_line function directly. If rotation/reflection is needed, pick a
rotation function that will then call read_line function pixel-by-pixel.

So planes[plane] would have two vfuncs, one with a plain read_line that
assumes normal orientation and can return a line of arbitrary length
from arbitrary x,y position, and another vfunc that this loop here will
call which is either some rotation handling function or just the same
function as the first vfunc.

The two function pointers might well need different signatures, meaning
you need a simple wrapper for the rotation=3Dnormal case too.

I believe that could result in cleaner code.

> 				[...] /* Small common logic to manage REFLECT_X/Y and translations */
> 				planes[plane].read_line(....);
> 			} else {
> 				[...] /* v1 of my patch, pixel by pixel read */
> 			}
> 		}
> 	}
>     }
>=20
> where read_line is:
>   void read_line(frame_info *src, int y, int x_start, int x_stop, pixel_a=
rgb16 *dts[])
>  - y is the line to read (so the caller need to compute the correct offse=
t)
>  - x_start/x_stop are the start and stop column, but they may be not=20
>    ordered properly (i.e DRM_REFLECT_X will make x_start greater than=20
>    x_stop)
>  - src/dst are source and destination buffers

This sounds ok. An alternative would be something like

enum direction {
        RIGHT,
        LEFT,
        UP,
        DOWN,
};

void read_line(frame_info *src, int start_x, int start_y, enum direction di=
r,
               int count_pixels, pixel_argb16 *dst);

Based on dir, before the inner loop this function would compute the
byte offset between the pixels to be read. If the format is multiplanar
YUV, it can compute the offset per plane. And the starting pointers per
pixel plane, of course, and one end pointer for the loop stop condition
maybe from dst.

This might make all the other directions than RIGHT much faster than
calling read_line one pixel at a time to achieve the same.

Would need to benchmark if this is significantly slower than your
suggestion for dir=3DRIGHT, though. If it's roughly the same, then it
would probably be worth it.


> This way:
> - It's simple to read for the general case (usage of drm_rect_* instead o=
f=20
>   manually rewriting the logic)
> - Each pixel format can be quickly implemented with "pixel-by-pixel"=20
>   methods
> - The performances should be good if no rotation is implied for some=20
>   formats
>=20
> I also created some helpers for conversions between formats to avoid code=
=20
> duplication between pixel and line algorithms (and also between argb and=
=20
> xrgb variants).
>=20
> The only flaw with this, is that most of the read_line functions will=20
> look like:
>=20
>     void read_line(...) {
> 	int increment =3D x_start < x_stop ? 1: -1;
> 	while(x_start !=3D x_stop) {
> 		out +=3D 1;
> 		[...] /* color conversion */
> 		x_start +=3D increment;
> 	}
>     }
>=20
> But as Pekka explained, it's probably the most efficient way to do it.

Yes, I expect them to look roughly like that. It's necessary for moving
as much of the setup computations and real function calls out of the
inner-most loop as possible. The middle (over KMS planes) and outer
(over y) loops are less sensitive to wasted cycles on redundant
computations.

> Is there a way to save the output of vkms to a folder (something like=20
> "one image per frame")? It's a bit complex to debug graphics without=20
> seeing them.
>=20
> I have something which (I think) should work, but some tests are failing=
=20
> and I don't find why in my code (I don't find the reason why the they are=
=20
> failing and the hexdump I added to debug seems normal).
>=20
> I think my issue is a simple mistake in the "translation managment" or=20
> maybe just a wrong offset, but I don't see my error in the code. I think =
a=20
> quick look on the final image would help me a lot.

I don't know anything about the kernel unit testing frameworks, maybe
they could help?

But if you drive the test through UAPI from userspace, use a writeback
connector to fetch the resulting image. I'm sure IGT has code doing
that somewhere, although many IGT tests rely on CRC instead because CRC
is more widely available in hardware.

Arthur's new benchmark seems to be using writeback, you just need to
make it save to file:
https://lore.kernel.org/all/20240207-bench-v1-1-7135ad426860@riseup.net/


Thanks,
pq

--Sig_/HIpi0=kZuRyS8Mj77A1H+/H
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXEoWcACgkQI1/ltBGq
qqddjA//VG6lspeHj6uR8yVaHPt5gdG/b5bzpHpGROPkU5ZU+dsVeJqEfLPN8L2k
ln9BzAYgbEuk1q1g6d/hidpq4SBc02tuZ09hm9MOaDQn4OSxMu96LvfAvJp5/g1D
AV5Q9ezDw5phv+yIdrHww6dTqRkI56GeCur337tg+tcH1iF48x2LcS9Yldic/vAC
b8tZjHckQQdevJdpfRaxg252Z3jigrYsukH+3BIyfhOxGf0ZMNbzJV2mFoKO4bcn
NONix4huoFRA6XuLGYE2QMejz03u6D+5oCIrCQar1TxUBkhnlXR4C5VRnZCARFzh
hPMSGL+Y60xPz4LazNyT8bUKc2XYFzr+FZRLsfaPcLnUnrhkcJHoPdeMq8SolDgv
FbJhfM4ASqfbSNTq3HQS+PlUvdh27lr0bU3es5Xu0GD+iCfYfC2MBQYKBTtEr5sn
ZheUyGJsMdtJjlISmbXjbiticH4YEIz+HvXqmCqNVTebZezQrb1ZMy8VdVrb2y4D
noVQTa4DEeswZo5D21wB5JNEzNlKqncg66Ws78kU4/AXDJ+ZeL1zdJ2I1IHbExkS
nYSP03FagE0BPcTCclv3M/rhvNSWoUEQsDfmzoheX0KT1fdHMid1C9siEaIchkRz
YxJbQqxrALXtYtGLa5z60n/YmdA0557pTKZm0FzqMXphWE44xlE=
=9D23
-----END PGP SIGNATURE-----

--Sig_/HIpi0=kZuRyS8Mj77A1H+/H--
