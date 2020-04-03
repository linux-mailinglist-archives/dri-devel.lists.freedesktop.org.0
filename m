Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB5D19DC7E
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 19:16:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F056EC32;
	Fri,  3 Apr 2020 17:16:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 049306EC32
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 17:16:39 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id g23so8051923otq.4
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 10:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Lctl7I09zhnrc16vIbyVgC4BJIrPWPpZwMZxngQgQLE=;
 b=RNTWbP11QdyS+t9Dpc7fBrb1h5ml9B4pyvLPEREV4GD6pDlEyfUy15pUiIluTwIhSE
 1T5Ep+MgXgokKnU3mVLwRslwm/lqQdkT4wcoAt0oYDYrtc9ZqOywd7OZ6l4AfDWezX8h
 3FYXVYuXtk+5ima4Qcao7qAvoY8BEYbHOE9u8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Lctl7I09zhnrc16vIbyVgC4BJIrPWPpZwMZxngQgQLE=;
 b=p55vMr68YAUT2kA5M5Td2Y8aCZtmYyC0eYaBJZwWw9lcfp3I+GavxK+biY0G1RGsBB
 ywxOzjHb4Ir6HK+0D2KssubrfSGvLQqZt/h8gv1pFs1HskE3IP6uuH/zDNUrkY07OvEm
 jh5/x0dZZBXQ1McaTi6dma2pu9TzslMAmjjKr4nO5++L/tbwSFEyCOPuW/pR0XugNp28
 hK025Y+V9xqKpM0Nn5l2yjY17r5nckTJ/MSsZ/4kq0K1WcbiunqNOZDPE5P21b7vFFEK
 P1gMcRTWkL5DOjKY+ddL2CX+xbo5A7ixFNlV0nJ9EjOwRxodDBD5To3IV8cX4u57MUgi
 yrQA==
X-Gm-Message-State: AGi0PuY2sPmcaUYhkajcRTHv1UJxRgUrZ2PSBjXt0zHyKdMz3hRVhY4x
 s29Qu2iQ/x3H0LgNhoVfXQGeYWE7K1LxskhRaLn9KXHm
X-Google-Smtp-Source: APiQypI42wdCObMi2MKV6q+o1Ki446LUAAGqvEy2YFRpE56PPW9JAH6jH0LnCpB6Zrh8jSdbQtDCSX4NomVQ2Yn2Ouc=
X-Received: by 2002:a9d:2056:: with SMTP id n80mr7599742ota.281.1585934199272; 
 Fri, 03 Apr 2020 10:16:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200402203317.GA34560@ubuntu-m2-xlarge-x86>
 <20200402215926.30714-1-chris@chris-wilson.co.uk>
 <20200403013420.GA11516@ubuntu-m2-xlarge-x86>
 <CAKMK7uE9pv23edViQBC=Jy5fQV=-NQTNdk1qi91Z8shpeuL7FA@mail.gmail.com>
 <CAHk-=whMhCTdx0fDRnNT4doKGYw1BBBei0KcXDZcmtVpk_GvEw@mail.gmail.com>
In-Reply-To: <CAHk-=whMhCTdx0fDRnNT4doKGYw1BBBei0KcXDZcmtVpk_GvEw@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 3 Apr 2020 19:16:28 +0200
Message-ID: <CAKMK7uE2t=z71dtJitmoKwrrZxgciEDRrNPMQ1FyiLO7s-VKag@mail.gmail.com>
Subject: Re: [PATCH] drm/legacy: Fix type for drm_local_map.offset
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
Cc: Nathan Chancellor <natechancellor@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 3, 2020 at 7:14 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, Apr 3, 2020 at 1:29 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > > Tested-by: Nathan Chancellor <natechancellor@gmail.com> # build
> >
> > This works too, missed it when replying to Linus
> >
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >
> > Linus I guess this one is better, but like I explained it really
> > doesn't matter what we do with drm legacy code, it's a horror show
> > that should be disabled on all modern distros anyway. We just keep it
> > because of "never break old uapi".
>
> Ok, That patch from Chris looks fine to me too.
>
> dma_addr_t and resource_size_t aren't the same, but at least
> dma_addr_t should always be the bigger one.
>
> And it does look like nothing else ever takes the address of this
> field, so the ones that might want just the resource_size_t part will
> at least have enough bits.
>
> So I think Chris' patch is the way to go. I'm assuming I'll get it
> through the normal drm tree channels, this doesn't sound _so_ urgent
> that I'd need to expedite that patch into my tree and apply it
> directly.

Ok, sounds good.

Chris can you pls push this to drm-misc-next-fixes? That should be
enough for the pull request train next week.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
