Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC67767088
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 17:30:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3238310E716;
	Fri, 28 Jul 2023 15:30:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFB6110E716
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 15:30:23 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1qPPQ6-0007Nt-3g; Fri, 28 Jul 2023 17:30:22 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1qPPQ5-002jsT-FG; Fri, 28 Jul 2023 17:30:21 +0200
Received: from pza by lupine with local (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1qPPQ4-000GVS-1g;
 Fri, 28 Jul 2023 17:30:20 +0200
Message-ID: <f076c601ca222015a9befe67cea84f8f31dda1cc.camel@pengutronix.de>
Subject: Re: [PATCH] drm/imx: ipuv3-plane: reuse local variable height in
 atomic_update
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Lucas Stach <l.stach@pengutronix.de>, dri-devel@lists.freedesktop.org
Date: Fri, 28 Jul 2023 17:30:20 +0200
In-Reply-To: <b26742b98dfaf06e49426f36cd62f7f6dfa611db.camel@pengutronix.de>
References: <20221220094430.3469811-1-p.zabel@pengutronix.de>
 <b26742b98dfaf06e49426f36cd62f7f6dfa611db.camel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
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
Cc: kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Di, 2023-01-10 at 19:21 +0100, Lucas Stach wrote:
> Am Dienstag, dem 20.12.2022 um 10:44 +0100 schrieb Philipp Zabel:
> > Use the already existing local variable height =3D drm_rect_height() >>=
 16
> > to replace other occurrences of the same value.
> >=20
> > Suggested-by: Lucas Stach <l.stach@pengutronix.de>
> > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
>=20
> Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

Thank you, pushed to drm-misc-next.

regards
Philipp
