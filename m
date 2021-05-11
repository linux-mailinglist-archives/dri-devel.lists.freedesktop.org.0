Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CE437A511
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 12:52:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3941D6EA11;
	Tue, 11 May 2021 10:52:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B2516EA11
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 10:52:17 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id b25so13399392oic.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 03:52:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LJ6/iEx981OsThdHsoNHle4saMckTPoLWOXMh4tuyVg=;
 b=eDFl1PtVchg7A9aLJmwUDLU+T6zIk2rdhEnQmrzy/LcuvdJxCbNAKUIby5pWlUE2Lr
 N2emqE5ziK/GWeiS48dW3MCD/gcJUxjSthLtK/+rCfe0VCDJnbR3TaPA1LbZA1nO8eyp
 LislCVN1fzbUWBM3j+YHBGMCCaDzJJ10JeKODaAOoZeuOIJVaHHiJL5byPmq706xGQjS
 0Fr91GPjA0mgqUWAUFH0n8gy5FcjUciL6JRH+qLtxVcB1A3p1ZXBp8I8HR2B4mFfE6vE
 DvdZetzOLptZuJSoQoAlEzH7VJ5RPdSr4n44WE66op7dXF+Cb+bEGDdQ2io/eao3H6Yn
 ThCw==
X-Gm-Message-State: AOAM5333ev/LZDLedEHuW9y/a9iBqOMKouMviQ1Tc4LYDpG2nX2UGq5d
 VvlUfq9i4FEg7qQh0xBiNStajtCj7I46DwGUVwQ=
X-Google-Smtp-Source: ABdhPJwZq8P+r2q3I4vQUuyKzAJKw8MSL1bi+Xg+MXsSXXSqi5MCoC4NztrTDQcz1iZ1sR8OfL6FDUIj4iRIHoC+hM4=
X-Received: by 2002:aca:1815:: with SMTP id h21mr2513827oih.69.1620730336930; 
 Tue, 11 May 2021 03:52:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210508074118.1621729-1-swboyd@chromium.org>
 <YJlZwYS+oH7W5WjO@phenom.ffwll.local>
 <CAE-0n52S=LFRx93qVyWBpF5PmdCEbWH_+HnN0Do9W45kiJLCbQ@mail.gmail.com>
 <CAKMK7uE_yrXNdEYTf-snNU9dS+=6AKOmUxRuLSHLWBTOtVwpmg@mail.gmail.com>
 <CAE-0n50d8_OtZTpBGaz0uhj6AO823_kwHg9+SJK6ar=e+rGxFA@mail.gmail.com>
In-Reply-To: <CAE-0n50d8_OtZTpBGaz0uhj6AO823_kwHg9+SJK6ar=e+rGxFA@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 11 May 2021 12:52:06 +0200
Message-ID: <CAJZ5v0h42fTKueFxrB6fpc9YBVNyDsCBryAf_geS-=0+OQQqjg@mail.gmail.com>
Subject: Re: [PATCH] component: Move host device to end of device lists on
 binding
To: Stephen Boyd <swboyd@chromium.org>
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Russell King <rmk+kernel@arm.linux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 10, 2021 at 9:08 PM Stephen Boyd <swboyd@chromium.org> wrote:

[cut]

>
> >
> > > I will try it, but then I wonder about things like system wide
> > > suspend/resume too. The drm encoder chain would need to reimplement the
> > > logic for system wide suspend/resume so that any PM ops attached to the
> > > msm device run in the correct order. Right now the bridge PM ops will
> > > run, the i2c bus PM ops will run, and then the msm PM ops will run.
> > > After this change, the msm PM ops will run, the bridge PM ops will run,
> > > and then the i2c bus PM ops will run. It feels like that could be a
> > > problem if we're suspending the DSI encoder while the bridge is still
> > > active.
> >
> > Yup suspend/resume has the exact same problem as shutdown.
>
> I think suspend/resume has the exact opposite problem. At least I think
> the correct order is to suspend the bridge, then the encoder, i.e. DSI,
> like is happening today. It looks like drm_atomic_helper_shutdown()
> operates from the top down when we want bottom up? I admit I have no
> idea what is supposed to happen here.

Why would the system-wide suspend ordering be different from the
shutdown ordering?
