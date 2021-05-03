Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2629371467
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 13:38:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 969FA6E0A6;
	Mon,  3 May 2021 11:38:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E2246E0A6;
 Mon,  3 May 2021 11:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com; 
 s=default;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lE1O1BdtfF2Xps+0XJY/PbqTWk8FyHsOVh9J9xMViSA=; b=n5u5iNIUZjqePoXVAGWKRfgBMQ
 FxW54FRhvLn51yAThISook7ivgL6Hd4yZ5BCSjiDxOVOI9u7BNzInA/wxMxUQ+kOpTlJKOOGTe6IL
 lVoJvao2esDr9KOKcegoNrPm5lkRkKdWDlC/eoP6DdkCLxynpLBmsz6MaFn6tdoINMGF0rX0VLAkx
 TkFdY3JiHumQQ1+YvHTZbnfR4OLMzqyzIEQf/BFg3T5jp23YYDZLmH1pVHzgYiE3ZId8NpnxCubmt
 uaxtk6CqTx7ZyAgL2AFtISJM47fGqZW3w6n3dzh/aa21tETuoW3Nd7HwUUk8EroUVoI8hYlJLKRs6
 OtNFStMw==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:40500
 helo=localhost.localdomain)
 by cpanel.siel.si with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <primoz.fiser@norik.com>)
 id 1ldWtp-002rjw-3X; Mon, 03 May 2021 13:38:05 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: l.stach@pengutronix.de
Subject: Re: [PATCH] drm/etnaviv: rework linear window offset calculation
Date: Mon,  3 May 2021 13:38:08 +0200
Message-Id: <20210503113808.3517329-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210503102422.1384502-1-l.stach@pengutronix.de>
References: <20210503102422.1384502-1-l.stach@pengutronix.de>
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id:
 primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de, primoz.fiser@norik.com, kernel@pengutronix.de,
 linux+etnaviv@armlinux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas,

we tested your patch on PHYTEC i.MX6Q phyCORE with 1GiB and 2GiB RAM variants.

I can happily report that the previous issues with "command buffer outside
valid memory window" are gone when using kernel's cmdline parameter cma=256M
for example!

If you want you can add:

Tested-by: Primoz Fiser <primoz.fiser@norik.com>

Otherwise, thank you for prompt response and implemented fix.

BR,
Primoz
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
