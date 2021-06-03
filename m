Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3C939A1AE
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 14:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95AEE6E1B3;
	Thu,  3 Jun 2021 12:58:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55EBF6E1B3;
 Thu,  3 Jun 2021 12:58:16 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id 131so7022714ljj.3;
 Thu, 03 Jun 2021 05:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=pcnEelWFoSgqLnVHqNXoXVDxnAHa/zLtGw0/INGOJzI=;
 b=MQ4JSTinQ+/ODnOyCzc24zEhY/m6tQXjltKc6X6rl6e+oMNqKWI8CrWMxhblFMNGEd
 Ky1A8oh/ISshWUoq1WD6PMOrgeuT2TQRUngCEqR0w7IWS3kTNmY67nu4nB6oQqPk9xzH
 qRSVPIiYzlB5yDaSwGzbVm3zmmeUnqgcVJH1tFiQxPJa2z4N2thT+5rHiRzpfvhQM00Q
 b+XNHjIQiXTGjA2XfABdJSvieAC9nd9kK8blR5AfjxdqJxK4FTkf5SCfJCrsoHy+7nxu
 3AQAeao+Dn8zXq7uXx2PJSuKQPnCUuQq+F9xiPq0TsNPzr3CDHhzRJT98sHyKiekPrDb
 cnwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=pcnEelWFoSgqLnVHqNXoXVDxnAHa/zLtGw0/INGOJzI=;
 b=KCXsAfZDLmB2PbN656gzlH4caVWvJbMIjyT4tQcfb6uCAEWNwvEbJYdRR9Kx55cr/2
 QGQiDyC263ZYjEr+yxclXeacP9Yhq+nfD47tuk6sUN7yoaZHrH9g4luBXHRoxkGVrZnz
 H4vGGs1boyuN8nMTQ+w78pzSf9Zm9WqXOUPRChEEEe2OLXj0uheP0mFPiXxodcyKPb6V
 r/PhE341TPbBScaPqAAWA0b2VfW/dLuRzYr6ohuKltLwUu48GCTdvjlTY4Zc60Gos/+4
 v1uV8QSbrBrFhMM4Gm1O6sONujIN4wkZazFs/j8OIYpDcFMP8uwiFvZfBqLNRyrLWrC8
 BigQ==
X-Gm-Message-State: AOAM5318E95qxiigVCSBsqc42m2yLxxFViAxxAOe9Tyo6cQmVHfklsXY
 tJli9rH1jww/E747DnXbxcU=
X-Google-Smtp-Source: ABdhPJw8RMPqFk4MCeaZS5OZm67xjFuAiCRh4OxWHXXMJlTsxxHVs8FW/uKVxl7R0kMGjDGCPhwdiQ==
X-Received: by 2002:a2e:6e09:: with SMTP id j9mr28854547ljc.151.1622725094692; 
 Thu, 03 Jun 2021 05:58:14 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id d15sm2339lfs.260.2021.06.03.05.58.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 05:58:14 -0700 (PDT)
Date: Thu, 3 Jun 2021 15:58:01 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Sebastian Wick <sebastian@sebastianwick.net>
Subject: Re: [PATCH 00/21] Add Support for Plane Color Lut and CSC features
Message-ID: <20210603155801.31944c71@eldfell>
In-Reply-To: <740c5f2c1db7d8152b3932a8d7cd7c55@sebastianwick.net>
References: <20210601105218.29185-1-uma.shankar@intel.com>
 <20210602122850.29412a29@eldfell>
 <5a9a8c3ee8d54c3ca2ccaca4aa5ad1d9@intel.com>
 <95e6a3e9-70d2-42d3-1289-a7de33f266c4@amd.com>
 <20210603114730.08e66ad0@eldfell>
 <740c5f2c1db7d8152b3932a8d7cd7c55@sebastianwick.net>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/pIurxAHsKH4jxna3YQYJdbK"; protocol="application/pgp-signature"
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, "Shankar,
 Uma" <uma.shankar@intel.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>, "Modem,
 Bhanuprakash" <bhanuprakash.modem@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/pIurxAHsKH4jxna3YQYJdbK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 03 Jun 2021 14:30:41 +0200
Sebastian Wick <sebastian@sebastianwick.net> wrote:

