Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE4C14A21F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2020 11:40:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0810C6EAE3;
	Mon, 27 Jan 2020 10:40:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 939366EAE3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 10:40:36 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id r27so7864699otc.8
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 02:40:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AW+LBaeT8gOjm/Wt8re4LDAAGI/aZNJ9jt+vsl49tb4=;
 b=kdm1hAZgvKpD/Puw+lUAJR2X0K+32T14/ypuUjtV8nOHFSD7KLNiu7OSyoFn557/VP
 tt/Z+MfqIDLgMTKBv6zwjadu1PZwOVsQvo5R+wdnJ0ysIZuw/qXM0NLfLk7iBCqv04Og
 8LKHMPFu4hTuuYJi2uA2Rgan9tl4l9n57gCAOpEOECkg63ReyWD5F5Jn1BzStYYLLnfk
 0FTAVS0TMPYA3iNETOEYt7aC2/8nkobGWDOpbwNkpn+gTQehPz7ofmWXox6gmHHDjJg5
 /92iy5DMgY93W4XhGMXabZkpBb3nMFaQvkCoDpiLQMtlQtOD1tZfnMk+GZ9Ke89sALCZ
 31lg==
X-Gm-Message-State: APjAAAX7Ckxbta7tvcpEuLMOkWpH5XFY6GwVJDoVJ4m6OK6TDXs5UDcH
 cqgvucM4tpUIEz2TMYLTc4ZHUptVV8BOYgpYgvE=
X-Google-Smtp-Source: APXvYqyZJ7snfwIF9VhtGo0junMx6187m3dBMp5u/yhu7QVejoz7fioQfLRaBYU4XdKKGp9DEtface7gHN7kLtf167I=
X-Received: by 2002:a9d:7984:: with SMTP id h4mr12336553otm.297.1580121635811; 
 Mon, 27 Jan 2020 02:40:35 -0800 (PST)
MIME-Version: 1.0
References: <20200125195506.GA16638@brightrain.aerifal.cx>
 <20200126071724.GA3520745@kroah.com>
In-Reply-To: <20200126071724.GA3520745@kroah.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Jan 2020 11:40:24 +0100
Message-ID: <CAMuHMdU32gF89zz86WH3AqkoPK7hdSjWMexJ1aLU9woe0qF0YA@mail.gmail.com>
Subject: Re: [PATCH] matroxfb: add Matrox MGA-G200eW board support
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
 Rich Felker <dalias@libc.org>, Thomas Gleixner <tglx@linutronix.de>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Greg,

On Sun, Jan 26, 2020 at 8:44 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sat, Jan 25, 2020 at 02:55:06PM -0500, Rich Felker wrote:
> > Signed-off-by: Rich Felker <dalias@libc.org>
> > --
>
> I know I don't accept patches without any changelog text, don't know
> about other subsystem maintainers...

FTR, I do, iff the one-line summary says everything that needs to be said.

What's the point in writing a full paragraph like:

   Currently the foo driver does not support the bar device.
   As users may want to use the bar device, it makes perfect sense
   to add support for the bar device to the foo driver.
   Hence add support for the bar device to the foo driver.

if this doesn't add any value on top of the one-line summary?

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
