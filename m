Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F456F8230
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 13:42:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E593D10E5DB;
	Fri,  5 May 2023 11:42:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D89610E5DB;
 Fri,  5 May 2023 11:42:09 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4f13bfe257aso1868860e87.3; 
 Fri, 05 May 2023 04:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683286925; x=1685878925;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=zgNAJy28jIonAgbEZZafrner3JTihM1QhMd/WPcbmVU=;
 b=FG0W1omFC81i+bxK5OwkuEFmQVy+uvZ/qD/Pm/vfQ9aTBSPqhRNY9ch6DNj4SJpSeV
 tBSljReWXJTF3cnt2xfls2LHDw/evXy8RJs77/w/RMxO6GBAONPklQPP1mwLG85D959+
 7Z2JzYtNU1A7ssY4Tzn3DHqWdgIScMQVi76YIHLp9Y+FOBzCLhQyk1G+LbFe+0O6iDWN
 93P20cHi/rBXjp5ZTQDqcb7QslGJXQgqAPRrOtQgKOPF5vXGvjTbkoZVjjVZ2zjswiQH
 RnWV6mzCFVRJz7T3jMAaa0gVf+V+txlS9MYTO9X4xJrKHs3bbvbIuMZ2UKrei7KkTFah
 VHQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683286925; x=1685878925;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zgNAJy28jIonAgbEZZafrner3JTihM1QhMd/WPcbmVU=;
 b=b4egnKkdSxD02CfnA1LQ//6Dd2f2X9yUm0OMNOuClNbo+aEz8kxnXJZk4YlCJXbicP
 xMvWhXQsqoGFkoC7/VRdubjS0HB0a8ZSkBA/LpxtA5KMiv+1IJWuAtfz+JeZy/MnF/Y9
 5DZ8HN6kmhKRYdf5gyafW3hxnWUnCK3Uwi3esIjHGPQ1c5RPqOri9kuhopbAKZ66pHIo
 sw+pe4fQupskyYcbixcz5a/xYxGWheLgywWJcI6kOjhjcCiQbQ98BOSGjEOz7ieakhho
 zzipkDiEz/PqKW3MlWPQ8Wp48OjVjbUYJcW9U1djvImIZ+eQZhMl3siNuIRG1Fw4SnbP
 PgEg==
X-Gm-Message-State: AC+VfDwdST5SWeFiHHJlMgDw7rBgDdXa93F9G8QuUzypJnDEj1Pn6eGV
 DsGoTgqvyIyfBj7G/VruNMk=
X-Google-Smtp-Source: ACHHUZ65QxUyvcbi1hnByNu1aBBKwXKxxs/MV62UNKu3UyswxuKH5rWaXJST0EZdxNBk7WpwZ7DjPA==
X-Received: by 2002:a05:6512:3886:b0:4f1:26f5:77fb with SMTP id
 n6-20020a056512388600b004f126f577fbmr430356lft.28.1683286924740; 
 Fri, 05 May 2023 04:42:04 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 m13-20020a056512014d00b004f14a2d6d0dsm244501lfo.102.2023.05.05.04.42.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 04:42:04 -0700 (PDT)
Date: Fri, 5 May 2023 14:41:50 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC] Plane color pipeline KMS uAPI
Message-ID: <20230505144150.741a90e1@eldfell>
In-Reply-To: <QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr>
References: <QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.24; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wDKpQcDXcd9BXB_OY6YV6iS";
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
Cc: "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 Melissa Wen <mwen@igalia.com>, Jonas =?UTF-8?B?w4VkYWhs?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Victoria Brekenfeld <victoria@system76.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <mdaenzer@redhat.com>,
 Aleix Pol <aleixpol@kde.org>, Joshua Ashton <joshua@froggi.es>,
 Sebastian Wick <sebastian.wick@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/wDKpQcDXcd9BXB_OY6YV6iS
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 04 May 2023 15:22:59 +0000
Simon Ser <contact@emersion.fr> wrote:

> Hi all,
>=20
> The goal of this RFC is to expose a generic KMS uAPI to configure the col=
or
> pipeline before blending, ie. after a pixel is tapped from a plane's
> framebuffer and before it's blended with other planes. With this new uAPI=
 we
