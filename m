Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C1F64D47B
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 01:15:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21BDA10E4D1;
	Thu, 15 Dec 2022 00:15:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3697F10E4D3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 00:14:59 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id u19so30025994ejm.8
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 16:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JksENWg0mHiBla2rAma/eo8ORkZkU6LETkySUkD8cxk=;
 b=UusWUebN7mlxwVGhTYr7zsNvvf2hEZi+CA57ijbfdY/KnuzUTvXCj4CaP+v/zEmQq2
 JSIr/39zUO4gWaglhhT186eMsnOhRxXkqoSOsiswigEaGjk8T9hjGDYgdFMAbi9fDxk/
 pQW5GGYM9yhaVvETC52cruIqRR578zRFhCC3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JksENWg0mHiBla2rAma/eo8ORkZkU6LETkySUkD8cxk=;
 b=VakwdTje1TqJGtew7JN+dfK9nbT3yDKMRC9oK+tgkRhzAfzE0YWjFdoSUhhy+iNrg+
 LyumadgBaCfN46oyDLDuHKJaexLE4wb1U5/CaG4V/x8vvfFLw8Ni6A+FLDJaitIx1eUG
 B0P+nl5apyfozLagHDWIyhkch5PsgZVMOC8IvdGTTahraL6ru6q39FNHrievbJAiLwVl
 SXj1veLCXyJcVoVFZaMjEYONxOb5HZ9hic35HRxOQvPIuFGL/+LGxoEVOiCe4MPpAX8f
 OLWYY+osGh+jhYcjQCxSOe0yUtmm7JFjm8jtTSAHb49m7tHXn9RKG0re2Rh/xnewhP5h
 zMnA==
X-Gm-Message-State: ANoB5ply60UQxi+exz6m/qt4JZwt0EZsTyS2s98PIZi2q7bRvt9ZFz1t
 Sh54QrgLB09E6HNc4HF+zFm+z4HbhVtYZr1SxQA=
X-Google-Smtp-Source: AA0mqf5P44DrDNiqEenJjAv4tZT0X42KqLIw8st3nZ5TSXhHqy0/WweHsmgYH5bCVf8+ktg6Kt7VIg==
X-Received: by 2002:a17:907:9144:b0:7c0:e6d8:7770 with SMTP id
 l4-20020a170907914400b007c0e6d87770mr2484232ejs.74.1671063297556; 
 Wed, 14 Dec 2022 16:14:57 -0800 (PST)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com.
 [209.85.128.51]) by smtp.gmail.com with ESMTPSA id
 b17-20020a1709063cb100b007b4bc423b41sm5129521ejh.190.2022.12.14.16.14.54
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Dec 2022 16:14:56 -0800 (PST)
Received: by mail-wm1-f51.google.com with SMTP id bg10so12659341wmb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 16:14:54 -0800 (PST)
X-Received: by 2002:a05:600c:298:b0:3cf:7716:8954 with SMTP id
 24-20020a05600c029800b003cf77168954mr348637wmk.57.1671063294548; Wed, 14 Dec
 2022 16:14:54 -0800 (PST)
MIME-Version: 1.0
References: <1671052890-11627-1-git-send-email-quic_khsieh@quicinc.com>
 <CAD=FV=UTeCU7BcfPMXz8J-9uOp_7Fn9PFdtFMsu46x5wKa0RyQ@mail.gmail.com>
 <512f9f0d-a399-27fb-08d0-7311b73fd2a1@quicinc.com>
In-Reply-To: <512f9f0d-a399-27fb-08d0-7311b73fd2a1@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 14 Dec 2022 16:14:42 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VvP8Xe+wrMrKymetQ8X9-771m7jM7o1kRQz+oxXdRptg@mail.gmail.com>
Message-ID: <CAD=FV=VvP8Xe+wrMrKymetQ8X9-771m7jM7o1kRQz+oxXdRptg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: do not complete dp_aux_cmd_fifo_tx() if irq
 is not for aux transfer
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 andersson@kernel.org, vkoul@kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, agross@kernel.org, linux-arm-msm@vger.kernel.org,
 dmitry.baryshkov@linaro.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Dec 14, 2022 at 3:46 PM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Hi Doug
