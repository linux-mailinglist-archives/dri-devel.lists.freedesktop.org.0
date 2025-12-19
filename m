Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1927FCCECA3
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 08:33:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7740810EBBA;
	Fri, 19 Dec 2025 07:33:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="P+S2bAGU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DE8B10EBBA
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 07:33:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 34C5A6001D;
 Fri, 19 Dec 2025 07:33:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CF86C4CEF1;
 Fri, 19 Dec 2025 07:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766129615;
 bh=f8+G6CVnJp2DBUsfaWCf5DINHDnv28/Brh1CjQS5678=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P+S2bAGU5yOPI6ncR6Hsq8cPmW3M4Yqg506ro+7zmln9tQTIazrjsEYt1+YBl5zHP
 T5tyLBVp7D/uFJpY19JFsqZ3pdgwViUoaBXHMPH+mt62otQ+STb42h+x5dyss0VW1F
 5/dpDUyvgNdMEnjs7EWMLMw2DVAXN/n+X4FXM8fPbnjVrTnp0+SU43DQMFMMiN+253
 1OK5VXRczsdldkhAx6rXyIte+FDktPPwr+04wnqfqaX30/SfFOpOgX0KIquRzLEL6G
 HiT3C2w+H+r/n3KOVwGF9K/kAC6ypuhzVRcuGX9l7jZz6+ZLYEw/mcYxUxgB8YD7qP
 U+FgPloDdpSrw==
Date: Fri, 19 Dec 2025 08:33:29 +0100
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
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kbuild@vger.kernel.org, linux-sparse@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-btrfs@vger.kernel.org
Subject: Re: [PATCH 0/2] kbuild: remove gcc's -Wtype-limits
Message-ID: <aUT_yWin_xslnOFh@derry.ads.avm.de>
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
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kbuild@vger.kernel.org, linux-sparse@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-btrfs@vger.kernel.org
References: <20251218-remove_wtype-limits-v1-0-735417536787@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218-remove_wtype-limits-v1-0-735417536787@kernel.org>
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

On Thu, Dec 18, 2025 at 07:50:00PM +0100, Vincent Mailhol wrote:
> I often read on the mailing list people saying "who cares about W=2
> builds anyway?". At least I do. Not that I want to fix all of them,
> but on some occasions, such as new driver submissions, I have often
> found a couple valid diagnostics in the W=2 output.
> 
> That said, the annoying thing is that W=2 is heavily polluted by one
> warning: -Wtype-limits. Try a gcc W=2 build on any file and see the
> results for yourself. I suspect this to be the reason why so few
> people are using W=2.
> 
> This series removes gcc's -Wtype-limits in an attempt to make W=2 more
> useful. Those who do not use W=2 can continue to not use it if they
> want. Those who, like me, use it form time to time will get an
> improved experience from the reduced spam.
> 
> Extra details on statistics, past attempts and -Wtype-limits
> alternatives are given in the first patch description.
> 
> Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
> ---
> Vincent Mailhol (2):
>       kbuild: remove gcc's -Wtype-limits
>       kbuild: cleanup local -Wno-type-limits exceptions
> 
>  drivers/gpu/drm/Makefile | 1 -
>  fs/btrfs/Makefile        | 1 -
>  scripts/Makefile.warn    | 4 +++-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> ---
> base-commit: 3e7f562e20ee87a25e104ef4fce557d39d62fa85
> change-id: 20251205-remove_wtype-limits-c77eb46d09c2
> 
> Best regards,
> -- 
> Vincent Mailhol <mailhol@kernel.org>
> 

Thanks for the effort!  (This allows to revert commit dc7fe518b049
("overflow: Fix -Wtype-limits compilation warnings").)

Reviewed-by: Nicolas Schier <nsc@kernel.org>


