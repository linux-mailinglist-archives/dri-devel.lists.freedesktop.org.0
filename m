Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D67F15CEAA
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 00:31:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE97E6E435;
	Thu, 13 Feb 2020 23:31:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D465B6E435
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 23:31:00 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id q84so7661220oic.4
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 15:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1ut+2rvXwl7BR7vsCTTvgdnkkBILXLMDEZzQhdWPdjI=;
 b=KQ3NdJU2QDHHOl9p0+M33PV1wMgwZA/1HxVLBpribieMwumoe0ZJTM42+FGGMpJxB5
 fgpmBQ8i6tirAD++gaJl0CHVDTJduQ81TOd8cjrCwoOTMbkRu6Awa+B2iUbd6Ts25Chk
 /sQi1aTsYV5PkMneNvdlj+YN+ZV9LZ5Jbf+S0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1ut+2rvXwl7BR7vsCTTvgdnkkBILXLMDEZzQhdWPdjI=;
 b=KYx9KUNeuzEYEksc7PjhGTFpu+7UgInvAjAbfxffu0iCRa4JTxYeOsb36Rw8e3Y8DR
 ulFMoxsRzt6IKkMlo+apMPnG7mjHKgJw0C9kuLzQozh43zrF+6eDgLsr0WFLtd9OqrNe
 i/zVdgafbGFev0AnPRfOi5uliWcUfHOxwUI/XcDmXu3I4UGBWLWQes7RWKu+7V18o49b
 JoSq7ZxoPLE2XK/JB1VrCqglTX+YzC49AEFZehFzA2+rFSi78x7OuyFJ0RZLAsr+gA+C
 L2bG+VYLOx7Bi2+TpLZZS8Vp0gCMWBZDMdPJGbI8lxCwW6ZgjwSZKMvZKSsL5+t0rqVb
 bKJA==
X-Gm-Message-State: APjAAAWB4erY6sAMQ0EFZgXIbzFC34RE4q35ElRB1OP7OUYHeV4ncfra
 rax4/R4521fZ32HaZc+7OgTw0H1OnDnOWjI3QMKyUw==
X-Google-Smtp-Source: APXvYqx1nTcAjLMMkysVcmh1dWd9DsvevHBFUCVWieYNbxpzYJs1oKEWwI8r5hXKOn2wGgekzrJEpQniILwUm9QXC1k=
X-Received: by 2002:aca:af09:: with SMTP id y9mr15379oie.101.1581636660117;
 Thu, 13 Feb 2020 15:31:00 -0800 (PST)
MIME-Version: 1.0
References: <20200209105525.GA1620170@kroah.com>
 <fdb35aa7-7e4a-c44f-94df-bd44585d4bef@nvidia.com>
 <20200213223931.GA3877216@kroah.com>
In-Reply-To: <20200213223931.GA3877216@kroah.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 14 Feb 2020 00:30:48 +0100
Message-ID: <CAKMK7uHO0GOA2AzAh3XzWM5p7JkxuCEhz=yA=d4pbkojA4rYUA@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH] nouveau: no need to check return value of
 debugfs_create functions
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wambui Karuga <wambui.karugax@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, John Hubbard <jhubbard@nvidia.com>,
 Ben Skeggs <bskeggs@redhat.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Nouveau Dev <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 13, 2020 at 11:39 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Feb 13, 2020 at 02:30:09PM -0800, John Hubbard wrote:
> > On 2/9/20 2:55 AM, Greg Kroah-Hartman wrote:
> > > When calling debugfs functions, there is no need to ever check the
> > > return value.  The function can work or not, but the code logic should
> > > never do something different based on this.
> > >
> >
> > Should we follow that line of reasoning further, and simply return void
> > from the debugfs functions--rather than playing whack-a-mole with this
> > indefinitely?
>
> That is what we (well I) have been doing.  Look at all of the changes
> that have happened to include/linux/debugfs.h over the past few
> releases.  I'm slowly winnowing down the api to make it impossible to
> get wrong for this type of thing, and am almost there.
>
> DRM is the big fish left to tackle, I have submitted some patches in the
> past, but lots more cleanup needs to be done to get them into mergable
> shape.  I just need to find the time...

Just to avoid duplication, Wambui (cc'ed) just started working on
this. Expect a lot more void return values and a pile of deleted code
rsn.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