>
> On 12/14/2022 2:29 PM, Doug Anderson wrote:
> > Hi,
> >
> > On Wed, Dec 14, 2022 at 1:21 PM Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> >>
> >> There are 3 possible interrupt sources are handled by DP controller,
> >> HPDstatus, Controller state changes and Aux read/write transaction.
> >> At every irq, DP controller have to check isr status of every interrupt
> >> sources and service the interrupt if its isr status bits shows interrupts
> >> are pending. There is potential race condition may happen at current aux
> >> isr handler implementation since it is always complete dp_aux_cmd_fifo_tx()
> >> even irq is not for aux read or write transaction. This may cause aux read
> >> transaction return premature if host aux data read is in the middle of
> >> waiting for sink to complete transferring data to host while irq happen.
> >> This will cause host's receiving buffer contains unexpected data. This
> >> patch fixes this problem by checking aux isr and return immediately at
> >> aux isr handler if there are no any isr status bits set.
> >>
> >> Follows are the signature at kernel logs when problem happen,
> >> EDID has corrupt header
> >> panel-simple-dp-aux aux-aea0000.edp: Couldn't identify panel via EDID
> >> panel-simple-dp-aux aux-aea0000.edp: error -EIO: Couldn't detect panel nor find a fallback
> >>
> >> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/dp/dp_aux.c | 7 +++++++
> >>   1 file changed, 7 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
> >> index d030a93..8f8b12a 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> >> @@ -423,6 +423,13 @@ void dp_aux_isr(struct drm_dp_aux *dp_aux)
> >>
> >>          isr = dp_catalog_aux_get_irq(aux->catalog);
> >>
> >> +       /*
> >> +        * if this irq is not for aux transfer,
> >> +        * then return immediately
> >> +        */
> >
> > Why do you need 4 lines for a comment that fits on one line?
> Yes, we can fit this to one line.
> >
> >> +       if (!isr)
> >> +               return;
> >
> > I can confirm that this works for me. I could reproduce the EDID
> > problems in the past and I can't after this patch. ...so I could give
> > a:
> >
> > Tested-by: Douglas Anderson <dianders@chromium.org>
> >
> > I'm not an expert on this part of the code, so feel free to ignore my
> > other comments if everyone else thinks this patch is fine as-is, but
> > to me something here feels a little fragile. It feels a little weird
> > that we'll "complete" for _any_ interrupt that comes through now
> > rather than relying on dp_aux_native_handler() / dp_aux_i2c_handler()
> > to specifically identify interrupts that caused the end of the
> > transfer. I guess that idea is that every possible interrupt we get
> > causes the end of the transfer?
> >
> > -Doug
>
> So this turned out to be more tricky and was a good finding from kuogee.
>
> In the bad EDID case, it was technically not bad EDID.
>
> What was happening was, the VIDEO_READY interrupt was continuously
> firing. Ideally, this should fire only once but due to some error
> condition it kept firing. We dont exactly know why yet what was the
> error condition making it continuously fire.
>
> In the DP ISR, the dp_aux_isr() gets called even if it was not an aux
> interrupt which fired (so the call flow in this case was
> dp_display_irq_handler (triggered for VIDEO_READY) ---> dp_aux_isr()
> So we should certainly have some protection to return early from this
> routine if there was no aux interrupt which fired.
>
> Which is what this fix is doing.
>
> Its not completing any interrupt, its just returning early if no aux
> interrupt fired.

...but the whole problem was that it was doing the complete() at the
end, right? Kuogee even mentioned that in the commit message.
Specifically, I checked dp_aux_native_handler() and
dp_aux_i2c_handler(), both of which are passed the "isr". Unless I
messed up, both functions already were no-ops if the ISR was 0, even
before Kuogee's patch. That means that the only thing Kuogee's patch
does is to prevent the call to "complete(&aux->comp)" at the end of
"dp_aux_isr()".

...and it makes sense not to call the complete() if no "isr" is 0.
...but what I'm saying is that _any_ non-zero value of ISR will still
cause the complete() to be called after Kuogee's patch. That means
that if any of the 32-bits in the "isr" variable are set, that we will
call complete(). I'm asking if you're sure that every single bit of
the "isr" means that we're ready to call complete(). It feels like it
would be less fragile if dp_aux_native_handler() and
dp_aux_i2c_handler() (which both already look at the ISR) returned
some value saying whether the "isr" contained a bit that meant that
complete() should be called.

-Doug
