Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 858EC4F3CB6
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 19:01:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B76C10EC09;
	Tue,  5 Apr 2022 17:01:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25A5810EC0B
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 17:01:03 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id k21so24384815lfe.4
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Apr 2022 10:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=EhE3xEj7yTaKmn7cftZnafvMypbMiXwgf4Mz1OcfgBg=;
 b=lOsVIxXgyLw1bbuonyQ+6J95XWOlIKSAvozYTUSNESPEwUurIFSwO83vWvl3nF2MBD
 3wmnsOCeDDX6uWLZDA5vNIaXVNQH3jySbWVWvMLfj/3ZnrVRePqEsH6s4soxqYv40puY
 LlLsO/d4o4eMbyfBOCL2DTIQ4s8bK2hxgcTIRwPVAPnYCG2Sl/rmeXhmigLhC6uUtfrW
 v44W9mrPOlsxgzG3/L3r4ZVEw/uh+1muxNhfcHxozbCm8OWeta3pvLNp3Wu3OQdb5w6u
 G++8hk/HAPtOUebaVL6NgdTeUeMJsexGIjmpEL26AYNwSMF2dklT9o5CjbQdV7bUfFEI
 AEBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=EhE3xEj7yTaKmn7cftZnafvMypbMiXwgf4Mz1OcfgBg=;
 b=iE76zp2pul6ejd91v8I8iBS74+MpBgGot7WVE8pBN8kZP6Im4ijZRFAZcCQBBqVxFA
 xRJvjGZHQUADiBQ6cIYTs5fPdyJMleQDjXtAC3wZEHdPhz31pqiSG8x21NJ0cWGr/FWR
 Fet5rvMiJqqWQZqLvdrvXwExqqne/Ou3aefYCr0vclcJVvjEB6gDLGdn3p0WPmQySOL9
 gAoDsoSfEBSezazjmhkzEIymdmTRR1TpEM5Odu69aSQMMYDKFaooxzelPc7HhE01WXgo
 V8n9IZtNsY8NTLZ7IMZbDE2wrQY5fmENLQ915H8M7h7CHFHgOCCDLQLWalcXdS1mjvel
 0EvQ==
X-Gm-Message-State: AOAM530eLmzo658wMDpHGz4V2L6whHl0jIGgajqjnDXzAwYtGB+s1GX/
 HwxRkwaDvNfssxQ1VqrFG7A=
X-Google-Smtp-Source: ABdhPJxdyhEhx3Oy3KqZw5PM7lrlcK1yJXCNYWYb9LypIihDqvGdwlFY8Y76QIJQS2OaT89Zm2xDDQ==
X-Received: by 2002:ac2:4569:0:b0:44a:de90:e495 with SMTP id
 k9-20020ac24569000000b0044ade90e495mr3253977lfm.352.1649178061017; 
 Tue, 05 Apr 2022 10:01:01 -0700 (PDT)
Received: from orome (pd9e518f7.dip0.t-ipconnect.de. [217.229.24.247])
 by smtp.gmail.com with ESMTPSA id
 2-20020ac24d42000000b0044ad39c6c83sm1554336lfp.158.2022.04.05.10.00.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 10:00:59 -0700 (PDT)
Date: Tue, 5 Apr 2022 19:00:57 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v3] drm: of: Properly try all possible cases for
 bridge/panel detection
Message-ID: <Ykx1yQGROqyiu/yJ@orome>
References: <20220329132732.628474-1-paul.kocialkowski@bootlin.com>
 <YkZulslrzeurp43U@ripper> <YkatbpubQjwBWOiK@aptenodytes>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="G3PF1PcGvTi6lpvg"
