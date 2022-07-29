Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D685850AB
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 15:17:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D9BE10E57D;
	Fri, 29 Jul 2022 13:17:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 381 seconds by postgrey-1.36 at gabe;
 Fri, 29 Jul 2022 13:17:17 UTC
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C0010E57D
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 13:17:17 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LvSZ12Mrfz4xG8;
 Fri, 29 Jul 2022 23:10:49 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: deller@gmx.de, mrochs@linux.ibm.com, Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, ukrishn@linux.ibm.com,
 manoj@linux.ibm.com, tzimmermann@suse.de, Nicholas Piggin <npiggin@gmail.com>,
 martin.petersen@oracle.com, jejb@linux.ibm.com
In-Reply-To: <f75b383673663e27f6b57e50b4abfb9fe3780b00.1657264228.git.christophe.leroy@csgroup.eu>
References: <f75b383673663e27f6b57e50b4abfb9fe3780b00.1657264228.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v3 1/4] video: fbdev: offb: Include missing
 linux/platform_device.h
Message-Id: <165909976850.253830.18083403914079325529.b4-ty@ellerman.id.au>
Date: Fri, 29 Jul 2022 23:02:48 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-scsi@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 8 Jul 2022 09:11:05 +0200, Christophe Leroy wrote:
> A lot of drivers were getting platform and of headers
> indirectly via headers like asm/pci.h or asm/prom.h
> 
> Most of them were fixed during 5.19 cycle but a newissue was
> introduced by commit 52b1b46c39ae ("of: Create platform devices
> for OF framebuffers")
> 
> [...]

Applied to powerpc/next.

[1/4] video: fbdev: offb: Include missing linux/platform_device.h
      https://git.kernel.org/powerpc/c/ebef8abc963b9e537c0a0d619dd8faf1b8f2b183
[2/4] scsi: cxlflash: Include missing linux/irqdomain.h
      https://git.kernel.org/powerpc/c/61657dcd528b75cd196adaf56890124c13953c8d
[3/4] powerpc: Remove asm/prom.h from asm/mpc52xx.h and asm/pci.h
      https://git.kernel.org/powerpc/c/4d5c5bad51935482437528f7fa4dffdcb3330d8b
[4/4] powerpc: Finally remove unnecessary headers from asm/prom.h
      https://git.kernel.org/powerpc/c/36afe68714d45edf34430d28e3dc787425ad8b22

cheers
