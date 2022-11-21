Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 802EE6328EF
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 17:03:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF39E10E2DE;
	Mon, 21 Nov 2022 16:03:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 545 seconds by postgrey-1.36 at gabe;
 Mon, 21 Nov 2022 16:03:28 UTC
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A168A10E2DE
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 16:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=13bL6LNTHjc49hw1t8dd+cr8coUyb0jg/mTexC5rZYA=; b=LcYJEoDuLEA+iEp2XldIp0x6sO
 cDK4ViwOPzWS0atHVRmRJIYugx1i71XJQTD3UD6xEv7YKU5H3+68xoDQ4ydlenqRUWLXsq6MVzbMq
 NHk2YvgQz5znt9jedC2wmP7fhgee9cuI9YoHT/YdDUD35fFshRGEPYwry6YYF1WVlkWsSxyWo5lXL
 NusRF5QwzT1c1Www6dY/rE13Xz82CXwMu/oOzPOw5tPtkZt1oXMNNJrFPcT7zOe3rhm03NiHUnORn
 i/fFa/63F7+6TSN/nO9vZ4omDuV0E7raom7v8GBZhTi5ktCX3Qpg0bSvgMtpaBRzHsk/JpPrwYWMB
 ME3Xf2xg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35360)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1ox97j-0000H6-L8; Mon, 21 Nov 2022 15:54:19 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1ox97h-0002UN-VG; Mon, 21 Nov 2022 15:54:17 +0000
Date: Mon, 21 Nov 2022 15:54:17 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH resend] drm/armada: Fix off-by-one error in
 armada_overlay_get_property()
Message-ID: <Y3ufKdApJGj6f97b@shell.armlinux.org.uk>
References: <788e97ac9b2aeee1941f274bf7b279b68c7592b6.1669045360.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <788e97ac9b2aeee1941f274bf7b279b68c7592b6.1669045360.git.geert+renesas@glider.be>
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 21, 2022 at 04:43:14PM +0100, Geert Uytterhoeven wrote:
> As ffs() returns one more than the index of the first bit set (zero
> means no bits set), the color key mode value is shifted one position too
> much.
> 
> Fix this by using FIELD_GET() instead.

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
