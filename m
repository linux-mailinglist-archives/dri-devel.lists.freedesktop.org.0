Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E673D67CC
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 22:00:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82E0372C33;
	Mon, 26 Jul 2021 20:00:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4357272C33
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 20:00:48 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 2e5fb539-ee4c-11eb-9082-0050568c148b;
 Mon, 26 Jul 2021 20:00:52 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 122BB194B06;
 Mon, 26 Jul 2021 22:01:06 +0200 (CEST)
Date: Mon, 26 Jul 2021 22:00:44 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 3/3] drm/panel-simple: add Gopher 2b LCD panel
Message-ID: <YP8UbBjblbIOe5Ud@ravnborg.org>
References: <20210725221527.1771892-1-akawolf0@gmail.com>
 <20210725221527.1771892-4-akawolf0@gmail.com>
 <K3HUWQ.S5LBW8E092T01@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <K3HUWQ.S5LBW8E092T01@crapouillou.net>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, thierry.reding@gmail.com,
 Artjom Vejsel <akawolf0@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,
On Mon, Jul 26, 2021 at 10:02:08AM +0100, Paul Cercueil wrote:
> Hi Artjom,
> 
> Le lun., juil. 26 2021 at 01:15:27 +0300, Artjom Vejsel <akawolf0@gmail.com>
> a écrit :
> > The Gopher 2b LCD panel is used in Gopher 2b handhelds.
> > It's simple panel with NewVision NV3047 driver, but SPI lines are not
> > connected.
> > It has no specific name, since it's unique to that handhelds.
> > lot name at AliExpress: 4.3 inch 40PIN TFT LCD Screen COG NV3047 Drive
> > IC 480(RGB)*272 No Touch 24Bit RGB Interface
> 
> From what I gathered the Gopher2's LCD panel is the exact same that is
> inside the RS-07 handheld. According to the teardown (in [1]), the RS-07
> panel is a Amelin AML043056B0-40 (see [2]).
> 
> Could you verify that? According to the photos, the product code is written
> on the flexible connector.
> 
> If that's the case, instead of using the "qishenglong,gopher2b-lcd-panel"
> compatible string, could you use "amelin,aml043056b0-40"?
> 
> Cheers,
> -Paul

I assume you are going to apply this patch-set when you are happy with it.
OK?

	Sam
