Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFCD125711
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 23:42:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BFD06EA33;
	Wed, 18 Dec 2019 22:42:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A42846EA33
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 22:42:12 +0000 (UTC)
Received: by mail-il1-x144.google.com with SMTP id p8so3094536iln.12
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 14:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HUPNGjTxVnCf9t8O1v8YRvPP2CQXKG1MqWvD1p/QE64=;
 b=TmD8VqL0QC029L9QBQZU+bTfXvQswXjeDXnjiIOMPmWs4dhTEN5qRx+I8xn0raKeX5
 hDcIrNbJquXkV5ebv4aCtGwI9MCCjCz9e4PFwTXle0aKuGwqoYOwAbuQLaASjKA1sS1V
 uwICXiz1tyYXpX6mcKkbfEByYEPzD+Iorh3RI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HUPNGjTxVnCf9t8O1v8YRvPP2CQXKG1MqWvD1p/QE64=;
 b=lgnuyIdLcpya2q10Tzab+08rfIvBMBllJzibp7kVopuEO4nT7qTMzh/6exIXxiFKzs
 J+PYMUNTolUFDXzw5WIPJs9DVIBPHAKcre3d0W48vHT0Z2BR1FnsVnb2tNK+t7qlB6Wm
 AIsH4d5Kw7J0nMF6jpSyyG00Pp5jpw8nckCMWTyDFtvE7ErImeKX5qVoqzZf7i9d7fBw
 HeuLFWY/NNqFvf7hrkqe6LuotWYyGQHOLIPLtV40o1xHqKLehmzkdJRcaPLXCmrr6gqV
 gYgjtOJycFEBpU/sSsCuJDcKZkDDrIluMWpLoUbHhcOjiXuOU7ctjp2AuU6SZNsU9uUp
 K6zA==
X-Gm-Message-State: APjAAAV0Rwm1ZPJ7QISlIMJ/j8PTjyPZ+Aiabujv5SVWiJ/5nCB36A/5
 bylye5w206WCgDRVTE/XOFpx2s4rOec=
X-Google-Smtp-Source: APXvYqyw95Ah1HVWIl1xzMEGojXyvxKN69NLtZJmVMdx5nu2qFV05DyHIw54YFsLZMkBLO8a4NiAGQ==
X-Received: by 2002:a92:d642:: with SMTP id x2mr4160991ilp.169.1576708931766; 
 Wed, 18 Dec 2019 14:42:11 -0800 (PST)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com.
 [209.85.166.182])
 by smtp.gmail.com with ESMTPSA id d8sm741554iok.66.2019.12.18.14.42.10
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2019 14:42:10 -0800 (PST)
Received: by mail-il1-f182.google.com with SMTP id f5so3124723ilq.5
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 14:42:10 -0800 (PST)
X-Received: by 2002:a92:ca90:: with SMTP id t16mr3875343ilo.218.1576708930281; 
 Wed, 18 Dec 2019 14:42:10 -0800 (PST)
MIME-Version: 1.0
References: <20191218004741.102067-1-dianders@chromium.org>
 <20191217164702.v2.9.Ib59207b66db377380d13748752d6fce5596462c5@changeid>
 <CAF6AEGs5CKNhKh_ZLUqWh8_2GxiDiuaTC2P-yzHqz+Dvhbp-VQ@mail.gmail.com>
 <CAF6AEGukOwr6TUmo3UySML5LWOC-b7vN4NwJv0OGprFafgTdEw@mail.gmail.com>
In-Reply-To: <CAF6AEGukOwr6TUmo3UySML5LWOC-b7vN4NwJv0OGprFafgTdEw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 18 Dec 2019 14:41:58 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UqFYAoyxaAF4B768j-SeZOp71=Cq84s61W3s8BB7TO+w@mail.gmail.com>
Message-ID: <CAD=FV=UqFYAoyxaAF4B768j-SeZOp71=Cq84s61W3s8BB7TO+w@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] drm/bridge: ti-sn65dsi86: Avoid invalid rates
To: Rob Clark <robdclark@gmail.com>
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
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Dec 17, 2019 at 8:03 PM Rob Clark <robdclark@gmail.com> wrote:
>
> > > +               for (i = 0; i < ARRAY_SIZE(sink_rates); i++) {
> > > +                       rate_times_200khz = le16_to_cpu(sink_rates[i]);
> > > +
> > > +                       if (!rate_times_200khz)
> > > +                               break;
> > > +
> > > +                       switch (rate_times_200khz) {
> > > +                       case 27000:
> >
> > maybe a bit bike-sheddy, but I kinda prefer to use traditional normal
> > units, ie. just multiply the returned value by 200 and adjust the
> > switch case values.  At least then they match the values in the lut
> > (other than khz vs mhz), which makes this whole logic a bit more
> > obvious... and at that point, maybe just loop over the lut table?
>
> (hit SEND too soon)
>
> and other than that, lgtm but haven't had a chance to test it yet
> (although I guess none of us have an eDP 1.4+ screen so maybe that is
> moot :-))

I think v3 should look much better to you.  I also added a note to the
commit log indicating that the DP 1.4 patch was only tested via
hackery...

https://lore.kernel.org/r/20191218143416.v3.9.Ib59207b66db377380d13748752d6fce5596462c5@changeid

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
