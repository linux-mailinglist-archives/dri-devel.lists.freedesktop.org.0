Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C316BCB02
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 10:35:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8787210E073;
	Thu, 16 Mar 2023 09:35:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E97A10E048
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 09:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1678959336; x=1710495336;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WEe4ayiLWs4TWftvKnDjL4me1opWmTn1ZrGjE0G6CnQ=;
 b=lJb35a5m38V2GsXGRiZiorJs4MuMu8zmVytejtHajm8XpgjtFhiQfPkl
 CBWWtCIo21y3q9oHusiNZZJy4gMU2Otk9pXf2LaoAMhG9+dUME6aUn7D1
 vch8r3Nml8IkllAi4G2niOsnlrc91V8GEqXd2ls4U9IgAhQ+SV/H5k3xV
 CEu/yZz96+n76LYbMkx0KOGLKhHLiS1Iod9niWqNzF4L3YxVTOmwlfHZ8
 jM30hUAZ8R+SQdIbVPlYxo0881WCHTWsgVLldBkHj4c+78zvRkHqAcQfo
 0fqxx/JFk0nUk4TUbc7WtkPagG8bgUWJRADkTtghahN7+lc8dV2Nvw1H4 g==;
X-IronPort-AV: E=Sophos;i="5.98,265,1673910000"; d="scan'208";a="29731317"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 16 Mar 2023 10:35:34 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Thu, 16 Mar 2023 10:35:34 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Thu, 16 Mar 2023 10:35:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1678959334; x=1710495334;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WEe4ayiLWs4TWftvKnDjL4me1opWmTn1ZrGjE0G6CnQ=;
 b=l4qEgA9lXjTPWjGWY98m7hCammEtOUWYTLBafh6ktcevtbTfxJmkFU+w
 duq+ioCZ7ElfzTvizmCo7UlLdXhWQ/Nnc3o7wRIodY3p127fnQbtEfuBx
 HknAcld+ON0w3hzvl4SRusz929DLIkEH4Tgtsmq0FjB+mHTV3vcw88Vlx
 S0RqyCuOlN0lCa3FNODMNXldhAHJ8IlovzP0CR5Xi+5HSY3fUpfDNNy9O
 ZR/3D7/2KMbA6LS+WNlYC24rK6K0yVZs86rqTIpIgJtgAIs8qliBxAzTx
 Gct2dBy/rW/Tk8kADHhw/7GuuL+RjKac/eW46KWum3dxXblbLObiiqP42 Q==;
X-IronPort-AV: E=Sophos;i="5.98,265,1673910000"; d="scan'208";a="29731316"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 16 Mar 2023 10:35:34 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 1C740280056;
 Thu, 16 Mar 2023 10:35:34 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/2] drm: fsl-dcu: Use dev_err_probe
Date: Thu, 16 Mar 2023 10:35:33 +0100
Message-ID: <6449736.GXAFRqVoOG@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <2275894.ElGaqSPkdT@steina-w>
References: <20230117110801.2069761-1-alexander.stein@ew.tq-group.com>
 <2275894.ElGaqSPkdT@steina-w>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

this series is uncommented for some time now. Any feedback?

Thanks,
Alexander

Am Montag, 13. Februar 2023, 09:24:33 CET schrieb Alexander Stein:
> Hi,
>=20
> any feedback on this series?
>=20
> Best regards,
> Alexander
>=20
> Am Dienstag, 17. Januar 2023, 12:08:00 CET schrieb Alexander Stein:
> > fsl_dcu_drm_modeset_init can return -EPROBE_DEFER, so use dev_err_probe
> > to remove an invalid error message and add it to deferral description.
> >=20
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> >=20
> >  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> > b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c index
> > 8579c7629f5e..418887654bac 100644
> > --- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> > +++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> > @@ -103,10 +103,8 @@ static int fsl_dcu_load(struct drm_device *dev,
> > unsigned long flags) int ret;
> >=20
> >  	ret =3D fsl_dcu_drm_modeset_init(fsl_dev);
> >=20
> > -	if (ret < 0) {
> > -		dev_err(dev->dev, "failed to initialize mode setting\n");
> > -		return ret;
> > -	}
> > +	if (ret < 0)
> > +		return dev_err_probe(dev->dev, ret, "failed to initialize
>=20
> mode
>=20
> > setting\n");
> >=20
> >  	ret =3D drm_vblank_init(dev, dev->mode_config.num_crtc);
> >  	if (ret < 0) {


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


