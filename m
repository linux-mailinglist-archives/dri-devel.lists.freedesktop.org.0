Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1BDA6A18E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 09:38:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC5C410E5A6;
	Thu, 20 Mar 2025 08:38:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ItUG6bBP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E118F10E5A5
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 08:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742459912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=eVSYC2akOgiwP6yKLJOSHan3aNOI03QHvfAehHGVWcE=;
 b=ItUG6bBPn8/WcTIZjgeLY46VM0bQqpmhMHAoK33vfKr98vhP5BjgA62bmpJk8J5Mad9Ypm
 CUcq3lkOxRi5Fy0HjkcB2I9xewunZ3EFgfGRWRY7OgHk5wurtfI7JeCYeK8+rWoNmMNmjn
 I0tPaVfGoydX17cL1+bE8XFkkt7LEYA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-310-93ruNsQGPzmt6gcXVX8Cgg-1; Thu, 20 Mar 2025 04:38:30 -0400
X-MC-Unique: 93ruNsQGPzmt6gcXVX8Cgg-1
X-Mimecast-MFC-AGG-ID: 93ruNsQGPzmt6gcXVX8Cgg_1742459909
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4394c489babso1898535e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 01:38:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742459909; x=1743064709;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eVSYC2akOgiwP6yKLJOSHan3aNOI03QHvfAehHGVWcE=;
 b=tpbCW4L+7yautY8NB0fha6XsLEA/ECpFMoYOOQEzFFsNCP8bgZrF8YTP1DgDM9LG0h
 akSGXZAJaYayimKAsKunjTpVFft2H6/Hb3iR61QIBb1siD2FoygXbICtXcgDZAONXrqS
 iWyEYwtkrW7+08vBr9hpgO5FEdLOFBoHfHQo9wM0SOM9WZ+547LT/CASYzPm3DVImP2Q
 iuSWqt2ri6dG36dDB53tTBvT2OuvnWA2xj2dwxOA3wgKwW1aelHeeY//vC0kEmmmGkjY
 X6ydBtpwduruEhJ27XiZG6eOjq0sWt2jH8VVahaftVCO9SaVam866HVEBl8HB5xCpSFs
 evGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzxo5hOQzjFg6tdJXqqFu33qUqJoBPqeZGI2nKqmbG4rAafIoxmNVQkJZuYHywMDUZsePMx3u/Wmk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHdUO3e26Yz1M6MJ9dQbwuRpD3yXsm62SkutuKaD84MXBa4e1r
 74zM/uI7Py1QErAkb3ms+fNSDpSryv7AgktwDlRT5u5wva9oUof2hytGHx43pYsw3KRP51MhI0N
 7B1EqqDCIqS0qhyFoULJjgsbopktHNQWFT2BSKVe3ml9t3KZEn4fK1yaMBnTwucN30w==
X-Gm-Gg: ASbGnctdgIyW4H03h2TgPhpK3QUVAg5A2Po6tYnalj/w4wCzBvar6M2LuYQr/0AyOyc
 C5sBt2C32Kq+a/sxUF5TTSs9Lur1JeFZVgtvOkh/SVZgQ+zg60cm1FhW+3Y9Y/MysrXh8sfXZWG
 /75rRSQXhSOTpDpuanNcRLMCH3UqKq745/ACnpEY3V1krw3C2Bov3oHlPFE87+4jPZyWQIxupel
 TK7LpHtJMwmW064/5cBNdjL9J8wSfdcaPO3Yfh90ziebFDk8OWIWa29C7zaXdYAY0Q=
X-Received: by 2002:a05:600c:3d88:b0:43d:db5:7b1a with SMTP id
 5b1f17b1804b1-43d4379b544mr46799275e9.12.1742459908613; 
 Thu, 20 Mar 2025 01:38:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2ABTv2JwL/AM+EzDkblJ4THEXWcPirEf3A6Ijee80hlkhSxHLu9VwR1gZbn6IcOhuJRlh2A==
X-Received: by 2002:a05:600c:3d88:b0:43d:db5:7b1a with SMTP id
 5b1f17b1804b1-43d4379b544mr46798935e9.12.1742459908115; 
 Thu, 20 Mar 2025 01:38:28 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d46edba08sm32428835e9.18.2025.03.20.01.38.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 01:38:27 -0700 (PDT)
Date: Thu, 20 Mar 2025 09:38:27 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Simona Vetter <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-misc-fixes
Message-ID: <20250320-valiant-outstanding-nightingale-e9acae@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="47mp7vgniqed6naw"
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


--47mp7vgniqed6naw
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [PULL] drm-misc-fixes
MIME-Version: 1.0

Hi,

Here's this week drm-misc-fixes PR.

Maxime

The following changes since commit 12d8f318347b1d4feac48e8ac351d3786af39599:

  drm/dp_mst: Fix locking when skipping CSN before topology probing (2025-0=
3-11 11:29:18 +0200)

are available in the Git repository at:

  ssh://git@gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-=
2025-03-20

for you to fetch changes up to cb83f4b965a66d85e9a03621ef3b22c044f4a033:

  gpu: host1x: Do not assume that a NULL domain means no DMA IOMMU (2025-03=
-19 19:05:40 +0100)

----------------------------------------------------------------
A sched fence reference leak fix, two fence fixes for v3d, two overflow
fixes for quaic, and a iommu handling fix for host1x.

----------------------------------------------------------------
Dan Carpenter (1):
      accel/qaic: Fix integer overflow in qaic_validate_req()

Jason Gunthorpe (1):
      gpu: host1x: Do not assume that a NULL domain means no DMA IOMMU

Jeffrey Hugo (1):
      accel/qaic: Fix possible data corruption in BOs > 2G

Ma=EDra Canal (2):
      drm/v3d: Don't run jobs that have errors flagged in its fence
      drm/v3d: Set job pointer to NULL when the job's fence has an error

qianyi liu (1):
      drm/sched: Fix fence reference count leak

 drivers/accel/qaic/qaic_data.c           |  9 +++++++--
 drivers/gpu/drm/scheduler/sched_entity.c | 11 +++++++++--
 drivers/gpu/drm/v3d/v3d_sched.c          | 23 ++++++++++++++++++++---
 drivers/gpu/host1x/dev.c                 |  6 ++++++
 4 files changed, 42 insertions(+), 7 deletions(-)

--47mp7vgniqed6naw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ9vUAgAKCRAnX84Zoj2+
dlATAYCtuSibllvUw0LRAksLq+2dw95GaaHpe/yqHUhj4mnrYaVwskUMuN05Z3Je
g1M6vV8Bf1WI7AiXgRyaUghC6Ne0vSW5D7eStRbqifJMMydRqkEMPaCELL+X5Fpk
f0edh7S3FQ==
=2eWI
-----END PGP SIGNATURE-----

--47mp7vgniqed6naw--

