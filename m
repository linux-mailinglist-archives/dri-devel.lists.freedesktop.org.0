Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0ED6ED286
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 18:33:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DA3F10E078;
	Mon, 24 Apr 2023 16:33:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6470F10E110
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 16:33:51 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3A282802;
 Mon, 24 Apr 2023 18:33:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1682354019;
 bh=KcIHbcyYvbkajc227Nn8U754N1nQHT3tyc4kfFqIhq8=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=Dqne2WDRGzFUZDtfY3noblNM1ilty3Nto7f8hVFTPJVu5tfy8bdH2cuG7+6wSlzzs
 /kTKhl1PqKEdOTvT8hxo6Af9w+0h+PgR9+ED5wTZFObTAXBPdeFiSi4v4DAeqEkB5Q
 t4iMxatcxBIxwTV3qS171XNntvOb2fy4y3kiFoAo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230424161024.136316-2-biju.das.jz@bp.renesas.com>
References: <20230424161024.136316-1-biju.das.jz@bp.renesas.com>
 <20230424161024.136316-2-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v8 1/5] drm: Place Renesas drivers in a separate dir
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Date: Mon, 24 Apr 2023 17:33:46 +0100
Message-ID: <168235402660.2445904.1033629703665211251@Monstersaurus>
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
Cc: Stephen Kitt <steve@sk2.org>, Dan Carpenter <error27@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Paul Cercueil <paul@crapouillou.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Marek Vasut <marex@denx.de>,
 Takanari Hayama <taki@igel.co.jp>, Danilo Krummrich <dakr@redhat.com>,
 Peter Robinson <pbrobinson@gmail.com>, LUU HOAI <hoai.luu.ub@renesas.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Biju Das (2023-04-24 17:10:20)
> Create vendor specific renesas directory and move renesas drivers
> to that directory.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Acked-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
