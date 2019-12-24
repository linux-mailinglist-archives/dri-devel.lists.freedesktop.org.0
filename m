Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D8312A240
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2019 15:31:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6B026E09C;
	Tue, 24 Dec 2019 14:30:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DE496E09C;
 Tue, 24 Dec 2019 11:23:07 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id l8so17717209edw.1;
 Tue, 24 Dec 2019 03:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c47JlWEDIhN2S2u1wxTqqESFzvVYGhPlp0cUwZlGkVY=;
 b=hV6Sv9HYva9wtb8hp6tNO6tvePcODpHmJZu/VUzADMIq7e1lydd4AIQm5QcNgB8QLH
 1h+gGHLMQV+DC93LLBNgu5GAcaNfeOYim8qnsSVtJUOBuN5Hcmf3dlduNlw31nhQTYxs
 osdHml8BruM08yn80dRcRPGWfGicWKVsHl0QUj5Iq7BUC/0x0x5AZg+Xs5N3AaEG5l0e
 1hgTzroXNUUC/XTQAcz+7jatKQAUGqM5BqvFRiXGZPRKK0M2gIvP27m5xjBtoCJLxJFT
 S0aFgzHrxoKwh8kAkkC1Q8gr7awSD4Q8qA2B0IdA43b9YkQFPkFIvnRPc7PXIo7w9TXJ
 bfrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c47JlWEDIhN2S2u1wxTqqESFzvVYGhPlp0cUwZlGkVY=;
 b=pYj3bTG4QkqK0jkWtDKpLallB6cjWQhm+EL+UPWTE+nrK8j3nBpJRLd+GyWsw8MrZb
 kLl8wTT/DEsdaYxXM2SmrA3AbxxVKw8SneREPswc8biDUvezK6H5+j2iVcKWftx2ljGZ
 Uv4qikn509Cp/tzOQcvTA2guPLv3AOrHvJZSDIgDfNa1eDG3tIyR8Sc+UTSEGgjx9vtJ
 my968AzWNASl6iiikZDkexTY11+SZIDecZh9jRbI0kJkugAF+gETJ737wolRYbBETTOD
 rUwpX4eYzM1xg9zegy/1qUEI5dUhElTBI+P2R89Qe2AwJh2W6xTos9qa3qWXLiexjEe4
 8Bhg==
X-Gm-Message-State: APjAAAWfB421NfvseHxS5OzegNjN1+H1Gk/vxdm8p6JeycfsCcfW6A3e
 YtVy4VOpqhjOQ5XMuX107zm9sAZ5HLYNBTpi4dI=
X-Google-Smtp-Source: APXvYqwD+JCN10hMA2DFib/zOkIvt8olsyADG5yMRQAnRIpVdhoobkX+Lq9zRK7zOH1PNOCsg/qoxPJQkum6XaM3KOE=
X-Received: by 2002:a17:906:339a:: with SMTP id
 v26mr37490223eja.2.1577186586030; 
 Tue, 24 Dec 2019 03:23:06 -0800 (PST)
MIME-Version: 1.0
References: <20191215211223.1451499-1-martin.blumenstingl@googlemail.com>
 <CAGb2v6528SUOyefhsnjEwG7vfud3+Ce+_=CM3cM4vKiRcmNXAA@mail.gmail.com>
In-Reply-To: <CAGb2v6528SUOyefhsnjEwG7vfud3+Ce+_=CM3cM4vKiRcmNXAA@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Dec 2019 12:22:55 +0100
Message-ID: <CAFBinCBTL05FLiZfBGdGCdq2JZ-_W_zDYKP_nrrUs-YEwaHCfg@mail.gmail.com>
Subject: Re: [RFC v1 0/1] drm: lima: devfreq and cooling device support
To: Chen-Yu Tsai <wens@csie.org>
X-Mailman-Approved-At: Tue, 24 Dec 2019 14:29:55 +0000
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, lima@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, steven.price@arm.com,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 yuq825@gmail.com,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 alyssa.rosenzweig@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 16, 2019 at 4:03 AM Chen-Yu Tsai <wens@csie.org> wrote:
>
> On Mon, Dec 16, 2019 at 5:12 AM Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
> >
> > This is my attempt at adding devfreq (and cooling device) support to
> > the lima driver.
> > I didn't have much time to do in-depth testing. However, I'm sending
> > this out early because there are many SoCs with Mali-400/450 GPU so
> > I want to avoid duplicating the work with somebody else.
> >
> > The code is derived from panfrost_devfreq.c which is why I kept the
> > Collabora copyright in lima_devfreq.c. Please let me know if I should
> > drop this or how I can make it more clear that I "borrowed" the code
> > from panfrost.
>
> I think it's more common to have separate copyright notices. First you
> have yours, then a second paragraph stating the code is derived from
> foo, and then attach the copyright statements for foo.
thank you for the hint!
I found other examples that do it like this, so I'll update it.


Martin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
