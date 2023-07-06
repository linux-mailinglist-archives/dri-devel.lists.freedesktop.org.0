Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CCE7496EC
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 09:59:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50C0410E45F;
	Thu,  6 Jul 2023 07:59:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D415A10E45E;
 Thu,  6 Jul 2023 07:59:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 25094618B8;
 Thu,  6 Jul 2023 07:59:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BB58C433C7;
 Thu,  6 Jul 2023 07:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688630351;
 bh=zTimcz4m7Wp96vq+YDSDJkwi80FeyVfIxn6cyWrRfJs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RBESkY+zvwyfdrR4c7z0AO0ed0WI+rvXAr5CRSnCq81U2jPZTGlvBTTMyXVnMgXqV
 OrefwdEtZopCjmHgBjgdqWqiOYi0EzQJR1M6i9paUGLh2IZKGu/xQ2BUxuDWbm8lHj
 p5JAA807/XKuJkl9dQQzagBbkXZYK5X25vVgHK9zUy91zfOpO7EDcACxuC4Xt9cpjs
 qFdy1aNod3QFONk4xF5efZOpLosNCtObtPWYR9EDw/EHfqkfToBWSdprhEsx+hg07L
 8U7kNGFyTTxVmcWtAE0V1cV1i3z0/D/sqCpD5K23esL6DMRqXTBxqufk3PRxxPS6Q7
 Z+0ej/bzjs6PQ==
Date: Thu, 6 Jul 2023 09:59:08 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: RFC: DSI host capabilities (was: [PATCH RFC 03/10] drm/panel:
 Add LGD panel driver for Sony Xperia XZ3)
Message-ID: <nfc6ih43gjpi5u67fpkkxgwwygv53grdldq7tfp5iiukrkiy2u@53fsrtezzkyt>
References: <epds77sccy4cc5cdpoc4ir7sfz5sz3biwep6rbks2nuyqncidu@77gb4t2wy6vn>
 <47a5678c-1eb3-dfc2-a9ac-f8e497455d11@linaro.org>
 <unsithzszj7awvsmxwr7reshso5ju7u4nssil5tty6pocictf5@gwoltpgeecer>
 <6e070141-8c0e-59ed-8a08-58c3fadb17df@linaro.org>
 <lidknise4copce3vb2wth4z3fl2p4npsc4u6ajqb6zsp6lnpca@rp6wxcmy2aa4>
 <CAA8EJpq_VeY=44FqYm7QAT32AR=rmMOV0RtAfNFkb1hpSp29dw@mail.gmail.com>
 <djrx34qwb7yen47dmlsym4mg2pib4syncvdy52ma3sin7uhs7j@gi3znayuucnj>
 <a718f7c1-4ef1-18c8-33c7-c5da22e92c89@linaro.org>
 <q7wrbmdhdy2d3gqig3j34lqxdcwzbom7djlncfznxsa6ktm7j2@i5x4ngi7p2ia>
 <9e071beb-9d9d-c6dc-8196-a3e23ea73713@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tz763qdeh2jjkufg"
Content-Disposition: inline
In-Reply-To: <9e071beb-9d9d-c6dc-8196-a3e23ea73713@linaro.org>
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
Cc: "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <dri-devel@lists.freedesktop.org>, Caleb Connolly <caleb@connolly.tech>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sam Ravnborg <sam@ravnborg.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Andy Gross <agross@kernel.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--tz763qdeh2jjkufg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 06, 2023 at 09:33:15AM +0200, Neil Armstrong wrote:
> On 06/07/2023 09:24, Maxime Ripard wrote:
> > On Wed, Jul 05, 2023 at 11:09:40PM +0300, Dmitry Baryshkov wrote:
> > > On 05/07/2023 19:53, Maxime Ripard wrote:
> > > > On Wed, Jul 05, 2023 at 06:20:13PM +0300, Dmitry Baryshkov wrote:
> > > > > On Wed, 5 Jul 2023 at 17:24, Maxime Ripard <mripard@kernel.org> w=
rote:
> > > > > >=20
> > > > > > On Wed, Jul 05, 2023 at 04:37:57PM +0300, Dmitry Baryshkov wrot=
e:
> > > > > > > > > >=20
> > > > > > > > > > Either way, I'm not really sure it's a good idea to mul=
tiply the
> > > > > > > > > > capabilities flags of the DSI host, and we should just =
stick to the
> > > > > > > > > > spec. If the spec says that we have to support DSC whil=
e video is
> > > > > > > > > > output, then that's what the panels should expect.
> > > > > > > > >=20
> > > > > > > > > Except some panels supports DSC & non-DSC, Video and Comm=
and mode, and
> > > > > > > > > all that is runtime configurable. How do you handle that ?
> > > > > > > >=20
> > > > > > > > In this case, most of the constraints are going to be on th=
e encoder
> > > > > > > > still so it should be the one driving it. The panel will on=
ly care about
> > > > > > > > which mode has been selected, but it shouldn't be the one d=
riving it,
> > > > > > > > and thus we still don't really need to expose the host capa=
bilities.
> > > > > > >=20
> > > > > > > This is an interesting perspective. This means that we can an=
d actually have
> > > > > > > to extend the drm_display_mode with the DSI data and compress=
ion
> > > > > > > information.
> > > > > >=20
> > > > > > I wouldn't extend drm_display_mode, but extending one of the st=
ate
> > > > > > structures definitely.
> > > > > >=20
> > > > > > We already have some extra variables in drm_connector_state for=
 HDMI,
