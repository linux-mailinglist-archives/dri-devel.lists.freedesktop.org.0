Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 197ED3F40C1
	for <lists+dri-devel@lfdr.de>; Sun, 22 Aug 2021 19:57:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC4E589D81;
	Sun, 22 Aug 2021 17:57:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6D6F89D81
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Aug 2021 17:57:27 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id s16so14857364ilo.9
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Aug 2021 10:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tO3FpggPumUudO2O7Ir/fs1af6Qf8hcFO9g7I6cp01Q=;
 b=NDkEoB50cJIffh8DEmD3xfV5OH8ema/PjNX2L8kixdAdzju1+1Q+RfI4dvsWmf6ckV
 cbsUqLyLFzaRWyrxKHgk9HO+WkFNp66FjMC0xCvO73mpe2AOuKEOT9losiWcUW3PDPNm
 I0Juj2PjGLAqKt2+Iz9cmX6gBy5MzrvAzxAH8s1TYKJbJaqQKfMgWI5aiYeXRCwwh3kd
 CJI4TEZHABSCNMA2IhdFQIizIVfW37pxWIzkxkAqqzqK5tmPuWInXDStw52NSqp8XXny
 pVSXtZOL/inFPT0NN6u8kmBCcSiariw/dIe5ePYIn0HTiy7GwQL7GtGEqlmgztShSjIB
 r2/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tO3FpggPumUudO2O7Ir/fs1af6Qf8hcFO9g7I6cp01Q=;
 b=gKduicQnzYCzNyMOleYqaU6ajcJx7+InobIy7lO90Edq0FPRRc6lDL+aybgRmiZG0S
 GwV0UehSGdsbpcsoFUxflSj1vyNu7es8S1yxvV4l4VAZagNUJOVo+B+MWhM1qgrChPFc
 3zOmjAR3X3Ozt7DynER/pnAlg8XmS6TdBXJIeUZObOCS0f/MV+arcR7FCZFPXMtIRrPw
 Z6b0IyCuMcDyFuSG1IhPWXMWqprei43Uu8nR1GH53CBePgpYTBY6eJQGtIuB7lxkehxp
 RzrZTBesdkOX3WcD/mJ64JAKCdzDpbR3zvSsL3n4dujle3R2MBUzrB+mZFwVyedBdV98
 Xt2A==
X-Gm-Message-State: AOAM5304dDTsTkWATuAYV11OkCCMRQ9CnBqeZQuQfrq2FgyPV3Rj1Avs
 HR/8kDVunyyMeBf5AsnjlWe3Vp+UasQM2IemV2AOVQ==
X-Google-Smtp-Source: ABdhPJxAy4F4JBrNf2BEXyC2jHsLYTKqTZpEvWl47iBJSnZyLzmCveu6cLApJEwjHW6shDTLnoCxAWArc0HfBTHBbuc=
X-Received: by 2002:a92:ca89:: with SMTP id t9mr21038515ilo.178.1629655046630; 
 Sun, 22 Aug 2021 10:57:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210811025801.21597-1-yunfei.dong@mediatek.com>
 <CAAEAJfDWOzCJxZFNtxeT7Cvr2pWbYrfz-YnA81sVNs-rM=8n4Q@mail.gmail.com>
 <CAKMK7uFW3Z=Up=OCJO4dNR9ffaTdFjHwoND9CrUw6LHmQ4t_AQ@mail.gmail.com>
In-Reply-To: <CAKMK7uFW3Z=Up=OCJO4dNR9ffaTdFjHwoND9CrUw6LHmQ4t_AQ@mail.gmail.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Sun, 22 Aug 2021 14:57:15 -0300
Message-ID: <CAAEAJfB3CoTU7bZe08wYEfTTm6=6UPOae9u39AtdbJ9saYknBA@mail.gmail.com>
Subject: Re: [PATCH v5, 00/15] Using component framework to support multi
 hardware decode
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Tzung-Bi Shih <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Fritz Koenig <frkoenig@chromium.org>, Irui Wang <irui.wang@mediatek.com>, 
 linux-media <linux-media@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 srv_heupstream <srv_heupstream@mediatek.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 George Sun <george.sun@mediatek.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 22 Aug 2021 at 13:50, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Aug 18, 2021 at 4:12 PM Ezequiel Garcia
> <ezequiel@vanguardiasur.com.ar> wrote:
> >
> > +danvet
> >
> > Hi,
> >
> > On Tue, 10 Aug 2021 at 23:58, Yunfei Dong <yunfei.dong@mediatek.com> wrote:
> > >
> > > This series adds support for multi hardware decode into mtk-vcodec, by first
> > > adding component framework to manage each hardware information: interrupt,
> > > clock, register bases and power. Secondly add core thread to deal with core
> > > hardware message, at the same time, add msg queue for different hardware
> > > share messages. Lastly, the architecture of different specs are not the same,
> > > using specs type to separate them.
> > >
> >
> > I don't think it's a good idea to introduce the component API in the
> > media subsystem. It doesn't seem to be maintained, IRC there's not even
> > a maintainer for it, and it has some issues that were never addressed.
>
> Defacto dri-devel folks are maintainer component.c, but also I'm not
> aware of anything missing there?
>

A while ago, I tried to fix a crash in the Rockchip DRM driver
(I was then told there can be similar issues on the IMX driver too,
but I forgot the details of that).

I sent a patchset trying to address it and got total silence back.
Although you could argue the issue is in how drivers use the component
API, AFAICR the abuse is spreaded across a few drivers, so it felt
more reasonable to improve the component API itself, instead of changing
all the drivers.

See below:

https://patchwork.kernel.org/project/linux-rockchip/cover/20200120170602.3832-1-ezequiel@collabora.com/

> There has been discussions that in various drm subsystems like
> drm_bridge or drm_panel a few things are missing, which prevent
> drivers from moving _away_ from component.c to the more specific
> solutions for panel/bridges. But nothing that's preventing them from
> using component.c itself.
>
> I'm happy to merge a MAINTAINERS patch to clarify the situation if
> that's needed.

Indeed, that would be good.

Thanks,
Ezequiel
