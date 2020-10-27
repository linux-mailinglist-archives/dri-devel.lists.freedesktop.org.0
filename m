Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6645A29AD6D
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 14:35:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E3066E09E;
	Tue, 27 Oct 2020 13:35:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36AAB6E09E
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 13:35:35 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id c15so2295659ejs.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 06:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=8mQg3nh3RaesRS2P5WKkQKj2n7Sdjc0/yYomgGjrqio=;
 b=iNNryRd2nlTyxGTMh11x7reba8pbjJ8oqfWUoqPdnRReHWdK6LUDGWM37tgyyDiv2N
 nmVRPh2dnjwsreFvaLadAUa4r0NXafbS0cJjVn0CEAGJx4eOdW2Em5ss8a12y8JZMB+4
 /S/Yln/enOzx6L1kmudHZ1nv+NQ9o1lPA0rJg7590Wn4H6Qss8bLjEmxtM5fCCN7o9Wf
 sHUahJRhBp6VZkCtCdUFCawRCFuthVnlM3P4VIhf4F3UwSrkUf7OXKU35ikqReEa9EaX
 qKd2NASh2NmgCn+6hfZM55WiAUQ7wBFXG4WsqUWSa9XEE9JWgDuJLG4bQJJSkp7p7s2S
 JfOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8mQg3nh3RaesRS2P5WKkQKj2n7Sdjc0/yYomgGjrqio=;
 b=t7XwAuo2g6PPxpomy3C/XheNGL2Tmsl4sJAVS+++/QQT/asFOqpXu7v6vYTneBNdu4
 Xw5n6dsrIF2GtGUvvuMQxk3KzL+eWW6Fyu/JRXimJUSkU8iEvDMEZTA/K89G0BQ7kK5K
 GkB495SThnwiUb0L2McwOnjR31WqbRgCvGEP82Kh8QjObd1I8Bb3HMFU79mOVltN6okd
 9mF8EBQxe/x8XNCwvuexIuL0eXdUdPXzC1MX3oeQYS4lY0QK1bHWj//XXzdcOnDaeNDO
 qink/9F5RXBJNYcoUR0Tus/it67zqPV6JqsNJyrBsnk3nugV7kjWJeKl0m/QsLgzGj40
 N3Ng==
X-Gm-Message-State: AOAM531o1mrrd3MNVD8mABJa7L7DLcJbKQVmoxIu2/MOODwDyUXkxIcB
 7juhNSdjz2YdfkLY1Q29ajo=
X-Google-Smtp-Source: ABdhPJyOS2GplJQHwJKYItyPwxlHn7uJ1Z/j8baAH8JyKjiTKLXB69/Mh3ufO4PujfYg/8EqfgktPw==
X-Received: by 2002:a17:906:c095:: with SMTP id
 f21mr2593939ejz.108.1603805733846; 
 Tue, 27 Oct 2020 06:35:33 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id 6sm1054545ejv.49.2020.10.27.06.35.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 06:35:32 -0700 (PDT)
Date: Tue, 27 Oct 2020 14:35:31 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 28/52] memory: tegra: Add and use
 devm_tegra_get_memory_controller()
Message-ID: <20201027133531.GI1822510@ulmo>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-29-digetx@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201025221735.3062-29-digetx@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0009705127=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0009705127==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oxV4ZoPwBLqAyY+a"
Content-Disposition: inline


--oxV4ZoPwBLqAyY+a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2020 at 01:17:11AM +0300, Dmitry Osipenko wrote:
> Multiple Tegra drivers need to retrieve Memory Controller and there is
> duplication of the retrieval code among the drivers. This patch removes
> the duplication and fixes put_device() which was missed in the duplicated
> code.
>=20
> EMC drivers now use new common devm_tegra_get_memory_controller() helper
> instead of opencoding the MC retrieval.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/mc.c                | 48 ++++++++++++++++++++++++
>  drivers/memory/tegra/tegra124-emc.c      | 18 ++-------
>  drivers/memory/tegra/tegra210-emc-core.c | 39 +++++--------------
>  drivers/memory/tegra/tegra30-emc.c       | 18 ++-------
>  include/soc/tegra/mc.h                   | 10 +++++
>  5 files changed, 74 insertions(+), 59 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--oxV4ZoPwBLqAyY+a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+YIiMACgkQ3SOs138+
s6Hfiw//dsmnyOi26C1B542Xl69Kt0RSahaqPgCob+RFtXhq//XjyEuLvOvQAjRe
lxz5ae9bOY4g4M2xwaGEoD+itgWFP0Ls+bvD5nbLBGnO1Z+oHWlKyGx2qzJveXOj
qP+dJHaaIyBO49MBznLzuWCOiP/lXB32WBNU3i/qsxh9S/7X7q3ihqYqezzrUMfh
Gdhsfj+EWMF5w7ZlXv9WoiR0ZSdmqDTJTuE3JDs/r0olxRtN/wb0PRzAaYo1qyiv
7YRNvSzCDWeap4l0SH+i/Yndul783XqNtZAjEb0oS/wzCiH+szPJNhcozS/2TI+D
Xza9bOPLxiY0GcngyhUQb/z6Z3PfdODVP6tHfFjOKzHnwyh9/XqgyZIzl8dKsk73
n9aYJUmv3cFU9fqqNFf3hjpcwjXIYk1FimqFTrvoC6emwsMjwEu7qARmWqpyIDEA
bMTabxLAnzBW1Q/ftB8K1MK4h24B1jLGG6BfQDwW272+zbRkVP5fI5bhAKn85X1s
npFW3cCKehnIAuxgLIob/RxLcu0T6U5TBD7yqyiuL79WqlW8xpN1oKLirEuToWFi
0XxaYBzC4vWO/5CGlSkbxlfBXNDscHte/b/Rany9br+SuiWFybW3a/IirgDSEzUh
fiH8r5or8XwD6rXR5Qy7IhBmJOYserCHHQk0AGmwMUhfBHPgXRw=
=Gbon
-----END PGP SIGNATURE-----

--oxV4ZoPwBLqAyY+a--

--===============0009705127==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0009705127==--
