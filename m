Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 905667DEE3C
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 09:35:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5AF010E828;
	Thu,  2 Nov 2023 08:35:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic316-12.consmr.mail.bf2.yahoo.com
 (sonic316-12.consmr.mail.bf2.yahoo.com [74.6.130.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7939E10E7E4
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 22:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1698877000; bh=yJFmAf0yHpqUxAB64un2t5EKjcPDEk7NvTcBuH3z5f4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To;
 b=j6PbbrEYzL4anFH/It//39zpSyPvq98D/0k9hq8p621NMrC28+u69W7WCG+D7+9WAmciu/kOU/IA6WX3/OY1gIKSVQ4AHYN5DEDYpt1iMHEjYG0R3nqMGAk8jSOj3RaUhHa/cnXKgsCwh6LlSKmh0VB7BBDisCEJl9S2uhEKLFWG7Ii1L6FvCEpX8gPYDvok6x9mmcZl6QDfU2A1NQfhJDX6slgXCJQ+aBcGBkIcc7RJwBHHrswehWN/+5FP3QkOXfhq2bawcd3u4NlpvBF2bOi4FoaElSJryhchwoaUMus2TFt414Jd/h2lFSRAIwnNlu7ImaDrT7MernzNlHmsSg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1698877000; bh=RZETjS5NusMVfe3KgKiNc60UudzBzk87NKswFtfKOaE=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=k2vhU/V2Tg6QKg5BjlYGewwM3z/dHdjSq5O8FekA1yKhaO01Cc4cfBNMu3Ajgz95C3VmFWYl1EeMTEYnnaZ6ogoOk+7mybiZo8QFPnDuTd2+wH6aAzKcppQ5TvitVAOQpDLSsHD+aMTgXIPJCyDoGNwvgaCDv7mKqsvVaGFgiVki7BadfObFZnIX4R3kKY+woQI3OP0XqlhFkD/Ll9OY3mS8bpUwErE6+aKQ0NK7gIpEZyrpUETkmhGFfM1p/86Zm2d2D8/5arFfnhVnsU32jDdbMBaaYsY+E3BUiJ1867tviajNzXJF65M5pbMdnPoPUXOns3ElD9Fj1ReAqtPjrg==
X-YMail-OSG: K3HT4_oVM1nCAUHAEdGBnRhfgNxX1_aBrnH0eU2S3Dy2b2pXv_4f1z36rKJqcM4
 YmlpIB.N7Rg08LTdC51DMUwDhzRLIQdUb_pfoIX1y_P113R3kCRXKKsHod738bCNlOA.hW7kQfY4
 nOeJ7w9K12c89z2ejvLegqbh3_k5jDItJ7gXm71DHvDi3AJ_DjNEs8fdLcvKFmkSVaUynWAD.3iF
 hb.qODWgqL8pbI_k6LgUk8IGRQCx4VYiho.3K9.hv_MFBQ5NdnzBnzZtlGYPlSMfnJ5vNGv4kZsL
 WkUIvKdY868l6Q_yHfK0i6Oe_MR2.GG884BgkmDURFlXXpL3H.je_aW3QwdWVendHlvdEL005VZi
 b9VcmDZza3qu7hw3Bu6tkfu9m54M.rT1OOvJGdaZgUkkdH7WcUnnNZvNSzANBBl_GMgdZmMGPHcI
 UbaatkoLSELMkHhFawMqLiyWAVm9bbtoLCvpW14boHMeOwV6JFIkBNJyn_AXmIB5hBka7umHhsMl
 dYkTAGPDoqLAWPX5HbMzBzu1mR8cluOvKCFxvDOlqlrVYfM8IgMmeYJ1J39Y7B3Srur7g3qUvfa5
 IuVznDm_tNjbVN53rDyo_gJgybcCkuIhfzubbZmbcxRboLTS107gsSoNmUWp16WOxMPdGKUjv7Xs
 22H9WvssK6SBHwtHHwkOgDXLBQUy9u.8ojAmDn6t04KDdp1NgZUqPgYHLnn0A2usKM832piHr10d
 M_Z4.1lSrYLZnqQWMGF9WH9j.UQTLXezY6dP.lU1NmrM8Cti3Oxbr9X7GrlYc2smQ4TBli6NODIC
 YDOvJwQYTu2.vbPz40EePvLb2CaUIGam_3MyKyDhKrv7yrrH.oJ0DWhrlPcAwSgdBDTe.ebjZZz9
 x.i0fGvOyfhY_f0v1m_EQtw8trO21ljAHAh7DzxYiHGAu.sKmkHHEp_xpPvGPuLCXK3jHMK4HnnC
 oR725f.UbxEkuiK.L.zssIRFBzl2VRb7ZxEo.r2Jtlh2x6HtMq0GK48_qM8Bfa8FVaI9DUOEWBJE
 2nuqOBxAcOdRC4c9WegPd8oO6jLoBR4d2NftwBiHXuulUrF24wUeZe3CK467vkiEwLNnn4XthCFQ
 302aMhLrV4laG6YOzONIGYe56gF.6qidLA0khCC1AsDjSl46uVxBt1alXAeeRcSKcNHNl7BzbZ9F
 laFS7DIQ_u7rBTrEGIyq_sWd3WaOZo.42Dwu.fJ.k_Yb2bMAQuMZk7csTBx3WYlgDKuUk.zkD1Mo
 f_6NwHVFajt89bamdFdjHgIWLZW7oVbtZHu7ImDqkAJ7dbG7r00ykvrIGES2YwNytCpzWNBb64_k
 F9qcS_SmfsnpaQSK_7_PmqU1WXytGljnIKJ_UETAgMgH8mZUy7We8bzYSnylOpeLuGyyWPMFFQoB
 z967pmAUkgx5Zjj._pj1c3YFFpRrsE8BA0mL.Lf1nCaF6FCqhxem.Kao7DiXs8wa_BuT8WPMnixK
 qSaOUcn_YmUswG80DOJSLsXhRldDRm8RrMlyqZjZbKEaUwS679i_mVYFoezz.eZkNQrrhEyximYx
 OV_N7SAhQAuU4WK4SiOc0gfzBDvhikTRlLwq9OlURGUH2eBnA7QfNSaW3wGYzX1Fa4CGVTMTbA1j
 Xfa3fSYrtkTdysiBFpYcqpG_KTf8.ms4a1bDuWIT8jZ8KB1lcn1CvrsUTXTofLLkoHiRVNE0xbhl
 ZKnZPgULFNrI4vEP.38.ceOu2R_Rgf5irP8qoVZ4h8MYqgR1FMgCX1yGXPaPaH_kRsvohSLnBd5H
 1spxO66JjIcYfcgXHHxe6TfMvPIKQx0X4SpoZJBCLwpWRUD8EnmDkuC.I2N.kLX52bZTjFT6mMiO
 xclHdeHDHu5mMG2kJREbc1dkNvoFc2ZfE41AnHgH1H1IbWmbekArrEmv3aW_i_LV1CL1Oy09z9pY
 oYOxB_fWdD6nSO6Il.kEj9AC.qhp7ls0z0BlCV7DPL8.3tIHeodip4pJupM0PlCw_R_JbK1SttfH
 PxGVSpNXsB0_G_Sc66SfMiJ8MKJ1i03UF6B3fHnxh.wAsz4ufMJ1BvPmR7cgeDZgU560q6EHDGKl
 cHbmASOXiHZYQzVl3uYmVLzz0rxYW1RKWsXiCm0QcQ5OaXFPgFP0A42QrOmvbh1mTsBU.54bbiQo
 LVIbwynrp_dDW0sXZUrUgiqjN.2FLrhdOPPQe0thnOsNdmxpcwls7009modhd.QJ1yijujPQP2UD
 60N1989FL_4Bz3KALs_kIWEZklgEraBaO3.edqFNgYiI8w4g-
X-Sonic-MF: <ltuikov@yahoo.com>
X-Sonic-ID: 019608b6-9d60-4cce-8eca-2001e58848ff
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic316.consmr.mail.bf2.yahoo.com with HTTP; Wed, 1 Nov 2023 22:16:40 +0000
Received: by hermes--production-gq1-59b5df67b6-qf48z (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 8acd568f59b0af131c7320d01b4baee7; 
 Wed, 01 Nov 2023 22:16:38 +0000 (UTC)
Message-ID: <4f258dda-70b7-4f94-a50b-d138d3dc6174@yahoo.com>
Date: Wed, 1 Nov 2023 18:16:29 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.4.1
Subject: Re: [PATCH v8 0/5] DRM scheduler changes for Xe
Content-Language: en-CA, en-US
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20231031032439.1558703-1-matthew.brost@intel.com>
From: Luben Tuikov <ltuikov@yahoo.com>
Autocrypt: addr=ltuikov@yahoo.com; keydata=
 xjMEY1iY3RYJKwYBBAHaRw8BAQdAztvSbBwaB/vdNl5pesHRoPAtz6q7FubAC/+uHrdz+pHN
 IEx1YmVuIFR1aWtvdiA8bHR1aWtvdkB5YWhvby5jb20+wpkEExYKAEEWIQSKgo9XOusXzVHh
 zclSGjP3JwwE5gUCY1iY3QIbAwUJCWYBgAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgAAK
 CRBSGjP3JwwE5gQIAQCQlrDeoaSkXdLAIPrSEzXuO0sV82BoGYQm0jpoyo/4gwD+I7wHs4Te
 oc8nwRrPY1I8ZF1+oQFiFmjMTBX3YHUP4gjOOARjWJjdEgorBgEEAZdVAQUBAQdAnGkg+lur
 +b3MG9dFgsjFpkkHiRxv8ZaPGHplcpbWPl8DAQgHwn4EGBYKACYWIQSKgo9XOusXzVHhzclS
 GjP3JwwE5gUCY1iY3QIbDAUJCWYBgAAKCRBSGjP3JwwE5vAOAQCR916F7aH5bYphUAzEbjG5
 /RyCzUvf86AyV+Qjnd6K7gD+MW5eAIC6B0W6AgorciEWygcmKAqgn2YfI09vnHB1CwY=
In-Reply-To: <20231031032439.1558703-1-matthew.brost@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------vHFvvhjAezdxycwgFpGhc1iT"
X-Mailer: WebService/1.1.21890
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
X-Mailman-Approved-At: Thu, 02 Nov 2023 08:35:03 +0000
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ltuikov89@gmail.com, ketil.johnsen@arm.com,
 Liviu.Dudau@arm.com, mcanal@igalia.com, boris.brezillon@collabora.com,
 dakr@redhat.com, donald.robson@imgtec.com, lina@asahilina.net,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------vHFvvhjAezdxycwgFpGhc1iT
Content-Type: multipart/mixed; boundary="------------JSSdPCHF0TmyacB3x5e3rtVp";
 protected-headers="v1"
From: Luben Tuikov <ltuikov@yahoo.com>
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: dakr@redhat.com, mcanal@igalia.com, frank.binns@imgtec.com,
 donald.robson@imgtec.com, sarah.walker@imgtec.com, ketil.johnsen@arm.com,
 Liviu.Dudau@arm.com, thomas.hellstrom@linux.intel.com,
 faith.ekstrand@collabora.com, boris.brezillon@collabora.com,
 airlied@gmail.com, daniel@ffwll.ch, christian.koenig@amd.com,
 robdclark@chromium.org, lina@asahilina.net, ltuikov89@gmail.com
Message-ID: <4f258dda-70b7-4f94-a50b-d138d3dc6174@yahoo.com>
Subject: Re: [PATCH v8 0/5] DRM scheduler changes for Xe
References: <20231031032439.1558703-1-matthew.brost@intel.com>
In-Reply-To: <20231031032439.1558703-1-matthew.brost@intel.com>

--------------JSSdPCHF0TmyacB3x5e3rtVp
Content-Type: multipart/mixed; boundary="------------d2hDkibz9h0XKjRHIfRTy071"

--------------d2hDkibz9h0XKjRHIfRTy071
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2023-10-30 23:24, Matthew Brost wrote:
>       As a prerequisite to merging the new Intel Xe DRM driver [1] [2],=
 we
> have been asked to merge our common DRM scheduler patches first.
>=20
> This a continuation of a RFC [3] with all comments addressed, ready for=

> a full review, and hopefully in state which can merged in the near
> future. More details of this series can found in the cover letter of th=
e
> RFC [3].
>=20
> These changes have been tested with the Xe driver. Based on drm-tip bra=
nch.
>=20
> A follow up series will be posted to address some of dakr requets for
> kernel doc changes.
>=20
> v2:
>  - Break run job, free job, and process message in own work items
>  - This might break other drivers as run job and free job now can run i=
n
>    parallel, can fix up if needed
>=20
> v3:
>  - Include missing patch 'drm/sched: Add drm_sched_submit_* helpers'
>  - Fix issue with setting timestamp to early
>  - Don't dequeue jobs for single entity after calling entity fini
>  - Flush pending jobs on entity fini
>  - Add documentation for entity teardown
>  - Add Matthew Brost to maintainers of DRM scheduler
>=20
> v4:
>  - Drop message interface
>  - Drop 'Flush pending jobs on entity fini'
>  - Drop 'Add documentation for entity teardown'
>  - Address all feedback
>=20
> v5:
>  - Address Luben's feedback
>  - Drop starting TDR after calling run_job()
>  - Drop adding Matthew Brost to maintainers of DRM scheduler
>=20
> v6:
>  - Address Luben's feedback
>  - Include base commit
>=20
> v7:
>  - Drop SINGLE_ENTITY mode rather pull in Luben's patch for dynamic run=
 queues
>  - Address Luben's feedback for free_job work item patch
>=20
> v8:
>  - Rebase on drm-tip which includes Luben's patch for dynamic run queue=
s
>  - Don't adjust comments, change variable names, function names twice i=
n series
>  - Don't move existing code to different places in a file to preserve g=
it history
>=20
> Matt
>=20
> [1] https://gitlab.freedesktop.org/drm/xe/kernel
> [2] https://patchwork.freedesktop.org/series/112188/
> [3] https://patchwork.freedesktop.org/series/116055/
>=20
> Matthew Brost (5):
>   drm/sched: Add drm_sched_wqueue_* helpers
>   drm/sched: Convert drm scheduler to use a work queue rather than
>     kthread
>   drm/sched: Split free_job into own work item
>   drm/sched: Add drm_sched_start_timeout_unlocked helper
>   drm/sched: Add a helper to queue TDR immediately
>=20
>  .../drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c   |   2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   |  15 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  14 +-
>  drivers/gpu/drm/etnaviv/etnaviv_sched.c       |   2 +-
>  drivers/gpu/drm/lima/lima_sched.c             |   2 +-
>  drivers/gpu/drm/msm/adreno/adreno_device.c    |   6 +-
>  drivers/gpu/drm/msm/msm_ringbuffer.c          |   2 +-
>  drivers/gpu/drm/nouveau/nouveau_sched.c       |   2 +-
>  drivers/gpu/drm/panfrost/panfrost_job.c       |   2 +-
>  drivers/gpu/drm/scheduler/sched_main.c        | 301 ++++++++++++------=

>  drivers/gpu/drm/v3d/v3d_sched.c               |  10 +-
>  include/drm/gpu_scheduler.h                   |  20 +-
>  12 files changed, 248 insertions(+), 130 deletions(-)
>=20
>=20
> base-commit: b560681c6bf623db41064ac486dd148d6c103e53

Hi Matthew,

I've pushed this series into drm-misc-next--I've tested and am running li=
ve with it.
Make sure to use "dim update-branches" to get all the resolutions, etc.

Thank you for working through this. Have a nice rest of your week. :-)
--=20
Regards,
Luben

--------------d2hDkibz9h0XKjRHIfRTy071
Content-Type: application/pgp-keys; name="OpenPGP_0x521A33F7270C04E6.asc"
Content-Disposition: attachment; filename="OpenPGP_0x521A33F7270C04E6.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEY1iY3RYJKwYBBAHaRw8BAQdAztvSbBwaB/vdNl5pesHRoPAtz6q7FubAC/+u
Hrdz+pHNIEx1YmVuIFR1aWtvdiA8bHR1aWtvdkB5YWhvby5jb20+wpkEExYKAEEW
IQSKgo9XOusXzVHhzclSGjP3JwwE5gUCY1iY3QIbAwUJCWYBgAULCQgHAgIiAgYV
CgkICwIEFgIDAQIeBwIXgAAKCRBSGjP3JwwE5gQIAQCQlrDeoaSkXdLAIPrSEzXu
O0sV82BoGYQm0jpoyo/4gwD+I7wHs4Teoc8nwRrPY1I8ZF1+oQFiFmjMTBX3YHUP
4gjOOARjWJjdEgorBgEEAZdVAQUBAQdAnGkg+lur+b3MG9dFgsjFpkkHiRxv8ZaP
GHplcpbWPl8DAQgHwn4EGBYKACYWIQSKgo9XOusXzVHhzclSGjP3JwwE5gUCY1iY
3QIbDAUJCWYBgAAKCRBSGjP3JwwE5vAOAQCR916F7aH5bYphUAzEbjG5/RyCzUvf
86AyV+Qjnd6K7gD+MW5eAIC6B0W6AgorciEWygcmKAqgn2YfI09vnHB1CwY=3D
=3DUstf
-----END PGP PUBLIC KEY BLOCK-----

--------------d2hDkibz9h0XKjRHIfRTy071--

--------------JSSdPCHF0TmyacB3x5e3rtVp--

--------------vHFvvhjAezdxycwgFpGhc1iT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSKgo9XOusXzVHhzclSGjP3JwwE5gUCZULOPQUDAAAAAAAKCRBSGjP3JwwE5my8
AQDNsarGM4jDZwo9Z7p0E9bIQlruZ9h3g53kveqRT5nO0AD+LiDTeS665wHIfcpsg7zcgW45+46N
SHehXgFsiDVfuww=
=QvfL
-----END PGP SIGNATURE-----

--------------vHFvvhjAezdxycwgFpGhc1iT--
