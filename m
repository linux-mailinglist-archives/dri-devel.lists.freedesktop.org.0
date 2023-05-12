Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3B07006CB
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 13:28:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F5DB10E688;
	Fri, 12 May 2023 11:28:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBD2B10E688
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 11:28:10 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-55aa1da9d4aso173411827b3.2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 04:28:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683890889; x=1686482889;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jRL0mFkBIJ4KpIHNQ0nXnFUPNdCjxMZJfjytXJxyHUs=;
 b=M8OzFrPPLqQKGUJy/sxfm6r25dWZpenIKvqw759tW6wHTjIJ5uU4d7GJu/dp3hvCMX
 dKkpBa4X634+/TvafOg/V/8uk2bv3JMq9ai+7zpmx7aF1rS2z2IGcjcYeRNXLwTvWtF5
 1tD9fSlFwcGgCW0Uum6ahkpMMsExAkPQBXu13MYD8hLwZ+ArrYp/pydIIuHvKrxa5gdF
 jiuTXiCE1/yqyGD3S09bNgDEPIn9ZJ3OLHfo0pCaCwnhm/SRgqNwnPv8T01hgVxQS3gt
 6UvxhR2CUt3kxdiK5ChNFQKz6B94RERu7WiI51WZKsbbT7WA+9nW94Qm/3YUCNMiR47a
 H6wg==
X-Gm-Message-State: AC+VfDxwFfUP7DK820c1OUzZGqIstfLTrLvGInYWul7bO7WVzl3FJifN
 pvMFIHOhTW1DyhF0mPLW+GYV1TFTg3iv/A==
X-Google-Smtp-Source: ACHHUZ61hYHepj755WkINY+JyahTAf7s+oOuTZ/yUbMIybAOrY0g8hNbLqTn5u2HibyMyamixYCR7Q==
X-Received: by 2002:a0d:eb4d:0:b0:556:e3eb:de38 with SMTP id
 u74-20020a0deb4d000000b00556e3ebde38mr26678514ywe.0.1683890889093; 
 Fri, 12 May 2023 04:28:09 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com.
 [209.85.128.169]) by smtp.gmail.com with ESMTPSA id
 r10-20020a0de80a000000b0055d6ae09dedsm5594579ywe.127.2023.05.12.04.28.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 May 2023 04:28:07 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-55a00da4e53so173393657b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 04:28:07 -0700 (PDT)
X-Received: by 2002:a0d:d691:0:b0:539:1b13:3d64 with SMTP id
 y139-20020a0dd691000000b005391b133d64mr23825102ywd.48.1683890887026; Fri, 12
 May 2023 04:28:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230512100620.36807-1-bagasdotme@gmail.com>
 <20230512100620.36807-5-bagasdotme@gmail.com>
In-Reply-To: <20230512100620.36807-5-bagasdotme@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 May 2023 13:27:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWrApnnmC+p_+jeVsswc-_JRSK3FtvpS2X4PrscBCZtAA@mail.gmail.com>
Message-ID: <CAMuHMdWrApnnmC+p_+jeVsswc-_JRSK3FtvpS2X4PrscBCZtAA@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] net: ethernet: 8390: Replace GPL boilerplate
 with SPDX identifier
To: Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Simon Horman <simon.horman@corigine.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Eric Dumazet <edumazet@google.com>,
 "David A . Hinds" <dahinds@users.sourceforge.net>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Greg Ungerer <gerg@linux-m68k.org>,
 Andy Gospodarek <andy@greyhouse.net>, Bruce Abbott <bhabbott@inhb.co.nz>,
 Topi Kanerva <topi@susanna.oulu.fi>,
 Linux Staging Drivers <linux-staging@lists.linux.dev>,
 Linux SPDX Licenses <linux-spdx@vger.kernel.org>,
 Peter De Schrijver <p2@mind.be>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Guenter Roeck <linux@roeck-us.net>,
 Sam Creasey <sammy@sammy.net>, Donald Becker <becker@scyld.com>,
 Alain Malek <Alain.Malek@cryogen.com>,
 Linux Watchdog Devices <linux-watchdog@vger.kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Jay Vosburgh <j.vosburgh@gmail.com>,
 Jan Kara <jack@suse.com>,
 Linux Kernel Actions <linux-actions@lists.infradead.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Alan Cox <alan@linux.intel.com>, Karsten Keil <isdn@linux-pingi.de>,
 Linux Networking <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Diederik de Haas <didi.debian@cknow.org>,
 Philippe Ombredanne <pombredanne@nexb.com>,
 "David S. Miller" <davem@davemloft.net>, Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Bagas,

On Fri, May 12, 2023 at 12:08=E2=80=AFPM Bagas Sanjaya <bagasdotme@gmail.co=
m> wrote:
> Replace GPL boilerplate notice on remaining files with appropriate SPDX
> tag. For files mentioning COPYING, use GPL 2.0; otherwise GPL 1.0+.
>
> Cc: David A. Hinds <dahinds@users.sourceforge.net>
> Cc: Donald Becker <becker@scyld.com>
> Cc: Peter De Schrijver <p2@mind.be>
> Cc: Topi Kanerva <topi@susanna.oulu.fi>
> Cc: Alain Malek <Alain.Malek@cryogen.com>
> Cc: Bruce Abbott <bhabbott@inhb.co.nz>
> Cc: Alan Cox <alan@linux.intel.com>
> Acked-by: Greg Ungerer <gerg@linux-m68k.org>
> Reviewed-by: Simon Horman <simon.horman@corigine.com>
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Thanks for your patch!

> --- a/drivers/net/ethernet/8390/apne.c
> +++ b/drivers/net/ethernet/8390/apne.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-1.0+

As per the removed lines below, this should be GPL-2.0-only.

>  /*
>   * Amiga Linux/68k 8390 based PCMCIA Ethernet Driver for the Amiga 1200
>   *
> @@ -19,12 +20,6 @@
>   *
>   * ---------------------------------------------------------------------=
-------
>   *
> - * This file is subject to the terms and conditions of the GNU General P=
ublic
> - * License.  See the file COPYING in the main directory of the Linux
> - * distribution for more details.
> - *
> - * ---------------------------------------------------------------------=
-------
> - *
>   */
>
>

> --- a/drivers/net/ethernet/8390/hydra.c
> +++ b/drivers/net/ethernet/8390/hydra.c
> @@ -1,10 +1,8 @@
> +// SPDX-License-Identifier: GPL-1.0+

Likewise.

> +
>  /* New Hydra driver using generic 8390 core */
>  /* Based on old hydra driver by Topi Kanerva (topi@susanna.oulu.fi) */
>
> -/* This file is subject to the terms and conditions of the GNU General  =
    */
> -/* Public License.  See the file COPYING in the main directory of the   =
    */
> -/* Linux distribution for more details.                                 =
    */
> -
>  /* Peter De Schrijver (p2@mind.be) */
>  /* Oldenburg 2000 */
>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
