Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CE82F22B3
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 23:25:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA134897E4;
	Mon, 11 Jan 2021 22:25:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com
 [IPv6:2607:f8b0:4864:20::e2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19A35897E4
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 22:25:50 +0000 (UTC)
Received: by mail-vs1-xe2a.google.com with SMTP id x4so392605vsp.7
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 14:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9OnL9608NR1WfrmLtpFZXwkmtIPSAyuXiOma//494lM=;
 b=IEMfBxDievdGVZtXiBBLIM6KzrtgheVo7y52oDPjibHUCg/5AtJq1KlohEdNk/Ws1c
 Wb5dCvar1OUAfHhxdIqtTbmqkY/M2GFn7cHNYBW1DO5T9rsCCQ1UPZJA8NEb15C74g6U
 Ns9Ave8jhOD+FbTfrdxgILf63Ycqz2UlDp2uc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9OnL9608NR1WfrmLtpFZXwkmtIPSAyuXiOma//494lM=;
 b=rESCi2oNO0cCTXXD+umn8I9cu0zSRooqVViubi9AtDwY/tqRoceigPMruH3NmWqWq2
 5DNm7r2q7/Oi8IJSBZbbyVBYZ39syWg6OzQIa9GmoE2BiAgJ5bS7GuXVxas18dNZWVOP
 5Jom4szk7hsv+EXcICf7Bzfxfwy3SSujMTELatx4kxtq2yeFDtaELOJamKawAQ3wFsdm
 BnL7a0cBek1xjhtfw1503X+aDqVSinjmECpyUFi+2Pvt+NhN+jJa1FPbZ24POHMJRT5V
 idwMMiFDx+AjBx4bYbtdND733eyUQ624gPYIbks+Gar2QjxrvgXGDyBzMZCQY7dBsSRy
 OVyw==
X-Gm-Message-State: AOAM530oV0nYoonNODREw4tL0j3BxYkU3sgMgdqgBxsRymM7L3KLfzkD
 43Up0UKWSucS2aOG3m/brkv+4J+xiYc7Bg==
X-Google-Smtp-Source: ABdhPJxO2VcMnkg1BNqMuR2TBsMkO67EeGqpYL3A8kA6zuLN66QrrhezlZyxUSvBIA0tE3ezAbxHYQ==
X-Received: by 2002:a67:80d3:: with SMTP id b202mr1616140vsd.2.1610403949095; 
 Mon, 11 Jan 2021 14:25:49 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com.
 [209.85.217.41])
 by smtp.gmail.com with ESMTPSA id j8sm151993uan.20.2021.01.11.14.25.48
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 14:25:48 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id q10so375113vsr.13
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 14:25:48 -0800 (PST)
X-Received: by 2002:a05:6102:2361:: with SMTP id
 o1mr1491998vsa.34.1610403948126; 
 Mon, 11 Jan 2021 14:25:48 -0800 (PST)
MIME-Version: 1.0
References: <20201210081853.17060-1-shawnguo@kernel.org>
 <CAD=FV=WZQAaF1SXSP-co_O8=pYepzMHz5FjUfnbRJY_VH0AFpA@mail.gmail.com>
In-Reply-To: <CAD=FV=WZQAaF1SXSP-co_O8=pYepzMHz5FjUfnbRJY_VH0AFpA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 11 Jan 2021 14:25:37 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Xu+KjGDKPi6x8spf5OWBUohTQeM37B41Y-qihKd4Z4-A@mail.gmail.com>
Message-ID: <CAD=FV=Xu+KjGDKPi6x8spf5OWBUohTQeM37B41Y-qihKd4Z4-A@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: rename GPIO register bits
To: Shawn Guo <shawnguo@kernel.org>
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
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Jan 11, 2021 at 2:16 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Dec 10, 2020 at 12:19 AM Shawn Guo <shawnguo@kernel.org> wrote:
> >
> > From: Shawn Guo <shawn.guo@linaro.org>
> >
> > It renames GPIO register bits to drop 'SN_' prefix, so that they are
> > consistent to other definitions - prefixing register name with 'SN_' but
> > not for bit fields.
> >
> > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 26 +++++++++++++-------------
> >  1 file changed, 13 insertions(+), 13 deletions(-)
>
> Sorry for taking so long to get back to this.  I think it came into my
> inbox at the same time as a pile of other things and then got lost.
> Your change looks good to me.  Sorry for being inconsistent when
> adding those defines and thanks for fixing them!
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Hrm, I just caught up on more email and found that in:

https://lore.kernel.org/r/20201210174338.kecryijwptzc2mi7@pengutronix.de

...that Uwe would prefer to keep these bits what I have and change all
the others.  ;-)  I don't have a strong opinion either way, but I
definitely agree that it'd be better for all the defines to be
consistent.  If I had to arbitrarily make the decision one way or the
other I'd probably land Shawn's patch but I certainly wouldn't object
if we went Uwe's way either.  :-P

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
