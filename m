Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C35412D787
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2019 10:37:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F7E76E1E2;
	Tue, 31 Dec 2019 09:37:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E34889C8D
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Dec 2019 23:19:22 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id v28so31203290edw.12
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Dec 2019 15:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XxSZstiEaMg+m65lDkW2E8KdL5f2Kpio4F4xfu4/sKE=;
 b=qEqcxGvrL6Xx0mQ/8Z3GHtEKOGcTeVvqVgOM2yp8DAnAgG0eVY8UHkYkhMS07BxKzY
 WqQXGPhS2yeWl3144e7q6YMX/2OJQ9VDtqy2K16OhSEm8Cx0elYHZlEEeJL060DazFvT
 vskiCsMN0M1sPeQSpUPBZNb/LILTYVqOKdfmj/3wCIXX6bcsFHh7fQicz3v4/CUVoAeM
 QjiDh5N+scPktd1DVSvLqHyyYn2nNMr9YZRXPnbQ+9JFpbj3LVgXrGntEW0846Qb28ex
 NU1dwyNKr4E/RoF919Qr3QM6N0DQvEA3nByGuaBvSldBPXa+StlqqGTxCTXW8mwpfLwO
 ec3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XxSZstiEaMg+m65lDkW2E8KdL5f2Kpio4F4xfu4/sKE=;
 b=MdlXWXAomjNmrDXVOSLzAcDnKGSuB9FG3KJyTDnhlRoD/Ozcv/yxLFI4yEzonJtm1p
 ZYFZfT++xwQcUaZhZ9F5OcyuAjZyfcLoGD3eMn+yBg5YUd0EgMwijRU4oXCYxHJ/5DYh
 N9JP7lZfDWbrwde8ejkt/f5OAG69h6W+XZuJW029VlgIrEIaW+5mDMpxTYIvDcGvNba3
 1QUJeDTpDJnWbTZ98V3Vvnb1X3VAes+KOWRACgtHBZl6JnGLTwFWHkQ/92+35Y1hvhGw
 YJvv0IJXQ2Mj3HiPIzXqf2mEb28Ly7uyqbSrLPdLSpDIjsg4CAtAIN7cE4/Y9WgTZkUZ
 kuTw==
X-Gm-Message-State: APjAAAUaQjhWYA0ZxA67uQwHCVbELjiXRArmQN73KJi0E8/RoxqUp6w+
 1YQemPMgp+vDkauz62TjLtmDazNZ1DYHgTVTj54=
X-Google-Smtp-Source: APXvYqx5hpszRc1esYWuJMYLxjiI1twZUv4Oyfi4w8d8PUEWWIYhTywMgOhwl9CLM8r56NOREovBKjh3zWBx5AgNoQ4=
X-Received: by 2002:a17:906:cc8b:: with SMTP id
 oq11mr67972062ejb.193.1577661561171; 
 Sun, 29 Dec 2019 15:19:21 -0800 (PST)
MIME-Version: 1.0
References: <20191227173707.20413-1-martin.blumenstingl@googlemail.com>
 <20191227173707.20413-2-martin.blumenstingl@googlemail.com>
 <dd38ff5c-6a14-bb6a-4df5-d706f99234e9@arm.com>
In-Reply-To: <dd38ff5c-6a14-bb6a-4df5-d706f99234e9@arm.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 30 Dec 2019 00:19:10 +0100
Message-ID: <CAFBinCDs3a8TJcQKgHUkDvssMR6Y2Kys38p50P0q=2KOiDTNHg@mail.gmail.com>
Subject: Re: [RFC v2 1/1] drm/lima: Add optional devfreq support
To: Robin Murphy <robin.murphy@arm.com>
X-Mailman-Approved-At: Tue, 31 Dec 2019 09:37:01 +0000
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
Cc: tomeu.vizoso@collabora.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com,
 linux-rockchip@lists.infradead.org, wens@csie.org, yuq825@gmail.com,
 linux-amlogic@lists.infradead.org, alyssa.rosenzweig@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Robin,

On Sun, Dec 29, 2019 at 11:58 PM Robin Murphy <robin.murphy@arm.com> wrote:
>
> Hi Martin,
>
> On 2019-12-27 5:37 pm, Martin Blumenstingl wrote:
> > Most platforms with a Mali-400 or Mali-450 GPU also have support for
> > changing the GPU clock frequency. Add devfreq support so the GPU clock
> > rate is updated based on the actual GPU usage when the
> > "operating-points-v2" property is present in the board.dts.
> >
> > The actual devfreq code is taken from panfrost_devfreq.c and modified so
> > it matches what the lima hardware needs:
> > - a call to dev_pm_opp_set_clkname() during initialization because there
> >    are two clocks on Mali-4x0 IPs. "core" is the one that actually clocks
> >    the GPU so we need to control it using devfreq.
> > - locking when reading or writing the devfreq statistics because (unlike
> >    than panfrost) we have multiple PP and GP IRQs which may finish jobs
> >    concurrently.
>
> I gave this a quick try on my RK3328, and the clock scaling indeed kicks
> in nicely on the glmark2 scenes that struggle, however something appears
> to be missing in terms of regulator association, as the appropriate OPP
> voltages aren't reflected in the GPU supply (fortunately the initial
> voltage seems close enough to that of the highest OPP not to cause major
> problems, on my box at least). With panfrost on RK3399 I do see the
> supply voltage scaling accordingly, but I don't know my way around
> devfreq well enough to know what matters in the difference :/
first of all: thank you for trying this out! :-)

does your kernel include commit 221bc77914cbcc ("drm/panfrost: Use
generic code for devfreq") for your panfrost test?
if I understand the devfreq API correct then I suspect with that
commit panfrost also won't change the voltage anymore.

this is probably due to a missing call to dev_pm_opp_set_regulators()
which is supposed to attach the regulator to the devfreq instance.
I didn't notice this yet because on Amlogic SoCs the voltage is the
same for all OPPs.

I'll debug this in the next days and send an updated patch (and drop
the RFC prefix if there are no more comments).


Regards
Martin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
