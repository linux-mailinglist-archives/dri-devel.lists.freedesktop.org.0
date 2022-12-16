Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B468C64F0B9
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 19:08:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7372210E615;
	Fri, 16 Dec 2022 18:08:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AE3710E615
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 18:08:50 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1p6F8Z-0005Ho-Ox; Fri, 16 Dec 2022 19:08:47 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1p6F8W-004yom-Cj; Fri, 16 Dec 2022 19:08:45 +0100
Received: from pza by lupine with local (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1p6F8W-000DIq-5y; Fri, 16 Dec 2022 19:08:44 +0100
Message-ID: <95514c51dc562579e8bc5714e86d596643cffaf5.camel@pengutronix.de>
Subject: Re: [PATCH] gpu: ipu-v3: common: Add of_node_put() for reference
 returned by of_graph_get_port_by_id()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Liang He <windhl@126.com>, airlied@linux.ie, daniel@ffwll.ch, 
 dri-devel@lists.freedesktop.org
Date: Fri, 16 Dec 2022 19:08:43 +0100
In-Reply-To: <20220720152227.1288413-1-windhl@126.com>
References: <20220720152227.1288413-1-windhl@126.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mi, 2022-07-20 at 23:22 +0800, Liang He wrote:
> In ipu_add_client_devices(), we need to call of_node_put() for
> reference returned by of_graph_get_port_by_id() in fail path.
>=20
> Fixes: 17e052175039 ("gpu: ipu-v3: Do not bail out on missing optional po=
rt nodes")
> Signed-off-by: Liang He <windhl@126.com>

Applied to drm-misc-next.

regards
Philipp
