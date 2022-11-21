Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B36631E13
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 11:18:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97F2910E29B;
	Mon, 21 Nov 2022 10:18:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3274410E209;
 Mon, 21 Nov 2022 10:17:53 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id d20so13916125ljc.12;
 Mon, 21 Nov 2022 02:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=XHSdoZsBF88kcG7H3dW5ImNOPPX3dbZDtvp/yASpO/M=;
 b=qWHJ5ZgJrSYrx4bEBx5GSMz9XuDDDU10ga7k9JdZSAXkAP/1YexREICOR4lqG1aJ55
 YSuvK1N2j6xqNlQJjjKfKqezk020Mr5HZG9n4q/RIzI3G1UM7/I+mb/7H2NUDrd1Bok4
 MyGhTs1E0jqN6llMwp59Hm8I0jrJvio/rMgfcj2eHrSKyfbaXtGGY8YNSlwbSh0tZ4HE
 LRGyW8Q49ttxhHGPJACorCoBxPZa+KtJ6AQRSrTQM2NlOIgBOHiHGdMay8everDUvDJH
 PBOLkbK3mwlewzxyr0Z/hCOUeIPftIRxBGpIV/qZ8CvmypK9Rb9OqS9YXHhm31EV8DdR
 HHkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XHSdoZsBF88kcG7H3dW5ImNOPPX3dbZDtvp/yASpO/M=;
 b=qLySdYo9weiouN1+XpBUCkzaKl830CH5er9xzsOAlUrkl+3VqMCKiyFnKDcP9Tx7kc
 beWzVPQRfOCx1QpHLSxRCkRNU5ww5NNwcdbe5FBMO94sHGWAVUs9xpKiPkd81igH+37t
 DBNwEFacZzYwlIPKsfjhvnPq9zVO4upm/Y6+yXf1S2+cdPDjRnYpEcWwOlYeEntnfQdf
 wQ+OL9LmvjbYV2wh84HI1vJvF8Sg8jgCuwV3uEmtcw7w7uk/Rojg2sKxLoR3j6ltXrEG
 eccNBaN1QOPbZBNlOwZ4tI65lZtHtBYeAcGFbPz+DNYlb96dWtAGwPQ+WPqh4p7a0I21
 gPrA==
X-Gm-Message-State: ANoB5pmDdSF9BS1ayeY4zdIF4YEDa3yStqY5ZDl/kLA2QhRLNJq1WgzL
 uRjHEf+qTKceM1aNC5/dJNI=
X-Google-Smtp-Source: AA0mqf74Snfbj1LniFnz8SorIvmrnvnvTS1hymFJ43+GJ3j4mrZKS05NMi7rtr35OUxu4EDms8r9mg==
X-Received: by 2002:a05:651c:1ca:b0:277:423a:fcc4 with SMTP id
 d10-20020a05651c01ca00b00277423afcc4mr5983239ljn.325.1669025870459; 
 Mon, 21 Nov 2022 02:17:50 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 t23-20020a056512209700b0049936272173sm1973441lfr.204.2022.11.21.02.17.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 02:17:50 -0800 (PST)
Date: Mon, 21 Nov 2022 12:17:46 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: The state of Quantization Range handling
Message-ID: <20221121121746.0dece5e4@eldfell>
In-Reply-To: <CAPY8ntCux_s-iNaYSH4Fs+kwNAiSfTat5saT0jiDcxaVwpGp=g@mail.gmail.com>
References: <CA+hFU4w8=yTU5tQgqZj4qUvJddAQL9fj5teTVSB_dvNcwCyr6g@mail.gmail.com>
 <CAPY8ntCnAjGy0e55raxV=2bgi1YPSringrKdRmJHeS+Li=3yeg@mail.gmail.com>
 <CA+hFU4x0PGs-8oUBSXQa9uTNvvW80ZPFnheoBWO0SZnxJ=FKXA@mail.gmail.com>
 <20221118121530.23c7c3ee@eldfell>
 <CAPY8ntCux_s-iNaYSH4Fs+kwNAiSfTat5saT0jiDcxaVwpGp=g@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oIghXg7KZQwDE069e185vcQ";
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/oIghXg7KZQwDE069e185vcQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 18 Nov 2022 15:53:29 +0000
Dave Stevenson <dave.stevenson@raspberrypi.com> wrote:

