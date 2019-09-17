Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA425B4A06
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 11:05:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B6586EB77;
	Tue, 17 Sep 2019 09:05:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FE246EB76;
 Tue, 17 Sep 2019 09:05:32 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id l11so2253883wrx.5;
 Tue, 17 Sep 2019 02:05:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hGBujOrOKRv9cR0XmHB38NhBgBb+wpygz3VHP+WvWkM=;
 b=TBuUAfaPGhjj+y+XecnfRaHiUDOMk9u89AYO9JvDY9+Uutl8KAdOx2uumV0JKQNiUh
 kU1Nua03SulivMAgizF3xMtZ/gxWi4aTRtJXkVgppG9kL2hyyqsZWwbE/AZGoZleedni
 6EKJLWwMlKfDPsKk68a4yHQzWMjRgDrBq5gfieQMsgsTqrpb6NMJRIOcPexG4jyVz6/P
 7cmcx+jPcPWq0HMgASHFPuxQ0kpIhMpIVpn1ixKvAvFIZT6uk/eN6nd/1Vn4LBqUuYVs
 7zx7mSEAMAOtqq9S8sEhGoRHojfRhTdDVjZaCymRXrNXmR7fjYiXbwDHphX8Ivu650Af
 QcTg==
X-Gm-Message-State: APjAAAWn/F/J1jCpxP4BbjfRIzsIPNMo0W80Ylhkv1oGiB4zTYLhIAHf
 er/CYoo3oDmi/MC27xa7JH0=
X-Google-Smtp-Source: APXvYqxDFo1vsbgg2M2sXxUB1sqAlle6haSqdAbo89QGBoGOtkk+egOjZ+u/nrHT842JFQswQA5Hpw==
X-Received: by 2002:adf:ef05:: with SMTP id e5mr1985097wro.127.1568711130609; 
 Tue, 17 Sep 2019 02:05:30 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id o11sm1329623wmc.7.2019.09.17.02.05.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2019 02:05:29 -0700 (PDT)
Date: Tue, 17 Sep 2019 11:05:28 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [Nouveau] [PATCH 1/6] drm/nouveau: fault: Store aperture in
 fault information
Message-ID: <20190917090528.GD17854@ulmo>
References: <20190916151757.10953-1-thierry.reding@gmail.com>
 <20190916151757.10953-2-thierry.reding@gmail.com>
 <CACAvsv70b1-LJoaP1ZL2hvy9xMcO1WXqh0ibGzNfpB81ybgrTg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACAvsv70b1-LJoaP1ZL2hvy9xMcO1WXqh0ibGzNfpB81ybgrTg@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=hGBujOrOKRv9cR0XmHB38NhBgBb+wpygz3VHP+WvWkM=;
 b=hcNTOS1je4mc/Fr9th+Jl3CiFC0SXt/mvyhTH2HGKV72429/aZYhRZudIhviC9j66l
 uYr2q8+P3lrVGI/8ppR8o8kS+wqXxUEQ8TjQr0+AWRATYIuYaLcz4b1B/OjvBJwQDlSE
 t/JVE7KU3S6PCEsoTArc+IbkWr4P2ZrLqdOibL6b+m1DtDHeyIO+4L8/JubQWYdy3HPS
 EnlGOnDdklq4jB+MSDCg8CORj1PMYoxtye3ALIYdNCfxY30hRmTt6CWiqQXExwIMP/nn
 xdgavSio9cAAIyT+u1p4ag2tyuphGseJUvN6Dx0+tBa9ed9mkv6S10ByXohKnPzg0HdS
 tRzw==
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
Content-Type: multipart/mixed; boundary="===============1571048915=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1571048915==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="M38YqGLZlgb6RLPS"
Content-Disposition: inline


--M38YqGLZlgb6RLPS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 17, 2019 at 01:47:25PM +1000, Ben Skeggs wrote:
> On Tue, 17 Sep 2019 at 01:18, Thierry Reding <thierry.reding@gmail.com> w=
rote:
> >
> > From: Thierry Reding <treding@nvidia.com>
> >
> > The fault information register contains data about the aperture that
> > caused the failure. This can be useful in debugging aperture related
> > programming bugs.
> Should this be parsed for fault buffer entries too?

Yes, it probably should. Will fix that in v2.

Thanks,
Thierry

