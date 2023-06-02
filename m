Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE4B71F80C
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 03:36:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 016A310E608;
	Fri,  2 Jun 2023 01:36:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from devico.uberspace.de (devico.uberspace.de [185.26.156.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 890BA10E608
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 01:36:38 +0000 (UTC)
Received: (qmail 10122 invoked by uid 990); 2 Jun 2023 01:36:36 -0000
Authentication-Results: devico.uberspace.de;
	auth=pass (plain)
MIME-Version: 1.0
Date: Fri, 02 Jun 2023 01:36:35 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Leonard Lausen" <leonard@lausen.nl>
Message-ID: <f98dcffe4b1dc91edf692fbaa766a263910f2c5b@lausen.nl>
TLS-Required: No
Subject: Re: [Freedreno] [PATCH] Revert "drm/msm/dp: Remove INIT_SETUP delay"
To: "Abhinav Kumar" <quic_abhinavk@quicinc.com>, "Kuogee Hsieh"
 <quic_khsieh@quicinc.com>, "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>,
 "Bjorn Andersson" <andersson@kernel.org>
In-Reply-To: <932ee149-c524-25e7-ee49-5ea1a7e6708c@quicinc.com>
References: <932ee149-c524-25e7-ee49-5ea1a7e6708c@quicinc.com>
 <e547edf4-1b48-5d12-1600-45f78e7cab49@quicinc.com>
 <1345a125-f745-4fe3-0f5e-bfe84225958d@quicinc.com>
 <b0cc40d5-6de1-91cc-e2cd-f47cc53551e4@quicinc.com>
 <ebbcd56ac883d3c3d3024d368fab63d26e02637a@lausen.nl>
 <20230508021536.txtamifw2vkfncnx@ripper>
 <3802269cd54ce105ef6dece03b1b9af575b4fa06@lausen.nl>
 <ad351c02-1c29-3601-53e8-f8cdeca2ac63@linaro.org>
 <49d175ec16e3f65a18265063e51092ee8d0d79c1@lausen.nl>
 <f2d1bb37-ea83-4d5d-6ef5-ae84c26d6ac1@quicinc.com>
 <b9c8243ed53c5c9d7c1b5711237f6130976ea99b@lausen.nl>
X-Rspamd-Bar: /
X-Rspamd-Report: MIME_GOOD(-0.1) BAYES_HAM(-0.653806) SUSPICIOUS_RECIPS(1.5)
X-Rspamd-Score: 0.746193
Received: from unknown (HELO unkown) (::1)
 by devico.uberspace.de (Haraka/3.0.1) with ESMTPSA;
 Fri, 02 Jun 2023 03:36:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lausen.nl; s=uberspace;
 h=from; bh=F1dvcx9M5aUHwpLVgbzf/l4rVtHAAaC7rv6RpWusZ5s=;
 b=wFk1temRwaSxBD9VI5V46NvXc365LyX2Oy2QNyMIivszup70xaT/XGMZU9EImnz2BJ4OAZR/Ng
 /+LZGTrJC+Vrm93lm6S9PM/qij10wuT53Ig7zCv+9c085Xm+9fxf5fDzKYr05woN1avArs2muKTc
 +dQytvX5Q7DgjKbcJZtFQkQ7QseKeklh9Qlue7F9wQTLCHfdOqm4Y4qQk2cGlL34GzXda63ViAd5
 8yfFe5zJjWkTACc5P7Avxr5evqcUzZuolE9tMP76oAtyEu8RCVAOQs47MP3uAUyhLqWJVkSid/h3
 dnWDVjz4YUH9H878dg0emKksBhR3ZpSi4RQP1CPXanMBcAshgbjBxHGigY+PejnMoOGfw1jJrvqO
 dubxnpOH3IyfpKlLY+F28N2lSoYyedtoSACiRy59GWHWiiOwkaO51SoFYwU5VM/dYG3RpEiFnoLP
 n3YP+gMxFqv+UrRpHzz+QulynVDBaFiizMzwpoMiHSvlczC5AUI+aJhlhQyT4nlYf95/UGIs96Ih
 /try9w4FMiDYKpELz9gP22UMwK5Xi9j27MK2yn3uKcs25g7GIy+87Wbb2b3sp9wwD5jTGq4urLRt
 8TGdvJxgrlCuiZ9cNuJLk9V7KDF+aseLMe6kLuvoWQXSd/l1Ju+nlTIxaR7GLjuxqscmWxWZeyDe
 s=
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
Cc: Sean Paul <sean@poorly.run>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>, regressions@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>, Nikita 
 Travkin <nikita@trvn.ru>, freedreno@lists.freedesktop.org,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Abhinav,

June 1, 2023 at 3:20 PM, "Abhinav Kumar" <quic_abhinavk@quicinc.com> wrot=
e:
> >=20
>=20>  [drm:drm_mode_config_helper_resume] *ERROR* Failed to resume (-107=
)
> >=20
>=20
> We are not able to recreate this on sc7280 chromebooks , will need to c=
heck on sc7180. This does not seem directly related to any of the hotplug=
 changes though so needs to be checked separately. So please feel free to=
 raise a gitlab bug for this and assign to me.

Thank you for checking with sc7280. I created https://gitlab.freedesktop.=
org/drm/msm/-/issues/25 and CCed you. I've also verified that the error p=
ersists with v6.4.0-rc4 + Kuogee's patch (just in case you may have teste=
d on sc7280 with 6.4).
=20
>=20>  https://patchwork.freedesktop.org/patch/538601/?series=3D118148&re=
v=3D3
> >  Apologies if you were not CCed on this, if a next version is CCed,
> >  will ask kuogee to cc you.
> >  Meanwhile, will be great if you can verify if it works for you and
> >  provide Tested-by tags.

I see Bjorn also tested the patch. As it fixes a serious USB-C DP regress=
ion which broke USB-C DP completely on lazor for v6.3, can it be included=
 in upcoming 6.3.y release?

Thank you
Leonard
