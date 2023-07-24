Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5006175FCEF
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 19:11:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BB5D10E0E7;
	Mon, 24 Jul 2023 17:11:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod2-cph3.one.com
 (mailrelay1-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:400::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82D2910E0E7
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 17:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=k09OkZkHz1U1VJpY6ueOtE8II+8Lsf71u3vpE5oB4HY=;
 b=mbLhdXcpe+m4cljXsBMSeHpGFR5L46rZd8hu3zDt6nAoWl7hRAToRw1lszE1SV5swECwnAFZ4U3i4
 0sphoUIXicxPD6QjvOE4xYiXgymFm/bBXDJ+wmRPY/G5LK45gxZ2WHqZiEI4CwgOH82x3Pvnnb5zbG
 bwjWKc9oohdXH1sugZLU/LcsA+dIicWKwhTHHil0UJwfZZqFA2w5vL/fY8xtvxJuagdvIXLMoOuErh
 rCVNrS+AEbwA2ADBDsGLEyyzKrXkjPwZbAHV0+0MZFuNrBAbYXcDTyruu2MIzPTarcZwFIGLrapkM6
 UbsYRE2Wa24kbomENMQAID5gv97XXJA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=k09OkZkHz1U1VJpY6ueOtE8II+8Lsf71u3vpE5oB4HY=;
 b=vJtbr9px1cBBxtrVUa5zxWMb4KYiUR048317wgr+Hr1oN3ehJ5elJQdNyPbN1N08tb8oSrhGfggzH
 cXrVKSkAg==
X-HalOne-ID: 148c1359-2a45-11ee-8d86-99461c6a3fe8
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1 (Halon) with ESMTPSA
 id 148c1359-2a45-11ee-8d86-99461c6a3fe8;
 Mon, 24 Jul 2023 17:11:10 +0000 (UTC)
Date: Mon, 24 Jul 2023 19:11:08 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] drm/panel: ld9040: add backlight Kconfig dependency
Message-ID: <20230724171108.GA692753@ravnborg.org>
References: <20230724121736.1293270-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230724121736.1293270-1-arnd@kernel.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Paul Cercueil <paul@crapouillou.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 24, 2023 at 02:17:05PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The driver now uses the backlight interface, which breaks when that
> is disabled:
> 
> ld.lld: error: undefined symbol: devm_backlight_device_register
> 
> Enforce the necessary Kconfig dependency to avoid this.
> 
> Fixes: c2268daa65fb4 ("drm/panel: ld9040: Register a backlight device")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

I expect that someone else with drm-misc rights apply the patch.

	Sam
