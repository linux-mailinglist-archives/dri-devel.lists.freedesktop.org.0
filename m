Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0507D0B31F
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 17:22:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA8DB10E901;
	Fri,  9 Jan 2026 16:22:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kp6zpKd+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1786410E904
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 16:22:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BDA2A40411;
 Fri,  9 Jan 2026 16:22:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D373C4CEF1;
 Fri,  9 Jan 2026 16:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767975746;
 bh=Ly5rsu9iAyn9lW0IFWV/1YmnCBk3D0LSGmuBOF+470I=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=kp6zpKd+Le+FlxEkkb0lIwlDXyO3zbz+qGxAgdrwblE6+eSaebxkz3JFeNI8thkWx
 ZWkOmjHAruLbDEz53ggeUo2zqzG+N9XC8+EXtLjoc5ARcPFyOTPupkWQht/tNSNTXA
 FhclIOxgVyqpCRSew9fq3uTLPWvBAmIW23L08clUReZJK0DSefSJozBur+3P8vb7W9
 9oWjpItm2awRrZjMDC0LHtr6P+Mif3/SYCI8d1saq0bnzqrma4xfM+Cs5y5guD49xy
 H89h7bAHbkecmNJ2G4XSD32LNkJoM+qtqtcOcJJohTTH5KjA4oJXDBp69coq/wVmje
 VohysB/Z0MLVA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Jan 2026 17:22:23 +0100
Message-Id: <DFK73G5XKCEW.3IE3GE9726PDQ@kernel.org>
Subject: Re: [PATCH] drm/gpuvm: fix name in kernel doc of
 drm_gpuvm_bo_obtain_locked()
Cc: <lkp@intel.com>, <bbrezillon@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <oe-kbuild-all@lists.linux.dev>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <202601091113.0b0WuRML-lkp@intel.com>
 <20260109082019.3999814-1-aliceryhl@google.com>
In-Reply-To: <20260109082019.3999814-1-aliceryhl@google.com>
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

On Fri Jan 9, 2026 at 9:20 AM CET, Alice Ryhl wrote:
> When renaming this function, the name in the docs was not updated. This
> causes a KernelDoc warning. Thus, fix it.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202601091113.0b0WuRML-lkp@i=
ntel.com/
> Fixes: 9bf4ca1e699c ("drm/gpuvm: drm_gpuvm_bo_obtain() requires lock and =
staged mode")
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Applied to drm-misc-next, thanks!

> ---
> Does anyone know what the config option to enable these warnings in my
> own build is?

I think any of the documentation targets should do the trick, I usually use=
 the
htmldocs make target.
