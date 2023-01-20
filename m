Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F776747D1
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 01:07:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5281C10E9F4;
	Fri, 20 Jan 2023 00:07:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3651810E9F4
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 00:07:31 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id ud5so10052939ejc.4
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 16:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2V8Ln6e8tegMHSBR/J0K1l0Tuvgg5sXARNbUfWI/C08=;
 b=GaQqhxxDs2Yu9TEHYHaW7FaEC5qe3eqdZRboUv1cZObr8UKmpxXD8WDx1MuCfpM1Oi
 ZTgaKuAIwehs6ElVZnISD0lbgkwrjgP00OZm+aMLCHOeMX2yWo71LLQsA3XSLoJ1H3Lg
 Nl9H7LVKRJTqrrmefk4OPeU2PyHuKn31+yjWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2V8Ln6e8tegMHSBR/J0K1l0Tuvgg5sXARNbUfWI/C08=;
 b=Yh5SJlc8XMeRxv96esHMv91MsCugLDQbuREQNy76Y+CvcVIQYslxUXenl5sCDHiA/m
 Xz+I/oY7DEybhn5wAiT0dh0J7SElDHYqbCQynO6ry3ksYV4TnyT277D0KLkP1zdh5Ath
 aYIhl4DVshZi9I2jws0LWO6uKzKs7GCTX2GTPQE0H9Wj/P23/X7p/56Vs3n/QVe/1nqD
 jnCjIdEtCe+ERZxhqNUGA1We6a/xrrJeCPoLILEeU1EXLN59l+4h6VrKNR+jrEoOuEs7
 SD5tkQj2AbUGtU/gPe4Cw3enmkTqQCLIFqUy/er0JhlWs0rvyd9TBKltTQO/XgacHvVV
 UEaQ==
X-Gm-Message-State: AFqh2koWKZNwCGkmgmsEIAMbAgjhxOXvesQJp26rriI6ghpB3RZoslXi
 x1CIN8d2pDIxqdmkEg3yIbk8Ztc1X4uWYMmqAtg=
X-Google-Smtp-Source: AMrXdXsFtz2/UtoBvQbQFqiodjsDG6+gnSGHuVpx7hW9/CaS2o0jh/GtcpelzN2yFUYIaXmVAJ56cA==
X-Received: by 2002:a17:907:6f18:b0:7c1:98d:a8a3 with SMTP id
 sy24-20020a1709076f1800b007c1098da8a3mr13424150ejc.7.1674173249455; 
 Thu, 19 Jan 2023 16:07:29 -0800 (PST)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com.
 [209.85.128.46]) by smtp.gmail.com with ESMTPSA id
 ks1-20020a170906f84100b00877696c016csm2264350ejb.146.2023.01.19.16.07.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 16:07:28 -0800 (PST)
Received: by mail-wm1-f46.google.com with SMTP id
 d4-20020a05600c3ac400b003db1de2aef0so2539387wms.2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 16:07:27 -0800 (PST)
X-Received: by 2002:a05:600c:180f:b0:3db:d4b:f019 with SMTP id
 n15-20020a05600c180f00b003db0d4bf019mr461234wmp.170.1674173247519; Thu, 19
 Jan 2023 16:07:27 -0800 (PST)
MIME-Version: 1.0
References: <1672193785-11003-1-git-send-email-quic_khsieh@quicinc.com>
 <1672193785-11003-3-git-send-email-quic_khsieh@quicinc.com>
 <CAD=FV=VeBBFTZBjZNhMUBO1uTNKBwcgZM6ehnw3BGmervE7jXA@mail.gmail.com>
 <CAE-0n50JB211OhA7pqj6U3rfBeeS0ofzY_moE77REmY2awo7bA@mail.gmail.com>
In-Reply-To: <CAE-0n50JB211OhA7pqj6U3rfBeeS0ofzY_moE77REmY2awo7bA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 19 Jan 2023 16:07:11 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W92EO9+XnRCuBCAePQmH8+CgGQf5ETEtHcRFDkNGhJ0A@mail.gmail.com>
Message-ID: <CAD=FV=W92EO9+XnRCuBCAePQmH8+CgGQf5ETEtHcRFDkNGhJ0A@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] drm/msm/dp: enhance dp controller isr
To: Stephen Boyd <swboyd@chromium.org>
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
 quic_abhinavk@quicinc.com, andersson@kernel.org, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 agross@kernel.org, linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Jan 18, 2023 at 2:34 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Doug Anderson (2023-01-18 10:29:59)
