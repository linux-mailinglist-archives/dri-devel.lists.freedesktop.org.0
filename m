Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F1C7E9546
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 03:57:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0916B10E02A;
	Mon, 13 Nov 2023 02:57:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 465 seconds by postgrey-1.36 at gabe;
 Mon, 13 Nov 2023 02:57:13 UTC
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD11010E02A
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 02:57:13 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4STDR45zpTz4xWP;
 Mon, 13 Nov 2023 13:49:20 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230922080636.26762-1-tzimmermann@suse.de>
References: <20230922080636.26762-1-tzimmermann@suse.de>
Subject: Re: (subset) [PATCH v5 0/5] ppc, fbdev: Clean up fbdev mmap helper
Message-Id: <169984352204.1887074.16685503842131763450.b4-ty@ellerman.id.au>
Date: Mon, 13 Nov 2023 13:45:22 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 22 Sep 2023 10:04:54 +0200, Thomas Zimmermann wrote:
> Clean up and rename fb_pgprotect() to work without struct file. Then
> refactor the implementation for PowerPC. This change has been discussed
> at [1] in the context of refactoring fbdev's mmap code.
> 
> The first two patches update fbdev and replace fbdev's fb_pgprotect()
> with pgprot_framebuffer() on all architectures. The new helper's stream-
> lined interface enables more refactoring within fbdev's mmap
> implementation.
> 
> [...]

Patches 3-5 applied to powerpc/fixes.

[3/5] arch/powerpc: Remove trailing whitespaces
      https://git.kernel.org/powerpc/c/322948c3198cf80e7c10d953ddad24ebd85757cd
[4/5] arch/powerpc: Remove file parameter from phys_mem_access_prot code
      https://git.kernel.org/powerpc/c/1f92a844c35e483c00bab8a7b7d39c555ee799d8
[5/5] arch/powerpc: Call internal __phys_mem_access_prot() in fbdev code
      https://git.kernel.org/powerpc/c/deebe5f607d7f72f83c41163191ad0c1c4356385

cheers
