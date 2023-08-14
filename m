Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A1077BA46
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 15:39:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEFFE10E1FA;
	Mon, 14 Aug 2023 13:39:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2454910E1FA
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 13:39:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C128DC0006;
 Mon, 14 Aug 2023 13:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1692020379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gnac+iz/OeJ3aAVoaRx/bpiiylMQmySRZ97jfu/PZXA=;
 b=SRd1DsNsIpnUs14s8YfCNN2ZWqpSue3ckx23zDZo+R4VpvYvwPFqrupPXpyhtkD8K1FWaj
 gtovepaI1arcD5H9f+2y0zkcTn+CatsJ1OU3SdIjFfpn4PgnA/iI5dwVDDO3dcqrc2woy6
 PFDf0bquvC75vLHoldsHdEOxNGfs1UFC1o1CxMCMUB2aK3b+sMBynUdjDwdx0PjbKLLLQ1
 Shbof78uTFco9DlodSy3JEQgZz7xeAK9yKF+fimbz7iY/iyVwLFrMFhg9emJWW6iAfr3zK
 Gxbi+bq0eg4HEMojLgFQYoTSmaVIaJdo4mZwNnTs+iXVCxRF7Kz0JYhL0zaAcw==
Date: Mon, 14 Aug 2023 15:39:09 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel: simple: Fix Innolux G156HCE-L01 LVDS clock
Message-ID: <20230814153909.2b00b4c3@booty>
In-Reply-To: <0df7954c-6520-43bb-9246-c4a5a40b202b@linaro.org>
References: <20230804151010.834990-1-luca.ceresoli@bootlin.com>
 <0df7954c-6520-43bb-9246-c4a5a40b202b@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
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
Cc: Marek Vasut <marex@denx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Neil,

On Mon, 14 Aug 2023 14:38:51 +0200
Neil Armstrong <neil.armstrong@linaro.org> wrote:

> On 04/08/2023 17:10, Luca Ceresoli wrote:
> > This panel has been implemented in commit 225213f24c79 ("drm/panel-simple:
> > Add Innolux G156HCE-L01 panel entry") with a higher clock than the typical
> > one mentioned on the documentation to avoid flickering on the unit
> > tested. Testing on a different unit shows that the panel actually works
> > with the intended 70.93 MHz clock and even lower frequencies so the
> > flickering is likely caused either by a defective unit or by other
> > different components such as the bridge.
> > 
> > Fixes: 225213f24c79 ("drm/panel-simple: Add Innolux G156HCE-L01 panel entry")  
> 
> This is the wrong sha, it should be eae7488814b5

Ah, good catch, Thank you!

v2 on its way.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
