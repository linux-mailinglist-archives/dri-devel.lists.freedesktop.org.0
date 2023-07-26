Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB811763686
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 14:42:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D2B10E472;
	Wed, 26 Jul 2023 12:41:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC9210E472
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 12:41:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6792061AE1;
 Wed, 26 Jul 2023 12:41:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D1F1C433C7;
 Wed, 26 Jul 2023 12:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690375314;
 bh=bALS92dZEp6Bog/IDgTHSkowfaf9shZJRJWKE/3Rzp4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K522A7YUIGm7SR5p/ijItVCD+05Na78v0dHvP6RrW5JDm7ocD8s+++3FsBW8zCpCN
 YCYw7f0JDV6tPpmtPpErRRqlfR0RwAge3HzBCoQ9Af/F9h9z2E+58+4Vw9X1x+LsPx
 brSuyzhawBS3vJEvDQEKEvjEsX6xEqCE9wZ3lfxucpuzxeF5ix9CWN+KJDMsX/tTnM
 /A5ClEgYaWPfeez2AMkgkIfesVaiHKxxmElImvFZjrGbW3Qw/ViVkE3UL+kGB0BrLN
 Qeaq5YJIvU0QGCNBQi0eUSoz59sADEaMRgyFu6TARgzDEhRkthXLxa7Sp8dRmYo0M7
 zUas4sryFDWNA==
Date: Wed, 26 Jul 2023 14:41:51 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 02/10] drm/panel: Check for already prepared/enabled
 in drm_panel
Message-ID: <snx3fzvf3icauri2xuigydvpqxtzhp34mptdxvifi7jswm2evy@sx7jr7zwvjw5>
References: <20230725203545.2260506-1-dianders@chromium.org>
 <20230725133443.v3.2.I59b417d4c29151cc2eff053369ec4822b606f375@changeid>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fea6cqcwqp7wzipv"
Content-Disposition: inline
In-Reply-To: <20230725133443.v3.2.I59b417d4c29151cc2eff053369ec4822b606f375@changeid>
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
Cc: dri-devel@lists.freedesktop.org, Chris Morgan <macroalpha82@gmail.com>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Frank Rowand <frowand.list@gmail.com>,
 linux-input@vger.kernel.org, hsinyi@google.com, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 linux-arm-msm@vger.kernel.org, yangcong5@huaqin.corp-partner.google.com,
 Jiri Kosina <jikos@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--fea6cqcwqp7wzipv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Tue, Jul 25, 2023 at 01:34:37PM -0700, Douglas Anderson wrote:
> NOTE: arguably, the right thing to do here is actually to skip this
> patch and simply remove all the extra checks from the individual
> drivers. Perhaps the checks were needed at some point in time in the
> past but maybe they no longer are? Certainly as we continue
> transitioning over to "panel_bridge" then we expect there to be much
> less variety in how these calls are made. When we're called as part of
> the bridge chain, things should be pretty simple. In fact, there was
> some discussion in the past about these checks [1], including a
> discussion about whether the checks were needed and whether the calls
> ought to be refcounted. At the time, I decided not to mess with it
> because it felt too risky.

Yeah, I'd agree here too. I've never found evidence that it was actually
needed and it really looks like cargo cult to me.

And if it was needed, then I'm not sure we need refcounting either. We
don't have refcounting for atomic_enable / disable, we have a sound API
design that makes sure we don't fall into that trap :)

> Looking closer at it now, I'm fairly certain that nothing in the
> existing codebase is expecting these calls to be refcounted. The only
> real question is whether someone is already doing something to ensure
> prepare()/unprepare() match and enabled()/disable() match. I would say
> that, even if there is something else ensuring that things match,
> there's enough complexity that adding an extra bool and an extra
> double-check here is a good idea. Let's add a drm_warn() to let people
> know that it's considered a minor error to take advantage of
> drm_panel's double-checking but we'll still make things work fine.

I'm ok with this, if we follow-up in a couple of releases and remove it
and all the calls.

Could you add a TODO item so that we can keep a track of it? A follow-up
is fine if you don't send a new version of that series.

Maxime

--fea6cqcwqp7wzipv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZMEUjwAKCRDj7w1vZxhR
xanPAP4voVmceTn00DRIp62vuGdOHci+svLi/7f8l6Z6NuyYrQD9Ewfs//FjcPgH
B/1NNtCNPIdGky8NtXB4QU3dP2Nq4AA=
=15yF
-----END PGP SIGNATURE-----

--fea6cqcwqp7wzipv--
