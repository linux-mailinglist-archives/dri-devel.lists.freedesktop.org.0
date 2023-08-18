Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F25B07805DC
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 08:25:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28C4210E460;
	Fri, 18 Aug 2023 06:24:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C471910E45E;
 Fri, 18 Aug 2023 06:24:51 +0000 (UTC)
Date: Fri, 18 Aug 2023 06:24:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1692339889; x=1692599089;
 bh=nairp59cuWUAchL6Zy0UjEcGhD+YFI/njR1gP8bry3U=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=C7GjTr6bdEjpnI/FIWCZIho18m9/DIUEAUDap0ASSXDLBtpnGJJWt0F5WC52OW9Ys
 WiBSga8+iYIElI63nS1km/Hmy246U20v31weBXxnIkc4DSWx0p5hL7cYtJ7BfwsiPv
 9OpFBGpjFYdeuYSpE/6gknWo1xv1CV13jVsfHEoD9ELV+jDYVpFfhhPxzxdsiyFzDr
 vzUWfb1/hzhCV9riML/Kkdpsixa+BeCsgdr6QKm6PQI7FrQXCLLxIo5sm5Hdo8Hx/j
 PMcEtcHFT+O40rGx8wtLucySGotpDR8FPPK3Nb2oPn1bY/GQiypX0lywMQur8nyqrG
 zwEnch7FxI6aA==
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 3/4] drm/uapi: document the USB subconnector type
Message-ID: <gIjbz8oq8AuY8E5_XGKnJNjIyQK9SDxp2-3Ep-Dr3D9T_-iUIt-q-oFgarZor4jtdI3682ZtuvQnaQBhTrc5OR6G2sqvDxbmxGZmcRrBAio=@emersion.fr>
In-Reply-To: <d9f9c272-ce9b-4599-bb11-1c026087ead3@linaro.org>
References: <20230729004913.215872-1-dmitry.baryshkov@linaro.org>
 <a32ce695-038f-0ef8-3584-5bd1ba528131@linaro.org>
 <20230802191351.GA1407@pendragon.ideasonboard.com>
 <DE2B4523-D16C-4AFC-8352-212B23548DD5@linaro.org>
 <b6oOVz2YMIG4hJDWhq9lTh6R2HYcrpRwHENhplig9KSQMD8dIjTgC5KdH1Ij3URgV2HESp67Ax7QUsByGjMLouvbs-5q7PiPRdLkgJz6Fwk=@emersion.fr>
 <ADjuOeqA6575DKutMPaR9mW9rLhm-wjLc4ruoUkNwImf-GB90FdwDB7v7y6LFdzVG3BC4R52A0RUtStK4_smmGYTUs3UPDOX4T4Zl2YHkxE=@emersion.fr>
 <20230803204459.GD27752@pendragon.ideasonboard.com>
 <TR8IBdXbd0C4U8Z4zf9ZLEH66QMutWs0QAAkPnMlKiOvgEZCk6AfEIPcIfRC555XWs8eSzeCCCW9R-3NwxZg6hDhPvPseAgAULAdUQ6epDA=@emersion.fr>
 <d9f9c272-ce9b-4599-bb11-1c026087ead3@linaro.org>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Janne Grunau <j@jannau.net>,
 Robert Foss <rfoss@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andy Gross <agross@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Leo Li <sunpeng.li@amd.com>,
 intel-gfx@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Bjorn Andersson <andersson@kernel.org>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, August 17th, 2023 at 21:33, Dmitry Baryshkov <dmitry.baryshkov=
@linaro.org> wrote:

> We have been looking for a way to document that the corresponding DP
> port is represented by the USB connector on the device.
>=20
> Consequently, I believe the best way to document it, would be to use
> DisplayPort / USB, when there is no dongle connected, switching to
> DisplayPort / HDMI, DisplayPort / VGA, DisplayPort / DisplayPort, etc.
> when the actual dongle / display is connected and then switching back to
> the DisplayPort / USB when it gets disconnected.
>=20
> If this sounds good to all parties, I'll post v2, adding this
> explanation to the cover letter.

But how can user-space discover that the port is USB-C when it's
connected? That information is lost at this point.

(In addition, this clashes with the existing semantics of the
subconnector prop as discussed before: USB-C is not sub-, it's super-.)
