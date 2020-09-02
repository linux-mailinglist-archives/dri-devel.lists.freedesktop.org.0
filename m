Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CDF25AD54
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 16:38:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DDD26E4BB;
	Wed,  2 Sep 2020 14:38:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com
 [IPv6:2607:f8b0:4864:20::942])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AD2F6E4BB
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 14:38:00 +0000 (UTC)
Received: by mail-ua1-x942.google.com with SMTP id k18so1637112uao.11
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Sep 2020 07:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TadnzZ2GBx4yX2HwMOimGbeZb2PcWtu+wm80cNcN0fQ=;
 b=Gi2e6zQsylDEwMGGD9uEtv0/zSfm3ttGeUD8jtFwieUhWNz0g3Vc3c3/fWdq3Jxcl+
 wc5w1QXNLwWb/D+NAQUk301/Aa9k7cL/XXJBR3Zfjxg9R0zUvZFColuIyLnXOKEftlar
 w/s11uKYBxNLykoVFCzrHIFXavzYRCaiEFZt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TadnzZ2GBx4yX2HwMOimGbeZb2PcWtu+wm80cNcN0fQ=;
 b=DYRBg8bwW99nSe4EOvzGeagq9tpq/U8rQ73p0FP1epyf6bbrOHzeYnY67DMUKeKqWQ
 4VrZbb11G3p629UlFriIT2yaFmLB+Zts5T6Xe3AAA6AXFhpuZChT58nCm17OuxrT5LMA
 MVVtU1lvtnSy9NMbOohW/dCOhCnokU5c8EwybTsrOW+vyhLf1xhL1hqUKZf4LDyHm72B
 DFky2govHXj/1pjMFSQPrnnVjz7r4b/1scfcI5PAgOjrkSdDjZryM+/V7DkJaXOOYERq
 LYOTjOFXJL0Wmz1jnY9Q8chbjNO8Y4cso0w1YG/0i2j4trQ3PxgkjBADaBOEXqD1Wo1m
 Yatg==
X-Gm-Message-State: AOAM530EPWPEq64Qrh7g0lgJiipgJya0ZYSbEoKEiOoMtre2G/8HVBaA
 OTgKc95vg4LvoSao5zuBsKZackdrzewPbQ==
X-Google-Smtp-Source: ABdhPJwPZ/xnTs39QD5g1ah6MTAOON8PYfhKTXA4XwbA70ntuX9N3onUI/a/RCXfJlY8qPbn0HGjrA==
X-Received: by 2002:ab0:6053:: with SMTP id o19mr5089637ual.77.1599057479439; 
 Wed, 02 Sep 2020 07:37:59 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com.
 [209.85.222.52])
 by smtp.gmail.com with ESMTPSA id o17sm677156vsq.20.2020.09.02.07.37.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2020 07:37:58 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id l1so1639079uai.3
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Sep 2020 07:37:58 -0700 (PDT)
X-Received: by 2002:ab0:37d3:: with SMTP id e19mr5065664uav.64.1599057477726; 
 Wed, 02 Sep 2020 07:37:57 -0700 (PDT)
MIME-Version: 1.0
References: <20191218143416.v3.6.Iaf8d698f4e5253d658ae283d2fd07268076a7c27@changeid>
 <20200710011935.GA7056@gentoo.org>
 <CAD=FV=X3oazamoKR1jHoXm-yCAp9208ahNd8y+NDPt1pU=5xRg@mail.gmail.com>
 <CAD=FV=UWQsGit6XMCzHn5cBRAC9nAaGReDyMzMM2Su02bfiPyQ@mail.gmail.com>
 <dc786abb-4bc2-2416-7ee5-de408aceb8f1@kali.org>
 <e0702671-3bed-9e3d-c7f4-d050c617eb65@kali.org>
 <bc795659-7dd6-c667-1c93-4331510ecfbc@kali.org>
 <CAD=FV=VC+RP8WfS-yuc65WRN2KokNbAs-F3UdQtQoZjcMMSNFA@mail.gmail.com>
 <f81f0d22-85d6-66eb-c8d9-345757f53959@kali.org>
 <CAD=FV=WB_4xLe9UZX3eVemybQ1neXJVZgzrDCW-xUxbAM6hCTA@mail.gmail.com>
 <8e306b6d-246d-aa7f-cb24-923e13afcd04@kali.org>
 <CAD=FV=XeBLRc4v5K3vj=m9PGMuW8GVUq110ApX6xS2QaiJd=pw@mail.gmail.com>
In-Reply-To: <CAD=FV=XeBLRc4v5K3vj=m9PGMuW8GVUq110ApX6xS2QaiJd=pw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 2 Sep 2020 07:37:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W60u2Ck6NP_k8+V1oWY7FRXs4G3e49Lp+h7Zii14nVQA@mail.gmail.com>
Message-ID: <CAD=FV=W60u2Ck6NP_k8+V1oWY7FRXs4G3e49Lp+h7Zii14nVQA@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] drm/bridge: ti-sn65dsi86: Use 18-bit DP if we can
To: Steev Klimaszewski <steev@kali.org>
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
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Steev Klimaszewski <steev@gentoo.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Jul 14, 2020 at 8:31 AM Doug Anderson <dianders@chromium.org> wrote:
>
> > Hopefully BOE gets back to you soon, and there's no rush, I'm just an
> > end user who is extremely appreciative of all the work everyone on the
> > list and the kernel in general put in to make my machines usable.
>
> Just FYI that I got confirmation that the panel is truly 6 bpp but it
> will do FRC dithering if given an 8 bpp input.  That means that you
> should be getting just as good picture quality (and possibly more
> tunable) by using the dithering in the display pipeline and leaving
> the panel as 6bpp.  Thus I'm going to assume that's the route we'll go
> down.  If ever we find someone that wants to use this panel on a
> display controller that can't do its own dithering then I guess we'll
> have to figure out what to do then...
>
> In terms of the more optimal pixel clock for saving power, my proposal
> is still being analyzed and I'll report back when I hear more.  I'm
> seeing if BOE can confirm that my proposal will work both for my panel
> (the -n62 variant) and the one you have (the -n61 variant).

To close the loop here: we finally got back an official word that we
shouldn't use my proposed timings that would have allowed us to move
down to a 1.62 GHz pixel clock.  Though they work most of the time,
there are apparently some corner cases where they cause problems /
flickering.  :(  While you could certainly use the timings on your own
system if they happen to work for you, I don't think it'd be a good
idea to switch the default over to them or anything.  I'm told that
hardware makers will take this type of thing into consideration for
future hardware.

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
