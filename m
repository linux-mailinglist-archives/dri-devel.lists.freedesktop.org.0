Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D29F824A895
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 23:37:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 578EB6E836;
	Wed, 19 Aug 2020 21:37:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E09B6E83B
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 21:37:05 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id a65so20264314otc.8
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 14:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CS+1467DMyFTqT+L2iSQMSr95xvUjx22mgQhPk7Fd0U=;
 b=Ta+g1ZgTNyWRyOadjtYmnLrqkRKTp1Yqu3v85C1PlgWit/t/GfBuyJrf7KkLtWIp5c
 obzIbdbmc69nlF0yFwItQxDewv3hhDIcu4hovzlskeqJwIK5mpzk6z3aUtqJgZ+DSflY
 89K5nsJMI1E2px6cL3lCPAuXNqy6alXpd5Y8B86lVTMT5axCkRcmg1r9PnfhQ5ysxkGw
 xuEboslpGgpoBK6kcsX6zimi7fbM/InmxLfMxBl2sylTbbrjYVKKzRv0miXc9y+CbO46
 JPua5bOPXgPoLuzKVJq2PfJRU09D5n/WRI+3dX0QohzqYTWhWbS5DQscx/5yGjUDXe5V
 X2jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CS+1467DMyFTqT+L2iSQMSr95xvUjx22mgQhPk7Fd0U=;
 b=Rn0Gi+CUwvSd9xxMdLl5xNDM1ax3xLglh888gV5RfNjdKjhvtjbcRZgRCvAS4YAbc8
 OMc+Xs/711r9+segAKADz9fk72Ed88Rs5NydlhU534P9MO0fcL5bklIllR3xYnc3OMRO
 SAUd7Aqm+B7YdHpyBLCAP+NEgFOu7+j3tFLj2CZzoZAoo+8rcWErVZp2HLLQFufip704
 48ccJX2m069s972xlAuUmKlkVBf56DJYmwfkoWduyrO2xYUxURxNN5sfIkwjYX89Fwhr
 Cr98urVdE+XImrBIXppQoY/eIlpxITAnICeLIMGB+snHa5qDz+kqjymh/MwbuFmTI7Br
 6zOA==
X-Gm-Message-State: AOAM530aOHoCaPV6VRi3d/5iABkVHgCJb+0Z49dn/8sdGJSdy+8A4LlF
 nMnWl95Nmc1szltLFE55xyAOlF/dIA/72Qm132mnpg==
X-Google-Smtp-Source: ABdhPJxpl82rAqK2FHLd0zX7VnPn8+94l8zujbb1JUnY5F6i+DaLJ+lsZzhjUgUndjPKQh1QUFVxfaVx/wGs30VKOyU=
X-Received: by 2002:a05:6830:3196:: with SMTP id
 p22mr21167646ots.102.1597873024596; 
 Wed, 19 Aug 2020 14:37:04 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1597833138.git.mchehab+huawei@kernel.org>
In-Reply-To: <cover.1597833138.git.mchehab+huawei@kernel.org>
From: John Stultz <john.stultz@linaro.org>
Date: Wed, 19 Aug 2020 14:36:52 -0700
Message-ID: <CALAqxLU3bt6fT4nGHZFSnzyQq4xJo2On=c_Oa9ONED9-jhaFgw@mail.gmail.com>
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
 John Fastabend <john.fastabend@gmail.com>,
 Xiubin Zhang <zhangxiubin1@huawei.com>, Wei Xu <xuwei5@hisilicon.com>,
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

On Wed, Aug 19, 2020 at 4:46 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
> So, IMO, the best is to keep it on staging for a while, until those
> remaining bugs gets solved.
>
> I added this series, together with the regulator driver and
> a few other patches (including a hack to fix a Kernel 5.8
> regression at WiFi ) at:
>
>         https://gitlab.freedesktop.org/mchehab_kernel/hikey-970/-/commits/master

Sorry, one more small request: Could you create a branch that only has
the DRM driver changes in it?

The reason I ask, is that since the HiKey960 isn't affected by the
majority of the problems you listed as motivation for going through
staging. So if we can validate that your tree works fine on HiKey960,
the series can be cleaned up and submitted properly upstream to enable
that SoC, and the outstanding 970 issues can be worked out afterwards
against mainline.

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
