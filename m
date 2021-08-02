Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 959BF3DD43C
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 12:46:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A49F86E584;
	Mon,  2 Aug 2021 10:46:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 671 seconds by postgrey-1.36 at gabe;
 Mon, 02 Aug 2021 10:46:11 UTC
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 368126E584;
 Mon,  2 Aug 2021 10:46:11 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 76F8F379; Mon,  2 Aug 2021 12:46:08 +0200 (CEST)
Date: Mon, 2 Aug 2021 12:46:06 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 iommu@lists.linux-foundation.org, kvm@vger.kernel.org,
 linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-graphics-maintainer@vmware.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kexec@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Brijesh Singh <brijesh.singh@amd.com>, Andi Kleen <ak@linux.intel.com>,
 Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Tianyu Lan <Tianyu.Lan@microsoft.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>
Subject: Re: [PATCH 09/11] x86/sev: Remove the now unused
 mem_encrypt_active() function
Message-ID: <YQfM7hBM4wabeqeF@8bytes.org>
References: <cover.1627424773.git.thomas.lendacky@amd.com>
 <2e6fb78b7b18437f0e754513bf6312dcba3d1565.1627424774.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e6fb78b7b18437f0e754513bf6312dcba3d1565.1627424774.git.thomas.lendacky@amd.com>
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

On Tue, Jul 27, 2021 at 05:26:12PM -0500, Tom Lendacky wrote:
> The mem_encrypt_active() function has been replaced by prot_guest_has(),
> so remove the implementation.
> 
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>

Reviewed-by: Joerg Roedel <jroedel@suse.de>
