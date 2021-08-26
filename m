Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE5E3F8440
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 11:14:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 909946E58A;
	Thu, 26 Aug 2021 09:14:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD0946E588
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 09:14:11 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 m25-20020a7bcb99000000b002e751bcb5dbso1730437wmi.5
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 02:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=ubJENgQIOzugIH6aIzu4aa5SOJeA5cH0TBu7UkdkwRo=;
 b=eWRM7qqism/66evB0/Z4A1uCvrnvkvTzAGwtb+rUwe1sPIN2AMyEYIn4BzeKGJqUoC
 JGhvessjn+k+1RDfzALVQ7b/43qoTxbHmhrfxabjnYDh33tDAFwtHDmh+cc99/k9KK+t
 5e/Btgkaw0RYWxCnueUGZR0K4Rlqxa35b/K5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=ubJENgQIOzugIH6aIzu4aa5SOJeA5cH0TBu7UkdkwRo=;
 b=dmj4nARG8IxWZ6vkCGgg9/C18732dF5eqSGFlqi20LMHylpE7i6oIWnnQJo6mm/qWT
 x0eCwrc/67IiL/0ArBnzxnj/Jj/+9cuuUi5f3sFLUyzMVpuPn2H0s9uU9e6XgQeyajQX
 wlRbjftKfxLxlaDuAaLcILwNDbNegUfgwxOhdUM3090MPdJDc7tzhLSX5Cfyh73OrRok
 wgK92Dmv6j5SH9anaUBD9olrNuyEyPR9N25zEdBi2CRCoKmmKj5tcYfqoY71hnrbSGUb
 O75IPlG/P6EOvyG4msHTM2/uw5VHEIZRT5LlDwaRa9OYVQ5+9h9xIAmN/kIUtxTztz5a
 Rjiw==
X-Gm-Message-State: AOAM530O4ql/eD7mlBgG5RbyFMllrRG1pTFVDvo1kUFhC9Ef5dU6iAmQ
 bt51jzH/ApdFp+75UCLofyKdORM+mW0Ufw==
X-Google-Smtp-Source: ABdhPJykiq+3RMvVzHhR2iD4afcW8Q8OoeIr3XVAh723gjD1Rvwc9Ym8gi6QoDtjdhPbP2Ip1lCUVg==
X-Received: by 2002:a1c:a903:: with SMTP id s3mr2538905wme.171.1629969250495; 
 Thu, 26 Aug 2021 02:14:10 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z137sm7917167wmc.14.2021.08.26.02.14.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 02:14:09 -0700 (PDT)
Date: Thu, 26 Aug 2021 11:14:07 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Daniel Vetter <daniel@ffwll.ch>, Yunfei Dong <yunfei.dong@mediatek.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Tzung-Bi Shih <tzungbi@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
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
Subject: Re: [PATCH v5, 00/15] Using component framework to support multi
 hardware decode
Message-ID: <YSdbXzCJRsj/jsnl@phenom.ffwll.local>
Mail-Followup-To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Tzung-Bi Shih <tzungbi@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>,
 Irui Wang <irui.wang@mediatek.com>,
 linux-media <linux-media@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 George Sun <george.sun@mediatek.com>
References: <20210811025801.21597-1-yunfei.dong@mediatek.com>
 <CAAEAJfDWOzCJxZFNtxeT7Cvr2pWbYrfz-YnA81sVNs-rM=8n4Q@mail.gmail.com>
 <CAKMK7uFW3Z=Up=OCJO4dNR9ffaTdFjHwoND9CrUw6LHmQ4t_AQ@mail.gmail.com>
 <CAAEAJfB3CoTU7bZe08wYEfTTm6=6UPOae9u39AtdbJ9saYknBA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAEAJfB3CoTU7bZe08wYEfTTm6=6UPOae9u39AtdbJ9saYknBA@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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

On Sun, Aug 22, 2021 at 02:57:15PM -0300, Ezequiel Garcia wrote:
> On Sun, 22 Aug 2021 at 13:50, Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Wed, Aug 18, 2021 at 4:12 PM Ezequiel Garcia
> > <ezequiel@vanguardiasur.com.ar> wrote:
> > >
> > > +danvet
> > >
> > > Hi,
> > >
> > > On Tue, 10 Aug 2021 at 23:58, Yunfei Dong <yunfei.dong@mediatek.com> wrote:
> > > >
> > > > This series adds support for multi hardware decode into mtk-vcodec, by first
> > > > adding component framework to manage each hardware information: interrupt,
> > > > clock, register bases and power. Secondly add core thread to deal with core
> > > > hardware message, at the same time, add msg queue for different hardware
> > > > share messages. Lastly, the architecture of different specs are not the same,
> > > > using specs type to separate them.
> > > >
> > >
> > > I don't think it's a good idea to introduce the component API in the
> > > media subsystem. It doesn't seem to be maintained, IRC there's not even
> > > a maintainer for it, and it has some issues that were never addressed.
> >
> > Defacto dri-devel folks are maintainer component.c, but also I'm not
> > aware of anything missing there?
> >
> 
> A while ago, I tried to fix a crash in the Rockchip DRM driver
> (I was then told there can be similar issues on the IMX driver too,
> but I forgot the details of that).
> 
> I sent a patchset trying to address it and got total silence back.
> Although you could argue the issue is in how drivers use the component
> API, AFAICR the abuse is spreaded across a few drivers, so it felt
> more reasonable to improve the component API itself, instead of changing
> all the drivers.
> 
> See below:
> 
> https://patchwork.kernel.org/project/linux-rockchip/cover/20200120170602.3832-1-ezequiel@collabora.com/

Patches get lost on the mailing list, and rockchip is one of the lesser
maintained drivers. You need to ping this stuff.

For bridge/panel I still think we should work towards removing component.c
use from them.

> > There has been discussions that in various drm subsystems like
> > drm_bridge or drm_panel a few things are missing, which prevent
> > drivers from moving _away_ from component.c to the more specific
> > solutions for panel/bridges. But nothing that's preventing them from
> > using component.c itself.
> >
> > I'm happy to merge a MAINTAINERS patch to clarify the situation if
> > that's needed.
> 
> Indeed, that would be good.

Ok I'm going to type something.
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
