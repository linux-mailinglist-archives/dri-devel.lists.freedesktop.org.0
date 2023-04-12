Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3B26DEA43
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 06:17:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72BD410E145;
	Wed, 12 Apr 2023 04:17:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5E5810E145;
 Wed, 12 Apr 2023 04:17:27 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id h24so10255004plr.1;
 Tue, 11 Apr 2023 21:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681273047;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hq/mTM6vqO5fl2BFqwBvgyto2iWy4lzSUp2jXy0gRvg=;
 b=RlIwUSvX9oZQhTPSDp7e+uIzThMoEzwTnlmdzri1CU8jQEHwALdI51Ah9ME0rf11m8
 7FBcjhBbnQsB2nj7UQ252Cm2VovvzUnIWs5NgJC82dc2QEKzbvedLwHoBiYjteANduV+
 TncT6mBXRyL5H+gKtP2KFuRPMhbBxhVCoTAIt1QQX+T/AZW7Ds2+D659FZ2HTIDDXhBP
 XmFiCFMCMG6N9AaAfEkio6U97Kc4LEWSW170wVV1FfqW8wgH8c3AMGdwWUnWqbandO+L
 1IBoF+a+I0TrGwnCV20sM9chdMgodtRD9VNBAP/BH2ATfU6bnm4QwzC4ZO/WdJq3TNXb
 CGGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681273047;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hq/mTM6vqO5fl2BFqwBvgyto2iWy4lzSUp2jXy0gRvg=;
 b=ESRxqyeuRq0/lMny3k2ubbNz+xonLvDmndTGJmmhrvvJTP1FJQZi0maO1Q22f+shMW
 YVAxmCvsMCfHJj9dYZ9SPHKKQLIFIGSIxRjTWBoPHRJ15iVus9ovAJ60Sq7XSdbNvo9P
 VMjhkI7ij+smCN8Lot14l54ApMcvRfgXgtTMydqxS6oo1ZjtUOOc9owySoCCfWXivxTS
 Sef133Mf48mK38GUhd/3Epf1CENQlOQBOyK4BaPQqCWZOhl6VuqjcnaQpZcxKiemOcA/
 xoKWvMc9Tc0Q/jD6J+KJzKZz+9Hoy+ps+gLRNelLntVx+IEbvQei3TqQkb6qoMP+zhvf
 Jm1Q==
X-Gm-Message-State: AAQBX9cdwVGz9z/ltg9S0pPRn7V6Ek8z0qRjNYzQCQoWkpe3VuUjNMU4
 o6r57XFVv8o0OvK2Y5RpDvE=
X-Google-Smtp-Source: AKy350a1z06v0KqJPjvsjepiCUuBZua9rRdG2dJCxmd9vvnWAItbO2F6KpdEGZApvgHF1OZx5jWKFg==
X-Received: by 2002:a05:6a20:b705:b0:d9:a792:8e52 with SMTP id
 fg5-20020a056a20b70500b000d9a7928e52mr3986430pzb.57.1681273046927; 
 Tue, 11 Apr 2023 21:17:26 -0700 (PDT)
Received: from debian.me (subs03-180-214-233-66.three.co.id. [180.214.233.66])
 by smtp.gmail.com with ESMTPSA id
 x24-20020a62fb18000000b0062de9ef6915sm10571496pfm.216.2023.04.11.21.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 21:17:26 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id C07181068E7; Wed, 12 Apr 2023 11:17:22 +0700 (WIB)
Date: Wed, 12 Apr 2023 11:17:22 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: Linux 6.2.1 hits a display driver bug (list_del corruption,
 ffff88811b4af298->next is NULL)
Message-ID: <ZDYw0vVg7Y1oExJL@debian.me>
References: <6feae796-db3f-1135-a607-cfefb0259788@gnuweeb.org>
 <ZAGqet3U8AMm4Uf1@debian.me>
 <ZAOTU5CRwdEC1lGH@biznet-home.integral.gnuweeb.org>
 <87v8jetaik.fsf@intel.com>
 <ZAXT1B1GTlmA78Ld@biznet-home.integral.gnuweeb.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="riLMWEg/4LOAeueD"
Content-Disposition: inline
In-Reply-To: <ZAXT1B1GTlmA78Ld@biznet-home.integral.gnuweeb.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Linux Regressions <regressions@lists.linux.dev>,
 Intel GFX Mailing List <intel-gfx@lists.freedesktop.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 linaro-mm-sig@lists.linaro.org,
 Linux regression tracking <regressions@leemhuis.info>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--riLMWEg/4LOAeueD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 06, 2023 at 06:51:48PM +0700, Ammar Faizi wrote:
> On Mon, Mar 06, 2023 at 12:54:59PM +0200, Jani Nikula wrote:
> > Please file a bug at fdo gitlab:
> >=20
> > https://gitlab.freedesktop.org/drm/intel/wikis/How-to-file-i915-bugs
>=20
> OK, I posted it here https://gitlab.freedesktop.org/drm/intel/-/issues/82=
74
>=20

Hi,

=46rom gitlab issue above, I don't see any progress on bisection attempt.
Ammar, have you successfully boot Ubuntu 20.04 with v5.10 kernel and
test there?

Anyway, I'm adding this to regzbot (with tentative commit range):

#regzbot introduced: v5.10..v5.15.103
#regzbot title: Linux 6.2.1 hits a display driver bug (list_del corruption,=
 ffff88811b4af298->next is NULL)
#regzbot link: https://gitlab.freedesktop.org/drm/intel/-/issues/8274

(Also Cc: Thorsten)

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--riLMWEg/4LOAeueD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZDYwzAAKCRD2uYlJVVFO
o5/sAQCOZEp244paV37hHVVszEf/eKSIXWtgAAMsix36DcZ4pQEAkRjyNdxRZdYv
qEYxt6Z1lmleaN5i4eQGxbGF4VyCHw8=
=6JIi
-----END PGP SIGNATURE-----

--riLMWEg/4LOAeueD--
