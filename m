Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A35D607416
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 11:31:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 295D110E604;
	Fri, 21 Oct 2022 09:31:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3394610E604
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 09:30:55 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id a13so3658605edj.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 02:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IfqknHFplFI4onqgK6NKzTYHK/ieEipqEiBhaLValFc=;
 b=OqMByrkHqHeDikwt1kFSopnsRkgSLfPRDjKMgqQZNoyX7TQvHTrVRizoJ44Bcs0w0W
 iJXLfHd9R9/gmU3uDVckcJo8X6K8aBYx4vOfkR1s7rwQmEzJmVgIJ1+6ZNKaBiu6cYVr
 c61PJ4xT/RauaDjJlbxgc7d/g7tmPhLy9n19Dj17VKpfPWMwqrIURkshea17/tq4ZWiL
 2XrRw/E7jpLs7I/AQAbypLXov371l9onqkWhcGijYoj5GJwuUqCf0iQSnPSvbSl85ogh
 DS1EllBIi+h4w+rThWzjmwy+LqXyweK9tGtiXDrFhg2G0o5meiQQyBJvqqaNT+bcj5Vm
 EV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IfqknHFplFI4onqgK6NKzTYHK/ieEipqEiBhaLValFc=;
 b=ujq2zGooz8oxsTan7dVJRlflOIOsyF6afPqApTrwb7jSjZla9yQBKjm80xWqh1+grh
 ACLrfYioMFbbSVdAcODyyXRT5HQi2fD7HRjWTYLc/T7LSUq8aZCzT/DXG4+J/P3j2M7i
 XvT9ddqlYXFxoSlZQJeO6aRg/ud3r7rEB1AWpWfv1EFGa2l7pDcBmwIU5eTro4T6bn2i
 9EmYMjwgneH3RoPOxZrM50jhruCS/7SCf3r+4haxHGQsuhjCQOAt8bmAXFQgFIgHDi/5
 H2Aki3bT3OnyI+OV0vVC1KR+zn5YJXS+UR4h69VTqcN+xEiffKshc43RCfns9bHXxfpv
 TmsA==
X-Gm-Message-State: ACrzQf0SaL2iHm+iIZ569J/sCyA6jMC5SDpeE+lWvgZM5Jk/Q5DULDog
 F6DcWgCRO2cWzgp22/DSxXj41lv+fG0wmciUmIoPjg==
X-Google-Smtp-Source: AMsMyM4nu1h7XrH/v5kjc1nM5PjN33Mk7tqMXjE8ARAil+atC4QjbqB6YQOYNakUDq/zL4U1jDbCfDMY+2nUVF59BT8=
X-Received: by 2002:a17:907:16aa:b0:6fe:91d5:18d2 with SMTP id
 hc42-20020a17090716aa00b006fe91d518d2mr15053334ejc.190.1666344653687; Fri, 21
 Oct 2022 02:30:53 -0700 (PDT)
MIME-Version: 1.0
References: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
 <20221020175334.1820519-8-maciej.kwapulinski@linux.intel.com>
In-Reply-To: <20221020175334.1820519-8-maciej.kwapulinski@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 21 Oct 2022 11:30:42 +0200
Message-ID: <CACRpkdYDYUEx-hWNrUB5cXbH_2oXzRYc2pwn=4u5mivGn14eVw@mail.gmail.com>
Subject: Re: [PATCH v5 07/10] gna: add GNA_COMPUTE ioctl
To: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
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
Cc: Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, linux-doc@vger.kernel.org,
 Tomasz Jankowski <tomasz1.jankowski@intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Anisha Dattatraya Kulkarni <anisha.dattatraya.kulkarni@intel.com>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Jianxun Zhang <jianxun.zhang@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maciej,

thanks for your patch!

On Thu, Oct 20, 2022 at 7:57 PM Maciej Kwapulinski
<maciej.kwapulinski@linux.intel.com> wrote:

> From: Tomasz Jankowski <tomasz1.jankowski@intel.com>
>
> This is the ioctl context part of score request + "do nothing" work queue
> implementation. Work queue context actual part will be added by next patch.
>
> signed-off-by: Tomasz Jankowski <tomasz1.jankowski@intel.com>
> Tested-by: Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>
> Co-developed-by: Anisha Dattatraya Kulkarni <anisha.dattatraya.kulkarni@intel.com>
> Signed-off-by: Anisha Dattatraya Kulkarni <anisha.dattatraya.kulkarni@intel.com>
> Co-developed-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
> Signed-off-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
> Co-developed-by: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
> Signed-off-by: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>

This patch start to introduce the actual work processing IIUC.

So there is some funny lingo used here that should be in the commit
message:

- Patches
- Processes
- Scores

These terms are used without any explanation of what it is and what the
purpose is.

"Patches" is especially problematic for kernel developers since we use
it for our development work.

Musicians may start to think about the patch cables used on an old analog
synthesizer and they call the diffferent sound settings "patches" in analogy
with that.

In this case I suspect that "patches" in this context is unrelated to either
concept and rather a new name for "computer program executing in
funny processor", the same way that graphics people insist in calling
their computer programs "shaders". I guess a "process" is one such
"patch" executing in the accelerator? I am just guessing. I need to be
explained to.

If this is accepted lingo then so be it, but bums like me need to have
it spelled out to understand what is going on.

Some examples of patces, processes and scores will be needed in
the commit message.

Yours,
Linus Walleij
