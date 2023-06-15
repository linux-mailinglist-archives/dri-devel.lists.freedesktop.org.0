Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 810057320A1
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 22:09:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FCAF10E532;
	Thu, 15 Jun 2023 20:09:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
 [209.85.166.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EE6910E532
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 20:09:04 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id
 e9e14a558f8ab-3408217cd66so12812195ab.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 13:09:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686859744; x=1689451744;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aTfjaS0IPEiXuHhWcjsCm7WS5mqkvAN6gaYW2Bcvzz4=;
 b=Knkc/3JZJcWYse5CyfwNgSCZZZmjBVhRSzMX8VmYB8woWqTB7ca8lZ/ZlTOZXbf3HZ
 2jKoETbt40x2y1GYWdiuXZrvRp25+Ug0FD9IjYDukAm8mgHL4FDzDVEJcOxmc1gCHTNN
 MUuxD8K11Uf0OXlMQbMbSOE3V+6n9U+ziij0LtCTK/2U+HNs0BVw90U+BdHYlR27bkB3
 TL3dYp0YV3jSRdvnkX4B9YZf9qNr4AhfaA+/VR8mY4fqpICCuMiQMo7Yf+KYymXdWpwt
 HGeshD3hWDvMGJWOEZ7t0RTpn/hmju2Jb0z3IKX1DNfShj6Mripk7ZDAB1+vqZTnPAMf
 zQxA==
X-Gm-Message-State: AC+VfDyYyk/0rMvTR9dyofplmt06isbNExaEty36wjwnFs7qLEP9wweY
 sr7W7bD2Rpt749GIgqDJfw==
X-Google-Smtp-Source: ACHHUZ79LfJp9RkPNTpyZJ5OtyEoIgIYPICSHb+vRi8hTHwBhSpMqkvv/DethS+ipksLPiMZ71fxMQ==
X-Received: by 2002:a92:d3c3:0:b0:340:6984:cc6f with SMTP id
 c3-20020a92d3c3000000b003406984cc6fmr478157ilh.3.1686859744059; 
 Thu, 15 Jun 2023 13:09:04 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id
 g24-20020a056638061800b004166c24e30dsm5685797jar.32.2023.06.15.13.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 13:09:03 -0700 (PDT)
Received: (nullmailer pid 1586553 invoked by uid 1000);
 Thu, 15 Jun 2023 20:09:01 -0000
Date: Thu, 15 Jun 2023 14:09:01 -0600
From: Rob Herring <robh@kernel.org>
To: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
Subject: Re: [PATCH 1/2] fbdev/offb: Update expected device name
Message-ID: <20230615200901.GA1572644-robh@kernel.org>
References: <20230412095509.2196162-1-cyril@debamax.com>
 <20230412095509.2196162-2-cyril@debamax.com>
 <ZDvrY7X9mpJ7WZ3z@eldamar.lan>
 <11b342dc-1a46-d1be-5fdd-c6eee661e15a@leemhuis.info>
 <fe3b90b0-b52f-9677-0245-a201975c3e0c@suse.de>
 <20230615132107.GA9196@kitsune.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230615132107.GA9196@kitsune.suse.cz>
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
Cc: linux-fbdev@vger.kernel.org,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Cyril Brulebois <cyril@debamax.com>, stable@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Salvatore Bonaccorso <carnil@debian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 15, 2023 at 03:21:07PM +0200, Michal Suchánek wrote:
> Hello,
> 
> On Thu, Jun 15, 2023 at 03:06:28PM +0200, Thomas Zimmermann wrote:
> > Hi
> > 
> > Am 15.06.23 um 15:03 schrieb Linux regression tracking (Thorsten Leemhuis):
> > > On 16.04.23 14:34, Salvatore Bonaccorso wrote:
> > > > 
> > > > On Wed, Apr 12, 2023 at 11:55:08AM +0200, Cyril Brulebois wrote:
> > > > > Since commit 241d2fb56a18 ("of: Make OF framebuffer device names unique"),
> > > > > as spotted by Frédéric Bonnard, the historical "of-display" device is
> > > > > gone: the updated logic creates "of-display.0" instead, then as many
> > > > > "of-display.N" as required.
> > > > > 
> > > > > This means that offb no longer finds the expected device, which prevents
> > > > > the Debian Installer from setting up its interface, at least on ppc64el.
> > > > > 
> > > > > It might be better to iterate on all possible nodes, but updating the
> > > > > hardcoded device from "of-display" to "of-display.0" is confirmed to fix
> > > > > the Debian Installer at the very least.
> 
> At the time this was proposed it was said that "of-display", is wrong,
> and that "of-display.0" must be used for the first device instead, and
> if something breaks an alias can be provided.
> 
> So how does one provide an alias so that offb can find "of-display.0" as
> "of-display"?

I'm not aware of any way. There isn't because device names and paths are 
not considered ABI. There are mechanisms for getting stable class device 
indices (e.g. i2c0, mmcblk0, fb0, fb1, etc.) though not implemented for 
fbN (and please don't add it). 

In any case, this should be an easy fix. Though if "linux,opened" or 
"linux,boot-display" is not set, then you'd still get "of-display.0":

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 78ae84187449..e46482cef9c7 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -553,7 +553,7 @@ static int __init of_platform_default_populate_init(void)
                        if (!of_get_property(node, "linux,opened", NULL) ||
                            !of_get_property(node, "linux,boot-display", NULL))
                                continue;
-                       dev = of_platform_device_create(node, "of-display.0", NULL);
+                       dev = of_platform_device_create(node, "of-display", NULL);
                        of_node_put(node);
                        if (WARN_ON(!dev))
                                return -ENOMEM;
