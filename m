Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1AA164307
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 12:10:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B79216EB79;
	Wed, 19 Feb 2020 11:10:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA8D6EB74;
 Wed, 19 Feb 2020 11:10:31 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id w6so13520058otk.0;
 Wed, 19 Feb 2020 03:10:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/NX5ceDqIV7WVNc3pBnsDW/m3e7ZJ2oxuTCXQrMyW8s=;
 b=PZH1NKWtKrdY+jj5kbkuosJ0aNM6b83vwMeTH8HchIdu/g9eC8HigaDTulvCWcH16e
 JDXRUEh9ZAWcO/ARNCvJJWXXYvRCIDC8co2Ejbkw42tAhYfCy+7UyCZtwFUKwVDsHfqC
 EiOkbZyMO1GhOnbvjId4+2qoSQwRjaSJim1h9ztftX7cMWp6qUF3+2adGaROJ9r6Ib3D
 NH0Zc4FC+Q33gwhVLVGmyf0MTf2pJvZLw8aSBKYYn33HGgSRiCAVkfTEn3GCkdGbN5qN
 JKum2NlckoW+d4Pk0Rp9pFGWQ7EKcmPi35yYOf5XiQGzIKgl9uPz2Deq7qx3t9KrXNGW
 dhUQ==
X-Gm-Message-State: APjAAAWkW3Y7CFpbh83zusT3J+PG+G4bg5PZhT3ys4M1PAK0EZ3vAIvH
 beHas/CZhKX88Q+JH8yqQt+kRSRZROd2UeP6ELU=
X-Google-Smtp-Source: APXvYqxql6BAhwRUVZRPJrS4LrG01VTwbHIl62kTaJTecfK6ByLjkHKBo+ODe9FhQtwenBzg75scXAlzuss3vvgpcKo=
X-Received: by 2002:a9d:dc1:: with SMTP id 59mr19334928ots.250.1582110630329; 
 Wed, 19 Feb 2020 03:10:30 -0800 (PST)
MIME-Version: 1.0
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
 <20200219102122.1607365-38-daniel.vetter@ffwll.ch>
 <CAMuHMdXit+F2nK8JSXyzP26epeDA3pxOYyzVMFtKWqaGCNqBxA@mail.gmail.com>
 <CAKMK7uFrzjAOxBK0GBPtHt=VGRjvC3GJcOTvP087gyO1nAEVPQ@mail.gmail.com>
In-Reply-To: <CAKMK7uFrzjAOxBK0GBPtHt=VGRjvC3GJcOTvP087gyO1nAEVPQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Feb 2020 12:10:18 +0100
Message-ID: <CAMuHMdUBKJTcPg8GB_c52p8jXWqdn8JX3tiPxsQkRRW2EA3+yA@mail.gmail.com>
Subject: Re: [PATCH 37/52] drm/rcar-du: Drop explicit drm_mode_config_cleanup
 call
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Wed, Feb 19, 2020 at 11:57 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> On Wed, Feb 19, 2020 at 11:30 AM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Wed, Feb 19, 2020 at 11:22 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > > It's right above the drm_dev_put().
> > >
> > > Aside: Another driver with a bit much devm_kzalloc, which should
> > > probably use drmm_kzalloc instead ...
> >
> > What's drmm_kzalloc()?
> > The only references I can find are in this patch series.
>
> Yup, it's all new. Read cover letter for reading instructions for the
> entire patch series. I'm afraid the driver patches wont make much
> sense without the context. None actually :-/

IC, as the cover letter was sent only to dri-devel and intel-gfx, many
recipients of the patches won't have received it...
https://lore.kernel.org/dri-devel/20200219102122.1607365-1-daniel.vetter@ffwll.ch/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
