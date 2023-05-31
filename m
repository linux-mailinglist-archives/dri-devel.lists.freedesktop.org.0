Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D84718900
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 20:03:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A03B210E1CE;
	Wed, 31 May 2023 18:03:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59A6910E1CE
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 18:03:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9330F632CC;
 Wed, 31 May 2023 18:03:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB05DC433EF;
 Wed, 31 May 2023 18:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685556191;
 bh=tIDB628aG1u5LNS+DtepRZCbZZeOMkE5wqOU6ndfFtw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=M/+/cijXPEcIsDkj0GXChhsDp864Z6rqzEJsIgQLx8m7Knq6GpLoM7r8jRYnwNncq
 uyVaZnLxTGfTLBNWiIDeewnezjTyLIr/u7MyqmzgMm1AuCA9FuNgzw13sjjNs+UAeF
 cqpwR38iwA5fIu5P70TqA8y6y98clPLtXiqsGiQfpscWShj85hRkfpe298cbbQt22D
 2dDhGKlzujhWjRhw6IOLvqLKOc19k5ZnKeILLIcNOhmUqnI4W+C2daEieTpgSV/W/1
 ogLxtimsZZPMnFnKr+vDawqo7JG7MNkJE47qm1a9d2kNgAHMAZyUkNtXzX7CdEfyaS
 jeNlP2k/5eS3A==
Date: Wed, 31 May 2023 13:03:09 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sui Jingfeng <15330273260@189.cn>
Subject: Re: [PATCH v2] PCI: Add dummy implement for pci_clear_master()
 function
Message-ID: <ZHeL3WsalhsIMYwa@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47c5c3ca-b112-9800-a047-10dab4cdef50@189.cn>
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

On Thu, Jun 01, 2023 at 01:44:52AM +0800, Sui Jingfeng wrote:
> Can you receive my email?
> 
> I reply several email to you, but Thunderbird told me that may mail is
> returned.
> 
> Maybe you could read the content at lore.

I do receive your email (at least some; obviously if there are things
I don't receive I wouldn't know).  I read most Linux email via lei [1],
so if it shows up on lore, I should see it.

Bjorn

[1] https://people.kernel.org/monsieuricon/lore-lei-part-1-getting-started
