Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A15C7C005F
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 17:28:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68A9610E390;
	Tue, 10 Oct 2023 15:28:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58AF910E390
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 15:28:48 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-533f193fc8dso10228757a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 08:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696951726; x=1697556526; darn=lists.freedesktop.org;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/G6ejQKMQhHXkFl4KtoQA7cEqCddO07ycizXIhPaPkg=;
 b=Do60mw6yhBi0mIiGdYEKqxzY7rF/u+c84cceTGATQOXQUQ0jQo7ff+evNNylsvnUFL
 tsWN91sopPp8oPr8ZPbdjktm1nGj7An2vsEoRLmEE3/zKr2S0SOlwpbaIwZsgBSPO+Re
 IQU1DTt6rPE+/03ygW8rd0TxTP7b2VIqUoliSRf+wpWAwiwcs599fKV83gvk5Q7bMl3U
 nZMiWw7Cz8e8fZ+pmF+YaDjKN1h+Y5MqujF1Pad4xXcTD5zgu3CQktLlp1kUIOw3MNBQ
 6rNHmWQ1JVneBUZn4iaJTRp1iSHza7OEZdGkhnkhNDaVHhGrbaG7plDRj1tJULOqcfSB
 a3sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696951726; x=1697556526;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/G6ejQKMQhHXkFl4KtoQA7cEqCddO07ycizXIhPaPkg=;
 b=lobEs7LfAt6akQJ9+R+nyvJ53lFtVoJnNNo6oR6V4NA+vzwUUa/eddNSvP+O5Vwm1d
 gxX6BnuW0YNeU2BarQ2XwERQZfTBKer64nfF+IYgWB5V3oWCVEL1yHKiUfJXkvcULqIo
 +mndZ9HELFsFiPP++tKSYnhz2/cgZz+qXh5TPDnQI8hXKqwOG9OBdTy0hHOy7/fyIaVx
 sDLsDr5cVVK++iCdeu6Oxz76lvWTRLp40ACc2d5NmLM5YMgP+vq5+o3vQAhVRMndoFG0
 xX68+MIpm2lLU+7+ViuxqaqZnuehjXyidGG05/wU5VVZPXyFPjd0c9HYS+wp2fVMNi8p
 6vjw==
X-Gm-Message-State: AOJu0YyqKDWhqVd0niwsVGSGm0rKw8CAU3KJOLhDqkgfwtGsz5kZvedp
 B74KBWhDDADjv6bIWtBqbmM=
X-Google-Smtp-Source: AGHT+IEDkZ2Bbac1OspEoQ14qb4STQ+50PQBxeRkKLlrIzUqPBOnNLqRS1m81/DzBZor6WxgPLiNnA==
X-Received: by 2002:aa7:d88e:0:b0:532:e24d:34f4 with SMTP id
 u14-20020aa7d88e000000b00532e24d34f4mr15983184edq.39.1696951725720; 
 Tue, 10 Oct 2023 08:28:45 -0700 (PDT)
Received: from orome.fritz.box
 (p200300e41f3f4900f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f3f:4900:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a056402344800b0053537ad3936sm7811005edc.21.2023.10.10.08.28.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 08:28:45 -0700 (PDT)
Date: Tue, 10 Oct 2023 17:28:43 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Sui Jingfeng <suijingfeng@loongson.cn>
Subject: Re: [PATCH 2/2] drm/tegra: Remove surplus else after return
Message-ID: <ZSVtqxTdTuPp7aTf@orome.fritz.box>
References: <20230626143331.640454-1-suijingfeng@loongson.cn>
 <20230626143331.640454-2-suijingfeng@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jzKm22+bkF0mQ8Ka"
Content-Disposition: inline
In-Reply-To: <20230626143331.640454-2-suijingfeng@loongson.cn>
User-Agent: Mutt/2.2.12 (2023-09-09)
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--jzKm22+bkF0mQ8Ka
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 26, 2023 at 10:33:31PM +0800, Sui Jingfeng wrote:
> else is not generally useful after return
>=20
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>  drivers/gpu/drm/tegra/gem.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)

Applied, thanks.

Thierry

--jzKm22+bkF0mQ8Ka
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmUlbakACgkQ3SOs138+
s6FCUg/+OD33m/0vdz7o+NyI0mZZyDfZVh2DgPER+q3n6LDkKCpEYQpawTh879En
YNGwa0fX1Ug8IGwFEJK1zoVVALT9kHbkO33U0O5XgE9SpRigIdyYeeuubT4sBYFb
ikHphXIQ1MXfVvAs3opcwbuWvI++r19Lsxo/TMq+TbABwfUPdOTB4yjnw0JEZnEL
nUkL1ZGdITv86GXhxV3f+5Nc+jd16QeJDu7sAFpZUISdm2JQ1s+hSbMDAZOn0u7I
5Iqp+vbQMc5Kobmxn5PpxLIMGD5BecRwNtqhSbrrcGZ+KziRc/rd9O5SdMAaxSv2
YOFM8TEsPng4FqJgk7ui98OHhSRka+WHKCWPoPQ+lfVTazoyz8yeksELqNEuIrCt
BeRYGugLpbjCR3PXPHjB5xjS9rZ/DtU2CByIC1G/TZ14eGFQCHAN39Ou70FE7Fc2
QyHcAVhwRgiy4VQOCi3gxX7kJOJcEt/x4AirXdmgoowXRu1rif+xjndH1zEIx4/1
4huPz7V7/GuO1jjO1C4P+i/8LIFTnVRkEVExj2abf515Q7eevlMKNDRp18bXupen
AAhX+Ab23qPKbXpVhTwmEItA7ni6IokCwdeagAp507kM8poRt6e5UIsXTdjxtk0D
0XCLPtjB5tuJ7MJKspaOsjPINXPp2Edw6LRIDbdxIGPyAi/UKKY=
=JkQa
-----END PGP SIGNATURE-----

--jzKm22+bkF0mQ8Ka--
