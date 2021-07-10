Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B61853C332A
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jul 2021 08:18:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 238956EAD7;
	Sat, 10 Jul 2021 06:18:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 666E26EAD7
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jul 2021 06:18:47 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id b27be0b6-e146-11eb-8d1a-0050568cd888;
 Sat, 10 Jul 2021 06:18:52 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 92163194B04;
 Sat, 10 Jul 2021 08:18:55 +0200 (CEST)
Date: Sat, 10 Jul 2021 08:18:44 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 2/2] drm/panel: Add Innolux EJ030NA 3.0" 320x480 panel
Message-ID: <YOk7xCNes0VTCG21@ravnborg.org>
References: <20210625121045.81711-1-paul@crapouillou.net>
 <20210625121045.81711-2-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210625121045.81711-2-paul@crapouillou.net>
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

Hi Paul, Christophe,

On Fri, Jun 25, 2021 at 01:10:45PM +0100, Paul Cercueil wrote:
> From: Christophe Branchereau <cbranchereau@gmail.com>
> 
> Add support for the Innolux/Chimei EJ030NA 3.0"
> 320x480 TFT panel.
> 
> This panel can be found in the LDKs, RS97 V2.1 and RG300 (non IPS)
> handheld gaming consoles.
> 
> While being 320x480, it is actually a horizontal 4:3
> panel with non-square pixels in delta arrangement.
> 
> Signed-off-by: Christophe Branchereau <cbranchereau@gmail.com>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

The drivers looks good.
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
