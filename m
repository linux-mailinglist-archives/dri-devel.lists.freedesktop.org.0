Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 674D874964F
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 09:24:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5A8010E43F;
	Thu,  6 Jul 2023 07:24:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A2E910E43D;
 Thu,  6 Jul 2023 07:24:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 19C17618A2;
 Thu,  6 Jul 2023 07:24:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00539C433C7;
 Thu,  6 Jul 2023 07:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688628274;
 bh=9YXus58HFCYWUgF7WtrOWJhmbffOAFniPNX7tWAUfxo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tDH99pEA6Fd2mbUppE/ZRMF5kkfzrmNwbrf5813UjgZuLjKhkbnOipsupdOj5+iye
 SaSxr3F2i4cyJpW13kGIclP9h3VXOI+TxlD1tAdfZ5C8JSjdj1DYxONWVZuNF4xzDG
 v5XVG1HC9PzEAl3NU0gkw9P0KfzS3Zt3khkpUWkj65DaMfBNJ/7AOLlQdAFMr0Qh0H
 rxH/0Q1Thzshs/2dx1pElSqMPidv9wx2Pj13PBtgWJH1Pkcak2Iz4Vhhz5RfIzJKgY
 11bAYUFtPch/mF5pn18dTt9D5nF4m/1k4/zfbrC1tnm6RlRySlqzRGijS5Th3MRcsX
 hqjJQdW1+zQ3Q==
Date: Thu, 6 Jul 2023 09:24:31 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: RFC: DSI host capabilities (was: [PATCH RFC 03/10] drm/panel:
 Add LGD panel driver for Sony Xperia XZ3)
Message-ID: <q7wrbmdhdy2d3gqig3j34lqxdcwzbom7djlncfznxsa6ktm7j2@i5x4ngi7p2ia>
References: <739a8bd9-9ff0-5072-fdae-b64efdf86842@collabora.com>
 <e927cfcd-bf34-5daf-0e24-4dd828106968@linaro.org>
 <epds77sccy4cc5cdpoc4ir7sfz5sz3biwep6rbks2nuyqncidu@77gb4t2wy6vn>
 <47a5678c-1eb3-dfc2-a9ac-f8e497455d11@linaro.org>
 <unsithzszj7awvsmxwr7reshso5ju7u4nssil5tty6pocictf5@gwoltpgeecer>
 <6e070141-8c0e-59ed-8a08-58c3fadb17df@linaro.org>
 <lidknise4copce3vb2wth4z3fl2p4npsc4u6ajqb6zsp6lnpca@rp6wxcmy2aa4>
 <CAA8EJpq_VeY=44FqYm7QAT32AR=rmMOV0RtAfNFkb1hpSp29dw@mail.gmail.com>
 <djrx34qwb7yen47dmlsym4mg2pib4syncvdy52ma3sin7uhs7j@gi3znayuucnj>
 <a718f7c1-4ef1-18c8-33c7-c5da22e92c89@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ta6lyqgdkmvaizdf"
