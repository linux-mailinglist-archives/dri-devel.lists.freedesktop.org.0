Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB894176CB
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 16:29:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33C4F6EE20;
	Fri, 24 Sep 2021 14:29:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 021CF6EE20
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 14:29:41 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 97-20020a9d006a000000b00545420bff9eso13334158ota.8
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 07:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/HUdMFtSIgoDC8oIDLutFI0kXoCcazheaXJ199ftm9g=;
 b=aXxY4VUYQrGrb+hPUPt171rF7ZoorniSwGe2E4HTBrAkPzlbS/JkVWAJ0jufnLCdL8
 iwxiEweiMD5hpDUOcfs2WOovGWeBpLHVrqqXHl9WA6ojcQFjDbJyp2bKejo2NPTClxfJ
 hG3aCAfuOLoq7fWUY88c3I7QFz8FYaJGyzTjGYi6ede+vj4ZVhD4OT1mMOYpgbECpHsX
 Eu7hr8YTMjLSlcIkW5r92gwT7jDakW1i3QDiUTxg5awGkEWxpFEJxSNSHY+tCXMsZuwG
 YVxv9qPmUK+5uhbw1Jb3fWng7Xuk8jQSgLSYy02Ecp9dIrmx/xzA3tjEMGBrEED7T4Ub
 VeFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/HUdMFtSIgoDC8oIDLutFI0kXoCcazheaXJ199ftm9g=;
 b=O0EDX2pK5XryEDmIXGmicm5a+GEs7T7KuS/8cdsK6bBfdDaH7an1Jc0JsNx8i4u9d2
 eIZVFtAyn+X2ulLPD0lM41TyHVHpldbIjctx/i37KJX71ESJDWbEaUoMeLi+d8zJj9iB
 UkyacWuFf0qF9gNmF0mUfpzSPeJNoDdG8D45waeIxY2ZKNlcdHqYAvicVPjmn2mWP/xq
 oyyNzlEc3Tz+DB/JFaMVv8wOqV2dTZ0ZvdS/JSLMemrqqz/bMlJapvRh1PewsysUfqOq
 uxH4m5GS8hibUo6wf51XfOdx9jq84WkHDSxPT3gTjM9It/VBR7fjyQ5BM+pYEJ6ADu3b
 jOKA==
X-Gm-Message-State: AOAM5301G3YqFYE2bkJewjiqLj8ygNkUpXrNk6VUaRqUF8v1Kgll8xCX
 iIwV8RO2mVAu6dRmBGobkJJikg==
X-Google-Smtp-Source: ABdhPJzv7ZLmAjdY7QEBnhVbHV9uXR3NPTSGFDmN2meB1pCWCEzM5B7NDpR1KtO4BLg6jokSeq1YvA==
X-Received: by 2002:a9d:6192:: with SMTP id g18mr4321765otk.314.1632493781163; 
 Fri, 24 Sep 2021 07:29:41 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id j4sm2121137oia.56.2021.09.24.07.29.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 07:29:40 -0700 (PDT)
Date: Fri, 24 Sep 2021 07:30:19 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Uwe Kleine-K?nig <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org, Doug Anderson <dianders@google.com>
Subject: Re: [PATCH v5 1/2] pwm: Introduce single-PWM of_xlate function
Message-ID: <YU3g+8Rwfyq3yp5S@ripper>
References: <20210924021225.846197-1-bjorn.andersson@linaro.org>
 <20210924071652.skkx2jgeivg4uiht@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210924071652.skkx2jgeivg4uiht@pengutronix.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri 24 Sep 00:16 PDT 2021, Uwe Kleine-K?nig wrote:

> On Thu, Sep 23, 2021 at 09:12:24PM -0500, Bjorn Andersson wrote:
> > The existing pxa driver and the upcoming addition of PWM support in the
> > TI sn565dsi86 DSI/eDP bridge driver both has a single PWM channel and
> > thereby a need for a of_xlate function with the period as its single
> > argument.
> > 
> > Introduce a common helper function in the core that can be used as
> > of_xlate by such drivers and migrate the pxa driver to use this.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> > 
> > Changes since v4:
> > - None
> > 
> >  drivers/pwm/core.c    | 26 ++++++++++++++++++++++++++
> >  drivers/pwm/pwm-pxa.c | 16 +---------------
> >  include/linux/pwm.h   |  2 ++
> >  3 files changed, 29 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
> > index 4527f09a5c50..2c6b155002a2 100644
> > --- a/drivers/pwm/core.c
> > +++ b/drivers/pwm/core.c
> > @@ -152,6 +152,32 @@ of_pwm_xlate_with_flags(struct pwm_chip *pc, const struct of_phandle_args *args)
> >  }
> >  EXPORT_SYMBOL_GPL(of_pwm_xlate_with_flags);
> >  
> > +struct pwm_device *
> > +of_pwm_single_xlate(struct pwm_chip *pc, const struct of_phandle_args *args)
> > +{
> > +	struct pwm_device *pwm;
> > +
> > +	if (pc->of_pwm_n_cells < 1)
> > +		return ERR_PTR(-EINVAL);
> > +
> > +	/* validate that one cell is specified, optionally with flags */
> > +	if (args->args_count != 1 && args->args_count != 2)
> > +		return ERR_PTR(-EINVAL);
> > +
> > +	pwm = pwm_request_from_chip(pc, 0, NULL);
> > +	if (IS_ERR(pwm))
> > +		return pwm;
> > +
> > +	pwm->args.period = args->args[0];
> > +	pwm->args.polarity = PWM_POLARITY_NORMAL;
> > +
> > +	if (args->args_count == 2 && args->args[2] & PWM_POLARITY_INVERTED)
> > +		pwm->args.polarity = PWM_POLARITY_INVERSED;
> 
> of_pwm_xlate_with_flags is a bit more complicated. Translating
> accordingly this would yield:
> 
> 	if (pc->of_pwm_n_cells >= 2) {
> 		if (args->args_count > 1 && args->args[1] & PWM_POLARITY_INVERTED)
> 			pwm->args.polarity = PWM_POLARITY_INVERSED;
> 	}
> 
> Given that pc->of_pwm_n_cells isn't used when a phandle is parsed (in
> of_pwm_get()) I think your variant is fine.
> 

Right, the difference from of_pwm_xlate_with_flags is that this version
will pick up the flags even if the driver says it has n_cells = 1.

I didn't see a strong reason for doing the extra check and the drawback
with it is that if I then write in my dts that my channel should be
INVERTED the driver won't be able to bump the n_cells to 2, because that
would cause a regression.

Would you like me to add this extra check? Or perhaps ensure that the
commit message captures my reasoning here?

> So I think technically the patch is good, for me the question is if we
> want to make new drivers of_pwm_xlate_with_flags for consistency even
> though this would mean that the first argument has to be 0 for all
> phandles. Thierry? Lee?
> 

I find it typical for single entity providers to be defined with
#foo-cells = <0> (or 1 if you have flags) and not pass a "dummy" 0.

We did talk about this with Rob in a previous version of this patch and
came to the conclusion that this was the appropriate thing to do...

Thanks,
Bjorn
