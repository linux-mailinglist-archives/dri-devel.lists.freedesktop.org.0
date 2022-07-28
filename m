Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 538EC58477F
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 23:07:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E73610E081;
	Thu, 28 Jul 2022 21:07:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50E7E10E1E4
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 21:07:06 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id va17so5301971ejb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 14:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=Ab/60a7ap/TF4pOEKknPkIZ19AphsfkpAIUOdyILIjA=;
 b=BFQmBltvDWAyd4EdZYjsfo++kYP1bOdlRa9ZabzH2Q0s39aOYP2Y9NvADlWYjuszT/
 sTTbfR4WsUrQknG5OkKNVhyCz2YsQOcE9D9ycG3InxB3xxFnjWNuAaBCGKkZG8wkajtr
 Rpp0Ou4GkMHSI5QluJniDpEFg8FcoBv+Mlo3lDJPwnQlcSxPqoxWG/+x5BX1rqPDSLBE
 vEbHIgLuYsOWUV80Eb7WOysCdlpoNo2GuSdJhK3dUVp3ETfDy7wn/8SpsbiqL3dGH3pD
 cu3dPlrqBZ+j7I4xlFNAWN7vdVcdt94CO3SHK3O5euZXrxoISXO6IN8cqUKHG+Dfo6N+
 oZ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=Ab/60a7ap/TF4pOEKknPkIZ19AphsfkpAIUOdyILIjA=;
 b=N9eBNMa61hxgrOgxteNS1XbeC23SdkBP2CnhJstDdgk5/01qr3qilFe9TCLB37ky9V
 umOtKT5g4WLanmE+cRK8Ot5vkJkUYUsY3xl53+sWFqcEf1hJp5mHe7QG7nyf+3sKOaUD
 hDciFlegoVE36jKNU6MznGKVACJEURVjjY+fIc9hsigM7bCkCdtZkQpkcP7knl0LBBCn
 Ei2MLigg4SfhGmXWbKsqPl4ocEIVbuhdZOo3J1dZJcuGPvnno7wTMQUoHZtF9ibpQCta
 b7Qbbvowdjx6tPG8HPxnjIR3oUKBTpEetY9mUA14/esk8ZDCq62tK7NKkLRVuq3gU/2z
 lpkg==
X-Gm-Message-State: AJIora+ojJ3JzJghjWrg30rQNV9Wed8hFaxbsS7fAgweAUmveK82Eyjr
 lWkTRc40TGr4wpctciM9iGLpPNNz2JIq+FVPvAU=
X-Google-Smtp-Source: AGRyM1tRri2yxGEFn1QQ0Ft0YIQaCW8e+5RgcNCLhZwZ5P2GWyRFBLmCsyKL5A2sFwjM3h12cHNdVratAckuZRN8iZI=
X-Received: by 2002:a17:907:6e02:b0:72b:9f16:1bc5 with SMTP id
 sd2-20020a1709076e0200b0072b9f161bc5mr564451ejc.676.1659042424819; Thu, 28
 Jul 2022 14:07:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220728142824.3836-1-markuss.broks@gmail.com>
 <20220728142824.3836-3-markuss.broks@gmail.com> <YuKfnAjB4gV0ki4A@kroah.com>
 <30ce6f21-0a91-81cb-8b03-5acff17c59ee@gmail.com>
In-Reply-To: <30ce6f21-0a91-81cb-8b03-5acff17c59ee@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 28 Jul 2022 23:06:27 +0200
Message-ID: <CAHp75VeNM5vc58WAOLwHnhpDBwMk_FbzfnNRAEUDdZTBq9L73w@mail.gmail.com>
Subject: Re: [PATCH 2/2] efi: earlycon: Add support for generic framebuffers
 and move to fbdev subsystem
To: Markuss Broks <markuss.broks@gmail.com>
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
Cc: "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 linux-efi <linux-efi@vger.kernel.org>,
 Linux Documentation List <linux-doc@vger.kernel.org>,
 Tony Lindgren <tony@atomide.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Wei Ming Chen <jj251510319013@gmail.com>, phone-devel@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Borislav Petkov <bp@suse.de>, Kees Cook <keescook@chromium.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michal Suchanek <msuchanek@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 28, 2022 at 4:58 PM Markuss Broks <markuss.broks@gmail.com> wrote:
> On 7/28/22 17:39, Greg Kroah-Hartman wrote:
> > On Thu, Jul 28, 2022 at 05:28:19PM +0300, Markuss Broks wrote:

> >>   delete mode 100644 drivers/firmware/efi/earlycon.c
> >>   create mode 100644 drivers/video/fbdev/earlycon.c
> >
> > That should be a rename, not a delete/create, right?
>
> Should this change be split into two separate commits,
> one for moving the file and the second for making changes?

I think it's a pointer to use `git format-patch -M -C ...` when
preparing patches.

-- 
With Best Regards,
Andy Shevchenko
