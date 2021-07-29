Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 331B73DAE19
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 23:19:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F55F6EE79;
	Thu, 29 Jul 2021 21:19:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3C4E6EE79
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 21:19:38 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id g11so4947248qts.11
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 14:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hI5gfLyD1Tzqc9HNbOUWHN5K+jDpUpe1OJ1d5jQQrt0=;
 b=PS5qQxOVGyVqgHrT4neWt8aUIyQ4OcaRSh3jgNavcE96MgC4OTRNgy+ykmimuMCCMj
 BEUrUvwzxDaWp94PgIisXpFJiI8jiWqdGY7JkkzOdJ2n8AD7HacClwU0tDD9ouhFHR9p
 ImZ5RVfunFsymGWcWNjeSM7OKB8lzdLtQDAHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hI5gfLyD1Tzqc9HNbOUWHN5K+jDpUpe1OJ1d5jQQrt0=;
 b=uLZz24FZPEf/pMpL1TdGumj1DHY4+qr7e0qsv7RMfAIDA8VYykbJ3wBHO/bijJEzTQ
 xiqqGC0+OTukkQLCtI1ePX4Upo3CKTCXGnZFpDjgFDnFgjGFy36fJ0SPDT0XK3SeztIp
 YOC97AmF0835zh1P48E2iqet8QvqM14Rdv8+oxBp9toO3/PZajZUJFOtMbU+Nw3nIKEj
 sms6H1NgBJNRjkNQ5TjRDKqhUcNDL0Iz1DO2weDnzIwRwil+Xdv+kclg9ZOmsC2sZYXl
 Zgl03e2uVDblVxRe2IhPbgPR8Pk845NlcL49FQuICzLcnZznpMcC+UIdLqODSOi7yHv7
 QlXw==
X-Gm-Message-State: AOAM530Kh2YB+1M4PxVIjqytp5o/5jdJlVsiU8OSKZR6UGPEyQfkN95B
 EfyQFvncMrsckI4cYIPySRoVJ2y6umxjmA==
X-Google-Smtp-Source: ABdhPJy8poWud7vXFuPHHFcBbkZbABqAzONr0kmmkkUEiTTaeyQjIusmyBpY59f4ww0c/K5KBzr1Jg==
X-Received: by 2002:ac8:6709:: with SMTP id e9mr6056806qtp.149.1627593577489; 
 Thu, 29 Jul 2021 14:19:37 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com.
 [209.85.219.179])
 by smtp.gmail.com with ESMTPSA id m19sm1712546qtp.93.2021.07.29.14.19.35
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 14:19:36 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id x192so12542811ybe.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 14:19:35 -0700 (PDT)
X-Received: by 2002:a25:2904:: with SMTP id p4mr9170962ybp.276.1627593575191; 
 Thu, 29 Jul 2021 14:19:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210723002146.1962910-1-dianders@chromium.org>
 <20210722172104.RFC.1.I1116e79d34035338a45c1fc7cdd14a097909c8e0@changeid>
 <YQMPOxfQw7zx6evp@robh.at.kernel.org>
In-Reply-To: <YQMPOxfQw7zx6evp@robh.at.kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 29 Jul 2021 14:19:23 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XYfQkuPseBq32rf2qiiv4fn2uf2wWv7FT3pjkRF9ugdA@mail.gmail.com>
Message-ID: <CAD=FV=XYfQkuPseBq32rf2qiiv4fn2uf2wWv7FT3pjkRF9ugdA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/8] dt-bindings: drm/panel-simple: Introduce generic
 eDP panels
To: Rob Herring <robh@kernel.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Steev Klimaszewski <steev@kali.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Jul 29, 2021 at 1:27 PM Rob Herring <robh@kernel.org> wrote:
>
> IMO, you should move any applicable compatibles to the edp-panel schema.
> Also, I don't think you should add 'edp-panel' to them. If they can work
> better with the generic eDP driver, then that should be an internal
> kernel change without a DT change. Also, if 2 different drivers match on
> compatible, it's a roll of the dice which driver binds.

So overall what I was going for is this:

1. I want to be able to specify _just_ "edp-panel" for new boards.
We'll make sure this is how it looks on devices that go through the
factory and thus we can make sure that the driver can recognize all
panels that get shipped.

2. For existing boards, I'd like to be able to move them to use
"edp-panel" but I'm less confident that I can really say exactly what
panels are out there in the field. Even though our device tree has
always listed only one panel, in truth boards have shipped with more
than one and they've just been "compatible enough" with each other
(this "white lie" is what I'm trying to fix). If somehow the generic
"edp-panel" doesn't recognize a panel then I wanted to be able to use
the old timings we'd always had before as a "fallback". That means
that logically I wanted "edp-panel" to be first and only fallback to
the old compatible string if we didn't recognize the panel ID that
came from the EDID. In truth, both compatible strings are handled by
the same driver the driver patch I submitted tried to be smart.

Perhaps that above is over ambitious and it'd be better to just drop
the whole "fallback" concept. If a board manufacturer wants to start
using the "edp-panel" concept then maybe the right idea is to force
them to bump the "board id" and then we can pick a new device tree
revision. Then we can make sure all boards that come out of the
factory with that new "board id" can be identified properly in the
EDID. This will also get rid of some of the complexity in the driver
patch, which is nice. I'll plan on doing this and address your other
feedback for a v2.


-Doug
