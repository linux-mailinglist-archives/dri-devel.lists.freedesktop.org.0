Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3A4218059
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 09:07:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46ECE6E885;
	Wed,  8 Jul 2020 07:06:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C5B89A0F
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 16:34:31 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id d10so16957362pls.5
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jul 2020 09:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=+s8uTpzOInwRzG7yF6uQj5b7go+jZCn77sviuWuu/rs=;
 b=uLGUD5CW7JVOfR39yhs5ov3P2Dlb5A/9QeyNgi1JIHHI0guuxzhv8ObBEp2ARtpRxM
 RotZk550MT4nE9vY0teDlr0KEHKY50A/q/fyADFvykvsdf0R+B7bl43jCvvAZIknstSA
 HUZPzL70RfeWHxoNNsqYmlrQnVdk8nSwdlUuXxUBF4xT/N18PSXwVcrn4qQ2PEkqXo/X
 tSKurmtfDJ7FuJHYd10SM/X1g1U7/MuY+Ak8x1BWrRIXzpWk7B9K8nEbZlsBRCSv8vcr
 +h59kTyJLJHVVTrk8YXHo9v4gXwhNe26ozAYbfoOV4XTjUu6qsRTHn+8qmND1DDGw6YM
 ihug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=+s8uTpzOInwRzG7yF6uQj5b7go+jZCn77sviuWuu/rs=;
 b=bxHR86Rpbp/pSYNs+74RehSEtyA5Ed9AV7xBQUYh7IpJiqiTCgvPIUMZJ/3DYVGQQD
 tuFZeXccyYTXjqocrSqSP5iifcssshrVO7l3KWNcBenRCSSCd5FZLqzbUj6080WVMB+c
 5X3h8EJX0sUGnrY1kNsWz6eIRaLTKFYIYbrqor6wDEK6ScKZsxbphQXs3q3ZPnjUS76c
 OuN29kGiCzK881YI4wA87vo5cDbUMvpfxItAJ5X4vpaSzLQxXlRoMuYMbU4BjuJmoNUl
 RBmvXB3iB0X3OmLMBe/kwbjyGll9HB1ql6PRPqeyqYROgQjuyLGMqiWKFAg534frIWmC
 vEXQ==
X-Gm-Message-State: AOAM532yviWqfTR2uJXsdKklD9orxnuh7pDtX+Nep/vIPZ3xg+b2k9je
 djsI2brk3XZT9eFy8jhHZgs=
X-Google-Smtp-Source: ABdhPJz9+XZnqCl8VLL87L5hv+VKWsXBu2Z9nSSYEd5x5VE66ZUS9/DknkO4i0g4hw3MORg0llSTnA==
X-Received: by 2002:a17:90a:206a:: with SMTP id
 n97mr5173541pjc.94.1594139670759; 
 Tue, 07 Jul 2020 09:34:30 -0700 (PDT)
Received: from blackclown ([103.88.82.137])
 by smtp.gmail.com with ESMTPSA id s68sm3054324pjb.38.2020.07.07.09.34.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 07 Jul 2020 09:34:29 -0700 (PDT)
Date: Tue, 7 Jul 2020 22:04:14 +0530
From: Suraj Upadhyay <usuraj35@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 0/4] drm: core: Convert logging to drm_* functions.
Message-ID: <cover.1594136880.git.usuraj35@gmail.com>
MIME-Version: 1.0
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 08 Jul 2020 07:06:31 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1383318580=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1383318580==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cWoXeonUoKmBZSoM"
Content-Disposition: inline


--cWoXeonUoKmBZSoM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


This patchset converts logging to drm_* functions in drm core.

The following functions have been converted to their respective
DRM alternatives :
dev_info()      --> drm_info()
dev_err()       --> drm_err()
dev_warn()      --> drm_warn()
dev_err_once()  --> drm_err_once().

Suraj Upadhyay (4):
  drm: mipi-dsi: Convert logging to drm_* functions.
  drm: mipi-dbi: Convert logging to drm_* functions.
  drm: edid: Convert logging to drm_* functions.
  drm: fb-helper: Convert logging to drm_* functions.

 drivers/gpu/drm/drm_edid.c      |  7 +++----
 drivers/gpu/drm/drm_fb_helper.c |  2 +-
 drivers/gpu/drm/drm_mipi_dbi.c  |  4 ++--
 drivers/gpu/drm/drm_mipi_dsi.c  | 15 +++++++--------
 4 files changed, 13 insertions(+), 15 deletions(-)

--=20
2.17.1



--cWoXeonUoKmBZSoM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE7AbCa0kOsMJ4cx0j+gRsbIfe744FAl8Eo/wACgkQ+gRsbIfe
7451IRAApvuLP/V+UbhAWsY53dMQkKWHKyETrPZ/5yooQM5VN1yjjb47MC6DeRoQ
VT61BXY5D53zAtqVuTerPs/ySce80Hjnvr4rsdoRe405bqu5DIqbbyq/K9VoR9Yy
ueiWMZY8cO21LT+cPqq/9aRrCDzhpppmOCcgwar+3WR8Qi13PF2PZM9OrobdWZ+N
aJWun4uaZS3qE3ZZibwsvX5b2U4vG5iEtuAiDq8wDsY0OBX1WEH3cpzYI0QW841H
F0i9xdOIf+zofDGGzngAzp5UQut1GTttQsFE5B9AkWKx4s4WMhq/309YgXUK70nB
/uap/6xzhYEuVRLwJwWzIrl+aLwNIgsN3iiqY/7NKe6rSH6PklPfErJn3AAT+N++
xFFHYPLkRk7/XMw8XlW/WW7otISYBPxJ4T9UPKbSX4c8HewF97vcTkVkwCmSHc+5
WWpoBDbNEnEECzMLjV7TAKTbkWM+24urBnGrT6f1fOeF2qSjeQE7DzIzxMW98cPk
3HEp7jBHvsjzMl148dX4MTPjStGYZPoHKe99S2maoe0jBmSBkufrBNhETFjBWQOn
xPjJWYghuuwNy+mXjAKbPhkBpKCpb3mnCXnFzbOIfxB7XfNoF4JGIwZL2Q2a50yL
cXE6GGc/JyzeHM82yOhq8eypCYY7nrKqyED/r+IVARj4X/p7rsg=
=Kzoh
-----END PGP SIGNATURE-----

--cWoXeonUoKmBZSoM--

--===============1383318580==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1383318580==--
