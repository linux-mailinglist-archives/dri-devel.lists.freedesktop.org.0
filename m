Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0CC616295
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 13:20:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB3D189A5E;
	Wed,  2 Nov 2022 12:20:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4F9889A5E
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Nov 2022 12:20:05 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id f37so27909190lfv.8
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Nov 2022 05:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=kuKNCfJ7jYZ3EMSIlpqztbG3+4MXqN8G46M7sEDLvKg=;
 b=hBptAHx4OmJ9EsQBtcXMOcSL8HDctm13FqlZ7Ufvvxrt/VqdbLIV1p7PUSuLsWhbMP
 t3GzB/WMYkCm43BLZ5z/oqDNnhX34Sf04qpCLcHGRX87jImzhdz5JqGjL7nBeZBGZWAv
 Mmhgpg+DYGovkQGLmIJQ4VheCfxDto+Ol1xEfvVUVPemAguJpHI2LEgeaO1umeuxDOUy
 X+n8OpjPTlo5CF/usrHpXJOZUao+3aq0eNL8yrh6qNOw06elN4lU0B3WMizRFuq9aBOv
 LWnNVj7OxYfKFmeKt7Hd78+sBdi8R6EbQOFf7zU0V9CErdUJ4gUE9LJ0TroOiea7W7km
 0QiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kuKNCfJ7jYZ3EMSIlpqztbG3+4MXqN8G46M7sEDLvKg=;
 b=B0Mo96cum+J6rSL14LUdRSKn5Tydj20YRexovu7FE0SIvp+auOfvqkyJ14dAYQqyym
 RncfCrIfS4H/CaK04UBzR5GZ3q95RcoIrKvFi7cyumySHstBnqxWE0KhSHtH/5M4hKKp
 SR8yFibyfqSj3xHHM5B5fOe8/pFI4sW0s/rnQDPMbI23czOnx/ZHwH6Kx1fJPIT4BjDk
 O92w6SAjICeWLiNk/8lImL4Xklz5WadkmD/c/1KwNoPAxmZIF3/gwRMOTWJItMwBhMMh
 AGj2oKXg3n/jXfB21ZlxTcS5TJQAa58V2tbMKBpfD0DWvvJMPQR5q04++3ufSstW/oGe
 2Bvg==
X-Gm-Message-State: ACrzQf3xxAq9mgwPkYmb6UfgTMW/3mMrWpODUd+AacCcwEmnru4CqfDJ
 pyikKOT/0oFhRLmeB5Rggr4=
X-Google-Smtp-Source: AMsMyM5mqpMuZfp3xpMisembUa38J1QXeyAbHNXleXBfhj2x0hW/pANo5NqEaFsai5dXjtGYlBtPcg==
X-Received: by 2002:a05:6512:110c:b0:4a2:4119:f5c4 with SMTP id
 l12-20020a056512110c00b004a24119f5c4mr8838926lfg.606.1667391603826; 
 Wed, 02 Nov 2022 05:20:03 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 e13-20020ac25cad000000b004a44ffb1050sm1990649lfq.171.2022.11.02.05.20.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 05:20:03 -0700 (PDT)
Date: Wed, 2 Nov 2022 14:19:54 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Christian =?UTF-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: Try to address the DMA-buf coherency problem
Message-ID: <20221102141954.7d362068@eldfell>
In-Reply-To: <b422be59-4b4b-2d0d-8e8c-b19f27c6832e@gmail.com>
References: <20221020121316.3946-1-christian.koenig@amd.com>
 <3d7353f3fa5905ce18e5b2d92f758f098189bc5a.camel@pengutronix.de>
 <7f5eff36-6886-bb06-061a-dd4263b61605@gmail.com>
 <f5de84cfe81fee828bbe0d47d379028d28ef6ca6.camel@pengutronix.de>
 <e02cedc2-6741-8813-a7a5-f8769e301745@gmail.com>
 <a53e5df51ec0f2f9d4c2d377c0cc5ba85f2e58ff.camel@ndufresne.ca>
 <9d716641-55c6-1590-26c2-1c3b14a28226@gmail.com>
 <CAPj87rMPkmimR_RJHhxYZokH__TVpPArk0h6drOUSx7Z9+oAHA@mail.gmail.com>
 <11a6f97c-e45f-f24b-8a73-48d5a388a2cc@gmail.com>
 <caf4d6b82843788db97555a58bc9e33915e5b50a.camel@ndufresne.ca>
 <b422be59-4b4b-2d0d-8e8c-b19f27c6832e@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OAKsq5M/R_mtofD1AWiwUv/";
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
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 sumit.semwal@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/OAKsq5M/R_mtofD1AWiwUv/
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 2 Nov 2022 12:18:01 +0100
Christian K=C3=B6nig <ckoenig.leichtzumerken@gmail.com> wrote:

