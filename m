Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 214E2701D8D
	for <lists+dri-devel@lfdr.de>; Sun, 14 May 2023 15:08:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4917389F27;
	Sun, 14 May 2023 13:08:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E1B310E05F
 for <dri-devel@lists.freedesktop.org>; Sun, 14 May 2023 13:08:32 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-643557840e4so12682660b3a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 14 May 2023 06:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684069711; x=1686661711;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:sender
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y5XEouAH/P1Pc1xR/i0kwTIYjZQ4lEbXoXqgUXs2Qrc=;
 b=JgFgXkWGfmHspAu7HjxcvhDThdTjCYb1GNamypAn0LCFacWj8H5PF8YNDKsh/tltmv
 LqdKH0NNZhsyay3GsncvplLD3ClamfUcj0OyLTHNhYu9JaddW/YiogoN5e0ZyVELkp0R
 KTQ/K5Sn/xBtjAra7xamVhMaa1QU94H6fvOpT4+AqUlfDjFYBsVyt/meC8Jj4tZo1sbR
 586YES8hrpWNVFyydRbUXQL6dvIElCzLk2YWjgEmqvytADeUUHamD87e09ZifRyBLLio
 6yfsTPDGlXTuK79WwdedbhKlxetYYbIcNS4hYFQl+hr9HZMGmSmNi+xdUho7RYx/SL60
 dI2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684069711; x=1686661711;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:sender
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y5XEouAH/P1Pc1xR/i0kwTIYjZQ4lEbXoXqgUXs2Qrc=;
 b=XOjUrUYRHBLQuwX20H+nSS7QnB+USjjYMsYz0TrKO2fwboFyv8PGJN8sukd39BHDqD
 WBvfN6LUoG6hZWVdNU7Tqq/RsgK7WzkVpwWCUyFsN5v4rtlFxREEe5UEdBCKZoqoftw5
 nzv0ByLZERm/01JBwBpy9GNnSfQoYUR2v/rNNdNIoUhcDlTJ3J3HWwXa1wCzKBAjZjBC
 P36+J40kh55BKDMUHXDAAjU82wOqz3udt8Wvw+QdnjR4D1d4wR/B1Es/SJkXf00DRqP/
 vkT0kktMoRq/jejDI13E80aF3DaFrWZOnnnTzj7ESeuiDUnt+eFkxGryh0ne261tI5Vk
 aFVg==
X-Gm-Message-State: AC+VfDwUprG5KSCagZgGfl9eE1e10zZ1WeV3Ir9pdCyDHVSmLlhA4hhv
 1envO9RMTMbpzi9sA0gbDco=
X-Google-Smtp-Source: ACHHUZ5ut8+Hg2HyxrT4MXIOvyVb3bS836tjfmXkxs1tJNydk4q379JJXY2tKiMm5x8T7vuA9c0e3w==
X-Received: by 2002:a05:6a20:3d28:b0:103:9c25:99a3 with SMTP id
 y40-20020a056a203d2800b001039c2599a3mr18361027pzi.59.1684069711559; 
 Sun, 14 May 2023 06:08:31 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 b30-20020a631b1e000000b0050bd4bb900csm9760255pgb.71.2023.05.14.06.08.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 May 2023 06:08:30 -0700 (PDT)
Date: Sun, 14 May 2023 06:08:29 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 08/10] drivers: watchdog: Replace GPL license notice
 with SPDX identifier
