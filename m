Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DC1AA10AF
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 17:40:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCDF810E4D5;
	Tue, 29 Apr 2025 15:40:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AFYCpWMI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B50A10E4D5
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 15:40:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3D043440C6;
 Tue, 29 Apr 2025 15:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB867C4CEE3;
 Tue, 29 Apr 2025 15:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745941228;
 bh=aBgUX4NXvGOwddWZ2lniLNxGN3wz3bydaWpKBczlbjg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AFYCpWMIrH8ojuPMhj5sNiTLDDDe4dFIyQOqMKrUgg1thyFIilpWmrPVfelxOJhAn
 mDqZiXpO9yP8+CVRoTDAQWzsnUEQ/0B2HV3p/M/gfbRPi9RmBfw0zFEQUUNZtnMwDU
 YEO3rjtq1zG6MdE1dmCJSKBW4LjQeR0/WyU+aqDpGWwocq3H09cUZ3knbDdsRbbyi6
 0Um6xHsoUoLmhZ8Rh+2p9LR4wjfpmIbsLCy+cbfKQVQdnnmn+pvJV2HlJsQxXQlCSD
 XXkALR39AeiPoybAI8AWiSysKP9HF/vb7cqFjLptQXkhpgnWQbv3gFQ3R1rTK8BRSb
 ZSwvhW79h4FGQ==
Date: Tue, 29 Apr 2025 17:40:25 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v5 06/11] drm/display: add CEC helpers code
Message-ID: <20250429-unbiased-idealistic-llama-e1faaa@houat>
References: <20250407-drm-hdmi-connector-cec-v5-0-04809b10d206@oss.qualcomm.com>
 <20250407-drm-hdmi-connector-cec-v5-6-04809b10d206@oss.qualcomm.com>
 <20250414-determined-kind-peacock-e9a47c@houat>
 <d923d469-ef1d-4dde-87ce-6b9e840b27fc@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="b6owvezqhkv572qa"
Content-Disposition: inline
In-Reply-To: <d923d469-ef1d-4dde-87ce-6b9e840b27fc@oss.qualcomm.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--b6owvezqhkv572qa
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 06/11] drm/display: add CEC helpers code
MIME-Version: 1.0

On Tue, Apr 15, 2025 at 07:01:25PM +0300, Dmitry Baryshkov wrote:
> On 14/04/2025 17:58, Maxime Ripard wrote:
> > On Mon, Apr 07, 2025 at 06:11:03PM +0300, Dmitry Baryshkov wrote:
> > > +static void drm_connector_hdmi_cec_adapter_unregister(struct drm_con=
nector *connector)
> > > +{
> > > +	struct drm_connector_hdmi_cec_data *data =3D connector->cec.data;
> > > +
> > > +	cec_delete_adapter(data->adapter);
> > > +
> > > +	if (data->funcs->uninit)
> > > +		data->funcs->uninit(connector);
> > > +
> > > +	kfree(data);
> > > +	connector->cec.data =3D NULL;
> > > +}
> > >=20
> > > [...]
> > >=20
> > > +int drm_connector_hdmi_cec_register(struct drm_connector *connector,
> > > +				    const struct drm_connector_hdmi_cec_funcs *funcs,
> > > +				    const char *name,
> > > +				    u8 available_las,
> > > +				    struct device *dev)
> > > +{
> > > +	struct drm_connector_hdmi_cec_data *data;
> > > +	struct cec_connector_info conn_info;
> > > +	struct cec_adapter *cec_adap;
> > > +	int ret;
> > > +
> > > +	if (!funcs->init || !funcs->enable || !funcs->log_addr || !funcs->t=
ransmit)
> > > +		return -EINVAL;
> > > +
> > > +	data =3D kzalloc(sizeof(*data), GFP_KERNEL);
> > > +	if (!data)
> > > +		return -ENOMEM;
> > > +
> > > +	data->funcs =3D funcs;
> > > +
> > > +	cec_adap =3D cec_allocate_adapter(&drm_connector_hdmi_cec_adap_ops,=
 connector, name,
> > > +					CEC_CAP_DEFAULTS | CEC_CAP_CONNECTOR_INFO,
> > > +					available_las ? : CEC_MAX_LOG_ADDRS);
> > > +	ret =3D PTR_ERR_OR_ZERO(cec_adap);
> > > +	if (ret < 0)
> > > +		goto err_free;
> > > +
> > > +	cec_fill_conn_info_from_drm(&conn_info, connector);
> > > +	cec_s_conn_info(cec_adap, &conn_info);
> > > +
> > > +	data->adapter =3D cec_adap;
> > > +
> > > +	mutex_lock(&connector->cec.mutex);
> > > +
> > > +	connector->cec.data =3D data;
> > > +	connector->cec.funcs =3D &drm_connector_hdmi_cec_adapter_funcs;
> > > +
> > > +	ret =3D funcs->init(connector);
> > > +	if (ret < 0)
> > > +		goto err_delete_adapter;
> > > +
> > > +	ret =3D cec_register_adapter(cec_adap, dev);
> > > +	if (ret < 0)
> > > +		goto err_delete_adapter;
> >=20
> > I'm a bit concerned about the respective lifetimes of CEC adapters and
> > DRM connectors.
> >=20
> > When you register the CEC adapter, its associated structure is
> > kzalloc'd, and freed when the DRM connector is freed (so when nobody has
> > any reference to it anymore: either when the device is torn down, or a
> > DP-MST hotplug scenario).
> >=20
> > The CEC adapter however will only be freed when its own users will close
> > their file descriptor. So we can have a scenario when the CEC adapter is
> > still live but the DRM connector has been unregistered. Thus, the CEC
> > adapter data will have been kfree'd.
>=20
> If I understand correctly, CEC core will handle this thanks to the
> cec_is_registered() calls in the important places. Nevertheless it's worth
> adding a comment and a set of drm_dev_enter() / _exit() calls.

Yep, it definitely deserves a comment.

> > You might consider safe because $REASONS, but those need to be properly
> > detailed and explained.
> >=20
> > That's another reason why I think that just putting the connector
> > pointer as data is better: connectors are refcounted, so we know those
> > aren't an issue.
>=20
> Not quite. CEC adapter itself doesn't have a refcount on the connector. A=
nd
> if add one, we'd create a loop, preventing connector from being
> unregistered.

ACK
Maxime

--b6owvezqhkv572qa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaBDy6QAKCRAnX84Zoj2+
dqIbAX9nflIw4K0qyYLL+af5t5hHypebT74nUbNa6eR42P+pU7UKtezjMB92awn2
L2Z2cXsBf2oEJwHE00apai7/qJkso7F8qOrc7EVYqQTPOtzjVCpsa65I3UyvQT3z
UrOG/ceX9g==
=bnTh
-----END PGP SIGNATURE-----

--b6owvezqhkv572qa--
