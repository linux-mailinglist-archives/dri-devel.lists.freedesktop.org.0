Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8089A475C5D
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 16:55:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CBED10EB52;
	Wed, 15 Dec 2021 15:55:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0428810EB52
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 15:55:39 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id u17so39025437wrt.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 07:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=R67lTnWwXbUTzFzCGUUL+WExD12deXb0Qh98T1uTW0w=;
 b=OhHVBsH+JSjXGRjWW3dS71NC/5sbYxFPZeF0Q4crce9RPU1G+fwh5oGbAJmZOtYSDn
 yjuE+M/vGo+HcrEQy22dlJU89eYUIQKX9sy91E3wHpbdRpvBDG7E9pqh+KnpWWxUSq9v
 PNF4kbB9qDszar6MdLFK6vUT3qHSmSkZinyZ9tTuRpB9k8dn911giQKHsHtqs8Ub7qfH
 d+kpMd6Mn09M8+dSrQ6c/fZrNlAwgj2PLcnx4Skskb/YzyUvtGrwTTyqbbEG/OT3HkPf
 3zJ8bhxulq+9LmiMbMGftBQwPezCtnNWvi9+c4T4qCyJR3jP+j7uHUtw5ctkZOex5L9X
 70hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=R67lTnWwXbUTzFzCGUUL+WExD12deXb0Qh98T1uTW0w=;
 b=ECpi/gCYFMmiFZhT9tDiq06KGnxmKSdr4XjeCjk8rbcsbGD5TWWu+4w/NYqe9jXU7u
 Gd6MjklcMPwpYgWFns3/chrVFCvcrEpkXWR30Spcmn7uHHunaWySdezvNVMnniDVSbOk
 GhGdPS2nf5Pk46maNCdfLq0cmTYZbXkJyHKGPNXtPxJ5YMFODbeFnaDsl2s97vSB2GnJ
 CgJ7YAe+s+E1yr2JC5g0Q70eOklMxAxax7WGYQr1IjcTm+gK0Oa3EKrZ7S1zQRVVc2v1
 CdQK861bcgeaQJg/BeJLATNpo6ojfyW7vwRTdqz3pM8U449tQt9qPqBWmmyFCFVnblqN
 1Feg==
X-Gm-Message-State: AOAM531hhTKQzRx/7GId6K6NVxGj8hcY2KQd1m4nsENkQBhHg356A1FR
 KcrlRWJMdN7XjWZin8xJ7H4=
X-Google-Smtp-Source: ABdhPJxHztDvenoHWfBqOVDnmyiUgaQWSSLPpt6XX3/VYHhw8RSChI7rhoZIlA+1HRtQtKu2hou5Tg==
X-Received: by 2002:a5d:6488:: with SMTP id o8mr5000272wri.631.1639583737576; 
 Wed, 15 Dec 2021 07:55:37 -0800 (PST)
Received: from orome ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id n7sm2363354wro.68.2021.12.15.07.55.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 07:55:36 -0800 (PST)
Date: Wed, 15 Dec 2021 16:55:32 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v16 00/40] NVIDIA Tegra power management patches for 5.17
Message-ID: <YboP9IFMUrUnEzrU@orome>
References: <20211130232347.950-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HWWUr3zWZyjxMtnU"
Content-Disposition: inline
In-Reply-To: <20211130232347.950-1-digetx@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
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
Cc: Nishanth Menon <nm@ti.com>, linux-pwm@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-clk@vger.kernel.org,
 linux-pm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>, linux-mmc@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>, David Heidelberg <david@ixit.cz>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Lee Jones <lee.jones@linaro.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--HWWUr3zWZyjxMtnU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 01, 2021 at 02:23:07AM +0300, Dmitry Osipenko wrote:
> This series adds runtime PM support to Tegra drivers and enables core
> voltage scaling for Tegra20/30 SoCs, resolving overheating troubles.
>=20
> All patches in this series are interdependent and should go via Tegra tree
> for simplicity.

So these can be applied in any order without breaking anything?

Thierry

--HWWUr3zWZyjxMtnU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmG6D/QACgkQ3SOs138+
s6HzZw//SGRlSbxYGcf2puc+SV4jxqHgVmBVp8biQjzJoeSIatV6B+8n7NAvS0x/
qMBw7S5I7uFy8rqsIUHNQI929PW2XNbz2H8qid5UjtDVlUo5ir1qtVgvH8HYQruX
l+PlVayuhBblIEemscYhMNeuyKgrAMeho9ZnnJjITvMVBKRGOxGp38RUgf+Tzrpc
lF7KIxOcm9FoYTeLxAiVFKtI6Evkt+xJbEvqxkIpaNAzo/AvX6ognGeUQCg7USWu
v2Km4gqjV0bvZUi+HlMPnYGAFpt3X9ws5NCR5ED4huHislttMacNlkfWGpHw/KkU
/VJlYrSnlpJkppzOio+g91qdXXlTfXpa3g5ZHSOLqsNFOPFppN9PU9K2DhwFN3Ej
mNIVbs8Oarq/bJdCftc6dX9saiL9AdKCD1MJO+XgsJuHtQ4FkJHnxMk/p8m9KH33
HurZ3qmVir9YQh9kyE3MVT95o3gSR+M6hpPcSDiCf4g9XjwvEfJ+sDSg7B8lmM+0
ZYOmkLu0iLKGOLOn/gBU9Z/Zw9Kw2iW2J/glHU4E5/GI2MNgs99GQPOwyFEq6AvQ
B4V/SN10i1F0RzeuqsFacfr25c9UGwcXUDNxJqebib27ZRhcGkwu53tEBqYWXep9
7MAMtQ8il969lajf/1tAlUVPR6AXLiuGcKgZZTEcDUReMvR4Dqk=
=drq6
-----END PGP SIGNATURE-----

--HWWUr3zWZyjxMtnU--
