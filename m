Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D070C29AD0C
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 14:18:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05E826E0D4;
	Tue, 27 Oct 2020 13:18:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B44286E0D4
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 13:18:19 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id x1so1409658eds.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 06:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ndv9Qik7lTY419xLvwNWbUE1VGCODyUhzruthjY0r9Y=;
 b=t61DikpXoR+LU4gDAsmR2PQbB+Mvsw1XHyKVY6N83zXsiNcoB3Mc2FI9OyqF+8XZQm
 pklE+QKbnb8MsrQXIxcZxt12srTlVF6EH/agcEu5GNN3tg3LTaPwsWKCXe+c3TfmVirk
 Qyvkmo48kN3j075aNssoSyNy7/FrZdXcEOWvrOu2aKFNBIb7LG/AJo9sK5bYgyM2HpHP
 D9i9NeTU3S6JN4sBdsF5vlerQvYKnlyadVHVxftJZ83272Ct/cV07e+iZwZJXCwqkEeY
 y0ZdTtuoX8kQxKNHO6cQd4dJ1dvJbsx6eHM15wZEVCpLweRx76Pe71y3OkhCgvjYSBRS
 Z5lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ndv9Qik7lTY419xLvwNWbUE1VGCODyUhzruthjY0r9Y=;
 b=YKhDLOTH3DstD5QW+P5vJai6z5kAcxpZdjxNBEY5iHNpeGBSKh2RyIfnaxPBwwrwHm
 vNBrKcpx8WDWSC7XTe21wqVazUH6eoUZn0eIuskkB4t5Okc/pWrLm/aUpREILkU2hdgi
 SxzuXf8tKscESwYZhG5uzLN9JLeANHg2DfCyYcxTdPBf5k8mKO6JnKkAfpnwgzXYgC+H
 HBh/O5GtoDBFIiTmVlQ/5h3tvUEfdmv4ZRwidtZrkombTqfcHJ52zeV+hsgoNSmHsseL
 qWy/wVQqtC893xEj2eJlaqIUD1Cdy6vjJMRGB6hZWiNfy71hYH+bRcWYKggH6TpwYtwg
 PZyA==
X-Gm-Message-State: AOAM531d1jBpA+JNuV6BZznrHlIVCnznQmyJhuux7VzPgzNAwtzROPZw
 Yw+zw/6HYgk9C42NxLS+fGE=
X-Google-Smtp-Source: ABdhPJxIpbVFo4VsH5MUVteFePSla4n5DhbT35d0dUBoD9Nz4n3pnzMiANoqRA/4cQ0HSevWabpUxg==
X-Received: by 2002:aa7:cd85:: with SMTP id x5mr2340028edv.0.1603804698412;
 Tue, 27 Oct 2020 06:18:18 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id j10sm1039876ejy.90.2020.10.27.06.18.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 06:18:17 -0700 (PDT)
Date: Tue, 27 Oct 2020 14:18:15 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 03/52] dt-bindings: memory: tegra20: emc: Correct
 registers range in example
Message-ID: <20201027131815.GF1822510@ulmo>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-4-digetx@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201025221735.3062-4-digetx@gmail.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
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
Content-Type: multipart/mixed; boundary="===============0896582682=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0896582682==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cz6wLo+OExbGG7q/"
Content-Disposition: inline


--cz6wLo+OExbGG7q/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2020 at 01:16:46AM +0300, Dmitry Osipenko wrote:
> There is superfluous zero in the registers base address and registers
> size should be twice bigger.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/memory-controllers/nvidia,tegra20-emc.txt          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--cz6wLo+OExbGG7q/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+YHhcACgkQ3SOs138+
s6ESow/+LZLmPofRTsh9zPA6RdjuJHtjyek0yRGuddZ4sHlXIn1hVoWO8NVOzrBf
naNUxbKU/MJeFlWbjmjWodFQGTTgHrp8iNGlbNwknnGnXsvUwaOR//SfHfH54BlD
CcdfTmZee8YOAw7NbWC70q8uYw0pnM+VhHwXXKAn/pVf3Z5tU/iaqspZPBuB+Fnc
ZhkSLVLG04PpLtoyRQwuJiOOfVDbFdPPJ27TyDt+v4e7ML4g0YpYAgTkIEB3Dn8w
A9am2xRbLHga6LCIgHuT/4D9FSwrq+q0TIZBn4McIvsp1i8oI8NQ9OisQM0K9tyD
YBFrcqnz4j5YHkijmcZp1gDzBTe8UxiDdDfMTfR5VOjm8Dbc1pckyCgGH/hXCDQa
/Eemqag7huNBBmAPGvBlQ8ZUfAygoOC7YiWvpZ9C9/7UzbGTQq/H3Tuu6FqQQNyA
ZJO1prc28+BaWvABP4Qxx3UbyQpIqGRhM2qMRIxt4+yw9Dvzxb/KyTraxVsXGtym
zkQ3qDQ/Wisj6L3iRn5Y9gaQ9liqZtHLovc7yt0UG48asa5qCWvVc5M37zSktPvs
UBCBsN/F+7Z3Mv9u1g+CvVik5GR9rpiKcEI/+eWAt0gndEC/3YVgzusYAoLDHVYm
5Zp+WTdv1j0HkpcdQrlRXEkdzcPOXhtl3Y6IAqPiFm5HGMLzSjY=
=opf4
-----END PGP SIGNATURE-----

--cz6wLo+OExbGG7q/--

--===============0896582682==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0896582682==--
