Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C8C8768AC
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 17:41:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15C0F10FD0B;
	Fri,  8 Mar 2024 16:41:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7825310FD0B
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Mar 2024 16:41:46 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1ridI0-0003Pq-9I; Fri, 08 Mar 2024 17:41:44 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1ridHz-005Afw-J5; Fri, 08 Mar 2024 17:41:43 +0100
Received: from pza by lupine with local (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1ridHz-000Ez1-1i;
 Fri, 08 Mar 2024 17:41:43 +0100
Message-ID: <62dee175d087ca22315f9a27ce9b1f2b6f7f032d.camel@pengutronix.de>
Subject: Re: [PATCH 5/8] drm/imx/ipuv3: do not return negative values from
 .get_modes()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, stable@vger.kernel.org
Date: Fri, 08 Mar 2024 17:41:43 +0100
In-Reply-To: <311f6eec96d47949b16a670529f4d89fcd97aefa.1709913674.git.jani.nikula@intel.com>
References: <cover.1709913674.git.jani.nikula@intel.com>
 <311f6eec96d47949b16a670529f4d89fcd97aefa.1709913674.git.jani.nikula@intel.com>
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

On Fr, 2024-03-08 at 18:03 +0200, Jani Nikula wrote:
> The .get_modes() hooks aren't supposed to return negative error
> codes. Return 0 for no modes, whatever the reason.
>=20
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: stable@vger.kernel.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
