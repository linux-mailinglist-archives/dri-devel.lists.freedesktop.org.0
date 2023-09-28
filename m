Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 917917B27A8
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 23:42:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D40210E6B1;
	Thu, 28 Sep 2023 21:42:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74BC210E6B1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 21:42:47 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-59bebd5bdadso168362077b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 14:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695937366; x=1696542166; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dyjoKETvc8Jkre1VW0VcBJjtFjfQTAwv92MnVeCdm0U=;
 b=P1PYDQHTKSAEOoFEJUyuVA8hdZNcI1h0tTib2NRjan44epuCazOZCipWvETn98kNaW
 4ji1QyCgn0Kv9SDOIkARkWxOVZKXS9hiUZNsjeHTICb3Us2X8a7glqak474XPbAdPkVJ
 amZBe5KgYfxNahDzD7ckQG+eR1OVO+l5NM54j085DueffHO1Uo5VGi0rR6F9C8ehhHPC
 ST8yoA1X5YHdcpdI7cz4ZDkX9QHpuvNIQ7bufgWJOjIz9k4zt3+aZRkj+5qXgUIQz40W
 tu+H1/zRsCPg3zJ8YuFcF7bHuL18B59QRn/oGiVA4JzmWy4P4mZeKMn4sWUTNU37gxml
 S4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695937366; x=1696542166;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dyjoKETvc8Jkre1VW0VcBJjtFjfQTAwv92MnVeCdm0U=;
 b=udZ30ufLDO1+77m3C/0ZpnwTdBSD1VxzFFR0RrJEyVNuQ2zdy7JZsqXp2r2dy8L82P
 FRGEx8Dmu44ooBJtCqB6YoLx80TJvzWQ1yeQmnvo1zhjYFQxlY9dxP4ya2A4pr76POmr
 ovM88bWIg196FBnmB1HQBg5szb6+jYUGyAD2w+NEQeiALMPYwQS+y2IOjIVt0v6oqEJS
 mXPxGoRWmtVBD/WmzDQ4um3T6T+soDJoAgRLYXt+TiNOig7KQP7xGtB0hd/tTVxL0VlH
 yxKDneWmJP+wVOgFVtVtvNB+CDhpVIl3kSxfKrujfm+VrQm2nJ0IMuTMm7G6b3lhGDVx
 YeSw==
X-Gm-Message-State: AOJu0YzfoTut/rzokRLaTrlB57CxFwIi7uz+va6/XlYxJYHpxqpTEcHx
 mJpivwwBibEVTGlBwEKULTAG2fTPceEACD2l3F3bnA==
X-Google-Smtp-Source: AGHT+IGpk71VurMtp/ePcfVQM8FvTjVmQTqiAz9LlB+kRJrzAOI7qpjlMQxs+h+Ue0Bpl2YEFijapTB7lkIaA6g99sU=
X-Received: by 2002:a0d:e001:0:b0:59f:687c:fb36 with SMTP id
 j1-20020a0de001000000b0059f687cfb36mr2143294ywe.45.1695937366526; Thu, 28 Sep
 2023 14:42:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230703-fix-boe-tv101wum-nl6-v3-0-bd6e9432c755@linaro.org>
 <CAD=FV=W2AKQSnWh02Lxbqi47M325JNCaEn1_B0xAW3PKPKKF7Q@mail.gmail.com>
 <CAD=FV=WZ+zX9jrwOhN_ZboSYSBomx2s5vifQEB6MzNFgj=g4Ow@mail.gmail.com>
In-Reply-To: <CAD=FV=WZ+zX9jrwOhN_ZboSYSBomx2s5vifQEB6MzNFgj=g4Ow@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Sep 2023 23:42:34 +0200
Message-ID: <CACRpkdZutdTDQkCSQoA0_0U=Qdf+xDWTu3PzvYRRz=cT18wHRA@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Fix up the boe-tv101wum-nl6 panel driver
To: Doug Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jitao Shi <jitao.shi@mediatek.com>,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 Ruihai Zhou <zhouruihai@huaqin.corp-partner.google.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 26, 2023 at 11:49=E2=80=AFPM Doug Anderson <dianders@chromium.o=
rg> wrote:

> > I'm curious what the latest on this patch series is. Is it abandoned,
> > or is it still on your list to move forward with it? If it's
> > abandoned, does that mean we've abandoned the idea of breaking
> > ili9882t into a separate driver?
> >
> > From looking at things that have landed downstream in the ChromeOS
> > kernel trees it looks as if additional fixes are getting blocked from
> > being posted/landed because of the limbo state that this is in.
>
> I presume Linus is busy or otherwise indisposed.

Sorry I was looking for the branch with my patches and I have it
somewhere not ordinary :/

Originally I shelved it because I got requests to do additional
patches to the driver:
https://lore.kernel.org/dri-devel/CAD=3DFV=3DXkr3Qpd8m_6Xta_2jL_ezbxsmMyarb=
KXTXL+UJLG9xNw@mail.gmail.com/

To do measurements about binary code size in object files, and if it does,
then I need to invent new sequence macros (IIUC):
https://lore.kernel.org/dri-devel/CAD=3DFV=3DWju3WS45=3DEpXMUg7FjYDh3-=3Dmv=
m_jS7TF1tsaAzbb4Uw@mail.gmail.com/

So I just didn't have time for that extensive rework of the driver.

It's good feedback, but I just wanted to make the situation a little
bit better, and perfect is the enemy of good (TM).

> So I guess we have two options here:
>
> a) Cong Yang can post any relevant fixes to the existing "monolithic"
> panel driver so that we can get them landed and at least get things
> fixed.
>
> - or -
>
> b) Cong Yang could take over all or some of Linus's series and post
> new versions of it, addressing feedback.

Either works for me, I would prefer b), Cong is welcome to adopt
the patches if he/his employer want to. Go ahead!

We can't really let this one-size-fits-all driver go on like this.

My main concern with the "boe-tv101wum-nl6" driver is that it can
be renamed "cromeos-hackfest" at this point because it becomes
hard for any other system to reuse the panel drivers, the typical
example would be a system using say ili9882t but with
a different init sequence or something, why would they want
support for 9 unrelated panels compiled in? The condition that
these drivers should be related to the original panel that gave
name to the file has seemingly been dropped long ago.

It looks like the drivers only share the power lines (avdd, avee, pp3300,
pp1800) then this can be broken out to a helper library. But I am
sceptical about that too. I doubt that the vastly different panels
actually have exactly these these supply line names, I think it is
actually names of the rails on the chrome machine board. And that is
not how these regulators should be named, they should be named after
the input name on the component. This is really hard to catch in reviews wh=
en
we don't have datasheets so I'm not blaming anyone, but is this something
that even needs fixing in the device tree bindings? (By deprecation
and addition...) can we look into this?

I would say can we at least agree that before we merge one more
driver into this file, break out to subdrivers those that clearly have
an identifiable display controller and is thus reusable? From my
point of view I can just see the ili9882t so that's a good start.

Yours,
Linus Walleij
