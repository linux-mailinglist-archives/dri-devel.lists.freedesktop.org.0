Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FAA2F718A
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 05:16:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4B8B6E10A;
	Fri, 15 Jan 2021 04:16:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B24789AB9
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 04:16:05 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id b26so11294315lff.9
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 20:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=63J/tLzLebR+d+sU8VZA5VzH3xNPW+K+cgzDeTPBen4=;
 b=CdC54e4XPbsZ3GtDLtnS0hEk8yJVFWCjWeEE1NTkSB0i2IQrdp9OLp6mZJPcsM1BNL
 sJp/79LSbNj8NdFh8B2AG8NI0nt5+iIzCgFM55u/HovT+b6rocnqOCKV4MvZbYzWcof1
 cFLxmg6G7B4nxXs3a2FFm8vXc9U6a9mpM5dBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=63J/tLzLebR+d+sU8VZA5VzH3xNPW+K+cgzDeTPBen4=;
 b=NLZUqEQgec813ktpEDCBIRcXncKQ/KpnOMUwoNFEpFk9CXnWnuZPFceiSrM6GhztpH
 BzXdQZt+CocvgioKLYfB8rQwILFnMvAgLutDEGjYmjNguxz7HPBaWgfl9WGXV8Nh4fKH
 IZZgpW/ULEg78/6dvtLmMSkW5H54tm4S1NRq3lNjdUh96flkJfMDqRGuoUv9WKZK8Fbw
 FfmsMWJjMjyi98F3euVgRZ9TBFwOjgwM2ePPtaMEV7JCtwrZIPJNhSWDKTmqZsAA8+jU
 ughr0TwteDlQPAIpbj3XzrUrw1qF3v/s4g2KTqHDjxbPCIsdxdAPDo7/W9nIpg6RyPvu
 BAQQ==
X-Gm-Message-State: AOAM533ZIUjYjVqyZb2pkICoODEveaG05nhUwoZNt0ErdEM2pxCykese
 fZPRvxUlj5D2oP3vpky/Pyw3+JbOLqjXgA==
X-Google-Smtp-Source: ABdhPJzQJCT+w3uUpbNg4M3x00C6kTAdQeehGQqRtJH+EyjI7GQo/VfeqvD6nhX9xgBCodSpGjFiPg==
X-Received: by 2002:a19:c20d:: with SMTP id l13mr4867399lfc.1.1610684163340;
 Thu, 14 Jan 2021 20:16:03 -0800 (PST)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com.
 [209.85.208.175])
 by smtp.gmail.com with ESMTPSA id x23sm752175lfe.185.2021.01.14.20.16.01
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 20:16:02 -0800 (PST)
Received: by mail-lj1-f175.google.com with SMTP id f17so8926261ljg.12
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 20:16:01 -0800 (PST)
X-Received: by 2002:a2e:8995:: with SMTP id c21mr4400396lji.251.1610684161408; 
 Thu, 14 Jan 2021 20:16:01 -0800 (PST)
MIME-Version: 1.0
References: <20210114163206.4a562d82@gandalf.local.home>
 <161066015368.19482.10094410867880595092@build.alporthouse.com>
 <20210114170137.002763b3@gandalf.local.home>
In-Reply-To: <20210114170137.002763b3@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 14 Jan 2021 20:15:45 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgqPnjOUa0aDRHXC0UAePrM6kRUD9gR4g2x0mq91FD4xA@mail.gmail.com>
Message-ID: <CAHk-=wgqPnjOUa0aDRHXC0UAePrM6kRUD9gR4g2x0mq91FD4xA@mail.gmail.com>
Subject: Re: [Intel-gfx] [BUG] on reboot: bisected to: drm/i915: Shut down
 displays gracefully on reboot
To: Steven Rostedt <rostedt@goodmis.org>
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
Cc: David Airlie <airlied@linux.ie>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 14, 2021 at 2:01 PM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> Thanks, I take it, it will be going into mainline soon.

Just got merged - it might be a good idea to verify that your problem is solved.

            Linus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
