Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 674293CAEF1
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 00:08:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B813A6E3B7;
	Thu, 15 Jul 2021 22:08:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0D736E3B7
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 22:08:25 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 3245575b-e5b9-11eb-8d1a-0050568cd888;
 Thu, 15 Jul 2021 22:08:34 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id DC594194B13;
 Fri, 16 Jul 2021 00:08:36 +0200 (CEST)
Date: Fri, 16 Jul 2021 00:08:21 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Dan.Sneddon@microchip.com
Subject: Re: [PATCH v1 0/2] drm/atmel-hlcdc: drop use of drm_irq mid-layer
Message-ID: <YPCx1Ts728QqdFOi@ravnborg.org>
References: <20210711091926.552861-1-sam@ravnborg.org>
 <31b00450-3961-ff49-047c-d65e128753b3@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <31b00450-3961-ff49-047c-d65e128753b3@microchip.com>
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
Cc: alexandre.belloni@bootlin.com, bbrezillon@kernel.org,
 dri-devel@lists.freedesktop.org, Claudiu.Beznea@microchip.com,
 Ludovic.Desroches@microchip.com, tzimmermann@suse.de, peda@axentia.se,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dan,
On Thu, Jul 15, 2021 at 09:55:09PM +0000, Dan.Sneddon@microchip.com wrote:
> I tested this patch set on the 9x60ek board and unfortunately it causes 
> errors.  The vbltest returns -1 and I also see the display get out of 
> sync while testing with a gui application.

Thanks a lot for the testing, I will take a look tomorrow and see if I
can figure out what is wrong.

	Sam
