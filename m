Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4623F8721
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 14:18:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 698466E802;
	Thu, 26 Aug 2021 12:17:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 442 seconds by postgrey-1.36 at gabe;
 Thu, 26 Aug 2021 12:17:37 UTC
Received: from ssl.serverraum.org (ssl.serverraum.org
 [IPv6:2a01:4f8:151:8464::1:2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC6C66E802;
 Thu, 26 Aug 2021 12:17:37 +0000 (UTC)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 18D5722256;
 Thu, 26 Aug 2021 14:17:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1629980256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ph0v+Bk7Np1hcCXD7mWsaKWmwgPPFWEPG+SQv38Uy3I=;
 b=Fv1/NAqTNUuuth3zPm7X0Ir//6tzhF2bNK0eh/vTzdpTdujEGy5Z6qLODK0i7xLIFkH0PV
 m5BumCufw0obsOXFckyj2q3t4m5CZDJaEnMpo06+5XXZzPyrDVEoJvbFmCrtXIqNAq+dx6
 +c9U4whUhq33k2WwLUN5z3h6UTALRBc=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 26 Aug 2021 14:17:35 +0200
From: Michael Walle <michael@walle.cc>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, "Lukas F . Hartmann" <lukas@mntre.com>, Marek
 Vasut <marek.vasut@gmail.com>, Lucas Stach <l.stach@pengutronix.de>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 2/3] drm/etnaviv: fix dma configuration of the virtual
 device
In-Reply-To: <20210826121426.GR22278@shell.armlinux.org.uk>
References: <20210826121006.685257-1-michael@walle.cc>
 <20210826121006.685257-3-michael@walle.cc>
 <20210826121426.GR22278@shell.armlinux.org.uk>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <ebbb3cb0b07e45cc4171747fae844633@walle.cc>
X-Sender: michael@walle.cc
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2021-08-26 14:14, schrieb Russell King (Oracle):
> On Thu, Aug 26, 2021 at 02:10:05PM +0200, Michael Walle wrote:
>> +	pdev->dev.coherent_dma_mask = DMA_BIT_MASK(40);
>> +	pdev->dev.dma_mask = &pdev->dev.coherent_dma_mask;
> 
> Please use dma_coerce_mask_and_coherent() here instead.

It will be removed altogether in patch 3/3. I just moved the
current code around here. I could drop the code moving in 2/3. I
wasn't sure whats best.

-michael
