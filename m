Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8153E101954
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 07:25:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE6876E12D;
	Tue, 19 Nov 2019 06:25:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E516E12D
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 06:25:39 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id z26so1810180wmi.4
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 22:25:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vZm4sOxMyoOoYclUyl/vfhH6u2IOXUm4suTk6nszyok=;
 b=rvhdZKepgxC9jNm2Us3lI/i/17td/314X9VwvF/ZOrxK6QOdSmsfm2nw0FZS7IlZhO
 mP9NsTsSUKqPZNl+MsRoV65/HaoYwTP0j0+B4LrK9h7uacbUzvVZE/WlWuvm7r/Z+xLg
 mrxlDs0VR2+Pwmx/7zYDdQ1VdJByC2URQAp2eDugV53Kutayt/fc/jEpAHv4sNyvwvAJ
 C5bEPsyfx2u6sDyJC64OFU4ylhe8YxMPjdmstvCQrphC7WjqrwBiIW3GENuVzbFI2yOO
 8v/F5z5CRhT1DaHHcIa3zlU7qbvUJXlBXUrQQz/CwG1MrDTYvDyr5lCAr8tlRzHSqIn7
 FHTA==
X-Gm-Message-State: APjAAAV4W41G23Jtk1MAxP7TB03xOF6FIVVdpR1vCeMy7lnsE6regD6d
 kYRdml3y10AXf2PSgCyRls4=
X-Google-Smtp-Source: APXvYqyAis4bl7PWhIuYsHN+2KSsTzBWr9seQcMALKCWwQE4VgSk3xAvaxjRWMB71V2pZdmbj1x2DQ==
X-Received: by 2002:a1c:6588:: with SMTP id z130mr3168359wmb.87.1574144737937; 
 Mon, 18 Nov 2019 22:25:37 -0800 (PST)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id h16sm25071871wrs.48.2019.11.18.22.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 22:25:36 -0800 (PST)
Date: Tue, 19 Nov 2019 07:25:35 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 08/29] dt-bindings: interconnect: tegra: Add initial IDs
Message-ID: <20191119062535.GC2462695@ulmo>
References: <20191118200247.3567-1-digetx@gmail.com>
 <20191118200247.3567-9-digetx@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20191118200247.3567-9-digetx@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=vZm4sOxMyoOoYclUyl/vfhH6u2IOXUm4suTk6nszyok=;
 b=Yiqd6pjG6ktM3XxyjCUZa/7AMM+8ozQQGaJKCGS8o9raWOxhMoDyKXtkElV2yXWa5M
 N9zltULthX97i9mdo2fUgNgJkfw23e4zCd4o5+HF2bk81P+1YwwSwmeHu2SZRtwoFfnx
 pncCoueE9uzydnvstQELW3XKJCDPL0i8veErV6a05MHNws5zgPTpbjqqho9Kqi6srQ86
 YewbCOP2VIiSN5HDc+n1ftJTmpT7UXowjyXfbF7zjPIFJUORMRQEiE+YsYwPtBJIl4W3
 osKo5pou63ks4M0vq6DQZ8fpLCUr79ye5i3qiX99o7JrnQFFMGTa0cOOUfa7BlLVb4FN
 Vu+Q==
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
Content-Type: multipart/mixed; boundary="===============0908922581=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0908922581==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2JFBq9zoW8cOFH7v"
Content-Disposition: inline


--2JFBq9zoW8cOFH7v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2019 at 11:02:26PM +0300, Dmitry Osipenko wrote:
> Define interconnect IDs for memory controller (MC), external memory
> controller (EMC), external memory (EMEM) and memory clients of display
> controllers (DC).
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  include/dt-bindings/interconnect/tegra-icc.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 include/dt-bindings/interconnect/tegra-icc.h

There was a bit of discussion regarding this for a recent patch that I
was working on, see:

	http://patchwork.ozlabs.org/project/linux-tegra/list/?series=3D140318

I'd rather not use an additional set of definitions for this. The memory
controller already has a set of native IDs for memory clients that I
think we can reuse for this.

I've only added these client IDs for Tegra194 because that's where we
need it to actually describe a specific hardware quirk, but I can come
up with the equivalent for older chips as well.

Thierry

> diff --git a/include/dt-bindings/interconnect/tegra-icc.h b/include/dt-bi=
ndings/interconnect/tegra-icc.h
> new file mode 100644
> index 000000000000..e6b6a819434a
> --- /dev/null
> +++ b/include/dt-bindings/interconnect/tegra-icc.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef DT_BINDINGS_ICC_TEGRA_H
> +#define DT_BINDINGS_ICC_TEGRA_H
> +
> +#define TEGRA_ICC_EMC			0
> +#define TEGRA_ICC_EMEM			1
> +#define TEGRA_ICC_MC			2
> +#define TEGRA_ICC_MC_DC			3
> +#define TEGRA_ICC_MC_DCB		4
> +
> +#endif
> --=20
> 2.23.0
>=20

--2JFBq9zoW8cOFH7v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3Tit8ACgkQ3SOs138+
s6FbJQ//VVTt70KCgYKF7BpZnoqtwCSp/64y3GlIbyP1biK5lLzBZzmmtlm6ivKf
pqxNy8JoBbunV+2+mNyT5YWfKXEcpFW/eLPcklnZwFjVVx9j5suAzdHeybkt4G3h
g2ChCvkLAD/oDmmUvKDje+Mo51CdDlmk5FgKiZQoBr5r3wMCW2hg7aCiv54VgQJt
uPv+7kFsNRiaku0ZoW9iiDKPAhdMT7PDAoHwGX4z+ugBha/iFr1q24olO0Glub75
j35vMrNPXZUEP74vlGyfqhMrOqZoIEuI8vTbEe9pBqbgAYTJEclUIrwt9oX3u6sR
58My8zbNHmFD1P0xNFqLTDyKeOhHAMkTofF70v88IiL0YH7hTsxPFIIN1T9Z4l2F
lPpAScOhh/8pNOJsoC7TJgssD+VFJMTwU6CZTEgcR4rarjN1JZIU1b/+NqyU+3n9
bbIZ1g7hXLKuldou1GENsFUFUomaQg+0+nXNd8McDufr6wNp9qwEaI4aGdFvWaxK
CM7FotJCcqq4OejmSnAFypwWoPEjkAKbmWm7C8aINkoA3W7Bnq7kNvCm900WXX0r
/Al1ZCihymQE7Z03xBGlZqHmHB936PInmasQ+QhQeoAhJ6cWXY28XYIwsUnhy/IN
MVm9blRz9OFwT1y3iHz7ow7XxFLljf//K1VKFcXhM4orcsqQd2I=
=lq7Q
-----END PGP SIGNATURE-----

--2JFBq9zoW8cOFH7v--

--===============0908922581==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0908922581==--
