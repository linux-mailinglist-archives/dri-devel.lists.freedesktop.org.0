Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4505456014C
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 15:32:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C187112685;
	Wed, 29 Jun 2022 13:32:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBE91112685
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 13:32:22 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1o6Xnj-00068h-61; Wed, 29 Jun 2022 15:32:15 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1o6Xne-003PN6-2X; Wed, 29 Jun 2022 15:32:13 +0200
Received: from pza by lupine with local (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1o6Xng-0009Pb-UN; Wed, 29 Jun 2022 15:32:12 +0200
Message-ID: <1c926f032f1af5d48c227e711dbb6b07b9c1de2f.camel@pengutronix.de>
Subject: Re: [PATCH v3 03/71] drm/encoder: Introduce drmm_encoder_init
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Maxime Ripard <maxime@cerno.tech>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>,  Daniel Vetter <daniel.vetter@intel.com>, David
 Airlie <airlied@linux.ie>
Date: Wed, 29 Jun 2022 15:32:12 +0200
In-Reply-To: <20220629123510.1915022-4-maxime@cerno.tech>
References: <20220629123510.1915022-1-maxime@cerno.tech>
 <20220629123510.1915022-4-maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

On Mi, 2022-06-29 at 14:34 +0200, Maxime Ripard wrote:
> The DRM-managed function to register an encoder is
> drmm_encoder_alloc() and its variants, which will allocate the underlying
> structure and initialisation the encoder.
>=20
> However, we might want to separate the structure creation and the encoder
> initialisation, for example if the structure is shared across multiple DR=
M
> entities, for example an encoder and a connector.
>=20
> Let's create an helper to only initialise an encoder that would be passed
> as an argument.

Daniel pointed out here [1],=C2=A0that it might be good to check the passed
encoders are actually in drmm managed memory.

[1] https://lore.kernel.org/dri-devel/CAKMK7uGaAtk4AY5y=3DjbC7nDduRYFBfLSdH=
E8wykJ602Lk-3n+Q@mail.gmail.com/


regards
Philipp
