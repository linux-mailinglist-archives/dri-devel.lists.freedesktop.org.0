Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A987D560A00
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 21:09:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C7B10E164;
	Wed, 29 Jun 2022 19:09:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D14EE10E164;
 Wed, 29 Jun 2022 19:09:17 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id c13so23505541eds.10;
 Wed, 29 Jun 2022 12:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OrNvgOY5RAk72nhKHu4tyOFGjEav6bi7u0FirHs24tE=;
 b=DvOFtZaNKDm/WCuIFcpQJZv28h688eY2HFandqL4paFlKxliJC/6kniZE2t/Yi/Qz9
 Ij3D9uYIeaCXSM9RpxYH4r6fbiuT7vVtb7st/BUsqnSkEaKcX4xpIjXhMTchEoyufBPg
 YYvFs9J9gME5pcIhcISYzNLX7Q+g8R+0FEXAL6qQX1bWW+Zc2x+LzYnRybuZKip1X8EZ
 hU1xjPWgPEhMPGqvJRCfACH1igNu29j9LOG+1pwLxTmLYKl8rK3Am9DIPNBIdcTnAcCg
 Ko7nfovKa3Sul2CudLFgviFL5rAPCpmsa5QKvisKC9VbUZ0/AQgWMtIUOXOJGlS2OumF
 68GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OrNvgOY5RAk72nhKHu4tyOFGjEav6bi7u0FirHs24tE=;
 b=lCFtjW3mt1bkJBEdqVM2hpuJoY73BTIRwlOYqXtD2mxdr49FCM2kdwXwUD/jH3isoF
 tz9YT+xKJB5QyFPebywHzHsBeqcKPJQWH/LjKzohFwGU9bW5y+sPbWNZ+MzNST/XgM7r
 OWyIT4oUBcxXt3m0mGf8fMmOZuF0CmngIpvVqEDWG8E1tMyaYvVj6WvgGtFjyshFMPAN
 OYgcQOEdnFcGf+uwzlHq/XAnFm6DX5yAGKBrXli3XwFtvPuVk//jUY1FStU4sbi5Jr65
 fUdrFebF/Xwi/Zr2kp4VuGPcQVwtefzIpsVK2EF36HOh4MJr/rigQKxCTKK/Hqf7c7Tn
 rpwQ==
X-Gm-Message-State: AJIora+ha+fwzUrOwe2HvqXDGvHqAxjxU20TXi7sYHmc+VrQAee234oI
 JcJyh2CTWvgm2yqNn1DLM1+vK40rdGNsOn44uEY=
X-Google-Smtp-Source: AGRyM1vljw0OPVPx4ePeNz3ebYUJM/CaHXL4aCrVgrLX7hD32ZeMCrkQJZQGH1yvRCYitDnbf/mb8XUvdiNzz3agC+s=
X-Received: by 2002:a05:6402:158e:b0:435:7d0f:ac85 with SMTP id
 c14-20020a056402158e00b004357d0fac85mr6191148edv.93.1656529756386; Wed, 29
 Jun 2022 12:09:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220629172316.2f28afeb@canb.auug.org.au>
 <e10b5fa0-095d-d5d7-9fe7-5e1620d9cd27@infradead.org>
In-Reply-To: <e10b5fa0-095d-d5d7-9fe7-5e1620d9cd27@infradead.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 29 Jun 2022 15:09:03 -0400
Message-ID: <CADnq5_OR270zrjsYFM=6o5dAxusBfdav92b+qgWMaWJf50fqpg@mail.gmail.com>
Subject: Re: linux-next: Tree for Jun 29 (gpu/drm/amd/display/dc/)
To: Randy Dunlap <rdunlap@infradead.org>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 29, 2022 at 3:05 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
>
>
> On 6/29/22 00:23, Stephen Rothwell wrote:
> > Hi all,
> >
> > Changes since 20220628:
> >
>
> on i386:
>
> ld: drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.o: in function `dcn32_init_clocks':
> dcn32_clk_mgr.c:(.text+0x70d): undefined reference to `__nedf2'
> ld: dcn32_clk_mgr.c:(.text+0x9bf): undefined reference to `__floatunsidf'
> ld: dcn32_clk_mgr.c:(.text+0xa03): undefined reference to `__muldf3'
> ld: dcn32_clk_mgr.c:(.text+0xa37): undefined reference to `__muldf3'
> ld: drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.o: in function `dcn32_calculate_cab_allocation':
> dcn32_hwseq.c:(.text+0xda): undefined reference to `__umoddi3'
> ld: dcn32_hwseq.c:(.text+0x112): undefined reference to `__umoddi3'
> ld: dcn32_hwseq.c:(.text+0x16d): undefined reference to `__umoddi3'
>

Siqueira is working on this.  Patch should be available soon.

Alex


>
> Full randconfig file is attached.
>
>
> --
> ~Randy
