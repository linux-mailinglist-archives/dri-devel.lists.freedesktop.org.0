Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A5BCAEAF4
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 03:05:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F21E910E474;
	Tue,  9 Dec 2025 02:05:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="S5+9n0nB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19B7310E474
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 02:05:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2A3E660178
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 02:05:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6FF5C4AF09
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 02:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765245941;
 bh=r2TLrXMNY6tdqpLXobOdQ7VcPmjJoeY/D/NczUBVb9c=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=S5+9n0nB615ZurPWCj75TPQeOQKLEF+PlUy/ICSaZbX9qlckBR/2apQcE+3WeY+ZK
 fJDJrD+wykBa4ib1qatmEFlI+MMGBL5ML8D0wxtpSffHhMFVoVq4wPOWIZaVJew6UC
 ZJNYk6ewGhwfo6fucMNX4YYMNqRtVTP2/QXtZdixUoFFGO1+2O2BDqxhZmDjqK4hBc
 Ir/DeQf877PAnDiIOVblz1QDpsGZrNEUalbuyiK6sGC9QqEz63Yzq8gYsoaUL6ds2L
 O4wCY5+cOGF4Sy5nXVRjM/2FSmEh8Yl4DVvn0ZvZUEPz19NL62eIc30FgLpai+Z7Sy
 /5AMXGopU1GQw==
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-343f52d15efso4752362a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Dec 2025 18:05:41 -0800 (PST)
X-Gm-Message-State: AOJu0YzYACvx7PF35a+LxWlkdcaNJSuy9w17h3fCuiGSNY3V+YU1hq48
 ZSl4x99eT0mgPd4IrPiPzUwdlC4a/q6PFElhEtZfArIC7IswbY9krGEVXMfuorKcBcdivbxdmU9
 fuf+K74ICILZmH0tsqC+m99xTU0ezdTA=
X-Google-Smtp-Source: AGHT+IHyKmMSYrVYsbJSKtDPABE9Jn39tYyzOnWg1/bGf+V3ApboC/uhg8RcVjfRBg5ctgchARRcyQuWCs7J6IUWjpY=
X-Received: by 2002:a17:90a:d450:b0:340:ec3b:b587 with SMTP id
 98e67ed59e1d1-349a24dd160mr7546009a91.1.1765245941305; Mon, 08 Dec 2025
 18:05:41 -0800 (PST)
MIME-Version: 1.0
References: <20251208193925.7449-1-tursulin@igalia.com>
In-Reply-To: <20251208193925.7449-1-tursulin@igalia.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 9 Dec 2025 11:05:26 +0900
X-Gmail-Original-Message-ID: <CAMj1kXFZD+No6C4MEpmSY5Ha0DtJH+kHfTiO02By4ejUekLaRA@mail.gmail.com>
X-Gm-Features: AQt7F2pxwyMp3jupjJdnRCACLrDOSnZB2DzSsDgxxn7yVjvGaE4-ePdhmDRIjco
Message-ID: <CAMj1kXFZD+No6C4MEpmSY5Ha0DtJH+kHfTiO02By4ejUekLaRA@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] EFI fbcon fixes etc
To: Tvrtko Ursulin <tursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com, 
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Melissa Wen <mwen@igalia.com>, linux-efi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 9 Dec 2025 at 04:39, Tvrtko Ursulin <tursulin@igalia.com> wrote:
>
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>
> Two generic fixes split out for easy review, one refactoring as requested, and
> then the last patch is the panel/mode quirk to allow for corruption free fbcon
> with simpledrmfb and efidrmfb on the Valve Steam Deck.
>
> v2:
>  * s/unsigned/unsigned int/
>  * s/pitch/linelength/
>  * Removed comment explaining the Steam Deck quirk.
>  * Added patch to refactor quirk application via callbacks.
>
> v3:
>  * Added forgotten __initconst.
>  * Use separate callback for the fixup quirk.
>
> v4:
>  * Use __screen_info_lfb_bits_per_pixel() instead of accessing lfb_depth directly.
>
> v5:
>  * s/lfb_width/bpp/.
>  * Grammar and typo tidy in the last patch.
>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Melissa Wen <mwen@igalia.com>
> Cc: linux-efi@vger.kernel.org
>
> Tvrtko Ursulin (4):
>   efi: sysfb_efi: Replace open coded swap with the macro
>   efi: sysfb_efi: Fix lfb_linelength calculation when applying quirks
>   efi: sysfb_efi: Convert swap width and height quirk to a callback
>   efi: sysfb_efi: Fix efidrmfb and simpledrmfb on Valve Steam Deck
>
>  drivers/firmware/efi/sysfb_efi.c | 73 ++++++++++++++++++++++++++++----
>  1 file changed, 65 insertions(+), 8 deletions(-)
>

This looks fine to me now. Unless there are more comments, I intend to
get this queued up as soon as -rc1 comes around.

Thanks
