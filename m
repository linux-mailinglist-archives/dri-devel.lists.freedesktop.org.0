Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4510C7A42F5
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 09:40:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CE0810E1C8;
	Mon, 18 Sep 2023 07:40:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C6AA10E1C8
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 07:40:22 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-68fb46f38f9so3589169b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 00:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695022822; x=1695627622; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jYE1PmwGI48qu45rnC2t2CT34fWKqdW5IxOG5V0vDZU=;
 b=CEl/jeOLDS5LqcEsAsAeSQ1J7RtYP88VtdpPLFAtShgZnOabhr+AXJczwUDC5vyesJ
 gY4uwfZdTLVTETeUtEmR6K5/MltWvOvOVadcWfCp+YD79oJ8UBshZ7chb/InyOs90goN
 3BCEotXaIIzd5glDqI0X8th9ukstFhnLo5zZE5KKLKgwBz2AeXOWNn6TmFRJ+2+FjwDO
 SZcZ7Q+6qLUmCIK3MIhJykQNeFwLauhqqWh9HaDEJTc8pLRh/gy/jmPY4zBCOo84Bi0X
 8pijsu/CZIpeeWZVVhfmgpZIvB7CxX5kjeJBCcly7DN3psuHK7bKBSABRBNaI7I3aUzB
 qTCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695022822; x=1695627622;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jYE1PmwGI48qu45rnC2t2CT34fWKqdW5IxOG5V0vDZU=;
 b=D+OEq0GEFmQ6agZZxaFJOkRpVq1cIbryhjYEe9qUNoXFTvMe4tzPRemGjFRf3Dr5/B
 GBL91FXnKm7TSQc6r1nqI865CQtR1w1WRB5vIHZcv2ikZdN3jJtaRtvOCXOhbWV/elu2
 TTtpBCGNsf0Scdfd67esUpVFdTkCmIRkekd0w5uLLAGlaW4qRSYOJawjTv2D74u0nQaS
 Mi9uA9d//bNFm+BHKzULOqAZZbOCSlPB8Irfrr+U8RmbH2k6nOispzQqo7U8uog5ONih
 YlPMQj8YCteiOah2/VpAvCBeWG6Uxu72GxhS72i80h8wW/MO19/GD0b6PxHjeI/C5PkJ
 D3lw==
X-Gm-Message-State: AOJu0Yy4Rtj5RIsrcuN5VkzWxJBW5lnkxwTR7j2YH0gfZrwTjX8Od+ai
 JTG0wq4Emv2O0pk0LYMNfMI=
X-Google-Smtp-Source: AGHT+IFBY9iVIRBuVg6dN+6n28kVZBaQ3QpU3pvyd80I1f86lsgh4AzZzEITsYThn6COBiwc+ysWdg==
X-Received: by 2002:a05:6a21:3e0b:b0:156:e1ce:d4a1 with SMTP id
 bk11-20020a056a213e0b00b00156e1ced4a1mr6476863pzc.9.1695022821893; 
 Mon, 18 Sep 2023 00:40:21 -0700 (PDT)
Received: from debian.me ([103.124.138.83]) by smtp.gmail.com with ESMTPSA id
 k7-20020aa792c7000000b0068be3489b0dsm6827221pfa.172.2023.09.18.00.40.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 00:40:21 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id 941E480D9E27; Mon, 18 Sep 2023 14:40:18 +0700 (WIB)
Date: Mon, 18 Sep 2023 14:40:18 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jaak Ristioja <jaak@ristioja.ee>, dri-devel@lists.freedesktop.org
Subject: Re: Blank screen on boot of Linux 6.5 and later on Lenovo ThinkPad
 L570
Message-ID: <ZQf-4r1K1Dx_LQ5t@debian.me>
References: <7c50e051-eba2-09fc-da9f-023d592de457@ristioja.ee>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="t9fjxRqYgtt2EzW7"
Content-Disposition: inline
In-Reply-To: <7c50e051-eba2-09fc-da9f-023d592de457@ristioja.ee>
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
Cc: Linux Regressions <regressions@lists.linux.dev>,
 Huacai Chen <chenhuacai@kernel.org>, javierm@redhat.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Ard Biesheuvel <ardb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--t9fjxRqYgtt2EzW7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 13, 2023 at 03:02:26PM +0300, Jaak Ristioja wrote:
> Hello,
>=20
> Upgrading to Linux 6.5 on a Lenovo ThinkPad L570 (Integrated Intel HD
> Graphics 620 (rev 02), Intel(R) Core(TM) i7-7500U) results in a blank scr=
een
> after boot until the display manager starts... if it does start at all.
> Using the nomodeset kernel parameter seems to be a workaround.
>=20
> I've bisected this to commit 60aebc9559492cea6a9625f514a8041717e3a2e4
> ("drivers/firmware: Move sysfb_init() from device_initcall to
> subsys_initcall_sync").
>=20

Thanks for the regression report. I'm adding it to regzbot:

#regzbot ^introduced: 60aebc9559492c

--=20
An old man doll... just what I always wanted! - Clara

--t9fjxRqYgtt2EzW7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZQf+4QAKCRD2uYlJVVFO
o1LjAQCyinSeRmWO5M3jxuESwFV9c/eJAgHm+YsA35cHfR8mBwEAsDAhYG4Bnm8h
/2YyuCaC0lYoTEIdf+2AEN/OKWxH9QA=
=hSUf
-----END PGP SIGNATURE-----

--t9fjxRqYgtt2EzW7--
