Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD34777F22
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 19:31:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07FD910E0F2;
	Thu, 10 Aug 2023 17:31:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod2-cph3.one.com
 (mailrelay3-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:402::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CB9610E0F2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 17:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=NbPi842XVg+zlQNBeb5AXkdZzzcv7g0f1wJvKgq2vg4=;
 b=CtofHbui9sWvMF70T2IaXzsWLLp6CipJUxH4Z8QmItDeYHOZfd7oJB3YXCiHqIqA42LGW7FqM3n5t
 hJx3OzauFb9Kq2I8O9c9jnnRdLlu3tNVGv6klFnfhQKWkcHuy3kUZtu+Ayv6qkwtu8sukZWSrOZsy/
 S0VngqRCP4NP5wBh5Ek26mgouTWV9DuZ0AbPZ4nVZulmIgIeAa9R13TTk01iVX27TTJtiYBeujwODF
 D92A8H5wC5RAHMMpv3KLunCtyvGmforZ0PwxOiFP02x+dy0nrmsmQb8mCOo31PfjSs3SOZRJGdHRJT
 9lsZPSsZYYhKY+PESW8FRElngIpRbfw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=NbPi842XVg+zlQNBeb5AXkdZzzcv7g0f1wJvKgq2vg4=;
 b=/1WYac6eAVxHKMCzw0VYNxB13NjxOCr6W3t0LIZ/Ew/4tcbwO6kdPIlj1t+U9ffKuM+1dKFyE8vLj
 cUX9OKfAA==
X-HalOne-ID: ba868d09-37a3-11ee-abbe-b90637070a9d
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3 (Halon) with ESMTPSA
 id ba868d09-37a3-11ee-abbe-b90637070a9d;
 Thu, 10 Aug 2023 17:31:26 +0000 (UTC)
Date: Thu, 10 Aug 2023 19:31:25 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH] drm: atmel-hlcdc: Support inverting the pixel clock
 polarity
Message-ID: <20230810173125.GA91332@ravnborg.org>
References: <20230609144843.851327-1-miquel.raynal@bootlin.com>
 <20230610200515.GA1041001@ravnborg.org>
 <20230807111246.663637a6@xps-13>
 <20230807165245.GA281773@ravnborg.org>
 <20230808083338.5e31584c@xps-13>
 <20230810084552.3db3d8c6@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230810084552.3db3d8c6@collabora.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, rfoss@kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> I queued it to drm-misc-next this morning.

Thanks Boris!

	Sam
