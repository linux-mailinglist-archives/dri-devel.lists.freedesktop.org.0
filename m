Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BA91CA848
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 12:26:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7991F89CBC;
	Fri,  8 May 2020 10:26:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEE5889CBC
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 10:26:34 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z8so1256545wrw.3
 for <dri-devel@lists.freedesktop.org>; Fri, 08 May 2020 03:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=U/nGiKbFLFriNl4EVgpGj88MYeZZdcTLN4ma7CGTOns=;
 b=f5YjvUPChhk0lY3dMb5i7+8WWfjET6KiM41cHBRUu6xufVdFD+lXMAQ8LwyL+QfbD4
 W8rrmbc5708tczFvjA3+i0m70+26t13Dih7H2T0D/fedRyIbGkXRzjWEUsBoIbqs5uhU
 Ustc+v1CDaRSr16TyxMWmiXR83u5yH0ipJxHRGfE9lGYtWNkGIy/U//whczKkAFjp1b9
 GYUyiogtmunUJAeUY46LFh8/NRyJMxxO/CkFVlbB2V1yYRtxS7MAE2eEkQYMtwPM1NU7
 EqRtaEhfIHvEzGkipg7KxZKDfELKELHg6PcsTrHA3O7Fc7aHahTQkvOG2/G+WK56HcKI
 oVEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=U/nGiKbFLFriNl4EVgpGj88MYeZZdcTLN4ma7CGTOns=;
 b=ZAEancvJ5UpQ2dpYj/ISfHPdl/tyz+vrBrKD/bAwAqerOrzLORytMopTYNbkSc7c0j
 8j/hmXrFyLyjnMQp0EPg9wzM6Mx40L0SVcCCrT83GT9sC4+1GuZHpoG22wVMQxdRRgFr
 FsZKCM/LJU0FSjBcCrcsW0LVE/7hEvWQv/8km5zxBUgZdCfIXzTnp6fNr9TWfXXOVgQH
 hhyxvKauKgdL6IwFMC7nD/0DZ8xtWoA9Gzoh8W2AHTi0wZJQ6MZD+ACqFwl9vAQVrQaG
 rDlcWwax1a4ODRsFleYMhbykC1RShYMz+K8BaqEO4tquIjx1eqXI+A64LpjU7MMn/TJp
 qHLQ==
X-Gm-Message-State: AGi0PubujenvpXau7yjjZqLKxpycZwkOw0A7TStuQA7zBpdoglTZZcJo
 hksQkTqH7pIV8aog5gEvti8=
X-Google-Smtp-Source: APiQypKRGJRAQ0UZdIySQIaoUKnB7SQfKdP6aHBF/MqvfySOmbKcCMXcGTUk1STZ47zTNYv8/b2/xw==
X-Received: by 2002:adf:e788:: with SMTP id n8mr418066wrm.317.1588933593344;
 Fri, 08 May 2020 03:26:33 -0700 (PDT)
Received: from localhost (p2E5BE57B.dip0.t-ipconnect.de. [46.91.229.123])
 by smtp.gmail.com with ESMTPSA id c19sm2364623wrb.89.2020.05.08.03.26.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2020 03:26:31 -0700 (PDT)
Date: Fri, 8 May 2020 12:26:31 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] gpu: host1x: Clean up debugfs in error handling path in
 'host1x_probe()'
Message-ID: <20200508102631.GA3030605@ulmo>
References: <20200426191630.41290-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
In-Reply-To: <20200426191630.41290-1-christophe.jaillet@wanadoo.fr>
User-Agent: Mutt/1.13.1 (2019-12-14)
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
Cc: linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0831631202=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0831631202==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pWyiEgJYm5f9v55/"
Content-Disposition: inline


--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 26, 2020 at 09:16:30PM +0200, Christophe JAILLET wrote:
> 'host1x_debug_init()' must be reverted in an error handling path.
>=20
> This is already fixed in the remove function since commit 44156eee91ba
> ("gpu: host1x: Clean up debugfs on removal")
>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/gpu/host1x/dev.c | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thierry

--pWyiEgJYm5f9v55/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl61M9QACgkQ3SOs138+
s6E5qA/+MmoiWrLTVaFdEnFgY568ldpbMKJel9y+2djQ7IncLvkQt+g/Z6o0ghVD
OkhEvQfWM6rdYUehLaFfN9k1VJ+8VaNqrvDPa+SEfivIS0lDAF5dU4x6rOxN8gFf
t6VHONMlhZsHhPI8jlMvIW+v3OczrbDzXmo5P9o6iKPFDfkqEpbS8FAqlzhpXGPY
qVSmowOZtNJcvF1754ssJFb95uz0kl0XZ6LNa5Pgl1YFHgBAZrUKHtu5ekmvs2hU
tXJB6Z/nyJs8/38HWqQD6+6MjOsPVD3hBEf/Mz6PE3TLSQlTxUoGGvECjU4NNnnl
HrdBPXIOCNYC5a8KAEyaFg9I4jUcpnhwfB7RwXZeFUmUMdl0DZx4m6jckCbD13pV
Qax13ypm7mUuTAh1ZpzI01Vb193QG5Zx3YpSb/cFlFeoe12YXZH+j9lawuoCI83s
TfcwxTaPtYhUd3UnxpW21SKmun49sL12lilKyLhydEWCVcMozaYJUyz7wkJPEoU5
Jkpnu8M1YhW6W3nFa/hOBXdcEHg+LG14DRaGZ/Dfv+9oMRNcOEoW+p7WZSSDODs1
84p1Ec/NedIcB9XJjtaB6RLkwu5PbPk5g7uBEZLl6hVSZfUnXW7/wg/zcuedwkO4
p7GYMpqt2vRfQ7iM4VXH60fqlN3lF1GDj0T5JZsMrclFInwK2dw=
=zg/O
-----END PGP SIGNATURE-----

--pWyiEgJYm5f9v55/--

--===============0831631202==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0831631202==--
