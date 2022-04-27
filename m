Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DBD51128D
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 09:32:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4782D10EA34;
	Wed, 27 Apr 2022 07:31:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9616210E9F0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 07:31:54 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id m23so1561827ljc.0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 00:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=dxy+h/d8lUEJ3C14OTTF2zK3X5Ye7dXsTKGXyrL4tao=;
 b=jA00sSuLkTT2701LSMpK0W4LcHNgdxoQwPkXWKL3ySvIrVfkoNxJbWejKFBRHhhvtM
 +tYtLCJ13/elZOuGKSJHeQ/TzwfGRZOfRfRGC2YW9iaucEuYGonH/mWgGkBbL5Hn1kpv
 bd+bdjnq/JZ2MRejAwhFaTfkCLdzvnZ1xuQqacsDBdwSOkXg22xdv1s8t+MYJ12lyLMI
 dObdt3r+ne8zhUQh8BV0hn+NByXueQzibWEsuLh1HTpq+7ZlgINUlJi0qkff4VKuYyX+
 sNVzjozHEBZ/btIStJ2sQwt5ycitlv0Kk9fgKFc1j8cFxwNLdBPaFhj8xVp9u5kx3BGH
 N2rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=dxy+h/d8lUEJ3C14OTTF2zK3X5Ye7dXsTKGXyrL4tao=;
 b=Pmlv6Nanj5znmO1k5Mw4MH+AONxE1LZUYJC4zERz9O66xN9ISGvBCJk6Od0rwCKwbK
 3uRERk+L9UQUHt6Y7mevrTM9QoE/2Ol8rzFvqTRVXtcK4Kln6Ht6QR42MPgZWcQv2cb6
 DY4EoJM99if/M+fEvqe7t9XYrNl4PQ81Xczss+zHY/CY7Qm9pFXGrVUDnRxVsMhWjCzX
 RnRniW/M1cJ29quoqaWEk7o53QvrfQ1cEEeMsxyeE0UfREMr+K2idQchiee0WORphxou
 WSO/PeF8uuQSX1gYlhXBiCopvUYtP0IocehujaI3aIQI+0OSmcWymXsfotkzSriitdcf
 fxSg==
X-Gm-Message-State: AOAM532OH4yFtkUeJhsqs+9HapKd60StukBK+lW8u4NHDGMK5MZ93oYo
 hqHPk5/KVyKprZolj+qvflk=
X-Google-Smtp-Source: ABdhPJxc4Dg7JQTzFrrFYRKk/O0AFSWpdbLtlhl9DW5vOWne0w6Xg+rZqlMG5yVXJLUZQuwte7BHVg==
X-Received: by 2002:a2e:150e:0:b0:24a:c41a:a3e4 with SMTP id
 s14-20020a2e150e000000b0024ac41aa3e4mr17189233ljd.371.1651044712481; 
 Wed, 27 Apr 2022 00:31:52 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 t2-20020a2e2d02000000b00244dc8ba5absm1752697ljt.117.2022.04.27.00.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 00:31:52 -0700 (PDT)
Date: Wed, 27 Apr 2022 10:31:43 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Igor Torrente <igormtorrente@gmail.com>
Subject: Re: [PATCH v5 5/9] drm: vkms: Add fb information to
 `vkms_writeback_job`
Message-ID: <20220427103143.3e84de91@eldfell>
In-Reply-To: <efaba095-498a-f03d-bab9-e2284b65dd59@gmail.com>
References: <20220404204515.42144-1-igormtorrente@gmail.com>
 <20220404204515.42144-6-igormtorrente@gmail.com>
 <20220420142305.3945f409@eldfell>
 <12fa5189-efab-11c9-3d08-6c5367748b1c@gmail.com>
 <20220425105602.151885fd@eldfell>
 <e246264d-c072-e36d-efd3-20a9a6491e20@gmail.com>
 <20220426100911.673c985e@eldfell>
 <efaba095-498a-f03d-bab9-e2284b65dd59@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2CzCwJKMyHZUy7rC_uLb50K";
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
Cc: hamohammed.sa@gmail.com, tzimmermann@suse.de, rodrigosiqueiramelo@gmail.com,
 airlied@linux.ie, leandro.ribeiro@collabora.com, melissa.srw@gmail.com,
 dri-devel@lists.freedesktop.org, tales.aparecida@gmail.com,
 ~lkcamp/patches@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/2CzCwJKMyHZUy7rC_uLb50K
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 26 Apr 2022 21:43:12 -0300
Igor Torrente <igormtorrente@gmail.com> wrote:

