Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D035C3CB23F
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 08:13:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D31CC6E90F;
	Fri, 16 Jul 2021 06:13:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com
 [IPv6:2607:f8b0:4864:20::e33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81EA86E90F
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 06:13:49 +0000 (UTC)
Received: by mail-vs1-xe33.google.com with SMTP id j8so4464066vsd.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 23:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BaWOg4i1QyFovhcvCT5O/tinkkoBzWCthCbXwwL19/s=;
 b=Gpq//oAZWIx4e5//RMNF3P0AZmL3DAqBXSoas7dyXNiARwlJ3YCeDmk+iP/iiN5f3R
 J9Sw7KU9sF2OLf7L5bU0T61owRSw7AGbii0Q4W2lDibUyyQi248Oamvf07qvDxxhLNu7
 QExc5vWjhHp5kPZB3JFxt5GGYbmOjWOynZ1v8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BaWOg4i1QyFovhcvCT5O/tinkkoBzWCthCbXwwL19/s=;
 b=Tp5cOdkL+eTeX9oHfv51X8gM3Gi67zNiTSMqBLauDmOZzwAZ4Z+w4w6bdvniZa3/RJ
 9qK4yq+R5mM4KqZWcOJjH8O5wn4fLQq/N4RePME9AnPs1evCGdGJ8lynwdJj1RymzT/E
 PHnXvTeKwIc0B9LQU7v4fg1D0/I4hJuPBurp9wdBOGM5prfhqASkIJQanoYtD7gtvgZO
 fyD5c+HrDIDrIyCQEfmT5kylOs5oPVHRagO3bPGN7LtsOEIs8hTYx3Iny+qeyinuHi2o
 8qHzD/Srfkh3X2E6U02wEGAbye9wcQDyI8SH7ELJDtLnwCjHi2oVNnaKgobCogsEPPrS
 Qn0Q==
X-Gm-Message-State: AOAM532lh6cr2tcADZs+iAR5sy3RXw4cxSFm7yIlxFwJZ5ALbGEWZ27d
 Oj1exWswL5mCAp8k/OCyOICMegjUPAVfZMHX01L0yg==
X-Google-Smtp-Source: ABdhPJyUCBVFTZ95KegdcIpYpw6fUVW81J7XQ+o86thpKF6Pwc143zDeg+GjOAmfOak9O9kcvzTMOFLOWOswj5GjunU=
X-Received: by 2002:a67:87c7:: with SMTP id j190mr11270602vsd.47.1626416028582; 
 Thu, 15 Jul 2021 23:13:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1624349479.git.xji@analogixsemi.com>
 <308427448195e2db37a32997c6d32905c96ca876.1624349480.git.xji@analogixsemi.com>
 <CAG3jFys6D=-L-Aez4aWuE4nM7qJCtn4wPws3TKxbkRzcAoFR0A@mail.gmail.com>
 <20210707073051.GA936385@anxtwsw-Precision-3640-Tower>
 <20210713221010.GA916196@robh.at.kernel.org>
 <20210716053215.GA1121520@anxtwsw-Precision-3640-Tower>
In-Reply-To: <20210716053215.GA1121520@anxtwsw-Precision-3640-Tower>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Fri, 16 Jul 2021 14:13:37 +0800
Message-ID: <CANMq1KDprHg2eVN6p_PBOt4O9uw6Qt+5o0QasxhO9oPD=w5CAg@mail.gmail.com>
Subject: Re: [PATCH v9 1/4] dt-bindings:drm/bridge:anx7625:add vendor define
 flags
To: Xin Ji <xji@analogixsemi.com>
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Devicetree List <devicetree@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Zhen Li <zhenli@analogixsemi.com>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Mark Brown <broonie@kernel.org>,
 Sheng Pan <span@analogixsemi.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Nicolas Boichat <drinkcat@google.com>,
 =?UTF-8?Q?Ricardo_Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>,
 Bernie Liang <bliang@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 16, 2021 at 1:32 PM Xin Ji <xji@analogixsemi.com> wrote:
>
> On Tue, Jul 13, 2021 at 04:10:10PM -0600, Rob Herring wrote:
> > On Wed, Jul 07, 2021 at 03:30:51PM +0800, Xin Ji wrote:
> > > On Thu, Jun 24, 2021 at 01:57:22PM +0200, Robert Foss wrote:
> > > > Hey Xin,
> > > >
> > > > I would like to merge this series now, but this patch needs a review
> > > > first. Maybe Laurent/Rob Herring are good candidates.
> > > >
> > > >
> > > > Rob.
> > > Hi Rob, I get Laurent/Rob comments before, and explained why we needs
> > > these DT properties, so far, I didn't get any response.
> >
> > Do I have to go dig that up? If it was more than a week ago, assume I
> > don't remember. This is 1 of 100 bindings a week.
> >
> > Justify why this is needed in your commit message.
> Hi Rob, I'll give more detail description in commit message.
> >
> > > Hi Rob Herring and Laurent, for the DT property lane0/1-swing, Google
> > > engineer has strong demond for them, they don't want to move DP swing
> > > adjusting to kernel, thus may cause change the driver code in each
> > > project, so config them in DT is a best option.
> >
> > Where's the ack from a Google engineer?
> They didn't give the review ack, but we discussed it offline. Nicolas
> Boichat known this.

Yeah I suggested this here:
https://lore.kernel.org/patchwork/patch/1359670/#1564682 .

I also looked at the ANX7625 datasheet at the time and it was pretty
clear to me that this was not something customers could tune without
ANX's help, but it'd be great if Xin Ji can describe a bit more.

>
> Thanks,
> Xin
> [snip]
