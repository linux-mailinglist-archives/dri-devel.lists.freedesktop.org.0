Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1736862D8E0
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 12:06:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DE8D10E543;
	Thu, 17 Nov 2022 11:06:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F4210E543
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 11:06:29 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id h9so3313586wrt.0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 03:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=kYDg53wsGKutNyKBdN9lJQxQ/YinXUOzzbN1yqpmcgE=;
 b=N8GxB1tiMjXUW++FirZ1HVaPg7IPaKpd6YWD+02vgi4dVNbZcPrrSId5hbmJCJ7afR
 ZS69cVHASx2Y0eZ5uGHSoU6J7g7RGcXLs+ipXCpZ2o0p1ynf9xosyKKkCSLhj7krp21V
 ndQNsYd0tfst1Kl5WGGLucB6fi3fDS9DZxEEVeeMGMzhD6qLJi2PQvJPneFXdKOgvKWu
 QLlGd6/k3CT6gFRcekXqgZvdo1lW4A7r0ZNwxa33R/qLSa+1fRzgca1aT+4PCP/7yKEp
 DFcQE3hdU0h9UJ9jOVmj+C6psrgDyuZtZi5qjEnf5aRYIVPIFvhtsnIlvRN1qd4hzJpD
 ASqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kYDg53wsGKutNyKBdN9lJQxQ/YinXUOzzbN1yqpmcgE=;
 b=bf/qExyIX46rz0WH6nolEqDs8bGXBuNCfSpoCxZ1YvkXY5bcMytlICB412WDHajUgJ
 3CJ7JSl9TXcFtENAFilsWrVRluYQnt1FZelMgDqc5zpCoG83M2neFl98WQ8h4aN8LwUF
 ehUtxD9KkiAYOhs2jLfePJ2281IRI/pBHSKYnRgbMcLamXkeyYEudXpU9kTBOyjCtkG3
 15t74axXa7HLSutK0igLa2q5fSomxnpyXowGymc+bFo75ImLokij4GAB+UJJH1NOlmyz
 LYZ7/ek/hLGph6AA8UdepbCLTGYhmfcjqk7g9C9rEYTQ/mMbS8ocb2Z6MpfoJVfJgMl9
 BDvQ==
X-Gm-Message-State: ANoB5plhog1akXgSfhDH4LGkEIEGqq+fOKIIUzC5YK8HJ81syjbl6/1x
 G0J+oyKeAk1q22A9d/Vrv2Mx7KJILcgNHA==
X-Google-Smtp-Source: AA0mqf5engmUU+Hc6t1F6Ib5V1yWVikFr373w4fj9rIxmIhbIEKPd3q1IKOAKEHl8Wb1UH5RkrcGLA==
X-Received: by 2002:a5d:678c:0:b0:235:14dc:5e14 with SMTP id
 v12-20020a5d678c000000b0023514dc5e14mr1192804wru.252.1668683187724; 
 Thu, 17 Nov 2022 03:06:27 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 m14-20020a5d56ce000000b002364c77bc96sm661051wrw.33.2022.11.17.03.06.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 03:06:27 -0800 (PST)
Date: Thu, 17 Nov 2022 11:06:25 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] backlight: pwm_bl: Drop support for legacy PWM probing
Message-ID: <Y3YVsaO38g9EUgHq@maple.lan>
References: <20221117072151.3789691-1-u.kleine-koenig@pengutronix.de>
 <Y3YJaYx06Jzrs/Ej@maple.lan>
 <20221117102814.vdgixgfq4pr77fly@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221117102814.vdgixgfq4pr77fly@pengutronix.de>
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
Cc: linux-pwm@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 17, 2022 at 11:28:14AM +0100, Uwe Kleine-König wrote:
> On Thu, Nov 17, 2022 at 10:14:01AM +0000, Daniel Thompson wrote:
> > On Thu, Nov 17, 2022 at 08:21:51AM +0100, Uwe Kleine-König wrote:
> > > There is no in-tree user left which relies on legacy probing. So drop
> > > support for it which removes another user of the deprecated
> > > pwm_request() function.
> > >
> > > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> >
> > I have to take the "no in-tree user" on faith since I'm not familiar
> > enough with PWM history to check that. However from a backlight
> > point-of-view it looks like a nice tidy up:
> > Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
>
> Probably "in-tree provider" would have been the better term. You can
> convince you about that:
>
> $ git grep -l platform_pwm_backlight_data | xargs grep pwm_id
>
> That is, no machine used pwm_id to make the legacy lookup necessary.

Thanks for that. pwm_request() seems so old that my intuition about
how device APIs in Linux work misled me and I completely missed that
the consumption of pwm_id at the call site was the key to the source
navigation here.


> Who will pick up this patch? Should I resend for s/user/provider/?

Lee Jones should hoover this up. Normally I only pick up backlight
patches when Lee's on holiday ;-).

No need to resend on my account. I interpreted the original
description as "provider" anyway, I just didn't know how best to
search for them.


Daniel.
