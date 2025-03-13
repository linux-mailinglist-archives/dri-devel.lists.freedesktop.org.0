Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7C4A5ED1D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 08:36:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B0710E802;
	Thu, 13 Mar 2025 07:36:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GDn0zR2b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE7210E800
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 07:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741851394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=uycxbi4TCRK/IaVbkaHC23MSCbbrir2qS6Cwo9hdLFk=;
 b=GDn0zR2bkztqWSAUP1rj7l3rndiDGCXVEn572aiky5DpPz0t1jecta6XA0GeNh3QG7T5N/
 EoG4iUPG96SbA8uv2h/khe3FKyHjvWeGN0a9KKG28FU/oKlfu2ecqqIN6hgNACTSwaQF8Z
 LEK8VJYWhIGyfS+0NnoeQjXe58gAmKQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-4ZHmLGR4PH2ig49cJYwf_w-1; Thu, 13 Mar 2025 03:36:32 -0400
X-MC-Unique: 4ZHmLGR4PH2ig49cJYwf_w-1
X-Mimecast-MFC-AGG-ID: 4ZHmLGR4PH2ig49cJYwf_w_1741851391
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3914bc0cc4aso340919f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 00:36:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741851391; x=1742456191;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uycxbi4TCRK/IaVbkaHC23MSCbbrir2qS6Cwo9hdLFk=;
 b=Lb+6mphdYG/qmNFdtcrCNZrbfmJKSoJnozq1vcxJqh4cenj9d+bfIU2ZxPGlxxV16k
 hOW+q4dYNRYX2WBMZjW5j2mCPJvcN2mUR+CjWp5RkV21kaF7gylGQP07Ixb/kOygZZqS
 viCNcSYZEAuzVCaAtV+bnzXd2PBeSyCm6UKFZv8vXI53UC7vS9Wb/rMlMaA5NUQxv516
 e+MbY7aG3kk3tpbfbh3lc+lJ91ZPqwU6yraRE3fqPA2W0m5REda4ObyLmO6jFv1ZwoV+
 JQptD04jxg+NiTjoCjfGbwLAHThtoW2RZ3ejk1skpgw0RCleagEUAPpZMe773L56X0uw
 hCbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuYVnqYZFZrUxoEVWIrIakuNoAHedIzNk2A2F6ORBZXpQIg9PhK2tQjd4EGSFhEZSFIqee3tiIFKs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzc3NWpYabXjmxPt7ahw/NkDUe5dXAatfhKY2nWYs7nutq7WBX6
 4mSBfRewd+Dgbd+p+sqI9FBbr+mZ3VSfSwf4nDduIpAfnAORtZg/Tgm506Kq/BM6Ad7LT+C8EPG
 AFx4c7UDPxjjk5EfdaE0trKZSgwvv97Dqbgk+XlfYU6Q/mINBnGFoJAB2Ze0Q4Ak3kw==
X-Gm-Gg: ASbGnctLA+Kg1riNjUw3tySdBQdfaUlX5wSR9WKcf1tgcSMlFKBC7jULvCkvMAXthgr
 pQmr57Qy8jW3GhtULy0zfTBPKSPXe/K7IP67UpKRcCrHjU3/pPjJraTS1IGuVREjK6+QXwFegPS
 0WWisPaclonPOr+nITFy6r+mgs3MejW7YKcv8TZVbdaUepBpZuaA31hmcb8jzjWtIzWl/Pyz9GR
 u7+Y/ZJg/TfNtTTnNhmSp4ZhblhHlx3Ohk8TAwKFG41noIEzwF2PkXrOvKH/ZBuFAE=
X-Received: by 2002:a5d:6c66:0:b0:391:4835:d8a8 with SMTP id
 ffacd0b85a97d-3914835d9e2mr11564618f8f.1.1741851390954; 
 Thu, 13 Mar 2025 00:36:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQBTHN7HToqEsIEVgOs3DY0TO0fyncqzeN+fnZxWcJCLq9jxb30i16kQMXPX6J8VqOTgFD3g==
X-Received: by 2002:a5d:6c66:0:b0:391:4835:d8a8 with SMTP id
 ffacd0b85a97d-3914835d9e2mr11564594f8f.1.1741851390504; 
 Thu, 13 Mar 2025 00:36:30 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a75b290sm44363505e9.23.2025.03.13.00.36.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 00:36:29 -0700 (PDT)
Date: Thu, 13 Mar 2025 08:36:29 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Dave Airlie <airlied@gmail.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-misc-fixes
Message-ID: <20250313-holistic-clay-moose-fead28@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="yd3tboou6p7k4fgc"
Content-Disposition: inline
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--yd3tboou6p7k4fgc
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [PULL] drm-misc-fixes
MIME-Version: 1.0

Hi,

Here's this week drm-misc-fixes PR

Maxime

drm-misc-fixes-2025-03-13:
A null pointer check for gma500, two clippy fixes for panic, a fix for
an interaction between DPMS and atomic leading to dropped frames, and
a locking fix  for dp_mst
The following changes since commit 80da96d735094ea22985ced98bc57fe3a4422921:

  drm/bochs: Fix DPMS regression (2025-03-06 08:54:42 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-20=
25-03-13

for you to fetch changes up to 12d8f318347b1d4feac48e8ac351d3786af39599:

  drm/dp_mst: Fix locking when skipping CSN before topology probing (2025-0=
3-11 11:29:18 +0200)

----------------------------------------------------------------
A null pointer check for gma500, two clippy fixes for panic, a fix for
an interaction between DPMS and atomic leading to dropped frames, and
a locking fix  for dp_mst

----------------------------------------------------------------
Imre Deak (1):
      drm/dp_mst: Fix locking when skipping CSN before topology probing

Ivan Abramov (1):
      drm/gma500: Add NULL check for pci_gfx_root in mid_get_vbt_data()

Miguel Ojeda (2):
      drm/panic: use `div_ceil` to clean Clippy warning
      drm/panic: fix overindented list items in documentation

Ville Syrj=E4l=E4 (1):
      drm/atomic: Filter out redundant DPMS calls

 drivers/gpu/drm/display/drm_dp_mst_topology.c | 40 ++++++++++++++++-------=
----
 drivers/gpu/drm/drm_atomic_uapi.c             |  4 +++
 drivers/gpu/drm/drm_connector.c               |  4 +++
 drivers/gpu/drm/drm_panic_qr.rs               | 16 +++++------
 drivers/gpu/drm/gma500/mid_bios.c             |  5 ++++
 5 files changed, 45 insertions(+), 24 deletions(-)

--yd3tboou6p7k4fgc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ9KK/AAKCRDj7w1vZxhR
xc5sAP4zPHPxFCE/OasImZapRLUTIlhRPIVFkkyapO0g0idSCAD/eEihejwWeuN6
6Dv6A3dF9xf7nQGBAxdJRxcO6hD0kgw=
=dLWt
-----END PGP SIGNATURE-----

--yd3tboou6p7k4fgc--

