Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 569AB11FFD0
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 09:31:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B77A6E457;
	Mon, 16 Dec 2019 08:31:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3D066E16D
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 01:19:18 +0000 (UTC)
Received: by mail-il1-x143.google.com with SMTP id r81so4136941ilk.0
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2019 17:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ePXTIUIV0Ij0A4oFj9n/QikNcOig0/QRLPKU1H5Yl24=;
 b=sLKPB9VQC3w3hOZ2rB0Zj7IdZFrQ7RPW2q18mbwdnIfdK3WSusuuVHYKvdX4IXEwe8
 hzLoUWxTb5Uaia3LHoHRZz4qtYV2NLwhgrY5SDdMr/T6LRY215U2o95E7V2ZdY+TgZmQ
 uotdb1LF7J0yfmJhjzJh7r4eiR51N8lQh/sF+87Tx6P2kf92KDrPToRrDsO+myw8H6UR
 lnbmcXrdQDRHJehj4Z5ImhNS/K1CR16ORqPXUk2GyCMVlHDL6W4PPx6GgFO4Mm+9RyN+
 x7QawRLn0MaCrnH63TF7WLR6UW8tgEYzzPvU86CD+1GQ3BxCszDiG65dRBvISbRUirq2
 aMGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ePXTIUIV0Ij0A4oFj9n/QikNcOig0/QRLPKU1H5Yl24=;
 b=njPyLrNMszH90p1OEeGto5XS003M/NKQyuYcmWyVcGwCsZX7zpsNyQpPmXK6BRhTJj
 xe0Wtdxg78cudV4ua+P+fKRiuwXE0k+ODxx+Hz+e7iSfTr0OW4TBs3cfv/BFYzcO8vvH
 HGwBuPzedC76CXrVOzostlCMX9mGDOE0Qn0Wl+xAV40eMwUztEKohnL4u1spb3P7AFwE
 VNqpa86BhZNfXCh++Km6EMGzWEg+jpRBAd8rJVAzQUpxH58Lj3GZ0IStILZdp8HV8a9J
 GomZepyqCOcHSUe1uBv4S6/59QZfaA8qErwJPiEFUHkbCUBbT1DnGSO+eEWK7aSaYDTo
 UqFg==
X-Gm-Message-State: APjAAAV7Max4+q86rAlot0NY0tzuQEJ54PlTD0PdhP/qdsKzjDTXmCN2
 d/pv2GZtPda6Smmjup9VpCRNcvfANLgM93R4QUw=
X-Google-Smtp-Source: APXvYqwD8Xnb/tCPRqtJ8UGlll0Xewt5uNwl7jCMZ0uVsOUTNIJewHgcq6oah6cqSetAmqsuqyBBSYFKuG3i1gfA7EY=
X-Received: by 2002:a92:6e09:: with SMTP id j9mr10245125ilc.178.1576459158278; 
 Sun, 15 Dec 2019 17:19:18 -0800 (PST)
MIME-Version: 1.0
References: <20191213234530.145963-1-dianders@chromium.org>
 <20191213154448.9.I1791f91dd22894da04f86699a7507d101d4385bc@changeid>
 <20191214000738.GP624164@phenom.ffwll.local>
 <CAD=FV=VqU8Aeuno44hAi6SP+7NZRTfgJcYPHcWpVNCo6GXUJPw@mail.gmail.com>
In-Reply-To: <CAD=FV=VqU8Aeuno44hAi6SP+7NZRTfgJcYPHcWpVNCo6GXUJPw@mail.gmail.com>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Sun, 15 Dec 2019 18:19:06 -0700
Message-ID: <CAOCk7NoT9FKikk3pNi-JGZPopaicE0kM-7nEK4GeqZmEtB+nAA@mail.gmail.com>
Subject: Re: [PATCH 9/9] drm/bridge: ti-sn65dsi86: Skip non-standard DP rates
To: Doug Anderson <dianders@chromium.org>
X-Mailman-Approved-At: Mon, 16 Dec 2019 08:30:48 +0000
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

On Fri, Dec 13, 2019 at 5:49 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Fri, Dec 13, 2019 at 4:07 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Fri, Dec 13, 2019 at 03:45:30PM -0800, Douglas Anderson wrote:
> > > The bridge chip supports these DP rates according to TI's spec:
> > > * 1.62 Gbps (RBR)
> > > * 2.16 Gbps
> > > * 2.43 Gbps
> > > * 2.7 Gbps (HBR)
> > > * 3.24 Gbps
> > > * 4.32 Gbps
> > > * 5.4 Gbps (HBR2)
> > >
> > > As far as I can tell, only RBR, HBR, and HBR2 are part of the DP spec.
> > > If other rates work then I believe it's because the sink has allowed
> > > bending the spec a little bit.
> >
> > I think you need to look at the eDP spec. And filter this stuff correctly
> > (there's more fields there for these somewhat irky edp timings). Simply
> > not using them works, but it's defeating the point of having these
> > intermediate clocks for edp panels.
>
> Ah, I see my problem.  I had earlier only found the eDP 1.3 spec which
> doesn't mention these rates.  The eDP 1.4 spec does, however.  ...and
> the change log for 1.4 specifically mentions that it added 4 new link
> rates and also adds the "SUPPORTED_LINK_RATES" register.

Yeah, you need the eDP spec.  I previously posted
https://patchwork.kernel.org/patch/11205201/ and was hoping Bjorn
would find time to test it.  Maybe it would fit well with your series?
 I'm coming back from tracel, and hope to review everything you have,
but this caught my eye.

>
> I can try to spin a v2 but for now I'll hold off for additional feedback.
>
> I'll also note that I'd be totally OK if just the first 8 patches in
> this series landed for now and someone could eventually figure out how
> to make this work.  With just the first 8 patches I think we will
> still be in an improved state compared to where we were before (and it
> fixes the panel I care about) and someone could later write the code
> to skip unsupported rates...
>
>
> -Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
