Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A677D8C8
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 11:51:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A7356E340;
	Thu,  1 Aug 2019 09:51:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF936E340;
 Thu,  1 Aug 2019 09:51:23 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id v24so68858016ljg.13;
 Thu, 01 Aug 2019 02:51:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=wDV2ZU54YnNWOZh8abPbbWvty67B0rm/mrP4PoOgNHI=;
 b=h+YZ2KcrfyX12oIX8rw3H+o6hvqcgGa2ia+3tsGGWMSCkYhHB9ObwvdAhzAO7jrtRf
 fwmUsSXXj3KmiXrcJd5Vz0NypCb1B/N7+TCD8uG8AdUAKGkmGfjpHfeDYPLI74CzECvj
 ul8yIK1wvz6+jjshsrgzCgt/P5XJbef+kXPjjPUssEFgz7W4NdiD/k7OBNu0VrAnnrdZ
 dughKDaZ3/5jQjnR8uv00ETHlM/PfYRHTGs2ASaECtSldyArqPU5HzJ8lAIcUa141CYo
 pO2pitze3t3yUR2YWf1CTKeFqXxYefbB/kW4wPhXNavOXT6UTRL42zNAgdum96LTkvoL
 yd3Q==
X-Gm-Message-State: APjAAAXZkjJ/+iEUvkSKvuwwnGTr9RU0YU48v9HwDdYvWioK+tjU0I+T
 N/IUtoB5LRM2pEYkXBT2Y64=
X-Google-Smtp-Source: APXvYqz9wGfzdRb1Jt9BM9lDVTDjpf2ZKzfLzbe7ZrQUJxmmXqhnf+8xHLhojAsY3IWFuaGAjS8g+g==
X-Received: by 2002:a2e:b048:: with SMTP id d8mr25833944ljl.118.1564653081420; 
 Thu, 01 Aug 2019 02:51:21 -0700 (PDT)
Received: from ferris.localdomain (85-156-247-180.elisa-laajakaista.fi.
 [85.156.247.180])
 by smtp.gmail.com with ESMTPSA id z83sm14534644ljb.73.2019.08.01.02.51.20
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 02:51:20 -0700 (PDT)
Date: Thu, 1 Aug 2019 12:51:09 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>
Subject: Re: [Intel-gfx] [RFC][PATCH 0/2] drm: PATH prop for all connectors?
Message-ID: <20190801125109.2488a2d0@ferris.localdomain>
In-Reply-To: <97e2643d-c534-cfb5-bd27-4cf95c656104@amd.com>
References: <20190613184335.7970-1-ville.syrjala@linux.intel.com>
 <11bb4ca1d27d3ab2d169deb57951855c4ddcd563.camel@redhat.com>
 <20190711102923.3d219640@eldfell.localdomain>
 <97e2643d-c534-cfb5-bd27-4cf95c656104@amd.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=wDV2ZU54YnNWOZh8abPbbWvty67B0rm/mrP4PoOgNHI=;
 b=bDgzW2l7bFvLEeuQ8mQ4dal0vL4WRakPGq5PXaj81Zp9NFTRBbwSyZUyt/zRr5iL6E
 EoZkqPRGuQxl3e1EHRmoX/Wsk/WFUvGXuzwNBxUkbMau4wfe+yQOezgJwkVismrWEGI9
 kD52zL/kTHwpky0Hqqd0ekjK6L2Jiyly4zgBraXp9YOQojUcynhG+jq/KDScuBXoBi3p
 9lb/JDl/buOZAIYnUFdNYxsuZ5SAN0tLGLXfisnUbdcrOiqC4BtOpwRdgccc2zFrVPGZ
 fzuD90MExNA+T4RlswGhmFe3v3jD7al2J3FRHAj4IrTrIfoBM89+zyCyWadj1FmdLQyA
 RWHw==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============2073260632=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2073260632==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/HEa6R_4KyQA7GSt/ty5CntU"; protocol="application/pgp-signature"

--Sig_/HEa6R_4KyQA7GSt/ty5CntU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 16 Jul 2019 14:59:58 +0000
"Li, Sun peng (Leo)" <Sunpeng.Li@amd.com> wrote:

> On 2019-07-11 3:29 a.m., Pekka Paalanen wrote:
> > Wait, one can write udev rules for connectors and stuff?
> > How? What can they do? =20
>=20
> I was using it to generate user-friendly device names for the mst aux
> implementation:
> https://patchwork.freedesktop.org/patch/315900/?series=3D63237&rev=3D2

Hi,

what is that device node used for?

Are the "by-path" symlinks to help a display server associate the
right device node with the right DRM KMS connector resource?

The patch commit message did not explain what the names are
actually used for.


Thanks,
pq

--Sig_/HEa6R_4KyQA7GSt/ty5CntU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl1Ctg0ACgkQI1/ltBGq
qqf7UBAAq0zgWWoo3KwV5ud5aLHPfc+BjGTR2CTBnLgueGpKhmWPj7rfpZl+EeLt
04uOtPcwVKw1AfVbqXUa1TI2DmhXadpLnZ6/TdGz5nIc6ei/dynFHfQFxWCXDPwZ
f9g0yMt7QqWcMAG1DPgJKwcXwxCPoxPvSAYbgDdAA6YTRQ2wAyl8WR1nEpPrb3nR
hasWQWIOipwK5VPoDbel1dFTyGs4D0B3WChh5w3ce8Svkf7sG6x3zzezeJUa4Vbs
ZtqiFHohblAMtBcs7AYsXHxgoiq4cjWts6ILVAr4Ee70dUbvPY0E24kx/sgF4M9Y
cb45BofwhLKavYQ1vYkZVZUAyA6vU6pD8/hUEgFaqQtV2oMwzDxposEoELDq9NaH
ZJ9x/dfz1IDZtaSISQd6+nD76XETQi7RHxu9h99dw0IZbWO9o++ry1Z/tTHieZmm
y/ZHf0UAwNW2xRdAW5/l72bgOSfQ2JIwITt2/jinj7fV3cKxI6jBbQh1htIhaAKV
ufT1uwokp51qWPf466PnMkBYF/D3vBfNZxs+6/BmQzhOQmMFadrwrRv9HfvepZ/V
ryASS3M+bBch3/dlrJQpjwMrtvO+jyaBALA0K+GcVBfrH863EE+6ZhZiitzo3vaY
/FeZ4nj3YMQTky6MI7GkQLkfhTrr5RcwGFM/2v8Zi5HbOCnxOj8=
=s71S
-----END PGP SIGNATURE-----

--Sig_/HEa6R_4KyQA7GSt/ty5CntU--

--===============2073260632==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2073260632==--
