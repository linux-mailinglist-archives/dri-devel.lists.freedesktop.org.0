Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41ABC75110A
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 21:14:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAF3910E5C6;
	Wed, 12 Jul 2023 19:14:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 343DC10E5CD
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 19:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jxqXvAC8am2xBAdjIuW5z+SIHl/eAGt+oRSNUuYSdIY=; b=fPGmAOKDFs89A6q7RZSt8JMcVL
 I8YH61ODZosFPTSfjr+sA984ucZ2opP9VlFwKzcwAFj6xz2aYo7kYKWO0XfUg0+JhFBrZR6vQ/1AA
 8moRr3ru5pahWMred1L8Ldb9EL/LIDEoW/RFJgFgy71VHHF4D62TcwDUR77+QZcQNhZyZ9iRdxWcO
 EVqDxr0MOYMv8LCOc5FVCCNjkDbT5TLY4r6KLCXk81GHiW7rrg7fM2ODF7QEUobwNEdkjCIiVO6lA
 /n+qb2j6FDLKYBSXkUVago8CsJzUmhcFC0TG0uDNvsPZDu2GeBUY38Z4cZhEpwp6seC/AHJfPMn//
 NZxG2N9Q==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38882)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1qJfHi-0004NM-3C;
 Wed, 12 Jul 2023 20:13:59 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1qJfHh-0005Kc-Qs; Wed, 12 Jul 2023 20:13:57 +0100
Date: Wed, 12 Jul 2023 20:13:57 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH RFC v1 04/52] drm/armada: Use struct drm_crtc::drm_dev
 instead of struct drm_crtc::dev
Message-ID: <ZK77dVQ3U+en6sza@shell.armlinux.org.uk>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
 <20230712094702.1770121-5-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230712094702.1770121-5-u.kleine-koenig@pengutronix.de>
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 12, 2023 at 11:46:14AM +0200, Uwe Kleine-König wrote:
> Prepare dropping the alias "dev" for struct drm_crtc::drm_dev. "drm_dev"
> is the better name as "dev" is usually a struct device pointer.
> 
> No semantic changes.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
