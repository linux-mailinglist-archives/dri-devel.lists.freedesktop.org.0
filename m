Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE84803069
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 11:36:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB2F10E1AD;
	Mon,  4 Dec 2023 10:36:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3003D10E1AD
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 10:36:34 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id AB39A40E01AD; 
 Mon,  4 Dec 2023 10:36:29 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Ha1ktEKlv6FG; Mon,  4 Dec 2023 10:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1701686187; bh=mCwZaJ7dRtJDc4MiLyk7lSNLxiPR+SKMxqLPWCK5zWo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T99h48BruYWkziFWjTMxh6+yOj/D/PLvAsIQocbREPZWE4Hx2hIDZgnzwBFwrks9/
 7Q/Q9uorRsVIlF7kRZ0iaXQiruCkuD7qUhNyu+2P3+igKQSqtgIX2kiZVePc7Ir2Dq
 eaglLRWyx6deaL5iEMoWNx93+jMVVPqQm+JKTJ8AshWgVsmk6xeSvEYHdVqRle/xxP
 wlWMZz755WiOACjxcKyYFCYIUPG5pfxenGwLiMoevG0r821EqyH9MBvv/8sYtYe6PQ
 WirQexeDxx9XXJJvUDLw7EeCHjFGH23CmQk63AvV5krsQkZSYjsOvrTpC83rOccvl2
 s5tx1GXFDPmOTevhe9tFIhzQB7Sqa0vkLiSJHk76/Nq2HGDlRL1QtH/2F5G6Rfke4q
 BBRZ3IkdKEieqccGNeNydIqaPnVFw0aDph+pFXDogcI1lU5tswxrnrdVryRqg9fWen
 ZKheo1BnCL2OSgKIYsUSE1qZak2hAeY9dkMb/N73MRJytAk9qodHP10hWpOIMa6pg3
 JhWMcNDvnaL1QcWbtvfuC2wlV9T5hKLnBALmsoLOG+eBCPJB4y0GxeRugjSSeljcX4
 jJphAcp8iPF11oG2t2uOea/bjIWXCxxRRSyOyvl3/NS8vZrcEU12ovkYS3gOpRjX1Y
 gw7pAqx8yTmT2+YDPh8ywMQY=
Received: from zn.tnic (pd95304da.dip0.t-ipconnect.de [217.83.4.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 08F5E40E014B;
 Mon,  4 Dec 2023 10:36:00 +0000 (UTC)
Date: Mon, 4 Dec 2023 11:35:59 +0100
From: Borislav Petkov <bp@alien8.de>
To: Alexey Makhalov <amakhalov@vmware.com>
Subject: Re: [PATCH v2 2/6] x86/vmware: Introduce vmware_hypercall API
Message-ID: <20231204103559.GAZW2rj9obaooeqxWA@fat_crate.local>
References: <20231122233058.185601-8-amakhalov@vmware.com>
 <20231201232452.220355-1-amakhalov@vmware.com>
 <20231201232452.220355-3-amakhalov@vmware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231201232452.220355-3-amakhalov@vmware.com>
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
Cc: pv-drivers@vmware.com, dri-devel@lists.freedesktop.org, namit@vmware.com,
 hpa@zytor.com, timothym@vmware.com, dave.hansen@linux.intel.co, x86@kernel.org,
 mingo@redhat.com, linux-graphics-maintainer@vmware.com,
 linux-input@vger.kernel.org, tzimmermann@suse.de, richardcochran@gmail.com,
 virtualization@lists.linux.dev, mripard@kernel.org, akaher@vmware.com,
 jsipek@vmware.com, tglx@linutronix.de, netdev@vger.kernel.org,
 dmitry.torokhov@gmail.com, linux-kernel@vger.kernel.org, horms@kernel.org,
 bp@alien8.d, zackr@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 01, 2023 at 03:24:48PM -0800, Alexey Makhalov wrote:
> Introducing vmware_hypercall family of functions as a common
> implementation to be used by the VMware guest code and virtual
> device drivers in architecture independent manner.
> 
> By analogy with KVM hypercall API, vmware_hypercallX and
> vmware_hypercall_hb_{out,in} set of functions was added to
> achieve that. Architecture specific implementation should be
> hidden inside.

Pls read section "2) Describe your changes" in
Documentation/process/submitting-patches.rst for more details on how to
formulate your commit messages.

Also, see section "Changelog" in Documentation/process/maintainer-tip.rst

More specifically:

"Describe your changes in imperative mood, e.g. "make xyzzy do frotz"
instead of "[This patch] makes xyzzy do frotz" or "[I] changed xyzzy
to do frotz", as if you are giving orders to the codebase to change
its behaviour."

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
