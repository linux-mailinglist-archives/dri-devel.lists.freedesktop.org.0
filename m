Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBF14620A5
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 20:37:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A5DC6FAC0;
	Mon, 29 Nov 2021 19:37:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 436 seconds by postgrey-1.36 at gabe;
 Mon, 29 Nov 2021 19:37:07 UTC
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE6436FAC0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 19:37:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 8C03BCE1409
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 19:29:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7C95C53FD1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 19:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638214187;
 bh=ejZQQUbAl2en4OrZqhaRxXhMmoxR9zvdS59nSPLP1lM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=YY3PaMlXoLBrfESQjX8RQcxceb1iKcgznBZeWMsye+WZkbvi/rsd5ELkuahHrN94Q
 HUDk110IP+mKnEEh+GbaT8VVe/9V2/YGV7iMuMXjR/0Et35wAMl0lKFX9fItDovgZW
 AlJE4Zaayru1SgxbPZgF3aBBsJL1wsNx5e0OXVH3lQ13F4soymFWDRJw+3kIDE8R4z
 +y/qvIbncJz6njH461bxnOn4iIuXBzRMGZixCkuAAfwbwV0+LM9ctFSQ6Dr3s4lfSk
 wGy4G8Hbh+jg/jQrkYxHEwejO9YPIVrCLubB5E+JBujDktni1sEt1uCxKJMWoKJp+/
 Pl9xCOde80Tqw==
Received: by mail-ed1-f50.google.com with SMTP id l25so76251182eda.11
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 11:29:47 -0800 (PST)
X-Gm-Message-State: AOAM530Dfz0x+8DtC0cK6MZ63pURJa659AEOinfo1J4NmwcYYjclC9Pe
 48QRQz0YA89UoXRHDCYl9St/Gtl6Ey6BlP5Paw==
X-Google-Smtp-Source: ABdhPJzsMmSxeViscHuzy0KbvAv4a0mHXQEc6+wJ70K+GZOauw3j9FEql3MZalMfGbBglVNUPZe8KEqTo3HV6S9Qg4c=
X-Received: by 2002:a17:907:16ac:: with SMTP id
 hc44mr60376458ejc.363.1638214186096; 
 Mon, 29 Nov 2021 11:29:46 -0800 (PST)
MIME-Version: 1.0
References: <20211117145829.204360-1-marcan@marcan.st>
 <20211117145829.204360-2-marcan@marcan.st>
 <f3582c00-925d-91ec-c829-0aaa8f0157c0@suse.de>
 <36f3cf18-6654-e1bf-1fa6-a5797751ee86@marcan.st>
In-Reply-To: <36f3cf18-6654-e1bf-1fa6-a5797751ee86@marcan.st>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 29 Nov 2021 13:29:34 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLd=NrZgkTw+N2+Ka4zqRVpZMRNSisUDV9MhBQA-0TZQg@mail.gmail.com>
Message-ID: <CAL_JsqLd=NrZgkTw+N2+Ka4zqRVpZMRNSisUDV9MhBQA-0TZQg@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/simpledrm: Bind to OF framebuffers in /chosen
To: Hector Martin <marcan@marcan.st>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 19, 2021 at 9:24 PM Hector Martin <marcan@marcan.st> wrote:
>
> On 18/11/2021 18.19, Thomas Zimmermann wrote:
> > Hi
> >
> > Am 17.11.21 um 15:58 schrieb Hector Martin:
> >> @@ -897,5 +898,21 @@ static struct platform_driver simpledrm_platform_driver = {
> >>
> >>    module_platform_driver(simpledrm_platform_driver);
> >>
> >> +static int __init simpledrm_init(void)
> >> +{
> >> +    struct device_node *np;
> >> +
> >> +    if (IS_ENABLED(CONFIG_OF_ADDRESS) && of_chosen) {
> >> +            for_each_child_of_node(of_chosen, np) {
> >> +                    if (of_device_is_compatible(np, "simple-framebuffer"))
> >> +                            of_platform_device_create(np, NULL, NULL);
> >> +            }
> >> +    }
> >> +
> >> +    return 0;
> >> +}
> >> +
> >> +fs_initcall(simpledrm_init);
> >> +
> >
> > Simpledrm is just a driver, but this is platform setup code. Why is this
> > code located here and not under arch/ or drivers/firmware/?
> >
> > I know that other drivers do similar things, it doesn't seem to belong here.
>
> This definitely doesn't belong in either of those, since it is not arch-
> or firmware-specific. It is implementing support for the standard
> simple-framebuffer OF binding, which specifies that it must be located
> within the /chosen node (and thus the default OF setup code won't do the
> matching for you); this applies to all OF platforms [1]
>
> Adding Rob; do you think this should move from simplefb/simpledrm to
> common OF code? (where?)

of_platform_default_populate_init() should work.
