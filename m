Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DBE736A4F
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 13:06:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4ADE10E2C1;
	Tue, 20 Jun 2023 11:06:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDAD110E2BF
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 11:06:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E8D28611DF;
 Tue, 20 Jun 2023 11:06:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E580C433C8;
 Tue, 20 Jun 2023 11:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687259162;
 bh=c6Cl8H2kiIKibjwKn4E7jfaCJ/NmKegmDURyS5dIOTE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=nZp2C+ROS21lgm1J0hWgNn22wS1cKofTGZJpkaTJGIfKShWnn349LHgIXFxUTDBcq
 bB1m5FxH7KO806pqJyQdruY0+nToITH9MjgFa8Pw6F0GNIKVLcbzr6RDynGjkORvRR
 u13jrbNsCuu1bRIZscvgL5JiAmgkCftS4n4cQiHqU8N+LxCGyn2QETfNTtOzQ+JsQs
 swAFE96KytVxfZ+Gny2Jjpt+ZWPdVg3qhWI1R1M7atNkMWale9fqZOdeXpGVnosxp/
 7R3u284lSngsoZK0QTWELwnFeKF7rF2efMPwnOHkyHCJ1tYkqdTl1hVMuRDFGHarkA
 BFw9TW8mvveRA==
Date: Tue, 20 Jun 2023 06:06:00 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sui Jingfeng <15330273260@189.cn>
Subject: Re: [PATCH v2] PCI: Add dummy implement for pci_clear_master()
 function
Message-ID: <20230620110600.GA40675@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <459cf0c7-4111-6e76-8124-da1a10666f50@189.cn>
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

On Tue, Jun 20, 2023 at 12:04:40PM +0800, Sui Jingfeng wrote:
> Where is the formal(unstream) PCI git branch where we could see the latest
> patch ?

Here's the "misc" branch: https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/log/?h=misc

And here's the "next" branch that will be merged for v6.5, which
includes "misc" and other things: https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/log/?h=next
