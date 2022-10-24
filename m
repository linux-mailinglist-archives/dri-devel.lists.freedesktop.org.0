Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C20A660A924
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 15:16:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F44610E621;
	Mon, 24 Oct 2022 13:15:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 074CF10E621
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 13:15:57 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id a5so18037626edb.11
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 06:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I99K5okNHj9DY0iCHvns9gSnT1ZJFo2RdmiNrPZQRxA=;
 b=fjjh+VqoY24xpSkbD5FlM++9ADwleBq4rStVCyBkKmVwwg0D0cYLIhxcnvP2FcRAdC
 0sIuuL2nJhgoVovJUCNfaytjlctNZlK/GIVzGFea302vmyab9pDPieiWbp5Ln3+wiOYm
 tbGsTZqRofcMRwQcYkc66ILWMcfo2dZUGEC5ROxLE0edhkSOCOkWFa2Hg7wG12D+RdRv
 Kmdsb21rKPICe4ULCWF8/ejahaYsgOb6HbngN+eOFQ2i5Cr2wQLUkjf5tAlc3xdNH3Q8
 XvKeX3IVBsq8I+lldDB/ultMdooUmwjKJwsK91QRXhLC9UhJSY5T7fRNGPkzmz4CscKh
 cAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I99K5okNHj9DY0iCHvns9gSnT1ZJFo2RdmiNrPZQRxA=;
 b=o2phD+zyRnEZMwlhC7CANiOKOK1Dxh/shfE6/35GsPPnMRQn0wXk5KdfBCXc5O3GQW
 DmIeB5g3aPxWEGQ8bRRKYPl5Anb+0Gt7KrNxUpDG/KqnhEAPuBXSiK2t1hL65lzsE9bW
 moRLnJ0YeNYMXTE4iGR0/VqIGqx7t1WJOLNnb53buctyN3hkt0IGKeaIcIQToUH6hPxs
 tUUKu6gCnnvH2L/AVkOB67MNOMAxa8eyB1SNkH3Prhm23L1TwPAAnIKqIAt1/Qy1Z0wr
 I18XdOZl9HX9+39dApYa2PJt2fpTHocK1ICLncBGKEwdJUBU/+neeEu593DnNs74frUn
 CrnA==
X-Gm-Message-State: ACrzQf1tpq4Flw3AYC4vFL5SXgatunAE3LKLox3bv07sUPheb67V7dbd
 Tr78BPeCWIvekEfz9hi5x/M=
X-Google-Smtp-Source: AMsMyM6LUWBeG60cTX4ICueYfZGzsbWQNLdvNJls+Qeur6c0tl8Do2q96H3YkgnFwA95/bShFJ58Uw==
X-Received: by 2002:aa7:ce09:0:b0:461:5406:20e4 with SMTP id
 d9-20020aa7ce09000000b00461540620e4mr15004323edv.5.1666617355456; 
 Mon, 24 Oct 2022 06:15:55 -0700 (PDT)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a056402359000b004589da5e5cesm18755197edc.41.2022.10.24.06.15.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 06:15:54 -0700 (PDT)