> aim to reduce the battery life impact of color management and HDR on mobi=
le
> devices, to improve performance and to decrease latency by skipping
> composition on the 3D engine. This proposal is the result of discussions =
at
> the Red Hat HDR hackfest [1] which took place a few days ago. Engineers
> familiar with the AMD, Intel and NVIDIA hardware have participated in the
> discussion.

Hi Simon,

this is an excellent write-up, thank you!

Harry's question about what constitutes UAPI is a good one for danvet.

I don't really have much to add here, a couple inline comments. I think
this could work.

>=20
> This proposal takes a prescriptive approach instead of a descriptive appr=
oach.
> Drivers describe the available hardware blocks in terms of low-level
> mathematical operations, then user-space configures each block. We decided
> against a descriptive approach where user-space would provide a high-level
> description of the colorspace and other parameters: we want to give more
> control and flexibility to user-space, e.g. to be able to replicate exact=
ly the
> color pipeline with shaders and switch between shaders and KMS pipelines
> seamlessly, and to avoid forcing user-space into a particular color manag=
ement
> policy.
>=20
> We've decided against mirroring the existing CRTC properties
> DEGAMMA_LUT/CTM/GAMMA_LUT onto KMS planes. Indeed, the color management
> pipeline can significantly differ between vendors and this approach cannot
> accurately abstract all hardware. In particular, the availability, orderi=
ng and
> capabilities of hardware blocks is different on each display engine. So, =
we've
> decided to go for a highly detailed hardware capability discovery.
>=20
> This new uAPI should not be in conflict with existing standard KMS proper=
ties,
> since there are none which control the pre-blending color pipeline at the
> moment. It does conflict with any vendor-specific properties like
> NV_INPUT_COLORSPACE or the patches on the mailing list adding AMD-specific
> properties. Drivers will need to either reject atomic commits configuring=
 both
> uAPIs, or alternatively we could add a DRM client cap which hides the ven=
dor
> properties and shows the new generic properties when enabled.
>=20
> To use this uAPI, first user-space needs to discover hardware capabilitie=
s via
> KMS objects and properties, then user-space can configure the hardware vi=
a an
> atomic commit. This works similarly to the existing KMS uAPI, e.g. planes.
>=20
> Our proposal introduces a new "color_pipeline" plane property, and a new =
KMS
> object type, "COLOROP" (short for color operation). The "color_pipeline" =
plane
> property is an enum, each enum entry represents a color pipeline supporte=
d by
> the hardware. The special zero entry indicates that the pipeline is in
> "bypass"/"no-op" mode. For instance, the following plane properties descr=
ibe a
> primary plane with 2 supported pipelines but currently configured in bypa=
ss
> mode:
>=20
>     Plane 10
>     =E2=94=9C=E2=94=80 "type": immutable enum {Overlay, Primary, Cursor} =
=3D Primary
>     =E2=94=9C=E2=94=80 =E2=80=A6
>     =E2=94=94=E2=94=80 "color_pipeline": enum {0, 42, 52} =3D 0
>=20
> The non-zero entries describe color pipelines as a linked list of COLOROP=
 KMS
> objects. The entry value is an object ID pointing to the head of the link=
ed
> list (the first operation in the color pipeline).
>=20
> The new COLOROP objects also expose a number of KMS properties. Each has a
> type, a reference to the next COLOROP object in the linked list, and other
> type-specific properties. Here is an example for a 1D LUT operation:
>=20
>     Color operation 42
>     =E2=94=9C=E2=94=80 "type": enum {Bypass, 1D curve} =3D 1D curve
>     =E2=94=9C=E2=94=80 "1d_curve_type": enum {LUT, sRGB, PQ, BT.709, HLG,=
 =E2=80=A6} =3D LUT
