Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E66C2DA3B1
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 23:56:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 679B56E054;
	Mon, 14 Dec 2020 22:56:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AADC6E14F
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 22:56:01 +0000 (UTC)
Received: by mail-oo1-xc2e.google.com with SMTP id k9so4350931oop.6
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 14:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tNau0dbi4wX2OHDWsJ2tCzSDPVLgYMIigq5L3bsc4IM=;
 b=hcZq/jeJbG+jFKN0wf5cZQX8wLrcXucGkUHnaHHWeZkoXGdMkDEfWIIIWCzwmAzeVI
 3vjSkcZk7XoSutwHWNBS8PWhxl47K4ZBFRjcz6K6C4NRuqZCdq1bGqrYigwx2HVUrkVG
 vd0f6pCHZ2opFzDboxv+pzkdkfRJoNe8EMgONgQsKeqiissl1iGqfZqI2X847yn+84TS
 NZmordXIRLClHLCjINtXRwOQHy4PqwIgP17eh8HPKj8OASXqw539KajCMThqSZkDH+7j
 3pUcY6rxFbUvjUb7Q6v31zG93ML6se5UYAulUzoYfT9zgIf8cSnn1RgkSxxMVFbLqeU2
 F71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tNau0dbi4wX2OHDWsJ2tCzSDPVLgYMIigq5L3bsc4IM=;
 b=CONIoBdRylHBYJLiMcOBT9MqCNSkhlgf+g0dHkTn0oUhvy++c+xpXmBS3Y1iCF0g3j
 U1mj4Mfc33zeWAbpipqYmmZpRp1+lKaPKpBGgvKt5KtrMsI/DaXei/2u8pyEjeUjvmXS
 quGtsAOb7INDzK65FgY6jHrd8uoMzXD8HmiWDO0KplgAcLZqzrbxcGr+teROZPjEwEHw
 C74srXzhc3GkvzQCJOWD6Qv5jY4WcdCasT/gjEXJeYHG1LnQL1jkqJrUZAYeXbEuPVQX
 6CPqTYeSKGfxrcrqKfpoaSux3bvqccMaKHB2262JjKTHYXRKeI0NwMv/2ZhTQxl7DndE
 AnKA==
X-Gm-Message-State: AOAM5324cSUM5A/rj5dcrloZfC/L8mqEZ9+oSqKLUPi19yVAiSOPjFf6
 U9bRJ7bEstMQ9DNuPvA9AIsSA8QK9ndsWoLxKYk=
X-Google-Smtp-Source: ABdhPJyXJPbohMAfZ08TLI7HABFoYsQBf66s4eNe4tSNa6zhO+7/c8xdBPW0S2evG8DXLzhOCXJCYUFOyz3Hy+zsNFA=
X-Received: by 2002:a4a:330b:: with SMTP id q11mr20518037ooq.90.1607986560917; 
 Mon, 14 Dec 2020 14:56:00 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9tyNrbap4FG6qstkC5YTznqVebD=ye+4+Z+t42yQnL325A@mail.gmail.com>
 <CAHk-=wjue4aOyQQq+C6SEurwe6XABhMyNtsfn1goU==Hf_QUqA@mail.gmail.com>
 <CADnq5_MyMm+FmmbKHccDDOBryEdgbQHdw3rtuhUv=cvJrirHFg@mail.gmail.com>
 <CAHk-=wgLKJ6S0V0YgVWdcXVH9Zh8CEV5xPBUSFkJ7fywNLtqeg@mail.gmail.com>
In-Reply-To: <CAHk-=wgLKJ6S0V0YgVWdcXVH9Zh8CEV5xPBUSFkJ7fywNLtqeg@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 14 Dec 2020 17:55:49 -0500
Message-ID: <CADnq5_OV4UqGLTsPnWij=eQYYxGf57mY8Nr34s5Y=jQiG9ZYLw@mail.gmail.com>
Subject: Re: [git pull] drm for 5.11-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 14, 2020 at 5:45 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Mon, Dec 14, 2020 at 2:29 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > The relevant fixes are:
>
> Ok, I can confirm that applying those two patches gets my workstation
> working properly again.
>
> Would it be possible to get those submitted properly (or I can just
> take them as-is, but would like to get a "please just pick them
> directly")?
>
> I don't like to continue to do merges during the merge windows with a
> known broken base - it makes for a nightmare of bisection when you
> have multiple independent problems, and I assume this hits not just me
> but a lot of people with radeon/amdgpu graphics?

Yes, anyone using AMD GPUs will be affected.  The patches are already
in drm-misc, so they should show up in the next drm -fixes PR, but I
think it would be fine to pick them directly to fix support for
everyone using your tree.

Alex
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