Date: Mon, 24 Oct 2022 15:15:52 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Mikko Perttunen <cyndis@kapsi.fi>
Subject: Re: [PATCH v3 0/8] Support for NVDEC on Tegra234
Message-ID: <Y1aQCG3IxL+SNTv+@orome>
References: <20220920081203.3237744-1-cyndis@kapsi.fi>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KWZej2K6xFmsTmcs"
Content-Disposition: inline
In-Reply-To: <20220920081203.3237744-1-cyndis@kapsi.fi>
User-Agent: Mutt/2.2.7 (2022-08-07)
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Sameer Pujar <spujar@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Ashish Mhetre <amhetre@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--KWZej2K6xFmsTmcs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 20, 2022 at 11:11:55AM +0300, Mikko Perttunen wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
>=20
> v3:
> * Updated patch 3 based on comments
>=20
> v2:
> * Updated patches 1,3 based on comments
> * Added Acked-by to patch 2
>=20
> Original message:
>=20
> Hi all,
>=20
> this series adds support for the HW video decoder, NVDEC,
> on Tegra234 (Orin). The main change is a switch from Falcon
> to RISC-V for the internal microcontroller, which brings along
> a change in how the engine is booted. Otherwise it is backwards
> compatible with earlier versions.
>=20
> In previous iterations, firmware was simply loaded from disk and
> written into engine internal memory. Now, the engine has a
> bootrom that loads the firmware from a carveout where it has been
> loaded by the system bootloader; however, we still need to tell it
> where that carveout is loaded and some offsets into it. For that,
> the first patch adds a new memory controller API to query the
> carveout address. The offsets are read from device tree -- the
> expectation is that at flashing time (when the firmware is also
> flashed), the flasher also delivers a device tree overlay with
> values corresponding to the flashed firmware.
>=20
> The currently available Linux for Tegra release doesn't yet
> include this device tree overlay flashing, and the firmware version
> it contains is incompatible with this series. The plan is to fix
> that for the next Linux for Tegra release, but if necessary, we
> can postpone merging of this series to once those changes are
> available.
>=20
> Thanks!
> Mikko
>=20
> Mikko Perttunen (8):
>   memory: tegra: Add API for retrieving carveout bounds
>   dt-bindings: Add headers for NVDEC on Tegra234
>   dt-bindings: Add bindings for Tegra234 NVDEC
>   arm64: tegra: Add NVDEC on Tegra234
>   gpu: host1x: Add stream ID register data for NVDEC on Tegra234
>   drm/tegra: nvdec: Support multiple clocks
>   drm/tegra: Add code for booting RISC-V based engines
>   drm/tegra: Add Tegra234 support to NVDEC driver
>=20
>  .../gpu/host1x/nvidia,tegra234-nvdec.yaml     | 156 ++++++++++++++++
>  arch/arm64/boot/dts/nvidia/tegra234.dtsi      |  27 +++
>  drivers/gpu/drm/tegra/Makefile                |   3 +-
>  drivers/gpu/drm/tegra/drm.c                   |   1 +
>  drivers/gpu/drm/tegra/nvdec.c                 | 171 +++++++++++++++---
>  drivers/gpu/drm/tegra/riscv.c                 | 106 +++++++++++
>  drivers/gpu/drm/tegra/riscv.h                 |  30 +++
>  drivers/gpu/host1x/dev.c                      |  12 ++
>  drivers/memory/tegra/mc.c                     |  25 +++
>  drivers/memory/tegra/tegra234.c               |   5 +
>  include/dt-bindings/clock/tegra234-clock.h    |   4 +
>  include/dt-bindings/memory/tegra234-mc.h      |   3 +
>  .../dt-bindings/power/tegra234-powergate.h    |   1 +
>  include/dt-bindings/reset/tegra234-reset.h    |   1 +
>  include/soc/tegra/mc.h                        |  11 ++
>  15 files changed, 530 insertions(+), 26 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,t=
egra234-nvdec.yaml
>  create mode 100644 drivers/gpu/drm/tegra/riscv.c
>  create mode 100644 drivers/gpu/drm/tegra/riscv.h

Applied, thanks.

Thierry

--KWZej2K6xFmsTmcs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmNWkAgACgkQ3SOs138+
s6H1Ug/8CBt81YrUCMB0wW9UNf0O1bOW7hIhb1tgxsr2RMVYK3NwPeZ2ohL75GUw
SQXTWEbbail1dIL/f1pV+GWn91fY9L9RblJ8s5YUe9j5kEsoxh4Ein1HB53vrahz
ibKVTqNGxLQBXqtSUfARQ4HpLUnlWmL8ali2+bnOl18HmUqWIPvUCRq90Hyq1Ryt
TKR4lMzVjoBn0ewUyD1bMkVwT8i+cux7my/HVUnkJtoVKptByyY+Gzi9wgo+isw2
u8L/uk7xruuWQUl7pWYLK/NyaNA4mddZzav4Yrt5tdV385OP2S8L6pRsdpuHA5Mq
TI3DItWcQWAGLQQJazBwigOPn5Ib1xBUgCjVmkjbfmE3bdWKO+4OVGxg+Xrw59v1
lGBkgg1V0UdKS+3hQbm9UGRK2ukNgvLIhuuoLs5KIL5Cx/5U+gpheb4L/Th2ixRZ
yBeUDQ4EAxd0DraYp7hWwDbab62B0wE/kbcxgPWO0TaIdWqNHYSbZ46YJz/3OlYB
NBG3qPRS4gh8buxqQkDM6oOjBs99a/xfRM9dgKrFhP7WKParzC/rn+HFQUD5yohz
+k2E3e16iiU3gqLvUndfhMBDUoIdWK+BI28gY3pK97fx6J4yUDMXfKKA52x/f+6C
PBaVTY8ROfzhPEj4yQoGNqzjMZarclKrVQQtGj8tuUEG3lsWpE0=
=vucY
-----END PGP SIGNATURE-----

--KWZej2K6xFmsTmcs--
