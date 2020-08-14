Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5371D244B09
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 16:05:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EEB76EB6C;
	Fri, 14 Aug 2020 14:05:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD9606EB6C
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 14:05:30 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id t14so8027999wmi.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 07:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=g1UtUzFGY5WD+bjAp81tWnjppmFMs6OkuMB6Fyg25so=;
 b=hk8BvslApEp/T1aKczZHqvdRZ8KZu9xhtINW+53NT2H5M/ZAzl2AAkZOrtbbEAMTTr
 PMcYs+crOCJESys+iGRlzSjxApFZW6WM578a9H9ZLW6tlyS61PNp6BrO/KuPnBz66aNo
 IkMT8FwjsOK/WIKF2QbP7QltIOpZ73bVcBrwQgfYtny34PZxtuUey/wgK+v36FEhhCgQ
 OtiDCmTkkI//jdo2p0yx0k4LVVBNdrpb7BYGgQjON8RC2i5YYMb6zM/nvYECUNf47Vsj
 mNnnhsFNwILSIy9YXL29kXu/jI7aA/57YQVamIIWpOtTNPXmXHHdlBUgnzXH+dNUlGxz
 DtrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=g1UtUzFGY5WD+bjAp81tWnjppmFMs6OkuMB6Fyg25so=;
 b=pp8yDi59B9pob2eB/Nump2m/P4E36P1wKjrLA3PR2d4mPlKH6mfdZ/rtztP01b+YVA
 js7RFmC9fWEfklAe2aXn7guUGezpaODRKVdTuP1dTkzxCar/XtM8x5R7mCrKYFtbYG7d
 fe6AaDFxwyikzAEDXv/4EEF8/4LJN6ptOx29if6zDzaUhmsHuJmhxgchhBllsRBqjJi+
 GFPUmIe5lkIT4gSsEpf2S7vcCWdhXbG43FIHIgAIt83WrRIpVFO/N3/Z4j3bLC6n4B/R
 1sx5/KfQx+zfBir1/HGoDVluaayvfkrRQ7mqJ3jN48Qv5qWfUx3iXciYm1E1toFz5Rge
 etaA==
X-Gm-Message-State: AOAM531f0brlo8fWuOSnq9lD4MM44Mxi3Mr8PzqkBnjkVQ7b3xHTXlMD
 a6a5t0KkdiH5NBKW3nc5ECo=
X-Google-Smtp-Source: ABdhPJwDh13eN3pkYrLRZGrcxdf1FcGofpy38i1Vjxy54eYClYLDxkXMD8sieixgaobs5e9invEiow==
X-Received: by 2002:a1c:238d:: with SMTP id j135mr2596466wmj.71.1597413929493; 
 Fri, 14 Aug 2020 07:05:29 -0700 (PDT)
Received: from localhost
 (p200300e41f10ca00f451c56750ebc625.dip0.t-ipconnect.de.
 [2003:e4:1f10:ca00:f451:c567:50eb:c625])
 by smtp.gmail.com with ESMTPSA id 65sm16041864wre.6.2020.08.14.07.05.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Aug 2020 07:05:28 -0700 (PDT)
Date: Fri, 14 Aug 2020 16:05:27 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: James Jones <jajones@nvidia.com>
Subject: Re: [git pull] drm for 5.8-rc1
Message-ID: <20200814140527.GD556087@ulmo>
References: <0e882aa7-d0ea-19b0-a13d-4f7bc0d384aa@nvidia.com>
 <CACO55ttP_J8riS_PhCG+-Br+AvsYKRTLg_+wn2pXF9kgXkmjeQ@mail.gmail.com>
 <785eb70c-d9e7-dbdf-b044-337618fcea1a@nvidia.com>
 <20200812174005.GA1705@kevin>
 <2c5cf2e8-afd2-446d-1f27-2c225c65d447@nvidia.com>
 <CACO55tto89kT-_QKGjQ50Ht8U-4Dop6sTjNsbr1qHXhgNuDHEA@mail.gmail.com>
 <CACO55tu1RWZ0ZGcMcrU-snT3CkJtwxawwJ9990-5a+hpByh-Hw@mail.gmail.com>
 <CACO55tsfV9pGijOF5F=dLqFhpXgPSArGHXa44Mt3eRBk7z-X=g@mail.gmail.com>
 <CACO55tsEjGUhfrBdbcpT9xLa8N-T0JR-t7xFBA5pxDZ5+NiQhg@mail.gmail.com>
 <efb830fe-9ded-f5d3-6944-45adbb2a1f80@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <efb830fe-9ded-f5d3-6944-45adbb2a1f80@nvidia.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <treding@nvidia.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Karol Herbst <kherbst@redhat.com>
Content-Type: multipart/mixed; boundary="===============1051182746=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1051182746==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EP0wieDxd4TSJjHq"
Content-Disposition: inline


--EP0wieDxd4TSJjHq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 13, 2020 at 10:45:34AM -0700, James Jones wrote:
> I'll defer to Thierry, but I think that may be by design.  Tegra format
> modifiers were added to get things like this working in the first place,
> right?  It's not a regression, is it?

I recall that things used to work with or without modifiers at some
point. That was basically the point of the "pitch-linear by default"
patch, see:

    https://gitlab.freedesktop.org/mesa/mesa/-/commit/9603d81df05105857b676f20dff964ef3ab0ecff

If we don't force pitch-linear for cases where we don't have modifiers,
there's no way we can properly display these as framebuffers because we
lack the modifier information at the kernel level.

Thierry

--EP0wieDxd4TSJjHq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl82micACgkQ3SOs138+
s6GK0A/9GE/OIpl4oK/bbWTrHklP1hvtI7F+zn/bqd5F7SQlmJQHj71+O/VIXrra
jWinGrFaQv3M+Pqctp6D54725oKjzwMj2L422NBtXTQg+HhI+pGjO0B9m4N0q4mr
axZQy3XZkwyplWAgnnvgwhtJhKsAnSa+ubfdFEI65519Bl1OKESMKSll7+Rgn2nj
i0dCZZR6LI5ILAonKMdlr+AtCuGHVvSVpJFZpXh8Jcrhp4nFrL4P20gszSjZhnxX
xPWYDb7DF4GG0mYn50Dw1TnmqTA9uyx8ykxIERW06aI53LCAMjGjsWlK3W4J6Kjr
YpoZjDzHYvkW+EXuQotHbP13F1Ca4zLaJjtwuPDCtqhInQ3Mn3uWDKH2O8h7wvR2
b7OADAzmiiY4Nw6te4KK0VfBbUGF9cix8zZa6E3lBAKAXH7XKUJKcK4YeNA054Bt
WTyHi/cAvNQj7luj9IBN/e5MqagKD8/MKjU7czq+CLg8LGb4kEar6kXRJ3lIsNhD
xol85SoNoqxTCnyXR6QvHYzDg1nDrlLKhHxqL8tnqA56rk+VZAr6Mmz3TNeNc53m
3fkAsjNtbG1XQsKp0xzIHOEp6IHWR+lGd2op7M5GM/TYNOon6ZR/FG0mjJo4KADI
scURVR/ThB48gPXBjMv+LhrWQbHGqVoHYzwoGmgiQmw+83wi7uw=
=vcj2
-----END PGP SIGNATURE-----

--EP0wieDxd4TSJjHq--

--===============1051182746==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1051182746==--
