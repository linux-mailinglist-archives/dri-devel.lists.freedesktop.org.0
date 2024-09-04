Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1205D96B55C
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 10:48:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECCA610E6ED;
	Wed,  4 Sep 2024 08:48:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25A4810E6ED
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 08:48:27 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1sllgf-00068R-KS; Wed, 04 Sep 2024 10:48:25 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1sllge-005PSp-6V; Wed, 04 Sep 2024 10:48:24 +0200
Received: from pza by lupine with local (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1sllge-0004wI-0R;
 Wed, 04 Sep 2024 10:48:24 +0200
Message-ID: <9d8b7a2c2d03c04bbc898563715c1e7d0c87291e.camel@pengutronix.de>
Subject: Re: [PATCH v2] gpu: ipu-v3: Add cleanup attribute for prg_node for
 auto cleanup
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Abhinav Jain <jain.abhinav177@gmail.com>, airlied@gmail.com, 
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org, javier.carrasco.cruz@gmail.com, 
 julia.lawall@inria.fr
Date: Wed, 04 Sep 2024 10:48:24 +0200
In-Reply-To: <20240704132142.1003887-1-jain.abhinav177@gmail.com>
References: <20240704132142.1003887-1-jain.abhinav177@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Do, 2024-07-04 at 13:21 +0000, Abhinav Jain wrote:
> Add cleanup attribute for device node prg_node.
> Remove of_node_put for device node prg_node as it is unnecessary now.
>=20
> Suggested-by: Julia Lawall <julia.lawall@inria.fr>
> Signed-off-by: Abhinav Jain <jain.abhinav177@gmail.com>

Thank you,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
