Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 561AA27543C
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 11:19:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D64566E903;
	Wed, 23 Sep 2020 09:18:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 783B46E901;
 Wed, 23 Sep 2020 09:18:58 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id y15so6288754wmi.0;
 Wed, 23 Sep 2020 02:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=vc3zpOtvJoa/ylymhDilbqGQbXCLa7ArGe2ZpgzF3/E=;
 b=cTcoUlWyVeeHoN+Yj83s+D+EgV6lPfTrRQTv60ITClXrjkWurFjT9nNyAhTqbv36h5
 qyJnzCBiZca1uDzlvhOd4IWUTxXbTF+cNdT6h0AlMrdP4D4B8oGR+qYSUumBVNzR2by6
 z7LlkKV5cRc8YQdifVw1JspRGPhvQhD25eEYb14OUsdHJ5liuwrTMlyEqGnJVESg9TlQ
 iYWXSMd16hJq+h9LPvA6J+/pYSweMOkaR9w+Su234TaJANcCnBWgfwzTZy47bwCIHhjB
 54r95ZhWmwqdF9VnHywtJZFfrslokMaIYEpn29irtXnNO+UUHBh9vCk5bom0/VH9s8hN
 uhnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vc3zpOtvJoa/ylymhDilbqGQbXCLa7ArGe2ZpgzF3/E=;
 b=rL7ttWlCL6KLRCThQUOHrtKNZTK8y9ahdzZm3e8LL6BTfjVSjjXfWKTApqmmp2sOY1
 uKDRkexSOeTqR5KGkkn1vngwWBGBvMPS31aEmGMV5mzA33t3y2vy0Vl4eonn8s649IMM
 A/Vm/lCkzT4pEQ2kIQsTsxPTLXFU2RqTMmj6B+gy/lX6ZJ76jeQR73g9bNes7z6Fba9p
 89YFNUJQI7Gfj6/1xE2AW8RsSXhPT40UgOI0DEw/6oKH4kX03J4b0yqPa3MJZD3ud208
 vr2xonVaxZ4OnuDIFVgTn+LakYPekI5X28tlCjOtDgFLh9UocgQ7fuk2MXOhy+BveuGE
 Sm1w==
X-Gm-Message-State: AOAM533p4H+/VJgSLVwRdx5hzUphy/ifO4tFsZ9jvhTkRZqYDBp7KAe5
 vP1m86R/1yEmS/+76dOwZbILtAuewCk=
X-Google-Smtp-Source: ABdhPJyh+AUIWvtviKlDbKuhh5oBmYxGQbxL3IN1eWaBa/GU7CbUTBo7QhaVbANIdWWeSm8FMTU3DQ==
X-Received: by 2002:a1c:7714:: with SMTP id t20mr5624493wmi.55.1600852737120; 
 Wed, 23 Sep 2020 02:18:57 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id d19sm7585733wmd.0.2020.09.23.02.18.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 02:18:55 -0700 (PDT)
Date: Wed, 23 Sep 2020 11:18:53 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: Re: [PATCH 0/6] drm/nouveau: Support sync FDs and sync objects
Message-ID: <20200923091853.GA1229032@ulmo>
References: <20200828104016.1672195-1-thierry.reding@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200828104016.1672195-1-thierry.reding@gmail.com>
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0756955067=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0756955067==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/9DWx/yDrRhgMJTb"
Content-Disposition: inline


--/9DWx/yDrRhgMJTb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2020 at 12:40:10PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> Hi,
>=20
> This series implements a new IOCTL to submit push buffers that can
> optionally return a sync FD or sync object to userspace. This is useful
> in cases where userspace wants to synchronize operations between the GPU
> and another driver (such as KMS for display). Among other things this
> allows extensions such as eglDupNativeFenceFDANDROID to be implemented.
>=20
> Note that patch 4 modifies the ABI introduced in patch 3 by allowing DRM
> sync objects to be passed rather than only sync FDs. It also allows any
> number of sync FDs/objects to be passed in or emitted. I think those are
> useful features, but I left them in a separate patch in case everybody
> else thinks that this won't be needed. If we decide to merge the new ABI
> then patch 4 should be squashed into patch 3.
>=20
> The corresponding userspace changes can be found here:
>=20
>   libdrm: https://gitlab.freedesktop.org/tagr/drm/-/commits/nouveau-sync-=
fd-v2/
>   mesa: https://gitlab.freedesktop.org/tagr/mesa/-/commits/nouveau-sync-f=
d/
>=20
> I've verified that this works with kmscube's --atomic mode and Weston.

Hi Ben,

any thoughts on this series? I realize that this is somewhat suboptimal
because we're effectively adding a duplicate of the existing IOCTL with
only the "minor" extension of adding sync FDs/objects, but at the same
time I don't have any good ideas on what else to add to make this more
appealing or if you have any plans of your own to address this in the
future.

Thierry

--/9DWx/yDrRhgMJTb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9rEvoACgkQ3SOs138+
s6HANw/5Af6khLOcxfr4yRVZaj3+ruBonBkoGTps2QoXCAs4V0iKyFS4kqU3k4Pb
Q9cdMYhOcNTMA4IJ3EkVafROmPXp3zcTS7u5KClEZksYjp3qj89hjsxqq2pHqA2S
ESj3Vo11Kp0DwWzj2fTKbm6s3KjCZTWt9wY4Fl3/QD6s+OcjQUNlI0pTg3m8IBrz
nmZoX+tN5N3HmkJLxISG7Ejg4Qt+ked9az14v6YKMHIDejIDm5uqu2bbIMHrDI5G
Sokcxur7WWeCus3uoEbZc8sgotQQr74WEhUpTJnRbIK7jAodGBgbrtvW+Ti1icc5
S4Wc1EaZMfySCzxLJzRGX0gXKxyLAUT/VMWmRQRj1KvjZNdKm84LSZOce1Yg95+t
QgUUoJlLKREG3iq5Xb1wtxu9fxmlztmFSI1BX+tDEog3UmUt8R070+FlDM4GCVb3
7BLJ+/Lcn6wcm68n764gKAdiA8Hya86iSrpScGP599zFRaBro6ZaLBoMg2uqA1PL
oQLL9YsEusCWkOTPgR4Z5/oOKmrYUJy0W0bl/924NCuq8QMcYvyaEu7tLrlFVbM5
c3KtbSbwCzjdRX7rhqeHCBZahP5dZ5s3qt5urcBmNQGWS8PlBKPVlICFkBzGsKiV
IgO3S3wV5+HilEAM838z9eGpxtHx48Sl52r0ru+VfaO7jLI0VQ8=
=loRU
-----END PGP SIGNATURE-----

--/9DWx/yDrRhgMJTb--

--===============0756955067==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0756955067==--
