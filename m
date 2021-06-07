Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 440C439E508
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 19:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ADB56E958;
	Mon,  7 Jun 2021 17:13:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 021D86E0A6
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 17:13:52 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id g142so6708566ybf.9
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jun 2021 10:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X2sWRLPG/DuNEAApAcldlJg7iaLltjLRByHQl8QTub4=;
 b=axEtG15SmqLs7cRNPDLxPP0ciJMdYGvPisyOVlNwdgBchw8u7c9ZLFQF8q9XZAXoVe
 fSawLJJMvid3wqDthM8MS+dv+N16Q8Q1NCqu9twv7JgSEKSNAn6T4fic9im8N11+LqNJ
 zmUEHLkSSiFVUbSyObu4y2pqLoEAPCFW9QSt2NEbzreKnPbV996Vg95fVGUYbuBJkjYj
 4Q3TbZCJ8Cpk/Ny1jgKI4BPFw6jxmQgeB9af2njqnoPapJTq2BP4+6KdvTwrEavFFKs/
 FkOWHsxfPb8gYdnmITfIYEPtAPmcaSg3LQtFgyto+9LwZq3NnxxkYWHeSksL39NGv459
 vOxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X2sWRLPG/DuNEAApAcldlJg7iaLltjLRByHQl8QTub4=;
 b=Pgv35t8RTJRfvAGX6yc5ju8wf8fWaf1u0ytPGxDfNLd6HRdW+U/1b6cPUq75Sp4dIu
 35+ZHBsOfrhbm22ZCUsO6AocrqOiUTkJ9J42pZDl1QCxduSqssWvXgsTmZThgmOfaUXU
 Y59K5r2sSIHZT5A6BnfYrjG8k6tR+UPwigqBZSwwV+lcSGwFIU8cQ89qLV5sqLHWoGz9
 R6UGGSD390x45sdMWgbeHcUjEIrT0Q+b3hEDc2fSQ62c/gmbUqT6/pBtM1C6cIs/ChvC
 NXqD6CeF0mrYRf0j1o2EsGfhatqWx/8UD1Pr8ooJE5Rk/8Qt+QnarbYNCCll70tPpmCD
 Q8Zg==
X-Gm-Message-State: AOAM5327XMaJhZf2SYxXFBOF+/ixpu8+R1w1v+qQQRSLK3iahHlNio4l
 fc3/b5lRPTYzvRJkZxqySkAWFLlj+E4F//9riQDaNg==
X-Google-Smtp-Source: ABdhPJwdmdD7lKRRq8k5XA8hFlIx/dEaUtuNmHO6Lre9fhKf0b+w+tgKMfisGp4de674sb5QMAE3GO/pM514c6iWKLc=
X-Received: by 2002:a25:cbc9:: with SMTP id b192mr26086185ybg.96.1623086031875; 
 Mon, 07 Jun 2021 10:13:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210607085836.2827429-1-megous@megous.com>
 <20210607114146.ohiqf4ousibfu4wm@gilmour>
In-Reply-To: <20210607114146.ohiqf4ousibfu4wm@gilmour>
From: Saravana Kannan <saravanak@google.com>
Date: Mon, 7 Jun 2021 10:13:15 -0700
Message-ID: <CAGETcx-ZH2egh4kNpAL8CTGTVo21nP8aYpU_W+UHZ_GLJDeLaw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/sun4i: dw-hdmi: Make HDMI PHY into a platform
 device
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Ondrej Jirman <megous@megous.com>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR ALLWINNER DE2 AND DE3 ENGINE"
 <dri-devel@lists.freedesktop.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 7, 2021 at 4:41 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Mon, Jun 07, 2021 at 10:58:36AM +0200, Ondrej Jirman wrote:
> > From: Saravana Kannan <saravanak@google.com>
> >
> > On sunxi boards that use HDMI output, HDMI device probe keeps being
> > avoided indefinitely with these repeated messages in dmesg:
> >
> >   platform 1ee0000.hdmi: probe deferral - supplier 1ef0000.hdmi-phy
> >     not ready
> >
> > There's a fwnode_link being created with fw_devlink=on between hdmi
> > and hdmi-phy nodes, because both nodes have 'compatible' property set.
> >
> > Fw_devlink code assumes that nodes that have compatible property
> > set will also have a device associated with them by some driver
> > eventually. This is not the case with the current sun8i-hdmi
> > driver.
> >
> > This commit makes sun8i-hdmi-phy into a proper platform device
> > and fixes the display pipeline probe on sunxi boards that use HDMI.
> >
> > More context: https://lkml.org/lkml/2021/5/16/203
> >
> > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > Signed-off-by: Ondrej Jirman <megous@megous.com>
>
> Applied, thanks
> Maxime

Thanks everyone! And thanks for following up on this Ondrej!

-Saravana
