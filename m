Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B0F121FC6
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 01:31:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E72146E8F8;
	Tue, 17 Dec 2019 00:31:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5218D6E8F8
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 00:31:32 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id v18so8079056iol.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 16:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JwnjQSU0EMCbEaNHZW9Pw+wOWET0cgofZxvyjHhghRs=;
 b=LJge9oaMrdmXTTvEYO7zbOnORPyCGcmSx53eq5HbKh7MEapWdoj7UiSSzPrrcAxKGG
 psQgIO3vUwA3pMDg1bVbqxBErOp57AR+YE0+G2XA3g65R2n9aGqodnYFuyJKN+kxnGuS
 n25OcKWj8PdKc6W18kAYZY23GnZPl6xsIg9ZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JwnjQSU0EMCbEaNHZW9Pw+wOWET0cgofZxvyjHhghRs=;
 b=KoK1sj9K9VrL2/oVrR36zzBVBSuWtSIOX5L/0s+AvkPAg0+ZXACN8msSHJQSzcawQd
 ammUC7JU/MRJB7IM1qaJmYZYp2NYz8Vgn9a/hyIpUl8wHJ3mz3bYqE2sdk80Yz9h1Xtg
 gDBJtweXxtJngJlBoemaYh62lpsjDs98F8X0aTieotqjfO6kp3W6GY3179RJ5f78JuFm
 N3PWA1Ns/3VOssVC8SO2HKL6lgQk1BGz6ol7eDj4UvzpqzvwFcSFXE7/fDTrONk+4Cc5
 gs2WXDLjW3kDO/izayFPnLx2Dnly6SYkwxpLSkFjDFGB1GbAekNlC0SMnRxToc8rFPj3
 KpUg==
X-Gm-Message-State: APjAAAWIavb0E5NHe610RXQ/DFYmwxK3h6pYRjI0Br8cYbj2m9bX/iN+
 C2fzogOLFqWP4X5tBojmxB8SQythego=
X-Google-Smtp-Source: APXvYqw/oXGMB3Qqz3txpsnu0M/RGpMkxvg0opfpvRMyknFx2ayYXdus7wvXKZAdWcfbcmOSv6XGiw==
X-Received: by 2002:a6b:c7c3:: with SMTP id x186mr1580026iof.185.1576542691236; 
 Mon, 16 Dec 2019 16:31:31 -0800 (PST)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com.
 [209.85.166.175])
 by smtp.gmail.com with ESMTPSA id l4sm3634140ioa.9.2019.12.16.16.31.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2019 16:31:30 -0800 (PST)
Received: by mail-il1-f175.google.com with SMTP id z12so6927123iln.11
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 16:31:29 -0800 (PST)
X-Received: by 2002:a92:da44:: with SMTP id p4mr3491014ilq.168.1576542689632; 
 Mon, 16 Dec 2019 16:31:29 -0800 (PST)
MIME-Version: 1.0
References: <20191213234530.145963-1-dianders@chromium.org>
 <20191213154448.9.I1791f91dd22894da04f86699a7507d101d4385bc@changeid>
 <20191214000738.GP624164@phenom.ffwll.local>
 <CAD=FV=VqU8Aeuno44hAi6SP+7NZRTfgJcYPHcWpVNCo6GXUJPw@mail.gmail.com>
 <CAOCk7NoT9FKikk3pNi-JGZPopaicE0kM-7nEK4GeqZmEtB+nAA@mail.gmail.com>
In-Reply-To: <CAOCk7NoT9FKikk3pNi-JGZPopaicE0kM-7nEK4GeqZmEtB+nAA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 16 Dec 2019 16:31:16 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UwXHVyDD=Qj8Exq9xiw7=nisC_c02s76Gig8MDCUEh+Q@mail.gmail.com>
Message-ID: <CAD=FV=UwXHVyDD=Qj8Exq9xiw7=nisC_c02s76Gig8MDCUEh+Q@mail.gmail.com>
Subject: Re: [PATCH 9/9] drm/bridge: ti-sn65dsi86: Skip non-standard DP rates
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sun, Dec 15, 2019 at 5:19 PM Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
>
> On Fri, Dec 13, 2019 at 5:49 PM Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Fri, Dec 13, 2019 at 4:07 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Fri, Dec 13, 2019 at 03:45:30PM -0800, Douglas Anderson wrote:
> > > > The bridge chip supports these DP rates according to TI's spec:
> > > > * 1.62 Gbps (RBR)
> > > > * 2.16 Gbps
> > > > * 2.43 Gbps
> > > > * 2.7 Gbps (HBR)
> > > > * 3.24 Gbps
> > > > * 4.32 Gbps
> > > > * 5.4 Gbps (HBR2)
> > > >
> > > > As far as I can tell, only RBR, HBR, and HBR2 are part of the DP spec.
> > > > If other rates work then I believe it's because the sink has allowed
> > > > bending the spec a little bit.
> > >
> > > I think you need to look at the eDP spec. And filter this stuff correctly
> > > (there's more fields there for these somewhat irky edp timings). Simply
> > > not using them works, but it's defeating the point of having these
> > > intermediate clocks for edp panels.
> >
> > Ah, I see my problem.  I had earlier only found the eDP 1.3 spec which
> > doesn't mention these rates.  The eDP 1.4 spec does, however.  ...and
> > the change log for 1.4 specifically mentions that it added 4 new link
> > rates and also adds the "SUPPORTED_LINK_RATES" register.
>
> Yeah, you need the eDP spec.  I previously posted
> https://patchwork.kernel.org/patch/11205201/ and was hoping Bjorn
> would find time to test it.  Maybe it would fit well with your series?
>  I'm coming back from tracel, and hope to review everything you have,
> but this caught my eye.

Ah, interesting.  It looks like Rob has already posted a Fixup on my patch:

https://lore.kernel.org/r/20191215200632.1019065-1-robdclark@gmail.com

...that should also read the supported rates.  I need to go and review
/ test his new patch (I lost access to the hardware but should get it
back tomorrow or the next day), but would you be OK with going that
route?  I think my series is a superset of yours.  Specifically it has
these extra features atop yours:

* If link training fails and the panel supports faster rates, it will
try a faster rate in case it works.

* It adds support for using 6bpp when that's all that's needed,
reducing bandwidth to the panel (and link rate)

* It breaks things into smaller functions (assuming you agree this is
a good thing).

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
