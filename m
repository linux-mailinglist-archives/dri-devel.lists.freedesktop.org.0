Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 978C32F9727
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 02:07:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 977BA89B49;
	Mon, 18 Jan 2021 01:07:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C13389B49;
 Mon, 18 Jan 2021 01:07:00 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id f1so1616568edr.12;
 Sun, 17 Jan 2021 17:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PNeNqacM4fDdIsWWQviI9y4JI0WUsFuQcZN1AB5dFMI=;
 b=Hd1cVzAEGu5jJcKoiStC0RnBjbGRaO7Q1RiiNNTjeJ160oiuhJ2xO1EO122GEoOXyy
 rUDSKoaV2scep62pUTvBbxnhoCLPduIJked07qOL67Mi4HM4ref0rVFD+cMH0w/OTE11
 nZ2ugkvkg49h7vc34844Tv185Hz1LY1A4FzokwdKijNCU6O4ws571ec/qi+i94gfEwWF
 /BeZXF6j4rqigFIwBT+Ewq7zsbnWBif2bVQNHoD4iPcGdbAOo5bTPviWFKVX7WseIkvN
 lYyBY37ViJCCJdkofkQnVrpvMwy2rm0ZNvgE0ix59DBpfwN9BmcQkXMnzwLoephzVkTB
 x1mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PNeNqacM4fDdIsWWQviI9y4JI0WUsFuQcZN1AB5dFMI=;
 b=bofZyV146a5FqUczPeqsm/VOG6B4slWyYP5FA9EsPwx+nC/NB4cHjMh6GfA7xMcoB+
 Jk1DzzIZmnQ7F2yjFZ4zsOxw9AYQW0WxlyEG9Gu6iflkDlKA/93CRAKyKPnjsn1yHhtT
 jkafthqoXZH1ajdwrs+cGil4tjbO/zT8Qdo9saYlF33L7E1WBCKZFkAT9WdpmEvQaQM8
 95QPY55F5BAvpof9hDj2GwSNJstVHQYJjXWiB5uwMR0beL3ljPOUcet6k75y4ivFn22j
 HqKu9tV/pORuCl+1/q+b/CtMX3JXPF4nRYHsv4tUJ6PPHgqAoaz6JN1mQt3T/jP2XHIH
 xfAA==
X-Gm-Message-State: AOAM532YvZ5WHV/HP5TYjI8uZdz+n/HlaLtvD6IJ44Nvmj1v525iSRlq
 cFiFd+b/AwB/Fr5Jof7/B3gaQriylxepGmvP7Yw=
X-Google-Smtp-Source: ABdhPJwAePDjuhUUYO6a4u8g4U2/QpbxiekOvKUUN1d0YFQrEefJnbWGYr/xu2+cps9CjGk7pgLQfFqyT6ySDEy2xRs=
X-Received: by 2002:a50:b742:: with SMTP id g60mr17169711ede.113.1610932018848; 
 Sun, 17 Jan 2021 17:06:58 -0800 (PST)
MIME-Version: 1.0
References: <20210108115518.2b3fdf58@canb.auug.org.au>
 <20210108122540.657501b2@canb.auug.org.au>
 <20210111105654.17e3aa76@canb.auug.org.au>
 <20210118115924.6ee14fd3@canb.auug.org.au>
In-Reply-To: <20210118115924.6ee14fd3@canb.auug.org.au>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 18 Jan 2021 11:06:47 +1000
Message-ID: <CAPM=9tz7bEZewNwg_96Jj+oyBk3=c7hZ4aFbSKdMAsewJpfXHw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
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
Cc: Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, DRI <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 18 Jan 2021 at 10:59, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> On Mon, 11 Jan 2021 10:56:54 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > On Fri, 8 Jan 2021 12:25:40 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > On Fri, 8 Jan 2021 11:55:18 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > >
> > > > After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
> > > > failed like this:
> > > >
> > > > error: the following would cause module name conflict:
> > > >   drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.ko
> > > >   drivers/gpu/drm/panel/panel-dsi-cm.ko
> > > >
> > > > Maybe caused by commit
> > > >
> > > >   cf64148abcfd ("drm/panel: Move OMAP's DSI command mode panel driver")
> > > >
> > > > I have used the drm tree from next-20210107 for today.
> > >
> > > This has affected the drm-misc tree as well (since it merged in the drm
> > > tree).
> > >
> > > I have used the drm-misc tree from next-20210107 for today.
> >
> > And now the drm-intel tree.
> >
> > I have used the drm-intel tree from next-20210108 for today.
>
> This is still affecting the drm and drm-intel trees.

I think the fix for this is in drm-misc-next, Maarten can you send me
a -next PR to fix this?

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
