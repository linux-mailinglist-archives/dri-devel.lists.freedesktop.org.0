Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A9A2CF142
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 16:55:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 737A46E19C;
	Fri,  4 Dec 2020 15:55:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5D926E199
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 15:54:59 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id cw27so6329171edb.5
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Dec 2020 07:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=AHQHq1xL8SJ5NWI2Z081/APQVBFOAsAFbhSvIy9O+O4=;
 b=bWCk4mSKVJwDh1g8B2dSMt8iEtSNfurQhLS7058Y6rhgMTutxo2/L7yA6tbhbQbQwf
 mT45Zd/pZM13Z3m+YIPCA530+4H8E8QbWu+zrgt9VUx40b7q0I0QX1u6YvVPPEUZAhfA
 beoKBCPizS04KXqb0MgUrTXdPv026hwBQXp+3tegYL1mb3ACg3RmVlT5TdOL740b+4qJ
 k1/8wMNgnQ5eMut3nZa+gF3ypYBPCrdYutzKRFUFv1k4VQ2RfIlIKIpu8ngVIdRCzpmd
 2wOuModdUv7bn4uCf0qCRd3akvgM+hm1Hpm/zvFIqueaVTRck8ott//pDPf6ys6/+H18
 MqxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=AHQHq1xL8SJ5NWI2Z081/APQVBFOAsAFbhSvIy9O+O4=;
 b=MnaZ/oq3eWvVpnl8MxbkvNL3yTVJkfO4G3ZxHYc82sc241/IHGYHgATjjvx7BFjwTP
 gRPHMOQVbktpFliQljG2RGz7vfuhLYz88gvi1lfS8y9uwWCk042ZrmpB0WCw91AXfe8M
 KGJ+uMhELBoTGZvizxH/IMbpBDNXZFuNdyOCz0hnSsqcYKjDQyrTUSP3u2u6J0IFAmWQ
 xi6FO9/aQ1KDgRyGpsXWmXlqCH7rUIOsMNHyb5rQ/cJZjw+Cie5Eg+UBIUnTPGyK1YF3
 cVqbK6Fuh9CQsg0eVX6kN0KDV9dz3vIaIkLEbsAtjRDrrafiZPqy4nRBX/c0eY1ktRCs
 MKNg==
X-Gm-Message-State: AOAM530j8dJ02PPg2xdrNN8IWhsqLoyoISSEKjgWfuXfuwKDys9AO/94
 QhcB/AGc6cUiOsvISEB+wiA=
X-Google-Smtp-Source: ABdhPJwIwYpBPdNvrAZSaORpA0OUP9tWoQ6MOGfXKFpG3ZQf4WOv1c6QoxKrcDfcYlTrC8WuNBpq9A==
X-Received: by 2002:a50:fc9a:: with SMTP id f26mr7996946edq.255.1607097298616; 
 Fri, 04 Dec 2020 07:54:58 -0800 (PST)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id x16sm3330153ejo.104.2020.12.04.07.54.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 07:54:57 -0800 (PST)
Date: Fri, 4 Dec 2020 16:54:55 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v10 17/19] ARM: tegra: Add EMC OPP properties to Tegra20
 device-trees
Message-ID: <X8pbz2FsuJ5XGXCi@ulmo>
References: <20201123002723.28463-1-digetx@gmail.com>
 <20201123002723.28463-18-digetx@gmail.com>
 <60657f5e-bd30-094e-f8df-6ba69e0d6a3e@nvidia.com>
 <1ed05baf-3a01-3a2b-cd79-98b356c846cf@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1ed05baf-3a01-3a2b-cd79-98b356c846cf@gmail.com>
User-Agent: Mutt/2.0.2 (d9268908) (2020-11-20)
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
Cc: Mikko Perttunen <cyndis@kapsi.fi>, Nicolas Chauvet <kwizart@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Georgi Djakov <georgi.djakov@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>
Content-Type: multipart/mixed; boundary="===============0398311842=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0398311842==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KMNCFJXxkXYagfyn"
Content-Disposition: inline


--KMNCFJXxkXYagfyn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 01, 2020 at 01:57:44AM +0300, Dmitry Osipenko wrote:
> 01.12.2020 00:17, Jon Hunter =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > Hi Dmitry,
> >=20
> > On 23/11/2020 00:27, Dmitry Osipenko wrote:
> >> Add EMC OPP DVFS tables and update board device-trees by removing
> >> unsupported OPPs.
> >>
> >> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> > This change is generating the following warning on Tegra20 Ventana
> > and prevents the EMC from probing ...
> >=20
> > [    2.485711] tegra20-emc 7000f400.memory-controller: device-tree does=
n't have memory timings
> > [    2.499386] tegra20-emc 7000f400.memory-controller: 32bit DRAM bus
> > [    2.505810] ------------[ cut here ]------------
> > [    2.510511] WARNING: CPU: 0 PID: 1 at /local/workdir/tegra/mlt-linux=
_next/kernel/drivers/opp/of.c:875 _of_add_opp_table_v2+0x598/0x61c
> > [    2.529746] Modules linked in:
> > [    2.540140] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.10.0-rc5-nex=
t-20201130 #1
> > [    2.554606] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
> > [    2.560892] [<c011136c>] (unwind_backtrace) from [<c010bb60>] (show_=
stack+0x10/0x14)
> > [    2.568640] [<c010bb60>] (show_stack) from [<c0bcee54>] (dump_stack+=
0xc8/0xdc)
> > [    2.575866] [<c0bcee54>] (dump_stack) from [<c01235dc>] (__warn+0x10=
4/0x108)
> > [    2.582912] [<c01235dc>] (__warn) from [<c0123690>] (warn_slowpath_f=
mt+0xb0/0xb8)
> > [    2.590397] [<c0123690>] (warn_slowpath_fmt) from [<c0825ad0>] (_of_=
add_opp_table_v2+0x598/0x61c)
> > [    2.599269] [<c0825ad0>] (_of_add_opp_table_v2) from [<c0825b90>] (d=
ev_pm_opp_of_add_table+0x3c/0x1a0)
> > [    2.608582] [<c0825b90>] (dev_pm_opp_of_add_table) from [<c087b774>]=
 (tegra_emc_probe+0x478/0x940)