> Am 01.11.22 um 22:09 schrieb Nicolas Dufresne:
> > [SNIP] =20
> >>> But the client is just a video player. It doesn't understand how to
> >>> allocate BOs for Panfrost or AMD or etnaviv. So without a universal
> >>> allocator (again ...), 'just allocate on the GPU' isn't a useful
> >>> response to the client. =20
> >> Well exactly that's the point I'm raising: The client *must* understand
> >> that!
> >>
> >> See we need to be able to handle all restrictions here, coherency of t=
he
> >> data is just one of them.
> >>
> >> For example the much more important question is the location of the da=
ta
> >> and for this allocating from the V4L2 device is in most cases just not
> >> going to fly. =20
> > It feels like this is a generic statement and there is no reason it cou=
ld not be
> > the other way around. =20
>=20
> And exactly that's my point. You always need to look at both ways to=20
> share the buffer and can't assume that one will always work.
>=20
> As far as I can see it you guys just allocate a buffer from a V4L2=20
> device, fill it with data and send it to Wayland for displaying.
>=20
> To be honest I'm really surprised that the Wayland guys hasn't pushed=20
> back on this practice already.

What should we Wayland people be pushing back on exactly? And where is
our authority and opportunity to do so?

The Wayland protocol dmabuf extension allows a graceful failure if the
Wayland compositor cannot use the given dmabuf at all, giving the
client an opportunity to try something else. The Wayland protocol also
tells clients which DRM rendering device at minimum the dmabuf needs to
be compatible with. It even tells which KMS device the dmabuf could be
put on direct scanout if the dmabuf was suitable for that and direct
scanout is otherwise possible.

What the client (application) does with all that information is up to
the client. That code is not part of Wayland.

I'm sure we would be happy to add protocol for anything that
https://github.com/cubanismo/allocator needs to become the universal
optimal buffer allocator library.


> This only works because the Wayland as well as X display pipeline is=20
> smart enough to insert an extra copy when it find that an imported=20
> buffer can't be used as a framebuffer directly.

The only fallback Wayland compositors tend to do is use OpenGL/Vulkan
rendering for composition if direct scanout on a KMS plane does not
work. There are many reasons why direct scanout may not be possible in
addition to hardware and drivers not agreeing to do it with the given
set of buffers.

A general purpose (read: desktop) Wayland compositor simply cannot live
without being able to fall back from KMS composition to software/GPU
composition.

But yes, there are use cases where that fallback is as good as failing
completely. Those are not desktops but more like set-top-boxes and TVs.


Thanks,
pq

--Sig_/OAKsq5M/R_mtofD1AWiwUv/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmNiYGoACgkQI1/ltBGq
qqcTqA/5Ab8/hzyDs16KNLWjEM4Gqt2YwAzjWYVw4EKO570tTWXwH0MBhj9zEdnk
4oNieyffSiLmLvrRc0N4R+NSwtpGBrOqO6V44SyxUq/moR5jCSI06okLmQnzPIxP
TEwtzHdIV/50//uKbgkdbLqziA4ypOB0y5x0N7xyeP0EHcJ7QIS5e05rx3ockI2h
4d8Eb//5Y98gDwz/zkFIMty3wm3RsdpTdIT01PBnImkhotq5Bm52o90KX0jhWLrS
I1l1D6Pbt2PpkIJYUJhYCm8YQZvHEmd3Ro/koUVIjMsQIu47VsL2R6KzrswpYYva
xSDbRBpGtbCjaNhToyL+uPeSUergaO5Ow9jNDQtxez9w4A8JuDw3nNwJbrih5yUb
3sapkhAKW37xYWRiV9KwqNweCTsI3faBD00U+RZlmz6AgpYA0yS43WR4cPr81mc8
vawTvChhm1F0xY/UNp75oFQSj2/6nj90D08Y5SBcdn5UfH027HOEF6Lx9WxTh2lJ
+rlHGi5BiZ1Mbyio4w3EeCi4D9DejRPoSA3p/V2M7tPopjTu1XT2v6Svl2MuLrYT
A4bIi7fPCDEt9DY0b7faEfk84aeRjIhQKOhU1en42FxcTUoQcA14eyUWyfOI4Cdg
9NjU8s4NxMWxkQ7vQjhry7Rk4b8GpDSBkgd9Ye0HvnZ4C7iPtQE=
=FSEh
-----END PGP SIGNATURE-----

--Sig_/OAKsq5M/R_mtofD1AWiwUv/--
