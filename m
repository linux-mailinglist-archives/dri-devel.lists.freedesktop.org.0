Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0EE244AEB
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 15:55:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E75A6EB5A;
	Fri, 14 Aug 2020 13:55:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF4A86EB5A
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 13:55:01 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id p20so8452468wrf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 06:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=BrCn7ZoPEG6krMBOO2DCLO1ql4+YYATN0sOyAU97aU4=;
 b=KuE007y6J0Ps4p06fQy84atoqaqkPcKKToON6td5BDSKtl8grhDinK8Tk9i9oHVPDH
 TwMWIX34sFWKoHsrwSRrcTheurTVqyZpO7f6Gtpolwxj+EWd/nLlMdbvCMZ9qf92yXux
 EjwL09XO3NG/jjvZJBDedWS5NsEIirK9ZOYKmmgzJMIZ8+nTZEYDFSARAjPgxbvzVQjs
 H4jwZ1ullwrsId44xlsBGCP8lgLGQNA+fQFNK1/Cfa45KT7rUOjPGWd4L4FBRIhc/jIZ
 5xmHPnLX7KVOOMpsvXwPse1zY2kRIb5X4UJo32lMV3v+QNDfwtUH9hT/CfCnPPKtCcmm
 7Q0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BrCn7ZoPEG6krMBOO2DCLO1ql4+YYATN0sOyAU97aU4=;
 b=TXKUhETNrhCgZQnCmIC0hZPRXs6OkH1btisoQNRUu4o6+3rtSFPqIxT9M1LUQ4tqs8
 8WUX/08nb3daHkf5Z8AFzCFz09Di/sEeCGxsiMgwpK10zsh6BLvjZRSI7xrNJCfZgDze
 iSC1l17DGtksxDjbPWUeKukicl5qSvD4xP9+VOetYxqqXGL1le49t1nsbD6Ad2PEa1Ws
 6LidrGAhZmwshYnzl03n9g8EJjR3zhBNbGEgwoDHd/AQ6iTndk9JSyk3UuEv69hmYG63
 /8uktArl7IA1ri+bM3ab4oorK1kOIQ4tVmLpPuOjLTmGcZrbgeOW9chz5hBgufvqmchF
 KTfQ==
X-Gm-Message-State: AOAM533TMGg7ftMWmnyMIoH7rYXcKvvIvK27m7NEKCiGOQtmbX7ggvoR
 piL6rvpB0O1qAE3yYXdGpkc=
X-Google-Smtp-Source: ABdhPJyLSKaGJy4PY6QCpAZ3JiXl+xuU0ZQDU7p4hF/D9UVUE076WSw6SKo5Xvg5zd/7jV8iPerTIQ==
X-Received: by 2002:a5d:56c9:: with SMTP id m9mr2773654wrw.311.1597413300497; 
 Fri, 14 Aug 2020 06:55:00 -0700 (PDT)
Received: from localhost
 (p200300e41f10ca00f451c56750ebc625.dip0.t-ipconnect.de.
 [2003:e4:1f10:ca00:f451:c567:50eb:c625])
 by smtp.gmail.com with ESMTPSA id p3sm14484452wma.44.2020.08.14.06.54.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Aug 2020 06:54:59 -0700 (PDT)
