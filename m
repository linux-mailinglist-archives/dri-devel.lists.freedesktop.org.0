Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7E4736B6B
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 13:53:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4729C10E183;
	Tue, 20 Jun 2023 11:53:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F97210E183
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 11:52:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 41492611FE;
 Tue, 20 Jun 2023 11:52:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75F77C433C0;
 Tue, 20 Jun 2023 11:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687261977;
 bh=6oQE1zx96TjAgwGDThXBWP2xalKhzh5AZUc/ll0gfVE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=UL/tn1/iL0SE+z0HNifywK0E7QxNfUnOoZT4sCx13aXG7+gYV9SW9TjXOoiza4xab
 kl0pxCJMwU5SyW1ivvBOYCDxMJ4+DVbbDj+qP5vW2eaQKyUjBOLCmAtDLgfDd5zmpV
 +blgL9bED33FX7QDKO/92kypWow0hDf7IcnB1AzdM8aWZiyEbuyo7N3Xq9SLOj9uTY
 UOhQ84T/aspwxvSiQGO3xVzjCZ60GaXjnAcKcVgqXDQlZUDwyqG3Ob3nGr3HRNNwDS
 M58i15cyuWLinzNlDaYzrr//IQEGWv3htPZPAf2ziUSlWv3R5rFPMWCv+7cgK5yttX
 85UbqLqgsJk2w==
Date: Tue, 20 Jun 2023 06:52:55 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sui Jingfeng <15330273260@189.cn>
Subject: Re: [PATCH v2] PCI: Add dummy implement for pci_clear_master()
 function
Message-ID: <20230620115255.GA43247@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230620110600.GA40675@bhelgaas>
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
Cc: kernel test robot <lkp@intel.com>, Li Yi <liyi@loongson.cn>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jesse Barnes <jbarnes@virtuousgeek.org>, loongson-kernel@lists.loongnix.cn,
 Ben Hutchings <bhutchings@solarflare.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Matthew Wilcox <willy@infradead.org>, linux-pci@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 20, 2023 at 06:06:00AM -0500, Bjorn Helgaas wrote:
> On Tue, Jun 20, 2023 at 12:04:40PM +0800, Sui Jingfeng wrote:
> > Where is the formal(unstream) PCI git branch where we could see the latest
> > patch ?
> 
> Here's the "misc" branch: https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/log/?h=misc
> 
> And here's the "next" branch that will be merged for v6.5, which
> includes "misc" and other things: https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/log/?h=next

I forgot to mention: in case you need to find other git branches, most
subsystems list this in the MAINTAINERS file, e.g.,

  PCI SUBSYSTEM
  ...
  T:      git git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git

