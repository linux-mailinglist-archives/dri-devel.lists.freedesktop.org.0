Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABA6501C6F
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 22:14:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC6A10E225;
	Thu, 14 Apr 2022 20:14:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AACCE10E225
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 20:14:40 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id t25so7732912edt.9
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 13:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qgSOXhOj6eX2tVbThvNfdYmtN+IYIYkknh8Kxb94j9s=;
 b=oM2qYDjzsXJDUAHNx6vFqnV1+qnLdL1Xe5C3dzmC66+quS3wWWGkaNIQsO9Yy8nXam
 YG0sUWZXbEJhoHkK57/0Iw5a6LpPk/LwtPQH0w6pgdrknxCmSrmIE74V2aZZjHJfEvdO
 3quH4CB8aG16ID9RExDHT4l4sF/8MSw6AwssM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qgSOXhOj6eX2tVbThvNfdYmtN+IYIYkknh8Kxb94j9s=;
 b=c6NvhTizEsRttzpeIrbnVSBmC7mWGehlur0Qxrpg8sSTsBqtPg6Y4w0Cy4R7lDyeu+
 IlBwrUvfCv/pgyvMEVTT1733FwB4nD17nYpdZ37wNpLhANxW4VUd2IPvOy23a/QhXL9U
 v2jVopMpM8AN1kvYK5+2nYH81o+zA4EwLyG2IyWkCxNI4dSybOs3rklybC5dctSX6S93
 pi5Mr3gLGpszHpiwHo1mqda7cL71ggqwa6CUbxMu8yv8HhezSzI5KE55aRVyB94sunJg
 BhUTDR3C/ItxPB22YrL/GVXFgW0MNp+Pb1YK9Wi5KQrARPUk9IzUECw+t6zKcQcmxXv4
 4Yhw==
X-Gm-Message-State: AOAM530ke9C6XqhNtVnMzkQAW4G6+KhgbxYJ18O2WK5daJZNKFqavfPy
 SLCOYKIaoRmbGSc55DWW7la0PsmQesO/IS/Tqk8=
X-Google-Smtp-Source: ABdhPJycVg5H4qqhEuqj7Y01MF14H/dY0TZfqInIPn/9N2z5QnknIsiLo89OdUDEc0v7OvX9HO+hKQ==
X-Received: by 2002:a05:6402:190d:b0:41b:a70d:1367 with SMTP id
 e13-20020a056402190d00b0041ba70d1367mr4819271edz.155.1649967278874; 
 Thu, 14 Apr 2022 13:14:38 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com.
 [209.85.218.42]) by smtp.gmail.com with ESMTPSA id
 jl28-20020a17090775dc00b006e05cdf3a95sm987254ejc.163.2022.04.14.13.14.38
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 13:14:38 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id s18so12201146ejr.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 13:14:38 -0700 (PDT)
X-Received: by 2002:a05:6000:1c15:b0:207:849a:648b with SMTP id
 ba21-20020a0560001c1500b00207849a648bmr3122026wrb.513.1649966957865; Thu, 14
 Apr 2022 13:09:17 -0700 (PDT)
MIME-Version: 1.0
References: <1649938766-6768-1-git-send-email-quic_sbillaka@quicinc.com>
 <1649938766-6768-2-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=Wmiv2WGhFCLYmXbWESNOh5FfobjNme85aU6YtN1SLVDA@mail.gmail.com>
 <81c3a9fb-4c92-6969-c715-ca085322f9c6@linaro.org>
 <CAE-0n50obe_aqzwQY-X1yH4emjjOErOJ_wj9sQe=HoWEZ3vjTw@mail.gmail.com>
In-Reply-To: <CAE-0n50obe_aqzwQY-X1yH4emjjOErOJ_wj9sQe=HoWEZ3vjTw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 14 Apr 2022 13:09:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U4qtst5q--_1794Pdjsc7b_JMRAh+X_vr-9qJx5NtOrw@mail.gmail.com>
Message-ID: <CAD=FV=U4qtst5q--_1794Pdjsc7b_JMRAh+X_vr-9qJx5NtOrw@mail.gmail.com>
Subject: Re: [PATCH v7 1/4] drm/msm/dp: Add eDP support via aux_bus
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 quic_vproddut <quic_vproddut@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Sean Paul <seanpaul@chromium.org>, Steev Klimaszewski <steev@kali.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Aravind Venkateswaran <quic_aravindh@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Apr 14, 2022 at 12:40 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Dmitry Baryshkov (2022-04-14 12:16:14)
> >
> > I think it's too verbose and a bit incorrect.

Not sure which part you're asserting is incorrect, but shorter is OK w/ me too.


> > This is a bit saner:
> > /*
> >   * These ops do not make sense for eDP, since they are provided
> >   * by the panel-bridge corresponding to the attached eDP panel.
> >   */
> >
> > My question was whether we really need to disable them for eDP since for
> > eDP the detect and and get_modes will be overridden anyway.

Hmm, interesting. Probably for DRM_BRIDGE_OP_MODES that will work?
It's definitely worth confirming but from my reading of the code it
_probably_ wouldn't hurt.

One thing someone would want to confirm would be what would happen if
we move this code and the panel code to implement DRM_BRIDGE_OP_EDID
properly. It looks as if both actually ought to be implementing that
instead of DRM_BRIDGE_OP_MODES, at least in some cases. A fix for a
future day. Could we get into trouble if one moved before the other?
Then the panel would no longer override the eDP controller and the eDP
controller would try to read from a possibly unpowered panel?

So I guess in the end my preference would be that we know that driving
the EDID read from the controller isn't a great idea for eDP (since we
have no way to ensure that the panel is powered) so why risk it and
set the bit saying we can do it?


For hotplug/detect I'm even less confident that setting the bits would
be harmless. I haven't sat down and traced everything, but from what I
can see the panel _doesn't_ set these bits, does it? I believe that
the rule is that when every bridge in the chain _doesn't_ implement
detect/hotplug that the panel is always present. The moment someone
says "hey, I can detect" then it suddenly becomes _not_ always
present. Yes, I guess we could have the panel implement "detect" and
return true, but I'm not convinced that's actually better...


> And to go further, I'd expect that a bridge should expose the
> functionality that it supports, regardless of what is connected down the
> chain. Otherwise we won't be able to mix and match bridges because the
> code is brittle, making assumptions about what is connected.

From my point of view the bridge simply doesn't support any of the
three things when we're in eDP mode. Yes, it's the same driver. Yes,
eDP and DP share nearly the same signalling on the wire. Yes, it's
easily possible to make a single controller that supports DP and eDP.
...but the rules around detection and power sequencing are simply
different for the two cases. The controller simply _cannot_ detect
whether the panel is connected in the eDP case and it _must_ assume
that the panel is always connected. Yes, it has an HPD pin. No, that
HPD pin doesn't tell when the panel is present. The panel is always
present. The panel is always present.

So, IMO, it is _incorrect_ to say we can support HPD and DETECT if we
know we're in eDP mode.

-Doug