> On 2021-06-03 10:47, Pekka Paalanen wrote:
> > On Wed, 2 Jun 2021 19:42:19 -0400
> > Harry Wentland <harry.wentland@amd.com> wrote:
> >  =20
> >> On 2021-06-02 4:22 p.m., Shankar, Uma wrote: =20
> >> >
> >> > =20
> >> >> -----Original Message-----
> >> >> From: Pekka Paalanen <ppaalanen@gmail.com>
> >> >> Sent: Wednesday, June 2, 2021 2:59 PM
> >> >> To: Shankar, Uma <uma.shankar@intel.com>
> >> >> Cc: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.or=
g; Modem,
> >> >> Bhanuprakash <bhanuprakash.modem@intel.com>; Harry Wentland
> >> >> <harry.wentland@amd.com>
> >> >> Subject: Re: [PATCH 00/21] Add Support for Plane Color Lut and CSC =
features
> >> >>
> >> >> On Tue,  1 Jun 2021 16:21:57 +0530
> >> >> Uma Shankar <uma.shankar@intel.com> wrote:
> >> >> =20
> >> >>> This is how a typical display color hardware pipeline looks like: =
=20
> >=20
> > ...
> >  =20
> >> >>> This patch series adds properties for plane color features. It adds
> >> >>> properties for degamma used to linearize data and CSC used for gam=
ut
> >> >>> conversion. It also includes Gamma support used to again non-linea=
rize
> >> >>> data as per panel supported color space. These can be utilize by u=
ser
> >> >>> space to convert planes from one format to another, one color spac=
e to
> >> >>> another etc. =20
> >> >>
> >> >> This is very much welcome!
> >> >>
> >> >> There is also the thread:
> >> >> https://lists.freedesktop.org/archives/dri-devel/2021-May/306726.ht=
ml>>>
> >> >> Everything mentioned will interact with each other by changing what=
 the abstract
> >> >> KMS pixel pipeline does. I think you and Harry should probably look=
 at each others'
> >> >> suggestions and see how to fit them all into a single abstract KMS =
pipeline.
> >> >>
> >> >> People are adding new pieces into KMS left and right, and I fear we=
 lose sight of how
> >> >> everything will actually work together when all KMS properties are =
supposed to be
> >> >> generic and potentially present simultaneously. This is why I would=
 very much like to
> >> >> have that *whole* abstract KMS pipeline documented with *everything=
*. Otherwise
> >> >> it is coming really hard fast to figure out how generic userspace s=
hould use all these
> >> >> KMS properties together.
> >> >>
> >> >> Or if there cannot be a single abstract KMS pipeline, then sure, ha=
ve multiple, as long
> >> >> as they are documented and how userspace will know which pipeline i=
t is dealing
> >> >> with, and what things are mutually exclusive so we can avoid writin=
g userspace code
> >> >> for combinations that will never exist. =20
> >> >
> >> > This is a good suggestion to have the whole pipeline and properties =
documented along with
> >> > the exact usages. We may end with 2 properties almost doing similar =
work but needed due to
> >> > underlying hardware, but we can get that properly documented and def=
ined.
> >> >
> >> > I will discuss with Harry and Ville as well to define this.
> >> > =20
> >>=20
> >> Just wanted to let you know that I've seen and read through both of=20
> >> Shankar's patchsets
> >> and had some thoughts but haven't found the time to respond. I will=20
> >> respond soon. =20
> >=20
> > Hi Harry,
> >=20
> > awesome!
> >  =20
> >> I very much agree with Pekka. We need to make sure this all plays well=
=20
> >> together and is
> >> well documented. Maybe a library to deal with DRM KMS color=20
> >> management/HDR would even
> >> be helpful. Not sure yet how I feel about that. =20
> >=20
> > That is an excellent question. While I am working on Weston CM&HDR, I
> > already have issues with how to represent the color related
> > transformations. These new hardware features exposed here are nothing I
> > have prepared for, and would probably need changes to accommodate.
> >=20
> > The main Weston roadmap is drafted in
> > https://gitlab.freedesktop.org/wayland/weston/-/issues/467
> >=20
> > The MR that introduces the concept of a color transformation, and also
> > the whole beginnings of color management, is
> > https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/582
> >=20
> > In that MR, there is a patch introducing struct weston_color_transform:
> > https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/582/diff=
s?commit_id=3Dcffbf7c6b2faf7391b73ff9202774f660343bd34#ba0b86259533d5000d81=
c9c88109c9010eb0f641_0_77
> >=20
> > The design idea there is that libweston shall have what I call "color
> > manager" module. That module handles all the policy decisions about
> > color, it uses a CMM (Little CMS 2 in this case) for all the color
> > profile computations, and based on all information it has available
> > from display EDID, ICC profile files, Wayland clients via the CM&HDR
> > protocol extension and more, it will ultimately produce
> > weston_color_transform objects.
> >=20
> > weston_color_transform is a complete description of how to map a pixel
> > in one color model/space/encoding into another, maybe with user
> > preferred tuning/tone-mapping. E.g. from client content to the output's
> > blending space (output space but light-linear), or from output's
> > blending space to output's framebuffer space or maybe even monitor wire
> > space.
> >=20
> > The mapping described by weston_color_transform shall be implemented by
> > libweston's GL-renderer or by the DRM-backend using KMS properties,
> > whatever works for each case. So the description cannot be opaque, it
> > has to map to GLSL shaders (easy) and KMS properties (???).
> >=20
> > Now the problem is, what should weston_color_transform look like?
> >=20
> > The current design has two steps in a color transform:
> > - Transfer function: identity, the traditional set of three 1D LUTs, or
> >   something else.
> > - Color mapping: identity, a 3D LUT, or something else.
> >=20
> > "Something else" is a placeholder for whatever we want to have, but the
> > problem in adding new types of transfer function or color mapping
> > representations (e.g. the fancy new GAMMA_MODEs) is how will the color
> > manager create the parameters for those? =20
>=20
> I think the weston_color_transform is going a bit in the wrong
> direction. While the 3D LUT can describe everything if it has enough
> precision it indeed makes sense to apply a transform before to get the
> required precision down. It doesn't have to be a TF though and we really
> don't care what it is as long as in the end the content is in the
> correct color space and dynamic range. This might be enough to get
> something off the ground right now though.

