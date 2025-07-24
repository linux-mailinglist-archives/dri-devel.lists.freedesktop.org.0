Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D36B10120
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 08:53:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7343010E894;
	Thu, 24 Jul 2025 06:53:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="cRmU2U+x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B344210E895
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 06:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1753339982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=/0pKL5NP73eax0XQWW/ID5+A1+auXnZadTj2E/9ig0w=;
 b=cRmU2U+xKCa1AdsDayVgaB0zPWkW7oD9iBQegyDU9fqy0k4eOmTs9q+71AIweTWuuS13/Z
 C1tSjDx/Wlit8l972kFYI7P4OHoALZY5AW4Zf916g8pvO0gJjbB5OZ2iYvvBEPRXJkyIzk
 /IaXKGoDAXkrPPY/Mv9tDR47mFOMKPk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-571-xMaDi9BlNmyrdPjc9YcvPA-1; Thu, 24 Jul 2025 02:52:55 -0400
X-MC-Unique: xMaDi9BlNmyrdPjc9YcvPA-1
X-Mimecast-MFC-AGG-ID: xMaDi9BlNmyrdPjc9YcvPA_1753339974
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3b5f97cb8fbso268819f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 23:52:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753339974; x=1753944774;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/0pKL5NP73eax0XQWW/ID5+A1+auXnZadTj2E/9ig0w=;
 b=Gy+4+qsY5F+TwrvDnTi7YO9IWeLLEBbXrK9o3qOncJsHwQZ2f62jPvL8iv2Rnl4Ksv
 8YzhoSAg0DnQY/CVMIzC7q8AVj4f20aWQ7gsJNiZPiP12Wkm/nrDFkhSFREJt+dtyriP
 g5F5hPjtcnWBW25BrysnIs3LR2aXjbwQOguDaklutPI6TPVeNuLvYMV34ECb25jTIpyl
 9tMlnWeE1Pupjd7FZS5LWlQ66p6APTHTE/r3cRmsfmj48Pzi7Zli2v4UtnV3tAG3X6pE
 d+8DSo+hG6QY5DsxDTwnEbntnAnIRLV21+AxNR19rk/g99QCpTKHTzK0dXK2lz83LNN0
 fQBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhj5eZ2e1D7tUTA6gZWOlMnxOZUEA3fbGsMuiRUgPlbr22BEc4mkojscHppyTHOg07MkieENgCGZY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyrlfv7CeU5QA8k8B98SoHFDBUhSK2LfGWazZPP6g3NuOkE5EpQ
 oc8bm2oNp1MHGWuVdX90bfZBJGancmaoqTmxUrLnijikveXtfPPu6VfxZv2cRPgVJKRRZmRY0fd
 2S+LUWiAr7p8JvI7Web/j5d5U+BEpRGcHkho9ezvdZzB+XW6gDnFu000sJozn0I98oKBDrA==
X-Gm-Gg: ASbGncuYeQfgALU3J5+A3ilOJBft5hlc7MEVECQHTRBkYTySh+bnR22loJt1k/1QOLw
 0ifQ5XA9HCgAJDnqNwlpsUel+NZPqPv04AV+IA/fN1cYvfXKgXhQ9Ni2YUSc8G2eWuXQKXXlqCR
 q9RZk5+AKybYAtyh4T+7G5M+Ao1EvijRty7usb9lOnDZtRC9j6ME0ylmCQrJialmX9t2AqUKl6h
 RSnxjM9tKPtKt8Nlo96EFKDnVuKYHTPt+ODSvrz4xIO71Lbwq/Gm5N15Dnk1iuRPLJA4Xtj1uo0
 mBCij232Y8405es=
X-Received: by 2002:a05:6000:4383:b0:3a5:276b:1ec0 with SMTP id
 ffacd0b85a97d-3b768f052d6mr4670299f8f.45.1753339973849; 
 Wed, 23 Jul 2025 23:52:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcYzg5OUAe89hjtqRlx0qYuu+mbOBARXyBviyMZaliNHGqf9RslbHjHpMGF9JubuJmhYGZEQ==
X-Received: by 2002:a05:6000:4383:b0:3a5:276b:1ec0 with SMTP id
 ffacd0b85a97d-3b768f052d6mr4670276f8f.45.1753339973357; 
 Wed, 23 Jul 2025 23:52:53 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b76fc6eaf3sm1158249f8f.27.2025.07.23.23.52.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 23:52:52 -0700 (PDT)
Date: Thu, 24 Jul 2025 08:52:52 +0200
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
Subject: [PULL] drm-misc-next-fixes
Message-ID: <20250724-petite-gray-foxhound-b4fbb8@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="2r6awe2hfysrj2zu"
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


--2r6awe2hfysrj2zu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: [PULL] drm-misc-next-fixes
MIME-Version: 1.0

Hi,

Here's this week drm-misc-next-fixes PR.

Maxime

drm-misc-next-fixes-2025-07-24:
Two more bridge conversions to devm_drm_bridge_alloc that address a
warning now reported by the bridge core code.
The following changes since commit fe69a391808404977b1f002a6e7447de3de7a88e:

  drm/panthor: Fix UAF in panthor_gem_create_with_handle() debugfs code (2025-07-10 10:16:50 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-fixes-2025-07-24

for you to fetch changes up to b213eb34f857c45bdd769c9e9191a386accc9e8f:

  drm/tidss: oldi: convert to devm_drm_bridge_alloc() API (2025-07-18 14:55:57 +0300)

----------------------------------------------------------------
Two more bridge conversions to devm_drm_bridge_alloc that address a
warning now reported by the bridge core code.

----------------------------------------------------------------
Jayesh Choudhary (1):
      drm/tidss: oldi: convert to devm_drm_bridge_alloc() API

Michael Walle (1):
      drm/tidss: encoder: convert to devm_drm_bridge_alloc()

 drivers/gpu/drm/tidss/tidss_encoder.c | 10 +++++++---
 drivers/gpu/drm/tidss/tidss_oldi.c    |  8 ++++----
 2 files changed, 11 insertions(+), 7 deletions(-)

--2r6awe2hfysrj2zu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaIHYQwAKCRAnX84Zoj2+
dhvfAX4v4BIKZTk3mlaSfj2442uwg5JNUf+zyRRmGuF/yDCVGN1ZzRpMOOko3glS
cVDmvaMBgOxtrUG2gt6m0eXzRFOUEiugrs2CmmXznEvLlOZ9Nz/A9pc2G7sncM02
Cwfqg1aF5Q==
=f1YM
-----END PGP SIGNATURE-----

--2r6awe2hfysrj2zu--

