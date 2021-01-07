Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 570192ED416
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 17:14:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DE6889913;
	Thu,  7 Jan 2021 16:14:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E77E789913
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 16:14:09 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id d203so7962994oia.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jan 2021 08:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Anp6fcD6yAwLyjbGGE1+Diuy4cW35CxE+VM2oZ10UHY=;
 b=AvMUaduH2Idk3BBoeDhZTpBAtUgjcnH7c7uOHsVrrwqAkN4oSx7ksHkHJQxLhISU9h
 w3oKnIIldfo7afa/Le8HH70sXF1bi8ro8y7BAP0cPuZ16QRNdU8KcQ/0PdokZ9hiyAij
 nDPUjeA1u+me8BOdee5+GvpiO1Zb65u1NghZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Anp6fcD6yAwLyjbGGE1+Diuy4cW35CxE+VM2oZ10UHY=;
 b=XTlHVGyZpzHHRCnAmRs4tXaHfp26l7yiObHOJCxxLKluGEyHJnWbfzOGSOXb23DvaK
 jNu8KqkOmu4zD+B9hWoizuiTU7H2NvAKoUBec311Dw+ytVS9yK/LTDaCs4aQTzhAAr/o
 aY9NKfel1W4wzM87kJ5V8uC+bv476525qvBL8wNka/0I1nCCBx9VWA5QpUdiKq7G4PHj
 B8+9J2MA2yK6ZvKTrQV/k25hQgvUx6y/UAEDxK2vy/sN3Q6n8spChY+0tTdxHpTizXzt
 6qb7W2mrsqE93Ie8AzXp+5PpWLhPlx1oUhitmfxAQ3VsDutalCZnNTKwUXDU0TOhjv8o
 esBg==
X-Gm-Message-State: AOAM533liW9CVU1lptYgPl7XmFcyaEHslmDscJdB5RVuB/A7mRM0Je55
 994awK6W4UypMO0S5n4lIPsdvDARZxkKZ5HnbUQdRg==
X-Google-Smtp-Source: ABdhPJwcVUwVzvYEz3CXLrS619Fb79kw4VOjMd1SMRiITD1QN38C8IKP0LsZNPcOdch3JRiUfQZmyTEjNsuTTD0Nu3U=
X-Received: by 2002:aca:4e11:: with SMTP id c17mr6758170oib.14.1610036049307; 
 Thu, 07 Jan 2021 08:14:09 -0800 (PST)
MIME-Version: 1.0
References: <20210107154801.1997-1-huijiexu295@gmail.com>
In-Reply-To: <20210107154801.1997-1-huijiexu295@gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 7 Jan 2021 17:13:58 +0100
Message-ID: <CAKMK7uHQqNjk=1Wv0Mgh+SCTc78wRnRfjS1qQHOb7WE36+_rdA@mail.gmail.com>
Subject: Re: [Patch] fbcon: i want fbcon soft scrollback feature come back
To: xuhuijie <huijiexu295@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Greg KH <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 George Kennedy <george.kennedy@oracle.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>, Peilin Ye <yepeilin.cs@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 7, 2021 at 4:48 PM xuhuijie <huijiexu295@gmail.com> wrote:
> This commit 50145474f6ef(fbcon: remove soft scrollback code) remove soft scrollback in
> fbcon. So the shift+PageDown and shift+PageUp is missing. But PageUp is a vary important
> feature when system panic or reset. I can get log by PageUp before, but now there is no
> way to get. Especially on the server system, we always use bmc to control computer.
> So I hope the community can add this feature back.

Adding Linus.

Short summary: Not going to happen without significant effort:

https://lore.kernel.org/stable/CAKMK7uEy-b_nPmoh9WYA4NCsK8AL_Jk+-+FRZsrk6NOqqrvriA@mail.gmail.com/

Cheers, Daniel




--
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
