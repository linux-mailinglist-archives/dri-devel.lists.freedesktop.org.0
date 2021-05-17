Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7668382E15
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 15:59:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D436E972;
	Mon, 17 May 2021 13:59:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE8BD6E972
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 13:59:26 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 d3-20020a9d29030000b029027e8019067fso5571176otb.13
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 06:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=grsFLfdmnhQWak5SoKhSm/4y/opvzaly/vtv1hP+Vc8=;
 b=e7yYTh8rWW32VR4LtrRYh01dcsmOu1/R8L6iCQW2txmAwUWjai4mQU4w5Vz2sxBYIm
 MOy03LKV5lnXKvERZzWz42gQfC1NSih9+5izdC8mbAo43HWWzSPrurWIdFQhpaD225wm
 0hCwZcItudJOlTsSOBQweRv+jGPGhBsyyVFw6TTfabgr3bWCCUbZ+H2TH3rrX4cQ5aLb
 62X278VTVb1PSG98T+aMrH7KAHigT9e5O6CwkwN2KCmir5fdGkjFUl13lA4YkYCHpnuY
 HUovGTx4s8N+nUfnoKlh56bXrMQSfZgibBtL5/EbeEf9iQXjTMNkg6LVINB/J0/Iq+Cb
 DCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=grsFLfdmnhQWak5SoKhSm/4y/opvzaly/vtv1hP+Vc8=;
 b=MyLXUFgl3Zom+ELGGu7GSPa1rFMZFQAw2Xn5Auy8PxDUaN83oiNzXtakocsa133czB
 62A/wWbxDK2U1HZrgaVTZpTvnFD4P0fXThcux5k5ump5c+4Bs27JMgbdnv4w86RtYqQe
 khinvBawMKpkRqqd+inG4npjXs922zE81sjffCRzeeLlKQsWoOIP59A7AXFZD/jPvatD
 VO4UvHFSLVg90NFuDbQxXSsoG89+tRzgKweuqwVM5keci7A2Lk/svWW8a4CC9vAwAtf6
 9g0K/zXY5AqFcWxs1RO4IBe3a0yrVgXJtbf7sat3viXMNU0Rg9F8ClCC/+yKvJR2ufEQ
 A9Ag==
X-Gm-Message-State: AOAM5301MQDBQmAqIs5Vr8ckUQF4Ybw4rBKBpv7pOMlRc75REsj4JmUP
 IRdgU3HlVR3VYbUl2FW5/PRmiay/nptL+QTAauDQ0AuBNqc=
X-Google-Smtp-Source: ABdhPJzWZay5z3gBozKL+vutYLspJ27nqMnj26gpEwhHlqc514lOxcgCzf2TvldbAKR39h4SO77OqaadS+fX8Qw/INE=
X-Received: by 2002:a9d:6548:: with SMTP id q8mr19732065otl.311.1621259966056; 
 Mon, 17 May 2021 06:59:26 -0700 (PDT)
MIME-Version: 1.0
References: <68fa29da-d548-b179-cae4-77de5ae7766f@posteo.net>
In-Reply-To: <68fa29da-d548-b179-cae4-77de5ae7766f@posteo.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 17 May 2021 09:59:15 -0400
Message-ID: <CADnq5_Mn+5xp=M22NJHLKgvv2w95OofrSMgvFSPOhBOpEJR7iw@mail.gmail.com>
Subject: Re: dual RX460 result in logspam about P2P DMA
To: Richard Dietrich Wachler <rwachler@posteo.net>
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
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, May 15, 2021 at 10:12 AM Richard Dietrich Wachler
<rwachler@posteo.net> wrote:
>
> Excuse my novicesness,
>
> i use 2 RX460 on a KGPE-D16 server board to drive 4 displays.
>
> 02:00.0 VGA compatible controller: Advanced Micro Devices, Inc.
> [AMD/ATI] Baffin [Radeon RX 460/560D / Pro
> 450/455/460/555/555X/560/560X] (rev cf)
> 06:00.0 VGA compatible controller: Advanced Micro Devices, Inc.
> [AMD/ATI] Baffin [Radeon RX 460/560D / Pro
> 450/455/460/555/555X/560/560X] (rev cf)
>
> There is a noticeable mouse lag on the second card, so i investigated
> and got logspam 20 times a second like this:
>
> May 15 15:58:27 xx kernel: amdgpu 0000:02:00.0: cannot be used for
> peer-to-peer DMA as the client and provider (0000:06:00.0) do not share
> an upstream bridge or whitelisted host bridge
>
> It seems there is no real way to disable the check or disable P2P DMA
> completely. Or maybe my problem is elsewhere?
>
> Thanks for any hints, i havent found anything about this as its quite a
> new feature.

Fixed in this patch:
https://patchwork.kernel.org/project/dri-devel/patch/20210517115705.2141-1-christian.koenig@amd.com/

Alex
