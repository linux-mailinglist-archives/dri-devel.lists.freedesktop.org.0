Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 135808C8874
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 16:52:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3338610E356;
	Fri, 17 May 2024 14:52:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B547310E356
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 14:52:19 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1s7ywT-0006xH-CW; Fri, 17 May 2024 16:52:17 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1s7ywS-001scT-1e; Fri, 17 May 2024 16:52:16 +0200
Received: from pza by lupine with local (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1s7ywR-000C04-3C;
 Fri, 17 May 2024 16:52:15 +0200
Message-ID: <2d9d1985284b0255e7366ded97124b3590261a6e.camel@pengutronix.de>
Subject: Re: [PATCH] drm/edid: add non-desktop quirk to Bigscreen Beyond HMD
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Sefa Eyeoglu <contact@scrumplex.net>, dri-devel@lists.freedesktop.org
Date: Fri, 17 May 2024 16:52:15 +0200
In-Reply-To: <20240517141049.896023-3-contact@scrumplex.net>
References: <20240517105555.654262-1-contact@scrumplex.net>
 <20240517141049.896023-3-contact@scrumplex.net>
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

On Fr, 2024-05-17 at 16:09 +0200, Sefa Eyeoglu wrote:
> The Bigscreen Beyond VR headset is a non-desktop output and should be
> marked as such using an EDID quirk.
>=20
> Closes https://gitlab.freedesktop.org/drm/misc/kernel/-/issues/39

From the EDID posted there, it looks like the quirk should not be
necessary?

The quoted DisplayID extension block correctly marks this as an HMD:

  "Display Product Primary Use Case: Head-mounted Virtual Reality (VR) disp=
lay"

The update_displayid_info() function in drm_edid.c should use this
information to set the non_desktop flag already. Doesn't this work as
expected?


regards
Philipp
