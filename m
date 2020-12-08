Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CD42D3D78
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 09:32:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94A9C6E811;
	Wed,  9 Dec 2020 08:32:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F766E92B
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 11:48:05 +0000 (UTC)
IronPort-SDR: zXP4zALrdYVUd5z24impV0Ds8yNO648rTdrd1ccrFv0VyczxS9kxH6ae/+3gOpM5dIceXHnZJs
 BAwKNuiNIVxA==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="174021258"
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; d="scan'208";a="174021258"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 03:48:05 -0800
IronPort-SDR: +mYAsGNwLPzSACc9S8+36/64d/OoImY/y1/fHBX6dA6McsnXEeAXnCQkDcHxOw34xTe6V8DnCD
 34BlhhgZ3X4Q==
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; d="scan'208";a="363605727"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 03:48:02 -0800
Received: by lahna (sSMTP sendmail emulation); Tue, 08 Dec 2020 13:47:59 +0200
Date: Tue, 8 Dec 2020 13:47:59 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the drm tree with the pci tree
Message-ID: <20201208114759.GA5246@lahna.fi.intel.com>
References: <20201208132632.7c3a6a41@canb.auug.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201208132632.7c3a6a41@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Wed, 09 Dec 2020 08:32:01 +0000
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
Cc: Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Qinglang Miao <miaoqinglang@huawei.com>, Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Dec 08, 2020 at 01:27:54PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the drm tree got a conflict in:
> 
>   drivers/gpu/vga/vga_switcheroo.c
> 
> between commit:
> 
>   99efde6c9bb7 ("PCI/PM: Rename pci_wakeup_bus() to pci_resume_bus()")
> 
> from the pci tree and commit:
> 
>   9572e6693cd7 ("vga_switcheroo: simplify the return expression of vga_switcheroo_runtime_resume")
> 
> from the drm tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks for the fix Stephen! Looks correct to me.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