Content-Disposition: inline
In-Reply-To: <YkatbpubQjwBWOiK@aptenodytes>
User-Agent: Mutt/2.2.1 (c8109e14) (2022-02-19)
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--G3PF1PcGvTi6lpvg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 01, 2022 at 09:44:46AM +0200, Paul Kocialkowski wrote:
> Hi Bjorn,
>=20
> On Thu 31 Mar 22, 20:16, Bjorn Andersson wrote:
> > On Tue 29 Mar 06:27 PDT 2022, Paul Kocialkowski wrote:
> >=20
> > > While bridge/panel detection was initially relying on the usual
> > > port/ports-based of graph detection, it was recently changed to
> > > perform the lookup on any child node that is not port/ports
> > > instead when such a node is available, with no fallback on the
> > > usual way.
> > >=20
> > > This results in breaking detection when a child node is present
> > > but does not contain any panel or bridge node, even when the
> > > usual port/ports-based of graph is there.
> > >=20
> > > In order to support both situations properly, this commit reworks
> > > the logic to try both options and not just one of the two: it will
> > > only return -EPROBE_DEFER when both have failed.
> > >=20
> >=20
> > Thanks for your patch Paul, it fixed a regression on a device where I
> > have a eDP bridge with an of_graph and a aux-bus defined.
> >=20
> > But unfortunately it does not resolve the regression I have for the
> > USB based DisplayPort setup described below.
> >=20
> >=20
> > In the Qualcomm DisplayPort driver We're calling:
> >=20
> > 	devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
> >=20
> > and with the following DT snippet the behavior changed:
> >=20
> > displayport-controller@ae90000 {
> > 	compatible =3D "qcom,sc8180x-dp";
> > 	...
> >=20
> > 	operating-points-v2 =3D <&dp0_opp_table>;
> >=20
> > 	ports {
> > 		#address-cells =3D <1>;
> > 		#size-cells =3D <0>;
> >=20
> > 		port@0 {
> > 			reg =3D <0>;
> > 			dp0_in: endpoint {
> > 				remote-endpoint =3D <&display_driver>;
> > 			};
> > 		};
> > 	};
> >=20
> > 	dp0_opp_table: opp-table {
> > 		...;
> > 	};
> > };
> >=20
> > Prior to the introduction of 80253168dbfd ("drm: of: Lookup if child
> > node has panel or bridge") this would return -ENODEV, so we could
> > differentiate the case when we have a statically defined eDP panel from
> > that of a dynamically attached (over USB) DP panel.
> >=20
> > Prior to your change, above case without the opp-table node would have
> > still returned -ENODEV.
> >=20
> > But now this will just return -EPROBE_DEFER in both cases.
>=20
> Oh that's right, the -ENODEV case was just completely removed by my chang=
e.
> Initially this would happen if !of_graph_is_present or if the remote node
> doesn't exist.
>=20
> Now that we are also checking for child nodes, we can't just return -ENOD=
EV
> when the graph or remote node is missing: we must also check that there i=
s no
> child node that is a panel/bridge.
>=20
> For the graph remote case, we can reliabily return -EPROBE_DEFER when
> of_graph_is_present and the remote exists and of_device_is_available.
> Otherwise we can go for -ENODEV. I think getting -EPROBE_DEFER at this po=
int
> should stop the drm_of_find_panel_or_bridge process.
>=20
> On the other hand for the child panel/bridge node case, I don't see how we
> can reliably distinguish between -EPROBE_DEFER and -ENODEV, because
> of_drm_find_panel and of_drm_find_bridge will behave the same if the child
> node is a not-yet-probed panel/bridge or a totally unrelated node.
> So I think we should always return -EPROBE_DEFER in that case.
>=20
> As a result you can't get -ENODEV if using the of graph while having any
> (unrelated) child node there, so your issue remains.
>=20
> Do you see any way we could make this work?
>=20
> > I thought the appropriate method of referencing the dsi panel was to
> > actually reference that using the of_graph, even though it's a child of
> > the dsi controller - that's at least how we've done it in e.g. [1].
> > I find this to be much nicer than to just blindly define that all
> > children of any sort of display controller must be a bridge or a panel.
>=20
> Yes I totally agree. Given that using the child node directly apparently
> can't allow us to distinguish between -EPROBE_DEFER/-ENODEV I would be in
> favor of dropping this mechanism and going with explicit of graph in any =
case
> (even if it's a child node). I don't see any downside to this approach.
>=20
> What do yout think?

This patch has recently starting causing failures on various Tegra
devices that use drm_of_find_panel_or_bridge() for the case where the
output might be connected to an eDP or LVDS panel. However, that same
output could also be connected to an HDMI or DP monitor, in which case
we obviously don't want a DT representation because it's all
discoverable.

If I understand correctly, that's similar to what Bjorn described. In my
case I was able to fix the regression by returning -ENODEV at the very
end of the function (i.e. no matching ports were found and no graph is
present).

Thierry

--G3PF1PcGvTi6lpvg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmJMdcYACgkQ3SOs138+
s6G+FRAAteqUytCKBjVXrgayROapTBFjx8hTV88Y88uTqPW97kVaniy2tNZNK07I
seH5o1SGPWam/5s/INXKwQ2RH3AOcIBSpvbVQFwDQRjXwjGcO7JuuBmFMNTlcuOD
jqRbOawWCQt8uecnZmPPaLAGhg8zg2M2cAZflhqiQKy0F8ivdEfNkysZhU3Gc7v+
jJihDHnPq2ot8HyvzYLKTl4Zf1CvJTkzYF5YPRhYDLPoQv+qHQd33U8dDmBFhJGk
19FK0yLkpoGLM0jWWKsmiMuLHZ4u7y+lvmc3sKUafwjfzW1YgR9gq2I5kpWnWKlX
0pDVPZG9lhuUHylKfrynzNWmS33KfdZViMgJgFd6NDkGVK0znnYOzYwhPiAJwQ+Q
KD6SolpKJa82N9YYMnLUIPq9unmNnONWhY4VayfZYirOzf/4xjTYdtD6QWTkI3K+
RCAgTk3QP0/hI+ZYFUdOqST/9Y9lYc1u/RlHgQjBF79pAYZcC9wp7eONvYHBgDK9
k+CqExIzOc9EoCPxEbbSL1nsHg4hDa3Ct//1O4+zSbZe41hvO1ayA4Vl2TxM8cgG
ELttCZZ5R879I+1IZL5ll0Ikw6RkRkZ5mplg4tfn2AJM7uYep4kkw6vvnfcsF2vS
fAb9KrbHRCM+o76prnQfq3j4TrUZEeGOietyUPpBwXuUgbPAw0A=
=zt/2
-----END PGP SIGNATURE-----

--G3PF1PcGvTi6lpvg--
