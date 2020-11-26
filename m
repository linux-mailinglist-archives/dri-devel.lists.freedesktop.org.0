Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B132C5A7A
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 18:26:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C44246E987;
	Thu, 26 Nov 2020 17:26:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48A476E987
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 17:26:10 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id 64so2921462wra.11
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 09:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=6I0lhLGzPPM0MoECXGUi5YFC71JrYnGKvoQDQPmtiJ8=;
 b=l06CNRd31zgbywkafp4M3M36NmeEp98oXvZIbgFZaXjPDiITJXkrhLw6e82PRokFMq
 kSV+0rsWu3t278MiKn8FxZ0GpnGOdkRNRc8kI1ao3FfuuXk6Psqs49YxCD+ES1ohhwHn
 778H50Vz+qsL2LOxPPnWXeM9yik6M3kLd5UNS8iViAW/shl88g/0RGv+uzDhvTh02TDU
 G2JiVIVyK5ICAVInvipDuRW8GKiL5EgPM4rcdsxRdWxIgGHo1Ciw4FZ6SmbNfL7H12Gh
 po6yduAQos4jRyU+BqDlJWwB5xzD/y7S8MFJIyFKNtTN5wOfjlurvHwLREINC+5TBPxt
 BhpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6I0lhLGzPPM0MoECXGUi5YFC71JrYnGKvoQDQPmtiJ8=;
 b=rGHSvZss6CGWwMWot382liYFBcIt6izNIQYApmUi5ogGKlts6hI6ovcFcKiCbTdeUv
 P/QD05fQAcvRTwKIkZlLWWCvHDO3+XL+s2xpJSZK0rObjEX2NNsQO7t4x5t1e2RamQDi
 bv4rsnRX5ClyDzfnx0n425Ccyf3VhAl9MGlTxpKmUQSAm763rQx0gpZ4Z5XYQmgXrYgb
 hbYlvCLh1FWvacKbPQLj+aBpDAamWBRQIYPx4HZe2JRcxhIae25fuvRki9HiTOEhRSy0
 nh0qyb/C6ihQRyWM62aN+LSr+kbvqVTg9f3K8aqTF899UbkslIENJb9nUPEpW1UT8zma
 /Paw==
X-Gm-Message-State: AOAM5338zKrdD/Z/dSGoctHiPgvnXmAZ/76VUTtWY7CQpwuT6Jmmu/Z5
 Sh2DA1b8VnY2GF5if3GgOKw=
X-Google-Smtp-Source: ABdhPJyaBeHdgoQF3J1Ovn0wtkH7fvTi8SaOzT7ic/NJzEli3QaHlrGWzuvtjGLemmZWpI00pWevgQ==
X-Received: by 2002:a5d:690c:: with SMTP id t12mr5123901wru.405.1606411568938; 
 Thu, 26 Nov 2020 09:26:08 -0800 (PST)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id s4sm9982577wru.56.2020.11.26.09.26.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 09:26:07 -0800 (PST)
Date: Thu, 26 Nov 2020 18:26:05 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v7 17/47] dt-bindings: memory: tegra20: Add memory client
 IDs
Message-ID: <X7/lLaZJNp+Vfczk@ulmo>
References: <20201104164923.21238-1-digetx@gmail.com>
 <20201104164923.21238-18-digetx@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201104164923.21238-18-digetx@gmail.com>
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
Cc: devicetree@vger.kernel.org, Mikko Perttunen <cyndis@kapsi.fi>,
 dri-devel@lists.freedesktop.org, Nicolas Chauvet <kwizart@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Georgi Djakov <georgi.djakov@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>
Content-Type: multipart/mixed; boundary="===============1745337529=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1745337529==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="u/+LBcE/GZY9+OI4"
Content-Disposition: inline


--u/+LBcE/GZY9+OI4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 04, 2020 at 07:48:53PM +0300, Dmitry Osipenko wrote:
> Each memory client has unique hardware ID, add these IDs.
>=20
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  include/dt-bindings/memory/tegra20-mc.h | 53 +++++++++++++++++++++++++
>  1 file changed, 53 insertions(+)

Is there any chance you could drop these dt-bindings include patches
(17, 18 and 19) so that I can pick them up into the Tegra tree? The
device tree changes that I was going to pick up depend on this and
fail to build if applied as-is.

I was looking at your linux-mem-ctrl tree and had initially thought I
could just pull in one of the branches to get these dependencies, but it
looks like the dt-bindings patches are on the for-v5.11/tegra-mc branch,
which the ARM SoC maintainers wouldn't like to see me pull in for a
dependency on device tree changes.

If this is all fixed at this point, I'll just have to push back the
device tree changes to v5.12, or perhaps see if the ARM SoC maintainers
are willing to take a late pull request that's based on v5.11-rc1.

Thierry

--u/+LBcE/GZY9+OI4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+/5SkACgkQ3SOs138+
s6E7hA/+KCUsyWXHkq1zseaJ5gCXuvTLINqhxC1oK5TJvCQ7BFh3567X8Qg1Sd85
W4KQS5u4lGrHEfDgGILPcdO/GdlOWrYLUpLVnwHMX4/F2Jy8Ey/cPHPDLN469A53
B0qntX6JoeJKFU/mGmvf0xQie/QpZvjBfMFrCdQhA/UueGOdJYBMKb8o5hmQgLi9
LWVnTdSrxaht6vl32SeO452KjQvUBZSnCh9weUvpzhcPtOJm8hn6Fnmc1erDw9bX
QokJFiB0XDvsFJoBtbQQx2/jHXFihBCdlxiuxJvEKb/0n3qrYzr6n9Vasjpb0gap
83nRKdl4MNJsJ6KjoMZtjVt93x37sam6giILq98SIKJos5jz4WK8PKUiOIyQZryb
AJL2NRM9gdtfUkm3YHcePioeyNsr2baRqF2kuv+VsnyYOHKqSilmRX0fOXn63kKg
0wNfDmMPA63/UfYSweeTnDZerFZdJwV04+PFOt6OCffoZEe+uDCnpmrn0Gv91Hrp
HJEai7zzj8yZqHUCqNRP8SadYHWXQjz0a42CoD1UHyoeMQnvApxCdAn3vQ9R6WBM
n0BdCx0blXhamA3xb2EPVwPZ4huLcxwCRTKDRcRMbMUL400k3MGk9EnHeXa85YgU
NKeI2QOdzGQ788QbBHfdD7iBjEPcHLx98w3zxgISsEElIUXDMfY=
=f5yy
-----END PGP SIGNATURE-----

--u/+LBcE/GZY9+OI4--

--===============1745337529==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1745337529==--
