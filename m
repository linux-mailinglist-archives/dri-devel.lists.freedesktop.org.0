Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8D93568AA
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 12:04:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5F636E088;
	Wed,  7 Apr 2021 10:04:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E0F66E8EC
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Apr 2021 10:04:28 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4FFg3b1VrNz1qtPt;
 Wed,  7 Apr 2021 12:04:27 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4FFg3b0TVVz1r1Mm;
 Wed,  7 Apr 2021 12:04:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id oMlvmVRE7GXr; Wed,  7 Apr 2021 12:04:26 +0200 (CEST)
X-Auth-Info: 8dUTHqOisTBgWZ5nRtwmWSQnkYJr+zUkSnJLC0MLeoA=
Received: from mail-internal.denx.de (p578adb1c.dip0.t-ipconnect.de
 [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed,  7 Apr 2021 12:04:26 +0200 (CEST)
Received: from deneb.denx.de (deneb [10.0.20.1])
 by mail-internal.denx.de (Postfix) with ESMTP id 5998D182B1A;
 Wed,  7 Apr 2021 12:04:16 +0200 (CEST)
Received: by deneb.denx.de (Postfix, from userid 569)
 id 259F524068D; Wed,  7 Apr 2021 12:04:15 +0200 (CEST)
Date: Wed, 7 Apr 2021 12:04:15 +0200
From: ch@denx.de
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: Add bindings for
 SN65DSI83/84/85
Message-ID: <YG2Dn3RkYOhYmYUa@deneb.denx.de>
References: <20210214174453.104616-1-jagan@amarulasolutions.com>
 <d7f9b241-3cfc-836a-2519-3b6621899108@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d7f9b241-3cfc-836a-2519-3b6621899108@denx.de>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 linux-amarula@amarulasolutions.com, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi again,

On Wed, Mar 24, 2021 at 02:56:37PM +0100, Claudius Heine wrote:
> Hi Jagan,
> 
> On 2021-02-14 18:44, Jagan Teki wrote:
> > SN65DSI83/84/85 devices are MIPI DSI to LVDS based bridge
> > controller IC's from Texas Instruments.
> > 
> > SN65DSI83 - Single Channel DSI to Single-link LVDS bridge
> > SN65DSI84 - Single Channel DSI to Dual-link LVDS bridge
> > SN65DSI85 - Dual Channel DSI to Dual-link LVDS bridge
> > 
> > Right now the bridge driver is supporting Channel A with single
> > link, so dt-bindings documented according to it.
> 
> Do you know when we can expect a v4 for this?
> 
> I am currently working on top of your patch set to setup a dual-link LVDS
> bridge of SN65DSI84.

Ping
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
