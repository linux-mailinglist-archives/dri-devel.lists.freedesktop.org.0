Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A24411EF55
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2019 01:48:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 340D26EE27;
	Sat, 14 Dec 2019 00:48:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C2D6EE27
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Dec 2019 00:48:12 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id f10so925972ils.8
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 16:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vFS8VgWqLfvH3Ij7xQNX1+MJfR1R/okTz8jIXQ/PrWw=;
 b=KHpcHkONtDRBkeXUyGK4TV4REhOe28eSqOpXzWRjTuEoQim33Pz9kdTNOakFhamF+2
 oBnmWQErhxq3ML+ldiVgaxFs4m8k5S1eCZhqaC1hax0V7votOZGHr8Y/bYrGxjIDJ/sH
 t282JVnHXDA3Kk/0/SW2h0yfhUsLzn5NgoZMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vFS8VgWqLfvH3Ij7xQNX1+MJfR1R/okTz8jIXQ/PrWw=;
 b=DYtUeQUc1Q3ZHmCtYMyukPmXw4TB6CbVSOXu7vCYltqmtnwPAw5WR0apug9DJ4aSGN
 kzgKrtIK3Z46KIFrf+zeMc+AwmcFZTUpp+hUMp+RfSTxMguX92gGILhPgkB3E+rHNiGL
 83bheDI8ZldYFeQH6Hv0VfQRhhS4KuqMKgTw8UZY82HPfZfFvGMo7ggZxgbYPNIknaue
 XV8nxVx8ApyQUx3til1en+GW4P9oZtG0+7kzdjrEiz7mN7TMa1YmHKHcnV8Mhp+Z1tlq
 seuCrDA4jvLNL3odz9q8Jgm68ioIusKvaw554G/y2w7MBCxcqPmANhkBOGJbacDx+QqZ
 47hg==
X-Gm-Message-State: APjAAAXFdYBfqNrFFfJsQTwhMGs6vnMW1aptULt0WYQ2dp0eprfjzT7j
 1jBnHCkgmFHdBk1Q7xatLnibrbDqgLU=
X-Google-Smtp-Source: APXvYqximr1QPvzm55Q8NgqDzvVq9pgdq4iy0RZIYpIeuO98r9ZbGZ5gKwXp/sjriuzkICEMWOMabg==
X-Received: by 2002:a92:5d5d:: with SMTP id r90mr2007004ilb.284.1576284492127; 
 Fri, 13 Dec 2019 16:48:12 -0800 (PST)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com.
 [209.85.166.46])
 by smtp.gmail.com with ESMTPSA id n2sm3260466ilh.88.2019.12.13.16.48.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Dec 2019 16:48:10 -0800 (PST)
Received: by mail-io1-f46.google.com with SMTP id c16so1468871ioh.6
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 16:48:09 -0800 (PST)
X-Received: by 2002:a02:711d:: with SMTP id n29mr2124405jac.114.1576284489229; 
 Fri, 13 Dec 2019 16:48:09 -0800 (PST)
MIME-Version: 1.0
References: <20191213234530.145963-1-dianders@chromium.org>
 <20191213154448.9.I1791f91dd22894da04f86699a7507d101d4385bc@changeid>
 <20191214000738.GP624164@phenom.ffwll.local>
In-Reply-To: <20191214000738.GP624164@phenom.ffwll.local>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 13 Dec 2019 16:47:57 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VqU8Aeuno44hAi6SP+7NZRTfgJcYPHcWpVNCo6GXUJPw@mail.gmail.com>
Message-ID: <CAD=FV=VqU8Aeuno44hAi6SP+7NZRTfgJcYPHcWpVNCo6GXUJPw@mail.gmail.com>
Subject: Re: [PATCH 9/9] drm/bridge: ti-sn65dsi86: Skip non-standard DP rates
To: Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <a.hajda@samsung.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Rob Clark <robdclark@chromium.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sean Paul <seanpaul@chromium.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>, Jonas Karlman <jonas@kwiboo.se>, 
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 David Airlie <airlied@linux.ie>, Jernej Skrabec <jernej.skrabec@siol.net>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Dec 13, 2019 at 4:07 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Fri, Dec 13, 2019 at 03:45:30PM -0800, Douglas Anderson wrote:
> > The bridge chip supports these DP rates according to TI's spec:
> > * 1.62 Gbps (RBR)
> > * 2.16 Gbps
> > * 2.43 Gbps
> > * 2.7 Gbps (HBR)
> > * 3.24 Gbps
> > * 4.32 Gbps
> > * 5.4 Gbps (HBR2)
> >
> > As far as I can tell, only RBR, HBR, and HBR2 are part of the DP spec.
> > If other rates work then I believe it's because the sink has allowed
> > bending the spec a little bit.
>
> I think you need to look at the eDP spec. And filter this stuff correctly
> (there's more fields there for these somewhat irky edp timings). Simply
> not using them works, but it's defeating the point of having these
> intermediate clocks for edp panels.

Ah, I see my problem.  I had earlier only found the eDP 1.3 spec which
doesn't mention these rates.  The eDP 1.4 spec does, however.  ...and
the change log for 1.4 specifically mentions that it added 4 new link
rates and also adds the "SUPPORTED_LINK_RATES" register.

I can try to spin a v2 but for now I'll hold off for additional feedback.

I'll also note that I'd be totally OK if just the first 8 patches in
this series landed for now and someone could eventually figure out how
to make this work.  With just the first 8 patches I think we will
still be in an improved state compared to where we were before (and it
fixes the panel I care about) and someone could later write the code
to skip unsupported rates...


-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
