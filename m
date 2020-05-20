Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EEF1DE049
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 08:56:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C75F6E3CB;
	Fri, 22 May 2020 06:56:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 417 seconds by postgrey-1.36 at gabe;
 Wed, 20 May 2020 11:06:51 UTC
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BBE96E5CF
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 11:06:51 +0000 (UTC)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49RqX81vz0z9sT3; Wed, 20 May 2020 20:59:52 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Paul Mackerras <paulus@samba.org>
In-Reply-To: <a5945463f86c984151962a475a3ee56a2893e85d.1587407777.git.christophe.leroy@c-s.fr>
References: <a5945463f86c984151962a475a3ee56a2893e85d.1587407777.git.christophe.leroy@c-s.fr>
Subject: Re: [PATCH 1/5] drivers/powerpc: Replace _ALIGN_UP() by ALIGN()
Message-Id: <158997212813.943180.8258248178215435632.b4-ty@ellerman.id.au>
Date: Wed, 20 May 2020 20:59:52 +1000 (AEST)
X-Mailman-Approved-At: Fri, 22 May 2020 06:56:07 +0000
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 20 Apr 2020 18:36:34 +0000 (UTC), Christophe Leroy wrote:
> _ALIGN_UP() is specific to powerpc
> ALIGN() is generic and does the same
> 
> Replace _ALIGN_UP() by ALIGN()

Applied to powerpc/next.

[1/5] drivers/powerpc: Replace _ALIGN_UP() by ALIGN()
      https://git.kernel.org/powerpc/c/7bfc3c84cbf5167d943cff9b3d2619dab0b7894c
[2/5] powerpc: Replace _ALIGN_DOWN() by ALIGN_DOWN()
      https://git.kernel.org/powerpc/c/e96d904ede6756641563d27daa746875b478a6c8
[3/5] powerpc: Replace _ALIGN_UP() by ALIGN()
      https://git.kernel.org/powerpc/c/b711531641038f3ff3723914f3d5ba79848d347e
[4/5] powerpc: Replace _ALIGN() by ALIGN()
      https://git.kernel.org/powerpc/c/d3f3d3bf76cfb04e73436a15e3987d3573e7523a
[5/5] powerpc: Remove _ALIGN_UP(), _ALIGN_DOWN() and _ALIGN()
      https://git.kernel.org/powerpc/c/4cdb2da654033d76e1b1cb4ac427d9193dce816b

cheers
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
