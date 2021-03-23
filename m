Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7686346D7C
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 23:46:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C304B6E1A7;
	Tue, 23 Mar 2021 22:46:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC066E1A7
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 22:46:11 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id z10so16199731qkz.13
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 15:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qQSTgxcnf1zrFoFiqLMjc/7MKHfQmsaChwO0zJJ4J9I=;
 b=M4ujlSG8CB6M2INhiLKC8aEp67I4lukpqFbMB8oxOvwsmG5tei3oCFUhjcvP4iEVI1
 ggsHpmk+s5wy1NNhU3WvQVEEtWY1uwdc31QmZwCV3EupGf8Rzg36PJ8n6as/KuPKlu9R
 8XxUwFGJnANiCZUeMt2w2+j57o+Yo6uwG8fV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qQSTgxcnf1zrFoFiqLMjc/7MKHfQmsaChwO0zJJ4J9I=;
 b=nM/31nsitXISiGcAu5fKaQ/g3FsAB72ZUVyNuhQ1ndJ2kpSdRPsmWH4kc/Hsytl29c
 jy0iva1Hb1u8sfrdIsRan/O0G0eRFeoNgUcowtUYy/nxyx6inAzvfsTypmtNdqUsEJ/4
 6qpaKnFpcukJoMQWYG6hSnQyDI2G4fcp+t/IedutSfAFLsVtFyeQ2G1W50HkPIOIrZP2
 XctBqN1VlGRdhgpNnNyCJ58cQ2pQUG+WyFjqB89quBvYjM86NJlbno4Z62sqzkpXtJel
 PiA9WsnBlfROaB33WrywuRSkfArAnbfH9X+5Zo4OhoHQlJiaJmvhdpPlYFG+0YX+wtTj
 jRDg==
X-Gm-Message-State: AOAM5305DzaX0wpI4gx1P0gBimA0oAiOu7hvuYFH07+AYO+cUxpVD8KL
 OxdKHj//jtGIht4MQXnr+/K9fNTP0N4uKQ==
X-Google-Smtp-Source: ABdhPJy1c0sAqlTWzxWsHw+29k0f6jt9p6Svb/21T5nS1P5WMqwqSpxg7bSOCtDuv61IcIpCpxuEWg==
X-Received: by 2002:a37:a282:: with SMTP id l124mr341176qke.37.1616539570663; 
 Tue, 23 Mar 2021 15:46:10 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com.
 [209.85.219.169])
 by smtp.gmail.com with ESMTPSA id 6sm206587qth.82.2021.03.23.15.46.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 15:46:10 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id l15so1033219ybm.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 15:46:09 -0700 (PDT)
X-Received: by 2002:a25:6088:: with SMTP id u130mr712959ybb.257.1616539569454; 
 Tue, 23 Mar 2021 15:46:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210322030128.2283-5-laurent.pinchart+renesas@ideasonboard.com>
 <CAD=FV=UDd9LC-sMEk0hn10roeM+Cz6VNekcZomkQXLhfw0-4wA@mail.gmail.com>
 <YFphd/KA2Z5p5d4k@pendragon.ideasonboard.com>
In-Reply-To: <YFphd/KA2Z5p5d4k@pendragon.ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 23 Mar 2021 15:45:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VsF2CQD3pNoyOXqdcJop3L7Y-0qK8fVkqZOgW4eqVNhw@mail.gmail.com>
Message-ID: <CAD=FV=VsF2CQD3pNoyOXqdcJop3L7Y-0qK8fVkqZOgW4eqVNhw@mail.gmail.com>
Subject: Re: [RFC PATCH 04/11] drm/bridge: ti-sn65dsi86: Use bitmask to store
 valid rates
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, linux-renesas-soc@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Mar 23, 2021 at 2:46 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Doug,
>
> On Tue, Mar 23, 2021 at 02:08:55PM -0700, Doug Anderson wrote:
> > On Sun, Mar 21, 2021 at 8:02 PM Laurent Pinchart wrote:
> > >
> > > The valid rates are stored in an array of 8 booleans. Replace it with a
> > > bitmask to save space.
> >
> > I'm curious: do you have evidence that this does anything useful? I
> > guess you're expecting it to save .text space, right? Stack usage and
> > execution time differences should be irrelevant--it's not in a
> > critical section and the difference should be tiny anyway. As far as
> > .text segment goes, it's not obvious to me that the compiler will use
> > fewer instructions to manipulate bits compared to booleans.
> >
> > Doing a super simple "ls -ah" on vmlinux (unstripped):
> >
> > Before: 224820232 bytes
> > After: 224820376 bytes
> >
> > ...so your change made it _bigger_.   OK, so running "strip
> > --strip-debug" on those:
> >
> > Before: 26599464 bytes
> > After: 26599464 bytes
> >
> > ...so exactly the same. I tried finding some evidence using "readelf -ah":
> >
> > Before:
> >   [ 2] .text             PROGBITS         ffffffc010010000  00020000
> >        0000000000b03508  0000000000000000 WAX       0     0     65536
> >   [ 3] .rodata           PROGBITS         ffffffc010b20000  00b30000
> >        00000000002e84b3  0000000000000000 WAMS       0     0     4096
> >
> > After:
> >   [ 2] .text             PROGBITS         ffffffc010010000  00020000
> >        0000000000b03508  0000000000000000 WAX       0     0     65536
> >   [ 3] .rodata           PROGBITS         ffffffc010b20000  00b30000
> >        00000000002e84b3  0000000000000000 WAMS       0     0     4096
> >
> > Maybe you have some evidence showing an improvement? Ah, OK. I
> > disassembled ti_sn_bridge_enable() and your patch saves 12 bytes, but
> > I guess maybe alignment washes it out in reality...
> >
> >
> > In terms of readability / conventions, I personally find this change a
> > bit of a wash. I mean, I guess I originally implemented it as an array
> > and I thought that was the most readable, but I like bitfields fine
> > too. If everyone loves it then I won't object, but to me it feels like
> > touching lines of code for something that's personal preference. ;-)
>
> You're right that the .text and CPU time improvements were not my
> target. I was focussed on stack usage, as that's a limited resource in
> the kernel. I don't have any evidence that we would be close to any
> limit, so it's tiny, and if you or anyone else have a strong opinion
> that an array of booleans is better due to readability concerns, I can
> drop this change. I only thought about those poor 7 bits in every bool
> that sat there unused, feeling useless :-)

LOL. Thinking about it a bit more, I guess I feel a bit lame saying
that the array of booleans is more readable. I guess I'd call them
equivalently readable. So I guess the downside of this patch is just
churn. If someone is maintaining a downstream kernel, it's an extra
patch to take. If someone is running "git blame" it's an extra layer
to walk back to find the history of the code. That being said, it's
really not a big deal. I'll leave it up to you if you want to include
the patch in your next version or if my arguments have convinced you.
;-)

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
