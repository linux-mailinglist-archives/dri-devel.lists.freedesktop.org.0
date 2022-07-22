Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA2557E79B
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 21:45:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D06DE93755;
	Fri, 22 Jul 2022 19:45:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com
 (mailrelay4-1.pub.mailoutpod1-cph3.one.com [46.30.210.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 601E893742
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 19:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=nquW4uTK4EsRfwtuLuO5LJX7Kp99WKVz9jDKp1qtM5M=;
 b=LEOoim3HTfBG6Im2MJvLVsNAGyS2uuOEbXscuyokM/Cq0+jDNjlVMdSZVGzbu08uCGgp2NMKTuBbX
 UQMe5rIIaUj9Pmsl0FPhJ8TjuBkP1JqgsNRmucTpGIuMDBa2CWjPF4vuOik+cZBfoetpaOgJMmaWZH
 NPCjkgnc4OFVG8bJuL9A444xXFUePYsLaZ9dy14NgloFQLs5z1Tjg8+ZHKaTTgcx8i+xS7SOr1Bil0
 1QF/vPpeGyH5KLYMgSnUzMdSC1uw3v3W9dklceReos4x3GPaHg4GlPcMnx+r4aGL/Kc6NvhyGyeSHI
 cv8Dg8ySg6lhHC+K8w0VPrEFVAlJkCw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=nquW4uTK4EsRfwtuLuO5LJX7Kp99WKVz9jDKp1qtM5M=;
 b=vjNctA/bG7tR/QobV4rEn85FmJNic46NcaPLTwPjT2TY2KPM14A5VnPI9A2CoM6QTh/fdqjMSdpTB
 GM2I4gaAQ==
X-HalOne-Cookie: 7913dd9b8a246146ee3aa0d23a7b5d241bb96559
X-HalOne-ID: cab67a2b-09f6-11ed-8240-d0431ea8bb10
Received: from mailproxy3.cst.dirpod4-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id cab67a2b-09f6-11ed-8240-d0431ea8bb10;
 Fri, 22 Jul 2022 19:45:09 +0000 (UTC)
Date: Fri, 22 Jul 2022 21:45:07 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/1] spi/panel: dt-bindings: drop CPHA and CPOL from
 common properties
Message-ID: <Ytr+Q6kXr+f6dCfi@ravnborg.org>
References: <20220722191539.90641-1-krzysztof.kozlowski@linaro.org>
 <20220722191539.90641-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220722191539.90641-2-krzysztof.kozlowski@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Marek Belisko <marek@goldelico.com>, Pratyush Yadav <p.yadav@ti.com>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Krzysztof

On Fri, Jul 22, 2022 at 09:15:39PM +0200, Krzysztof Kozlowski wrote:
> The spi-cpha and spi-cpol properties are device specific and should be
> accepted only if device really needs them.  Drop them from common
> spi-peripheral-props.yaml schema, mention in few panel drivers which use
> themi

    "and include instead in the SPI controller bindings."

I cannot see you do this in the touched bindings.

So I cannot see how for example samsung,ld9040.yaml picks up
spi-controller.yaml and thus it no longer knows the spi-cpha and spi-cpol
properties.

Maybe I missed something?

	Sam
