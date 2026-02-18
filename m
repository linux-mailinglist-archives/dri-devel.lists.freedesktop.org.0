Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGGjCBb8lWmIXwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 18:51:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4961586BB
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 18:51:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65DE310E23E;
	Wed, 18 Feb 2026 17:51:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BXCEp44c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D85E10E23E;
 Wed, 18 Feb 2026 17:51:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 47F2A6132F;
 Wed, 18 Feb 2026 17:51:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4EADC116D0;
 Wed, 18 Feb 2026 17:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771437073;
 bh=0YmJYIJK8IbVjLYR87vbyuCC4oz/uEx3rnHi2pTjRkQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=BXCEp44ceVzXO8E/xf9Y4ghbbmpotMa9q9wk+hYqWIRpEBrtf7XgfPLoknbhXRNoR
 45D3LYcL7ee52HSHQHnnEZySwvqXTUUkQt7eUwxdpezaSpWb97I56/zfG6zwCv5A+P
 yTTlfzo57llD7jCU91RYVVn9pAkQUWNmBenjraLOe8B2okbPDKMZog/aV5ijMujJ0T
 Wb6M9+y9elgqpM9MHYMOTOXo9LFp8JwzscckVLkIYacOV+N5VM4iaJd8dJTzRwm69t
 j787WinJF+ZGXQ4dVlqjYRRuyEqQIPHQ3a+EzSnV1rrxte8KUaDJlgmYxhwm8ag4Rn
 RPd/YkrjgFrNQ==
Date: Wed, 18 Feb 2026 11:51:11 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Simon Richter <Simon.Richter@hogyros.de>
Cc: linux-pci@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 0/5] Bridges without VGA support
Message-ID: <20260218175111.GA3434382@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260218134633.461181-1-Simon.Richter@hogyros.de>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 9C4961586BB
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 10:46:28PM +0900, Simon Richter wrote:
> Hi,
> 
> v2 fixes the formatting errors.

I'm not sure if you also fixed the kernel test robot warnings
(https://lore.kernel.org/all/202602180912.N7IZbIal-lkp@intel.com,
https://lore.kernel.org/all/202602181332.NDKD0g1P-lkp@intel.com).

If not, please run "git log --oneline" on these files and match the
historical style (capitalization, "()" after function names, etc).
Also applies to some commit logs.

I assume this series fixes some problem where VGA isn't enabled
correctly in some topology?  It wasn't obvious to me from the commit
logs, but it would be good to include that if so.

> This allows bridges to refuse forwarding VGA, and reports this upwards as an
> error, because we cannot set up valid decoding for the requested device in this
> case.
> 
> I think it should be fine to leave VGA forwarding enabled on lower bridges if a
> bridge closer to the root refused to enable forwarding, because no accesses can
> reach there anyway.
> 
>    Simon
> 
> Simon Richter (5):
>   vgaarb: pass vga_get errors to userspace
>   vgaarb: pass errors from pci_set_vga_state up
>   vgaarb: mark vga_get family as __must_check
>   pci: check if VGA decoding was really activated
>   pci: mark return value of pci_set_vga_state as __must_check
> 
>  drivers/pci/pci.c      |  6 ++++++
>  drivers/pci/vgaarb.c   | 20 +++++++++++++++++---
>  include/linux/pci.h    |  4 ++--
>  include/linux/vgaarb.h | 15 ++++++++-------
>  4 files changed, 33 insertions(+), 12 deletions(-)
> 
> -- 
> 2.47.3
> 
