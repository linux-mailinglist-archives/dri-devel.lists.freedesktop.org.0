Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B822263EB2
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 09:25:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 751F789E9B;
	Thu, 10 Sep 2020 07:25:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB3CA89E9B
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 07:25:55 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id v23so6893167ljd.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 00:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=Up8ILegzjASwEeOJMKzFYfDKZEx54PY3tNi97ngLN9A=;
 b=g1AwxbhHa0T6CE5FmUbL7iFyfRFzspCW/jkYn92D9b1XoAW04/z4bBPz/3wVx1MyiP
 miHMj7dQ5RqkqJq3l+fQGiqjNGavFKratWgckwGkMM3uqV/cOL6tOPnMimukuElem+r7
 TpSnrpdMM2H8vXnLBx6tSzWyB8iAr260YWwJaKK0MQAHCX5A9RRRJH+U2fj1Yhvz2Mq3
 Dy0Dpoubzk9ovTh5kRPEldtBId6x2qlwbKO1CRP7SH8TCh3wtsKkx1f1mhpFni9C93ch
 sA7ZE9I/HTV8NdWMBMRmo1NNp6ts5g1eZDIbNsxDB6iEsu6RNYbdwTnfZOn2VUwnqH3G
 /28Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=Up8ILegzjASwEeOJMKzFYfDKZEx54PY3tNi97ngLN9A=;
 b=U58GkJ668mXZ89YWw3dU2CfT90syIHa0LA+Qt11G4j68x9t8MNfEkptsN5zC7tFP/l
 UJguK1BU+jtM2eHoxXoJ0f1WldNYwsJ5apqSJ6zOwpbsd/c+H0q4Zg9y7jqSXl3SJC9d
 ET3M5ckBeN3697ihvJw/2BxQWO4DPZKxLH1nYyY6zU9/A5CqvJPTg3Gef+dJRfKpzS4R
 pROnOkcxlEYQ7gMGeJLdy2pBpb1bXAKK05uaYzKQ4/b6pOx+eE5sqEf3LdCKgM3nKlNQ
 m6f8bTHycpOOWMDng0QtlgRGwauivPiTqbId8EpkfuA/1GQbC09cXRW7Yyp5u47M1mCX
 M5Rw==
X-Gm-Message-State: AOAM532GBCZnJdJxKPm+FKU0JN0kgQ4YS9jNHBW4p7r7x7os12ExjTZs
 Lohq2Oc2IgS4FF+o5yGRD1U=
X-Google-Smtp-Source: ABdhPJz7jEQ1pQQREKKtwk7ryMpEjwG99Q/b5wkTP5aVByCT03xF9G2L6QSQ4ichA8XRmUtyAR6q8w==
X-Received: by 2002:a05:651c:1352:: with SMTP id
 j18mr3558194ljb.343.1599722754137; 
 Thu, 10 Sep 2020 00:25:54 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id o24sm1356628ljj.49.2020.09.10.00.25.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 00:25:53 -0700 (PDT)
Date: Thu, 10 Sep 2020 10:25:43 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Subject: Re: per-plane LUTs and CSCs?
Message-ID: <20200910102543.11dc9fe0@eldfell>
In-Reply-To: <20200909105727.f5n5c6zudx2qyz2f@fsr-ub1864-141>
References: <20200909105727.f5n5c6zudx2qyz2f@fsr-ub1864-141>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="===============0474935346=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0474935346==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_//jn6zmcFb7crRZmTPDMR5FE"; protocol="application/pgp-signature"

--Sig_//jn6zmcFb7crRZmTPDMR5FE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 9 Sep 2020 13:57:28 +0300
Laurentiu Palcu <laurentiu.palcu@oss.nxp.com> wrote:

> Hi all,
>=20
> I was wondering whether you could give me an advise on how to proceed fur=
ther
> with the following issue as I'm preparing to upstream the next set of pat=
ches
> for the iMX8MQ display controller(DCSS). The display controller has 3 pla=
nes,
> each with 2 CSCs and one degamma LUT. The CSCs are in front and after the=
 LUT
> respectively. Then the output from those 3 pipes is blended together and =
then
> gamma correction is applied using a linear-to-nonlinear LUT and another C=
SC, if
> needed.
>=20
> Currently, downstream, we have all those CSCs and LUTs hard-coded into a =
header
> file. Based on the colorspace, range, gamut selected for the output and/or
> plane input, we pick up the right CSCs and LUTs from that header file to
> configure our pipes... I guess this solution does the job, userspace does=
n't
> need to care much about how to generate those tables. But, it's also not =
very
> flexible in case there is an app smart enough to know and actually genera=
te
> their own custom tables. :/
>=20
> Looking through the dri-devel archives, I've seen that there was a tentat=
ive to
> implement a more or less generic per-plane LUT/CSC solution but it didn't=
 make
> it in due to lack of userspace consumers...
>=20
> Adding CSC and degamma LUT properties for each plane as well as a gamma
> LUT and CSC for CRTC, would help get rid of the LUT/CSC header and rely
> entirely on userspace to fill in those tables. But userspace has to know
> how to generate those LUTs and colorspace conversion matrices in the
> first place...
>=20
> So, how should I continue with this one? Any pointers?

Hi,

I can't help you, but I can say that we are currently in the process of
designing a color management and HDR extension for Wayland, and I'm
sure in the long term I would like to use per-plane color space
transformation features of KMS in Weston eventually.

IOW, one more userspace that is going to be taking advantage of such
features as long as they are not too driver-specific.


Thanks,
pq

--Sig_//jn6zmcFb7crRZmTPDMR5FE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl9Z1PcACgkQI1/ltBGq
qqfdgQ/6A+VtgCiZF6O84tF5hGVuyRU/SBpa23wj43cPnNTsepEqFGEnGA+NQPoB
PNxrmY2Y/l60zFn/hVxRPrs9C/qc7J5bczv5FVHcInR5gIPLS9of8MRRdcvlvtzc
MPVRCEMtsyF+LUuwjyF20cr3+/3da405TuQawm46EljHxWjx03qBftRW7yOdgKn2
Q7L7HOGEJAFS1E1zzUGT44PuWEmXExghyRny1CMmEFkK6DFJC89jDKx9SsFm3j3z
JlX8pvdyYOvEAu3qzC4D/vBR11BYYdnVk+oEEhuPx1pR65OkQRpDAkSdTt7+z7s0
hFxTxYohb8GtF2nZ1JP38gUhet5XVOBNGnioEXcfsgf0a9Rr0bj0d5ZI41DBh6kJ
7Fy61baXMaEgX9r/O0n/FHbmM7uW+uwuqqJSMHhU7gfC2bO2NK6vU31tKUB9+nHu
Kpcef0Ao27gyhY8bSmG7SFvpv9TkcEGyxCcojdfoQ7TLKOsrMbVLf3alob1tEbvT
YE02lyAVSLAQEkc9zSEp0Wycpn9nLw7nzdzpjLN3ieNDlXnFM7ymTvXsEtHDsfcN
uRly9QDod6PbIEDk+YaxyaLe74/Q77YHBc/VHiOuFSE4L4fMsUm8vW4xLfdtxZ3D
TDyvG21sG99ETmieki5Cqqf3RRuohSpETwA3j1Ts6NIjdA7dflA=
=oN8J
-----END PGP SIGNATURE-----

--Sig_//jn6zmcFb7crRZmTPDMR5FE--

--===============0474935346==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0474935346==--
