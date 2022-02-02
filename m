Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8C54A6C85
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 08:53:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7015710F8D8;
	Wed,  2 Feb 2022 07:52:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 394 seconds by postgrey-1.36 at gabe;
 Wed, 02 Feb 2022 07:52:58 UTC
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 420C410F8D8
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 07:52:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id ED07FCE1B3D
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 07:46:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CF56C340EC
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 07:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643787977;
 bh=EU8FY4hoqMKIUTQTA8fc+OQEccHtNTc7RoeXbnU6SfU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=BuItHP8NJ3VXtkbWynb6fL58D8vI14aAtJOQqeabKt7MMEAa72AK+CFGNnQpytpqo
 zFiUgmkWRZwrf+q28zKBsQLk7jmQrzQM181d1WJP8fgVRSKWoI6WrXEWZWglrKZWOV
 RAMx+H0Gk2GcXw+CM1rNZ3vaWETts5L1TloD9L9nLWC78H2yPxqw+SNhznVBi4WqWd
 R+pDLwhuRMSKW4SIG4WerhpMJaNTxq3V2dTOdfavMqJr3SmPknXwzrTMeme+5L4Ubv
 d8oy6KhT/l9Usz/yfFoH4HdrAlEewUPvRtOpZ//S3/h2Lx5rp3Ti0GS5RfOEV494yi
 C4WY1WoRqkgwQ==
Received: by mail-oi1-f175.google.com with SMTP id m10so13205851oie.2
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 23:46:17 -0800 (PST)
X-Gm-Message-State: AOAM532atEkLzuhD67gSL4xQD7I0UytA6gysb+rm+sMHDY0G/1tBC/JQ
 ngDFxgJmO4G69cR5Pfc0t4upnoUh5WhdApor4AE=
X-Google-Smtp-Source: ABdhPJzP2OU6GD384wgiKPZ/tJqOrgrct7yj4Y0w9RqPGWR+zWghE43jcZK7xTpWygr/3VJ2kMrKTBbSZAzGiVkKOW8=
X-Received: by 2002:aca:f03:: with SMTP id 3mr3702970oip.102.1643787976652;
 Tue, 01 Feb 2022 23:46:16 -0800 (PST)
MIME-Version: 1.0
References: <6fc4a81f-1a13-bff9-7b2e-d5bec382cb42@synopsys.com>
 <9bab4777-3034-b789-fdf6-ca8d7e6a8c35@infradead.org>
 <CAOMZO5Aa4WxuadfoFGwwyYyD4UGPm-E258xTWU3-ozp_hwG-7g@mail.gmail.com>
 <d8981e2a-4f61-72bb-e5cc-bf4ded29c08a@synopsys.com>
In-Reply-To: <d8981e2a-4f61-72bb-e5cc-bf4ded29c08a@synopsys.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 2 Feb 2022 08:46:00 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3ELrSC=KX6cr8UnP6kkJN0AXeAE4EG4oUY=Zz7gG_dgg@mail.gmail.com>
Message-ID: <CAK8P3a3ELrSC=KX6cr8UnP6kkJN0AXeAE4EG4oUY=Zz7gG_dgg@mail.gmail.com>
Subject: Re: Kconfig CONFIG_FB dependency regression
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
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
Cc: Kees Cook <keescook@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Randy Dunlap <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 John Youn <John.Youn@synopsys.com>, Bing Yuan <Bing.Yuan@synopsys.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 2, 2022 at 1:14 AM Thinh Nguyen <Thinh.Nguyen@synopsys.com> wrote:
> Fabio Estevam wrote:
> > On Tue, Feb 1, 2022 at 8:06 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> >>
> >> On 2/1/22 15:01, Thinh Nguyen wrote:
> >>> Hi,
> >>>
> >>> One of our test setups is unable to boot (stuck at initramfs). Git
> >>> bisection points to the commit below:
> >>>
> >>> f611b1e7624c ("drm: Avoid circular dependencies for CONFIG_FB")
> >>>
> >>> Reverting this patch resolves the issue. This issue persists in mainline
> >>> also. Unfortunately there isn't any meaningful log. Hopefully someone
> >>> can give some insight as to what could be the issue and revert/fix this
> >>> issue.
> >>
> >> Hi,
> >> Did you enable DRM_FBDEV_EMULATION?
>
> I did not enable it.
>
> >> Please provide the failing .config file.
> >
> > Does selecting CONFIG_FB=y help?
> >
>
> On the config that has the issue, this isn't set. After reverting the
> commit above, this was set. Maybe this is what's needed? I need to test it.

CONFIG_FB should not normally be needed for booting, so unless
you have a graphical application in your initramfs that requires the /dev/fb0
device to work, it is not supposed to make a difference.

Are there any other differences in your .config before and after the patch?
It's possible that you use some other driver that in turn depends on
CONFIG_FB. Does your machine have any graphical output device?
If yes, which driver do you use?

You may also want to make sure that you have 9d6366e743f3 ("drm:
fb_helper: improve CONFIG_FB dependency") in your kernel, which
fixes a minor problem with my original patch.

         Arnd
