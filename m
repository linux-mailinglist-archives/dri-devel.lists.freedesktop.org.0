Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9A7736300
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 07:08:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C80410E25B;
	Tue, 20 Jun 2023 05:08:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA9FE10E25A
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 05:08:25 +0000 (UTC)
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E275C423EA
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 05:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1687237700;
 bh=kYHiqY0MrmuYOQjx/9zPX9Eu/K7YT+C3YLGg4BNkKMQ=;
 h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=AcFYnBa/DFF/EAd13qUXGy8oJPF0JDcReotJcmXPXxW2VDt0HsYId94YgNJwVL2Qn
 fGqxbagOfsfdv35/kJRe18BKTbGS9+LRbHehNa4GI/iYuoqnFDSg0BcixOC+GH+ArX
 /r733dcLKA9uTqqmK6NUNEpvHBW6Fx2vHeuHot5nj3KAUeftAYEj+qA6Qxwv7uzwgn
 7j0WLUwDDMdpeslg5PbuWA7ymUw3ideo9VVKxlADZSpsIan1RPe0Umhn1uZAnww7PJ
 H8Tt6glpq6Bnp+Y4X081OtxtNE5cLnRDHEblYNvu5/2l8RASQB3/wGWFa8NriMHdW1
 7PdBFCJvjBiag==
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-4f6210a09c4so3148850e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 22:08:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687237700; x=1689829700;
 h=mime-version:organization:references:in-reply-to:message-id:subject
 :cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kYHiqY0MrmuYOQjx/9zPX9Eu/K7YT+C3YLGg4BNkKMQ=;
 b=DVr5vQ6cJWuzQS1WZWazlE33Yo4kh3EoLZhC5UzqR+uxWVyxl/Vt0zVPEu3WgtX7sS
 +BOXyHnK4AXEOTMYRVu3U8x1yjcbTJmx6CvdY9h1QXTIY95mDy2A3IyhEsTh8xJd+L5J
 M0Y463qTmfVz3C+IYnj4ZAYbhmd/SYDZP8sRkUSaSMdo7ItbaYJaN8IE2G8oH/saSsBj
 J3ILAD0krjoxpD1/Hb7ZbjQuCqDJowVVovGevjhlBN/8y/umYT56d5CSZMU9CBdVaeqr
 if/49riM0f2944yGxp1L3KGMUd/fyG7fCaW83ELoVmiTPKhnNNNGyMV5MNcFNjSv0ZhE
 pyMg==
X-Gm-Message-State: AC+VfDzTidH69WcjZAlTGEKa62Hs96Y8HdfCtNrexf55YG2MftJsVkSK
 dVRGZqoO06c2VrDfQb5pDXFV/GhS2cmA7OY6pvcujIBY1XEhkmyKcocKCpJtLtT47d29OsDct7P
 FNSFJz8lQ+gwxomeekc0vJOuxm4nkbMICNu/F/iGxiQPrgw==
X-Received: by 2002:a05:6512:532:b0:4f8:770f:1b04 with SMTP id
 o18-20020a056512053200b004f8770f1b04mr1430012lfc.0.1687237699870; 
 Mon, 19 Jun 2023 22:08:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4Ml787KUueP3m3sr+JeQpNhdsMKcAJhcImYx4vsWXakhX+FZUrxJU3CNpSuEPCRQjER4LtIw==
X-Received: by 2002:a05:6512:532:b0:4f8:770f:1b04 with SMTP id
 o18-20020a056512053200b004f8770f1b04mr1429991lfc.0.1687237699554; 
 Mon, 19 Jun 2023 22:08:19 -0700 (PDT)
Received: from smeagol ([194.191.244.86]) by smtp.gmail.com with ESMTPSA id
 c25-20020a7bc859000000b003f90ab2fff9sm1360281wml.9.2023.06.19.22.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 22:08:18 -0700 (PDT)
Date: Tue, 20 Jun 2023 07:08:15 +0200
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Subject: Re: [PATCH] drm/msm/adreno: Update MODULE_FIRMWARE macros
Message-ID: <20230620070815.2c0bd60f@smeagol>
In-Reply-To: <yl7qxypdzlzwmmp3b43vz5xo6jxey4zcpdxurcvfzujxrawz36@lneajulwoy4k>
References: <20230616122815.1037425-1-juerg.haefliger@canonical.com>
 <yl7qxypdzlzwmmp3b43vz5xo6jxey4zcpdxurcvfzujxrawz36@lneajulwoy4k>
Organization: Canonical Ltd
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vDXuG4klP3vp2xxWUE+QEvn";
 protocol="application/pgp-signature"; micalg=pgp-sha512
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
Cc: freedreno@lists.freedesktop.org, sean@poorly.run, ribalda@chromium.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, konrad.dybcio@linaro.org, joel@joelfernandes.org,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 johan+linaro@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/vDXuG4klP3vp2xxWUE+QEvn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 16 Jun 2023 21:25:01 +0530
Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:

