Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1204C7325A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 10:30:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E753510E72D;
	Thu, 20 Nov 2025 09:30:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XqBlhOPr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAD9710E730
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 09:30:04 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-7baf61be569so781369b3a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 01:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763631004; x=1764235804; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Y0ahZnkbKTq/zXCngVOV5tNUB9eHwQteBjkic4SlaNw=;
 b=XqBlhOPre3i9+piqMqw8DLUW6BYHEX+Oqt0GlGTO3Rp4n1/Ro/HO5tEImwwwasNpjW
 8o8/wI5A/BBz0rEZsrQiXLefJcNxyGGpU8dl9JrdBWrqSdCP6QrVkAX75aDWw1wEPa5V
 tiAUQ+VbgoEZO02c+c/eDeNIq4a844niCzl9RsnNZqvdsDFcpivCKo1LC1yM95JNsr8T
 z9MZE/eztboRJbvx4v40nBmOnkEdMbqVx4eOMjhGP30PRneGmPXB+kPy2ZwaXUlTRBND
 7EfnenUv7jE5+cX1NDuK2SSlK4vAl3bJ86re2/xPtv9w66s8/Vhwpt5l0e+RT1IebY/s
 24og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763631004; x=1764235804;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y0ahZnkbKTq/zXCngVOV5tNUB9eHwQteBjkic4SlaNw=;
 b=QLaaBL2ehHA3rG3QDaC0AsH9OtwXTfi4EQukpVkj/pqiQuAahfSu035Ea0E84Y5raz
 sOwdwJn5//oB7Ih/adOM/XmLZFgKeITvqm9zayWeOJqLgHtBqyUvYXK2Rb1X2BowCevq
 y5+YXfmSvmk3PbjrpCtBAZwiyR0TFf8VE0krMGYDFXUiA2nwN9IsCdBIeVDS7JHQXaqm
 WHG32M1TXyP1N0FMlcVOUpvCgM3VPCR6b8e5wNFvxfxkOInvkfx4IY6dkzbeD+nFHZwV
 QDp+Q6i1IAfJRi6pPPQFQcwgknPOCCbjvDFgXQDx1Bo1h+z5Fu8097+c6ir9/6U+Pl2J
 2Rxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9z0IO7mJ5oG/zEtQCts8+yCr6k+rpzyhgDuhbCK1RTWyA4vH4tDTuAjZfSQpiWW1EAyLhtbHnS64=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyj4GxgEMHxncsfpa/1wFE9tb81ecsZSaYLVrvYCxjtT6+yPBWK
 7s+bQAzLsPguk6NMKGwpuyUukDdX1x54fQUtjvNnruJbDBae2Pb1zvt+
X-Gm-Gg: ASbGncsL542Z/Di2D/QKRAT3bofEW463E/zOLmT5MNSlyuJ8xBnFdKimQpasLuU55t4
 L8tO/enbZWFvvzBJEj0M4QoH3Qo5FHsItEV+G4ndEp5lw0/kH06DCIWjXfABp2uEagXeyJdeQKe
 xnJjei7VyTSY/SzWTfOY2SkQy0/Bmf81MeIAYQjm8onk1i4++U8CKp9q+a1ODJVfsd3DqnkMhLD
 c0SfElPmAiD6p+bXbGkgI/XOntA9vm7DPuBAyAw9Vgydb39oCOxIRh1podWhVKaRN6VwTe/HCEj
 o1gYM0awRFs0dRo15PADodTG+rNb/7I33BHVkDcMAM/W3is8rqFxMWD9hpj4SQYSX2y073EkzX2
 6wbHiqLzx8nytNcEq2fMYLCdqwWzvsQPQqXdviecpAdc/KTNIcT+W9MxIcwtdifTwV1Po6ICE3n
 CL7LSwMya3wT6MPA+ASHiQkA==
X-Google-Smtp-Source: AGHT+IFM1rG6BQ9QLPRgC9WRSoHnGffbzNzuoM89C5S7NauJeRqdu2h4JvYetmK1mXobCaM3XLB4rA==
X-Received: by 2002:a05:6a00:10ce:b0:7ab:8d8a:1024 with SMTP id
 d2e1a72fcca58-7c3ee197dfemr2897250b3a.7.1763631004085; 
 Thu, 20 Nov 2025 01:30:04 -0800 (PST)
Received: from archie.me ([210.87.74.117]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7c3ed379558sm2106554b3a.25.2025.11.20.01.30.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Nov 2025 01:30:03 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
 id 5E84A41117C8; Thu, 20 Nov 2025 16:30:01 +0700 (WIB)
Date: Thu, 20 Nov 2025 16:30:01 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jim Cromie <jim.cromie@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
 jbaron@akamai.com
Cc: ukaszb@chromium.org, louis.chauvet@bootlin.com, linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 04/31] docs/dyndbg: explain flags parse 1st
Message-ID: <aR7fmRgNmP60RJZz@archie.me>
References: <20251118201842.1447666-1-jim.cromie@gmail.com>
 <20251118201842.1447666-5-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tNRZFCgC3+laadDu"
Content-Disposition: inline
In-Reply-To: <20251118201842.1447666-5-jim.cromie@gmail.com>
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


--tNRZFCgC3+laadDu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 01:18:14PM -0700, Jim Cromie wrote:
> -
> -A match specification is a keyword, which selects the attribute of
> -the callsite to be compared, and a value to compare against.  Possible
> +Note: because the match-spec can be empty, the flags are checked 1st,
> +then the pairs of keyword values.  Flag errs will hide keyword errs:
> +
> +  bash-5.2# ddcmd mod bar +foo
> +  dyndbg: read 13 bytes from userspace
> +  dyndbg: query 0: "mod bar +foo" mod:*
> +  dyndbg: unknown flag 'o'
> +  dyndbg: flags parse failed
> +  dyndbg: processed 1 queries, with 0 matches, 1 errs

The snippet above is shown as long-running paragraph instead, so I wrap it
in literal code block:

---- >8 ----
diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentat=
ion/admin-guide/dynamic-debug-howto.rst
index fd3dbae00cfc60..7690287cbe0c79 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -112,8 +112,8 @@ The match-spec's select *prdbgs* from the catalog, upon=
 which to apply
 the flags-spec, all constraints are ANDed together.  An absent keyword
 is the same as keyword "*".
=20
-Note: because the match-spec can be empty, the flags are checked 1st,
-then the pairs of keyword values.  Flag errs will hide keyword errs:
+Note that since the match-spec can be empty, the flags are checked first,
+then the pairs of keyword values.  Flag errs will hide keyword errs::
=20
   bash-5.2# ddcmd mod bar +foo
   dyndbg: read 13 bytes from userspace
@@ -122,9 +122,9 @@ then the pairs of keyword values.  Flag errs will hide =
keyword errs:
   dyndbg: flags parse failed
   dyndbg: processed 1 queries, with 0 matches, 1 errs
=20
-So a match-spec is a keyword, which selects the attribute of the
+Hence, a match-spec is a keyword, which selects the attribute of the
 callsite to be compared, and a value to compare against.  Possible
-keywords are:::
+keywords are::
=20
   match-spec ::=3D 'func' string |
 		 'file' string |

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--tNRZFCgC3+laadDu
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaR7flQAKCRD2uYlJVVFO
ozygAQDeqV2+eAL925SBI3I8R+CQGvz0yTuUJJ9a6KUiNhCDDgEAsMy6wTgxalgk
ymAwck6TVuSNIyI5PoEJGZv83FrVLgs=
=wp6p
-----END PGP SIGNATURE-----

--tNRZFCgC3+laadDu--
