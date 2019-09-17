Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA41B4A07
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 11:05:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFB666EB78;
	Tue, 17 Sep 2019 09:05:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 992F36EB78;
 Tue, 17 Sep 2019 09:05:54 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id b24so2143299wmj.5;
 Tue, 17 Sep 2019 02:05:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=M44Zjaqo7wFf62VKvyhiaZbdHUux7JJCBec1gRzNBlA=;
 b=JAFESjbT+wUrgRqLyfEBxJlEfSJ4xXPVK4SoTFuH3Ap2jWpbJ9XQgjdiGhAJtdmnj9
 omC7ziZfw3IcAtTI1mJRfkZIw/ghjUPq11C/GANS2FvBAH0HfUw9L+1Qg4zahGFZVjMA
 H1tNC/eg4Tmma9ZoLm3I+tb49cY2vfm7v/SFnqaGQ4kAt3BmvL4MjGg9tJxsHj5A5qmb
 T+QUI8oGb2mfj+Jg9bebnWO0vfSdN5N9M6bS6APtPP112RU8RJ8F6v9NmtAJCzVkUPoA
 uP9JMiMPa4u++j29lxnxeJ5FkawbA9ERCi6UdZ9GLoq+WxkaFpThWKD0NyORJM0FG8Pf
 bGNQ==
X-Gm-Message-State: APjAAAWQaJhgemo4n8tB2/5C0Z7FKOTWlySYmnhJzyQexoUNnz9SX0H7
 0iHhTws0vb32Xy/2P1Q4nm8=
X-Google-Smtp-Source: APXvYqyjONh9bpXTYMiYxlSyqvxcCuVMjDgcQmhEaNIoWlkmUhvkVsBO7CYUffVR66/GeZtOTLck+w==
X-Received: by 2002:a1c:a942:: with SMTP id s63mr2533556wme.152.1568711153064; 
 Tue, 17 Sep 2019 02:05:53 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id x6sm2231014wmf.38.2019.09.17.02.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2019 02:05:51 -0700 (PDT)
Date: Tue, 17 Sep 2019 11:05:50 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [Nouveau] [PATCH 2/6] drm/nouveau: fault: Widen engine field
Message-ID: <20190917090550.GE17854@ulmo>
References: <20190916151757.10953-1-thierry.reding@gmail.com>
 <20190916151757.10953-3-thierry.reding@gmail.com>
 <CACAvsv5VKMW8fuMEj=XYAezpKVVxqem-MvKFOwDMMh2dqjFRLA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACAvsv5VKMW8fuMEj=XYAezpKVVxqem-MvKFOwDMMh2dqjFRLA@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=M44Zjaqo7wFf62VKvyhiaZbdHUux7JJCBec1gRzNBlA=;
 b=PI5R+PUT/tzZJ+ha7GMKM4iF3ApMSzSwbBW1t0CxR7L7/5m/RoT/U2yOBwuBmHhegY
 0sD/L9MN9u+1Ar4CvTvDzxnaHhNL3MRgfosNeM0Kx1t0bdXKV8vSTCiTguBezxqQcYug
 UI7jAuOpizxNU6ueYTpD9gl7GCrfpI6Y9GPuRllxdxpDypQionEPQO3AXIfQ0qomOazc
 36iTwpLdN2pUVQshJkW5MSghorOuTI52rFVVySDnuZfb/QNRMWaiZvteRV9VyN6F64Bo
 Q4HKzc5CMBtkMU6Xo48l8L6d/QfkcH9INUp+0PBJACnvHnQggFZTpfpDBMtpWdOiK/WM
 uJPQ==
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
Cc: ML nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============2137657746=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2137657746==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bi5JUZtvcfApsciF"
Content-Disposition: inline


--bi5JUZtvcfApsciF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 17, 2019 at 01:48:20PM +1000, Ben Skeggs wrote:
> On Tue, 17 Sep 2019 at 01:18, Thierry Reding <thierry.reding@gmail.com> wrote:
> >
> > From: Thierry Reding <treding@nvidia.com>
> >
> > The engine field in the FIFO fault information registers is actually 9
> > bits wide.
> Looks like this is true for fault buffer parsing too.

Yes, I'll add that in v2.

Thierry

> >
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/gpu/drm/nouveau/nvkm/subdev/fault/gv100.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fault/gv100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fault/gv100.c
> > index b5e32295237b..28306c5f6651 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fault/gv100.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fault/gv100.c
> > @@ -137,8 +137,8 @@ gv100_fault_intr_fault(struct nvkm_fault *fault)
> >         info.addr = ((u64)addrhi << 32) | addrlo;
> >         info.inst = ((u64)insthi << 32) | (info0 & 0xfffff000);
> >         info.time = 0;
> > -       info.engine = (info0 & 0x000000ff);
> >         info.aperture = (info0 & 0x00000c00) >> 10;
> > +       info.engine = (info0 & 0x000001ff);
> >         info.valid  = (info1 & 0x80000000) >> 31;
> >         info.gpc    = (info1 & 0x1f000000) >> 24;
> >         info.hub    = (info1 & 0x00100000) >> 20;
> > --
> > 2.23.0
> >
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/nouveau

--bi5JUZtvcfApsciF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2Aoe4ACgkQ3SOs138+
s6HOPA//Z5IIjQcIPGo95H3VGupBNJ175KCLQzB1kCvUz91KtbvVnZbj3Zsre1t4
xjIJo4t1wY9MabnAtNyMG0DCwmJojxxqdkV++GeUFrZy17x0RdGoY3tujEQoWSM0
DuL/xhvtHINMuinGhBHWhCC3uRHC9LqDXpeO/E+IX36ywUO8wrSC21k6iVx6PhEX
oCNqxKfP0BOo7X3vPbwYep6fIjnht7iahhYdeCfJqx97N7tg0shKaarmV7SAVSz3
oerrCafUxzJmfZKNxdRwifXMSLx7L2PnRBn8+R/GXupzgCNDjMucJOLQsddRjaRl
9Y33QTnk4Y9kmZGfFHeA9WAhhgbVTiFlnZ6NbdRc8sqT0CNKuNDxa+71l8p6CAkT
Vn3ZHEpdzfTK20714B4CFNWYJEjtHrm5qj02WMKltaymYD2BG3LrrBgijlcL/gKU
TaOkPs6GxXn2Ym46iSFesdtNZWp2uxQR8zDD5U/undPghVJhsRL6YfoR//JD2jZN
RyaDf51eMYg9bfZT2ms+fRHmcWH9I1/+s0QsTElLmEM/UE5GQx5edB8pffRActyk
siuBpVq9JA2OC5zAhlHlTzgnFoYWXd999mLu7hHoJsMSCtdldJg1XrNa/N2Sm6uB
sRq6+Jqlnmc7xyzoSmSrDRX0qbnQUnQIdmhT1k17PP54TqG5DOo=
=4G6L
-----END PGP SIGNATURE-----

--bi5JUZtvcfApsciF--

--===============2137657746==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2137657746==--
