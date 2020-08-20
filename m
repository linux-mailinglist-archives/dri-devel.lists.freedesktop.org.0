Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9610D24ACCE
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 04:02:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4615D6E88C;
	Thu, 20 Aug 2020 02:02:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5AE46E88C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 02:01:59 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id a65so254983otc.8
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 19:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a6AI5eeMLSnuHLbo6ZZjQDIfs8rhjaUq4nVIf2nIA4s=;
 b=YnPCB7GyyenNNj4m6DTSkuaI05qpfHVG/QgzwK6ZW5cfzjXcjHWN5LAYlS6/sxdjkz
 Q3B6OAL6VkfXwnio6GpcqFThGxYHL16LeanA7XHdVMfn26QoX0g+phi2xhTniJx/oG4b
 By+2BEurn0lcdeK0Stus91++uccTrtAGABYgjAbl+ipAdepdfWEyi3uEFSsTuQd5UZBx
 BRrztqVUVKEKekr/BYTkoCsnvAO2Pj7IHdqvtB+4JORdtJ9ivIHukRoFwzuDiHXHnEM+
 GW1diuJzzXcDmzpqOY7Sm35sNw8MEKZLt3qU+FvbRqjP0SgosGrMRbrNiWiPtlstFAhc
 xoVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a6AI5eeMLSnuHLbo6ZZjQDIfs8rhjaUq4nVIf2nIA4s=;
 b=kF9Q72l8RBUlw6HjTty3Y/xLqcTDqekW7smL2TSVJIg/se0pl6Hjx6P66wsrFdAkAX
 qPPgfh+ofInkwrZYMNA76Cs18yoyqb+SDgtnJHTZM4PsyWH8T+6bsqsgpqvnIIiZxNC3
 UwJhq0rFDZj+GktyXiSgYtKQ3auv7cKz2+p5f8cCG3yIWD6+eJ5CFYocAMhg79JUHTyJ
 oUWxXsTyrnKLF3ricQQ1RwRO/GN1bmws3Y1b9KZ4N6soCaGCqiLbP7425TewFLUvFvJD
 2Q+ZGyzQNsgdp8pc4yC0VXw121mIAAlBsuqlo/EJAyNqbOshBAR/8cKyFqEeiiBDoiLT
 Dz9A==
X-Gm-Message-State: AOAM531/dbdvy2Bji7cNjSghz0KrvVxpSH9ihs0LMCNum2qiuPMxwx65
 7ki0ue7itH5CvmWmbgg0iXAXUSW+JduISdmtMDq3cw==
X-Google-Smtp-Source: ABdhPJy4t5xNUInvTbrdNktpIEEwJa9WXJ3VbyfLmNGHa9Tlogcfk1xfE/pD2NZhBS1V2JSKNp49dZbkVm49zRPUArk=
X-Received: by 2002:a05:6830:237b:: with SMTP id
 r27mr528934oth.352.1597888918873; 
 Wed, 19 Aug 2020 19:01:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1597833138.git.mchehab+huawei@kernel.org>
 <CALAqxLU3bt6fT4nGHZFSnzyQq4xJo2On=c_Oa9ONED9-jhaFgw@mail.gmail.com>
In-Reply-To: <CALAqxLU3bt6fT4nGHZFSnzyQq4xJo2On=c_Oa9ONED9-jhaFgw@mail.gmail.com>
From: John Stultz <john.stultz@linaro.org>
Date: Wed, 19 Aug 2020 19:01:46 -0700
Message-ID: <CALAqxLW98nVc-=8Q6nx-wRP1z8pzkw1_zNc9M7V3GhnJQqM9rg@mail.gmail.com>
Subject: Re: [PATCH 00/49] DRM driver for Hikey 970
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Wanchun Zheng <zhengwanchun@hisilicon.com>, linuxarm@huawei.com,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, driverdevel <devel@driverdev.osuosl.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, Wei Xu <xuwei5@hisilicon.com>,
 David Airlie <airlied@linux.ie>, Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Bogdan Togorean <bogdan.togorean@analog.com>,
 Laurentiu Palcu <laurentiu.palcu@nxp.com>,
 linux-media <linux-media@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Liwei Cai <cailiwei@hisilicon.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Chen Feng <puck.chen@hisilicon.com>,
 Alexei Starovoitov <ast@kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 mauro.chehab@huawei.com, Rob Clark <robdclark@chromium.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 lkml <linux-kernel@vger.kernel.org>, Liuyao An <anliuyao@huawei.com>,
 Network Development <netdev@vger.kernel.org>,
 Rongrong Zou <zourongrong@gmail.com>, BPF Mailing List <bpf@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 19, 2020 at 2:36 PM John Stultz <john.stultz@linaro.org> wrote:
>
> On Wed, Aug 19, 2020 at 4:46 AM Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> > So, IMO, the best is to keep it on staging for a while, until those
> > remaining bugs gets solved.
> >
> > I added this series, together with the regulator driver and
> > a few other patches (including a hack to fix a Kernel 5.8
> > regression at WiFi ) at:
> >
> >         https://gitlab.freedesktop.org/mchehab_kernel/hikey-970/-/commits/master
>
> Sorry, one more small request: Could you create a branch that only has
> the DRM driver changes in it?
>
> The reason I ask, is that since the HiKey960 isn't affected by the
> majority of the problems you listed as motivation for going through
> staging. So if we can validate that your tree works fine on HiKey960,
> the series can be cleaned up and submitted properly upstream to enable
> that SoC, and the outstanding 970 issues can be worked out afterwards
> against mainline.

Just as a heads up, I tried testing your tree with my HiKey960, and
after fixing the compat string inconsistency, the drivers seem to load
properly. However the drm_hwcomposer seems to have some trouble with
the driver:
01-01 00:12:41.456   345   345 E hwc-drm-display-compositor: Commit
test failed for display 0, FIXME
01-01 00:12:41.456   345   345 E hwc-drm-two: Failed to apply the
frame composition ret=-22
01-01 00:12:41.456   351   351 E HWComposer:
presentAndGetReleaseFences: present failed for display 0: BadParameter
(4)

I'll dig in a bit further as to why, but wanted to give you a heads up.

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
