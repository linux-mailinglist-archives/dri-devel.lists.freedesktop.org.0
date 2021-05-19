Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3A03888CE
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 09:56:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05E7E6ECD4;
	Wed, 19 May 2021 07:56:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D9236ECD4;
 Wed, 19 May 2021 07:56:39 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id j10so17653834lfb.12;
 Wed, 19 May 2021 00:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=IBfR8gZe3l5S8pOzn7i8ghR1Fj99JbmBf6tOUZer5MI=;
 b=Dz+cssgY7e0wJmSTTGZVbBHgcAAlxyb3BgiHM1ktw19UD0kHrk4kK+17NMeYjlO5pj
 Y1JAoG20qLzsM6b3otWMB8vY7jcDp94acargwHsxjeytkRDKJTy1w535qP3dJ+9QQT6z
 MCnqdyXEvv9y0fSyePUkHYn8tuYzHfvWmUa0mpuTrC6WetimZJpag5I5PILN8U5KNpCh
 os7sKn8lNzSk3y/rBVAezrCNhH9rxlYxhzWFQPDfTZbqfZVPu3/nNULVEPNLP4ZYfQwE
 GDy/srKRqu+G+wvs0KZei3TtBj03qlBmFKuaMiOVBVVUhJtgPXS7R4vGjz11nZZ31Pa3
 4sww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=IBfR8gZe3l5S8pOzn7i8ghR1Fj99JbmBf6tOUZer5MI=;
 b=hQsKCkJvPkXy2dqQme8V4smu6UpaRcGD753IWxWpWRQ7QTYNS8JZ1gPPdOUnvhkTUx
 k1oONntvpi+J5ZvIiRcMGVwqTGvjeDiXHeBLwJBH4Pm17rVQmxW1QZEqYo3Ea6qdhaHB
 UVgRVGS83zBn/6y/OR6AHLJKPHyBcDrNI5Q3Q3AMOIhfilDWEh0UyC0PvEHCCkFYLXZg
 9f/O+wOVqdtiUymCMbfygBXzbF98sFr5WtVPdSidM9lCmJJNqw3z1HMngxUtvjx8zbV1
 r/EIjXNJPohqCk3eL+l+XhpxTV5gI8BiqNdFT5VT3bItCbZNZ4NsbTCmHh4vO6VKpQkw
 Bnuw==
X-Gm-Message-State: AOAM533wR6oKIs39+kWR1/q/Qte2HgiAyrm7pFvF44vTvunaU4FCGYoz
 mk9wBvkreXCa+iPSv3P1OH0=
X-Google-Smtp-Source: ABdhPJxUau0fImX7ezM2KGA1ComJEaQkc+B69Hhyn2TjakIPItN7eEr/cB8F72VWg/9dOjndgKOYCQ==
X-Received: by 2002:a05:6512:3d94:: with SMTP id
 k20mr7529298lfv.604.1621410997803; 
 Wed, 19 May 2021 00:56:37 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id k15sm3658760ljk.135.2021.05.19.00.56.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 00:56:37 -0700 (PDT)
Date: Wed, 19 May 2021 10:56:25 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH 1/3] drm/color: Add RGB Color encodings
Message-ID: <20210519105625.01e99f41@eldfell>
In-Reply-To: <812996ec-13f0-2440-c3d0-efb21fd877e5@amd.com>
References: <20210426173852.484368-1-harry.wentland@amd.com>
 <20210426173852.484368-2-harry.wentland@amd.com>
 <YIcBUl+94sHJsT8B@intel.com>
 <0090ce07-6102-59e7-bc8c-3528297aa5ae@amd.com>
 <a49e967a0082727757143828770bd671@sebastianwick.net>
 <cac44e69-85cb-661b-4a5e-33fafee8ea3d@amd.com>
 <20210517113432.11f95361@eldfell>
 <812996ec-13f0-2440-c3d0-efb21fd877e5@amd.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/k/36dMrq49Kl.NsLoULda7Z"; protocol="application/pgp-signature"
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
Cc: Deepak.Sharma@amd.com, Krunoslav.Kovac@amd.com, mcasas@google.com,
 Shashank.Sharma@amd.com, dri-devel@lists.freedesktop.org, Shirish.S@amd.com,
 Sebastian Wick <sebastian@sebastianwick.net>,
 Uma Shankar <uma.shankar@intel.com>, hersenxs.wu@amd.com,
 amd-gfx@lists.freedesktop.org, laurentiu.palcu@oss.nxp.com,
 Bhawanpreet.Lakha@amd.com, Nicholas.Kazlauskas@amd.com, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/k/36dMrq49Kl.NsLoULda7Z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 18 May 2021 10:32:48 -0400
Harry Wentland <harry.wentland@amd.com> wrote:

