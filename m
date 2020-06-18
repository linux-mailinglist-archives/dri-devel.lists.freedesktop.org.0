Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 234581FF826
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 17:53:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26C3A6EB66;
	Thu, 18 Jun 2020 15:53:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B1098870A
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 15:52:59 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=localhost)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1jlwqR-00064n-GH; Thu, 18 Jun 2020 17:52:51 +0200
Message-ID: <4b717455032b5409754dffb71acc82c5fc0fc755.camel@pengutronix.de>
Subject: Re: [RESEND PATCH v2 0/4] drm/etnaviv: Tidy up clocks handling
From: Lucas Stach <l.stach@pengutronix.de>
To: Lubomir Rintel <lkundrak@v3.sk>
Date: Thu, 18 Jun 2020 17:52:50 +0200
In-Reply-To: <20200616212127.986410-1-lkundrak@v3.sk>
References: <20200616212127.986410-1-lkundrak@v3.sk>
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: etnaviv@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Dienstag, den 16.06.2020, 23:21 +0200 schrieb Lubomir Rintel:
> Hi,
> 
> please consider applying patches that are chained to this message.

Thanks, I've applied all of them to etnaviv/next.

Regards,
Lucas

> They make getting/enabling the clocks in the etnaviv driver slightly nicer,
> first two also fix potential problems.
> 
> Compared to v1, patch 2/4 was fixed and patch 3/4 was added.
> 
> As it was pointed out in response to v1, the clocks documented as
> mandatory by the binding document are different from what the driver
> enforces. Moreover, there is no agreement on which clocks must be
> present in the device tree, so I'm leaving the binding document until
> it's cleared up.
> 
> In any case, the "core" clock is always present so it's safe to make it
> mandatory and regardless of what ends up happening to the binding
> documentation, the other clocks can't be enforced without regressions.
> At most a comment or a warning could be added. I'm leaving it as it is.
> 
> Thank you
> Lubo
> 
> 
> _______________________________________________
> etnaviv mailing list
> etnaviv@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/etnaviv

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