> > Hi,
> >
> > On Tue, Dec 27, 2022 at 6:16 PM Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> > > +
> > >         if (isr & DP_INTR_AUX_ERROR) {
> > >                 aux->aux_error_num = DP_AUX_ERR_PHY;
> > >                 dp_catalog_aux_clear_hw_interrupts(aux->catalog);
> > > +               ret = IRQ_HANDLED;
> > >         }
> >
> > The end result of the above is a weird mix of "if" and "else if" for
> > no apparent reason. All except one of them just updates the exact same
> > variable so doing more than one is mostly useless. If you made it
> > consistently with "else" then the whole thing could be much easier,
> > like this (untested):
>
> Totally agreed. I even asked that when I posted the RFC[1]!
>
> "Can we also simplify the aux handlers to be a big pile of
> if-else-if conditions that don't overwrite the 'aux_error_num'? That
> would simplify the patch below."
>
> > > @@ -425,17 +464,15 @@ void dp_aux_isr(struct drm_dp_aux *dp_aux)
> > >
> > >         /* no interrupts pending, return immediately */
> > >         if (!isr)
> > > -               return;
> > > +               return IRQ_NONE;
> > >
> > >         if (!aux->cmd_busy)
> > > -               return;
> > > +               return IRQ_NONE;
> > >
> > >         if (aux->native)
> > > -               dp_aux_native_handler(aux, isr);
> > > +               return dp_aux_native_handler(aux, isr);
> > >         else
> > > -               dp_aux_i2c_handler(aux, isr);
> > > -
> > > -       complete(&aux->comp);
> > > +               return dp_aux_i2c_handler(aux, isr);
> >
> > Personally, I wouldn't have done it this way. I guess that means I
> > disagree with Stephen. I'm not dead-set against this way and it's fine
> > if you want to continue with it. If I were doing it, though, then I
> > would always return IRQ_HANDLED IF dp_catalog_aux_get_irq() returned
> > anything non-zero. Why? Officially if dp_catalog_aux_get_irq() returns
> > something non-zero then you know for sure that there was an interrupt
> > for this device and officially you have "handled" it by acking it,
> > since dp_catalog_aux_get_irq() acks all the bits that it returns. That
> > means that even if dp_aux_native_handler() or dp_aux_i2c_handler()
> > didn't do anything with the interrupt you at least know that it was
> > for us (so if the IRQ is shared we properly report back to the IRQ
> > subsystem) and that it won't keep firing over and over (because we
> > acked it).
>
> I'm primarily concerned with irq storms taking down the system. Can that
> happen here? If not, then returning IRQ_NONE is not really useful. The
> overall IRQ for DP looks to be level, because the driver requests the
> IRQ that way. The aux interrupt status bits look to be edge style
> interrupts though, because the driver acks them in the handler. I guess
> that means the edges come in and latch into the interrupt status
> register so the driver has to ack all of them to drop the IRQ level for
> the overall DP interrupt? If the driver only acked the bits it looked at
> instead of all interrupt bits in the register, then the level would
> never go down for the IRQ if an unhandled interrupt bit was present like
> 'DP_INTR_PLL_UNLOCKED'. That would mean we would hit spurious IRQ
> handling very quickly if that interrupt bit was ever seen.
>
> But the driver is acking all interrupts, so probably trying to work
> IRQ_NONE into this code is not very useful? The only thing it would
> catch is DP_INTR_PLL_UNLOCKED being set over and over again, which seems
> unlikely. Of course, why is this driver unmasking interrupt bits it
> doesn't care about? That may be leading to useless interrupt handling in
> this driver if some interrupt bit is unmasked but never looked at. Can
> that be fixed in another patch?
>
> >
> > NOTE: I still like having the complete() call in
> > dp_aux_native_handler() and dp_aux_i2c_handler() and, to me, that part
> > of this patch is worthwhile. That makes it more obvious that the code
> > is truly expecting that complete to be called for all error cases as
> > well as transfer finished.
> >
>
> I think it may be required. We don't want to allow DP_INTR_PLL_UNLOCKED
> to complete() the transfer.

OK, I've tried to code up what I think is the right solution. I'd
appreciate review and testing.

https://lore.kernel.org/r/20230119145248.1.I90ffed3ddd21e818ae534f820cb4d6d8638859ab@changeid

-Doug
