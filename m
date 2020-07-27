Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0194022FDF2
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 01:33:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B3C46E0D9;
	Mon, 27 Jul 2020 23:32:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0B4D89DED
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 19:26:05 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (unknown [217.70.183.200])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id 079D13A85B6
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 19:26:00 +0000 (UTC)
X-Originating-IP: 193.22.133.58
Received: from hyperion.localnet (unknown [193.22.133.58])
 (Authenticated sender: relay@treewalker.org)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id D5A7920002;
 Mon, 27 Jul 2020 19:24:52 +0000 (UTC)
From: Maarten ter Huurne <maarten@treewalker.org>
To: Paul Cercueil <paul@crapouillou.net>, Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 1/6] dt-bindings: display: Document NewVision NV3052C DT
 node
Date: Mon, 27 Jul 2020 21:24:52 +0200
Message-ID: <2191202.OZe27ScSiE@hyperion>
In-Reply-To: <20200727191052.GA1011220@ravnborg.org>
References: <20200727164613.19744-1-paul@crapouillou.net>
 <20200727164613.19744-2-paul@crapouillou.net>
 <20200727191052.GA1011220@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 27 Jul 2020 23:32:42 +0000
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 od@zcrc.me, Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, 27 July 2020 21:10:52 CEST Sam Ravnborg wrote:
> > +description: |
> > +  This is a driver for 320x240 TFT panels,
> 
> The binding describes the HW, not the driver. So please re-phrase this
> part.
> 
> This datasheet:
> https://www.phoenixdisplay.com/wp-content/uploads/2019/05/NV3052C-Dat
> asheet-V0.2.pdf tells that the driver supports additional resoltions.
> I guess the 320x240 resolution is limited to the leadtek panel.

The word "driver" is overloaded ;)

I guess "driver IC" would make it clearer.

Bye,
		Maarten



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
