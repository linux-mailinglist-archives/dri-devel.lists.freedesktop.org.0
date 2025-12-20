Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C7ECD2F42
	for <lists+dri-devel@lfdr.de>; Sat, 20 Dec 2025 13:55:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62B5810E11F;
	Sat, 20 Dec 2025 12:55:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hma2xX0Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA2C10E11F
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 12:55:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 25C1460097;
 Sat, 20 Dec 2025 12:55:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78EB9C116B1;
 Sat, 20 Dec 2025 12:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766235321;
 bh=XgGP7ww8ai2wwjZ85vTd42D15tCSeweaMJxvXdmFUuk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hma2xX0YNM6Q+vUqmt1ike9JxjvQ+gIiLs4WHYeJ17hy9QevTlfFq2JhqNDM4VoEZ
 xTFLfW4JOk7HCazAu/pIQ74tSQ1b4MIgtGN0cjupKI2lCLZqlNkoPv3aGWTh4/Qf4Y
 qDLH+X68OevlBW4voE73WwL2APh5C+RATf63iN/bwAeUKNW19hRo53Fmu1j5BrTw/Z
 S86mNPBBl7ZlI0YAZ9sI0iiR4xg8ni+gE/Kn1a36lERGttFkOamghinApw0RiRSffG
 6ZYj/hnyPZblwft0zFv8xxVqm5h4j28KqXFJ7LeHr/MDNOfnwesRMv6JFPbkQqtgL1
 pZ/k6Erlesl2A==
Date: Sat, 20 Dec 2025 13:53:23 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Vincent Mailhol <mailhol@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kbuild@vger.kernel.org, linux-sparse@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-btrfs@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 2/3] kbuild: cleanup local -Wno-type-limits exceptions
Message-ID: <aUacQyHLoRKXXbrb@levanger>
Mail-Followup-To: Vincent Mailhol <mailhol@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>,
 Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kbuild@vger.kernel.org, linux-sparse@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-btrfs@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20251220-remove_wtype-limits-v3-0-24b170af700e@kernel.org>
 <20251220-remove_wtype-limits-v3-2-24b170af700e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251220-remove_wtype-limits-v3-2-24b170af700e@kernel.org>
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

On Sat, Dec 20, 2025 at 12:02:20PM +0100, Vincent Mailhol wrote:
> Now that -Wtype-limits is globally deactivated, there is no need for
> local exceptions anymore.
> 
> Acked-by: David Sterba <dsterba@suse.com>
> Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
> ---
> Changelog:
> 
>   v1 -> v2: small change in patch description
> ---
>  drivers/gpu/drm/Makefile | 1 -
>  fs/btrfs/Makefile        | 1 -
>  2 files changed, 2 deletions(-)
> 

Reviewed-by: Nicolas Schier <nsc@kernel.org>
