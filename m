Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C697D1DAC53
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 09:35:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 396CB6E5A5;
	Wed, 20 May 2020 07:34:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 534196E0AD
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 21:28:39 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id v16so1314512ljc.8
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 14:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=e6bAShFDWHYbs4gZ30mXqOnL++lgcazkRG73IU7c6CA=;
 b=BrPI9pAfHqlrZUb0vopWjrDmqL8zu51rcCgUj6mFLxhPVsV20y763QE5PHeUiupKzR
 rl6rzNnTcnuG94umWAJgZFwdZ75FD5ND9zAAJf3vd4gNxV4sEsPifMhXr6sXrMf20k8G
 859OdAnYOCuUg8w76ZbsQrzWdFGQyzlc6Yp6jOzZR6s3+qoEJAJpENyS6ub59Xuq7ovE
 ilpPoW5UKkRMSMqHXshU13WX2rP0LUoX9YbdGlfRc1fOYjdBj/fqkEG4qqvseA+j0G7P
 0Kz8iGK/cVPYtIDVOXiSNBWFjHkvqk/aG5d55Q0/3oDSYMDsu7ZikEOCBI4aQs/lyHkD
 mM0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=e6bAShFDWHYbs4gZ30mXqOnL++lgcazkRG73IU7c6CA=;
 b=R1U/EYeroD+gcaIsn+hJp2oWcXo+LR4U7CJpONU5h8vVSxSlsFZsX4ECu2vc9m1yu8
 mxxLufvfoua4Q88oANi8yYC+Bg+A2gRPn9aR2ecOpylU0oJYr4J0fi/AQdo8m5KiT9s3
 YKShgx4H7sTEzmOocUqvbBFtARGvJS97llzQe0tyDG3vPunNwwH/GE0L+mUseoWmXSmA
 nYiNGROaG64qKnS9hpjZXXczR5+/99KFf1yX5xBHttG8PYsq4eGCbVojXgVoRAzIGL5a
 jmzpVdCw9eIgXzKFPFgmazE8+6gI0ee1zAbuzif8gvP5PAzdOsgIw9RjJOPBIcJrdNF8
 ekFw==
X-Gm-Message-State: AOAM533nDYeg2+b7Oer91Om4pmgNXiueW+Sf4icC1VeEukxWIAeT+Jla
 y7kl0ovSbBL/WCHSz0L53MU=
X-Google-Smtp-Source: ABdhPJyRQ0gMAlR42tyP/UU6lBaLCmzDx3U8AB4YIDRbOsJvvPQeOL8sItFGCqKDY74hL3qx6QR8wQ==
X-Received: by 2002:a2e:8901:: with SMTP id d1mr838753lji.37.1589923717568;
 Tue, 19 May 2020 14:28:37 -0700 (PDT)
Received: from rikard (h-158-174-22-22.NA.cust.bahnhof.se. [158.174.22.22])
 by smtp.gmail.com with ESMTPSA id y20sm373429lji.31.2020.05.19.14.28.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 14:28:36 -0700 (PDT)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
X-Google-Original-From: Rikard Falkeborn <rikard.falkeborn>
Date: Tue, 19 May 2020 23:28:29 +0200
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH v2] linux/bits.h: adjust GENMASK_INPUT_CHECK() check
Message-ID: <20200519212829.GA59586@rikard>
References: <20200519101320.33495-1-emil.l.velikov@gmail.com>
 <20200519211452.422179-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200519211452.422179-1-emil.l.velikov@gmail.com>
X-Mailman-Approved-At: Wed, 20 May 2020 07:34:33 +0000
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
Cc: Kees Cook <keescook@chromium.org>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 dri-devel@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+ Andrew et al who recieved mail from the build robot this morning about
the same issue.

On Tue, May 19, 2020 at 10:14:52PM +0100, Emil Velikov wrote:
> Recently the GENMASK_INPUT_CHECK() was added, aiming to catch cases
> where there GENMASK arguments are flipped.
> 
> Although it seems to be triggering -Wtype-limits in the following cases:
> 
>    unsigned foo = (10 + x);
>    unsigned bar = GENMASK(foo, 0);
> 
>    const unsigned foo = (10 + x);
>    unsigned bar = GENMASK(foo, 0);
> 
> Here are the warnings, from my GCC 9.2 box.
> 
> warning: comparison of unsigned expression < 0 is always false [-Wtype-limits]
>    __builtin_constant_p((l) > (h)), (l) > (h), 0)))
>                             ^
> warning: comparison of unsigned expression < 0 is always false [-Wtype-limits]
>    __builtin_constant_p((l) > (h)), (l) > (h), 0)))
>                                         ^
> 
> This results in people disabling the warning all together or promoting
> foo to signed. Either of which being a sub par option IMHO.
> 
> Add a trivial "+ 1" to each h and l in the constant expression.
> 
> v2: drop accidental !
> 
> Fixes: 295bcca84916 ("linux/bits.h: add compile time sanity check of
> GENMASK inputs")
> Cc: Rikard Falkeborn <rikard.falkeborn@gmail.com>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
> Reported-by: kbuild test robot <lkp@intel.com>
> Reported-by: kbuild test robot <lkp@intel.com>
> ---
>  include/linux/bits.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/bits.h b/include/linux/bits.h
> index 4671fbf28842..02a42866d198 100644
> --- a/include/linux/bits.h
> +++ b/include/linux/bits.h
> @@ -23,7 +23,7 @@
>  #include <linux/build_bug.h>
>  #define GENMASK_INPUT_CHECK(h, l) \
>  	(BUILD_BUG_ON_ZERO(__builtin_choose_expr( \
> -		__builtin_constant_p((l) > (h)), (l) > (h), 0)))
> +		__builtin_constant_p((l + 1) > (h + 1)), (l + 1) > (h + 1), 0)))

You need parentheses around l and h here.

I think I would have prefered a cast to int here instead but I'm fine
with either (I don't think pragmas for disabling the warning can be used
since the check is added to the mask). Either way, I think we need a
comment on why this is done.

>  #else
>  /*
>   * BUILD_BUG_ON_ZERO is not available in h files included from asm files,
> -- 
> 2.25.1
> 

I can't reproduce this with gcc 10 and kernelci.org does not show the
warning (but those builds seem to be gcc 8 only, so maybe this is a gcc
9 thing only). A bit strange this shows up now, it's been in Linus's
tree for six weeks and in next for even longer, but oh well.

Rikard
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
