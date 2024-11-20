Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6199D3E26
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 15:56:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F8D10E0EF;
	Wed, 20 Nov 2024 14:56:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="m3jeLPyY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 566CD10E0DE
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 14:56:00 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-43167ff0f91so49863005e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 06:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732114558; x=1732719358;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=V+kS20KIPkt+Rc15rygB2qFPtg7jDCqE3qlcarAeRx0=;
 b=m3jeLPyYFcHOIOMnRt8gPTxVTpZcfcfIifLM8dy963VrI26ayx0w814JtBB0TsjiKq
 xeC8yMaeZ3FYlpiFd2uI9hnvhOdHo97tQJmlql+j3OfEh4CeWkFaH2UaTuF/1VUULVDK
 WLL+HjIcxhYF/JJPPqAHAlfNw47Sw+tQMlfWazzW9yuA1M1AgFzsX3jx2bpQe77EwnFa
 0noVznrXC4/GlGz4EVDj9HBnb80BbeI/46NY5G9PFNLwdh2W62CIXj/B7RSYJSUY1o50
 5nc6MGdszi+2e+rJdmxZF/NnUzphFmSoaXIA+aohaVqM8BkcWEec0pJg87RJCjuXeFUg
 9Lag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732114558; x=1732719358;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V+kS20KIPkt+Rc15rygB2qFPtg7jDCqE3qlcarAeRx0=;
 b=g5pyg6pdK5pQLi3zU03x46g/0S6wcD1iod7sGPbsrHgLJLLHk2vO7JE4Aswo/+4MXh
 MFZHWM4k+nBdf8X9RSeQaW3eiAxEKGzfR3uDPFLlmF23Kb58DNTigVM7APHo0+oUtv4f
 n+OfeR9MI4wpVoympqikigxEWF9+G8Bet9R16cO/zDKJGU9DaPbThymSb7jGpfwaN8ZK
 r9NsMDuhB0xv+ySwTnjWJwZAPAWiy2pHhYu3b1iBnRugucInqLMHyaln42bQsrwC5HTf
 7LvE9Zb2o70lBRaeGGRLYgqeKq4/UAwtV/QUZ7KqIBZOrpcItQqjlsg9Bnf44Fsymd6Y
 SDww==
X-Forwarded-Encrypted: i=1;
 AJvYcCXO3SxKU5san5j4VQZoFAr1ATydVKtHGyfbDM1+CU9uuIGCJIZT10siAk5+44cJ8iQofkIyB/j5ZFA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBOGMYcO7OmAdxcQmUmoSCu82eKpvMT61XRBMd1dc+nxrECsrF
 /pSKU1eUyEhOmPhK5Wqr7Kj48HpTVWWdgsBiY2mz2sdJtiCAUZGVabfMW6qQmmg=
X-Google-Smtp-Source: AGHT+IGdTqQ7Tj+uSuxWqtrn8DTscGlxJyUpzYJJDSpLMF9nlb6B1DD47y8yT17rTCzQr1BPDEoQEQ==
X-Received: by 2002:a05:6000:2b09:b0:382:383e:84e2 with SMTP id
 ffacd0b85a97d-38254b1646cmr1736029f8f.46.1732114558629; 
 Wed, 20 Nov 2024 06:55:58 -0800 (PST)
Received: from localhost (p509159f1.dip0.t-ipconnect.de. [80.145.89.241])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825490bee8sm2280815f8f.23.2024.11.20.06.55.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2024 06:55:57 -0800 (PST)
Date: Wed, 20 Nov 2024 15:55:56 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: keith zhao <keith.zhao@starfivetech.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, hjc@rock-chips.com, 
 heiko@sntech.de, andy.yan@rock-chips.com, william.qiu@starfivetech.com, 
 xingyu.wu@starfivetech.com, kernel@esmil.dk, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, p.zabel@pengutronix.de,
 changhuang.liang@starfivetech.com, 
 jack.zhu@starfivetech.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/9] drm: bridge: inno-hdmi: add inno bridge driver.
Message-ID: <oabm3ahd6vyeirjbbmp74w3tldqkcy3de7u6avio3ohfzfns2t@vfcvn3rl23xm>
References: <20241120061848.196754-1-keith.zhao@starfivetech.com>
 <20241120061848.196754-4-keith.zhao@starfivetech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="in6ao6wh7zqwbwgj"
Content-Disposition: inline
In-Reply-To: <20241120061848.196754-4-keith.zhao@starfivetech.com>
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


--in6ao6wh7zqwbwgj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v5 3/9] drm: bridge: inno-hdmi: add inno bridge driver.
MIME-Version: 1.0

Hello,

On Wed, Nov 20, 2024 at 02:18:42PM +0800, keith zhao wrote:
> +struct platform_driver inno_hdmi_driver = {
> +	.probe  = inno_hdmi_rockchip_probe,
> +	.remove_new = inno_hdmi_rockchip_remove,

Please use .remove instead of .remove_new.

Best regards
Uwe

--in6ao6wh7zqwbwgj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmc9+HoACgkQj4D7WH0S
/k7stAf7BxhOxsMRlloW6PgKRB566VsoPAEPfLvO4bZNctLX5jZZvbCQJpZjG4Ue
ecflnaMcpcXXGpWJA8Jf978PtWGOYJNaW0e1I8Jx+N3PMI7kY0imii3CrZ13N0ko
nD+ldlmC0eh7+uUhrr2mBrdoXc5QZqXuMQK/gttLb6eXQRDkEx7yTVjL6Z0/h0gm
5sPJQNLuMwiskC9KCypm7B08msgfhMtKPWGim91xMREj830dWkOTDXGqZBNLxice
DDstYVuYBN8emYzw1jByQQdcMrn3k5QQ68ArvaYCCqvgMncwWeCmN/I5qnZ8z4ZR
wKtuO/F9Xn+kth1UuxaCEh0LYnCthQ==
=DNtp
-----END PGP SIGNATURE-----

--in6ao6wh7zqwbwgj--