Content-Disposition: inline
In-Reply-To: <a718f7c1-4ef1-18c8-33c7-c5da22e92c89@linaro.org>
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
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ta6lyqgdkmvaizdf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 05, 2023 at 11:09:40PM +0300, Dmitry Baryshkov wrote:
> On 05/07/2023 19:53, Maxime Ripard wrote:
> > On Wed, Jul 05, 2023 at 06:20:13PM +0300, Dmitry Baryshkov wrote:
> > > On Wed, 5 Jul 2023 at 17:24, Maxime Ripard <mripard@kernel.org> wrote:
> > > >=20
> > > > On Wed, Jul 05, 2023 at 04:37:57PM +0300, Dmitry Baryshkov wrote:
> > > > > > > >=20
> > > > > > > > Either way, I'm not really sure it's a good idea to multipl=
y the
> > > > > > > > capabilities flags of the DSI host, and we should just stic=
k to the
> > > > > > > > spec. If the spec says that we have to support DSC while vi=
deo is
> > > > > > > > output, then that's what the panels should expect.
> > > > > > >=20
> > > > > > > Except some panels supports DSC & non-DSC, Video and Command =
mode, and
> > > > > > > all that is runtime configurable. How do you handle that ?
> > > > > >=20
> > > > > > In this case, most of the constraints are going to be on the en=
coder
> > > > > > still so it should be the one driving it. The panel will only c=
are about
> > > > > > which mode has been selected, but it shouldn't be the one drivi=
ng it,
> > > > > > and thus we still don't really need to expose the host capabili=
ties.
> > > > >=20
> > > > > This is an interesting perspective. This means that we can and ac=
tually have
> > > > > to extend the drm_display_mode with the DSI data and compression
> > > > > information.
> > > >=20
> > > > I wouldn't extend drm_display_mode, but extending one of the state
> > > > structures definitely.
> > > >=20
> > > > We already have some extra variables in drm_connector_state for HDM=
I,
> > > > I don't think it would be a big deal to add a few for MIPI-DSI.
> > > >=20
> > > > We also floated the idea for a while to create bus-specific states,=
 with
> > > > helpers to match. Maybe it would be a good occasion to start doing =
it?
> > > >=20
> > > > > For example, the panel that supports all four types for the 1080p=
 should
> > > > > export several modes:
> > > > >=20
> > > > > 1920x1080-command
> > > > > 1920x1080-command-DSC
> > > > > 1920x1080-video
> > > > > 1920x1080-video-DSC
> > > > >=20
> > > > > where video/command and DSC are some kinds of flags and/or inform=
ation in
> > > > > the drm_display_mode? Ideally DSC also has several sub-flags, whi=
ch denote
> > > > > what kind of configuration is supported by the DSC sink (e.g. bpp=
, yuv,
> > > > > etc).
> > > >=20
> > > > So we have two things to do, right? We need to expose what the pane=
l can
> > > > take (ie, EDID for HDMI), and then we need to tell it what we picked
> > > > (infoframes).
> > > >=20
> > > > We already express the former in mipi_dsi_device, so we could exten=
d the
> > > > flags stored there.
> > > >=20
> > > > And then, we need to tie what the DSI host chose to a given atomic =
state
> > > > so the panel knows what was picked and how it should set everything=
 up.
> > >=20
> > > This is definitely something we need. Marijn has been stuck with the
> > > panels that support different models ([1]).
> > >=20
> > > Would you prefer a separate API for this kind of information or
> > > abusing atomic_enable() is fine from your point of view?
> > >=20
> > > My vote would be for going with existing operations, with the slight
> > > fear of ending up with another DSI-specific hack (like
> > > pre_enable_prev_first).
> >=20
> > I don't think we can get away without getting access to the atomic_state
> > from the panel at least.
> >=20
> > Choosing one setup over another is likely going to depend on the mode,
> > and that's only available in the state.
> >=20
> > We don't have to go the whole way though and create the sub-classes of
> > drm_connector_state, but I think we should at least provide it to the
> > panel.
> >=20
> > What do you think of creating a new set of atomic_* callbacks for
> > panels, call that new set of functions from msm and start from there?
>=20
> We are (somewhat) bound by the panel_bridge, but yeah, it seems possible.

Bridges have access to the atomic state already, so it's another place
to plumb this through but I guess it would still be doable?

Maxime

--ta6lyqgdkmvaizdf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZKZsLwAKCRDj7w1vZxhR
xQYLAQDrdn9drGvi55zx4P3Y2raA/CnwNgRdfA3IyCWJWHEDAgEAhpDQWL3p2wMq
vhnP9QUdDtDLVJB0QOPAk5w1qMBU4w0=
=CHew
-----END PGP SIGNATURE-----

--ta6lyqgdkmvaizdf--
