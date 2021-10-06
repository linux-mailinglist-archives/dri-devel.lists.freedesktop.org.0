Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3054245E3
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 20:19:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAAFC6EDEC;
	Wed,  6 Oct 2021 18:18:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 040D66EDEC
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 18:18:58 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id v25so11424027wra.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Oct 2021 11:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=l37z0MKyCQi5WzX8pvIE+axWaJnGib7YY31xgkAbYag=;
 b=YMxKk5GokJKkD+1QU2aKCqmbK17C//8UkeEj3P3drE7UjQbiNVqnChd9R/DfMW/3L8
 7gV+9dsaDmo5ug03qv/w8QXuwQyV5+pftkzlFNt2kdPk77EcrBWINy/dHNgMBH757Ewg
 LQjH+PVgsw9nVM2HTW18xHDkdNk24GjE8SzruBn0bwUixX483L6wkVV9bjWuGoxdCZ7j
 4JSLbPBNDYEA+Svldw0K2F2CT2WOSzWxWDJqC6BeCv2Zc7yh3EQLTdbFU7NeF5J/J0PT
 FeTOH2jMDpxWQcjcKsQn4sRQQINoYYYyIL1eE0EP0lzAHDKzIF8/Zoak5f/HazTrLAIU
 ytxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=l37z0MKyCQi5WzX8pvIE+axWaJnGib7YY31xgkAbYag=;
 b=dP6evL3MuY01W2yRko3IPgbA7KWCxGwSk0OTdcbC01iUQv+NGFC4dUBGYUTJHxuJMt
 MuX8Gaenz4avYGUywhhp/KdEngjCKP/aghzELwy/AhAjTXa0j2/Il66CXOyp05/HH4Ou
 gPWcyL0QxAyqyV/XOz+WOq1Avx8uatJ3Ec6nnq6UzboXtWmViPQqSzpe3abalYzf+wmX
 CPH8ZswNfLDzHegthuzd0TJGjpdTHFbhTiKU1jdfLVrjR1qlpHeYscKSETpRU54SXA+l
 OFVQv64+JmUZ08eY6SrXI0DgZLF9b3I8yw3hbxM2SShlgnB9veztJnRG5OYo+pjcc0Na
 VLTw==
X-Gm-Message-State: AOAM532oFoyOvgVcClU34F80/Z+zSBKZbngSvwjoA80LiUvP+sUj66zd
 SH0tIBn0npRKZDO9yTHP/aY=
X-Google-Smtp-Source: ABdhPJwnwubEDrHTBkqhdLoABazk+jRR7YeJ5lT4vhfHV6igYkdGI/zT6Y5HhkkFuYmacU+/G1KpRQ==
X-Received: by 2002:a05:6000:18aa:: with SMTP id
 b10mr3280919wri.270.1633544336554; 
 Wed, 06 Oct 2021 11:18:56 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id e8sm5771913wme.46.2021.10.06.11.18.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 11:18:55 -0700 (PDT)
Date: Wed, 6 Oct 2021 20:18:53 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 2/3] arm64: tegra: Add NVDEC to Tegra186/194 device
 trees
Message-ID: <YV3ojTpZuH9HU5DU@orome.fritz.box>
References: <20210916145517.2047351-1-mperttunen@nvidia.com>
 <20210916145517.2047351-3-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FpULcs2kzJzavYtS"
Content-Disposition: inline
In-Reply-To: <20210916145517.2047351-3-mperttunen@nvidia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--FpULcs2kzJzavYtS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 16, 2021 at 05:55:16PM +0300, Mikko Perttunen wrote:
> Add a device tree node for NVDEC on Tegra186, and
> device tree nodes for NVDEC and NVDEC1 on Tegra194.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
> v5:
> * Change from nvidia,instance to nvidia,host1x-class
> v4:
> * Add dma-coherent markers
> v3:
> * Change read2 to read-1
> v2:
> * Add NVDECSRD1 memory client
> * Add also to T194 (both NVDEC0/1)
> ---
>  arch/arm64/boot/dts/nvidia/tegra186.dtsi | 16 ++++++++++
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 38 ++++++++++++++++++++++++
>  2 files changed, 54 insertions(+)

The driver patch adds support for Tegra210, so could we also add NVDEC
entries for that?

Thierry

--FpULcs2kzJzavYtS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmFd6I0ACgkQ3SOs138+
s6EF7hAAtjDqnfA0BIjpUwLKkQRm7q+hc3m6K5LsNmRSiQSUXP44LcnP62Bt3NIS
FkcljathUGw+tGjvKZp9wIpVKRniEPaDilx0doggljLByDhzaWeGXTjrEmrD/feI
GtPaUbEgJZKOaxvdbwBAcxDc4Q0/c4k1I7OwDi6VT0vTQg0Sj9jqF3Kg9NJkbPRj
xsBthVuCiEfoqcrdwCVbH6SpJkDUT2fAgeTaIuXtmV+5RxHqHhEzSW7QHyShmR1z
QUEc+84hflRHc8Q03QcmQCjh0hYi3CC7dnInFlMydvKg9O8TGyRr4mSZ7zFMMWlN
tZ2vf0wN20HEzmdfNJ2HDzuTJ8Cm6SUQltBv/5pxCBDwStkA81ceEyG0AV8qXl8Y
11/Qbg8KYyiroOY08TYHCsDoHoUEESKRzet6JhhI7Krzx6q5Cw3kC+DoitCzwgU6
X/mcDciehOe2dsW97trt1CdgpVINX4Sw3JWaU3iMBYim+acDwpF9okAwLuWf1a3n
rnPqUK7o7GigWmhKCp0+KjN9uagT5kYiREsSbD+M1vXIBDoz66557WRmF7Gyhi8l
BdGltBpsorFZlgS+EQOenfN+w02ZCgxlYbnBfl+Cpi1acwadceRbt3rjMkOg9gdj
OV2kNAvwfjAKwgsVkX2neOAE3rvd1LTl2KmlF1XOqVrHx0ue0k0=
=Wi7B
-----END PGP SIGNATURE-----

--FpULcs2kzJzavYtS--
