Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BCF67B931
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 19:22:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6B3510E381;
	Wed, 25 Jan 2023 18:22:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DBFF10E381
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 18:22:18 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id i1so9098676ilu.8
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 10:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mQQ+b96bYTR/JdRx7lqvrfEUi55TNY9dz9cLJO4CiN8=;
 b=hisavarov1w5W1Psgb6++dahB/QO8VQceskeeHhNEm2K/HYSKp/ek8PCJtXp5Wcr7I
 gJFlg88ced3rjDWxpZLZlh/bdYD+xNek2hkD9nRMPGgLq0qNwF2kw70+d4/sZ14DS3NS
 F2cWRxngYJBjSmkvGBwxoNC3WL7bXBOpRqabY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mQQ+b96bYTR/JdRx7lqvrfEUi55TNY9dz9cLJO4CiN8=;
 b=bo7m4gf7VWCRKBnvoHavMEX2uz0lG++RHND5hz6UVhflNnPclgMuDvkfLWaN6C0vWc
 Rg1tX+9F+DCPt1wy/meYgkA3Ybt2ucy4yo6AbDUlGAmi0PunSA3q1OTqjaWjubc1zWEL
 m4yRdiAq+VAP47LY2BVhzh64BpmJa1dnGBp3b8UqN3uUQAR7WxM8BQmCxa4kxD16Bqnq
 r2lZg9qsnQoMoebMDUTpoBaoDPGM2gnD/EwQWeiSNjmHIXVP7H6uwSGtjcE10dsH711L
 SHsozA8kGx4j8Gj1tFTW/QyW4hIwpN9Iayo4YboQHuwr0wrXHBwYJwSMax4YMrwqxlFF
 QESQ==
X-Gm-Message-State: AO0yUKUoXD9EALi2mavASTKjvoAdC+EsblmyAVOrGTlknNwj6k6LYlV1
 fzuBWgr9fvPfh+xFFkovg9e5OaFPcUM5G4+9
X-Google-Smtp-Source: AK7set9kkpMzY2s5vOCFauJAWEPb0le3yGPY8hbUwx9Vd0IVYGjtIa1mPBxDghgxFdG8g1XJG0PvdQ==
X-Received: by 2002:a05:6e02:1525:b0:310:add0:4b1b with SMTP id
 i5-20020a056e02152500b00310add04b1bmr789305ilu.5.1674670937514; 
 Wed, 25 Jan 2023 10:22:17 -0800 (PST)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com.
 [209.85.166.45]) by smtp.gmail.com with ESMTPSA id
 l47-20020a02666f000000b00349c45fd3a8sm1840408jaf.29.2023.01.25.10.22.15
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jan 2023 10:22:15 -0800 (PST)
Received: by mail-io1-f45.google.com with SMTP id j1so8841414iob.6
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 10:22:15 -0800 (PST)
X-Received: by 2002:a05:6638:2727:b0:374:f967:4187 with SMTP id
 m39-20020a056638272700b00374f9674187mr4302979jav.130.1674670934658; Wed, 25
 Jan 2023 10:22:14 -0800 (PST)
MIME-Version: 1.0
References: <20230119145248.1.I90ffed3ddd21e818ae534f820cb4d6d8638859ab@changeid>
 <20230119145248.2.I2d7aec2fadb9c237cd0090a47d6a8ba2054bf0f8@changeid>
 <f08b04b2-3fdd-38f5-6402-16c57a3322d2@quicinc.com>
In-Reply-To: <f08b04b2-3fdd-38f5-6402-16c57a3322d2@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 25 Jan 2023 10:21:57 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WHH5=NZPWSyu6P0HVMpSJK_53=S6PgyjJZCKz8-dE1rg@mail.gmail.com>
Message-ID: <CAD=FV=WHH5=NZPWSyu6P0HVMpSJK_53=S6PgyjJZCKz8-dE1rg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/msm/dp: Return IRQ_NONE for unhandled interrupts
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Jan 25, 2023 at 9:22 AM Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> > -void dp_ctrl_isr(struct dp_ctrl *dp_ctrl)
> > +irqreturn_t dp_ctrl_isr(struct dp_ctrl *dp_ctrl)
> >   {
> >       struct dp_ctrl_private *ctrl;
> >       u32 isr;
> > +     irqreturn_t ret = IRQ_NONE;
> >
> >       if (!dp_ctrl)
> > -             return;
> > +             return IRQ_NONE;
> >
> >       ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
> >
> >       isr = dp_catalog_ctrl_get_interrupt(ctrl->catalog);
> can you add (!isr) check and return IRQ_NONE here to be consistent with
> dp_aux_isr()?

I could, though it doesn't really buy us a whole lot in this case and
just adds an extra test that's not needed. Here it should be easy for
someone reading the function to see that if "isr == 0" that neither of
the two "if" statements below will fire and we'll return "IRQ_NONE"
anyway.

...that actually made me go back and wonder whether we still needed
the "if" test in dp_aux_isr() or if it too was also redundant. It
turns out that it's not! The previous patch made dp_aux_irq() detect
unexpected interrupts. Thus the "if (!isr)" test earlier is important
because otherwise we'd end up WARNing "Unexpected interrupt:
0x00000000" which would be confusing.

So unless you or others feel strongly that I should add the redundant
test here, I'd rather keep it off. Let me know.

-Doug
