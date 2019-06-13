Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A759A4440D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 18:36:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D25989291;
	Thu, 13 Jun 2019 16:36:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A62789291
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 16:35:58 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id x15so10906706wmj.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 09:35:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=izY6IcSd1ZMUK/Og2sQCzdx3wME/KF6zRYuoKOMNJrY=;
 b=OdFoBSwGJo6nyCXrdFjefMDNGJul2JBhGIteV1Z5vTa2fSUaxXhQhd5t+s2uWpI805
 1c0SUY5szBQ0C/9AiXmeZ4niROXZBPvMSFd0yKXMm5Orc4muPXhwVFibrRdasCoPEAKZ
 nFf4EnmajraQRfPE4IUstxkYwE7wU5IFo+maeEybeDUfCXWMJF8Niea8mpRL+HsfGWKk
 baufS10ihhN/t0fYK4Kwrw5GTO6TzgfG56jTz4/NSBXR1dbFukncJUBR6PJGj5eVnIPY
 OHdg7SQ9k/XW8omeagJVJUlQ5IUdyznd8BTH5VKrC5DGhE3HBRSXgwIeUV3W7hBxEINh
 Vz0w==
X-Gm-Message-State: APjAAAX9CW9yohRMtAcO1sNyHUtOiP6MSBcaFzOhYxuwuLJOI11K+2uV
 Ob6UQoFQm9cmZRfzf3bjEnA=
X-Google-Smtp-Source: APXvYqwmiYoflXf96IGfJABVEJb23lFeN6/CgJLitA0txzxIHhfSiVMbBus85IRh+UNBBuWk/qRjTA==
X-Received: by 2002:a1c:5a56:: with SMTP id o83mr4223624wmb.103.1560443757034; 
 Thu, 13 Jun 2019 09:35:57 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
 by smtp.gmail.com with ESMTPSA id t14sm217646wrr.33.2019.06.13.09.35.56
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 13 Jun 2019 09:35:56 -0700 (PDT)
Date: Thu, 13 Jun 2019 18:35:55 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] host1x: debugfs_create_dir() can never return NULL
Message-ID: <20190613163555.GC3258@ulmo>
References: <20190613114522.GB13119@kroah.com>
MIME-Version: 1.0
In-Reply-To: <20190613114522.GB13119@kroah.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=izY6IcSd1ZMUK/Og2sQCzdx3wME/KF6zRYuoKOMNJrY=;
 b=uwZwK7xjui5QwA4PAcn29wYQe0DkQ7Tnd4cR71XuPGk0hOb2tzlWga3GQCW1ju6zXh
 dyE7Ry+p8pvlA8zV3oW1A8+EpZV1cugv19uwnKTiRlhN1hkVCN1Pjbo5No1vC8Tbdvo3
 3xWbT91wN2RzuUEOLrSh5FvC2W42RF5TW9r8Iqp6ST0VsGillrOihdyBzVOJzyLWdLKA
 zojxnYCKs91OVHh8AY6iuOnpK15gAQ6AvzgG3lAJH8HCdUp3J0rT7hgMXWrwQWO7xeIj
 LN9rm8JHxMzF+VfUClXJkhC+j3Eoij/DnTAB2P7lQiWCJm3TI/QvKq4eqVOAu1oTyBwc
 K/zg==
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2124598462=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2124598462==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JgQwtEuHJzHdouWu"
Content-Disposition: inline


--JgQwtEuHJzHdouWu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2019 at 01:45:22PM +0200, Greg Kroah-Hartman wrote:
> So there is no need to check for a value that can never happen.  No need
> to check the return value all anyway, as any debugfs call can take the
> result of this function as an option just fine.
>=20
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-tegra@vger.kernel.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/gpu/host1x/debug.c | 3 ---
>  1 file changed, 3 deletions(-)

Applied, thanks.

Thierry

--JgQwtEuHJzHdouWu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0Ce2sACgkQ3SOs138+
s6HtohAAuBwOWfNSd5DrSgcbmINlg+ErR56mOn0jMcWxYmAXsshG6USiEF5D+w44
V4jkx+IGs7r8Yuqz8SyIjjjPXBpDY0oV/nMowpjyQpgKS6/FQINxZ4qPb6wJl1Ab
YgERmRpVFPIV/KCQN+2GHQc6DBgp+OL/WYBTLESQsJVMTIbzaHrjRJxplR/60g8n
um2pDZ5Cn6gDK5T5K//IdVcFHYdt8z0SDof6fOSa5iKLoSW5dDa9Pz69awcQfqI/
L3BklL7jts5HFfNDku0iYljHGmssoaHrv+z5zkYleJkQYgpR3Uv4k+IiL0U1Mdeu
9n8CwlbCPtdrujBHQfDuQ8kGxxhQ4knkbyO8Ovw1aoQRBAOtRYRz7jxMzWTIaoC+
KUUPGkxnGopPrHBGZ++V6I10fL0f2EjYwECN40VVBF2aZHY5fAcpOtp47d1rLalO
dnjaSCcLjkJTAAalVdyA36IPEjKKA7LEFCczJkky0E+bUzDNMe+GuOWjBjn27937
CGOqZkT++LOo0Dyi8aZX92RxjINfNPHRgQox5FoQ7Fl5twxu/fgxj1IyAhLnDAa8
ayIduhhakQsvDDGdhbzlWpN78syxyj8JE+vFZ0Deoo2lddbXypj7fzbr5Xq31LvK
OM72mQ9IwoWLNFfqYDG+rDYZroG7qtdZf2ThT/LDxDGah+fnklk=
=NLIL
-----END PGP SIGNATURE-----

--JgQwtEuHJzHdouWu--

--===============2124598462==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2124598462==--
