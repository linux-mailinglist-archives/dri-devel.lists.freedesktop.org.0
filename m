Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8AA17553B
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 09:09:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EE2A6E0CB;
	Mon,  2 Mar 2020 08:09:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 164C26E0CB
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 08:09:16 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id e26so4116979wme.5
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 00:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=QIEDA5vG8ySnah38r3nnooZWjoF1SxANwiGeAOn5aus=;
 b=Hxc1+/2qLFumg1E3nHvgrhfGbDd0W6GUzhRrb85hVtcNCDE0oKietbH1+Kpx7nM9Dd
 ReJrof+d+xW/Ur3HvZ1jhZg1LPUbC98yCisPAfmvIaJR0aroL28uFIz/CCr/w8vnYYHT
 KYw6Ys4O0sxoGwto2oOMQ1j5lq4iNRi96mkGi67eyQIGK0tsEHpGlEdGNQblHPOWFtLI
 UyBAWOvfHIWPrNdbfKJkTcNHPVi76G0jxl8tKxeD8hbIZE8K74m335iwBgXi9faXHrEH
 eu9XqW5IWfEuS6JKo1UddrtLT8MH3DILVPqyTNDN2VQI50JWy+LZHQh09TWLzO/xK+Rn
 xb8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QIEDA5vG8ySnah38r3nnooZWjoF1SxANwiGeAOn5aus=;
 b=FqI+xw2oCqQrTXB1MOFziltHWw5z/tLZjJZbZiJOpvUQUUlJnagOf1k4oUJYao/wXH
 waMRUwKY9yXxcszB4T8qN6cmMRI/0Aw1aSYVUNX1IfMZyRxRuD4q8Az2pFbG9TujgqcO
 NpJESz0W3tvXiexAS79iAUu9T6IHl22TbpGd+wBsreA4VkIbENK6lTkq6qBnC4JJoWAA
 wePDvmfQC7YjXBC7nhsNuFx1kPvQrvVg0TjJB8T1qX/zvNDwlttARvkWUcdDrtuKdn/A
 rRd+hF9vtkE5kzFF3ySrVNJp2zlwu+BhN6lpT7UbJWJikhbI2UN5o+f0tE7CcUZ3d8On
 buXQ==
X-Gm-Message-State: APjAAAXtM/e2KQ2qP305ePYs58ziI0ajf/A9gvecSfR0cuTiNTQ744+F
 JzIWYMt4WkOCTi4zlNWUXx4=
X-Google-Smtp-Source: APXvYqwmBD1RYu1hJm1Lol7EWN8ITOWVoo4HPBmYpeRt7oZoBTO86LIDV8S9H3cf6XaYxk4rcOf1ew==
X-Received: by 2002:a7b:c305:: with SMTP id k5mr19264575wmj.189.1583136554745; 
 Mon, 02 Mar 2020 00:09:14 -0800 (PST)
Received: from localhost (pD9E516A9.dip0.t-ipconnect.de. [217.229.22.169])
 by smtp.gmail.com with ESMTPSA id g25sm28977284wmh.3.2020.03.02.00.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 00:09:13 -0800 (PST)
Date: Mon, 2 Mar 2020 09:09:12 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: abhinavk@codeaurora.org
Subject: Re: Reverting https://patchwork.freedesktop.org/patch/336850/
Message-ID: <20200302080912.GA1690850@ulmo>
References: <8bec962794df6fd8f1384d457060234e@codeaurora.org>
MIME-Version: 1.0
In-Reply-To: <8bec962794df6fd8f1384d457060234e@codeaurora.org>
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
Cc: aravindh@codeaurora.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, varar@quicinc.com, seanpaul@chromium.org,
 daniel.vetter@ffwll.ch, treding@nvidia.com, chandanu@codeaurora.org
Content-Type: multipart/mixed; boundary="===============1408869545=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1408869545==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xHFwDpU9dbj6ez1V"
Content-Disposition: inline


--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2020 at 05:35:51PM -0800, abhinavk@codeaurora.org wrote:
> Hi Thierry
>=20
> For DP drivers using MSM chipsets, we are using drm_dp_link_configure,
> drm_dp_link_power_up and drm_dp_link_power_down functions. Here is the pa=
tch
> for reference:
>=20
> https://patchwork.freedesktop.org/patch/343346/
>=20
> We will be posting a newer version of the driver soon.
>=20
> For that, we plan to revert https://patchwork.freedesktop.org/patch/33685=
0/
> as now there are more users of the functions and not just tegra.
>=20
> Let us know if this is the right approach or shall we make the required
> functions local to our drivers.

I think reimplementing these locally in you drivers is the preferred
way. It's not so much a lack of users (there were 5 or so in total when
I made the change to remove these helpers), but rather the general
approach that was being criticized by other driver maintainers. I'm not
aware of any of their opinions having changed on this subject, so I'd
recommend going down the path of least resistance.

Thierry

--xHFwDpU9dbj6ez1V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5cvyQACgkQ3SOs138+
s6FuWRAAic4BmNGPInfnz8tpJ3zMdR881tl4xLHBVnd0cIlAsN0wR5BgQdyoJ6CJ
5VrRknoD7ksKAF5NSbpfhcfL+MXM8co0nLGdBsQbbOyIh15q2/13csHlgaGq+V1E
6HvPbdXrHHOwy0fLs24P2Qgr/K6lJ7z+Dd6ZOMfJVd8XvKiytliEPNi/hj7UrkBV
fdgrMxV4I5n1j3+xjMIGTUnUURj9GHvHCxNChUtxoCpcK/dEaR6ycX6yo2HuNYBL
/BYHow1Qls0b+Q4iKjpd4wMBtRE8TDRNe32bV/JnbNL3QIFMq0pkGMvzTJyFbQD3
psmZmy4o4KzzDYifvtvhOF45+7SbYbcEwikBuDLv8FnuKXkj4ven51apoAexzZie
DXrG9lojGc4BuHwWYJMrp5EjGHBNGwtUFmBblLMap/A4iVSAgxlxQSnT1tS9RXE0
4g8u9G1iOKwMvOFkCTAvUjzuR52/esEHqWRbeyWdggehESQFhOrz8nGcN3fLYbD0
EKUoyOs1oKsnFmA2LdJdJyMfq6VesIjLizs9tWdMGSpG7XDXIzJOvzcnJp8DRzRB
TQRoa/Lg3Kopf3UeMHMWm1UY0ULF/YWc/DDkD2RxPPSpbof1T/RDnsVy5JX2Hltf
s3M/dH3m/pQjGmeO6hP5j0cxtRPaURdy1Z8e4TbZDp/nI9qPsIw=
=Ac70
-----END PGP SIGNATURE-----

--xHFwDpU9dbj6ez1V--

--===============1408869545==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1408869545==--
