Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8676E499C45
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 23:07:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D657A10E192;
	Mon, 24 Jan 2022 22:07:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5E0010E191
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 22:07:24 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 w15-20020a4a9d0f000000b002c5cfa80e84so6282796ooj.5
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 14:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=/aLnHFuStZ5orf+mOt/+JIQklpQVMq3vUHjZ6F6RUME=;
 b=oVOpoQrs7lAhfFdYwpI0Rbzn4piuzf9e5etUCLba1zcBTLVJXNv0oO+H7iWuBfLpPF
 ASNNSRyIUHiyAlE1wrc8sjhJTg7yluaGRdSE38M+06TBKdyjDXmPU4bzAnn+0kwjb55o
 Xh651eHtRdmJG65PfUKKbclnQeEXW8CKWcSjs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=/aLnHFuStZ5orf+mOt/+JIQklpQVMq3vUHjZ6F6RUME=;
 b=tisnFlCqkX1nPx+OgySi6h9dMlTLMcp2Cjjaiv2NbiXLj8Kh4DfEURC9Cc/XulFRbZ
 aFyjoBQTDGl+P1d09Ibgg2kG3pgXHaSh4wwDufMNyVray6ayhFQjSoJI1e7FOIB1+5jW
 N2JGm1fLBz1CBxlf6Di12ZwrkMxVeXFnH78ld3F61vKTzDlY4FdJQCgmgACsu+INvWfy
 FxWfNjURKBBb1nx2RDpdEp1OFBaH1eXivZk3RYNBomEVUmkwymJvuJxzYFHxG3Km7Mry
 A4BdZW5nuyiA9KiWaY0/618ioq7IoOg/NqU5+VsD5H902qCNmpyRdOZTgpoZhDC5qFl0
 L0Pg==
X-Gm-Message-State: AOAM532wgXs4sRKyqxZtRJ1RqrfgjICT8GD94lYMR8UrtWwC01ZCXOYz
 1k4qfxHmJn4Qk0Z6lEn/VW5r4ChawszNQiFjm/cfXg==
X-Google-Smtp-Source: ABdhPJyc/dz2yM6w+iD9kilsMJPwY0RIbV00zr4BPr32NKAK/72Bw+/QQmFbTMkH7urzwVaB7eMehwTkn+zmuRw96G8=
X-Received: by 2002:a4a:d51a:: with SMTP id m26mr4897764oos.1.1643062044068;
 Mon, 24 Jan 2022 14:07:24 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 24 Jan 2022 14:07:23 -0800
MIME-Version: 1.0
In-Reply-To: <28734c1c-a30c-d47f-3fc1-95035adcd33d@quicinc.com>
References: <1643057170-10413-1-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n53nFcMzuKfqVRac6PRTkoPrftXL+uVK56ZQsHVWHmivkQ@mail.gmail.com>
 <28734c1c-a30c-d47f-3fc1-95035adcd33d@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 24 Jan 2022 14:07:23 -0800
Message-ID: <CAE-0n51wjxd+6azct0ENNBZuE7oVSH6tXfSfEUhT4LRX6kesdw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: always add fail-safe mode into connector mode
 list
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-01-24 13:24:25)
>
> On 1/24/2022 1:04 PM, Stephen Boyd wrote:
> > Quoting Kuogee Hsieh (2022-01-24 12:46:10)
> >> Some of DP link compliant test expects to return fail-safe mode
> >> if prefer detailed timing mode can not be supported by mainlink's
> >> lane and rate after link training. Therefore add fail-safe mode
> >> into connector mode list as backup mode. This patch fixes test
> >> case 4.2.2.1.
> >>
> >> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> > Any Fixes tag? I also wonder why this isn't pushed into the DP core code
> > somehow. Wouldn't every device need to add a 640x480 mode by default?
>
> Original test case 4.2.2.1 always passed until we did firmware upgrade
> of our compliance test tester (Unigraph) recently.

Ok. So the Fixes tag should be the introduction of the driver or at
least whenever compliance testing support was added.

>
> The new firmware of tester use newer edid contains 1080p with 145.7 mhz
> which can not be supported by 2 lanes with 1.6G rate. Hence we failed
> this test case.

Interesting. So the test case wouldn't fail unless the number of lanes
were limited by the hardware? Seems that the test isn't thorough.

>
> After discuss with Vendor, they claims we have to return fail-safe mode
> if prefer detailed timing mode can not be supported.
>
> I think would be good to add fail-safe mode into connector mode list.
>
>
>
>
> > we just run into this problem recently.


Sure I'm not saying it's incorrect, just wondering why a connector
that's DP wouldn't have the 640x480 resolution by default somewhere in
the drm core.