Message-ID: <511814a0-0c42-4813-9473-13748d6c6cb0@roeck-us.net>
References: <20230512100620.36807-1-bagasdotme@gmail.com>
 <20230512100620.36807-9-bagasdotme@gmail.com>
 <CAC1cPGy=78yo2XcJPNZVvdjBr2-XzSq76JrAinSe42=sNdGv3w@mail.gmail.com>
 <ef31b33f-8e66-4194-37e3-916b53cf7088@gmail.com>
 <CAC1cPGzznK8zoLaT1gBjpHP1eKFvTKKi+SW6xuXF3B8aHN27=g@mail.gmail.com>
 <2023051414-headroom-maimed-553c@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2023051414-headroom-maimed-553c@gregkh>
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
 Simon Horman <simon.horman@corigine.com>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Richard Fontana <rfontana@redhat.com>, Eric Dumazet <edumazet@google.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Jonas Jensen <jonas.jensen@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Andy Gospodarek <andy@greyhouse.net>,
 Sylver Bruneau <sylver.bruneau@googlemail.com>, Marc Zyngier <maz@kernel.org>,
 Linux Staging Drivers <linux-staging@lists.linux.dev>,
 Linux SPDX Licenses <linux-spdx@vger.kernel.org>,
 Oleg Drokin <green@crimea.edu>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrey Panin <pazke@donpac.ru>,
 Sam Creasey <sammy@sammy.net>,
 Linux Watchdog Devices <linux-watchdog@vger.kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Jay Vosburgh <j.vosburgh@gmail.com>,
 Jan Kara <jack@suse.com>,
 Linux Kernel Actions <linux-actions@lists.infradead.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Andrew Sharp <andy.sharp@lsi.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 David Airlie <airlied@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Ray Lehtiniemi <rayl@mail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Alan Cox <alan@linux.intel.com>, Alessandro Zummo <a.zummo@towertech.it>,
 Karsten Keil <isdn@linux-pingi.de>, Linux Networking <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
 Denis Turischev <denis@compulab.co.il>,
 Diederik de Haas <didi.debian@cknow.org>,
 Philippe Ombredanne <pombredanne@nexb.com>,
 "David S. Miller" <davem@davemloft.net>, Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, May 14, 2023 at 12:07:28AM +0900, Greg Kroah-Hartman wrote:
> On Sat, May 13, 2023 at 09:43:39AM -0400, Richard Fontana wrote:
> > On Sat, May 13, 2023 at 6:53 AM Bagas Sanjaya <bagasdotme@gmail.com> wrote:
> > >
> > > On 5/12/23 19:46, Richard Fontana wrote:
> > > > On Fri, May 12, 2023 at 6:07 AM Bagas Sanjaya <bagasdotme@gmail.com> wrote:
> > > >
> > > >
> > > >> diff --git a/drivers/watchdog/sb_wdog.c b/drivers/watchdog/sb_wdog.c
> > > >> index 504be461f992a9..822bf8905bf3ce 100644
> > > >> --- a/drivers/watchdog/sb_wdog.c
> > > >> +++ b/drivers/watchdog/sb_wdog.c
> > > >> @@ -1,3 +1,4 @@
> > > >> +// SPDX-License-Identifier: GPL-1.0+
> > > >>  /*
> > > >>   * Watchdog driver for SiByte SB1 SoCs
> > > >>   *
> > > >> @@ -38,10 +39,6 @@
> > > >>   *     (c) Copyright 1996 Alan Cox <alan@lxorguk.ukuu.org.uk>,
> > > >>   *                                             All Rights Reserved.
> > > >>   *
> > > >> - *     This program is free software; you can redistribute it and/or
> > > >> - *     modify it under the terms of the GNU General Public License
> > > >> - *     version 1 or 2 as published by the Free Software Foundation.
> > > >
> > > > Shouldn't this be
> > > > // SPDX-License-Identifier: GPL-1.0 OR GPL-2.0
> > > > (or in current SPDX notation GPL-1.0-only OR GPL-2.0-only) ?
> > > >
> > >
> > > Nope, as it will fail spdxcheck.py. Also, SPDX specification [1]
> > > doesn't have negation operator (NOT), thus the licensing requirement
> > > on the above notice can't be expressed reliably in SPDX here.
> > >
> > > [1]: https://spdx.github.io/spdx-spec/v2.3/SPDX-license-expressions/
> > 
> > The GPL identifiers in recent versions of SPDX include an `-only` and
> > an `-or-later` variant.
> 
> But Linux does not use the newer versions of SPDX given that we started
> the conversion before the "-only" variant came out.  Let's stick with
> the original one please before worrying about converting to a newer
> version of SPDX and mixing things up.
> 

Either case I'd prefer to have no conversion if there is no means
to express the original license (ie GPL-1.0 or GPL-2.0 and nothing else)
in acceptable SPDX form.

Thanks,
Guenter
