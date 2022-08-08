Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E76258CBAE
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 17:56:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69D4010F31C;
	Mon,  8 Aug 2022 15:56:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5656610F4B1
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 15:56:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4F60661070
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 15:56:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7193AC43147
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 15:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659974167;
 bh=v2lgBXjNZtsYzCboM1GnlUy05vvC9EjJee5FKw0cYsQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mIHwvx+tj2BxsPEjBZ0vinsl4KXkSc+hUHjGOo+mlAFTJmKRMbMY/LMLgKCe1QNv4
 nWVNNWJGt7Id3daVXh9gG0kGjCNCY90Ec8lpHmpiS1DGviiH1Ye9GbbRrGb+16XcTk
 luRIciiAM6aSFU/64rT51FuMNb4ojhjb2dLoLIYZ+W9kTOL0L7kKvRP7p2k9OZgB3Z
 GtVeNG5fVpg6X/jx4l8owP7xHWDcjmfsPc734Gi4Kp9fRvQ5uBJr6nArf2AwQYpBwM
 SN13eiIZoUhJYu5L0DT1feKn/7/6/FgwtFdgCYbKqZXXmX4XC/KvDmagMFJjHVaUCk
 W3BZthQ+6i1fg==
Received: by mail-vk1-f182.google.com with SMTP id b81so4589956vkf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Aug 2022 08:56:07 -0700 (PDT)
X-Gm-Message-State: ACgBeo0Dpry+EVH7ojhYZuAKXFQ/ozWHnygFmEbKrbqmgH/jA+dbbVWU
 ApDn8J7tYG9rjPnZWtBokCBNOd3HpTnW+7dYuw==
X-Google-Smtp-Source: AA6agR6IlSvPTzHVkYtc/Dl9eo8Po13k4nQJVZL4SY2rHsdelBv+y2wXVK/2+5kYFhsWJQqicxm/4R8FPkDt1nisypg=
X-Received: by 2002:a1f:2dc2:0:b0:377:84fa:dbe5 with SMTP id
 t185-20020a1f2dc2000000b0037784fadbe5mr8008232vkt.15.1659974166257; Mon, 08
 Aug 2022 08:56:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220806163255.10404-1-markuss.broks@gmail.com>
 <20220806163255.10404-2-markuss.broks@gmail.com>
In-Reply-To: <20220806163255.10404-2-markuss.broks@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 8 Aug 2022 09:55:54 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJE7VzqdcoDDNw2QkDHyKr4WgOrgLwsHWJa+BwPTb=A8w@mail.gmail.com>
Message-ID: <CAL_JsqJE7VzqdcoDDNw2QkDHyKr4WgOrgLwsHWJa+BwPTb=A8w@mail.gmail.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 linux-efi <linux-efi@vger.kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
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
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
 <devicetree@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 " <~postmarketos/upstreaming@lists.sr.ht>, Michal Suchanek <msuchanek@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Aug 6, 2022 at 10:34 AM Markuss Broks <markuss.broks@gmail.com> wrote:
>
> The "node" argument is actually an offset,

It's an offset to a node in the FDT. The fact that it is an offset is
an internal implementation detail of the FDT format. So really, it's a
handle to a node. 'node' is more descriptive to its purpose.

> and it's also an "int", and not "unsigned long".

Uh, no it's not. of_flat_dt_*() functions all take an unsigned long.

Rob