> Hi Pekka
>=20
> On Fri, 18 Nov 2022 at 10:15, Pekka Paalanen <ppaalanen@gmail.com> wrote:
> >
> > On Thu, 17 Nov 2022 22:13:26 +0100
> > Sebastian Wick <sebastian.wick@redhat.com> wrote:
> > =20
> > > Hi Dave,
> > >
> > > I noticed that I didn't get the Broadcast RGB property thanks to you
> > > (more below)
> > >
> > > On Tue, Nov 15, 2022 at 2:16 PM Dave Stevenson
> > > <dave.stevenson@raspberrypi.com> wrote: =20
> > > >
> > > > Hi Sebastian
> > > >
> > > > Thanks for starting the conversation - it's stalled a number of tim=
es
> > > > previously.
> > > >
> > > > On Mon, 14 Nov 2022 at 23:12, Sebastian Wick <sebastian.wick@redhat=
.com> wrote: =20
> > > > >
> > > > > There are still regular bug reports about monitors (sinks) and so=
urces
> > > > > disagreeing about the quantization range of the pixel data. In
> > > > > particular sources sending full range data when the sink expects
> > > > > limited range. From a user space perspective, this is all hidden =
in
> > > > > the kernel. We send full range data to the kernel and then hope it
> > > > > does the right thing but as the bug reports show: some combinatio=
ns of
> > > > > displays and drivers result in problems. =20
> > > >
> > > > I'll agree that we as Raspberry Pi also get a number of bug reports
> > > > where sinks don't always look at the infoframes and misinterpret the
> > > > data.
> > > > =20
> > > > > In general the whole handling of the quantization range on linux =
is
> > > > > not defined or documented at all. User space sends full range data
> > > > > because that's what seems to work most of the time but technically
> > > > > this is all undefined and user space can not fix those issues. So=
me
> > > > > compositors have resorted to giving users the option to choose the
> > > > > quantization range but this really should only be necessary for
> > > > > straight up broken hardware. =20
> > > >
> > > > Wowsers! Making userspace worry about limited range data would be a
> > > > very weird decision in my view, so compositors should always deal in
> > > > full range data. =20
> > >
> > > Making this a user space problem is IMO the ideal way to deal with it
> > > but that's a bit harder to do (I'll answer that in the reply to
> > > Pekka). So let's just assume we all agree that user space only deals
> > > with full range data. =20
> >
> > Limited range was invented for some reason, so it must have some use
> > somewhere, at least in the past. Maybe it was needed to calibrate mixed
> > digital/analog video processing chains with test images that needed to
> > contain sub-blacks and super-whites, to make sure that sub-blacks come
> > out as the nominal black etc. Just because desktop computers do not
> > seem to have any need for limited range, I personally wouldn't be as
> > arrogant as to say it's never useful. Maybe there are professional
> > video/broadcasting needs that currently can only be realized with
> > proprietary OS/hardware, because Linux just can't do it today?
> >
> > Why would TVs support limited range, if it was never useful? Why would
> > video sources produce limited range if it was always strictly inferior
> > to full range?
> >
> > Even digital image processing algorithms might make use of
> > out-of-unit-range values, not just analog circuitry for overshoot.
> >
> > But no, I can't give a real example, just speculation. Hence it's fine
> > by me to discard limited range processing for now. Still, what I
> > explain below would allow limited range processing without any extra
> > complexity by making the KMS color pipeline better defined and less
> > limiting for userspace. =20
>=20
> AIUI limited range comes from the analogue world, or possibly creative
> (film/TV) world, hence being used on Consumer devices rather than IT
> ones (CTA and CEA modes vs VESA and DMT modes).
>=20
> YCbCr output from video codecs typically uses a range of 16-235,
> therefore a media player wanting to pass the decoded video out to the
> display exactly as-is needs to be able to signal that to the display
> for it to be interpreted correctly.
>=20
> HDMI extended DVI. I believe both YCbCr support and range control were
> added to the HDMI spec at the same time, presumably to allow for this
> use case. Limited range RGB seems to be a bit of a quirk though.
>=20
> Just to be annoying, JPEG uses full range YCbCr.
>=20
> > > > How would composition of multiple DRM planes work if some are limit=
ed
> > > > range and some are full but you want limited range output? Your
> > > > hardware needs to have CSC matrices to convert full range down to
> > > > limited range, and know that you want to use them to effectively
> > > > compose to limited range.
> > > > In fact you can't currently tell DRM that an RGB plane is limited
> > > > range - the values in enum drm_color_range are
> > > > DRM_COLOR_YCBCR_LIMITED_RANGE and DRM_COLOR_YCBCR_FULL_RANGE [1]. =
=20
> >
> > Yeah, that's because range conversion has been conflated with
> > YUV-to-RGB conversion, and the result is always full-range RGB in
> > practise, AFAIU. There is no way to feed limited range color into the
> > further color pipeline in KMS, but that's actually a good thing.(*)
> >
> > The following is my opinion of the future, as someone who has been
> > thinking about how to make HDR work on Wayland while allowing the
> > display quality and hardware optimizations that Wayland was designed
> > for:
> >
> >
> > Userspace should not tell KMS about a plane being limited range at all.
> > The reason is the same why userspace should not tell KMS about what
> > colorspace a plane is in.
> >
> > Instead, userspace wants to program specific mathematical operations
> > into KMS hardware without any associated or implied semantics. It's
> > just math. The actual semantics have been worked out by userspace
> > before-hand. This allows to use the KMS hardware to its fullest effect,
> > even for things the hardware or KMS UAPI designers did not anticipate.
> >
> > IMO, framebuffers and KMS planes should ultimately be in undefined
> > quantization range, undefined color space, and undefined dynamic range.
> > The correct processing of the pixel values is programmed by per-plane
> > KMS properties like CTM, LUT, and more specialized components like
> > quantization range converter or YUV-to-RGB converter (which is just
> > another CTM at a different point, really) where userspace explicitly
> > programs the *operation*, and not the input and output types hoping the
> > driver and hardware does something sensible. =20
>=20
> How do you describe the functionality available on constrained
> hardware that has fixed matrices for YUV to RGB conversions using the
> normal BT601 and 709?
> Or hardware that has no per plane matrix for RGB? (I believe vc4 fits
> into this category).

