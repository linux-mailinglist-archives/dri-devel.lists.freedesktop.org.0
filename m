Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81512810CE3
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 10:03:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B627910E737;
	Wed, 13 Dec 2023 09:03:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12DF410E737
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 09:03:01 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1rDL8n-00039X-80; Wed, 13 Dec 2023 10:02:53 +0100
Message-ID: <a8188accccc12b524de0e479a1780f8447fb45dd.camel@pengutronix.de>
Subject: Re: [PATCH 1/3] drm/mxsfb: Add an entry for "fsl,imx8mq-lcdif"
From: Lucas Stach <l.stach@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
Date: Wed, 13 Dec 2023 10:02:51 +0100
In-Reply-To: <CAOMZO5D0rxTmxGZX1Obfm9+t46gW6XpGWDcHDzocQd6p5OokBg@mail.gmail.com>
References: <20231211204138.553141-1-festevam@gmail.com>
 <9089fb993eb0b2b630784e5b91cb88c1ff2f45fb.camel@pengutronix.de>
 <CAOMZO5D0rxTmxGZX1Obfm9+t46gW6XpGWDcHDzocQd6p5OokBg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
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
Cc: marex@denx.de, devicetree@vger.kernel.org, conor+dt@kernel.org,
 Fabio Estevam <festevam@denx.de>, kernel@puri.sm,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, martink@posteo.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Fabio,

Am Dienstag, dem 12.12.2023 um 15:28 -0300 schrieb Fabio Estevam:
> Hi Lucas,
>=20
> On Tue, Dec 12, 2023 at 3:19=E2=80=AFPM Lucas Stach <l.stach@pengutronix.=
de> wrote:
>=20
> > I don't really like this series. While we don't make any strong
> > guarantees in this way, it breaks booting older kernels with a new DT.
>=20
> I thought we needed only to guarantee that old DTs still run with
> newer kernels, not the other way around.
>=20
That's right. At least in the i.MX world we never made a strong
guarantee in that way.

Still we should not break it deliberately if there isn't a good reason
to do so. And I _feel_ that "DT schema isn't able to express the SoC
integration" isn't a good enough reason to break things.

But maybe there is a way to describe this in the DT schema, that we
aren't aware of yet. I'm not quite up-to-date with all the DT schema
stuff...

Regards,
Lucas
