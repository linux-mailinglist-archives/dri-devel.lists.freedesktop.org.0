Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A61571396
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 09:55:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0036090797;
	Tue, 12 Jul 2022 07:55:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D721B90778
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 07:55:07 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id n18so10879209lfq.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 00:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=g5RdPghP7w/sf5l+AoeYyVpf9ggHBE9Jgathbp35RcI=;
 b=czN53Wx3R34MvcFjKBCcw/xqTCXcx4uHe8FRdfDp3XUrThmjtO+Swtx0pO25Hustsv
 wBoDffwnF9kR/979ybJznTtJkhfgeTi6lQShMY5iFoCzenndJbered3wsWtPQAcfFj2V
 M7/5Wkzgr9wvZkTkV/rFq9BTv7ZrcP8QY0yCtUL+l7UjstKYtVxMsetpBZmhVSMxyvtE
 1kgIyHpnz+NKXXgKMgGNFMvYFMtoyBJw7Ol7aGbzDtwab0eYnJiDwg5VaBvEc+fdevKy
 D/jaORhiEk5gjJtrZoxKdBmuslyLU7LJZHwPw3hayMwh++177ZLr8YG29HufnddAdwqb
 alIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=g5RdPghP7w/sf5l+AoeYyVpf9ggHBE9Jgathbp35RcI=;
 b=DmEAK5PsElEQD5Dy9cEUg2ptysbLa6Tn14U32jNmwuDmFc+rlEC8DJ40U8YJqD7ixP
 veopq/L7UvCek4GNl59kic1wcY/38sl3oUtxevmQwDlzz5/5Slfz1YAr+PtKuUlKDP0y
 h0sIj5WxIFlhdDx4gdqsDT58ox2XJ9tkMGr6sL/eXglKeeBDuUBmAbkRKxN1J1AAPgK3
 ttm1ubSdfFPlVLS/2qgcCnr32Z1hcBKz6adHEBqYL/wqbsHLvFYg0IBBCS7T0kX1FlKo
 EXNuie5OYAok24f7zMpwsOqf+gMNTkhlDZ5oXdipajBB2jeANjbTrkz4Ho2lmvZtDIkz
 2coA==
X-Gm-Message-State: AJIora9Rvl4R4Pjv2cBtFkOrvAbQK63oBQeDKWXDsBtIIwaevuXU1Qjk
 aBN8HRtYqWt/l53GEVBiTgY=
X-Google-Smtp-Source: AGRyM1uqyONW998IhUeWc1mewAzvA3iaS3knGkZwZ5U0giRCc4G4dy/mMWdc9lq0dLtI5M+oO8J8Eg==
X-Received: by 2002:a05:6512:b0d:b0:481:5cb4:cf1e with SMTP id
 w13-20020a0565120b0d00b004815cb4cf1emr13724767lfu.442.1657612506024; 
 Tue, 12 Jul 2022 00:55:06 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 n19-20020a2e8793000000b0025d47eb2bffsm2271656lji.110.2022.07.12.00.55.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 00:55:05 -0700 (PDT)
Date: Tue, 12 Jul 2022 10:54:54 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Zack Rusin <zack@kde.org>
Subject: Re: [PATCH v2 0/8] Fix cursor planes with virtualized drivers
Message-ID: <20220712105454.519e2d7b@eldfell>
In-Reply-To: <20220712033246.1148476-1-zack@kde.org>
References: <20220712033246.1148476-1-zack@kde.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Cn8TNDuSjcROZ4RECNFoT25";
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
Cc: krastevm@vmware.com, mombasawalam@vmware.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Cn8TNDuSjcROZ4RECNFoT25
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 11 Jul 2022 23:32:38 -0400
Zack Rusin <zack@kde.org> wrote:

> From: Zack Rusin <zackr@vmware.com>
>=20
> Virtualized drivers have had a lot of issues with cursor support on top
> of atomic modesetting. This set both fixes the long standing problems
> with atomic kms and virtualized drivers and adds code to let userspace
> use atomic kms on virtualized drivers while preserving functioning
> seamless cursors between the host and guest.
>=20
> The first change in the set is one that should be backported as far as
> possible, likely 5.4 stable, because earlier stable kernels do not have
> virtualbox driver. The change makes virtualized drivers stop exposing
> a cursor plane for atomic clients, this fixes mouse cursor on all well
> formed compositors which will automatically fallback to software cursor.
>=20
> The rest of the changes until the last one ports the legacy hotspot code
> to atomic plane properties.
>=20
> Finally the last change introduces userspace API to let userspace
> clients advertise the fact that they are aware of additional restrictions
> placed upon the cursor plane by virtualized drivers and lets them use
> atomic kms with virtualized drivers (the clients are expected to set
> hotspots correctly when advertising support for virtual cursor plane).