> On Fri, Jun 16, 2023 at 02:28:15PM +0200, Juerg Haefliger wrote:
> >=20
> > Add missing MODULE_FIRMWARE macros and remove some for firmwares that
> > the driver no longer references.
> >=20
> > Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/adreno_device.c | 23 ++++++++++++++++++----
> >  1 file changed, 19 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/d=
rm/msm/adreno/adreno_device.c
> > index 8cff86e9d35c..9f70d7c1a72a 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > @@ -364,17 +364,32 @@ MODULE_FIRMWARE("qcom/a330_pm4.fw");
> >  MODULE_FIRMWARE("qcom/a330_pfp.fw");
> >  MODULE_FIRMWARE("qcom/a420_pm4.fw");
> >  MODULE_FIRMWARE("qcom/a420_pfp.fw");
> > +MODULE_FIRMWARE("qcom/a506_zap.mdt");
> > +MODULE_FIRMWARE("qcom/a508_zap.mdt");
> > +MODULE_FIRMWARE("qcom/a512_zap.mdt");
> >  MODULE_FIRMWARE("qcom/a530_pm4.fw");
> >  MODULE_FIRMWARE("qcom/a530_pfp.fw");
> >  MODULE_FIRMWARE("qcom/a530v3_gpmu.fw2");
> >  MODULE_FIRMWARE("qcom/a530_zap.mdt");
> > -MODULE_FIRMWARE("qcom/a530_zap.b00");
> > -MODULE_FIRMWARE("qcom/a530_zap.b01");
> > -MODULE_FIRMWARE("qcom/a530_zap.b02"); =20
> Why are these not required when "qcom/a530_zap.mdt" is present?
>=20
> mdt & b0* binaries are different partitions of the same secure
> firmware. Even though we specify only the .mdt file here, the PIL driver
> will load the *.b0* file automatically. OTOH, "*.mbn" is a standalone
> unified binary format.

Ah thanks for the clarification.


> If the requirement is to ensure that all necessary firmwares are part of
> your distribution, you should include the *.b0* files too here.

I'll look into that. IMO, everything that the drivers can load should be
listed for completeness.

...Juerg


> -Akhil
>=20
> > +MODULE_FIRMWARE("qcom/a540_gpmu.fw2");
> > +MODULE_FIRMWARE("qcom/a540_zap.mdt");
> > +MODULE_FIRMWARE("qcom/a615_zap.mdt");
> >  MODULE_FIRMWARE("qcom/a619_gmu.bin");
> >  MODULE_FIRMWARE("qcom/a630_sqe.fw");
> >  MODULE_FIRMWARE("qcom/a630_gmu.bin");
> > -MODULE_FIRMWARE("qcom/a630_zap.mbn");
> > +MODULE_FIRMWARE("qcom/a630_zap.mdt");
> > +MODULE_FIRMWARE("qcom/a640_gmu.bin");
> > +MODULE_FIRMWARE("qcom/a640_zap.mdt");
> > +MODULE_FIRMWARE("qcom/a650_gmu.bin");
> > +MODULE_FIRMWARE("qcom/a650_sqe.fw");
> > +MODULE_FIRMWARE("qcom/a650_zap.mdt");
> > +MODULE_FIRMWARE("qcom/a660_gmu.bin");
> > +MODULE_FIRMWARE("qcom/a660_sqe.fw");
> > +MODULE_FIRMWARE("qcom/a660_zap.mdt");
> > +MODULE_FIRMWARE("qcom/leia_pfp_470.fw");
> > +MODULE_FIRMWARE("qcom/leia_pm4_470.fw");
> > +MODULE_FIRMWARE("qcom/yamato_pfp.fw");
> > +MODULE_FIRMWARE("qcom/yamato_pm4.fw");
> > =20
> >  static inline bool _rev_match(uint8_t entry, uint8_t id)
> >  {
> > --=20
> > 2.37.2
> >  =20


--Sig_/vDXuG4klP3vp2xxWUE+QEvn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEhZfU96IuprviLdeLD9OLCQumQrcFAmSRND8ACgkQD9OLCQum
QrdPYw//QzGQ0R5KDY7yYZt83rqtfWawMZuuBi9PMkzDHZWRYkFYdmeVGDdxtAm4
od/7vmulM8dUSjdiTvbSmnxi4kapgysgi9xFpZ6y998+V/FPlFU7bYAbjV43c0xo
2WeklNS4fKaoJg0jVMbVFegQIRENqKj9xwqbNHlDKhPNRELiU7lpMDRBJalzICdi
FuwZvGv59ah+voSxHNpo0e9et659RjgqxvxlS7ivWLR/gimoCURRXj+oLD3nKtav
ibG704hNsnEPqGvf9NQi+C3NTMZPF123EpiXyNQoe6J158Xg6dgur0oBPyn97TFX
rrsm+9usyGPzfrwdtwdz9OtqL0wCT9uOD12W+E8MqVBryU8HHRdCt/ZQkkJ5sz1V
6+wHya9PseGN5zCRBOr+flAjRmfNDCLcveB06BmhXSEUk1CmPHhJvUAfKgrMMK+n
R0BUF+V2/r82AcPQpx1rNuPWeEeSsgGwq/gq+Bbp8lJB9BYm/IDst9fch711WV70
70AsC5zdSN/E75TJpQ9qqG/ZafWzPoI5YhYx6MOIHxwvmFBgSBLHUqCrSSVargjF
qAYkTizvh4BMknx5hL+XfReFriTRkU93eyTHwOkXFN5BTKPFFIWSA6CFF+1+wiNy
GYQ8qgldRA6YZFXjF3FN/+oTAmwzjp/ZBgAI1C36IVWqinwjXV4=
=rUQw
-----END PGP SIGNATURE-----

--Sig_/vDXuG4klP3vp2xxWUE+QEvn--
