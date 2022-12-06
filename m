Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8427B643C3F
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 05:26:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6A1610E09A;
	Tue,  6 Dec 2022 04:26:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3E7A10E09A;
 Tue,  6 Dec 2022 04:26:34 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id s196so12348347pgs.3;
 Mon, 05 Dec 2022 20:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=JFzSwj2UsOfE/ApheojhszW7qAncTn0zPiyeo2+89Kk=;
 b=XICQdXQkpUQT1aoGftgoROTd8PONW3R4QpgVai+2MlM4c9XQJ/upAeyi5101p5dgdZ
 S3jo1DDu2qVWJK2zglerOVEqdt5xkZqh8zWsXM9TTab2ohNMyXB1weI9UjRdQIMAWNyN
 78ExsxMF4fro2PuD3o0168ZRjOzJDzhACZfkHvFB294AqYwliFtm9hxV/mrUQvTe6jlx
 jjpabSy3+DBlklbPX7E/ODzego8ng7fpNA2BaOBPpPFotiQ31nDMVsTAvAp+fx2ZDnQJ
 KPS4x3lCvjv2UbD2sG9fX7UqaZVff0ew5Zu+va0mNkGjccRoVtk/8Ilw1YZRdidnw2EV
 /3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JFzSwj2UsOfE/ApheojhszW7qAncTn0zPiyeo2+89Kk=;
 b=lZlEIxkP5/hCI2yBO3/MYeY0bn1XmhCf5kFicVuhoDPwOZPeRTmckUai8I1nzgh6UN
 /RET3uKSOVL1JwtGBIOI6HKScpaaC00sj1Qx28n4U8PS59IsfSwrlcj9uuwm8LNKxl8i
 gdcAzYRz1TfJJV2BMcfOuLnXrJmbCgak3yx1raZT07VkUMO3m+3vawjk30Tzv1QDpzB6
 8zCj0mU1aadr/gsTOmaKaKYmLH2Hsv8KJaBR+rShabvWl0wY3K+B71uT4EPguSuGLK4q
 lCqVTxQpAvo0bCjwGivQzunKOqC8NvuSklUqmdX4WIEQU0RYmkRxQcNSMtO1H8b3pId0
 MA5A==
X-Gm-Message-State: ANoB5pkP6OZipFyx2CRB75HF5PSNjyKklByFULkbOexvvxnLQSbs6z+2
 w0s1rjLWj+JPDu5bVbjIoXQ=
X-Google-Smtp-Source: AA0mqf7reR0SU5yUtiMz2X1QKMVhlZRiIcEgIP368SeRykiQ3SYIx0fzWgW/LhkTGahui+owekhlEA==
X-Received: by 2002:a63:4910:0:b0:478:27a1:8602 with SMTP id
 w16-20020a634910000000b0047827a18602mr35307639pga.9.1670300794206; 
 Mon, 05 Dec 2022 20:26:34 -0800 (PST)
Received: from debian.me (subs02-180-214-232-2.three.co.id. [180.214.232.2])
 by smtp.gmail.com with ESMTPSA id
 q5-20020aa79825000000b0057458d1f939sm10626301pfl.152.2022.12.05.20.26.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 20:26:33 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
 id 9D29A100AD9; Tue,  6 Dec 2022 11:26:30 +0700 (WIB)
Date: Tue, 6 Dec 2022 11:26:30 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm/i915: use sysfs_emit() to instead of scnprintf()
Message-ID: <Y47Edh3g+Ld9gFnt@debian.me>
References: <202212011053265568903@zte.com.cn>
 <878rjm2kfm.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GjOSs0npbigzXBmw"
Content-Disposition: inline
In-Reply-To: <878rjm2kfm.fsf@intel.com>
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
Cc: tvrtko.ursulin@linux.intel.com, ye.xingchen@zte.com.cn,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--GjOSs0npbigzXBmw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 05, 2022 at 12:50:53PM +0200, Jani Nikula wrote:
> On Thu, 01 Dec 2022, <ye.xingchen@zte.com.cn> wrote:
> > From: ye xingchen <ye.xingchen@zte.com.cn>
> >
> > Replace the open-code with sysfs_emit() to simplify the code.
>=20
> I was going to push this, but noticed the function has a third
> scnprintf(), and the last two play together with count. It would be
> confusing to have a mix of sysfs_emit() and scnprintf(). The third one
> can't be blindly converted to sysfs_emit() because it writes at an
> offset not aligned by PAGE_SIZE.
>=20
> So I'm not taking this.
>=20

Hi Jani,

Fortunately you'd NAKed this patch from ZTE people, which are known for
ignoring your (and others) patch review. Remember that they were used to
send from cgel.zte gmail account [1], which after the address was banned
=66rom LKML, they tried to send from their own corporate account but Greg
suspected that emails sent from them are spoofed [2].

Thanks.

[1]: https://lore.kernel.org/lkml/878rn1dd8l.fsf@intel.com/
[2]: https://lore.kernel.org/lkml/Y3NqyDDGz%2FUKPgxM@kroah.com/

--=20
An old man doll... just what I always wanted! - Clara

--GjOSs0npbigzXBmw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCY47EcQAKCRD2uYlJVVFO
oxNvAQDaz4sHLhHTfDnNNN7CRci/KWUK4z2C2t7Vn5cKoqxhmgEA+C9pOLMOG6ta
PuwUxC+yGaNiCvAepAumTZ4XSesIDw0=
=i0Fp
-----END PGP SIGNATURE-----

--GjOSs0npbigzXBmw--
