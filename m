Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C370C324159
	for <lists+dri-devel@lfdr.de>; Wed, 24 Feb 2021 17:06:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1E9D6E04E;
	Wed, 24 Feb 2021 16:06:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F15B6E04E
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 16:06:18 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id l12so2415544wry.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 08:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ho7+jbWkPLe62RqDxRMAHg2mRAnGfcFm5FI9bReH5Ic=;
 b=D9i4vOJZBIGoaG+7t5QKqBCGfC4/n8CeTKgeq9x1bR/uneeT5y8a+YXTTLOT1HB1Ft
 D1I47nnO8wj5gV+f014x9CyCCWuHDl8ulsOnbPrudUD32DG5VqZy6JU+utcc+onGTs0g
 /KszCsSwIRecLOl3OudhRxPnxIhxxGRkbR9blfXGfreHJHN6Ad5WSF9HuEBvQJcKBB9v
 x0FjZZjIo10MNHiLgewGvw/VSzz+XjJ6MBYhYHu8zk1SRfJCvLd9LvmTovUCOzjdgR4+
 CNMEUUZ/gtRMI/qerb7DsfaJMB6ucCBErRADFyXswps4GSV2L9YbGPeYpx+7lC+OafMZ
 irqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ho7+jbWkPLe62RqDxRMAHg2mRAnGfcFm5FI9bReH5Ic=;
 b=oIULJonu+T2iQIP6iLSvi/RGgSEolI2vm2SJEVDjW6HNJtKmRHVjioJgeJPeXjWhIe
 GWT27Sf2zOiGwIHZDKf/3rlGZUhRIgDxOwsd0fgVY/uOfHM90htEie3UZgOJMnqzqm/i
 JuIg/tmRUgBCqIePPyQMZzmyz5HZSVwiaDNerdzyxba7RGcgWvTxyRGH2mFsoWsiosdD
 LGYn2azymQKYRTROBXz1/bfflRQEZRX9/K6oXKe0rJBLQX4gH/2laWzUVJ3EiH5TXhTp
 M7PKzjoNV763rkQp+MPRxRb65pOG22cwHKyiv5uKhxxgmqkxHryiWwdKVbf2xyX3pWT2
 ULYg==
X-Gm-Message-State: AOAM532Y/Zw4X8Cfrwjb8QrLkXX2iLStb/AWFKxXWL58SOW9I5cEIci6
 1GMhoriwXdgqBQQf9h/Op0DXtvSSuIAY79LdTycvxw==
X-Google-Smtp-Source: ABdhPJzMjfW7et16dlBlIUk3RMbaiTevIDWEWvDsfKcc4aiZ0oNOp8ZVMiM1JKkb4SyFU9nFeq+Smn+VtqilCPjJayA=
X-Received: by 2002:a5d:4521:: with SMTP id j1mr5630733wra.354.1614182777056; 
 Wed, 24 Feb 2021 08:06:17 -0800 (PST)
MIME-Version: 1.0
References: <20200811202631.3603-1-alyssa.rosenzweig@collabora.com>
 <CAPj87rMS5zxY6sK4N8zVZF9MHThmURj6kuso=G5+MQDVmNjC4Q@mail.gmail.com>
 <20210223145143.7bfayhp32tzdj637@DESKTOP-E1NTVVP.localdomain>
 <CAPj87rMkSdtrHnoLzK6zAVvST2KH8SprNnp5bS92qpr84g=fPg@mail.gmail.com>
 <20210223165348.edghgglgx4g2lvfw@DESKTOP-E1NTVVP.localdomain>
 <YDU2+A0MNJnrWxPs@maud>
 <20210223183404.jmdw5rojy4s64xfd@DESKTOP-E1NTVVP.localdomain>
 <CAPj87rOVTd7YhbPoYyxhDD1+S7xG23L2v8Hujdh6tGFBq+n+Hg@mail.gmail.com>
 <CAKMK7uG+xNt4iQkB2ysbMQPbe_JSPWCq+3VzV+OOAuAhn=9x0Q@mail.gmail.com>
In-Reply-To: <CAKMK7uG+xNt4iQkB2ysbMQPbe_JSPWCq+3VzV+OOAuAhn=9x0Q@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 24 Feb 2021 16:06:05 +0000
Message-ID: <CAPj87rPRgJU0N7-41K2VLuBahEnYQH52FaTqVbDpW7CHu_6VmA@mail.gmail.com>
Subject: Re: [PATCH] drm/rockchip: Require the YTR modifier for AFBC
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Sandy Huang <hjc@rock-chips.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 linux-rockchip <linux-rockchip@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, nd <nd@arm.com>,
 Alyssa Rosenzweig <alyssa@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey,

On Wed, 24 Feb 2021 at 14:58, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Tue, Feb 23, 2021 at 7:50 PM Daniel Stone <daniel@fooishbar.org> wrote:
> > The issue is a userspace one though, not a kernel one. Userspace (e.g.
> > GNOME Shell, Weston, Xorg) decides ahead of time that it's going to
> > use XRGB8888, then use the modifiers available to it for that format.
> > There's no logic in those projects to look at the list of 8bpc
> > non-alpha formats, examine XRGB vs. XBGR, decide that XBGR is 'better'
> > since it has more modifiers available, then go use XBGR.
>
> That sounds a bit like userspace being too simple. Since if they're ok
> with dealing with modifiers accessing the raw buffer is out the window
> anyway, so bgr vs rgb shouldn't matter.

Sure, you can add colour-channel permutations, if you have concrete
'rough equivalence' mappings, and you check that between KMS + EGL +
anything external you want to use like PipeWire.

We pretty much punted on that long ago and just use XRGB for
everything. Android punted on that from the beginning and just uses
XBGR for everything ... so it's not really a matter of dumb vs. smart
userspace, just equally dumb userspaces which disagree with each
other. ;)

Cheers,
Daniel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
