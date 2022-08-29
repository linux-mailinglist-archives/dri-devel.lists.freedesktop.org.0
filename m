Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E355A52EB
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 19:15:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1A4C10E8B6;
	Mon, 29 Aug 2022 17:15:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D40DA10E8AD
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 17:15:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 07A64B8119C;
 Mon, 29 Aug 2022 17:15:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D368C433C1;
 Mon, 29 Aug 2022 17:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661793310;
 bh=T8yf6DaEI9h1ttbcLiN25zYNkViUziozFlJTNfTaQ84=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=F/1aeNLwEv4qAotml3dc5zTQUgO8luoYVvNXF1SqiIbnqwTjWmfcK916XL88wtzxV
 CkA68pVWNi2J2NCnuMCpJDxJW1cSrbybFXqRmZRU6+OEb/WGNK3PNKsVqCasyHehRN
 b8HRY5OM5p0m1G2IN5ye0ZBuqNJjLDAR9tvkKqQju9J8qhfoN46LJ8L1Th+9r+DSPD
 7Z+vhX3gf+pytuNwomMGD0Hlkk5E+98MojqTSW0mxSQuqexAwidyvr3Nj/UUy3UpK/
 36a6Pe6oT9OqI6gMEJWbdWurDGhU5OAcwdSKn901h4id6ZSKRB/CXhjqS5YNxPpOAg
 yV8L9pSj3QQRw==
Date: Mon, 29 Aug 2022 12:15:08 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v3 1/3] PCI: Move
 PCI_VENDOR_ID_MICROSOFT/PCI_DEVICE_ID_HYPERV_VIDEO definitions to pci_ids.h
Message-ID: <20220829171508.GA8481@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220827130345.1320254-2-vkuznets@redhat.com>
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
Cc: linux-hyperv@vger.kernel.org, Stephen Hemminger <sthemmin@microsoft.com>,
 linux-pci@vger.kernel.org, Haiyang Zhang <haiyangz@microsoft.com>,
 Dexuan Cui <decui@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Deepak Rawat <drawat.floss@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Michael Kelley <mikelley@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Aug 27, 2022 at 03:03:43PM +0200, Vitaly Kuznetsov wrote:
> There are already three places in kernel which define PCI_VENDOR_ID_MICROSOFT
> and two for PCI_DEVICE_ID_HYPERV_VIDEO and there's a need to use these
> from core Vmbus code. Move the defines where they belong.

It's a minor annoyance that the above is 81 characters long when "git
log" adds its 4-character indent, so it wraps in a default terminal.

It'd be nice if we could settle on a conventional spelling of "Vmbus",
too.  "Vmbus" looks to be in the minority:

  $ git grep Vmbus | wc -l; git grep VMbus | wc -l; git grep VMBus | wc -l
  4
  82
  62

FWIW, one published microsoft.com doc uses "VMBus":
https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/reference/hyper-v-architecture
