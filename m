Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B12E2608B89
	for <lists+dri-devel@lfdr.de>; Sat, 22 Oct 2022 12:24:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A9110E06D;
	Sat, 22 Oct 2022 10:24:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6831510E06D
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Oct 2022 10:24:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5B0BA60BC3;
 Sat, 22 Oct 2022 10:24:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34E7CC433D6;
 Sat, 22 Oct 2022 10:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1666434250;
 bh=l+9LqRHCf0p03ONxHuUbZfrISFee3GbEgSplOTK5/X8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Caijj8iAZMY3tIs9fYMyWcG2Rm1TdPtNWGkZTQSyeOCB32VfuGtdKVdXbhR/Ecvcq
 HejXmyr+B52rYroWVCK8GzP9twmx+0SAP5xK3ndhMeDYHTL3kFG7qy58iClPKepnaq
 OlMCuZYtjN2SZ0IIZepCV+Z1aHLzsWBcXih75q0c=
Date: Sat, 22 Oct 2022 12:24:08 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 14/17] ARM: omap1: remove dead code
Message-ID: <Y1PEyMdtirtZvbkQ@kroah.com>
References: <20221019144119.3848027-1-arnd@kernel.org>
 <20221019150410.3851944-1-arnd@kernel.org>
 <20221019150410.3851944-14-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221019150410.3851944-14-arnd@kernel.org>
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
Cc: Felipe Balbi <balbi@kernel.org>, Paul Walmsley <paul@pwsan.com>,
 linux-usb@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Tony Lindgren <tony@atomide.com>,
 Helge Deller <deller@gmx.de>, Kevin Hilman <khilman@kernel.org>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Alan Stern <stern@rowland.harvard.edu>,
 linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
 Bin Liu <b-liu@ti.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 19, 2022 at 05:03:36PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> After the removal of the unused board files, I went through the
> omap1 code to look for code that no longer has any callers
> and remove that.
> 
> In particular, support for the omap7xx/omap8xx family is now
> completely unused, so I'm only leaving omap15xx/omap16xx/omap59xx.
> 
> Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
> Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: linux-omap@vger.kernel.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>


Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