Hi Dave,

enum property.

If they are fixed conversion matrices, each enum value can either refer
to a standard specifying the matrix or point to a DRM blob containing
the fixed matrix for userspace to take a look.

The same with 1D LUTs.

If hardware supports both arbitrary matrix and fixed matrices, one of
the enum values could e.g. be "use arbitrary matrix" and have another
KMS blob property for the matrix data.

The important thing is that the properties fully define the operation
done by the hardware, and do not depend on other things like is the
input image full or limited range or what color space it has.

So for quantization range operations applied to pixels, you would have
enum values:
- auto (driver-specific heuristics for backwards compatibility)
- identity (pass-through)
- limited-to-full with clipping
- full-to-limited

Compare that to enum values:
- auto (as above)
- force limited
- force full

These latter enum values do not encode the operation. The driver will
decide on what operation it does depending on what it *thinks* the
input image description is. This is indirect and error-prone. It can
also be not well-defined. We need well-defined operations, so that we
can do exactly the same in a rendering API (GL/Vulkan) in cases where
for some reason we cannot use KMS for it. For desktop window systems,
such fallbacks are very often needed. For set-top-box or other very
restricted use cases the fallbacks may be never needed.

Mind, that this quantization range pixel value operation property would
be orthogonal to the quantization range metadata sent to a sink, if the
sink can even accept such metadata.

>=20
> I'd also propose that you need a load of helpers so that the "normal"
> use cases of eg BT601 YCbCr to the default composition space is
> handled for simply. Otherwise the enforced complexity to userspace has
> just exploded.

I think it is not kernel UAPIs position to offer layered APIs for easy
use for simple cases. That's the job for userspace libraries.

Unfortunately, we also cannot take existing KMS properties away,
because it may regress (old) userspace.

> Or seeing as properties like COLOR_ENCODING and COLOR_RANGE already
> exist in the UAPI, add a "custom" mode to those that will enable all
> your other magic properties.

My explicit desire is to take all magic out of KMS.

Yes, something like that is probably necessary. Or a DRM client cap.
But I think all this is about some new UAPI. I think Sebastian wanted
just to have the existing UAPI spelled out and clarified what it means
and how it works, and that's fine. I'm just looking much further,
because I think the old design is a dead end and that people should
understand why while we are talking about it.

> > In that design, there is no problem at all to blend multiple planes of
> > differing quantization ranges together. Userspace first chooses the
> > blending space, a radiometrically linear RGB limited range BT.709 space
> > for example, and then programs each plane to produce exactly that. Then
> > CRTC properties are programmed to produce the desired type of output
> > signal. Finally, connector properties are programmed to send the
> > appropriate metadata to the sink. Of course, userspace takes the sink
> > capabilities into account before deciding all this.
> >
> > The thing KMS UAPI is missing are the per-plane properties. =20
>=20
> And hardware support on many platforms.
> I've just checked, and vc4 always composes to RGB.