> On 2021-05-17 4:34 a.m., Pekka Paalanen wrote:
> > On Fri, 14 May 2021 17:04:51 -0400
> > Harry Wentland <harry.wentland@amd.com> wrote:
> >  =20
> >> On 2021-04-30 8:53 p.m., Sebastian Wick wrote: =20
> >>> On 2021-04-26 20:56, Harry Wentland wrote:   =20
> >=20
> > ...
> >  =20
> >>>> Another reason I'm proposing to define the color space (and gamma) of
> >>>> a plane is to make this explicit. Up until the color space and gamma
> >>>> of a plane or framebuffer are not well defined, which leads to drive=
rs
> >>>> assuming the color space and gamma of a buffer (for blending and oth=
er
> >>>> purposes) and might lead to sub-optimal outcomes.   =20
> >>>
> >>> Blending only is "correct" with linear light so that property of the
> >>> color space is important. However, why does the kernel have to be
> >>> involved here? As long as user space knows that for correct blending =
the
> >>> data must represent linear light and knows when in the pipeline blend=
ing
> >>> happens it can make sure that the data at that point in the pipeline
> >>> contains linear light.
> >>>    =20
> >>
> >> The only reason the kernel needs to be involved is to take full advant=
age
> >> of the available HW without requiring KMS clients to be aware of
> >> the difference in display HW. =20
> >=20
> > Can you explain in more tangible examples, why you think so, please?
> >=20
> > Is it because hardware does not fit the KMS UAPI model of the abstract
> > pixel pipeline?
> >  =20
>=20
> I'd wager no HW is designed to meet KMS UAPI, rather KMS UAPI is designed
> to abstract HW.

Of course, but you are in big trouble in any case if there is a
fundamental mismatch. You may have to declare that all existing KMS
properties for this stuff will be mutually exclusive with your new
properties, so that you can introduce a new generic abstract pipeline
in KMS.

By mutually exclusive I mean that a driver must advertise only one or
the other set of properties and never both. If you want to support
userspace that doesn't understand the alternative set, maybe you also
need a drm client cap to switch to the alternative set per-drm-client.

> > Or is it because you have fixed-function hardware elements that you can
> > only make use of when userspace uses an enum-based UAPI?
> >  =20
>=20
> One example is our degamma on our latest generation HW, where we have
> fixed-function "degamma" (rather de-EOTF):
>=20
> https://gitlab.freedesktop.org/agd5f/linux/-/blob/amd-staging-drm-next/dr=
ivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c#L166

Ok.

> > I would totally agree that the driver does not want to be analysing LUT
> > entries to decipher if it could use a fixed-function element or not. It
> > would introduce uncertainty in the UAPI. So fixed-function elements
> > would need their own properties, but I don't know if that is feasible
> > as generic UAPI or if it should be driver-specific (and so left unused
> > by generic userspace).
> >  =20
>=20
>=20
> For the CRTC LUTs we actually do a linearity check to program the
> HW into bypass when the LUT is linear since the KMS LUT definition
> doesn't map well onto the LUT definition used by our HW and leads
> to rounding errors and failing IGT kms_color tests (if I remember
> this correctly).
>=20
> https://gitlab.freedesktop.org/agd5f/linux/-/blob/amd-staging-drm-next/dr=
ivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c#L330
>=20
> Hence the suggestion to define pre-defined TFs right at a KMS level
> for usecases where we can assume the display will tonemap the=20
> content.

Right. Explaining this would have been a good introduction in your
cover letter.

Maybe you want to define new KMS properties that shall be mutually
exclusive with the existing KMS GAMMA/CTM/DEGAMMA properties and
clearly document them as such.


Thanks,
pq

--Sig_/k/36dMrq49Kl.NsLoULda7Z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmCkxKkACgkQI1/ltBGq
qqfFcQ/9HZWvQVnJ0+2Tk8Nw7NBQpC/szV0qZi1JrogTAffJsWDX/b0nDTTyD9Fy
8dZvsnQrrGg4ROlqdnsc3uRoNVF95GsIgU6LSqHHVMzbeH4OM4rc75pXbxAUJGo1
iYzg1EXExL88oVqhS1t5lOj9GfNTpubj1oEMYrWyZuhLbHZcg4Pf0c67Ea01tvhu
8lOEQxya31b3x4issaJ+hjcDxAdzINlDLm9JcwsLm/sCzmogn2x92XCaNHuXq+EE
CAbNugBRexlCmlDed84Xw78fl10xMYzHLnLGKirde0G+MuxFd5QLWncZRa9lJ8bm
1rMCEkw3/MwHj1iH146Q2Q9kC5hrg+1DSzp05oKz2On4gJJePpPjOScTN081/HnA
vnn8UwW1VJcjH/Z3x9MBCJXg/Yra1tKXuBAH+S8ZD95X5YAm8oaB4z6q/HBtHvVn
kd+LQGU7IUfwsLaSebva2pAgUzqi+Js9dIN3aeY0WPUrfZFjNzVnxE5YXQmUWfnN
vPwnkCJGHhKujfH65N16pwR/RSSzZ0Er/qQUB18cDSxHzP/Z8Yb61jpUnfpPm+Uq
08LSots9IJLV2BFfgDoEMUbh1/SA6exV4KDa2K+fsMV++Dd3d9vQexcZvJldB7AM
v9vTkawrxoQlL7S66pmR2Q8nQNb+LrFpETERyvV4h4Ie0ZDZIWE=
=oajY
-----END PGP SIGNATURE-----

--Sig_/k/36dMrq49Kl.NsLoULda7Z--
