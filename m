Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 527E174CE1F
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 09:22:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 323B510E1BA;
	Mon, 10 Jul 2023 07:22:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F2010E15F
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 04:08:16 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1b730eb017bso272187fac.1
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Jul 2023 21:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688962094; x=1691554094;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SI9RNcelEJRqjgZ3cj4A/MldUxL+d7rqihkZbBH1AFY=;
 b=iVKpTnqvNrUhmIj8Pead4qxzUx+5FEqEj2o2LZQPy/bO+4COQLAPUA2tYXOc/R2BgT
 WXXxngVaWFUrztbY3CREIS4d8vXvIbEUHInTqWO8/fcCVi/k61dqCs9L57T6/hQPeoTL
 djqWGsASDlN37qpDOunajF78cc7Miv4m5fR9daAJazyNoH/Jv0IoP4QuI8R0xXektt0Z
 BzUZmv9QLZnpwucS2nyyz/xwdmr7pR9/9w8M76YZcl6WiWHbfX6msKl+3Dl0nSAnHW2A
 n70RJ3CEVgoCVyWZRzjwy1vt9eb2l4ZKA4WC/qtPMPfB6EBkvQiU2qne580vUi/Mhbov
 qXsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688962094; x=1691554094;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SI9RNcelEJRqjgZ3cj4A/MldUxL+d7rqihkZbBH1AFY=;
 b=XLOEOZOJ8je5Tp1AU7Tmcy9bJMnLoWcliCJLvNjr3ayG84RCOYEiver5eFs9dwn0ks
 rK+OJ1YfE7vjAvayGQugpJx0gY6krlSRqmLvlXaH8bOX2xNUQGhp+Al9+kaqcLqoRPMa
 KEXmcPGkeeZ9a96XILOLMVi59TT5NPm1+fEG0t8I/EypTvRCwCt2LdPBur8F/Asy3oID
 T2vx0eGdnDfzWuUEFMrKXtqAGJ8csP90IYFdtpkAOhdgSfbqiL8crVMFR+WTuFCUNYKp
 cTBxwfmYRMH8lH+N4AAH5rTsVobp0z4fbC/E+YEVqjet9Ub5+krfAigiqgkmwdxCGtVs
 VCSA==
X-Gm-Message-State: ABy/qLbzR86r1p0vZMQBAAjwBjFKrXpMiFjW8l5wEqmUcComswO7j/Fj
 a4ujtBX6XagNPRA7dH9XnqUkfgb7b7u9PpczCRk=
X-Google-Smtp-Source: APBJJlGmSNmHOoafZjLJZz8/wV792WRpiff+2GDpJxWf6XS+WYjRR+08RhvbYCi14YACNX/qF8Zpr859L/3Uxipik8M=
X-Received: by 2002:a05:6870:438f:b0:1b0:25b4:4b77 with SMTP id
 r15-20020a056870438f00b001b025b44b77mr12556779oah.14.1688962094392; Sun, 09
 Jul 2023 21:08:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230707095415.1449376-1-arnd@kernel.org>
 <20230707095415.1449376-4-arnd@kernel.org>
In-Reply-To: <20230707095415.1449376-4-arnd@kernel.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sun, 9 Jul 2023 21:08:03 -0700
Message-ID: <CAMo8BfLOYkdxF4x=E2L4OYavw+GDtO0ftdAxCaVuFwGr=RUCyw@mail.gmail.com>
Subject: Re: [PATCH 4/4] vgacon, arch/*: remove unused screen_info definitions
To: Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 10 Jul 2023 07:22:46 +0000
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 linux-sh@vger.kernel.org, dri-devel@lists.freedesktop.org, javierm@redhat.com,
 Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>, linux-hexagon@vger.kernel.org,
 Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>,
 linux-csky@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Chris Zankel <chris@zankel.net>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Brian Cain <bcain@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Dinh Nguyen <dinguyen@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 7, 2023 at 2:56=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wrot=
e:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> A number of architectures either kept the screen_info definition for
> historical purposes as it used to be required by the generic VT code, or
> they copied it from another architecture in order to build the VGA
> console driver in an allmodconfig build.
>
> Now that vgacon no longer builds on these architectures, remove the
> stale definitions.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/csky/kernel/setup.c          | 12 ------------
>  arch/hexagon/kernel/Makefile      |  2 --
>  arch/hexagon/kernel/screen_info.c |  3 ---
>  arch/nios2/kernel/setup.c         |  5 -----
>  arch/sh/kernel/setup.c            |  5 -----
>  arch/sparc/kernel/setup_32.c      | 13 -------------
>  arch/sparc/kernel/setup_64.c      | 13 -------------
>  arch/xtensa/kernel/setup.c        | 12 ------------

For xtensa:
Acked-by: Max Filippov <jcmvbkbc@gmail.com>

--=20
Thanks.
-- Max