> On 4/26/22 04:09, Pekka Paalanen wrote:
> > On Mon, 25 Apr 2022 21:56:12 -0300
> > Igor Torrente <igormtorrente@gmail.com> wrote:
> >  =20
> >> Hi Pekka,
> >>
> >> On 4/25/22 04:56, Pekka Paalanen wrote: =20
> >>> On Sat, 23 Apr 2022 12:12:51 -0300
> >>> Igor Torrente <igormtorrente@gmail.com> wrote:
> >>>     =20
> >>>> Hi Pekka,
> >>>>
> >>>> On 4/20/22 08:23, Pekka Paalanen wrote: =20
> >>>>> On Mon,  4 Apr 2022 17:45:11 -0300
> >>>>> Igor Torrente <igormtorrente@gmail.com> wrote:
> >>>>>        =20
> >>>>>> This commit is the groundwork to introduce new formats to the plan=
es and
> >>>>>> writeback buffer. As part of it, a new buffer metadata field is ad=
ded to
> >>>>>> `vkms_writeback_job`, this metadata is represented by the `vkms_co=
mposer`
> >>>>>> struct. =20
> >>>>>
> >>>>> Hi,
> >>>>>
> >>>>> should this be talking about vkms_frame_info struct instead? =20
> >>>>
> >>>> Yes it should. I will fix this. Thanks.
> >>>>    =20
> >>>>>        =20
> >>>>>>
> >>>>>> Also adds two new function pointers (`{wb,plane}_format_transform_=
func`)
> >>>>>> are defined to handle format conversion to/from internal format.
> >>>>>>
> >>>>>> These things will allow us, in the future, to have different compo=
siting
> >>>>>> and wb format types.
> >>>>>>
> >>>>>> V2: Change the code to get the drm_framebuffer reference and not c=
opy its
> >>>>>>        contents(Thomas Zimmermann).
> >>>>>> V3: Drop the refcount in the wb code(Thomas Zimmermann).
> >>>>>> V5: Add {wb,plane}_format_transform_func to vkms_writeback_job
> >>>>>>        and vkms_plane_state (Pekka Paalanen)
> >>>>>>
> >>>>>> Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
> >>>>>> ---
> >>>>>>     drivers/gpu/drm/vkms/vkms_composer.c  |  4 ++--
> >>>>>>     drivers/gpu/drm/vkms/vkms_drv.h       | 31 +++++++++++++++++++=
++------
> >>>>>>     drivers/gpu/drm/vkms/vkms_plane.c     | 10 ++++-----
> >>>>>>     drivers/gpu/drm/vkms/vkms_writeback.c | 20 ++++++++++++++---
> >>>>>>     4 files changed, 49 insertions(+), 16 deletions(-) =20
> >=20
> > ...
> >  =20
> >>>>>> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkm=
s/vkms_drv.h
> >>>>>> index 2e6342164bef..2704cfb6904b 100644
> >>>>>> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> >>>>>> +++ b/drivers/gpu/drm/vkms/vkms_drv.h =20
> >=20
> > ...
> >  =20
> >>>>>> +
> >>>>>> +struct vkms_writeback_job {
> >>>>>> +	struct dma_buf_map data[DRM_FORMAT_MAX_PLANES];
> >>>>>> +	struct vkms_frame_info frame_info; =20
> >>>>>
> >>>>> Which frame_info is this? Should the field be called wb_frame_info?=
 =20
> >>>>
> >>>> Considering it's already in the writeback_job struct do you think th=
is
> >>>> necessary? =20
> >>>
> >>> This struct has 'data' too, and that is not the wb buffer, right? =20
> >>
> >> AFAIU, no. Each plane has its own `iosys_map map[]`.
> >> =20
> >>>
> >>> Hmm, if it's not the wb buffer, then using DRM_FORMAT_MAX_PLANES is
> >>> odd... =20
> >>
> >> Yeah. I honestly don't have any clue why we have an array of `iosys_ma=
p`
> >> for each plane, why we only use the map[0] and why we only call
> >> `iosys_map_is_null` only to the `primary_composer`.
> >>
> >> Maybe @tzimmermann or @rodrigosiqueiramelo can shed some light on these
> >> questions. =20
> >=20
> > Yeah, those questions would be really good to figure out.
> >=20
> > FWIW, I can tell you this: "plane" has two different meanings in the
> > context of KMS:
> >=20
> > https://gitlab.freedesktop.org/pq/color-and-hdr/-/blob/main/doc/glossar=
y.md#plane
> >=20
> > DRM_FORMAT_MAX_PLANES refers to the number of planes (or the number of
> > memory buffers) for a single image (single framebuffer). Most often
> > with RGB there is just one plane in one memory buffer. RGB buffer could
> > be accompanied with e.g. a compression data buffer, so two planes,
> > one buffer each. Different YUV formats have different numbers of planes
> > from N=3D1 to 3, and those plane may be stored in 1 to N memory buffers
> > (with dmabuf handles pointing to them).
> >=20
> > The number of planes and the number of memory buffers are often
> > conflated in APIs by just passing the same memory buffer multiple times
> > when multiple planes are stored in the same buffer (with different
> > offset).
> >=20
> > The number of planes is determined by the pixel format and the format
> > modifier. The number of memory buffers is more... vaguely defined and
> > may vary sometimes. =20
>=20
> Right. So probably this answers the first two questions. And also
> probably my initial implementation of YUV420 and NV12 is wrong.

If I'm reading the code right, it's using the maximum number of image
planes (four) as the maximum number of KMS planes (chosen by the
driver). IOW, it confusing the two meanings of "plane" which have
nothing to do with each other.

Assuming that there is one data[] element for each KMS plane created by
VKMS. That makes a further assumption that each KMS plane framebuffer
has only one image plane. I think. Which they do when you are limited
to RGB formats.


Thanks,
pq

--Sig_/2CzCwJKMyHZUy7rC_uLb50K
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmJo8V8ACgkQI1/ltBGq
qqcwtg/7BUrBo8Ts89dFXYkig8Qk/DsjUxuFeyOgS56pYSrYientwCwrMqP7g1oA
KJJJ02Bg2YrAkFYhmnOB6ffvu1O3vyFFvfpy5NKZ8U0FJMRolxyzVi5p73b2nQaT
XqhA6fpHxT6GLiFzljHMG9gW8DFCH9CwAx0a1I1xtOZ4OBOmTM4m52BQj64f1d8D
tYDMeKO7maWMGIwOwpCUZvEdl9f4vNCZ9QSPbr1shK0iXp2uu1xDfCoSNq3kEsmS
HKebWnk9XpyhN441Xx1zfxrKU2bX7FfhmckK13dzZH336iMMBzCLP77/wqCv/4qz
FC+EtGFW2VMCvbm4IQBuVfY6xPpcHcStpr7Eth7QUt+Pf+O6UNAvAsLKfLOokNaQ
kxGc65iiLbGiNMM9uuZsQd16cDssTGPHUX9KcFz4clZ0mHKP4c3anjTrHz8DXu/8
w97RRcnwYfE51kYJGeueykFglLeWBEzET+NGxhn/phpOUn9YloiT9gh4lerVZx6l
RYt84vGn5NZKahPngXCrEO2DS7fLd0ce5O16cSD5hVI5FvLH8kQjVOtfikO8lt7v
UMbwh+H/qNAhRe+U7gGG1IBV9GtTESP4V5GWZ04PmGX9E5hqNb45liT+GwdBzWYJ
EGRRqI8BlXRLEKHnq0tjDPN2W3f/IMYpJHOHqGLpvLkCCSUHAxs=
=qaMO
-----END PGP SIGNATURE-----

--Sig_/2CzCwJKMyHZUy7rC_uLb50K--