>     =E2=94=9C=E2=94=80 "lut_size": immutable range =3D 4096
>     =E2=94=9C=E2=94=80 "lut_data": blob
>     =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 43
>=20
> To configure this hardware block, user-space can fill a KMS blob with 409=
6 u32
> entries, then set "lut_data" to the blob ID. Other color operation types =
might
> have different properties.
>=20
> Here is another example with a 3D LUT:
>=20
>     Color operation 42
>     =E2=94=9C=E2=94=80 "type": enum {Bypass, 3D LUT} =3D 3D LUT
>     =E2=94=9C=E2=94=80 "lut_size": immutable range =3D 33
>     =E2=94=9C=E2=94=80 "lut_data": blob
>     =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 43
>=20
> And one last example with a matrix:
>=20
>     Color operation 42
>     =E2=94=9C=E2=94=80 "type": enum {Bypass, Matrix} =3D Matrix
>     =E2=94=9C=E2=94=80 "matrix_data": blob
>     =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 43
>=20
> [Simon note: having "Bypass" in the "type" enum, and making "type" mutabl=
e is
> a bit weird. Maybe we can just add an "active"/"bypass" boolean property =
on
> blocks which can be bypassed instead.]
>=20
> [Jonas note: perhaps a single "data" property for both LUTs and matrices
> would make more sense. And a "size" prop for both 1D and 3D LUTs.]
>=20
> If some hardware supports re-ordering operations in the color pipeline, t=
he
> driver can expose multiple pipelines with different operation ordering, a=
nd
> user-space can pick the ordering it prefers by selecting the right pipeli=
ne.
> The same scheme can be used to expose hardware blocks supporting multiple
> precision levels.
>=20
> That's pretty much all there is to it, but as always the devil is in the
> details.
>=20
> First, we realized that we need a way to indicate where the scaling opera=
tion
> is happening. The contents of the framebuffer attached to the plane might=
 be
> scaled up or down depending on the CRTC_W and CRTC_H properties. Dependin=
g on
> the colorspace scaling is applied in, the result will be different, so we=
 need
> a way for the kernel to indicate which hardware blocks are pre-scaling, a=
nd
> which ones are post-scaling. We introduce a special "scaling" operation t=
ype,
> which is part of the pipeline like other operations but serves an informa=
tional
> role only (effectively, the operation cannot be configured by user-space,=
 all
> of its properties are immutable). For example:
>=20
>     Color operation 43
>     =E2=94=9C=E2=94=80 "type": immutable enum {Scaling} =3D Scaling
>     =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 44

I like this.

>=20
> [Simon note: an alternative would be to split the color pipeline into two=
, by
> having two plane properties ("color_pipeline_pre_scale" and
> "color_pipeline_post_scale") instead of a single one. This would be simil=
ar to
> the way we want to split pre-blending and post-blending. This could be le=
ss
> expressive for drivers, there may be hardware where there are dependencies
> between the pre- and post-scaling pipeline?]
>=20
> Then, Alex from NVIDIA described how their hardware works. NVIDIA hardware
> contains some fixed-function blocks which convert from LMS to ICtCp and c=
annot
> be disabled/bypassed. NVIDIA hardware has been designed for descriptive A=
PIs
> where user-space provides a high-level description of the colorspace
> conversions it needs to perform, and this is at odds with our KMS uAPI
> proposal. To address this issue, we suggest adding a special block type w=
hich
> describes a fixed conversion from one colorspace to another and cannot be
> configured by user-space. Then user-space will need to accomodate its pip=
eline
> for these special blocks. Such fixed hardware blocks need to be well enou=
gh
> documented so that they can be implemented via shaders.
>=20
> We also noted that it should always be possible for user-space to complet=
ely
> disable the color pipeline and switch back to bypass/identity without a
> modeset. Some drivers will need to fail atomic commits for some color
> pipelines, in particular for some specific LUT payloads. For instance, AMD
> doesn't support curves which are too steep, and Intel doesn't support cur=
ves
> which decrease. This isn't something which routinely happens, but there m=
ight
> be more cases where the hardware needs to reject the pipeline. Thus, when
> user-space has a running KMS color pipeline, then hits a case where the
> pipeline cannot keep running (gets rejected by the driver), user-space ne=
eds to
> be able to immediately fall back to shaders without any glitch. This does=
n't
> seem to be an issue for AMD, Intel and NVIDIA.
>=20
> This uAPI is extensible: we can add more color operations, and we can add=
 more
