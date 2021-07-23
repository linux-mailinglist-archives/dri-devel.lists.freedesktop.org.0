Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 294ED3D3217
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 05:01:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EFD86F48E;
	Fri, 23 Jul 2021 03:01:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAE8D6F48E
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 03:01:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9FA3260EB2;
 Fri, 23 Jul 2021 03:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627009268;
 bh=+pVRuUCXuNnSNbnIJkHUZSfYHS173tYlhb7QGty12i4=;
 h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
 b=ViDcLqMqUM/pqSKrSdsw3ca1tnANu4ijSt9Rz1rcjLbl4K0VuadCiwMaSTHrvMf/N
 ZQ3wksRxfBh7rBkNUzbgpJvwUa/U8KIdtgcACNEGgrbMWipk8zhdubG8i6AdWy+yZt
 jGQ3CePMasDLU7kF+VHEjGlVoTHzLxNfGty9Tz6LGxxU2w29XqBDq3n0tGx8ealcUp
 XcrozpLUhn01zGyd7bmUEnGyN9R0NsfUqD2zWV7QjxesKOHq/UDqkDWP5SlRSQqywi
 8mehkDzM8WGsYxUlLQo0GVupiLM2yMEDZADVKmTOQ2jmaP/VI2m14qDONtWwsrBR47
 XQtdbRBRZZjvA==
Date: Fri, 23 Jul 2021 11:01:00 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 4/4] ARM: dts: add SKOV imx6q and imx6dl based boards
Message-ID: <20210723030059.GG28658@dragon>
References: <20210714045349.10963-1-o.rempel@pengutronix.de>
 <20210714045349.10963-5-o.rempel@pengutronix.de>
 <YPSNdvUhQ6fCTUjj@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YPSNdvUhQ6fCTUjj@ravnborg.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Ulrich =?iso-8859-1?Q?=D6lmann?= <u.oelmann@pengutronix.de>,
 Michael Grzeschik <m.grzeschik@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Sascha Hauer <s.hauer@pengutronix.de>, Juergen Borleis <jbe@pengutronix.de>,
 Marco Felsch <m.felsch@pengutronix.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Oleksij Rempel <o.rempel@pengutronix.de>,
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?iso-8859-1?Q?S=F8ren?= Andersen <san@skov.dk>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jul 18, 2021 at 10:22:14PM +0200, Sam Ravnborg wrote:
> Hi Oleksij,
> On Wed, Jul 14, 2021 at 06:53:49AM +0200, Oleksij Rempel wrote:
> > From: Sam Ravnborg <sam@ravnborg.org>
> 
> The real author one these dts files are Juergen Borleis IIRC.
> I made some internal refactoring / renaming which is why I thing git
> says otherwise.
> So onless Juergen says otherwise we should give him the author credit.
> 
> Arnd - would it be OK if I take the bindings patches through
> drm-misc-next, and then you can take the DTS files via arm-soc?

Yeah, it makes sense to send panel-simple.yaml change (patch #1) via drm
tree.

Shawn