That is very natural, because for alpha-blending to make sense, you
pretty much must have an additive color space. YCbCR is definitely not
one. Strictly speaking electrically encoded RGB is not one either, but
still people use it, and want it because they have always used it (it
won't work for HDR though). Optically encoded RGB is the right class of
color spaces for alpha-blending.

> Things like YCbCr
> for HDMI are handled in the HDMI tx block. How do we tell userspace
> that it has no choice over the blending space?

You tell userspace what your color pipeline looks like, and userspace
fits what it wants into it, or uses a rendering API as a fallback.

It's not as dire as it may sound, because as I said, (optical) RGB is
the only class of blending spaces that makes general sense.

Then again, there is no need for the display driver to even know what
the blending space is. It simply carries out the operations that
userspace has chosen from the set of operations the driver claims to
implement.

> If you're trying to make things totally comprehensive, please don't
> miss out chroma-siting as that is another property that is missing
> from KMS for YCbCr planes.

Of course, we do need that.

Lack of such property will prevent some display servers from using the
KMS planes for YCbCr when they become more strict about image quality.

> MPEG-2, MPEG-4 and H264 differ from JPEG and MPEG-1 in default
> chroma-siting, and HEVC differs again.
>=20
> Conversion of HDR to/from SDR is going to be an interesting problem on
> many platforms. I won't claim enough knowledge on the subject, but
> obviously there needs to be a choice made over which mode composition
> should happen in, and other planes will need to be converted. Is that
> conversion going to be totally generic?

We will see. I do doubt the hardware existing today will satisfy the
most demanding use cases, no matter how the UAPI is designed.

I think those conversions are also still much a research question,
which means generic programmable hardware has an edge as people can
experiment and choose their conversion methods more freely.

> Lots of questions posed by this discussion, but I'm not sure that they
> are specifically relevant to HDMI quantization ranges at this stage.

Right.

Thanks,
pq


> All RGB buffers should be full range, and full/limited range
> conversion should be controlled via a similar mechanism to "Broadcast
> RGB" but in the KMS core.
>=20
> Checking drm_hdmi_avi_infoframe_quant_range(), it already does the
> correct thing with regard to the EDID VCD block and signalling the
> quantization range. The implementation of range choice on i915 (and
> vendor vc4 tree) could be improved to also check
> display_info->rgb_quant_range_selectable and choose FULL even for CEA
> modes if the display allows it, but that may expose more compatibility
> issues with monitors where the EDID is a little iffy.
>=20
> Cheers
>   Dave

...

> > > > Cheers.
> > > >   Dave
> > > >
> > > > [1] https://elixir.bootlin.com/linux/latest/source/include/drm/drm_=
color_mgmt.h#L84
> > > > [2] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/=
drm_edid.c#L6756
> > > > [3] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/=
drm_edid.c#L5642
> > > > =20
> > > =20
> > =20


--Sig_/oIghXg7KZQwDE069e185vcQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmN7UEsACgkQI1/ltBGq
qqc+WxAAoZ/GyxXeAqBXZRGLMhGBMyaopFWpr0UVMZPZPnKEWTECRmeVV7ZLYOF4
RKijbBF1poTomM8/bsAyY0zhFT9ZyZ/KF4mE1BEdP2ws0IVrCVBtDffhh1sOxwGY
VuhewQoVbJbkvTTwnD5Z/tR5o0S3dZJctB2mDirjGFPwWLf8MlK5E80vCMWPOBjx
XI+ftQmmAeNwwci5W8x5oBzpPdtLeyeAaYp5u37BG3ZmG0YfVNbc/AsGDZ1cfbUx
j7H/yKbgvJxV6xE638qoq9EQnlwpfaIFrJeYgr5loSBhdaeV+a0urN8XiInz2nDi
0lzpkLinS2VQ9LDC06LyOoQ6ZcxhFtEX1xSis5PaZDUXLy1L1FC4qHaEBg1Riz5o
RdtisTiIPv7CqBLI1u7uVYWh9ywY/xiRrqUUBMrKjbF8SquV5xiI2Lp7MLWOBzBE
Z4hzrR7o0LqZ2xHLF5/P/1pNFBNUN08clXZ+FoAZjz5umsT++UJPwIpvRgcGQ5uU
5wjxT4QYk1KRRm/3jVqKwC2UBb1W2Vhl05Kf7H16yUhp0+olHP2oh4EEgPoEmM+c
vNvoZBFrPnGFrAibbEa+3bwr/BSPrex00dIZm3njn3zlCMasEy+GdQtdzDv4CaRj
nmJ6qz0TnKH0lBWyVyjsF2/6P/ST8+TWzXX/RWBdN8A/fDV+Yqs=
=z2/H
-----END PGP SIGNATURE-----

--Sig_/oIghXg7KZQwDE069e185vcQ--
