Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9E8205393
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 15:35:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 386D96E110;
	Tue, 23 Jun 2020 13:35:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D955F6E110
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jun 2020 13:35:34 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id DDF911C0C0F; Tue, 23 Jun 2020 15:35:30 +0200 (CEST)
Date: Tue, 23 Jun 2020 15:35:30 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Ond??ej Jirman <megous@megous.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-sunxi@googlegroups.com, Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Icenowy Zheng <icenowy@aosc.io>, devicetree@vger.kernel.org,
 Samuel Holland <samuel@sholland.org>, Bhushan Shah <bshah@kde.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Luca Weiss <luca@z3ntu.xyz>, Martijn Braam <martijn@brixit.nl>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 3/5] drm: panel: Add Xingbangda XBD599 panel (ST7703
 controller)
Message-ID: <20200623133529.GC2783@bug>
References: <20200617003209.670819-1-megous@megous.com>
 <20200617003209.670819-4-megous@megous.com>
 <20200620212529.GB74146@ravnborg.org>
 <20200620223010.fqjwijiixxkewk3p@core.my.home>
 <20200622080802.GA650963@ravnborg.org>
 <20200622111752.jsz37zl7hidvkozw@core.my.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200622111752.jsz37zl7hidvkozw@core.my.home>
User-Agent: Mutt/1.5.23 (2014-03-12)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi!
> > > > Would it not be better to have one st7703 driver that suipports both
> > > > panels?
> > > >
> > > > The driver would need dedicated init functions depending on the panel.
> > > > But a lot could also be shared.
> > > 
> > > I guess I can move the code there. 
> > In the same process the river should then be renamed to follow other
> > sitronix based drivers.
> > So the next developer will recognize this and use the correct driver.
> 
> Are driver/module names considered kernel ABI? Or is it possible to
> change them?

I believe you can get away with changing them.
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
