Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C68AFDD83
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 04:37:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0049510E1F5;
	Wed,  9 Jul 2025 02:37:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ON6hOYkX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7687610E1F5
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 02:36:59 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-31223a4cddeso3804308a91.1
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jul 2025 19:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752028619; x=1752633419; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HQy46u3MyUevid/JqcuEb31XzqKEb+o9x+MJnYqqpKg=;
 b=ON6hOYkXR3M1R9aGL+BuDe6y5kIV+PzwnwgY/pUYYIJ7t9XI5Bm/JxLknVfiBPhWFt
 Ms/6l6fnqo21eJB2I3WbuhZqZaewzxoZvolF2zm1rElwKY5sO9j6G8i6ruISglR8iyc5
 cbH7RhiFKLy2wxtjuu06x0FQ7Db5LqDaTM4ojtXA9zWdcnBlby1ZbWlMXoNpjMDE6ye/
 jmuEXNA/m9UFRhomX4Xnhu7sp1NuqFiOmOJVrMj9CjjSmmEstJqEL4m5YQP5nDGl5SGa
 /oqgAtkHpksI1qyCmApHoLkFGSScje+003kIxEtzMqjXWGcKSKQsfRQSn24NpUxuhN8I
 LLEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752028619; x=1752633419;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HQy46u3MyUevid/JqcuEb31XzqKEb+o9x+MJnYqqpKg=;
 b=jqtTFjnXJvE/RGLEmrJPlV3wOvqOadB9DYJIhR7dmyDy9ZW93Fiffb94QoiUhfqjyP
 kdQm/8AvKGdTfC5FI9VWJDP7StOCK9MMibBxm3VoZwwRAt4mb2HxJMcsnQpaBu4tRfCX
 l9ZcsKhaV2c0lDWWVlcwDJQAu1PctZA9GkqjFHGOIpa6rZBGhC1pT5BtJOEIGkHcLV36
 wOFf4w7uJ2VEgmouq36P1R4Oi5JhgTG7CQJw6fBl5Ox8qbUvnoy8iIDW9+9bpDmTwWp/
 ksoIfjJmABvZmxn6o/0Gg8d7v0RHcwmreu8k/SbljMskFaLUfx2Sld7xL5k/RhIXtiUj
 xL1A==
X-Gm-Message-State: AOJu0YyZsJ9bRn8P3l70fdCeqimmGJ1tGbFBK+3XmucbmGkUqzGA69XW
 Hdw+HYDEeEE36Fxz+ThCaqAzilOAntfQAIEmU8AvptlQlWdSV1LkDYG7
X-Gm-Gg: ASbGncvO0/3xotB/4RVug91Or5TtXnJlsL4BU8X3FuN3wapaeqbh7jUZiW48Z7wWTDI
 o91t5vVx9lC2bCRo/L9IYljJVPIDmLalMNbqkMJXQ7zezQkposWSOqLInHzTEz8hDgC/Lb66wp3
 3erArRtMgN2dXWY6JKoIcn1bkLLTwT/kFDTjozxJDgAML5Cno+GNd3VnEgcYuGUy4uFJRv7cPwa
 jGpeNJwlmi9qNCYYUikL50DWs7sRCdsBOV2CBid6iOFLtdeZ+bPIriJmVILItR1q+sE5qYKSpjI
 GCwKtq2m6cr/c8r97GCRR45k2JhH7TDNg5CDH2ilrUHvUr/Iy6DU8XVIVW7hBw==
X-Google-Smtp-Source: AGHT+IFu611+OS2OJWmiueYge4xL9xXDv/cgxhH3RKbqIXjWA2QveArwFAqLTIWh0x/PHAU9cF8RVA==
X-Received: by 2002:a17:90b:4d0d:b0:313:fab4:1df6 with SMTP id
 98e67ed59e1d1-31c2fdfe552mr1088851a91.32.1752028618581; 
 Tue, 08 Jul 2025 19:36:58 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c30068d50sm536038a91.15.2025.07.08.19.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jul 2025 19:36:57 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id DD0D1410194B; Wed, 09 Jul 2025 09:36:54 +0700 (WIB)
Date: Wed, 9 Jul 2025 09:36:54 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 airlied@gmail.com, simona@ffwll.ch, Raag Jadav <raag.jadav@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com
Subject: Re: [PATCH v4 1/3] drm/doc: Fix title underline for "Task information"
Message-ID: <aG3Vxt8tc0HYRNbe@archie.me>
References: <20250704190724.1159416-1-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="haaEsPDVn1u79Kw7"
Content-Disposition: inline
In-Reply-To: <20250704190724.1159416-1-andrealmeid@igalia.com>
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


--haaEsPDVn1u79Kw7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 04, 2025 at 04:07:22PM -0300, Andr=C3=A9 Almeida wrote:
>  Task information
> ----------------
> +----------------
> =20

LGTM, thanks!

Tested-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--haaEsPDVn1u79Kw7
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaG3VwgAKCRD2uYlJVVFO
o1MLAP9FVqHMlgBgrBCNQWQ5Wy/3bHSvsDX+VYwBBA8Dn1HcXAEAupzs6l34AlqP
JH4vmBESL3jhhoqwa48adXKPCQna3wg=
=jpJw
-----END PGP SIGNATURE-----

--haaEsPDVn1u79Kw7--
