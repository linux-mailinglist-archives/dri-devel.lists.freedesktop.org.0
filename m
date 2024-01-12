Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3246082C174
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 15:20:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADCB010E083;
	Fri, 12 Jan 2024 14:20:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAB5410E083
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 14:20:29 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1rOIOZ-0003Z8-3i; Fri, 12 Jan 2024 15:20:27 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1rOIOY-002AgK-C6; Fri, 12 Jan 2024 15:20:26 +0100
Received: from pza by lupine with local (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1rOIOY-0008Qj-11;
 Fri, 12 Jan 2024 15:20:26 +0100
Message-ID: <3f20b80fa45f171d26b2b02dea9f9a9acff9c28a.camel@pengutronix.de>
Subject: Re: [PATCH 4/6] drm/imx: prefer snprintf over sprintf
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Date: Fri, 12 Jan 2024 15:20:26 +0100
In-Reply-To: <14c0108a54007a8360d84162a1d63cba9613b945.1704908087.git.jani.nikula@intel.com>
References: <cover.1704908087.git.jani.nikula@intel.com>
 <14c0108a54007a8360d84162a1d63cba9613b945.1704908087.git.jani.nikula@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani,

On Mi, 2024-01-10 at 19:39 +0200, Jani Nikula wrote:
> This will trade the W=3D1 warning -Wformat-overflow to
> -Wformat-truncation. This lets us enable -Wformat-overflow subsystem
> wide.
>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
