Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D874E8F12
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 09:35:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CDC810E620;
	Mon, 28 Mar 2022 07:35:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 325D910E620
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 07:35:37 +0000 (UTC)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 996C322205;
 Mon, 28 Mar 2022 09:35:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1648452932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KxoefHxHBWO4b2r56J13guP4925DtgDpQm/mM3H3NHE=;
 b=tuCU6rLPvYS4HLC6WvfjKQhqUDH665lXMWAlcV1ZvVcUAxENEnflPFcNuuyc8aht4cF0vD
 529FsUN8ktrT/KN6OUFARNq6IWFO3IOSOrMfmo/KVQdtdMYJgCPuDK23RHAPYVTLxUtwJA
 nX3RJqpEHGTwMkah0v+hJrkIuvorQTU=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 28 Mar 2022 09:35:30 +0200
From: Michael Walle <michael@walle.cc>
To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@microchip.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH] i2c: at91: use dma safe buffers
In-Reply-To: <20220303161724.3324948-1-michael@walle.cc>
References: <20220303161724.3324948-1-michael@walle.cc>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <5673a4be5ac51d19529366c48afceb8c@walle.cc>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-i2c@vger.kernel.org,
 stable@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

Am 2022-03-03 17:17, schrieb Michael Walle:
> The supplied buffer might be on the stack and we get the following 
> error
> message:
> [    3.312058] at91_i2c e0070600.i2c: rejecting DMA map of vmalloc 
> memory
> 
> Use i2c_{get,put}_dma_safe_msg_buf() to get a DMA-able memory region if
> necessary.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Michael Walle <michael@walle.cc>

Any news here?

> ---
> 
> I'm not sure if or which Fixes: tag I should add to this patch. The 
> issue
> seems to be since a very long time, but nobody seem to have triggered 
> it.
> FWIW, I'm using the sff,sfp driver, which triggers this.

-michael
