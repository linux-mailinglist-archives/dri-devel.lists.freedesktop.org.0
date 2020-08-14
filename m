Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C899B244B10
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 16:08:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26F7B6EB60;
	Fri, 14 Aug 2020 14:08:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A624B6EB60
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 14:08:14 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id a14so8479672wra.5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 07:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ppDOyK1MuR9io+VXJSCAUHHjedAeDA1skELpo6wUwMQ=;
 b=d3Z2nX+HU7p5MmvuoSh2Ysl0hMF0etWIOnuc2iqAY8e7a0uw4/b5L+3ZwSK+csrXqx
 VMDI8EZ0hENpuliQj+9I96dmMKX1uk4VEHUwbKrIwP0dvc8yr45lhQMIMu9C5F7gMLHe
 JGke8kYTKGm7C8S0UD0jr9f0LYamfsr75+T1+4gDXScnUR8441RnLDGLGVY+noc0naxG
 XQNJJZXzgiWoa+lHGddnkaX6RinFfEXB8DynTuHQ351eqxtlkVRosONL2Fo0JmgDnDy+
 0PDsB2uIMHFY3F36NcZQi8icpreM6t+KSdr54qEnVDIL6itcK4itDX6W57tnVZDMhQGl
 GiLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ppDOyK1MuR9io+VXJSCAUHHjedAeDA1skELpo6wUwMQ=;
 b=G7xxXPYRBhfrzQ3Mn8gO0R9itOJ0MF0HEvMlAiHVxzQz6T/ZHAtmyegYr0Py/3XAGs
 9iEsS/RQbQeqBI2hlb/VBfDUUcaZTpyLli9m6lDBCrxZmmziQHhiS+mgNP3Il1SXeWOX
 YB5PV8gdNej4X9PwXZRWNy2MW9R35cMvhX0HlfDOAELQdbb6jTO3jze/BJtxfDP3vB5x
 0XVcxxQXKOk2JQtEuFxl5Dh3TsJAq1S0A/nkOggr1yB05ZJg4Gf4zLwoHvNxtK2Ywqdh
 9EkOXP0tNyqomR2eQzySmBZqZj0V26W204eAtDhCUMebLjdDimlHnrqdCPqap1/j93UN
 XP3g==
X-Gm-Message-State: AOAM532CQtGe8hRFg9WMMSE8MCNw8k/lkWZmmZO8NPFbIdDIEgjhck1b
 Ye+ECze47HpR8Xv+Ua9j85o=
X-Google-Smtp-Source: ABdhPJzdfMEbpPEi3QtQNdaQUTgSbLDh1xbCmSuWe+LW5kapBYf5vibX1u5qObMpm3ZTullQ3G9Q6Q==
X-Received: by 2002:a5d:51c3:: with SMTP id n3mr2956581wrv.104.1597414093262; 
 Fri, 14 Aug 2020 07:08:13 -0700 (PDT)
Received: from localhost
 (p200300e41f10ca00f451c56750ebc625.dip0.t-ipconnect.de.
 [2003:e4:1f10:ca00:f451:c567:50eb:c625])
 by smtp.gmail.com with ESMTPSA id g188sm16332189wma.5.2020.08.14.07.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Aug 2020 07:08:11 -0700 (PDT)
Date: Fri, 14 Aug 2020 16:08:11 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: [git pull] drm for 5.8-rc1
Message-ID: <20200814140811.GE556087@ulmo>
References: <CACO55tvF0dOQ=myUpccmfHc+hCVQZoXQnCA0iHeXQo3B=UaD0Q@mail.gmail.com>
 <CAKb7UviVa32hWv+y+_kwbZzkJAxKcWr1RPCgkGt-mi=uayUKyw@mail.gmail.com>
 <0e882aa7-d0ea-19b0-a13d-4f7bc0d384aa@nvidia.com>
 <CACO55ttP_J8riS_PhCG+-Br+AvsYKRTLg_+wn2pXF9kgXkmjeQ@mail.gmail.com>
 <785eb70c-d9e7-dbdf-b044-337618fcea1a@nvidia.com>
 <20200812174005.GA1705@kevin>
 <2c5cf2e8-afd2-446d-1f27-2c225c65d447@nvidia.com>
 <CACO55tto89kT-_QKGjQ50Ht8U-4Dop6sTjNsbr1qHXhgNuDHEA@mail.gmail.com>
 <CACO55tu1RWZ0ZGcMcrU-snT3CkJtwxawwJ9990-5a+hpByh-Hw@mail.gmail.com>
 <CACO55tsfV9pGijOF5F=dLqFhpXgPSArGHXa44Mt3eRBk7z-X=g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACO55tsfV9pGijOF5F=dLqFhpXgPSArGHXa44Mt3eRBk7z-X=g@mail.gmail.com>
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
Cc: James Jones <jajones@nvidia.com>, Thierry Reding <treding@nvidia.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0398746902=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0398746902==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="T6xhMxlHU34Bk0ad"
Content-Disposition: inline


--T6xhMxlHU34Bk0ad
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 13, 2020 at 05:39:39PM +0200, Karol Herbst wrote:
> btw, I just noticed that wayland with gnome-shell is totally busted.
> With this MR it at least displays something, but without it doesn't
> work at all.

Interesting, one of my typical test cases is to run Weston with a couple
of test programs (like weston-simple-egl). Those usually work. I'll go
run a few more tests to see where we are.

To clarify, is this gnome-shell/wayland issue happening with Mesa's
mainline, or with James' patches already applied?

Thierry

--T6xhMxlHU34Bk0ad
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl82msoACgkQ3SOs138+
s6EA4BAAkZ38VuGcZ0K1371h1u2R0wUt0Do11pi3wFJoszzmo/PVB/1DbViJzZ4z
uPFcwNGwvwj3RxVYZXfd0vLklS+V5yVpHAyNUupSystZHLdD3X+NyfLIlFqnbyPO
jziCFAM/fCbxmgNuOooD6l4938jZFsy7E6S/+4JC8nf1ixX+wexq3i541psbDtlA
lYDZYROYzvmZ1YuB1nGCuWKQohBNxHt+on35ARJyciUZfiEFnsmL+0DTOLuelfDq
1kl/YSnIv7igw28Mbo3HRTO3p6GAkVQtl7gh1qDGgIgAd1MNe5DEPEMD+3r4HQ+R
ZEO+wnmmGwOlzJFY6OX1czELKPH2Z7ntSgmekMUY9va0I4nFXn0hRLTdMBbuwVC4
DZdYo+69rJ9dYD1fUoWiHtisagSWTOA7kn5eYkqRD1/0m5sSya24Rl1ePG2BchPL
wZB3CWd/CQvTC6pOy1amJVZWZ4jUdOGN/iF30cLHl0a8I25d3zHPobp1EwTVFPUR
UQ6YYk86tfcxLF6EuI5LUsrQIBZ4JvxBR0des5Zu3Y/xdKePxCTSOCmJ9tpdwE2X
tmG5tNZ7j7FKzeMnc7r7zRWsOBxUTNNK+Buj319rL+Aq0Bp4z0vbQovbvM4BPfgm
vzwUi2CDp0vfQuzL2Ad1PJ3UZqJ+YzDzkcV2aiNd8qZ6VKzzlOU=
=AqEO
-----END PGP SIGNATURE-----

--T6xhMxlHU34Bk0ad--

--===============0398746902==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0398746902==--