Hi Zack,

thank you very much for this revision, I am generally very happy how
this looks.

I read through all the patches, and all the commit messages and code
comments say good things. I'm not really knowledgeable enough to review
the code itself.

Otherwise I would already give my Ack for everything here, but I did
have some questions inspired by patches 5 and 8. See my replies to them.


Thanks,
pq


> Zack Rusin (8):
>   drm: Disable the cursor plane on atomic contexts with virtualized
>     drivers
>   drm/atomic: Add support for mouse hotspots
>   drm/vmwgfx: Use the hotspot properties from cursor planes
>   drm/qxl: Use the hotspot properties from cursor planes
>   drm/vboxvideo: Use the hotspot properties from cursor planes
>   drm/virtio: Use the hotspot properties from cursor planes
>   drm: Remove legacy cursor hotspot code
>   drm: Introduce DRM_CLIENT_CAP_SUPPORTS_VIRTUAL_CURSOR_PLANE
>=20
>  drivers/gpu/drm/drm_atomic_state_helper.c | 14 ++++++
>  drivers/gpu/drm/drm_atomic_uapi.c         | 20 ++++++++
>  drivers/gpu/drm/drm_ioctl.c               |  9 ++++
>  drivers/gpu/drm/drm_plane.c               | 59 ++++++++++++++++++++++-
>  drivers/gpu/drm/qxl/qxl_display.c         | 14 +++---
>  drivers/gpu/drm/qxl/qxl_drv.c             |  2 +-
>  drivers/gpu/drm/vboxvideo/vbox_drv.c      |  2 +-
>  drivers/gpu/drm/vboxvideo/vbox_mode.c     |  4 +-
>  drivers/gpu/drm/virtio/virtgpu_drv.c      |  3 +-
>  drivers/gpu/drm/virtio/virtgpu_plane.c    |  8 +--
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c       |  2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c       |  9 +---
>  include/drm/drm_drv.h                     | 10 ++++
>  include/drm/drm_file.h                    | 12 +++++
>  include/drm/drm_framebuffer.h             | 12 -----
>  include/drm/drm_plane.h                   | 15 ++++++
>  include/uapi/drm/drm.h                    | 17 +++++++
>  17 files changed, 173 insertions(+), 39 deletions(-)
>=20


--Sig_/Cn8TNDuSjcROZ4RECNFoT25
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmLNKM4ACgkQI1/ltBGq
qqc7QA/+Nl5hfSBPENSz5qYqSZ8nUXhj3UqF712RAS9mjcuZBxhWXUavJfilnw+n
wugMD+4ff3oeJT+2sb586/wpXIFMdZbL3bl+c46CaMjHHyTMnu6Snwy4OUUgY2/d
NvB2XTuJMvcmzBeRAxuPeNDmDAKzfLPDlKMoqZX+F/RNYVrERsQ3Cp2aH/SpvZfe
wyUFGGnpzoLncoSMAow49W3iBKzXgP6K49/hiGEDWY37aKpazc7+r2MiGChOEyjO
mxyHszkes31VIKlsWzV/1rdd4E+tkNp460cSnOF9R6ZcZomCcEjE77s+Jzb5Xwwf
IPl+6I/tP+evWXSb5UgJzcMHZi0UdcmuZV9bW9TKq5ItWMYzhblI3hBHvlxhaOEG
NanolXSStAKahv8MHggZ7CLitHj4iiYrauH+QL4dOyFRrhBTPe2AKolOI+tty36Y
sc4jJnm/x6lXo3g4XbhMYtvfArdNQu72C3+2i9KoedhF2hOy8hNrViNfL1qUTABx
Lm3HB10ID4a/j36Z6JrpfD5ZU6iu+QDj1xV3yT3ITBsGyKx1XPuaf99vBHx1Bkon
Bl0npLhpU6YnKaYaA7cLW0hfVkBTvtFl7WYZRGNFfNk69pypvHZKbf7y9KlOGU2e
ip7H7kss2baG+ygCN9N0IbiSsEe+gbztrwCIUvGQpVhYUm3eQXQ=
=wTYs
-----END PGP SIGNATURE-----

--Sig_/Cn8TNDuSjcROZ4RECNFoT25--
