Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED0E6D5EF8
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 13:28:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6114010E1F6;
	Tue,  4 Apr 2023 11:28:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AEEC10E1F6;
 Tue,  4 Apr 2023 11:28:44 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id ek18so129228346edb.6;
 Tue, 04 Apr 2023 04:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680607723;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GAROgpan+mwPyFcTNeZmR/RDUcG+1TwaoFUvfzQwO2s=;
 b=CE2yZ/Xlt0/yFSWpHLMZq6Y8n7YglFZHb8p/Aw3LcMWlgKDIJae3SRp5LAwUxQRzD8
 HFAnHl51tZ3QKScaJf2D+HTXSkDP4LJXT7DdrQmM7pB0l53gOgJOennWRKB+jdTGdqen
 Jj5p+TM5InEUdZhNdkryWm4Y2ksNr/wtSZNu0Xy7tNRco3w898rXxnkAN34eY5qaB6lI
 AeOrE8CodOgSDjyfhtw2W0eOGuGwS0HbpyK2tuHwiy5Yx2s9ITwcoENOShmsvlaEoRLW
 sFFbsBWBHxKYcig2FVZnBb4cZ2ZMqgSCLVk6AgyMmc9bNs36FEbhX5G4Jeo7WmrgeNAk
 sEXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680607723;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GAROgpan+mwPyFcTNeZmR/RDUcG+1TwaoFUvfzQwO2s=;
 b=BLcYh4QhpKBaLqUMaM+C522XV0QQLb/HNbAAy0bLVVz7/a0mUlF9PCt8E7z72jJU3p
 cbZGhDstSQRQVOTKY7+qOjEJT8lBEhRBuHOckJ1hHfTmbfz5fvXWHlw+aSK0/jNROImN
 nXHPYXxiE37rWqA7zPj5UrRu+Njg4GOdel4jUsSQsfMyPNMAzVdTRaFcbFkIH9rCT1B6
 0P8oJymHp4H4DOjy7DVhKChuVEjYPl7h7ZlJxBJLK5VtpJhjyX3tqLCn7hlP7IwFjtFl
 GRhtaha0uyxc1xL735Fe6VGpleIOu7/E7XY+7aqCCa++Vk9kdBO7znvaOy7QRmRt+9Lg
 2ZYg==
X-Gm-Message-State: AAQBX9cbzL9FEjFvCkcJbhJJIScAXz2PFbRSpbigWq2TbIy5TaO8Jacc
 YNsjm+yljU/AJCJIYPRdrec=
X-Google-Smtp-Source: AKy350a3HaZbq9zmPPxoUXNg14ovOLIP8X+tiQRXiqfd8kyqaTgovy/otZVQQrvTYV/qgeLiihFmaQ==
X-Received: by 2002:a17:906:14c4:b0:933:3aa7:57a6 with SMTP id
 y4-20020a17090614c400b009333aa757a6mr1968333ejc.12.1680607722761; 
 Tue, 04 Apr 2023 04:28:42 -0700 (PDT)
Received: from orome (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 k11-20020a17090627cb00b00930a4e5b46bsm5771868ejc.211.2023.04.04.04.28.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 04:28:42 -0700 (PDT)
Date: Tue, 4 Apr 2023 13:28:40 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2] drm/scdc-helper: Pimp SCDC debugs
Message-ID: <ZCwJ6C1WHG0iVVSY@orome>
References: <20230329171402.2772-1-ville.syrjala@linux.intel.com>
 <20230403223652.18848-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vj1AuGXsMTxBMTZ1"
Content-Disposition: inline
In-Reply-To: <20230403223652.18848-1-ville.syrjala@linux.intel.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Emma Anholt <emma@anholt.net>, Jonas Karlman <jonas@kwiboo.se>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--vj1AuGXsMTxBMTZ1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 04, 2023 at 01:36:52AM +0300, Ville Syrjala wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>=20
> Include the device and connector information in the SCDC
> debugs. Makes it easier to figure out who did what.
>=20
> v2: Rely on connector->ddc (Maxime)
>=20
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Emma Anholt <emma@anholt.net>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: intel-gfx@lists.freedesktop.org
> Cc: linux-tegra@vger.kernel.org
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c |  8 ++--
>  drivers/gpu/drm/display/drm_scdc_helper.c | 46 +++++++++++++++--------
>  drivers/gpu/drm/i915/display/intel_ddi.c  |  4 +-
>  drivers/gpu/drm/i915/display/intel_hdmi.c |  8 +---
>  drivers/gpu/drm/tegra/sor.c               | 15 +++-----
>  drivers/gpu/drm/vc4/vc4_hdmi.c            | 21 ++++++-----
>  include/drm/display/drm_scdc_helper.h     |  7 ++--
>  7 files changed, 59 insertions(+), 50 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--vj1AuGXsMTxBMTZ1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmQsCegACgkQ3SOs138+
s6GsXg/8D9UCUi/fBwJqmv5OJ/ABJwg9vRF+wYUrky+mYzGugSeEcePKaw295uKY
aGnxbpBnx0vKSs+G7sb8E5ccoMgl/NpsvkttAfRLEku1H/cCpLODZNSXdszBlxt6
4UplImiSbaPSu42ZVOWrJOBYzUiMarii5ajM7y03XZTLWmbSG/1NoZuf0RLaVaJt
QuNjjVAMw7OX1nMPJcfrzz2yFtxXj+MlL3sgKpyR6wPAyPCqWdi7lQkmob/UwulD
mqCGfugR/J786r/HbLGqm+7HAB6ctBpAJpyh83FgWY2lIAxlkp+bSS3j18LA0D6H
1a9DPI3ay3oATOSDzfq3wBG8cpmqd+ySQ4n50+jFEi/+v8ggRf/NIuNuutaD5VJq
SoMyO6L1eN7uGQz/oSkBxBkO+zh7orZZI1I6Nqh4HhtbTNFnZVtQP4xIlYFjaeTA
ugvMHPuoYbiqgzgnEyQDkblvmXwYSl6K2hmePeX640A2bDSeb0GY2CqYW4mi56Xs
8LOM+uMH9mRvLIz73dz4rgOpVxJnrrmrDQdEToJPbkqr7Tu6cDiLABM9qScC9SEa
szCfZuToPH0rtsL2J5pbf2kdxb4ozzlVgzoLRKt2qSnMBYPw+K7aoCR4XZiHfhqR
p20ybBF+h0FvHEZ0uAENreC2jJ0V+sT770JAx5ulk6emdjr72V4=
=sVLq
-----END PGP SIGNATURE-----

--vj1AuGXsMTxBMTZ1--