> > > > > > I don't think it would be a big deal to add a few for MIPI-DSI.
> > > > > >=20
> > > > > > We also floated the idea for a while to create bus-specific sta=
tes, with
> > > > > > helpers to match. Maybe it would be a good occasion to start do=
ing it?
> > > > > >=20
> > > > > > > For example, the panel that supports all four types for the 1=
080p should
> > > > > > > export several modes:
> > > > > > >=20
> > > > > > > 1920x1080-command
> > > > > > > 1920x1080-command-DSC
> > > > > > > 1920x1080-video
> > > > > > > 1920x1080-video-DSC
> > > > > > >=20
> > > > > > > where video/command and DSC are some kinds of flags and/or in=
formation in
> > > > > > > the drm_display_mode? Ideally DSC also has several sub-flags,=
 which denote
> > > > > > > what kind of configuration is supported by the DSC sink (e.g.=
 bpp, yuv,
> > > > > > > etc).
> > > > > >=20
> > > > > > So we have two things to do, right? We need to expose what the =
panel can
> > > > > > take (ie, EDID for HDMI), and then we need to tell it what we p=
icked
> > > > > > (infoframes).
> > > > > >=20
> > > > > > We already express the former in mipi_dsi_device, so we could e=
xtend the
> > > > > > flags stored there.
> > > > > >=20
> > > > > > And then, we need to tie what the DSI host chose to a given ato=
mic state
> > > > > > so the panel knows what was picked and how it should set everyt=
hing up.
> > > > >=20
> > > > > This is definitely something we need. Marijn has been stuck with =
the
> > > > > panels that support different models ([1]).
> > > > >=20
> > > > > Would you prefer a separate API for this kind of information or
> > > > > abusing atomic_enable() is fine from your point of view?
> > > > >=20
> > > > > My vote would be for going with existing operations, with the sli=
ght
> > > > > fear of ending up with another DSI-specific hack (like
> > > > > pre_enable_prev_first).
> > > >=20
> > > > I don't think we can get away without getting access to the atomic_=
state
> > > > from the panel at least.
> > > >=20
> > > > Choosing one setup over another is likely going to depend on the mo=
de,
> > > > and that's only available in the state.
> > > >=20
> > > > We don't have to go the whole way though and create the sub-classes=
 of
> > > > drm_connector_state, but I think we should at least provide it to t=
he
> > > > panel.
> > > >=20
> > > > What do you think of creating a new set of atomic_* callbacks for
> > > > panels, call that new set of functions from msm and start from ther=
e?
> > >=20
> > > We are (somewhat) bound by the panel_bridge, but yeah, it seems possi=
ble.
> >=20
> > Bridges have access to the atomic state already, so it's another place
> > to plumb this through but I guess it would still be doable?
>=20
> It's definitely doable, but I fear we won't be able to test most of the
> panel drivers, should we introduce a new atomic set of panel callbacks ?

That was my original intent yeah :)

Creating an atomic_enable/disable/ etc. and then switch
drm_panel_enable() to take the state (and fixing up all the callers), or
create a drm_panel_enable_atomic() function.

The latter is probably simpler, something like:

int drm_panel_enable_atomic(struct drm_panel *panel,
    			    struct drm_atomic_state *state)
{
	struct drm_panel_funcs *funcs =3D panel->funcs;

	if (funcs->atomic_enable)
		return funcs->atomic_enable(panel, state);

	return funcs->enable(panel);
}

And we should probably mention that it supersedes/deprecates
drm_panel_enable.

We've switched most of the other atomic hooks to take the full
drm_atomic_state so I'd prefer to use it. However, for it to be somewhat
useful we'd need to have access to the connector assigned to that panel.

drm_panel doesn't store the drm_connector it's connected to at all, and
of_drm_find_panel() doesn't take it as an argument so we can't fill it
when we retrieve it either.

So I guess we can go for:

 - Create a new set of atomic hooks

 - Create a new set of functions to call those hooks, that we would
   document as deprecating the former functions. Those functions would
   take a pointer to the drm_connector_state of the drm_connector it's
   connected to.

 - We add a TODO item to add a pointer to the connector in drm_panel

 - We add a TODO item that depend on the first one to switch the new
   functions and hooks to drm_atomic_state

 - We add a TODO item to convert callers of drm_panel_enable et al. to
   our new functions.

It should work in all setups, paves a nice way forward and documents the
trade-offs we had to take and eventually address. And without creating a
dependency on 30+ patches series.

Does it sound like a plan?

> Or shall be simply move the "new" panel driver supporting atomic to bridge
> and only use panel_bridge for basic panels ?

I don't think we can expect panel_bridge to be used all the time any
time soon, so I'd rather avoid to rely on it.

Maxime

--tz763qdeh2jjkufg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZKZ0TAAKCRDj7w1vZxhR
xSohAPoDIUmfiZHt7PetbXTCY20gBYiDpa5re8QZstc4d38bewEAztydb7mEAxL+
oSXavXHhgNOkk2mJg9D2fD0hXIkbOAw=
=MrP7
-----END PGP SIGNATURE-----

--tz763qdeh2jjkufg--
