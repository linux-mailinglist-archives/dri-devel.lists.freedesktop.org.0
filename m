Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F4E5B67FC
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 08:35:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4EF610E619;
	Tue, 13 Sep 2022 06:35:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA25210E616
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 06:35:30 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id r18so25132884eja.11
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 23:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=gKNkp5TT0XjbSEmbU4M+B2B1cDxK13/0CThFH853tls=;
 b=oWWEF/08VQtpBTsplhTEQ87f9wS6PdIe0WOT+m9wrHcVpU1Gbf6/v9mUpGSDwch3nR
 A0Zib3++wgkeB2Ne5BzvDdzU+eifZFHaQGbgrGEK0/vux33BpwRSjkNkzUNwtnnOeeHH
 s0dkzYSP2obWbdCHPijdD2H/iA0Pku8Ki4LTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=gKNkp5TT0XjbSEmbU4M+B2B1cDxK13/0CThFH853tls=;
 b=pqrv7iLCYOTEeNibsse2mdKCCTr0DI6+vmWe4n06kb9sOPGIyBiuzDAdqj2MO8J/kw
 kJpANUQ8k9gzdZZxMb4bGsRG5varbPM183vYINTwv9uiR1DzdSGg9GlNV5pD1UAvVJYd
 WI3h0zjWehSDkADSisWf7/u2vu1gkDLsHnfvPtEyv7zBoREMsxcxgxhBHXpRC1F9a0MM
 8Ux6kchwE73C6FP5aiywuAXxSDQweMujuDQByw44BFtS+1xL5x3InYQ+RteDu2lZck0Q
 DYillgt2EcWrlHomM+LVo4s2QtBKEsBvncn5KgUJqvrkAX+Upoq67W24/yA+4lJE3JGK
 gtEw==
X-Gm-Message-State: ACgBeo1mxX7v5PsULa8huwHhlHSR2rO39rSt0tJTcPkRg8FOeadrahOr
 GGJJa5yuoexKNy5uwfKB87vjIhMNrDdio89z9vw=
X-Google-Smtp-Source: AA6agR4sFtNYLjND64WQDH47qy1ZV+vdLIjL7htTnlv2haUADyH/JIMalGJiZO66PxCB6t9LCGiXDg==
X-Received: by 2002:a17:906:fe46:b0:73d:939a:ec99 with SMTP id
 wz6-20020a170906fe4600b0073d939aec99mr21079045ejb.169.1663050928693; 
 Mon, 12 Sep 2022 23:35:28 -0700 (PDT)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com.
 [209.85.128.54]) by smtp.gmail.com with ESMTPSA id
 m13-20020a056402510d00b004518ee90b4dsm4705221edd.1.2022.09.12.23.35.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Sep 2022 23:35:27 -0700 (PDT)
Received: by mail-wm1-f54.google.com with SMTP id
 c2-20020a1c3502000000b003b2973dafb7so12702989wma.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 23:35:27 -0700 (PDT)
X-Received: by 2002:a05:600c:4e8b:b0:3a5:f5bf:9c5a with SMTP id
 f11-20020a05600c4e8b00b003a5f5bf9c5amr1199949wmq.85.1663050927147; Mon, 12
 Sep 2022 23:35:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220912154046.12900-1-johan+linaro@kernel.org>
 <20220912154046.12900-5-johan+linaro@kernel.org>
 <e60f0053-3801-bf33-5841-69f16215fa00@linaro.org>
In-Reply-To: <e60f0053-3801-bf33-5841-69f16215fa00@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 13 Sep 2022 07:35:15 +0100
X-Gmail-Original-Message-ID: <CAD=FV=U8_bjPm3NEOWqzehrx0xFV4U771nTuhhOiM9gKDVCo5g@mail.gmail.com>
Message-ID: <CAD=FV=U8_bjPm3NEOWqzehrx0xFV4U771nTuhhOiM9gKDVCo5g@mail.gmail.com>
Subject: Re: [PATCH 4/7] drm/msm/dp: fix aux-bus EP lifetime
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 "# 4.0+" <stable@vger.kernel.org>, freedreno <freedreno@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>, Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Sep 12, 2022 at 7:10 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 12/09/2022 18:40, Johan Hovold wrote:
> > Device-managed resources allocated post component bind must be tied to
> > the lifetime of the aggregate DRM device or they will not necessarily be
> > released when binding of the aggregate device is deferred.
> >
> > This can lead resource leaks or failure to bind the aggregate device
> > when binding is later retried and a second attempt to allocate the
> > resources is made.
> >
> > For the DP aux-bus, an attempt to populate the bus a second time will
> > simply fail ("DP AUX EP device already populated").
> >
> > Fix this by amending the DP aux interface and tying the lifetime of the
> > EP device to the DRM device rather than DP controller platform device.
>
> Doug, could you please take a look?
>
> For me this is another reminder/pressure point that we should populate
> the AUX BUS from the probe(), before binding the components together.

Aside from the kernel robot complaints, I'm not necessarily convinced.
I think we know that the AUX DP stuff in MSM-DP is fragile right now
and Qualcomm has promised to clean it up. This really feels like a
band-aid and is really a sign that we're populating the AUX DP bus in
the wrong place in Qualcomm's code. As you said, if we moved this to
probe(), which is the plan in the promised cleanup, then it wouldn't
be a problem.

As far as I know Qualcomm has queued this cleanup behind their current
PSR work (though it's never been clear why both can't be worked on at
the same time) and the PSR work was stalled because they couldn't
figure out what caused the glitching I reported. It's still on my nag
list that I bring up with them every week...

In any case, if a band-aid is urgent, maybe you could just call
of_dp_aux_populate_bus() directly in Qualcomm code and you could add
your own devm_add_action_or_reset() on the DRM device.
