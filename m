Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B553D565B10
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:17:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89EC110E82E;
	Mon,  4 Jul 2022 16:14:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50AA010E110
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Jul 2022 21:37:50 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id F163E49C;
 Sun,  3 Jul 2022 23:37:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1656884268;
 bh=htQdOsuKWIGtdIzgSroG6GReT9s/Q6EeyIgRjAlXCUw=;
 h=In-Reply-To:References:Subject:From:To:Date:From;
 b=iJWVxEUS+Zh/c6FRDR8udDu7Rw3XTggLaKP14vFVRLmBGFQuq6L7DuKceVebxxCVd
 vSzrLHmonc4sK0OqtTa8oKI+W69fTRMZnU5eO4aVV82CnmGD/wHaARywTG4gwn4th8
 e2XLDog0A5P4jF0uwsccTSjOPAu1bCM2uYPdQ84c=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220703202724.9553-1-sam@ravnborg.org>
References: <20220703202724.9553-1-sam@ravnborg.org>
Subject: Re: [PATCH v2 0/1] bridge/ti-sn65dsi86.c: convert to atomic operations
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Date: Sun, 03 Jul 2022 22:37:45 +0100
Message-ID: <165688426534.1055341.9938555624286868320@Monstersaurus>
User-Agent: alot/0.10
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

(Dropping CC/lists)

Quoting Sam Ravnborg (2022-07-03 21:27:23)
> This patch is what is left on a previous attempt to make the
> ti-sn65dsi86 support DRM_BRIDGE_ATTACH_NO_CONNECTOR.
>=20
> I ran into several challenges on the way:
> - I never found a way to retreive bpc when the driver
>   do not create the connector - and the driver needs it.
>   There may be ways to change how bpc is used but as I have no access
>   to HW it is not easy to change much.
> - My understanding of the driver is limited so I dropped trying to
>   do the proper implmentation of format negotiation
> - I had made a small macro to encapsulate a few of the common functions
>   in drm_bridge_funcs - but looking at it with fresh eyes told me
>   this is not a good idea.
>=20
> I dropped previous a-b / r-b as the driver has changed a bit since
> last submission.
> Especially to Kieran - sorry for letting you wait so long for almost noth=
ing.

No worries, thanks for digging in.

I'll get my branch back up and rebase on top of this and resume from
there. I can't remember all the details right now - so it will be
interesting to see how to handle the issues you've mentioned above - but
I think some of it is what I was trying to work on. (dealing with
getting the BPC at least..., so I don't know if I considered the issue
you reference about case of the driver not creating a connector).

I don't think I'll be able to resume my DRM work for more than a couple
of weeks now though so I'm going to be a bit longer. Hopefully your
patch here looks like it could be merged independently though.

--
Kieran


>=20
> Sorry if this is a duplicate - something went wrong when I sent this
> mail the first time.
>=20
>         Sam
>=20
>=20
> Sam Ravnborg (1):
>       drm/bridge: ti-sn65dsi86: Use atomic variants of drm_bridge_funcs
>=20
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 23 +++++++++++++++--------
>  1 file changed, 15 insertions(+), 8 deletions(-)
>=20
>