> properties for each color operation type. For instance, we might want to =
add
> support for Intel piece-wise linear (PWL) 1D curves, or might want to adv=
ertise
> the effective precision of the LUTs. The uAPI is deliberately somewhat mi=
nimal
> to keep the scope of the proposal manageable.
>=20
> Later on, we plan to re-use the same machinery for post-blending color
> pipelines. There are some more details about post-blending which have been
> separately debated at the hackfest, but we believe it's a viable plan. Th=
is
> solution would supersede the existing DEGAMMA_LUT/CTM/GAMMA_LUT propertie=
s, so
> we'd like to introduce a client cap to hide the old properties and show t=
he new
> post-blending color pipeline properties.
>=20
> We envision a future user-space library to translate a high-level descrip=
tive
> color pipeline into low-level prescriptive KMS color pipeline ("libliftof=
f but
> for color pipelines"). The library could also offer a translation into sh=
aders.
> This should help share more infrastructure between compositors and ease K=
MS
> offloading. This should also help dealing with the NVIDIA case.
>=20
> To wrap things up, let's take a real-world example: how would gamescope [=
2]
> configure the AMD DCN 3.0 hardware for its color pipeline? The gamescope =
color
> pipeline is described in [3]. The AMD DCN 3.0 hardware is described in [4=
].
>=20
> AMD would expose the following objects and properties:
>=20
>     Plane 10
>     =E2=94=9C=E2=94=80 "type": immutable enum {Overlay, Primary, Cursor} =
=3D Primary
>     =E2=94=94=E2=94=80 "color_pipeline": enum {0, 42} =3D 0
>     Color operation 42 (input CSC)
>     =E2=94=9C=E2=94=80 "type": enum {Bypass, Matrix} =3D Matrix
>     =E2=94=9C=E2=94=80 "matrix_data": blob
>     =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 43
>     Color operation 43
>     =E2=94=9C=E2=94=80 "type": enum {Scaling} =3D Scaling
>     =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 44
>     Color operation 44 (DeGamma)
>     =E2=94=9C=E2=94=80 "type": enum {Bypass, 1D curve} =3D 1D curve
>     =E2=94=9C=E2=94=80 "1d_curve_type": enum {sRGB, PQ, =E2=80=A6} =3D sR=
GB
>     =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 45
>     Color operation 45 (gamut remap)
>     =E2=94=9C=E2=94=80 "type": enum {Bypass, Matrix} =3D Matrix
>     =E2=94=9C=E2=94=80 "matrix_data": blob
>     =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 46
>     Color operation 46 (shaper LUT RAM)
>     =E2=94=9C=E2=94=80 "type": enum {Bypass, 1D curve} =3D 1D curve
>     =E2=94=9C=E2=94=80 "1d_curve_type": enum {LUT} =3D LUT
>     =E2=94=9C=E2=94=80 "lut_size": immutable range =3D 4096
>     =E2=94=9C=E2=94=80 "lut_data": blob
>     =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 47
>     Color operation 47 (3D LUT RAM)
>     =E2=94=9C=E2=94=80 "type": enum {Bypass, 3D LUT} =3D 3D LUT
>     =E2=94=9C=E2=94=80 "lut_size": immutable range =3D 17
>     =E2=94=9C=E2=94=80 "lut_data": blob
>     =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 48
>     Color operation 48 (blend gamma)
>     =E2=94=9C=E2=94=80 "type": enum {Bypass, 1D curve} =3D 1D curve
>     =E2=94=9C=E2=94=80 "1d_curve_type": enum {LUT, sRGB, PQ, =E2=80=A6} =
=3D LUT
>     =E2=94=9C=E2=94=80 "lut_size": immutable range =3D 4096
>     =E2=94=9C=E2=94=80 "lut_data": blob
>     =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 0
>=20
> To configure the pipeline for an HDR10 PQ plane (path at the top) and a H=
DR
> display, gamescope would perform an atomic commit with the following prop=
erty
> values:
>=20
>     Plane 10
>     =E2=94=94=E2=94=80 "color_pipeline" =3D 42
>     Color operation 42 (input CSC)
>     =E2=94=94=E2=94=80 "matrix_data" =3D PQ =E2=86=92 scRGB (TF)
>     Color operation 44 (DeGamma)
>     =E2=94=94=E2=94=80 "type" =3D Bypass
>     Color operation 45 (gamut remap)
>     =E2=94=94=E2=94=80 "matrix_data" =3D scRGB (TF) =E2=86=92 PQ
>     Color operation 46 (shaper LUT RAM)
>     =E2=94=94=E2=94=80 "lut_data" =3D PQ =E2=86=92 Display native
>     Color operation 47 (3D LUT RAM)
>     =E2=94=94=E2=94=80 "lut_data" =3D Gamut mapping + tone mapping + nigh=
t mode
>     Color operation 48 (blend gamma)
>     =E2=94=94=E2=94=80 "1d_curve_type" =3D PQ

