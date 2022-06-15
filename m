Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDF654D291
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 22:31:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B51112D97;
	Wed, 15 Jun 2022 20:30:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E200112D8E
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 20:30:59 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-fe15832ce5so17981144fac.8
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 13:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CGPPd7PZu9HxKtdoxwqOJ2SMNchnSdrXD0y0lHK5RM0=;
 b=k7lq/649HWyaLEl+V4GP0HGGDcXAP+RhRvBEADeIv7GUFO0qUVrNhFontAKLV3JBvt
 UbDBedGWxkU3gwCqht3eXCQYJ8J23LpA18DaW+kcUUhGDVplOTg4+PKlS7HQFiXKkj5W
 inHbFs70gJ0tCHEGajDCVSbWE2lDopKrg7nBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CGPPd7PZu9HxKtdoxwqOJ2SMNchnSdrXD0y0lHK5RM0=;
 b=Ut3hjaCMD/8ctsCgADdc6oHuZywb7bqy6kuBSorIkmGX2Vg3ak8tqAc37UolUIcXjr
 fSmliw9QVOAPUaB8Nn1nc4BIpzk2OfX7EgcysRHXjxY957hBCj6vQvLzUdtRwP7H0ffh
 24AIApSJ30xb+bTzuZ7d66/tzi7M91cq64YAhxgGIpMPmDHPBTgIhIabUBe6WDR+S+K4
 7P4cKHvP/FDiId+CuntkMTVKv+2EWtRUbjFgfDmzIQFgf8VvznNPS4IVvZ3awqytRXMw
 cJVHMFb5C6TE4Ou++4gaolz28X0EQ0v+Gcsuwm92e7f+z8x/QYMpBwB+UPWEdeUaLsmT
 4zCA==
X-Gm-Message-State: AJIora811x9VncW7+6GlN1L58E4+b701ETI/VhT0wZXDBi/y+cVRFCG7
 eQlGdrQlVwte377hpWSk9usQPUnIxg6ri/ATcbmM+g==
X-Google-Smtp-Source: AGRyM1uQi1TMDIgq4wQD38w0gj+e0oSvQLAqdIgjR30ifcAeVJd+TJKWOQNN+zZeiC0VAkmK67zEb03FcFdj9exTByA=
X-Received: by 2002:a05:6870:3053:b0:f3:2997:659a with SMTP id
 u19-20020a056870305300b000f32997659amr876535oau.7.1655325058338; Wed, 15 Jun
 2022 13:30:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220615104833.3963552-1-windhl@126.com>
 <Yqm6LvDGqaRMaUHa@kroah.com>
 <CAPM=9twCiqyakgPLz0v=7-abUhzLb8ZZH7-U65PV8qtQOP7Xww@mail.gmail.com>
In-Reply-To: <CAPM=9twCiqyakgPLz0v=7-abUhzLb8ZZH7-U65PV8qtQOP7Xww@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 15 Jun 2022 22:30:47 +0200
Message-ID: <CAKMK7uG+TeATXctJaXBgSRxpinDdtOhGa+o2CMPaPtO1QyHtJA@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] Re: [PATCH] drivers: tty: serial: Add missing
 of_node_put() in serial-tegra.c
To: Dave Airlie <airlied@gmail.com>
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
Cc: Greg KH <gregkh@linuxfoundation.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-serial@vger.kernel.org,
 linux-tegra@vger.kernel.org, heliang <windhl@126.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 15 Jun 2022 at 22:23, Dave Airlie <airlied@gmail.com> wrote:
>
> On Wed, 15 Jun 2022 at 20:53, Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Wed, Jun 15, 2022 at 06:48:33PM +0800, heliang wrote:
> > > In tegra_uart_init(), of_find_matching_node() will return a node
> > > pointer with refcount incremented. We should use of_node_put()
> > > when it is not used anymore.
> > >
> > > Signed-off-by: heliang <windhl@126.com>
> >
> > We need a real name please, one you sign documents with.
>
> How do we enforce that? What if Wong, Adele or Beyonce submit a patch?
>
> What happens if that patch gets reposted, with S-o-b: He Liang
> <windhl@126.com> or Hel Iang, Heli Ang? Do you know any of those are
> real names? What happens if they post a real name in
> Mandarin/Thai/Cyrillic, can you validate it?
>
> Really we require you have an identity attached to an email. If there
> is a problem in the future, we'd prefer the email continues to work so
> that you are contactable. If you are submitting a small amount of
> changes it's probably never going to matter. If you are submitting
> larger bodies of work of course it would be good to have a company or
> larger org attached to track things down legally later, but again that
> isn't always possible.
>
> I don't think alienating the numerous developers who no longer use
> their legal names are identified by one name, but haven't changed
> their legal one yet people who get married and change their legal name
> but don't change their contribution name and I could run this sentence
> on forever.

Yeah like absolute best case trying to "enforce" this just results in
encouraging people to come up with entirely fake but English looking
names for themselves. Which ... just no.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
