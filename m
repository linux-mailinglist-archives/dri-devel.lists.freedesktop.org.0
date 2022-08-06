Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6708B58B72A
	for <lists+dri-devel@lfdr.de>; Sat,  6 Aug 2022 18:58:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A11B10F14E;
	Sat,  6 Aug 2022 16:58:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFA8710FA3A
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Aug 2022 16:57:11 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id b21so3967359qte.12
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Aug 2022 09:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=wj6684H6Kpz2ZtSUodC0U0fU86f1YKlziRI4r3cW+HI=;
 b=BtpSlh2x5s/SOJglV0bbuGknHlFtC17/SdHTJmS3uZdZurl45R2Le81dNFTaKIU6Od
 NXfBR45JX5zUQEBNwnkmNwVGrnem8k97ff2spSUq73FY6s+kv8gM/Ru8ze2xYNcDLMWt
 NsPHERX877627zE1v4BgU9NYY4jNndt7MBzqQ3NF4LA5pe/aFNJhYrfB/2iSJN3dvZ2k
 T3Xo23bCjCQu8n82clu06hLqSSDFmUayNmcBvRq7fAN2NcRPJulq530HBdfcA9SdaNbJ
 Cy/0MQvzHjcYAQFuGtPP1miEIcsPS2jiffpfEm4jbpjIbITcbE9I9CO0LGfjyuVWFsBk
 ls7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=wj6684H6Kpz2ZtSUodC0U0fU86f1YKlziRI4r3cW+HI=;
 b=7656l3aqXpQGO0Uqt4BAk3f5xjsnSwZA/cmfGJHYPKO3oIaH3/o7JcDhEkbQmg/Pvz
 JXlM//luKSUImOYj+1bkMFm9AJSlmrU3EDbiU00ezRQH1dDGNOt/WustUWQ9AqYaXGUy
 OyvQMWU8QnBjXObpE4xdaTXFX0ncHtUFOunABdDZzLQpGrAH0z/Yi+9h6d6ix/Vj0QEK
 BsaoWDCIPG31HeUez58WC+4JbBIMAjCw69CCa9RzEq0R+DZGzusSkmJQVkOuvA9YDpgq
 yNqzqvgEYk5hLFxG58pUGvCv2AzIALFNEkkCT1atIkdfL4l1jQiC2HcmhdUUVsfztsCl
 eyyA==
X-Gm-Message-State: ACgBeo3AJHif0ZAX+06Wck/b9lA1JncZiQb37j7nuh88iF3jSBQM6zT9
 zL/UktNpFqyWUcJIb9zXs002V5tspfXtAIiVv/0=
X-Google-Smtp-Source: AA6agR61xEI/w29pHlhpS9FZx9xdp0DX1Dk2bnjIJClh7I1yqul0PbHxwiEEgwD3NG9K2UtdJlDmFS2nsKEkKIZ0lIs=
X-Received: by 2002:ac8:5784:0:b0:31f:24e:93f5 with SMTP id
 v4-20020ac85784000000b0031f024e93f5mr10304276qta.429.1659805030863; Sat, 06
 Aug 2022 09:57:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220806163255.10404-1-markuss.broks@gmail.com>
 <20220806163255.10404-2-markuss.broks@gmail.com>
In-Reply-To: <20220806163255.10404-2-markuss.broks@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 6 Aug 2022 18:56:34 +0200
Message-ID: <CAHp75VfizQY3kw3qk0des42uAwnYmv94aWQC+fVq_QQJGp-QYQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drivers: serial: earlycon: Correct argument name
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
 ~postmarketos/upstreaming@lists.sr.ht, Michal Suchanek <msuchanek@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Aug 6, 2022 at 6:37 PM Markuss Broks <markuss.broks@gmail.com> wrote:
>
> The "node" argument is actually an offset, and it's also
> an "int", and not "unsigned long". Correct the of_setup_earlycon
> function.

Suggested-by: Greg KH?

> Signed-off-by: Markuss Broks <markuss.broks@gmail.com>

-- 
With Best Regards,
Andy Shevchenko