Date: Fri, 14 Aug 2020 15:54:58 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: [git pull] drm for 5.8-rc1
Message-ID: <20200814135458.GB556087@ulmo>
References: <CACO55ts2AHgDNZKBvoU8NZf26V8BJDGkKiapY=1xaUQ1DrC8SA@mail.gmail.com>
 <CACO55tvF0dOQ=myUpccmfHc+hCVQZoXQnCA0iHeXQo3B=UaD0Q@mail.gmail.com>
 <CAKb7UviVa32hWv+y+_kwbZzkJAxKcWr1RPCgkGt-mi=uayUKyw@mail.gmail.com>
 <0e882aa7-d0ea-19b0-a13d-4f7bc0d384aa@nvidia.com>
 <CACO55ttP_J8riS_PhCG+-Br+AvsYKRTLg_+wn2pXF9kgXkmjeQ@mail.gmail.com>
 <785eb70c-d9e7-dbdf-b044-337618fcea1a@nvidia.com>
 <20200812174005.GA1705@kevin>
 <2c5cf2e8-afd2-446d-1f27-2c225c65d447@nvidia.com>
 <CACO55tto89kT-_QKGjQ50Ht8U-4Dop6sTjNsbr1qHXhgNuDHEA@mail.gmail.com>
 <CACO55tu1RWZ0ZGcMcrU-snT3CkJtwxawwJ9990-5a+hpByh-Hw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACO55tu1RWZ0ZGcMcrU-snT3CkJtwxawwJ9990-5a+hpByh-Hw@mail.gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
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
Cc: Daniel Kolesa <daniel@octaforge.org>, James Jones <jajones@nvidia.com>,
 Thierry Reding <treding@nvidia.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============2142285882=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2142285882==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tsOsTdHNUZQcU9Ye"
Content-Disposition: inline


--tsOsTdHNUZQcU9Ye
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2020 at 03:00:37PM +0200, Karol Herbst wrote:
> At least for now I've created an MR to revert the change:
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/6300
>=20
> But it seems like there was probably a good reason why it got added?
> Happy to have better fixes, but that's the best we've got so far I
> think?
>=20
> Thierry, what do you think?

I did find the following via my mailbox (finally collecting all those
emails is paying off =3D):

	https://lists.freedesktop.org/archives/mesa-dev/2018-May/196026.html

Cc'ing Daniel on the off chance that he remembers what the use-case was.

I vaguely recall that Daniel was pointing out an issue on IRC that
caused a series of fixes, including this change. Given that this was all
done because of framebuffer modifiers, I think my earlier hunch about
this being related to the case of non-modifier userspace is correct and
we do run into issues with userspace that doesn't use framebuffer
modifiers at all. In that case we basically have to assume pitch-linear
because userspace will use DRM_IOCTL_MODE_ADDFB, which doesn't support
modifiers.

Thierry

--tsOsTdHNUZQcU9Ye
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl82l68ACgkQ3SOs138+
s6EvNQ//RsZVBQpkzn4WD4NUYesenZAW4Zno1SP2wdZXGkCC8s1yyGbnJQlvhpmv
FSvjycYsLLRscBvqkPAOmiTNmPQ3GABzIQcu3mk/1gljKpqDRifBu8zwTSGEgcet
IowjIje5DqN87hXJvCLtWqruEnhqLSwHUt+STqNWhfhXRy9czwAa0SnzX0l90eq4
LBNfzd7zZVAZKvyCr1y4wiGdWREPvP+PYmoFrmtFtdQyQJWdEqjVU1dV3y6aAVYM
XJPrw9T8rP3OrcRrVpip9tmnaps+dcBOTjWxY3eq5QdPNew9HP9P2jo6fSNpSQB9
vp/EIIpb6w17mKzRT5NPjQ22sCincvUkjVAD7vGqrnORq+ynh8jLQLPWm3wlywqj
rEvWHghMKxIH3NybMiBuUPxV6YcYmeo/ObprNAKLfDklhhVY/K3V3sTXE/45bsV+
BcMpeahUCgzeohBmYD4vJiY3nB9FxQNln8399/5gXXCVdyYh83fGagqpLnza3FXv
YZzoPd4TZ55/SajhOT0eKcZs6ZADzgcMkn/zLtCs4SmFRYfk+HK0UXqJDSrJSaS8
nxaCFH/olBtNc42SRVn2HsBWshtAyJIRaQBAAdtjZQUzzXBvViTgqxhiGNKpzqOS
uczfgQ1Jsy5Borv0Pg3/l5Yy/dgGfPzYEI+M5VFoKq84Mavd5RM=
=YQ8B
-----END PGP SIGNATURE-----

--tsOsTdHNUZQcU9Ye--

--===============2142285882==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2142285882==--
