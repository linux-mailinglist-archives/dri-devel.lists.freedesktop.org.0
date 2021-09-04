Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3A4400A76
	for <lists+dri-devel@lfdr.de>; Sat,  4 Sep 2021 11:41:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6DEE6E901;
	Sat,  4 Sep 2021 09:41:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E29BA6E901
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Sep 2021 09:41:05 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id v10so252540ybm.5
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Sep 2021 02:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B95LSNh4DxANXXI32CweDKSCOVhWFK+5AxEuGEObjTo=;
 b=I8bYMiYxp52sImFm8KTy5Q3CtcxU/gRVW3iRfJnOrpJ/0CJ47Rb426ypeQJSX7Lzoj
 /wA/gQEjfwP0TVNrtxjtmUQhhRbwxcNWmzl4peW87JQ/sFASGLcRW5jfCewE0GYXN4DL
 oeIz3Gn0mwVG5YKRQ41eLWBdFm0BmEZAcGWmYQitP83PYpJ3xy05FsE88duQeD8VmFyZ
 KR3OdoXF183GUzMk1Ajt0EepoWpY47yqRKw+9FC6WFHJP1sLlfeGbigXqSlsrCFQ9h5v
 tIUZ/gjHfWwd1XSQIF6/VdANd5o0p8PyYyZN5nT3l3sUkXNZOd0MyEIpoL3AEnb394qd
 gyQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B95LSNh4DxANXXI32CweDKSCOVhWFK+5AxEuGEObjTo=;
 b=YZ5B4oRnzDW3bK9sgiVWa7+DQXReEv8yuOJzPEanEmX64xcjqHw9ryIqKflehxx+gd
 XpsoNDImbz+4X1jvFLoK6C2OY0V0nnbTerQ35oJ1bKtFR+6ADmVMaEdmOhkamk4r4xEb
 HW6GcDQ2JIlrbV+aClTWqC4fjQWHZqpdqXvYRMkNqG85vbRZKtbNrvp6F2zJ1X2ONoe0
 7sYW7vF+UpClMMx3AtL2fvGfu4ycQHrypLegEMpplP9EuTuFsEXxTINfdeGoRTXWP7ch
 4j3F9XBN6bYgpCkVskm/7YohbCBbZIkoMTyIdEmxAAQ8d6gm+hNbApljqJDuYJaQgHmK
 ht5g==
X-Gm-Message-State: AOAM532rYTxlM/9Hxjwy/FG+H151kLnsB1mnqsebkNWhxIqAvtHlPj1a
 iqc1SLSuuzxnhUoNjhpvMdrRXUrIElvYjB6CkCM=
X-Google-Smtp-Source: ABdhPJyL+jc3gZ+32uRvD6od+WdDpuc5qSGezU16V5La0Q9GEf4VAGj1CONuqVc67Qx+CKjP29adentsxn38xpfxPEI=
X-Received: by 2002:a25:5444:: with SMTP id i65mr4189456ybb.277.1630748464907; 
 Sat, 04 Sep 2021 02:41:04 -0700 (PDT)
MIME-Version: 1.0
References: <CADVatmPB9-oKd=ypvj25UYysVo6EZhQ6bCM7EvztQBMyiZfAyw@mail.gmail.com>
 <20210903160302.yh42vpkuob45dbpb@gilmour>
 <CADVatmMqT1yq3YHBzt4-VsL8uVHUULmy2gpaH27rAqimao2i_A@mail.gmail.com>
 <20210904091050.g5axxctgelciihjn@gilmour>
In-Reply-To: <20210904091050.g5axxctgelciihjn@gilmour>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Sat, 4 Sep 2021 10:40:29 +0100
Message-ID: <CADVatmN+9euG5Fegor1+kaSPewbW8vRwBgnxmr5SsK3mOE6FEg@mail.gmail.com>
Subject: Re: Regression with mainline kernel on rpi4
To: Maxime Ripard <maxime@cerno.tech>
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Linus Torvalds <torvalds@linux-foundation.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On Sat, Sep 4, 2021 at 10:10 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Fri, Sep 03, 2021 at 09:09:50PM +0100, Sudip Mukherjee wrote:
> > Hi Maxime,
> >
> > On Fri, Sep 3, 2021 at 5:03 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > Hi Sudip,
> > >
> > > On Thu, Sep 02, 2021 at 10:08:19AM +0100, Sudip Mukherjee wrote:
> > > > Hi All,
> > > >
> > >
> >
> > <snip>
> >
> > >
> > > >
> > > > You can see the complete dmesg at
> > > > https://openqa.qa.codethink.co.uk/tests/76#step/dmesg/8
> > >
> > > What test were you running?
> >
> > Nothing particular, its just a boot test that we do every night after
> > pulling from torvalds/linux.git
>
> What are you booting to then?

I am not sure I understood the question.
Its an Ubuntu image. The desktop environment is gnome. And as
mentioned earlier, we use the HEAD of linus tree every night to boot
the rpi4 and test that we can login via desktop environment and that
there is no regression in dmesg.


-- 
Regards
Sudip
