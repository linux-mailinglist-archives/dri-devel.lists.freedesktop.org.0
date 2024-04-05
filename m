Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F26789A435
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 20:31:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A8D110E5EC;
	Fri,  5 Apr 2024 18:31:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PjsNhh0f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B467510E5EC
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 18:31:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 034EFCE2447;
 Fri,  5 Apr 2024 18:31:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C78FFC433F1;
 Fri,  5 Apr 2024 18:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712341871;
 bh=SpJ5IQ9UhqrJWD/qugetHjxi8hPNKx//RaZUEP7dXMk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PjsNhh0fjSHbdf2868fr6XGX0ymVpLd72hs4QqY449d2ixqqIbiOZ9KGWsTScBEdM
 MmD6oO1ZFR5n/8XBcvJfrg+1fJuE6RWAslDhUeScY/894NlfAHOyDlBtG+Jpj6Xgim
 AEpzgBbfrsVfqV97+U4MIZvB6mlskGvejsxy0uQkrvJ6HQBnEonvJPKwG4UwRXSFPC
 sokGvl/2IbsBR2HRjgP5VVh/y6bBeOez+JNtA6wzhbGF/BxyaWGie9mhpM3y8Fsgqy
 nccatqMs+mRkE11DcKuPOVmzq2/2RT6tsP9WZvm4sK8QAsHlkDj+GzXZn741rHxhYU
 UZgSQsgWkKskQ==
Date: Fri, 5 Apr 2024 19:31:02 +0100
From: Simon Horman <horms@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Kees Cook <keescook@chromium.org>, Daniel Diaz <daniel.diaz@linaro.org>,
 David Gow <davidgow@google.com>, Arthur Grillo <arthurgrillo@riseup.net>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Maxime Ripard <mripard@kernel.org>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, loongarch@lists.linux.dev,
 netdev@vger.kernel.org, x86@kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [PATCH v3 13/15] sh: Move defines needed for suppressing warning
 backtraces
Message-ID: <20240405183102.GU26556@kernel.org>
References: <20240403131936.787234-1-linux@roeck-us.net>
 <20240403131936.787234-14-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240403131936.787234-14-linux@roeck-us.net>
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

On Wed, Apr 03, 2024 at 06:19:34AM -0700, Guenter Roeck wrote:
> Declaring the defines needed for suppressing warning inside
> '#ifdef CONFIG_DEBUG_BUGVERBOSE' results in a kerneldoc warning.
> 
> .../bug.h:29: warning: expecting prototype for _EMIT_BUG_ENTRY().
> 	Prototype was for HAVE_BUG_FUNCTION() instead
> 
> Move the defines above the kerneldoc entry for _EMIT_BUG_ENTRY
> to make kerneldoc happy.
> 
> Reported-by: Simon Horman <horms@kernel.org>
> Cc: Simon Horman <horms@kernel.org>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Rich Felker <dalias@libc.org>
> Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v3: Added patch. Possibly squash into previous patch.

FWIIW, this looks good to me.

>  arch/sh/include/asm/bug.h | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/sh/include/asm/bug.h b/arch/sh/include/asm/bug.h
> index 470ce6567d20..bf4947d51d69 100644
> --- a/arch/sh/include/asm/bug.h
> +++ b/arch/sh/include/asm/bug.h
> @@ -11,6 +11,15 @@
>  #define HAVE_ARCH_BUG
>  #define HAVE_ARCH_WARN_ON
>  
> +#ifdef CONFIG_DEBUG_BUGVERBOSE
> +#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
> +# define HAVE_BUG_FUNCTION
> +# define __BUG_FUNC_PTR	"\t.long %O2\n"
> +#else
> +# define __BUG_FUNC_PTR
> +#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
> +#endif /* CONFIG_DEBUG_BUGVERBOSE */
> +
>  /**
>   * _EMIT_BUG_ENTRY
>   * %1 - __FILE__
> @@ -25,13 +34,6 @@
>   */
>  #ifdef CONFIG_DEBUG_BUGVERBOSE
>  
> -#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
> -# define HAVE_BUG_FUNCTION
> -# define __BUG_FUNC_PTR	"\t.long %O2\n"
> -#else
> -# define __BUG_FUNC_PTR
> -#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
> -
>  #define _EMIT_BUG_ENTRY				\
>  	"\t.pushsection __bug_table,\"aw\"\n"	\
>  	"2:\t.long 1b, %O1\n"			\
> -- 
> 2.39.2
> 
