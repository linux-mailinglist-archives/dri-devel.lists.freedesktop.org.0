Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E981F3C341C
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jul 2021 12:22:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A3376EB1B;
	Sat, 10 Jul 2021 10:22:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59EF66EB1B
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jul 2021 10:22:07 +0000 (UTC)
Date: Sat, 10 Jul 2021 11:21:56 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/2] dt-bindings: display/panel: Add Innolux EJ030NA
To: Sam Ravnborg <sam@ravnborg.org>
Message-Id: <K4Y0WQ.MLS1MDCVFJWL3@crapouillou.net>
In-Reply-To: <YOlvev0nvXVYU01y@ravnborg.org>
References: <20210625121045.81711-1-paul@crapouillou.net>
 <YOk60yTP9L1gT3+W@ravnborg.org> <HBW0WQ.NHPOJDIT9XWR1@crapouillou.net>
 <YOlvev0nvXVYU01y@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
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
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, list@opendingux.net,
 Christophe Branchereau <cbranchereau@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


[...]

>>  I am not sure; the doc states that this (additionalProperties: 
>> false) "can't
>>  be used in case where another schema is referenced", which is the 
>> case here,
>>  as we include "panel-common.yaml".
> 
> This DT schema already list all relevant properties like:
> 
> 	backlight: true
> 
> So "additionalProperties: false" tells that no other properties are
> allowed other than the listed properties.
> 
> To my best understanding unevaluatedProperties: false is less strict 
> and
> should be used if one does not list all possilbe properties.
> This could be the case for a panel haging below a SPI controller as in
> this case. So in other words giving this some extra thought I think
> unevaluatedProperties: false is OK here.

A panel below a SPI controller would have all its SPI-specific 
properties covered by spi-controller.yaml, I believe? So maybe 
"additionalProperties: false" would work?

In any case, if I use "additionalProperties: false", "make 
dt_binding_check" complains that my example's "spi-max-frequency" 
property is not covered. So maybe you are right.

> So my r-b is ok if you keep it as it.
> 
> PS. Where do you guys hang out with the downfall of freenode - 
> somewhere
> on oftc?

We moved to #opendingux on Libera.

Cheers,
-Paul


