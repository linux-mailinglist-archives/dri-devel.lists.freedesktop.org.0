Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33303A32F07
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 19:59:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBC9710E127;
	Wed, 12 Feb 2025 18:58:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=3xo.fr header.i=@3xo.fr header.b="AUaFuro2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.3xo.fr (mail.3xo.fr [212.129.21.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F237510E127
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 18:58:57 +0000 (UTC)
Received: from localhost (mail.3xo.fr [212.129.21.66])
 by mail.3xo.fr (Postfix) with ESMTP id F2B9E8D;
 Wed, 12 Feb 2025 19:58:55 +0100 (CET)
X-Virus-Scanned: Debian amavis at nxo2.3xo.fr
Received: from mail.3xo.fr ([212.129.21.66])
 by localhost (mail.3xo.fr [212.129.21.66]) (amavis, port 10024) with ESMTP
 id Wuqj2Y-kLiOt; Wed, 12 Feb 2025 19:58:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.3xo.fr B08D38C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=3xo.fr; s=3xo;
 t=1739386730; bh=GB5Q5dVh6WIWw7tyjYIIkZAzZvIRXGmIq8KJH9bTdEg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AUaFuro2VqAo3RmR3W7fPbFRxB9GQYCq8/EXyd0WckR5rwHBXmtEXkwrmZsHggJVj
 QfARJtC4jAacOj58BbW4Qwz6VHpxYqJ0RPP2RGOYICZyFvvF8I8WhrbsC8nnLh5Uxa
 vsvdwtFV5dewixWw3nUdS9cqT4Rouy08noJFuEcimg96oW9NPqt7lK1nigl6KUJywJ
 FN4n74vGyPa4MDQzw6Xfgi8XhSdiORbfutmYgjK3TlLEiJIpGaUZWDS08HQCLfZHsn
 hn7RccQJ3zRJ2WqqiFXzTS5SsJwbUhJtIaE3pexhvBF7Wbimea/pMiq0RVPGolUmzT
 X3IjXNC5LjZ/A==
Received: from mail.3xo.fr (mail.3xo.fr [212.129.21.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
 (No client certificate requested)
 by mail.3xo.fr (Postfix) with ESMTPSA id B08D38C;
 Wed, 12 Feb 2025 19:58:50 +0100 (CET)
MIME-Version: 1.0
Date: Wed, 12 Feb 2025 19:58:50 +0100
From: Nicolas Baranger <nicolas.baranger@3xo.fr>
To: dri-devel@lists.freedesktop.org
Cc: Tzimmermann <tzimmermann@suse.de>, airlied@redhat.com, Jocelyn Falempe
 <jfalempe@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
Subject: Include ASPEED ast-drm 1.15.1 video driver in kernel tree
In-Reply-To: <d507f6268ea3158b5af82b6860ca7b71@3xo.fr>
References: <d507f6268ea3158b5af82b6860ca7b71@3xo.fr>
Message-ID: <194c4656963debcf074d87e89ab1a829@3xo.fr>
X-Sender: nicolas.baranger@3xo.fr
Content-Type: text/plain; charset=UTF-8;
 format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear maintener

I did include ast-drm driver version 1.15.1 (in replacement of version 
0.1.0) on the new mainline kernel too (6.14.0-rc2) and I issue a new 
dkms patch 

Last DKMS patch had been sucessfully tested on mainline.
And last ast.ko version 1.15.1 included in linux tree had also been 
sucessfully tested 

Online directory is updated with :
- new DKMS patch
- new DKMS srouces
- new DKMS debian package
- new tarball of mainline included ast_new ported in kernel tree
- new kernel debian package (mainline with ast_new)


NB: online directory is here: 
https://xba.soartist.net/ast-drm_nba_20250211/

Please let me know what I should do to see this change in linux-next

Thanks for help

Kind regards
Nicolas Baranger


Le 2025-02-11 19:15, Nicolas Baranger a écrit :

> Dear maintener
> 
> For my own usage, I did make work the ASPEED ast-drm 1.15.1 video 
> driver on mainline kernel (6.13.0 + 6.13.1).
> 
> ASPEED video driver is availiable here:
> https://www.aspeedtech.com/file/support/Linux_DRM_1.15.1_4.tar.gz
> 
> But it only work for LTS kernel
> So I modify the DKMS package and I build a new Debian DKMS package with 
> the adapted  source.
> My patch can be find here :
> https://xba.soartist.net/ast-drm_nba_20250211/nba-dkms/astdiff.patch
> See the README:
> https://xba.soartist.net/ast-drm_nba_20250211/nba-dkms/README
> 
> Using this new 'ast 1.15.1' driver, performance are amazing compared to 
> the 'ast' driver include in kernel tree, specially when using a 
> discrete GPU and offloading VULKAN / 3D on it but using AST VGA card as 
> the main video card and as the main and only video output (the discrete 
> GPU is used only for offloading 3D or for cuda/opencl)
> 
> So to make things easier, I include the new 'ast 1.15.1' driver in 
> kernel tree as AST_NEW : linux-6.13.1-ast/drivers/gpu/drm/ast_new'
> It's working fine as you can see on this video :
> https://xba.soartist.net/ast-drm_nba_20250211/vulcan_nvidia_prime_render_offload_on_ast_vga_card.webm
> 
> I upload all the work I've done here :
> https://xba.soartist.net/ast-drm_nba_20250211/
> 
> See the global README :
> https://xba.soartist.net/ast-drm_nba_20250211/README
> 
> and the README in nba-kernel sub-directory :
> https://xba.soartist.net/ast-drm_nba_20250211/nba-kernel/README
> 
> I'm not a developer so please let me know if I made the things the 
> right way and if this new 'ast 1.15.1' driver can be ported to 
> linux-next or linux-? ?
> If you need more explanations, do not hesitate to contact me, I would 
> be happy to help
> 
> Kind regards
> Nicolas Baranger
