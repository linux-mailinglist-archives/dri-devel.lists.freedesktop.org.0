Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7849146BB
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 11:54:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22B5210E1F1;
	Mon, 24 Jun 2024 09:54:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF5ED10E1F1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 09:54:18 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1sLgOu-0004Tb-Ql; Mon, 24 Jun 2024 11:54:16 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1sLgOu-004cQ6-3T; Mon, 24 Jun 2024 11:54:16 +0200
Received: from pza by lupine with local (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1sLgOu-0005EK-08;
 Mon, 24 Jun 2024 11:54:16 +0200
Message-ID: <a40f77cbf17f6d8ff0de100849bff0c9bcc42df0.camel@pengutronix.de>
Subject: Re: [PATCH linux-next] gpu:ipu-v3:pre: replace of_node_put() with
 __free
From: Philipp Zabel <p.zabel@pengutronix.de>
To: R Sundar <prosunofficial@gmail.com>, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 skhan@linuxfoundation.org, javier.carrasco.cruz@gmail.com, Julia Lawall
 <julia.lawall@inria.fr>
Date: Mon, 24 Jun 2024 11:54:15 +0200
In-Reply-To: <20240427045024.7083-1-prosunofficial@gmail.com>
References: <20240427045024.7083-1-prosunofficial@gmail.com>
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

On Sa, 2024-04-27 at 10:20 +0530, R Sundar wrote:
> use the new cleanup magic to replace of_node_put() with
> __free(device_node) marking to auto release when they get out of scope.
>=20
> Suggested-by: Julia Lawall <julia.lawall@inria.fr>
> Signed-off-by: R Sundar <prosunofficial@gmail.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
