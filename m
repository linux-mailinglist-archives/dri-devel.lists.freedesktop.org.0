Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DF2A31F46
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 07:43:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E4E10E147;
	Wed, 12 Feb 2025 06:42:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=3xo.fr header.i=@3xo.fr header.b="hcWU979c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 457 seconds by postgrey-1.36 at gabe;
 Tue, 11 Feb 2025 18:23:36 UTC
Received: from mail.3xo.fr (mail.3xo.fr [212.129.21.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACDA110E719
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 18:23:36 +0000 (UTC)
Received: from localhost (mail.3xo.fr [212.129.21.66])
 by mail.3xo.fr (Postfix) with ESMTP id B7B0E8D;
 Tue, 11 Feb 2025 19:15:57 +0100 (CET)
X-Virus-Scanned: Debian amavis at nxo2.3xo.fr
Received: from mail.3xo.fr ([212.129.21.66])
 by localhost (mail.3xo.fr [212.129.21.66]) (amavis, port 10024) with ESMTP
 id oJmMZTrld9st; Tue, 11 Feb 2025 19:15:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.3xo.fr 647B78C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=3xo.fr; s=3xo;
 t=1739297754; bh=+qshw3+2v3zW2//JX1YoOkhvtCv2h0G8CFD3j8bGLYc=;
 h=Date:From:To:Cc:Subject:From;
 b=hcWU979ciqORpvEaguFwYuxh7Ec4k85M4nOffrvxNwU71J58GUmX97D+4N4l7iFOM
 5KD4HMZ9Apku5dVYQryxY7DXAZESObz5adpsf9r90vpqY2E7WZxFbkjAyRHEaOtEv4
 vDOqJ9HF9ShCETW3CLM40vuypfIRw3+SsF3IQiF7OQ3Fh6ptirAN7bYDhsP5giajuz
 sZVFHhgaVAYGFjn+N7wTz2cKrGFM/YfTld1d59oHu9GyaEmztz0GhoG5tgiWPfU4lJ
 1cGytTlHmuv3Aw7ZXl7fbfczRdhzxMXOr2Vj+sYj38CvNBoiSa46Dwf4hRMEsSVO+o
 CUaY3GdzBDsyg==
Received: from mail.3xo.fr (mail.3xo.fr [212.129.21.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
 (No client certificate requested)
 by mail.3xo.fr (Postfix) with ESMTPSA id 647B78C;
 Tue, 11 Feb 2025 19:15:54 +0100 (CET)
MIME-Version: 1.0
Date: Tue, 11 Feb 2025 19:15:54 +0100
From: Nicolas Baranger <nicolas.baranger@3xo.fr>
To: dri-devel@lists.freedesktop.org
Cc: Tzimmermann <tzimmermann@suse.de>, airlied@redhat.com
Subject: Include ASPEED ast-drm 1.15.1 video driver in kernel tree
Message-ID: <d507f6268ea3158b5af82b6860ca7b71@3xo.fr>
X-Sender: nicolas.baranger@3xo.fr
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 12 Feb 2025 06:42:53 +0000
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

Dear maintener

For my own usage, I did make work the ASPEED ast-drm 1.15.1 video driver 
on mainline kernel (6.13.0 + 6.13.1).

ASPEED video driver is availiable here: 
https://www.aspeedtech.com/file/support/Linux_DRM_1.15.1_4.tar.gz

But it only work for LTS kernel 
So I modify the DKMS package and I build a new Debian DKMS package with 
the adapted  source. 
My patch can be find here :
https://xba.soartist.net/ast-drm_nba_20250211/nba-dkms/astdiff.patch 
See the README:
https://xba.soartist.net/ast-drm_nba_20250211/nba-dkms/README

Using this new 'ast 1.15.1' driver, performance are amazing compared to 
the 'ast' driver include in kernel tree, specially when using a discrete 
GPU and offloading VULKAN / 3D on it but using AST VGA card as the main 
video card and as the main and only video output (the discrete GPU is 
used only for offloading 3D or for cuda/opencl)


So to make things easier, I include the new 'ast 1.15.1' driver in 
kernel tree as AST_NEW : linux-6.13.1-ast/drivers/gpu/drm/ast_new'
It's working fine as you can see on this video : 
https://xba.soartist.net/ast-drm_nba_20250211/vulcan_nvidia_prime_render_offload_on_ast_vga_card.webm 

I upload all the work I've done here :
https://xba.soartist.net/ast-drm_nba_20250211/

See the global README :
https://xba.soartist.net/ast-drm_nba_20250211/README

and the README in nba-kernel sub-directory :
https://xba.soartist.net/ast-drm_nba_20250211/nba-kernel/README

I'm not a developer so please let me know if I made the things the right 
way and if this new 'ast 1.15.1' driver can be ported to linux-next or 
linux-? ?
If you need more explanations, do not hesitate to contact me, I would be 
happy to help

Kind regards
Nicolas Baranger
