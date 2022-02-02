Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8222F4A6D5E
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 09:59:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58CC310E2C7;
	Wed,  2 Feb 2022 08:59:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F65110E2C7
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 08:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1643792342; x=1675328342;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0yDxwtW5UErKc5OtAGKOFX0h2TgwB9+69qy+mevIKak=;
 b=nA7RoNyCipqjkaz2/NosUAmHqypnHlCmo39Mouygi/edSDZRZVr6Vx1S
 /boKAK+Xw8EyAEC1yAQJkRrXJAXCe0t14F7xJvNXCwrHZUZ2FbCsi/jL7
 4tKGldzNy4eRvbnvq3BikYq0X25wQO5EhFYJFYCFzwtCbkBcUEi8pyY1/
 18Al/sH+n+LV/rmt1F6M3M0a8b+Muhj2g/rOOd4yngHZspw9z/2kfTSMU
 uJSxh2qGhxjEDNy8Ab+6MsmxHCQDFst1+nDoQMX94fZVUrcIQHPu8Na3J
 6PhYwm9O6lABsLfvn1OGa9LHbxyRP1lasn9UiE9LuPGNxTa0YaL2TY1IH w==;
X-IronPort-AV: E=Sophos;i="5.88,336,1635199200"; d="scan'208";a="21846167"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 02 Feb 2022 09:59:00 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Wed, 02 Feb 2022 09:59:00 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Wed, 02 Feb 2022 09:59:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1643792340; x=1675328340;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0yDxwtW5UErKc5OtAGKOFX0h2TgwB9+69qy+mevIKak=;
 b=fz2dN2q2TaZAWjmZcJfnaNRe6vgZ5z5W0M52UJvoTfCEhv79KiL06RTk
 jWEIqA9yinMvkD40KVpsBuZOHyQCQBZkd4/D7GKz9Kq2FGQJATYZoU7ny
 ypQGnCpQj0cN4ALozcC9XH4D3bDE82w5P1wZHoIB39RrFIsDUtjacG61g
 MZUmE65SmZ+jQd/uIXWcPspiQGqDLa+TxsOUuIqs3BR3fGWImSfty50HS
 Px4jF2ove/TZFR5q2gG+tXgUfTv963QR14Z4CI3W2ylyNUAcYquRZC0rz
 sQfG1PufQdAg5tNsMKXU0hTJrMell0pUBbxc3tOsssKGfRjsAVQ1E6GI2 w==;
X-IronPort-AV: E=Sophos;i="5.88,336,1635199200"; d="scan'208";a="21846166"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 02 Feb 2022 09:59:00 +0100
Received: from steina-w.localnet (unknown [10.123.49.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 33E59280065;
 Wed,  2 Feb 2022 09:59:00 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: (EXT) Re: [PATCH v2 1/2] drm: mxsfb: Use dev_err_probe() helper
Date: Wed, 02 Feb 2022 09:58:57 +0100
Message-ID: <2756789.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <af6895d0-8514-f151-2675-2454cd15deeb@denx.de>
References: <20220202081755.145716-1-alexander.stein@ew.tq-group.com>
 <20220202081755.145716-2-alexander.stein@ew.tq-group.com>
 <af6895d0-8514-f151-2675-2454cd15deeb@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Mittwoch, 2. Februar 2022, 09:29:20 CET schrieb Marek Vasut:
> On 2/2/22 09:17, Alexander Stein wrote:
> > Use the dev_err_probe() helper, instead of open-coding the same
> > operation. This also adds a nice hint in
> > /sys/kernel/debug/devices_deferred.
> > 
> > Reviewed-by: Marek Vasut <marex@denx.de>
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> > 
> >   drivers/gpu/drm/mxsfb/mxsfb_drv.c | 3 +--
> >   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> V2: ... what changed ... ?
> 
> (probably nothing, since the patch still looks fine)

I put the changelog into cover letter (0/2). Content hasn't changed, I just 
added your Reviewed-by.

Regards,
Alexander



