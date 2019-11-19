Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EC1101967
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 07:31:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 742666E87E;
	Tue, 19 Nov 2019 06:31:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 995FC6E87E
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 06:31:43 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id b11so1819596wmb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 22:31:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=V9ZVAjqEehE9TZd163jDDobRL04jul9RIc/NIRcOnxE=;
 b=Ww42UqECEyqRiuk1+qVxXSShgZ3FHVl0FO+xp9MOjdzs0Uy+V21RFMADKj7kRu2x2m
 tk5/+JupGrSG/gPOZldhOBD3dWxLS0etA+oA2UKYUfdY9VxClSD9OYP87fjBJzTrcO4q
 xxwNtZBu9zmuvNA98OsL1rGn2Bbn5FDiY7XITe5yER4j3Z5RaVQ3j5noQ+K5luJyaxol
 d/S1lNQo3HJtdV6wKoT4SBO9s22/J82Pm7eGuK+Rl85Z8qE7rtJtPKa77ubtQ5kCLS2J
 DM7xhQ8LbiKtI9obBer7/swu0CQKDXRd8klv9TuFktePlBqFWtuDvSZnF+UCgim/5zG6
 ZfDw==
X-Gm-Message-State: APjAAAWtVcYyYN40QIFHAr+T5gfhtgHJLDbGDIowzKovU3QQ4SAS4ELT
 J0RJSkVfRh00owfiw4d11+8=
X-Google-Smtp-Source: APXvYqxjznwI398nWMJI2jkG1ai5MsjbFQzICGTnmQ/ZVsn7P6W4xO6iF+umFKBNbfwyCgLU1pBogQ==
X-Received: by 2002:a1c:3b82:: with SMTP id i124mr3264114wma.122.1574145102066; 
 Mon, 18 Nov 2019 22:31:42 -0800 (PST)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id y19sm1976414wmd.29.2019.11.18.22.31.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 22:31:40 -0800 (PST)
Date: Tue, 19 Nov 2019 07:31:39 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 12/29] interconnect: Add memory interconnection
 providers for NVIDIA Tegra SoCs
Message-ID: <20191119063139.GF2462695@ulmo>
References: <20191118200247.3567-1-digetx@gmail.com>
 <20191118200247.3567-13-digetx@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20191118200247.3567-13-digetx@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=V9ZVAjqEehE9TZd163jDDobRL04jul9RIc/NIRcOnxE=;
 b=EsrZgw7TQcDPJOYnuV5mNgHP+RRyegJGuk8W/0SspettSC8OxWtTlYR2AnmgusdtZM
 KNWtAL49JUPYfI+Ain6qom4D8RbxBjzYXWqBIAeEETlhrNdpbQc0EseQPMY2WSiimOR1
 RJ/zeIH+yMvl+VrPplAgYsCm28RSmTWlZmbimQYLJQeEzfT+80XGNVH6u7GR3+lxcJn2
 t5euOa2FIuFXKUnQ07xR++3a+R8pYxnDLE19BHAIpyD+6Vai6hTtpiWdIDV+fEAD9HrN
 SBu+wfbKgYvwlSjbjEOJQ2esyOXkYgNvw7VwJS+IjumqnHEFSNPIfku6yomjUZ9GhRiQ
 eHDg==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 Peter De Schrijver <pdeschrijver@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: multipart/mixed; boundary="===============1292558998=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1292558998==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oPmsXEqKQNHCSXW7"
Content-Disposition: inline


--oPmsXEqKQNHCSXW7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2019 at 11:02:30PM +0300, Dmitry Osipenko wrote:
[...]
> diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
> index 1238e35653d1..593954324259 100644
> --- a/include/soc/tegra/mc.h
> +++ b/include/soc/tegra/mc.h
> @@ -141,6 +141,11 @@ struct tegra_mc_reset_ops {
>  			    const struct tegra_mc_reset *rst);
>  };
> =20
> +struct tegra_mc_icc_node {
> +	const char *name;
> +	unsigned int id;
> +};
> +
>  struct tegra_mc_soc {
>  	const struct tegra_mc_client *clients;
>  	unsigned int num_clients;
> @@ -160,6 +165,9 @@ struct tegra_mc_soc {
>  	const struct tegra_mc_reset_ops *reset_ops;
>  	const struct tegra_mc_reset *resets;
>  	unsigned int num_resets;
> +
> +	const struct tegra_mc_icc_node *icc_nodes;
> +	unsigned int num_icc_nodes;
>  };
> =20
>  struct tegra_mc {
> @@ -184,4 +192,22 @@ struct tegra_mc {
>  int tegra_mc_write_emem_configuration(struct tegra_mc *mc, unsigned long=
 rate);
>  unsigned int tegra_mc_get_emem_device_count(struct tegra_mc *mc);
> =20
> +#ifdef CONFIG_INTERCONNECT_TEGRA
> +int tegra_icc_mc_setup_interconnect(struct tegra_mc *mc);
> +int tegra_icc_emc_setup_interconnect(struct device *emc_dev,
> +				     unsigned int dram_data_bus_width_bytes);
> +#else
> +static inline int tegra_icc_mc_setup_interconnect(struct tegra_mc *mc);
> +{
> +	return 0;
> +}
> +
> +static inline int
> +tegra_icc_emc_setup_interconnect(struct device *emc_dev,
> +				 unsigned int dram_data_bus_width_bytes)
> +{
> +	return 0;
> +}
> +#endif

Is there really any reason why we should make this support optional? It
seems to me like we would always want this enabled once it's tested and
known to work.

Thierry

--oPmsXEqKQNHCSXW7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3TjEsACgkQ3SOs138+
s6FtYA/9ES4ueQlrGUANiXpnoYLp+gOvUdGR2Om0k7LXGB1sAbdfCnAXEGv8Nh06
zMwoIQoF7yOagtouSroSK5930bLbrxrxffMXiYMzEZxzH3KmuRbxwxsN+egCLHUH
3aAfDm67bO2QmGnQTltM/nyC22xfvjCr7Eb7Lr2uhoPv+j8Gs8nwev15gw3F/TuE
fD2uAof3D/hlCwQ1eGVJf+PAQQ5c3Et6ivWXj1dLxw/bf2Fho7pxZt+B0XqvLlVR
eoPTflPJAPdqZfYTrkijN+KmHu1S/pzYT/LcTdQij3sTSn0t/rLDA4n15P78KMPd
XsKE8mUVQgJH+891UzGQLfAbmoX3UWAoQSiVMrEJ+6hLlHHEa620QWtIni46gZDP
6bryzTb4s/zkPeNrMbb2+X8iibLCWfI9i+g+aHfaqdSdmyuLj3fwFdcOqLTL1fxr
Pux+quH9+5M+brNCzkB0xBzvPqG4DSQ/Nu9WKHgf4RXARCrhqgauBYAlrK1UpnhQ
PYjrooXnMTFULsmm7r9ysaOQfsTgy7v6UDWlgKAwZApfvVv2F86bJ/jvmN0IOtpA
yiL2iBc27c24lKyzn5s4vLoy1tKEVkVO6D0e2rwP1M+cH7kU8IOXysAFGgNGcc1I
3fyAlnc9BV2mA6kqh1y6UGctADv/EA+uooJ0l4RkhClzWAlry5E=
=BBMX
-----END PGP SIGNATURE-----

--oPmsXEqKQNHCSXW7--

--===============1292558998==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1292558998==--
