Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E1F61CCF
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 12:16:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B69CD89C9D;
	Mon,  8 Jul 2019 10:16:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC15C89C88;
 Mon,  8 Jul 2019 10:16:29 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id d24so6197410ljg.8;
 Mon, 08 Jul 2019 03:16:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=uDdCRIu8mj2H4N3wQq8KmvIfSpvfs36hY5G/1j1b4+w=;
 b=Uf3lGUIRw6hS5spwG0cjJyUfQnxrNB6KUuIqpRe5wVNsExBbszIMMUcDSXxMxIZrO3
 ktc49KBcC1Py33xHefZrcF2al8DOXpuAjb+d35n5DdlmEwHyUrSgzIw1YcU2wM6d0Vkh
 59T+Jc65vFgLg1MWnZN7d1rszSTAIIrhr7myPySJpkWVKHwlEaD8cjb6d7p+NCrh8JzE
 U02j4Np1KhjuOEhU277bpB3GUe0E0XRSvKvCWZQLanMQSb/BFe7vwvCmP+L0/q6lmwmP
 krgfp3dRWPKmAAxpQ9HBBTDGULU/CyMIjljZWrJXq4HaFS+lZ1m5UKzCPdsLyrsv541p
 gQ/g==
X-Gm-Message-State: APjAAAV4/sBDxmbetoiGAT6vj47sNAGE8Es+7u9J/92WGigLlgZVzmk7
 c6FLo9KEUZk12kKkCB95/pOc9Thu
X-Google-Smtp-Source: APXvYqxAsye8JHdKWRVrvwgB4YZW6btMQdm+5Gs5DDyOJLaTC7fZGvoznO3TzDxk8LovblKKeLP5yg==
X-Received: by 2002:a2e:900c:: with SMTP id h12mr9475924ljg.197.1562580988234; 
 Mon, 08 Jul 2019 03:16:28 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id p27sm2697349lfo.16.2019.07.08.03.16.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 08 Jul 2019 03:16:27 -0700 (PDT)
Date: Mon, 8 Jul 2019 13:16:23 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ramalingam C <ramalingam.c@intel.com>
Subject: Re: [PATCH v8 6/6] drm/hdcp: reference for srm file format
Message-ID: <20190708131623.72f3ac45@eldfell.localdomain>
In-Reply-To: <20190705004642.15822-7-ramalingam.c@intel.com>
References: <20190705004642.15822-1-ramalingam.c@intel.com>
 <20190705004642.15822-7-ramalingam.c@intel.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=uDdCRIu8mj2H4N3wQq8KmvIfSpvfs36hY5G/1j1b4+w=;
 b=mUUyq3vB7NQbY0D7voBKrEfegLQ+ZIqnv2MqvHGU9TN3XPziCrYoXvh5SWaBWacrep
 hG8x5g9yVIAtp7ZSWWqpocNV96ixVYAVf/YHFLvZttSvswp9OEYeZwzZ3huyXzNdpSNQ
 HhkO8LdyjOCW8J2YrPO4SPtRFfvLOOxPt74jEorY45bZEx2Ycg+Z0/j4NEUODiEmAyDN
 FeGoWgj1nk9ReqqtiMbwVLBNM5aHrDpaPIgCAWifjmikA20rnTUgyAQtFGiHJMQ+uBRd
 AL3dR79DolBz/Cv23HkP3yN0sdL1JubVD3aC/LpG1LkffCuzl7+hWXKEeqJLQsqz6ZXM
 in9w==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1680238673=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1680238673==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/aj38jDrOI2yxcgdDCIbZViB"; protocol="application/pgp-signature"

--Sig_/aj38jDrOI2yxcgdDCIbZViB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri,  5 Jul 2019 06:16:42 +0530
Ramalingam C <ramalingam.c@intel.com> wrote:

> In the kernel documentation, HDCP specifications links are shared as a
> reference for SRM table format.
>=20
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> ---
>  drivers/gpu/drm/drm_hdcp.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_hdcp.c b/drivers/gpu/drm/drm_hdcp.c
> index 77433ee3d652..803bf8283b83 100644
> --- a/drivers/gpu/drm/drm_hdcp.c
> +++ b/drivers/gpu/drm/drm_hdcp.c
> @@ -271,6 +271,13 @@ static void drm_hdcp_request_srm(struct drm_device *=
drm_dev)
>   *
>   * SRM should be presented in the name of "display_hdcp_srm.bin".
>   *
> + * Format of the SRM table that userspace needs to write into the binary=
 file
> + * is defined at
> + * 1. Renewability chapter on 55th page of HDCP 1.4 specification
> + * https://www.digital-cp.com/sites/default/files/specifications/HDCP%20=
Specification%20Rev1_4_Secure.pdf
> + * 2. Renewability chapter on 63rd page of HDCP 2.2 specification
> + * https://www.digital-cp.com/sites/default/files/specifications/HDCP%20=
on%20HDMI%20Specification%20Rev2_2_Final1.pdf
> + *
>   * Returns:
>   * TRUE on any of the KSV is revoked, else FALSE.
>   */

Hi,

this look good, publicly accessible spec links even. I'm happy with
this, but I repeat that the Weston work[1] does not directly prove this
UAPI (perhaps not necessary either?).


[1] https://gitlab.freedesktop.org/wayland/weston/merge_requests/48

Thanks,
pq

--Sig_/aj38jDrOI2yxcgdDCIbZViB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl0jF/gACgkQI1/ltBGq
qqesiRAAl0gd0yA1xiCAtyGonbXTh7ZUKmMOhxi0pKSdVJPvIkwitHzRuORyL7fO
s3JiZ5WhWVe2J5wQBAgni9cKR9CmdM3KVrYEewdfy/nf29gciBxKGcw+li447i8d
yeFrOpsOnPmnvQAZ3G3BGpY9IkH3srWHjijLXIwPhOmZunYUOURUFDX20kySUbTE
3viJwcOlStVV6kPjEsvAxCzaAVco80+hoquqygUPrvSTZwAfdrLlVXlpBYpn3H3p
4cvqbs71PPlPMMgm11MyuAsSeiZVoTbOQRbkIwfp8b8UC71HfvRro77xCvN0QZj/
Dt2LTZPabquw8t5ByUCOCIbn4WR/NPthpt2LLiQuEEkhfiWRyx1ApxkBTzrjyv4/
4aal6RtmJ0sOx64Cvja6kNdgPa0t5FM6li+z713bPRcsHlfGGMwB0sXA5xWD8vG0
eaFeEBbyS7jtU2Zaj2HKyOTT0luyqi85fcnS3dzRWNv2lMjMglCu8zT1Zbtgv3ne
3J7lBFdBwCpK6zuUrhR/rfDYk7bJBBL37k2hsH7UAlsCOTrapRorueGWe6KKi83G
geQ8YoKVMJLksppZgjaRYeXSE4YnC01ZQzCVNZPPxiZcVghbkgHQgMRO1zzTmUCp
S8/gK9I0U4MlJPR/mOQ3CA7fwv2sXlfepJVYYC5p3Vlp6Dr5nlE=
=rXTH
-----END PGP SIGNATURE-----

--Sig_/aj38jDrOI2yxcgdDCIbZViB--

--===============1680238673==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1680238673==--
