Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5870F4A801B
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 09:02:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 760FC10EE9C;
	Thu,  3 Feb 2022 08:02:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5770810EE9A
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 08:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1643875322; x=1675411322;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pjS6RspszbEFEaiI25blgZRzdp2Q96jSu7lNDEq/gsU=;
 b=Y5ZGBpazjLVLeb2wHppzd2n03Y8kbP9HpsxW6kHLP/HpXzK/SxO+ISB2
 sFNQz0atcx8fs1fKxB22mjokg31AdT6yEVPDisHTMRTffC6qPW24EAZwf
 wTKkXDzUkXrzlX/ycOAXM6rgbRVowGql1w4v6IYn+vZYQRHJ9NLrSEvFa
 yk4zL6GysEk27xzX47M5C/LlejeUOYu8VbQdzbHoFjZMIMjERdImSf1Xn
 dxNnoEX+YmsAMvqt75ooQrqSJKqDFbKJg29bld6s1baUDMJOCnz7hknG3
 SXZSXDn3fRm6WomIWPf2F2+kbsnE7+xJH54U3tbRrxm41w3MzQKZUCmvo A==;
X-IronPort-AV: E=Sophos;i="5.88,339,1635199200"; d="scan'208";a="21868422"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 03 Feb 2022 09:01:59 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Thu, 03 Feb 2022 09:01:59 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Thu, 03 Feb 2022 09:01:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1643875319; x=1675411319;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pjS6RspszbEFEaiI25blgZRzdp2Q96jSu7lNDEq/gsU=;
 b=FnNHNeTuIS7KF66iSmgoxPMf4QOM3HwMXG65VA4h7rRmNLF3yAevw15B
 Kfueuz4+hNfsML1y0aGW5Mit5ZStIZ/1byeIRk4O2O37p/tXx5hrbkvUN
 ZFUWAbmlHZSTNORc4syIwNC28xWlgwaakiub/C6r+xkfcEeG4V79dJYUP
 cyPtQ2CKZIKxhmKqTqwMplBWdS0QiA17aMw0ztkXjMOc49VGcxhGpeuI3
 I5NvBlmQl3xELJVkn3CLmBPzfsu/meCGM3SngFpOtjAFtgz1UsEaPZbhk
 NAQjnOMuNdBhXULYISxh4tcZwPl+d3vOFnsR9KORUrL3ZPZl9aMWk9Ftu g==;
X-IronPort-AV: E=Sophos;i="5.88,339,1635199200"; d="scan'208";a="21868419"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 03 Feb 2022 09:01:58 +0100
Received: from steina-w.localnet (unknown [10.123.49.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 864E4280065;
 Thu,  3 Feb 2022 09:01:58 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: (EXT) Re: [RFC][PATCH] Revert "drm/panel-simple: drop use of
 data-mapping property"
Date: Thu, 03 Feb 2022 09:01:56 +0100
Message-ID: <3046941.irdbgypaU6@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <YfsXt1lU6l9cSctX@pendragon.ideasonboard.com>
References: <20220201110717.3585-1-cniedermaier@dh-electronics.com>
 <YfsXt1lU6l9cSctX@pendragon.ideasonboard.com>
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
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Marek Vasut <marex@denx.de>, David Airlie <airlied@linux.ie>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

Am Donnerstag, 3. Februar 2022, 00:45:59 CET schrieb Laurent Pinchart:
> [...]
> You're right that there's an issue, but a revert isn't the right option.
> The commit you're reverting never made it in a stable release, because
> it was deemed to not be a good enough option.
> 
> First of all, any attempt to fix this should include an update to the DT
> binding. Second, as this is about DPI panels, the LVDS option should be
> dropped. Finally, I've shared some initial thoughts in [1], maybe you
> can reply to that e-mail to continue the discussion there ?
> 
> https://lore.kernel.org/all/20200303185531.GJ11333@pendragon.ideasonboard.co
> m/

At first I thought, this is a different issue than the one I currently have, 
but after reading this post, I think it's somewhat related.

> If a panel expects RGB888 and receives RGB666 with the two LSBs of each
> component hardwired to GND on the PCB, should DT report RGB888 or RGB666
> on the panel side ? I'm tempted by the former, and specifying the latter
> on the transmitting side.

My situation is the other way around. My panel (cdtech,s070swv29hg-dc44) has a 
MEDIA_BUS_FMT_RGB666_1X18 bus format (see panel-simple.c). Unfortunately for 
one mainboard the connection is like that:

i.MX -- Panel  (Blue and green is identical)
R7   --  R5
R6   --  R4
...
R2   --  R0
R1  dont care
R0  dont care

So the 8 bpc (imx) and 6 bps (panel) are MSB aligned. The 2 LSB are completely 
ignored.
The fast hacked fix is to use an additional panel description with bus format 
set to MEDIA_BUS_FMT_RGB888_1X24, keeping everything else the same. But that 
is cumbersome.
IMHO a straight forward solution is to use a, yet to be written, simple bridge 
which just converts the bus format transparently, assuming the electrical 
connection is actually correct.
This way the panel can set the native bus format, regardless of actual 
connections.
Christoph's problem should disappear as well if going that way, as the bus 
format is set for the <imx> -> <bridge> connection.
Nevertheless the panel bus format should be available in the end.

Regards,
Alexander



