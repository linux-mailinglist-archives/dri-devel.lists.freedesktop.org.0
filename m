Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B010554516
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 12:07:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 133F610EB19;
	Wed, 22 Jun 2022 10:07:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9195110EB19
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 10:07:30 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 80C09DD;
 Wed, 22 Jun 2022 12:07:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1655892448;
 bh=SShWCIAIQnm3ZxuhfT4U72sk+2A6HsNKjsc9pU7lln8=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=QTPnSe0HPLQLpjSj0ikUaNtho6PwjjZQyrZl09Pq8nSYysI2lDqjGPT2jVHA42Ujd
 6Hi0jwpoGnpWpfvZfMAAVrv+O3jh6D/lhr95mMoTSm6EWKJ80SkfoEOMZ1WC00EDin
 cqsk3DV21FELPUtBrM28GKlqAsRR/gD6Dz9jnK/Q=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YgAc11fkN9m7QoEc@ravnborg.org>
References: <20220206154405.1243333-1-sam@ravnborg.org>
 <YgAc11fkN9m7QoEc@ravnborg.org>
Subject: Re: [PATCH v1 0/9] drm/bridge: ps8640 and ti-sn65dsi86 updates
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Douglas Anderson <dianders@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Date: Wed, 22 Jun 2022 11:07:26 +0100
Message-ID: <165589244641.1149771.3796337289343458935@Monstersaurus>
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
Cc: Rob Clark <robdclark@chromium.org>, Philip Chen <philipchen@chromium.org>,
 Jitao Shi <jitao.shi@mediatek.com>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Quoting Sam Ravnborg (2022-02-06 19:09:11)
> >=20
> > The code builds - but needs testing.
>=20
> Hrmff, no it does not build. The fixes was by accident not included.
> Will wait a bit for feedback before posting a v2.
>=20
>         Sam

Do you have any plan to send a v2 on this series?

I have built up a series to extend the ti-sn65dsi86 which is now based
on this. (which means I'll have an implied Tested-by: tag for these as
well).

--
Kieran
