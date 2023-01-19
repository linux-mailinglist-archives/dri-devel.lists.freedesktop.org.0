Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7057673D26
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 16:10:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E68010E975;
	Thu, 19 Jan 2023 15:10:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 353D110E975
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 15:10:11 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id v10so3202840edi.8
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 07:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b3hWPa5eaE1VlRQVh/vMNXzrQxeXSBHyXqQOtX9y708=;
 b=e0fz5LvLSsENChDm0SAC0yL0oNM0POBFQiCdbDweehEDuMJIEONyAGgtdUPGFCiqqR
 Id/h6C/GazpqSxZamu9mjDNvex5dlA4fvF0jc+PtHw3gABqKvJPtUMEVkOcXcj8J1AAR
 PLnRLIaYYudfxKXoyTbYwC728sbH/Vp/SYtuqM2fpiS+nF//YyLm6+ZVhWrxrT4Q0hRY
 a0hOqlk1Pq1a/Ske4YxV88ZkoibTzl5/lm2iQWzGROYUNhTFj+PXvZ5oyDZul+1npUtc
 /aWgddo2LOXbI2ntusjEDbihUUDWi123jkrB+cgnn/akq4wL7jLWwAljnm3yAd/mP764
 vDEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b3hWPa5eaE1VlRQVh/vMNXzrQxeXSBHyXqQOtX9y708=;
 b=iLio8Pe9VhjjMIhbEHfGqvYBg0hQ6Csp+OEkAduB5h5dC5gjr444kxoa/InUB2PkX1
 4EmVgK4l7bIrrjQ775Dijvli1L3p5U0cXhfk//hxynkuoI6x6q9euXN/kwuNO4ne+jhO
 pHEQdUId7N9UoWeArf81ObjDguKwPh3ro/tRRAjkB5wUJmBMusp8EWPwGLqGS/kv8VVb
 p9pMxUuDc5M2NeemABcsvMN+JAKEnalsNkJvnLlN4ASDj3IMTNP5fruPJDchSGp7Tw8O
 aHbDN2hH2SP6810OaC5RuHDWibh5M1dStW7YvBahlggg0k/a2udwkSoclx7C1RhzuBMz
 2v6A==
X-Gm-Message-State: AFqh2krGEGppiXPphw289phxY3s8c+FBinJaJjCe+qqlOIV7+SOhhPez
 rSQbmom1yin9Q64SEBNFeoM=
X-Google-Smtp-Source: AMrXdXsTwyv07suDfVAoeVH9mB1DXCTlXvaAj3SNIzmRc1ujB0XCruBScq2XQFPO2DZi0mB2a8FvoA==
X-Received: by 2002:aa7:c994:0:b0:499:bf81:be6 with SMTP id
 c20-20020aa7c994000000b00499bf810be6mr12264790edt.37.1674141009481; 
 Thu, 19 Jan 2023 07:10:09 -0800 (PST)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a1709063ec900b007c0d6b34d54sm16278717ejj.129.2023.01.19.07.10.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 07:10:08 -0800 (PST)
Date: Thu, 19 Jan 2023 16:10:07 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 8/8] arm64: tegra: Add simple framebuffer on Jetson
 Xavier NX
Message-ID: <Y8ldT2CdwFpNAZoB@orome>
References: <20221117184039.2291937-1-thierry.reding@gmail.com>
 <20221117184039.2291937-9-thierry.reding@gmail.com>
 <12cff1b1-b8dc-7fb4-2228-8af4b30c09c5@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bQw0EXWTigETpFy5"
Content-Disposition: inline
In-Reply-To: <12cff1b1-b8dc-7fb4-2228-8af4b30c09c5@suse.de>
User-Agent: Mutt/2.2.9 (2022-11-12)
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 David Airlie <airlied@redhat.com>, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--bQw0EXWTigETpFy5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 17, 2023 at 03:55:21PM +0100, Thomas Zimmermann wrote:
> Hi
>=20
> Am 17.11.22 um 19:40 schrieb Thierry Reding:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Add the framebuffer carveout reserved memory node as well as a simple-
> > framebuffer node that is used to bind to the framebuffer that the
> > bootloader has set up.
>=20
> I don't know about the current status of this patchset, but feel free to
> send whatever update you have.

Sorry, got side-tracked a few times during the last few weeks. I've had
to rework some parts of this for the recent changes to the format
helpers, but nothing major. I'll send out the updated version shortly
once I've tested all cases.

Thierry

--bQw0EXWTigETpFy5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmPJXU4ACgkQ3SOs138+
s6Hlww/+IzPc1AX147Ir+grpgjfk1Xmbl2ycd89CjRpRo6yWlN4RZ8Yuc9D8nWjI
oed/TJUnvyih1nZwL6OrqR2m1H9yo2fE10w9bRCTO4dde/4p0H+8oKJbOSyLnzFk
y7e7QaJXGqZWOj9wl6g1ba1aqnRPsucDfpwXQcf8xHuhcHuZZtBAJCAJ6sV6aC97
+2IGqM6ExaLhEw8CIB6EFpl2r/SA0ig/qrEQhZ/YqqZNw/TShUlNs++C1HH9CN3X
hVMBe4IoK28yuAfg+P95ESHdF3V9sqi4j9bUtc7cpTFu2+7HwRBzeePA0bEtsMIm
AKknYPEM+fKfT0K2MrcAm9VNzGLaFhuAaq20O5VK/cm1SCCBCMEgpyw38w51pOBh
P6i+zZHDub/lRsPP/mOfM1yKD9HvbKLMH4jsKnhivD1o3eMOY3XWC6mpCXjyXlaV
4kB+EdmcLB/a9rFU4YClFIASgeruC6oQOyfcKgAXpFer9FarKzyxLGjNNUnz4eHw
QTucGI0Lwzubyws7HfhFgbexIRHQrI0U3iSJ7j9dc9iiC6V8Nu9pkvQQuBfLU62B
D0VyuqOp/Y7sVFQL7fLIqXVrJ9wr/IrmDRVo3ylbQX8Xs4AoqtGyQwUTd/59Jsb7
MoYbuKJPP+qQBesE2cY2hhS+LfpIIP5RdP2VUe6knqEA8ercDRI=
=c2qP
-----END PGP SIGNATURE-----

--bQw0EXWTigETpFy5--
