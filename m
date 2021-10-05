Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCCB423395
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 00:36:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67D886EC91;
	Tue,  5 Oct 2021 22:36:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2B036E46B
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 22:36:44 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 u20-20020a9d7214000000b0054e170300adso739273otj.13
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Oct 2021 15:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Ft48Hk1n68Pbbbv8PEM8uaK94jbB+3DvpTmrUODshWs=;
 b=fuO8D1HZqE0QRC5GpyS800L44yJkv8eq3KoFfIz9YbzMy8gLkKwMt3ak48h8SgP/6a
 MQeVZSrXVzFGIZXzKkPlnHuvR/smgI79Gp9ry26Wtn83BDr+9N+s5hf0vtcSiqIJXkCr
 dCVLzMRfCGWeT4zL/RhFyyGcPZALadT1LfwAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Ft48Hk1n68Pbbbv8PEM8uaK94jbB+3DvpTmrUODshWs=;
 b=FUs0TwqBlsamldIiIzCNm5s1siHdWOhcX6fxCUH3I9ZPGj/x93CvNr32lR1UX/YfpQ
 TChGRai71hQx+daU8jidtJmvzw1q34CdhgSsV8Tc2P0zhzwTyir6cxCMtb+8QLd2XagH
 M5sAtNsua2xZzkxrhaPOBCLLVWAbe7J2CA6UK3RH2wLOtp20jn5gkta2eLVZ763dF8Sr
 g0IcgE3eU7qM/ddBitQYKzQu5TVOn7UKC6H8zoI5sIPx4gP37cpkXBKNdq5eKADJXxVx
 AyWHOYrb22R7MB1++A/+eQ9U2xumvyoaDWfCKT9BjhQNJCkxBdp/BYqZdFQFyQep5vlN
 vYvA==
X-Gm-Message-State: AOAM53238Tc/q8gguZT51KGOpqbxC5QwKRlIoWoAF7TgQD1Sdp2xXoBv
 GIMLLXplvn5vG18E6trxs8q/gcDtLiHmue+b/9IwbA==
X-Google-Smtp-Source: ABdhPJwXTb3iHipqtroSzM7KoB3GtcUPf2KB8S66ztGQmawIKW5iKloHtwS37bzAg5v7wipOcEhtT5hf+0xu3KA/PDA=
X-Received: by 2002:a9d:6a0f:: with SMTP id g15mr17124450otn.126.1633473404179; 
 Tue, 05 Oct 2021 15:36:44 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Oct 2021 15:36:43 -0700
MIME-Version: 1.0
In-Reply-To: <YVzGVmJXEDH0HfIL@ripper>
References: <20211005023750.2037631-1-bjorn.andersson@linaro.org>
 <CAE-0n52wN1s=Ph4r4iLposxNPfa562Bv1mM81j1KvNmWOQS1-Q@mail.gmail.com>
 <YVzGVmJXEDH0HfIL@ripper>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 5 Oct 2021 15:36:43 -0700
Message-ID: <CAE-0n53FC7JCCJoye_uKeqaLKrZeHXLtvObxWFedaUzjirmBaA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: Shorten SETUP timeout
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Abhinav Kumar <abhinavk@codeaurora.org>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@linux.ie>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Kuogee Hsieh <khsieh@codeaurora.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Sankeerth Billakanti <sbillaka@codeaurora.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Bjorn Andersson (2021-10-05 14:40:38)
> On Tue 05 Oct 11:45 PDT 2021, Stephen Boyd wrote:
>
> > Quoting Bjorn Andersson (2021-10-04 19:37:50)
> > > Found in the middle of a patch from Sankeerth was the reduction of the
> > > INIT_SETUP timeout from 10s to 100ms. Upon INIT_SETUP timeout the host
> > > is initalized and HPD interrupt start to be serviced, so in the case of
> > > eDP this reduction improves the user experience dramatically - i.e.
> > > removes 9.9s of bland screen time at boot.
> > >
> > > Suggested-by: Sankeerth Billakanti <sbillaka@codeaurora.org>
> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > ---
> >
> > Any Fixes tag? BTW, the delay design is pretty convoluted. I had to go
> > re-read the code a couple times to understand that it's waiting 100ms
> > times the 'delay' number. Whaaaaat?
> >
>
> I assume you're happy with the current 10s delay on the current
> devices, so I don't think we should push for this to be backported.
> I have no need for it to be backported on my side at least.
>

Sure. Fixes tag != backported to stable trees but it is close.

> > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>
