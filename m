Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EAB612AAD
	for <lists+dri-devel@lfdr.de>; Sun, 30 Oct 2022 14:05:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98BD910E0BA;
	Sun, 30 Oct 2022 13:05:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 657C210E0BA;
 Sun, 30 Oct 2022 13:05:26 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id b185so8536845pfb.9;
 Sun, 30 Oct 2022 06:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=WW41LFvv02s6JX5NVuQc7KiMNpSe68lS8g/dJivUNoU=;
 b=nomg6wFSJ5x/qxj/PihlJa7vo5DnqvOZ39nSi6i5GoFr7DBdT/qdH4Xt+yYWQ1nMnC
 OHWnTvqHaQQrS/t8WgI4xo0sWstY6LiEFjEYFhdJefKF2AaqdqwAP16syN07opXw1WpY
 KqRklc2vTGh+vPmDlrkC5EOztZngdDEXtJRSYU0Z9cRLW5lRL6JtAVC215pRq4cZAf57
 fLhvWjRPGe0RZx8bdij6nbHMX586hHJxa16m7Bsh8seSth5krBSbvqCI7iJncOWmhTxn
 YjRudbdZk0KPwMWMiCEwn+r6BA3nUNXQ9tJoNFz68lDx4IIEfqwx+xVeeruNKhraGe5T
 q60A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WW41LFvv02s6JX5NVuQc7KiMNpSe68lS8g/dJivUNoU=;
 b=HW5Tf7gZNZky53Pt9CMs+xnMQrrBGXAMxwvEDuffchIabzl1SYvR8+Lg+U4UkZQ8FH
 hpKB4ddCBSoLHtj+ZUaUDaSgOC608SxvSMgEUz2QaClq/y153ITsOT5eazUNilUhgCga
 ssM3lWh9rmeF2U+HmSQcw4WBES2jcNqbxOzXmuWX0xXbf19w9i927tPia0CfUtj1SuBS
 RC4XPnX0BuLmuWQ6eOiUuHsk9JdovLSFsQLEXaWgBfdVhy5l1f6uyvCwSb5V9JBZwzMS
 QQKxBXKf/DN3i1xFmVHr2/Ibdn+gMxRJHdvUgBMQRtYWjczki+90tbTBGAfXeNDmb1XF
 SmAw==
X-Gm-Message-State: ACrzQf1CbFMteuntFrIsiDhMp+h0gBlIWRHTONzxE5B5SrwiDJ/NgFtG
 gtcriL64WH8dm32hoyrBnGg=
X-Google-Smtp-Source: AMsMyM6Vg1M282U7rq1qWngHa7fThDW+JjuXm6gWpQFPfhnBf3DpRaBvnxRenQF98WH5W3A0TcF/9A==
X-Received: by 2002:aa7:809a:0:b0:567:6e2c:2e2a with SMTP id
 v26-20020aa7809a000000b005676e2c2e2amr9201502pff.56.1667135125924; 
 Sun, 30 Oct 2022 06:05:25 -0700 (PDT)
Received: from debian.me (subs03-180-214-233-87.three.co.id. [180.214.233.87])
 by smtp.gmail.com with ESMTPSA id
 k76-20020a62844f000000b0056bbba4302dsm2589533pfd.119.2022.10.30.06.05.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 06:05:25 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id 6B927103D98; Sun, 30 Oct 2022 20:05:21 +0700 (WIB)
Date: Sun, 30 Oct 2022 20:05:21 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: antoniospg <antoniospg100@gmail.com>
Subject: Re: [PATCH] drm/nouveau: Adding support to control backlight using
 bl_power for nva3.
Message-ID: <Y152kbkeIFnz/cbE@debian.me>
References: <20221029184851.25340-1-antoniospg100@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zkq+an0wUo19EgpH"
Content-Disposition: inline
In-Reply-To: <20221029184851.25340-1-antoniospg100@gmail.com>
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, linux-kernel@vger.kernel.org,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--zkq+an0wUo19EgpH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 29, 2022 at 03:48:50PM -0300, antoniospg wrote:
> Test plan:
>=20
> * Turn off:
> echo 1 > /sys/class/backlight/nv_backlight/bl_power
>=20
> * Turn on:
> echo 0 > /sys/class/backlight/nv_backlight/bl_power
>=20

You sent this patch twice, so I reply to the latest one.

What is it doing? Please describe the patch. Remember to write the
description in imperative mood.

--=20
An old man doll... just what I always wanted! - Clara

--zkq+an0wUo19EgpH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCY152kQAKCRD2uYlJVVFO
o8dmAP9B8377yd62wSurH1C9reAvl5ipEFFQbVFG+b2Zayub9QEAlnaK7b5XMN4r
j9L4LEizVKSH/X8VQj5nEP93wM/Oaw0=
=hrUz
-----END PGP SIGNATURE-----

--zkq+an0wUo19EgpH--
