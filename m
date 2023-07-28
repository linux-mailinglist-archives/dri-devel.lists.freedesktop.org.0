Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD1276708C
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 17:30:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67F9610E71A;
	Fri, 28 Jul 2023 15:30:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ACE110E71A
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 15:30:40 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1qPPQL-0007TD-W5; Fri, 28 Jul 2023 17:30:38 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1qPPQL-002jsd-9A; Fri, 28 Jul 2023 17:30:37 +0200
Received: from pza by lupine with local (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1qPPQL-000GWr-0C;
 Fri, 28 Jul 2023 17:30:37 +0200
Message-ID: <df2e8804c1c5b7c39535f52025ca68f161380ab0.camel@pengutronix.de>
Subject: Re: [PATCH v2 02/19] gpu: ipu-v3: pre: Convert to
 devm_platform_ioremap_resource()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yangtao Li <frank.li@vivo.com>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
Date: Fri, 28 Jul 2023 17:30:36 +0200
In-Reply-To: <20230710032355.72914-2-frank.li@vivo.com>
References: <20230710032355.72914-1-frank.li@vivo.com>
 <20230710032355.72914-2-frank.li@vivo.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mo, 2023-07-10 at 11:23 +0800, Yangtao Li wrote:
> Use devm_platform_ioremap_resource() to simplify code.
>=20
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

Thank you, pushed to drm-misc-next.

regards
Philipp
