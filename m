Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8ACD584778
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 23:05:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1803810E072;
	Thu, 28 Jul 2022 21:05:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35ED010E072
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 21:05:05 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id l23so5181939ejr.5
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 14:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=MGd+LwdnoFiDkdx9krfKLdtj5Dt+fVCB4Sh2nY5wr3c=;
 b=XF5dl8tQGdES7zL4V8n959l0CmDhfnXFccMVTbYlBUZLfCjQCW2qPMmfbke3Yd/FlX
 9fABsmDUHF7O04RUphiNEmVpnNa0o23+ZIp6qz2Az2maaFB95cUS2ePsseQJdQ3OSfP2
 DThFEvF+SzgTIl3wbZG0rnpOug+EUOHtBqSFTlOlcuBSXE6F8myfgnBWOZOVb8hoCvRn
 8p7q8CTOwd6agOrclnY9O5I0Se3vNDlRCzTK7hrjbwu0o0sJN6ID6fRP9CHGgWB+HAAs
 Xnv1Czpa6LOkvjKxnkvJ9XZjINUpRvoqhTQCCbHWn+wKOjPVhKAQyOeKNsajyvA2Tl0o
 /GCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=MGd+LwdnoFiDkdx9krfKLdtj5Dt+fVCB4Sh2nY5wr3c=;
 b=Mr6DXNN8NlNSBuaItyR0KajbJSvt/nWPgN5JEsVC2ewc7rxKNVZ31uJP5bHAvmhCoy
 VWdDpSxi2FnpxHkKRgL2eDDCUc58Hg28CtpOeeu65MA+YbjhYe3o8F3kLAyKiGB0H42t
 jkuK+UiPObPovJotCQ3VfX0w+AIrq9XUl1SHjLS2MqXMcS4d8zDyhMouKPn3yQj4DYFq
 6k44ddDxfH5/AbP86DQbcixt+WL7iYyVtiZ1mCZV81f2gjjkPekHSGrEExS+SAt2A8a+
 YzucELkH/ocDbtRXed1bLwjf6T+H+cyTBK5KX0miPm1xCVd9nc3/cUoT4MLcTl66Za5+
 +kuQ==
X-Gm-Message-State: AJIora+YVj+BfGDc93m6NPZIrdHXS58GcbSAg2L68OOlADuxerXNQRHc
 irOJzH3+ooo2n+hK8ue7XR8emsZ+Gh9EwdIP338=
X-Google-Smtp-Source: AGRyM1vIJyFbUCmOiimEZBEdct0ZkX1TyGOZoJ6hXXMz38/QWz/mBQddZF4BdD7EfWT5LvGdGdK4c7G8zYJPWMb/alg=
X-Received: by 2002:a17:907:28d6:b0:72b:7497:76b with SMTP id
 en22-20020a17090728d600b0072b7497076bmr523196ejc.365.1659042302373; Thu, 28
 Jul 2022 14:05:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220728142824.3836-1-markuss.broks@gmail.com>
 <20220728142824.3836-2-markuss.broks@gmail.com> <YuKfaVG/ZbYtFjS/@kroah.com>
In-Reply-To: <YuKfaVG/ZbYtFjS/@kroah.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 28 Jul 2022 23:04:24 +0200
Message-ID: <CAHp75Vfz8e1j4qZ6XY6WqMR4E9fKFxrTxj7P6KraXzSLk_NhxQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drivers: serial: earlycon: Pass device-tree node
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
 linux-efi <linux-efi@vger.kernel.org>, Markuss Broks <markuss.broks@gmail.com>,
 Linux Documentation List <linux-doc@vger.kernel.org>,
 Tony Lindgren <tony@atomide.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Wei Ming Chen <jj251510319013@gmail.com>, phone-devel@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Borislav Petkov <bp@suse.de>, Petr Mladek <pmladek@suse.com>,
 Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michal Suchanek <msuchanek@suse.de>, Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 28, 2022 at 4:41 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Thu, Jul 28, 2022 at 05:28:18PM +0300, Markuss Broks wrote:
> > Pass a pointer to device-tree node in case the driver probed from
> > OF. This makes early console drivers able to fetch options from
> > device-tree node properties.

...

> > +     unsigned long node;
>
> That should not be an unsigned long, but rather an 'int'.  Something got
> messed up, of_setup_earlycon() should be changed to reflect this before
> propagating the error to other places in the kernel.

It's a pointer, but what puzzles me, why it can't be declared as a such:

 struct device_node *node;

?

> And it's not really a "node" but an "offset", right?

Seems no.

-- 
With Best Regards,
Andy Shevchenko
