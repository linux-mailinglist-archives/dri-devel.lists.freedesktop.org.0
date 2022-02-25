Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6564C46F2
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 14:54:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A958A10E97F;
	Fri, 25 Feb 2022 13:54:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA35510E97F
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 13:54:40 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id p4so1707540wmg.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 05:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=bLSDSpKnF2fZg407QahPP5rqpFnTUg7DoD0LmbyWE/g=;
 b=n3WGgyCMUnOHf7Jq76Xv+3aGeCryNaw5N97pg0yAcTC9wC+LbpS6QG97qfm5DwGzwQ
 VY1sX/4msCDC5Dy/oTC5CMc7ZOUy/d7sZmX+AzWb5y5/68Kf+5b4t/5/bvx4M2F2dVi4
 uq25EFNfdcVV8oc0aCB2b07FS2eIG4fIlhjpSuNLo1qI4s/dNxQ+g9cdSk7ij2Zt1V6g
 m5qyt7TX15J3hRwaAuAzQyrXVD+a7iUfuTw3+qHSWwWdIc4NIGaPGqewc3//3j1RR1kv
 ZBY9MGGydT2rhuPBfItIaboi4klJ/nLbEwIFnS3BbCBXlzRanIsafFSRh42I/PLkbBvB
 V78g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bLSDSpKnF2fZg407QahPP5rqpFnTUg7DoD0LmbyWE/g=;
 b=y2UHKo9nI3cemZgWc7nB5dVXfuRHVDuoXvTgVa4z005p1+hdr+aa2WehjtvYG13fXW
 tmeRBNtCNhU36JizNcq1MHHG3yHMG0OUG9Md4vLhQ+/qKx/owWEnInoO13+xpD42nPm0
 5p8CeQ0jVyhNLfS8AhG4V0lHYpT5dI+2QxgssFUEsU3PHpEuh6bQ6nEofFMcj3+vvmnO
 XEEy12fuaBwnppiBdZSlPXA8/SUzelfigNA1LddaNQIg74E/9r6gA9DuT3DhVbqkldgu
 5rorVOzBPBxA4qQFhZu50CB+L6O3VobEKPEv7P6F84ggoPzst88mRSAU7RsnieWoAAxF
 YiWw==
X-Gm-Message-State: AOAM533SPVpnnm7lhzLI0DEznrxr9r90lfoS8erPbEMAX39J3hyocZPh
 auykyyQANjP8aC7wuLjQHEk=
X-Google-Smtp-Source: ABdhPJxG5b3eC6gJYDGRexdLtixN8Cuygm4mlA7HPg2sjRFWNhtkx6nRffUsponysqKy997ugyvOXA==
X-Received: by 2002:a05:600c:a0a:b0:350:564b:d55e with SMTP id
 z10-20020a05600c0a0a00b00350564bd55emr2745834wmp.124.1645797279400; 
 Fri, 25 Feb 2022 05:54:39 -0800 (PST)
Received: from orome ([62.96.65.119]) by smtp.gmail.com with ESMTPSA id
 r2-20020a05600c35c200b00352cdcdd7b2sm16893002wmq.0.2022.02.25.05.54.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 05:54:38 -0800 (PST)
Date: Fri, 25 Feb 2022 14:54:31 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH 2/2] gpu: host1x: Fix a memory leak in 'host1x_remove()'
Message-ID: <Yhjflxp64MvxRxls@orome>
References: <05c1932b66048ebf6742705e2ab16eea852c46d9.1636319710.git.christophe.jaillet@wanadoo.fr>
 <f3dc9c70f3dca6462a98d595e276c9d00f607bc8.1636319710.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YM/PX6IwOvzzi6Ng"
Content-Disposition: inline
In-Reply-To: <f3dc9c70f3dca6462a98d595e276c9d00f607bc8.1636319710.git.christophe.jaillet@wanadoo.fr>
User-Agent: Mutt/2.2.1 (c8109e14) (2022-02-19)
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
Cc: airlied@linux.ie, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--YM/PX6IwOvzzi6Ng
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 07, 2021 at 10:16:36PM +0100, Christophe JAILLET wrote:
> Add a missing 'host1x_channel_list_free()' call in the remove function,
> as already done in the error handling path of the probe function.
>=20
> Fixes: 8474b02531c4 ("gpu: host1x: Refactor channel allocation code")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/gpu/host1x/dev.c | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thierry

--YM/PX6IwOvzzi6Ng
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmIY35cACgkQ3SOs138+
s6EcPg//dMwTPNSZfdsrAdvf+nmBPDK1RxMflarRWxBHMT+SQ63l8aip4rIskjXE
6DAXZStv36XLmqxetcEjpUpmUFaSGOa3fDeGy6XWpl4ZjTnzCElbyknHL13Ke5QX
hGCQxkxNSz4O7QbEVfWxWQ+TBT6aV/lwZBxW+f1qshgLEp40ovZJoyZzSZVp5cJr
Zpl91rtFURk24Y6m/ZAr9s3xMHyCkZjHludKio/gjY7ozaxih9ZW9rwAjOMi/iS0
o3vdtmVVnteOucYrgxy///kHtO/Otx7RP2zgN8438KklWhLVz/Fi1Nm9HsMcQqKN
h4OWhdXW/nYiVCgKIhNuBl625sfidLDFR1oYT6FDIbpm7JG4Sj2cAykYSiZ449az
81PRNbTW1usCBbR9iLk/fwcEpNNk3lamslA1MZW7xhq9FLpAaT68lGbdXhIwH1br
zQrHRsvvc0KppccFadcWQ2sGACqnB6ESsB+vBxK1ZeUPi7uW9REXf12ssFxFt6t9
FxsvmQitS2QaZaQ9GxPom6VMEyY0J6AZyK+iRILn93pEqZJu515BamNGuqIfeCh1
CCRkmsQOI1iYbGsHYdshCJ9e5SO9HhlCZ4RClf+A1Vc9sAgS31E2b8qEv5EYtASq
eMbGPqeNd7YSL26K6CNcVofpExF4eBKZGiPbNh+USOiGx+u5Ukc=
=5eoA
-----END PGP SIGNATURE-----

--YM/PX6IwOvzzi6Ng--