You cannot do a TF with a matrix, and a gamut remap with a matrix on
electrical values is certainly surprising, so the example here is a
bit odd, but I don't think that hurts the intention of demonstration.

Btw. ISTR that if you want to do scaling properly with alpha channel,
you need optical values multiplied by alpha. Alpha vs. scaling is just
yet another thing to look into, and TF operations do not work with
pre-mult.


Thanks,
pq

>=20
> I hope comparing these properties to the diagrams linked above can help
> understand how the uAPI would be used and give an idea of its viability.
>=20
> Please feel free to provide feedback! It would be especially useful to ha=
ve
> someone familiar with Arm SoCs look at this, to confirm that this proposal
> would work there.
>=20
> Unless there is a show-stopper, we plan to follow up this RFC with
> implementations for AMD, Intel, NVIDIA, gamescope, and IGT.
>=20
> Many thanks to everybody who contributed to the hackfest, on-site or remo=
tely!
> Let's work together to make this happen!
>=20
> Simon, on behalf of the hackfest participants
>=20
> [1]: https://wiki.gnome.org/Hackfests/ShellDisplayNext2023
> [2]: https://github.com/ValveSoftware/gamescope
> [3]: https://github.com/ValveSoftware/gamescope/blob/5af321724c8b8a29cef5=
ae9e31293fd5d560c4ec/src/docs/Steam%20Deck%20Display%20Pipeline.png
> [4]: https://kernel.org/doc/html/latest/_images/dcn3_cm_drm_current.svg


--Sig_/wDKpQcDXcd9BXB_OY6YV6iS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmRU634ACgkQI1/ltBGq
qqe3thAAqjl8Ps7w2iSmD6MUNnVogoTI/JbIcBF1A7K/hI7GwuL+BXewVjiWf7Vt
8CaUTAi88I0V+NFdc0Egh4VqVKCMBf204ZzWLOvS43ueHeKBhOU5NJ5jfD3H2BQC
k8+fUmuTFsFZqGpSNHswrSI9UKCacVT8MQlVqy4kvk/wtkNvSeH9QgaaQgdQ5U/E
IDx9Vl86uWLLJu67ceKLcobpHvuxjNDQYRgkFZUoX0tghs4mV1wr6GMjWw4+flvi
T76kkTo0O9YlZXL3znaysMuQtoePeBZfoIOldkdTx1PfKICq9G1vAb6+gCdX5w8B
CYM/zJ2tMfoiIK/bCBLTd94+fwXDw6RxXu9lnEEJ/stsIWuVcOj5Fl5w+8wWqRw9
oLMCpL4Sn6UB0oJ3mxQqvVaW1Ps3IYmqAgSPjjRKsZXl0y7AzAHYIbBKatH8clCr
eQk3K/KGtSWzHjWyt7k5cIZwxb7t/ZP5FfDJR9meCmEDmGcnnnmgqT4QqECT73uJ
enamG/mKzxqTTY8xWOTN6gRsljLk9XGRw6EfMWhP+x32PVtp4TBl3BeUBqzuYHJT
IE3pSq764bWUTuTwG29iucXl0+NQNfEYESyyInuR36IWCuI2cBHrZsCmvRb/eCyn
cEzae4MXyaMFJrfVTU8n+f8KcYJBKKS9o3nzVMpx/3YL09LUQAU=
=7Nwf
-----END PGP SIGNATURE-----

--Sig_/wDKpQcDXcd9BXB_OY6YV6iS--