Ok, please leave these comments in
https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/582 and
propose something? A new name for what I now called "transfer
function"? It is desperately needing comments.

> In the long run however it probably makes more sense to convert the
> color transform to a complete pipeline of enumerated, parametric and
> numerical elements together with some helpers to lower (enumerated >
> parametric > numerical) and fuse elements (to the point that you can
> always convert the pipeline to a 3D LUT). The color manager ideally
> should provide a pipeline with the highest abstraction and avoid fusing
> elements if it would result in a lose of information. This is a lot more
> complex but it also gives us much better chances of finding a way to
> offload the transform.
>=20
> AFAIR lcms uses such a model and gives you access to the pipeline. If we
> want to be independent of lcms we would need our own descriptions and
> possibly lower some lcms elements to our own stuff. I'm also not sure
> how good lcms is at retaining the high level description if possible.

Yes, I think LCMS and even ICC use such a model. Access to the pipeline
in LCMS I don't know about yet. You can construct, but inspect? I also
think you can plug custom code in LCMS into the pipeline, so it can be
totally arbitrary and also opaque.

Using our own description is what I'm doing, since I am keeping LCMS
contained in the color manager plugin.

Lowering that into what can fit in KMS properties though is a huge
problem. It can reduce precision, and how much precision are you good
to lose? That's a policy decision, and I'd like to contain policy in
color manager.

I would rather model weston_color_transform based on what KMS can do
than based on what CMM can do. That way the hard problems are left for
the color manager, while the rest of libweston can just implement the
model directly as much as it fits e.g. in KMS.


Thanks,
pq

--Sig_/pIurxAHsKH4jxna3YQYJdbK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmC40dkACgkQI1/ltBGq
qqd6xxAAgKNaQjbYJRNVVrd4L2OHa1vzOncTqAq1djwIfdgG4tNsptwLrIjUGODD
A+Wlg4/65uRWH5CKCZQP1YCixJSMjt1mactj+Q+mT4R36t+RZhZs0FN1gluv/h6V
SFoXc7o7gZyOMBVQEcdQYhREFfoa0X9md4ELtoDNwnaIAtRDqY6BogOEStHxsVA/
EnSW1Rm/7MSVDKjtoz9mdkIVEaU8qt251yARNkI715aM+47u+nRqfiU1sbxCkLYo
d3rv9a+nAf3327eB1fcyYJsY8ALf26KQls2Ro14okT3D2dJGeX2A6jGmYfJul0l5
RjTcKvBGh2aXqjDlcMg/c/sMNTLFvyv8bkjPSQadMURcoJdNShqDAkUji59E3831
1b+tbQLq4aCR72dMH0l3WvV2x6lJkHzFxPEjvJH85bCJ+k1G+v/uzpfHCh8P0jMr
RQ6NyD9bi/1slEvMLxw7QGrb19y9X5JANMhdTQ8DgIDIWXCXp9vXMK0hTLzIwLEM
siiexcdvpfLa2kjIbfiwuayVLWQ+5Gn89sMzJ7IzlEcy53V8n6y/kjYn2cbqhyhc
Txu4a+2n5SZPk5pdgyjugTkbdE3ZQBul9fVo3YievqV254WKYoOtChg97JyHav/I
InqbkLmfBqNWm3rmV/AwK5abEQNM/1Ifo9Zh9I2LMlYUirqYbPc=
=3Y02
-----END PGP SIGNATURE-----

--Sig_/pIurxAHsKH4jxna3YQYJdbK--
