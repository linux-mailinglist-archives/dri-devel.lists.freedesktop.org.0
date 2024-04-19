Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9FA8AADB2
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 13:29:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2636A10F538;
	Fri, 19 Apr 2024 11:29:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PJ5gA17W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF78610F538
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 11:29:37 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a5565291ee7so212899866b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 04:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713526176; x=1714130976; darn=lists.freedesktop.org;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=n4LcJjORvXYEFla/jgoi0t4zdgiXzjY/KUEduncoJWw=;
 b=PJ5gA17WAA//iJqI+hqkws5K1YQ1qs4/sWApjRogYwweseJvCjNVsBIia3avXznE/v
 n0c4YoasM0Y5Qq2N2Y+rfPno/AC056zLizWidDCItypB33y+4NJrx9EgjO8CqlX40GvL
 ejTXSRaYEN6gVY6LiU2X0/lWSLPQcpA9R2xOVcjtRzkBewK8fNP5qlxX6ReUMV2wIhzS
 yW3Mw+Ufbg801cxzWDEN+Z0+zrLTZSzNcG7ulQi45he2dZwak62D2TZD6w6apwjQi3dB
 GsnK+JpSs1j+haWUUiK0oADsllHcOwLr3IL27RdDnW+5FnUSTTQe5xOmrwAf2WIxt6ea
 cwEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713526176; x=1714130976;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n4LcJjORvXYEFla/jgoi0t4zdgiXzjY/KUEduncoJWw=;
 b=GiUiMdPxZRfStfK9cDbk0L+g7j4ES4xm22bx2WAg5XYbDJPFkm3ziErnrJnGioLLBu
 ZJ5tNXQCVtsBNnHkeQ9ECpF7hH324ZcO5Y+L8tROkF4u7wjhEjhTZ25a2WgnRPfdSv8O
 GrWcAI0KcSGlcYjXPc0pesIqUBQkTZS0x8vzS66ULQT9TdPsQUGyg3xsznmUPRXHrs0f
 iLh4tWxO8ove9RU/0EbMJkSiopMPiQtrDtasoWMVbXz2a21kRghAqtT11vIzdUgB4jwy
 /r800x6jARJXuNdwDYDvjfBVfzfMZKil3Cy1dxZKcIz18zPyc0nzXdrh6jvtAnMhuhIA
 QoUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAIETzHRcTbr06RdXcr9/Yt414wyKzewNEtiVywvaKLSIa9JAxfz5Hv7dmDIjEXT0ARMF9M+89Y+WSFInTHXCDmSBBqcyOCUzN4GjVGMWC
X-Gm-Message-State: AOJu0YzltyIJzCXqojuGmy0b2zogTJlJp/bFTDeEyqlEeo5V/GpN1NNa
 OaDiD+q7qrf2E+bIbm3LwCfDSE6e+KMhQ3wNXMreMgifH5zuW0OWsbe19A==
X-Google-Smtp-Source: AGHT+IEf9iXqPnduTXPuilXEaX9Z9lFHFjpO71vLglogWZ7GVIaRLlo4wqApk1YpwFvQyDAgpeF8NQ==
X-Received: by 2002:a17:906:2b51:b0:a55:7ab9:57e6 with SMTP id
 b17-20020a1709062b5100b00a557ab957e6mr1202714ejg.47.1713526175713; 
 Fri, 19 Apr 2024 04:29:35 -0700 (PDT)
Received: from localhost
 (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a1709067c4a00b00a4e5866448bsm2071756ejp.155.2024.04.19.04.29.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Apr 2024 04:29:35 -0700 (PDT)
Content-Type: multipart/signed;
 boundary=4631f6a9b2d371b5a1490d95dc7549b23a9b87b8b54b5e8e1f77dbc0f933;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Mime-Version: 1.0
Date: Fri, 19 Apr 2024 13:29:34 +0200
Message-Id: <D0O2C1JJOF90.3MOQH6PE1M2SL@gmail.com>
Subject: Re: [PATCH 3/4] gpu: host1x: Convert to platform remove callback
 returning void
From: "Thierry Reding" <thierry.reding@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 "David Airlie" <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>
Cc: "Mikko Perttunen" <mperttunen@nvidia.com>,
 <dri-devel@lists.freedesktop.org>, <linux-tegra@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <cover.1712681770.git.u.kleine-koenig@pengutronix.de>
 <7e31909b1e536f0ddbb060b1aaa0a9e943687c8a.1712681770.git.u.kleine-koenig@pengutronix.de>
In-Reply-To: <7e31909b1e536f0ddbb060b1aaa0a9e943687c8a.1712681770.git.u.kleine-koenig@pengutronix.de>
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

--4631f6a9b2d371b5a1490d95dc7549b23a9b87b8b54b5e8e1f77dbc0f933
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Apr 9, 2024 at 7:02 PM CEST, Uwe Kleine-K=C3=B6nig wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
>
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/gpu/host1x/dev.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--4631f6a9b2d371b5a1490d95dc7549b23a9b87b8b54b5e8e1f77dbc0f933
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmYiVZ8ACgkQ3SOs138+
s6ED0BAApayQb5R8tzI25oRF9vE4dD7fgryHQ6lE8bDFua62RK1xuC0+16Fi323n
5eHdLgQSC/zdAUB+E0OeRpqWg7JGTJqfbfbn9hE5HT3qQu9MxDzI9btpGAHowNlv
SOzzsMOjICuAhZ/92iZ0jp1EtsyU7QdhQ6jOMeFHqQFNggvpzXjLzeh+E+BoRvNK
1SAGI1x+Eo7PHrFAOHgoZn/grnlyuSlGelszK5hwx3Rsr8LQ4qbYtMzTNKkdtDxv
OSgiDSEuTQaqbROckvB5IOK8TZKwMMukSYkpJg/omb0y8dDjfWvqX38VTl2+NfIs
jGa97Fi0/N2Ny9weM3jk7Rx64HCW/FxcCAcj0Wk9fVZAkh8aFUXYUxjigLFncDVr
0p3BWfYeBebl8RSCQ4u0omoo9Ar5+yoBXs8+WhAm5QPdoqseCruj1JPFqiZl3KLt
FYgRGmAIIMIh0R7089+8oT8wPc2t+HN/Wsoif8z+B/RqIERQBCfKV4GXd6I3nkKN
2wl8TZUIWMGvy4VsXG8r4iufoHgW15AoWMOuI0gCgZt8ukVhyRdZGyX0Y1a0eFmP
EHdY2XHmvOSEFlQE71pXm1kvocBHzChg0eEvBkb5s9m9VPp0LnKbiyQty4bYuCN+
x5bLRkc13YsDn5sdB61L1qKLgDXWLMpn7zjelxT+M0aoJdAgDqU=
=suAC
-----END PGP SIGNATURE-----

--4631f6a9b2d371b5a1490d95dc7549b23a9b87b8b54b5e8e1f77dbc0f933--
