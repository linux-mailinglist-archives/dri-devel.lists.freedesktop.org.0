Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB234182FB
	for <lists+dri-devel@lfdr.de>; Sat, 25 Sep 2021 16:58:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D1C96E43F;
	Sat, 25 Sep 2021 14:58:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1931 seconds by postgrey-1.36 at gabe;
 Sat, 25 Sep 2021 14:58:16 UTC
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 819646E43F
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Sep 2021 14:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=GIoIFS8oysAVK606odyYm+NnfqhL/RtH/bn53TX3cfE=; b=HjJrUTCk9nfyUdYrqlQER55LNl
 bK2GVwXRCiVF31kumJrOs6gqHBB9/PeEy7NrtM+93p77z4KxBGYzcZd/+ztTlel9UkRm55pZnVzod
 d1irtnX0sGeuaFuLvHsE/w3/uvC0CvWl/pLbFP+c5opalejgRY1E0Vk3jnwAMDD0NweU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1mU8cR-008DSx-Pv; Sat, 25 Sep 2021 16:25:35 +0200
Date: Sat, 25 Sep 2021 16:25:35 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Justin Chen <justinpopo6@gmail.com>
Cc: netdev@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Doug Berger <opendmb@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
 Michael Chan <michael.chan@broadcom.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>
Subject: Re: [PATCH net-next 0/5] brcm ASP 2.0 Ethernet controller
Message-ID: <YU8xX0fUWAoEnmRR@lunn.ch>
References: <1632519891-26510-1-git-send-email-justinpopo6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1632519891-26510-1-git-send-email-justinpopo6@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 24, 2021 at 02:44:46PM -0700, Justin Chen wrote:
> This patch set adds support for Broadcom's ASP 2.0 Ethernet controller.


Hi Justin

Does the hardware support L2 switching between the two ports? I'm just
wondering if later this is going to be modified into a switchdev
driver?

	Andrew
