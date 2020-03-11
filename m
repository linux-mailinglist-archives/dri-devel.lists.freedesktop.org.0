Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6E21815D5
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 11:30:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CF1889330;
	Wed, 11 Mar 2020 10:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5483789330
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 10:30:51 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id v9so1855848wrf.10
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 03:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=LzaLKCBRIewXD3EaTa5hnO0VT8owm6vRQQh9HZJ8avA=;
 b=Q8iLXeBxiZgXJvA2vze2ga6XXLHnHiwXpcRBGb+97vDPoqWmHmYQNZD5qm5/UYrxEN
 cjwCR0pOyqqvz+obQOJ74UiEbO7YwyeOGWUXaBfM4aUNnRCAIQ9IE4r3C+JmrXVApEtN
 QfPbit0/lnZGYVi+UbvPMWvMtahu0kOMN1FY7tWEojQqHEJFot3f9/ECjN87ZRJokwqG
 2UsaMwgAolYMNAwFN3YLUN/BSxz17PzqJ2t4SXZFY+UzqWaGXWXRITvoP1q9aPlL8I0s
 56ZCsoZTUZMEuVHJtvwg/6Z8hd7DcKfTuDssaWskglPcGlBC0+0hPscKQR+14eNZKuhJ
 oaJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LzaLKCBRIewXD3EaTa5hnO0VT8owm6vRQQh9HZJ8avA=;
 b=XHBIwa98u9VPeYAdSuYatz+sCLWsnrPkfqOzI6OMyO8l0hh3QI9mBxNRgqHccQbGco
 ynSpDh4MspeSA7sC9ikC/pAz9wkJYKsVLQovSgqN0m4FSr8icu/r6rc7sE1Rb7i4tAV/
 YLcA90f8ybaiHEmlyG9mCR48k3O0Y7fu47KM9mdXbnI+An4X+71qdq0RNoyqnMISY2++
 +cedVfiHyDSaYPVNzWQ+odIIkzn7MA2rdDkY07EzxmmszUWK7dIiqEyjRzzWLuoDI49L
 E6rIBJLZwawVMg0gLHUd3PpDVy7FyK+oBZBkZfJWSbrX9RVaCknKlv9Lqt+FV5gGrPeN
 cy3Q==
X-Gm-Message-State: ANhLgQ0T283eoLVxLCSFxnxOvGsblNNjqq7GJUBGEix5VxvEfdN/ebvr
 n1NiEdzW0oyNUdDIOygj+LlcLA==
X-Google-Smtp-Source: ADFU+vuO9qK9g/2D1BMl3E61Zu+yTrfHT1j9G9JEFmGh20HcuAhscXtAx5vC28GPTMlL0pnuoxc5CA==
X-Received: by 2002:adf:ef44:: with SMTP id c4mr3720111wrp.404.1583922649952; 
 Wed, 11 Mar 2020 03:30:49 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id f9sm18718612wrc.71.2020.03.11.03.30.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 03:30:49 -0700 (PDT)
Date: Wed, 11 Mar 2020 10:30:47 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: kgunda@codeaurora.org
Subject: Re: [PATCH V3 2/4] backlight: qcom-wled: Add callback functions
Message-ID: <20200311103047.v7rt5ii3saack22a@holly.lan>
References: <1583760362-26978-1-git-send-email-kgunda@codeaurora.org>
 <1583760362-26978-3-git-send-email-kgunda@codeaurora.org>
 <20200310152719.5hpzh6osq22y4qbn@holly.lan>
 <05ab744dfbd83b6704bd394ce3c3dfc9@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <05ab744dfbd83b6704bd394ce3c3dfc9@codeaurora.org>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 linux-arm-msm@vger.kernel.org, lee.jones@linaro.org,
 linux-arm-msm-owner@vger.kernel.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 11, 2020 at 12:11:00PM +0530, kgunda@codeaurora.org wrote:
> On 2020-03-10 20:57, Daniel Thompson wrote:
> > On Mon, Mar 09, 2020 at 06:56:00PM +0530, Kiran Gunda wrote:
> > > Add cabc_config, sync_toggle, wled_ovp_fault_status and wled_ovp_delay
> > > callback functions to prepare the driver for adding WLED5 support.
> > > 
> > > Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> > 
> > Overall this code would a lot easier to review if
> > > ---
> > >  drivers/video/backlight/qcom-wled.c | 196
> > > +++++++++++++++++++++++-------------
> > >  1 file changed, 126 insertions(+), 70 deletions(-)
> > > 
> > > diff --git a/drivers/video/backlight/qcom-wled.c
> > > b/drivers/video/backlight/qcom-wled.c
> > > index 3d276b3..b73f273 100644
> > > --- a/drivers/video/backlight/qcom-wled.c
> > > +++ b/drivers/video/backlight/qcom-wled.c
> > > @@ -128,6 +128,7 @@ struct wled_config {
> > >  	bool cs_out_en;
> > >  	bool ext_gen;
> > >  	bool cabc;
> > > +	bool en_cabc;
> > 
> > Does this ever get set to true?
> > 
> Yes. If user wants use the cabc pin to control the brightness and
> use the "qcom,cabc" DT property in the device tree.

That sounds like what you intended the code to do!

Is the code that does this present in the patch? I could not find
it.


Daniel.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
