Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E47072FFE35
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 09:33:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ECE66E2EF;
	Fri, 22 Jan 2021 08:33:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34FCC6E2EF;
 Fri, 22 Jan 2021 08:33:02 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id i17so5619997ljn.1;
 Fri, 22 Jan 2021 00:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=UAOgDLhkwDAPgBAhgPJ03q8lgpe5rgt+2Rr0dvOQx0M=;
 b=gaT446LHooL37TgBEL84NKNo1iCIcAjWD7l4VlLh+R23TGHCTn35WEk3i0Acygm/TQ
 mE5RP1K4LSsY7gSDlUW/Nfr7yW3gIO+PaAF/ZBksLMsJ9n0keqZyNpZNkugDf+gWZjWj
 0Z5WvwRRHb+xG0yixYMFdKN2hHBdena/yf3vzoghLD9zWhNOAl/1aUG/2o4goUgQRytf
 0vObZwuLy6T47rZLeAiP/UlwWdF+f55eJPDNoD32ORl4mAkSg8ncWJM+ZflV2PdN0cDb
 cpEMsEIKumvX0tszVz7G6M5VJr+XqWWp7qKKNyl4KXUkYBPoFxN8J9YdGAJrC2kJALv5
 UpnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=UAOgDLhkwDAPgBAhgPJ03q8lgpe5rgt+2Rr0dvOQx0M=;
 b=hnIxV+ACUFuhm5+8a5KbVG7kQ2RQdJSxEeRsdtqXCO252ca+BZoSheyuF84lnrqaQO
 CJYuU+TH65CZvW4Vn+ZvuJLiDXsDbtRwEqFpYg1flSRaPoHEBpwA9aO2dRIk780zosAB
 aRcB6rCAVlbC1VwWW+5Esyu5ZgRXi4171sNfDlDlVYU6veCaVKLc5K8OXPWlfBEbTy5Z
 5r06zy4RSSvIScEu8cAsHY70G5BintKrglMp1F5/Zl22flvPpVQkhbkfOqfux6cYvNsb
 Zy2o2JCp2zTMG0jvpaq+NqxlACR5oo5EpwI9+DBcsS7zNm/Lfg0fRleZvymKVcdRZ/v3
 UcXw==
X-Gm-Message-State: AOAM531Ql8iDtHS4BasZIrRUx8PZPr1sz9RBut+xAObYdR7iR+8/FAwM
 7WoWKdSru9qYJa3GVPSHODk=
X-Google-Smtp-Source: ABdhPJyQSu5OIxfJsC0PPcNIwbNDCpAQbQ+31lPNMtsK4zHsjJtLPTR16Xwj2299wV3xRyQD1ASPAQ==
X-Received: by 2002:a2e:6a1a:: with SMTP id f26mr1807723ljc.416.1611304378865; 
 Fri, 22 Jan 2021 00:32:58 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id m26sm859302ljj.134.2021.01.22.00.32.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 00:32:58 -0800 (PST)
Date: Fri, 22 Jan 2021 10:32:48 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Aurabindo Pillai <aurabindo.pillai@amd.com>
Subject: Re: [PATCH 0/3] Experimental freesync video mode optimization
Message-ID: <20210122103248.779e70bf@eldfell>
In-Reply-To: <20210119155029.18943-1-aurabindo.pillai@amd.com>
References: <20210119155029.18943-1-aurabindo.pillai@amd.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: stylon.wang@amd.com, thong.thai@amd.com, shashank.sharma@amd.com,
 dri-devel@lists.freedesktop.org, nicholas.kazlauskas@amd.com,
 amd-gfx@lists.freedesktop.org, wayne.lin@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com
Content-Type: multipart/mixed; boundary="===============1339281850=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1339281850==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/2OQpgE_ch2PVYDSFuTJOi36"; protocol="application/pgp-signature"

--Sig_/2OQpgE_ch2PVYDSFuTJOi36
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 19 Jan 2021 10:50:26 -0500
Aurabindo Pillai <aurabindo.pillai@amd.com> wrote:

> Changes in V5
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> * More info in commit messages on the rationale of changes being added
> to the kernel.
> * Minor fixes

Hi,

thank you for adding the explanations in the commit messages I asked
for. It is now up to DRM maintainers to determine if this is
conceptually fine.

I do see that apparently setting the opt-in option does not yet taint
the kernel although Daniel Vetter suggested it might be a good idea. I
guess tainting the kernel would make it easier to remove this feature
in the future because it would be easier to dismiss people that claim a
kernel regression due to the removal.


Thanks,
pq


> --
>=20
> This patchset enables freesync video mode usecase where the userspace
> can request a freesync compatible video mode such that switching to this
> mode does not trigger blanking.
>=20
> This feature is guarded by a module parameter which is disabled by
> default. Enabling this paramters adds additional modes to the driver
> modelist, and also enables the optimization to skip modeset when using
> one of these modes.
>=20
> --
>=20
> Aurabindo Pillai (3):
>   drm/amd/display: Add module parameter for freesync video mode
>   drm/amd/display: Add freesync video modes based on preferred modes
>   drm/amd/display: Skip modeset for front porch change
>=20
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  12 +
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 401 ++++++++++++++++--
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   3 +
>  4 files changed, 382 insertions(+), 35 deletions(-)
>=20


--Sig_/2OQpgE_ch2PVYDSFuTJOi36
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmAKjbAACgkQI1/ltBGq
qqcsoA/+PIp4+UXyB6r/x3rWCOPvF5s4zJbzAOvksgWmwh478fk+K/T+mwXhIkvl
aOkc56acYrkMgZ+5V+lk5NRF+ty7euGML2hMk+UEhp3scoXpiIPQ3yG051Po8SLJ
D3uh51arzMaV0CKCyi/0hb83N4aITHtgmK7hyQheVClsbRJjDR7eL/e0G+XVl9On
jlS7he3O6QZoW0PnzgDNrv+wppffDeaFuu5P/SD4SKlrGEdpRbWecxagrNw11cSg
H/x4SwAqb6NuAGoM/a/O3qrgj/szyol7Ibs0CgE3cDyksSGG1BTvUt75g1HVR7qF
KnAHbXDYND3NUK5/l5Q2CyKmAEqTzkiUWI6YBy9GQGnMGhittFL26HMQirzUG0aF
UCyLUVG+2ZXso59hTWwDrMsXp0J+8WZOw2PCoiHMeRLPtLzozRzi8k+wDvRX+GLX
E1ViF6TjkU6nBXs7as/EG9sd5qZdcWKDdBPZ9dpre18q9G8blEoVCa+4BgsP4k8L
rkeEL6PWG/VqPFRK1opYeBs+W5zUjWu2wo9ERcAlwS4xY96qpZzPRnEZi1LWlRuP
v/QTOHw27u9Ii+SURz79vaMQJdiHdXm0hFFiaxDkT/hVJ6tX0BnFJOH2wnm/1+aG
MGCXDFzU6UL+mp+KjzO/hEFgkFRDiW8ST0HedNcDEn4C/HNyxCQ=
=F4YM
-----END PGP SIGNATURE-----

--Sig_/2OQpgE_ch2PVYDSFuTJOi36--

--===============1339281850==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1339281850==--