> > [    2.617548] [<c087b774>] (tegra_emc_probe) from [<c0654398>] (platfo=
rm_drv_probe+0x48/0x98)
> > [    2.625899] [<c0654398>] (platform_drv_probe) from [<c0652238>] (rea=
lly_probe+0x218/0x3b8)
> > [    2.634162] [<c0652238>] (really_probe) from [<c0652540>] (driver_pr=
obe_device+0x5c/0xb4)
> > [    2.642338] [<c0652540>] (driver_probe_device) from [<c0652740>] (de=
vice_driver_attach+0x58/0x60)
> > [    2.651208] [<c0652740>] (device_driver_attach) from [<c06527c8>] (_=
_driver_attach+0x80/0xbc)
> > [    2.659730] [<c06527c8>] (__driver_attach) from [<c0650610>] (bus_fo=
r_each_dev+0x74/0xb4)
> > [    2.667905] [<c0650610>] (bus_for_each_dev) from [<c06515f8>] (bus_a=
dd_driver+0x164/0x1e8)
> > [    2.676168] [<c06515f8>] (bus_add_driver) from [<c06532a8>] (driver_=
register+0x7c/0x114)
> > [    2.684259] [<c06532a8>] (driver_register) from [<c0102208>] (do_one=
_initcall+0x54/0x2b0)
> > [    2.692441] [<c0102208>] (do_one_initcall) from [<c10010cc>] (kernel=
_init_freeable+0x1a4/0x1f4)
> > [    2.701145] [<c10010cc>] (kernel_init_freeable) from [<c0bd4510>] (k=
ernel_init+0x8/0x118)
> > [    2.709321] [<c0bd4510>] (kernel_init) from [<c01001b0>] (ret_from_f=
ork+0x14/0x24)
> > [    2.716885] Exception stack(0xc1501fb0 to 0xc1501ff8)
> > [    2.721933] 1fa0:                                     00000000 00000=
000 00000000 00000000
> > [    2.730106] 1fc0: 00000000 00000000 00000000 00000000 00000000 00000=
000 00000000 00000000
> > [    2.738278] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000=
000
> > [    2.751940] ---[ end trace 61e3b76deca27ef3 ]---
> >=20
> >=20
> > Cheers
> > Jon
> >=20
>=20
> Hello Jon,
>=20
> That is harmless and expected to happen because the patch "memory:
> tegra20: Support hardware versioning and clean up OPP table
> initialization" isn't applied yet, while Thierry already applied the DT
> patches from this v10.

Hmm... that's new. Since when are device tree additions expected to
cause these kinds of splats?

Anyway, I did apply these because I had seen at least some of the memory
controller driver patches appear in linux-next and hence had assumed
that the whole series had gone in, not realizing there was anything left
to do.

Krzysztof, what's your schedule for the memory controller tree? My
recollection is that this will feed into ARM SoC, so if the -rc6 dead-
line applies like it does for platforms, then I may need to revert the
DT patch that causes this so that we don't have to drag this along
through all of the release cycle. If there's still time for you to send
that PR, perhaps we can get the remainder of the Tegra interconnect
series merged for v5.11 as well?

Thierry

--KMNCFJXxkXYagfyn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl/KW88ACgkQ3SOs138+
s6HidxAAwntnP3WObcRfozgV+UUfPHprx++lvOQM0RSCqz70ZZghhkSfsgcT78Jt
yiu2ukYQqQd05H7GHBm0Z844Z2ELYDq8ReYNIOlb4zx0UDr3ooxk0XubcRioei11
hb7rz2p3kXQLduFsNSoCYvlM/GnFE+lKfGwfXCiQn/ZuoHbnUMMOFoESQ/e0bXAW
yMogV3lXrxIAyHcUBnohLNMFVD90eaxmcnfCL6og5bRipxipLbyUSlXTOwSiaQdO
erTB8q1Dkzlp5b+GOv/nFtLOZQqNFyFm4fK/ijkEeAwbkahx6CFPp+rKUHcgtuJz
KIQTFElLLLVBpFKxGoSnN0AFd7FPE5vI58MbOZjCYRNaj15fh1SnrQxl5WtIcett
1K7VgOE/RlcGvLC4krNSVBeZLKIEckZSsAr0ck7fcVz0rU5fyPqz0Uczcfkxe6eT
1u5vz91BiaVL/JUIhpRuoChd2irvpP5tcTiwSs+3d3jyxxuwnmXoJiyqZVtbwNa9
eItaLTkNkt8K9WWjcqnDRgzdWVDdzXh/s1afe/ZFnEcThvHVAU1v06/MrZXfNNeS
6a32RK/iiSenx8/TkYZRWf9aLS5P+Vxn6P90bILPeJND9F0XMiJdrKXTgNwFo8on
e/vIrxVuw5KKF6ZyzGjP6cCJgplQLcw5X/luCc+MxA1FzGqV34A=
=fKt+
-----END PGP SIGNATURE-----

--KMNCFJXxkXYagfyn--

--===============0398311842==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0398311842==--
