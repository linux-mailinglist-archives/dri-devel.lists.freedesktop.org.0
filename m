Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB4A91078F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 16:09:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98E9410EA10;
	Thu, 20 Jun 2024 14:09:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PdWFngV0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F41510E1C4
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 14:08:59 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-70623ec42c2so759512b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 07:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718892539; x=1719497339; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bkoariQAFK5nzptqulE5lD4Ceq9ZNl7I/5y71MtF05E=;
 b=PdWFngV0+HVVOd3O+BBqB5RX+nR6oiDq1h5KlIwXYOJot5mu9YPlLKh4/n0TPLqAjB
 V68oPP1i2e7FrkMwSSN48XV+s4VCgdOuv3pbB5rJKkK/BAZyEZnGTKAD5PA57mQWMm5c
 SSIZPW7dRbZaScdgkC0J0lBb7pIiznZlxJmpUACliR8oBWrOnwx1cUt63qQVsP1h5bq2
 ZelHwDdVDn9lGgNtaa7uiDJjwQs+IRIzdtXaLk/gp0JBfpJzeMyHabaABRbd+uieSsI2
 o815PfeZQPMOUheb+TxugO6oH3VQgDcbsJ2IsfSLYjW+N5TFA+9E8oXF6YB+L41DZGiZ
 vlMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718892539; x=1719497339;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bkoariQAFK5nzptqulE5lD4Ceq9ZNl7I/5y71MtF05E=;
 b=ibNbh6WvZy0Ro6LgXaSQHm6WxXv36DNINzGnRZhpqCX0s9618z6sX3TinUITET0wh4
 krs3NzCm5v4hjmHgb7rOD1hv0D6/oBbC8UjVOPtmipNfLEoA3O9IxkOMPp/4BshOuLG/
 +1JDzY0hzwmWFWAN13eHEDmKK6VW+Zl527Q5wgHyUeRL5b+GgG6saCKQo414OYnDgkoN
 63f6ZvUfW7oSJN3yWQ5z5l6Wfk0HlGI4q3JREMcR+qe7CankwICoeD0OQdT2wfCGwf4k
 2x7vrxzkOrjZaRpg+YkAuyH8yWUcnAiuhDCTJDa1Wl52BEXd4ptaqOLb2bJmwX1AXzqt
 cusA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSXC9ACCUVBTCIN3sHO0XXNJUUferlEmdPYpA1AWzl3yAkmBuvnLLawJ0aL9qTf9oKd129mDfxK3r9wjdIb+5vubzpBVXVUNKer9AEZb2R
X-Gm-Message-State: AOJu0Yx6WbffyUmqFzGt4CGc2zVz/25I+Xw3SX/i9iyt34QTuWYk6dl9
 mgYToY1FwnOvvbTrZd/zP20humJLvP/2eyLttD5s6KvAfqqzu7iEwNAldA==
X-Google-Smtp-Source: AGHT+IEWi/i9vtD/HvCPbZdrn1cy8dwPBWfdCTrVuHryTftlO8XzUts6A/QV130K6XeOnU1kYBckXA==
X-Received: by 2002:a05:6a00:4f06:b0:705:995c:3e30 with SMTP id
 d2e1a72fcca58-706290abf4fmr7801065b3a.17.1718892538504; 
 Thu, 20 Jun 2024 07:08:58 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-705cc987743sm12800997b3a.90.2024.06.20.07.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 07:08:58 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id AFD9C1824D9E0; Thu, 20 Jun 2024 21:08:55 +0700 (WIB)
Date: Thu, 20 Jun 2024 21:08:55 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Paul Cercueil <paul@crapouillou.net>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Nuno Sa <nuno.sa@analog.com>,
 linux-iio@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v12 6/7] Documentation: iio: Document high-speed DMABUF
 based API
Message-ID: <ZnQ398_ZtYpo-JLS@archie.me>
References: <20240620122726.41232-1-paul@crapouillou.net>
 <20240620122726.41232-7-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="OmuTAUrc7S676QKv"
Content-Disposition: inline
In-Reply-To: <20240620122726.41232-7-paul@crapouillou.net>
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


--OmuTAUrc7S676QKv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 02:27:25PM +0200, Paul Cercueil wrote:
> Document the new DMABUF based API.
>=20

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--OmuTAUrc7S676QKv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZnQ37gAKCRD2uYlJVVFO
o/r8AQCIFAAnhfXKSkVIpjhII/qaXwnWsgfL4cVfExJmpumexgD/Ri4NWMVAfeiY
yXZE6Mz87M0muGonVU4ld7vLcryHOwE=
=A0ev
-----END PGP SIGNATURE-----

--OmuTAUrc7S676QKv--
