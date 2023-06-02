Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D58CC720370
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 15:32:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31E4C10E07C;
	Fri,  2 Jun 2023 13:32:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A10710E07C
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 13:32:10 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1b00ffb4186so12249035ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Jun 2023 06:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685712729; x=1688304729;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wLcyyQh2yLRZuI0xq1Spx++5r4QAu7H4WRjm1jN0YiM=;
 b=MVb3eFphqnGFuZnrZa0fkJUiXKJj6PA6qXPXeVimS6DpQ4AxPt/zIIOaLriKK4YM0s
 OD5TKvqpdHYN3x0/QPosAXtzCAYO/IE9X3t1Maw3pngCYU6/YtF43NYVhpaM5BqMhMv4
 S2uj6aE89Q1SllxfQB6OIsUB7rgbHTxAD7lbwdu3ByjWg/6hlW7AvjFJcDKVIZLUfnPK
 H/F9ARWZoV3GO5l9OEIH73Apr9UeXgkqMyy5TEzNJBMiJA23Lzp8RC2vsdStRVoyuQmt
 VJ/ATsgU8O3UsjCjDRGBbbnEbgKDL1MHMaSDrkjAnbG5W7EMJQ2Id+enPSwzyi5jI7XV
 m72g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685712729; x=1688304729;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wLcyyQh2yLRZuI0xq1Spx++5r4QAu7H4WRjm1jN0YiM=;
 b=MI4blhm/jAeNORSFZMgWrw1Eg7hww2EJX4VItlO9CvEBgs5S1fongtWPQw5CI9GJNX
 ij/U6U2Ny5vYnov8fDU7mhAwpW4GvTSQ8GHIuLR4A8Xv+jKPZaDyG6YD5WUzzqee0yCH
 J97wrxs4hyyuyn8ZOntZ+lix/jBwwHwKQzsQXtAJK57/PzeQv6pQjq4yVC5aKccAi9jq
 RbZl4CgOJpq5srK8TTFPdzOWK7dW4ntdJlR98CJzC4ahzYBsWwzo3RN7kQyo3xMeoP4L
 BJo8oUtGIKkC6JxmpJ6Try0KMy/yO8gxLsikkvwxkCkLfhLbFRuRDdJ9KAeWSgskoHAh
 09kw==
X-Gm-Message-State: AC+VfDyN+srcN7PboWJdjSKTOe1sKZk2kfx1fsniyuk+Cq3TAkAZK7b4
 1kDJpW0S1vXO3A6bl2PZaPU=
X-Google-Smtp-Source: ACHHUZ5J63g6NUi0y4MlVavRTrgcGPUU1MafIBD3RB7CH7ggN40W6Ah2+s359IQfSJwPB+m8eYrFiw==
X-Received: by 2002:a17:902:ec81:b0:1ae:4562:14f1 with SMTP id
 x1-20020a170902ec8100b001ae456214f1mr18105plg.9.1685712729246; 
 Fri, 02 Jun 2023 06:32:09 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-25.three.co.id. [180.214.232.25])
 by smtp.gmail.com with ESMTPSA id
 x16-20020a170902ec9000b001aaecc15d66sm1316041plg.289.2023.06.02.06.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 06:32:08 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id AE936106A6F; Fri,  2 Jun 2023 20:32:05 +0700 (WIB)
Date: Fri, 2 Jun 2023 20:32:05 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomba@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 1/3] drm/todo: Add atomic modesetting references
Message-ID: <ZHnvVYM7K4jvP8QK@debian.me>
References: <cover.1685696114.git.geert+renesas@glider.be>
 <7cea42cd09540657875a210cd16421125497d690.1685696114.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="DPoP2WNc/X86Xlln"
Content-Disposition: inline
In-Reply-To: <7cea42cd09540657875a210cd16421125497d690.1685696114.git.geert+renesas@glider.be>
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
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--DPoP2WNc/X86Xlln
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 02, 2023 at 11:11:34AM +0200, Geert Uytterhoeven wrote:
> -There is a conversion guide for atomic and all you need is a GPU for a
> +There is a conversion guide for atomic[1] and all you need is a GPU for a
>  non-converted driver (again virtual HW drivers for KVM are still all
> -suitable).
> +suitable).  The "Atomic mode setting design overview" series [2][3] at
> +LWN.net can also be helpful.
> =20
>  As part of this drivers also need to convert to universal plane (which m=
eans
>  exposing primary & cursor as proper plane objects). But that's much easi=
er to
>  do by directly using the new atomic helper driver callbacks.
> =20
> +  - [1] https://blog.ffwll.ch/2014/11/atomic-modeset-support-for-kms-dri=
vers.html
> +  - [2] https://lwn.net/Articles/653071/
> +  - [3] https://lwn.net/Articles/653466/
> +

Looks like footnotes better serve these links above:

---- >8 ----
diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 51eb67f5268c5e..6ea92f48a2e21c 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -49,18 +49,18 @@ converted over. Modern compositors like Wayland or Surf=
aceflinger on Android
 really want an atomic modeset interface, so this is all about the bright
 future.
=20
-There is a conversion guide for atomic[1] and all you need is a GPU for a
+There is a conversion guide for atomic [1]_ and all you need is a GPU for a
 non-converted driver (again virtual HW drivers for KVM are still all
-suitable).  The "Atomic mode setting design overview" series [2][3] at
+suitable).  The "Atomic mode setting design overview" series [2]_ [3]_ at
 LWN.net can also be helpful.
=20
 As part of this drivers also need to convert to universal plane (which mea=
ns
 exposing primary & cursor as proper plane objects). But that's much easier=
 to
 do by directly using the new atomic helper driver callbacks.
=20
-  - [1] https://blog.ffwll.ch/2014/11/atomic-modeset-support-for-kms-drive=
rs.html
-  - [2] https://lwn.net/Articles/653071/
-  - [3] https://lwn.net/Articles/653466/
+  .. [1] https://blog.ffwll.ch/2014/11/atomic-modeset-support-for-kms-driv=
ers.html
+  .. [2] https://lwn.net/Articles/653071/
+  .. [3] https://lwn.net/Articles/653466/
=20
 Contact: Daniel Vetter, respective driver maintainers
=20
Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--DPoP2WNc/X86Xlln
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZHnvUAAKCRD2uYlJVVFO
o2R9AQDL0rXdsAZ2q75Un/nud8+9skYIJP+8pCerpXMSUJgTAwD1EbjcCcLx7iqs
1xk3nWj97FZCR273c6lRVz3Cm5VIDg==
=gt6j
-----END PGP SIGNATURE-----

--DPoP2WNc/X86Xlln--