>=20
> >
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/gpu/drm/nouveau/include/nvkm/subdev/fault.h | 1 +
> >  drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c    | 3 ++-
> >  drivers/gpu/drm/nouveau/nvkm/subdev/fault/gv100.c   | 1 +
> >  3 files changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/fault.h b/driv=
ers/gpu/drm/nouveau/include/nvkm/subdev/fault.h
> > index 97322f95b3ee..1cc862bc1122 100644
> > --- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/fault.h
> > +++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/fault.h
> > @@ -21,6 +21,7 @@ struct nvkm_fault_data {
> >         u64  addr;
> >         u64  inst;
> >         u64  time;
> > +       u8 aperture;
> >         u8 engine;
> >         u8  valid;
> >         u8    gpc;
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c b/drivers=
/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c
> > index 5d4b695cab8e..81cbe1cc4804 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c
> > @@ -519,9 +519,10 @@ gk104_fifo_fault(struct nvkm_fifo *base, struct nv=
km_fault_data *info)
> >         chan =3D nvkm_fifo_chan_inst_locked(&fifo->base, info->inst);
> >
> >         nvkm_error(subdev,
> > -                  "fault %02x [%s] at %016llx engine %02x [%s] client =
%02x "
> > +                  "fault %02x [%s] at %016llx aperture %02x engine %02=
x [%s] client %02x "
> >                    "[%s%s] reason %02x [%s] on channel %d [%010llx %s]\=
n",
> >                    info->access, ea ? ea->name : "", info->addr,
> > +                  info->aperture,
> >                    info->engine, ee ? ee->name : en,
> >                    info->client, ct, ec ? ec->name : "",
> >                    info->reason, er ? er->name : "", chan ? chan->chid =
: -1,
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fault/gv100.c b/driver=
s/gpu/drm/nouveau/nvkm/subdev/fault/gv100.c
> > index 6747f09c2dc3..b5e32295237b 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fault/gv100.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fault/gv100.c
> > @@ -138,6 +138,7 @@ gv100_fault_intr_fault(struct nvkm_fault *fault)
> >         info.inst =3D ((u64)insthi << 32) | (info0 & 0xfffff000);
> >         info.time =3D 0;
> >         info.engine =3D (info0 & 0x000000ff);
> > +       info.aperture =3D (info0 & 0x00000c00) >> 10;
> >         info.valid  =3D (info1 & 0x80000000) >> 31;
> >         info.gpc    =3D (info1 & 0x1f000000) >> 24;
> >         info.hub    =3D (info1 & 0x00100000) >> 20;
> > --
> > 2.23.0
> >
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/nouveau

--M38YqGLZlgb6RLPS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2AodcACgkQ3SOs138+
s6Gi6RAAjv3ak2g6rrygLQCWZqJYh/xSmaoIPpfTUspQy4B1PSiTFy6G/3KCbvgZ
N+haXGrqMewbmD9gUk22Ltz54nkZIPeXUU+2DWbrJ/3kkV/6qbXs4RVy3nxgHYDT
h4ORGrqF5NkQDHm2kLGptzPG5wfn1C//pjRKB7SY94zCmytL2wA5l9swT6A91qjs
9wvAI9TM72ajzF3b4qz52shc2Ut978nJ1BLhiJN4IdXxwDBYZZlRqUWK3mlTXLRY
4/tN+tsfK2lFBvwStRQE7YfMuV7hHen5F4Cm038SJJOZzBO6nvvkyG65VmMmltPw
+eNhrwsuMcDKuAVPO4T6CIJveCo4VQG8AEKOlSdaFe4vzemZEO17hx+za/7TxqEy
UfRsRdBQwPZrQIgNPhxIF+Z59YnclETEDFyhF0KhrLDrmN5y7uRDnewli7YaewL1
wn9HRMHfmyyRE6ojp696EVjDIOPnbQntMLXJya+CJrWN8g89cx2GgdO/oQP51pOB
csTw0rGg4lZUceIG2IUOrPDMyfOk+azNmgQvEC56OzlHdVvdDGWNQGVTjpupWUzK
a+3+L5+8c3txSxQ0v9H5vJI62GxiUZ8g0Z+YbUJRZkX5EMeCR3YV3ITQyzXuXM3P
aBSAtXuHtTxLo9l8bqZIIOeU1aZpvuhHZn6Bdx0zt5FlRUZQwFM=
=6oyz
-----END PGP SIGNATURE-----

--M38YqGLZlgb6RLPS--

--===============1571048915==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1571048915==--
