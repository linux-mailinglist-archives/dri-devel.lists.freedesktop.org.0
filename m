Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBE921B4EC
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 14:21:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFF3E6EC37;
	Fri, 10 Jul 2020 12:21:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com
 [IPv6:2607:f8b0:4864:20::943])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 984326E054;
 Fri, 10 Jul 2020 12:21:53 +0000 (UTC)
Received: by mail-ua1-x943.google.com with SMTP id h18so1757094uao.6;
 Fri, 10 Jul 2020 05:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TgeLsUmnXThRSQEB4YH187Eiq+CFVWS58pzrpKP+ZS0=;
 b=RB3hp2BEo+UwUaIjYC/Q8v6o1wEqM7gqrDFixlj3pyha6bqFMgRUN3EqxP1tRt2PkF
 5Wgdo7XU0hIcmKhSrmr42KqFKKgi5ccp/rl85g0G5C7J1iK0y0R2IHEN230FkUuO6aYX
 u5INsDbLPSplTDkv2TH9pvjcAULiqV967snj972sJR+S3rN15TB6yRNj6l3f1dkUBJAG
 r3sSjT0JxRs9qIrqIQ6Jh87LBJWI6v5/z85dJ/CxpwtnR33/2JdhCR9VL2bo8l0Hdu3c
 +YW15c+KV4RLcoThYWqu35dBpUUpzjAQ9xBrS9cfL83vpFx+CNxUKspUrJtJt+5qLocE
 epJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TgeLsUmnXThRSQEB4YH187Eiq+CFVWS58pzrpKP+ZS0=;
 b=s8y8AFhuE359WXnJPPW/v/q60uxwF6w9hS/0+KFL3Pl2CyrT6hVDzkNfr/vVNQoEX+
 34MXDJxIc2aLYmnFCwDpNUUnsPRJxQUiBSsiQ1/X7+ImGHGglc27o/RtsKkWnrxflCua
 lZ8kLuymil0zRU5sKSG9f+PA7CyCuUEOg4yQYFGhUUYOBJ5/q97yl0d89ezQFTQgzHFe
 A4efOhNycOLufAh4N6F5mAUPyxBesZf2YkhimwPjplzJfC97Rp7h3uuatE6V2wf2N2sb
 gp8hsKHsc1mLIA0S+2P2JU4qyBsnNFdDt6Jiiz3YCOe3xdTZR2nlxYoUE50ciqOPaK8d
 gOoA==
X-Gm-Message-State: AOAM5332vkzk0CH7/orJLUgIwitfK23iUo6on/f6DFhCWu5C7vF3HE2/
 AyaJyehI4o3bz0btQWbNicLyhalxE6ZNQS9MJl4=
X-Google-Smtp-Source: ABdhPJyyfDd2wiuB9CV7CAJ0532vQqPmz8MkL+LuqPhLdEyP/fWS6Vsgoep4ssp74KuTs4NdiHswa76kDE+CknfX3UU=
X-Received: by 2002:ab0:1461:: with SMTP id c30mr9003027uae.124.1594383712724; 
 Fri, 10 Jul 2020 05:21:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200710074143.306787-1-christian.gmeiner@gmail.com>
 <58ef264448eb3ea75f846513210a5430b75b44c6.camel@pengutronix.de>
 <CAH9NwWfQfejtup6hHi68gE_VJs2RkL=298NURELqt3kVfc_AVA@mail.gmail.com>
In-Reply-To: <CAH9NwWfQfejtup6hHi68gE_VJs2RkL=298NURELqt3kVfc_AVA@mail.gmail.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Fri, 10 Jul 2020 14:21:41 +0200
Message-ID: <CAH9NwWe1XSY_HtYdn=TVMRQov0m5T2CNtKpY8UZqbf6OUZHV2Q@mail.gmail.com>
Subject: Re: [PATCH 0/4] Add support for GPU load values
To: Lucas Stach <l.stach@pengutronix.de>
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
Cc: David Airlie <airlied@linux.ie>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>, Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas,

Am Fr., 10. Juli 2020 um 10:44 Uhr schrieb Christian Gmeiner
<christian.gmeiner@gmail.com>:
>
> Hoi Lucas
>
> Am Fr., 10. Juli 2020 um 10:31 Uhr schrieb Lucas Stach <l.stach@pengutronix.de>:
> >
> > Hi Christian,
> >
> > Am Freitag, den 10.07.2020, 09:41 +0200 schrieb Christian Gmeiner:
> > > This patch series add support for loadavg values for GPU
> > > sub-components. I am adding a SMA algorithm as I was not
> > > really sure if EWMA would be a good fit for this use case.
> >
> > 1 second is a pretty long window in GPU time. Why do you feel that a
> > simple moving average is more appropriate than a exponentially
> > weighted one here? Note that I haven't given this any thought myself
> > and haven't made up my mind yet, so this is a honest question to
> > understand the reasoning behind your choice.
> >
>

I have v2 ready except for this point. If you want to go with EWMA could you
provide me with a good weight reciprocal value to use?

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
