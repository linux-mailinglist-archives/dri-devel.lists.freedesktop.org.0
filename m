Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 777D4560E19
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 02:37:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B8F710EBF9;
	Thu, 30 Jun 2022 00:37:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4782F10EBF9
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 00:37:01 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id r18so16559422edb.9
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 17:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MD/TmTcrQEiZqX2Bjoyo72hV/tgqwsB/VS7liK0M4hY=;
 b=HeIA5Da9l8UvD4H4iDgPRtvuycOMJXJpAAfo8lblN1BJG1Th+zubJ+VY5Im1UUxsQe
 2pZfW8CNWgyPy0WDAjKew+yjU3CQSjl56GNR5fKp0NRCndcOmqKoTe0IbTZgraD/kuWb
 TWXX9BCr+B1GfCA33OQtCqwDt5TssQC2VynmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MD/TmTcrQEiZqX2Bjoyo72hV/tgqwsB/VS7liK0M4hY=;
 b=1otDFxCqEf3+f5lHZgGAZppw0xz23ma/LuBi0b+KLldbHdxR2CifUD11LTH2nkzmXV
 HggOf2Xu6TKe2EkA8HD5rfazAtoJ19F+wWNI5iXVspuGzsy+EQRUYWBLE5uVpmuCK2kR
 6lqDtKI1tB+7GYgCiT679ZYLtLCJA4DhF3iEMhZ21CAE9ebknUHIDA/Qhc9JEn6G4y1i
 3ZgwNLc3bDCEdUBcDvB4j+Z7QIz5W2vRESvFR4yEJOT+8j0Y+LhNU7MmaOjrCRuVw/n4
 vxipiDtEFG8iKOdKAaekchQhhO6naHc6iQbcYrxzJKGSWaiWHhh8orjkLRpFUehcWufP
 hYuA==
X-Gm-Message-State: AJIora9LWZ1nzBNhR81/RBXEBAxzKB9/paILamoyPsZyac5HbRvUVYP2
 fcWiliPWacCU+p0k7fvwX/uSMXVufO3u7dgZoBU=
X-Google-Smtp-Source: AGRyM1uxRpoBtYqcQYRfbuxBjeT8ekNNNXOBbEp+jw0P6gh9KHn73dSd76t0zaVXO1VJjMwVKpbq2Q==
X-Received: by 2002:a05:6402:1e95:b0:437:ce7f:e17a with SMTP id
 f21-20020a0564021e9500b00437ce7fe17amr7701566edf.169.1656549419890; 
 Wed, 29 Jun 2022 17:36:59 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com.
 [209.85.221.46]) by smtp.gmail.com with ESMTPSA id
 kl2-20020a170907994200b00722d5b26ecesm8460446ejc.205.2022.06.29.17.36.59
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jun 2022 17:36:59 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id r20so24835908wra.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 17:36:59 -0700 (PDT)
X-Received: by 2002:adf:d1c1:0:b0:21b:a5e9:b7b2 with SMTP id
 b1-20020adfd1c1000000b0021ba5e9b7b2mr5938881wrd.405.1656549418843; Wed, 29
 Jun 2022 17:36:58 -0700 (PDT)
MIME-Version: 1.0
References: <1656429606-2765-1-git-send-email-quic_khsieh@quicinc.com>
 <F35C87BF-46A5-41D3-B8A5-B2AB4A24252D@linaro.org>
In-Reply-To: <F35C87BF-46A5-41D3-B8A5-B2AB4A24252D@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 29 Jun 2022 17:36:45 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X3cv=Q30pODyi__OyRY+LbFT14RfEELvm_DAeHafF70g@mail.gmail.com>
Message-ID: <CAD=FV=X3cv=Q30pODyi__OyRY+LbFT14RfEELvm_DAeHafF70g@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: make eDP panel as the first connected
 connector
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@linux.ie>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 Vinod Koul <vkoul@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Jun 28, 2022 at 1:14 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 28 June 2022 18:20:06 GMT+03:00, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> >Some userspace presumes that the first connected connector is the main
> >display, where it's supposed to display e.g. the login screen. For
> >laptops, this should be the main panel.
> >
> >This patch call drm_helper_move_panel_connectors_to_head() after
> >drm_bridge_connector_init() to make sure eDP stay at head of
> >connected connector list. This fixes unexpected corruption happen
> >at eDP panel if eDP is not placed at head of connected connector
> >list.
>
> The change itself is a good fix anyway. (And I'd ack it.) However I would like to understand why does it fix the corruption issue. What is we have eDP and DSI, with DSI ending up before the eDP? Would we see the issue?
> Also could you please describe the mind of corruption you are observing?

I've spent a whole bunch of time poking at this and in the end my
conclusion is this:

1. The glitchyness seems to be a result of the Chrome OS userspace
somehow telling the kernel to do something wrong.

2. I believe (though I have no proof other than Kuogee's patch fixing
things) that the Chrome OS userspace is simply confused by the eDP
connector being second. This would imply that Kuogee's patch is
actually the right one.

3. It would be ideal if the Chrome OS userspace were fixed to handle
this, but it's an area of code that I've never looked at. It also
seems terribly low priority to fix since apparently other OSes have
similar problems (seems like this code was originally added by
RedHat?)


Specifically, I tested with a similar but "persistent" glitch that I
reproduced. The glitch Kuogee was digging into was a transitory glitch
on the eDP (internal) display when you plugged in a DP (external)
display. It would show up for a frame or two and then be fixed. I can
get a similar-looking glitch (vertical black and white bars) that
persists by doing these steps on a Chrome OS device (and Chrome OS
kernel):

a) Observe screen looks good.
b) Observe DP not connected.
c) Plug in DP
d) See transitory glitch on screen, then it all looks fine.
e) set_power_policy --ac_screen_dim_delay=5 --ac_screen_off_delay=10
f) Wait for screen to turn off
g) Unplug DP
h) Hit key on keyboard to wake device.
i) See glitchy.
j) Within 5 seconds: set_power_policy --ac_screen_dim_delay=5000
--ac_screen_off_delay=10000

Once I'm in the persistent glitch:

* The "screenshot" command in Chrome OS shows corruption. Not exactly
black and white bars, but the image produced has distinct bands of
garbage.

* I can actually toggle between VT2 and the main screen (VT1). Note
that VT1/VT2 are not quite the normal Linux managed solution--I
believe they're handled by frecon. In any case, when I switch to VT2
it looks normal (I can see the login prompt). Then back to VT1 and the
vertical bars glitch. Back to VT2 and it's normal. Back to VT1 and the
glitch again. This implies (especially with the extra evidence of
screenshot) that the display controller hardware is all fine and that
it's the underlying data that's somehow messed up.

When I pick Kuogee's patch then this "persistent" glitch goes away
just like the transitory one does.

I'm going to go ahead and do:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Douglas Anderson <dianders@chromium.org>
