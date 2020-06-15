Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7249C1FA9B0
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 09:10:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A2FB6E837;
	Tue, 16 Jun 2020 07:09:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C7CF6E550;
 Mon, 15 Jun 2020 23:05:10 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id q8so19899840iow.7;
 Mon, 15 Jun 2020 16:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VFv24iOZv9KF5trz0flSTD/rWAv9Y05l58tQASHoWIg=;
 b=kQD+05pHpznMTPV9+Two/R6GytrwdxDxzKo83oW+1gco16CFz/ug3zBMKAMho0aCXF
 yIYAiej8OhyU5LxyzDZnHLNreRRCbGmeMXu0FqiJ02acS/T/sH7g8D2fDQ0O0xagtkFY
 i7bMk0V3Joke5vnlkHnT+L5Ws9NJgcMlK4aDU03riyPjmKoQpAiwcY6g0EKEUp6vk8j5
 mqhXM0Sk5iJqgW3AylowHf9G5p1VrFRuNRrVTfSJhTr9mL6npN4W0fYEkW3eS33S445p
 4TfIJHUu2GOE2wHAyZ7AQvuYz9u4Dy9bYacQ3HjJMO2tP0QEc32I4Ux9N/iy/Yh3srnW
 eVNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VFv24iOZv9KF5trz0flSTD/rWAv9Y05l58tQASHoWIg=;
 b=bYBsuciZbvwIUCfn4qkpUzZNDCrqAch6t0+3w6XsTamkMiAGApbufVVfTtbyfJFBDB
 6SgnHeKvTzGBiWkJjulFW0PsEHO4GNDuFZnItTUUGzUTpxGrBc1iUB3mu4Puk040sTGi
 dF8wS1poPN/r71QInoRZUli7Z6XAPJt0wGJuc/IXqqpDHlrwhiP1D7hrJFBaXd9T35y9
 QWJSpi6CSXxZrryqrb7Px1TMHJQ3rNf0wZxKbyjU4WUaHSad9hzUBfyRPHA0jMnIRYbf
 gTTwZqReb5kIqMkrQ9BLmDCrupu9ZC2pyJLeQxeAJxEBxiehibAlHylWJagB/lGwiOSM
 SmKA==
X-Gm-Message-State: AOAM530m8UWDSbB+sT1gTz3AZtLMa+lCdI0X8IQbzrrAXf4So/1Rdy1e
 P5u0wiVTONcZQy9lqi/M+WBvNrSNSO++32kG5jM=
X-Google-Smtp-Source: ABdhPJyo/ojNDoI/BEqlvGOGeUOvo9mXeqcYNWw009OTq0g74atntpiKvyM0XDPNO+z656j1sxQZkGIM5rT+4fO5hiI=
X-Received: by 2002:a6b:8b12:: with SMTP id n18mr227575iod.160.1592262309281; 
 Mon, 15 Jun 2020 16:05:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200612015030.16072-1-tanmay@codeaurora.org>
 <159200440578.62212.5195358467251573190@swboyd.mtv.corp.google.com>
 <1eda01da33b620ddee5162be3326853f@codeaurora.org>
In-Reply-To: <1eda01da33b620ddee5162be3326853f@codeaurora.org>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Mon, 15 Jun 2020 17:04:57 -0600
Message-ID: <CAOCk7NrX9Lk6GQKXcFMd1CHHu7CjVg7hUAwt1LyNFdVHHGPO-g@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v6 0/5] Add support for DisplayPort driver on
To: tanmay@codeaurora.org
X-Mailman-Approved-At: Tue, 16 Jun 2020 07:09:12 +0000
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
Cc: DTML <devicetree@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 MSM <linux-arm-msm@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <seanpaul@chromium.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 aravindh@codeaurora.org, freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 15, 2020 at 4:51 PM <tanmay@codeaurora.org> wrote:
>
> On 2020-06-12 16:26, Stephen Boyd wrote:
>
> Thanks for reviews Stephen.
>
> > Quoting Tanmay Shah (2020-06-11 18:50:25)
> >> These patches add support for Display-Port driver on SnapDragon
> >> hardware. It adds
> >> DP driver and DP PLL driver files along with the needed device-tree
> >> bindings.
> >>
> >> The block diagram of DP driver is shown below:
> >>
> >>
> >>                  +-------------+
> >>                  |DRM FRAMEWORK|
> >>                  +------+------+
> >>                         |
> >>                    +----v----+
> >>                    | DP DRM  |
> >>                    +----+----+
> >>                         |
> >>                    +----v----+
> >>      +------------+|   DP    +----------++------+
> >>      +        +---+| DISPLAY |+---+      |      |
> >>      |        +    +-+-----+-+    |      |      |
> >>      |        |      |     |      |      |      |
> >>      |        |      |     |      |      |      |
> >>      |        |      |     |      |      |      |
> >>      v        v      v     v      v      v      v
> >>  +------+ +------+ +---+ +----+ +----+ +---+ +-----+
> >>  |  DP  | |  DP  | |DP | | DP | | DP | |DP | | DP  |
> >>  |PARSER| | HPD  | |AUX| |LINK| |CTRL| |PHY| |POWER|
> >>  +--+---+ +---+--+ +---+ +----+ +--+-+ +-+-+ +-----+
> >>     |                              |     |
> >>  +--v---+                         +v-----v+
> >>  |DEVICE|                         |  DP   |
> >>  | TREE |                         |CATALOG|
> >>  +------+                         +---+---+
> >>                                       |
> >>                                   +---v----+
> >>                                   |CTRL/PHY|
> >>                                   |   HW   |
> >>                                   +--------+
> >>
> >
> > I've never seen a block diagram for a driver before...
> >
> It is here for v5. https://patchwork.freedesktop.org/series/74312/

I think Stephen is nitpicking your wording, and you seem to not be
understanding his comment.  I'm sorry if I am mistaken.

The "DP driver" would seem to refer to the linux software driver you
are proposing patches for, however this diagram looks like a hardware
diagram of the various hardware blocks that the Linux driver code (the
"DP driver") is expected to interact with.  I believe you should
re-word "The block diagram of DP driver is shown below:" to be more
specific of what you are describing with your figure.  IE your words
say this is a block diagram of the software, when it looks like it is
a block diagram of the hardware.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
