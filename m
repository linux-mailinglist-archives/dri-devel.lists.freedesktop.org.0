Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 512FE6E6DEE
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 23:17:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 533C810E0F5;
	Tue, 18 Apr 2023 21:17:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEFC010E0F5
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 21:17:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 35F0C62E50;
 Tue, 18 Apr 2023 21:17:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CA49C4339B;
 Tue, 18 Apr 2023 21:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681852635;
 bh=NkZbO3v1vt7AI6j7cVF6xRNunCdnbFbTZvCRF8jsgq8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=urpnr/YkVnjIu9iySbQ9lTqnTEQrBcWC8upUe1l5mPT3KJWyc6D800EnYZaVZM8CD
 11YyGIfys29trDDlYBhN+waQP2aRngfkM+sPnAujYbmljKp9khoLZYUnvvE3bfvTkR
 3ZZeWXpDWm7tdVR0kxl0Y9gEx1nNQ4NTQd+I0NXnwzU3Kw2Qz+9vtQVKQnXpQIaQZK
 NNMvP2SPr4UVvxUTCk67K/ucm7h3C77cf0ErtvXWNf1z0TDu5a3ihsSbSVclOMV0Tp
 tAH+lQ0PSxoiiId7vNS50HbtAH2tCyhPBosKNdqpEMyr2b4P/I1BYzb9C5b/027pM3
 JOHn5CY2pIezw==
Date: Tue, 18 Apr 2023 16:17:14 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Patrick McLean <chutzpah@gentoo.org>
Subject: Re: [PATCH 1/2] gpu: Move ASPEED vendor ID definition to pci_ids.h
Message-ID: <20230418211714.GA161849@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230418211403.GA160979@bhelgaas>
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-ide@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Bjorn Helgaas <bhelgaas@google.com>,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 18, 2023 at 04:14:03PM -0500, Bjorn Helgaas wrote:
> Most subject lines for pci_ids.h look like this:
> 
>   PCI: Add ASPEED vendor ID
> 
> On Mon, Apr 17, 2023 at 06:17:19PM -0700, Patrick McLean wrote:
> > Currently the ASPEED PCI vendor ID is defined in drivers/gpu/drm/ast/ast_drv.c,
> > move that to include/linux/pci_ids.h with all the rest of the PCI vendor ID
> > definitions. Rename the definition to follow the format that the other
> > definitions follow.
> > 
> > Signed-off-by: Patrick McLean <chutzpah@gentoo.org>
> 
> Given the subject line and file placement (below) updates,
> 
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>

Oh, at the same time, would you mind rewrapping at least this commit
log so it fits in 75 columns to "git log" doesn't overflow an 80
column terminal?

Bjorn
