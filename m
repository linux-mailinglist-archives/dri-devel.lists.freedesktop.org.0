Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA97B1C69A8
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 09:02:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED2406E49F;
	Wed,  6 May 2020 07:02:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EB0E6E5CE
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 14:12:44 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id o7so2064208oif.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 May 2020 07:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Yjm2cmKVuwlkstPxfFd5MfjFWk/J8R1nDWAUw4Id7r8=;
 b=gSAzcE/ceHx3DD0GHkL/zUqm0ntyLCzjEfid4HO8kPLsHnWLW/F0L8YI2ve23ScdUX
 SR0Z5J4h4hYUhRAu0sf2GUNqwtltdFruppAAsoH8zwvvowS4uwWSYI6fT1Q8LSRLegaC
 J6UdM/icnIHrSTh/q0fEzggv34Jrmx9+Lr8NMLddFudUi4U5QiM/RI/uAJB0oFvMPzbz
 izKi+kCspKWbqnxBLxwB8Elc4lL3Z7ABEXerd1WoTedVc/o4SczYSK0prr4dF5Pix0w4
 ogM72D79j8OK39H5K1HkLXMQe39tDXPeZsYE5K/oiYsHvpadvrMniPLWrvwerrWTx8oq
 1Nuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yjm2cmKVuwlkstPxfFd5MfjFWk/J8R1nDWAUw4Id7r8=;
 b=EN5hCNUKOm7K26A5ECRXyXX1WXBIFU6INMFuEVm16fAcGHGgvYS/7cKEpJgfHIaVvy
 CrLYxkmjzaGbbhdKVTtYK5p2dWErvxDMuLftVzdZt/22SlqVome73MeHRULA83DNEd8x
 +4tM+9bzim3cAgEh9/moWyQCAKfhgNAW1Q4Yon6Jc7kbgAXEvz+ngos6N7Fzkm7HRg+V
 6e/CMGEUeKyHfbtLPm3ya0cY/L7Ri6WHaJe1w/d9MJsnRzUAUrb7oqJ1hvx01oBuGxr9
 udb0uoGfFTNGJIqkoll9DE2VS4O0iqD/v2WDrF9boZhPnPzho+7nZWPxKJGtB/80fxjC
 JRbw==
X-Gm-Message-State: AGi0PuZvZs4UOdznE7rZRAMtoIlX3b0xih0x+lOq5iQqNdBtE5W/Aqg2
 0GR8Hc0ENzCO/YSsCwglfG+vpAhdpFw2pwI/O2T/Tw==
X-Google-Smtp-Source: APiQypIAywvPjEF+eFOU7gfeqV9lG2oqecVKyu+ef21qclXSvVG9C5gqW2wVY/N0EBRjBC6fH8Vm74uN5E+0Jr0Owmg=
X-Received: by 2002:aca:1c08:: with SMTP id c8mr2558360oic.172.1588687963483; 
 Tue, 05 May 2020 07:12:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200505140407.373983-1-arnd@arndb.de>
In-Reply-To: <20200505140407.373983-1-arnd@arndb.de>
From: Marco Elver <elver@google.com>
Date: Tue, 5 May 2020 16:12:30 +0200
Message-ID: <CANpmjNNw6M9Gqj6WGTHH4Cegu8roTVu5x6Vqs_tCBxX3gPwL4A@mail.gmail.com>
Subject: Re: [PATCH] omapfb: don't annotate dss_conv_list as __initdata
To: Arnd Bergmann <arnd@arndb.de>
X-Mailman-Approved-At: Wed, 06 May 2020 07:02:40 +0000
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
Cc: linux-fbdev@vger.kernel.org, "Paul E. McKenney" <paulmck@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alexios Zavras <alexios.zavras@intel.com>, Will Deacon <will@kernel.org>,
 clang-built-linux@googlegroups.com, Thomas Gleixner <tglx@linutronix.de>,
 linux-omap@vger.kernel.org, Enrico Weigelt <info@metux.net>,
 Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 5 May 2020 at 16:04, Arnd Bergmann <arnd@arndb.de> wrote:
>
> With the kcsan changes, __read_once_size() is not inlined, but
> clang can decide to emit a version that hardcodes the address, which
> in turn triggers a warning for dss_conv_list being __initdata but
> __read_once_size() not being __init:
>
> WARNING: modpost: vmlinux.o(.text+0x6e4d7a): Section mismatch in
> reference from the function __read_once_size() to the variable
> .init.data:dss_conv_list
> The function __read_once_size() references
> the variable __initdata dss_conv_list.
> This is often because __read_once_size lacks a __initdata
> annotation or the annotation of dss_conv_list is wrong.
>
> This is clearly a false positive warning, but it's hard to tell
> who is to blame for it. Work around it by removing the __initdata
> annotation, wasting the space of two pointers in return for getting
> rid of the warning.
>
> Fixes: dfd402a4c4ba ("kcsan: Add Kernel Concurrency Sanitizer infrastructure")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

[+Cc Will]

I think Will is working on a series that completely overhauls
READ_ONCE/WRITE_ONCE, also getting rid of __read_once_size() in the
process, which would make this patch redundant. If we can live with
this warning until the new READ_ONCE/WRITE_ONCE gets merged, we can
probably keep things as-is for now.

Thanks,
-- Marco

> ---
>  drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c b/drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c
> index 0ae0cab252d3..29fdff9c95f6 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c
> @@ -19,7 +19,7 @@
>  #include <linux/slab.h>
>  #include <linux/list.h>
>
> -static struct list_head dss_conv_list __initdata;
> +static struct list_head dss_conv_list;
>
>  static const char prefix[] __initconst = "omapdss,";
>
> --
> 2.26.0
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
