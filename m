Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14466501D42
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 23:16:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44A9D10E255;
	Thu, 14 Apr 2022 21:16:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53A4B10E255
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 21:16:34 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id w19so11181132lfu.11
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 14:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=hzss3S8EAxAsavIN32Nj98tYgxaynKoxCgcASJv0Pw0=;
 b=Ag5J4ZsKhFsUbTcBi/ywOSYBUgQER+JfhIfmr4GjKadOTYGzy74STykx/t1PHfVakq
 +0MA+up2r4aVMz2pMRZPUwC7d5IllOi3mg07JwzwlsBwKLe3ZuVWQLhI7gvq/JerptV2
 ER42tuOnk3b0bH1m1RO1W3qT9boL+kykd56bZe3WP6sVOA2CTA0/O998eiXSPj6PGTQH
 wInAoPsTLSogY9My5wkVL4qDk7gAMyGK4J6NyNjJah3S72cwlM5R/rBT7rsGu4gvnuKB
 MvarUb7XtSv/Abdu+VAq8hTBPF/Al82oECmtf5+CATa6CmMO24XTMGYO7R83WCUwKIS2
 Bb7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hzss3S8EAxAsavIN32Nj98tYgxaynKoxCgcASJv0Pw0=;
 b=riK4p+o305DjcoPlyIZGqjW8XeVhR8DEO3UlsHup4vb0zaMOKuCHRJdA3/oHCQqWi4
 YyEDL9eCGwH3bLLlQ0eUlwOaRdAgjNFrMCK29kBlWrH64udyycrEkG2m33ZI4eUvGD19
 OAK9nvtZ10RK6N9w/T5OSqtBk1N1RzUxmtddgzzY0Ei5EJoDLQJDPQjnyvkl65i4zrqV
 N2V5TfgF2oH/2KOwZIvSpxkodLhZ36Bo4NsXcQSuIFiUrEIr50qNeytZncaAqPYekrR8
 ms81k3pO2HB4bKI3HNt+NIiqrGxuYOqz1UWUG5E3s+5MXyh+AxlZiEBkwk58o/SioSDp
 kwMg==
X-Gm-Message-State: AOAM533sVa4DgIQBP7w4k9C6CGR5YOXnlzqwUGdH3j55SgBQ0FHORgXS
 DeKnsOVtLw6vkdMr/oosaLVqOw==
X-Google-Smtp-Source: ABdhPJycipDcCqYIN4cTl0tlH/tKSdyj6F83dqF91tZdGpzTSL4ESHLFODXfSqWZ9c8UMZ2CQ7CAow==
X-Received: by 2002:a05:6512:39cb:b0:46b:a452:4ca1 with SMTP id
 k11-20020a05651239cb00b0046ba4524ca1mr3065819lfu.154.1649970992440; 
 Thu, 14 Apr 2022 14:16:32 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 q29-20020a19431d000000b0046bb8d1e4f5sm110614lfa.262.2022.04.14.14.16.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 14:16:32 -0700 (PDT)
Message-ID: <56453228-d4b2-c7e4-7b72-6de8637f2def@linaro.org>
Date: Fri, 15 Apr 2022 00:16:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v7 1/4] drm/msm/dp: Add eDP support via aux_bus
Content-Language: en-GB
To: Doug Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>
References: <1649938766-6768-1-git-send-email-quic_sbillaka@quicinc.com>
 <1649938766-6768-2-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=Wmiv2WGhFCLYmXbWESNOh5FfobjNme85aU6YtN1SLVDA@mail.gmail.com>
 <81c3a9fb-4c92-6969-c715-ca085322f9c6@linaro.org>
 <CAE-0n50obe_aqzwQY-X1yH4emjjOErOJ_wj9sQe=HoWEZ3vjTw@mail.gmail.com>
 <CAD=FV=U4qtst5q--_1794Pdjsc7b_JMRAh+X_vr-9qJx5NtOrw@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAD=FV=U4qtst5q--_1794Pdjsc7b_JMRAh+X_vr-9qJx5NtOrw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
 Aravind Venkateswaran <quic_aravindh@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/04/2022 23:09, Doug Anderson wrote:
> Hi,
> 
> On Thu, Apr 14, 2022 at 12:40 PM Stephen Boyd <swboyd@chromium.org> wrote:
>>
>> Quoting Dmitry Baryshkov (2022-04-14 12:16:14)
>>>
>>> I think it's too verbose and a bit incorrect.
> 
> Not sure which part you're asserting is incorrect, but shorter is OK w/ me too.

I was referring to the "If we don't implement the ops..." part. For some 
reason I thought that panel implements detect() callback (and thus the 
DRM will not care because the next bridge takes precedence).

However I was mistaken, please excuse me. Your description was correct 
and I was wrong. The panel bridge doesn't implement callback. Most 
probably I mixed it with the display_connector bridge.

So... your description is more correct.

> 
> 
>>> This is a bit saner:
>>> /*
>>>    * These ops do not make sense for eDP, since they are provided
>>>    * by the panel-bridge corresponding to the attached eDP panel.
>>>    */
>>>
>>> My question was whether we really need to disable them for eDP since for
>>> eDP the detect and and get_modes will be overridden anyway.
> 
> Hmm, interesting. Probably for DRM_BRIDGE_OP_MODES that will work?
> It's definitely worth confirming but from my reading of the code it
> _probably_ wouldn't hurt.
> 
> One thing someone would want to confirm would be what would happen if
> we move this code and the panel code to implement DRM_BRIDGE_OP_EDID
> properly. It looks as if both actually ought to be implementing that
> instead of DRM_BRIDGE_OP_MODES, at least in some cases. A fix for a
> future day. Could we get into trouble if one moved before the other?
> Then the panel would no longer override the eDP controller and the eDP
> controller would try to read from a possibly unpowered panel?

That would depend on the way the get_edid would be implemented in DP 
driver. Currently the edid is cached via the 
dp_display_process_hpd_high() -> dp_panel_read_sink_caps() call chain.

With this patchset, the dp_hpd_plug_handle() -> 
dp_display_usbpd_configure_cb() -> dp_display_process_hpd_high() will be 
called too late for the get_modes/get_edid (from dp_bridge's enable() op).

There is another issue. drm_panel has only get_modes() callback, so 
panel_bridge can not implement get_edid() unless we extend the panel 
interface (which might be a good idea).

> 
> So I guess in the end my preference would be that we know that driving
> the EDID read from the controller isn't a great idea for eDP (since we
> have no way to ensure that the panel is powered) so why risk it and
> set the bit saying we can do it?

Yep.


> For hotplug/detect I'm even less confident that setting the bits would
> be harmless. I haven't sat down and traced everything, but from what I
> can see the panel _doesn't_ set these bits, does it? I believe that
> the rule is that when every bridge in the chain _doesn't_ implement
> detect/hotplug that the panel is always present. The moment someone
> says "hey, I can detect" then it suddenly becomes _not_ always
> present. Yes, I guess we could have the panel implement "detect" and
> return true, but I'm not convinced that's actually better...

I think it makes sense to implement OP_DETECT in panel bridge (that 
always returns connector_status_connected) at least to override the 
possible detect ops in previous bridges.

>> And to go further, I'd expect that a bridge should expose the
>> functionality that it supports, regardless of what is connected down the
>> chain. Otherwise we won't be able to mix and match bridges because the
>> code is brittle, making assumptions about what is connected.
> 
>  From my point of view the bridge simply doesn't support any of the
> three things when we're in eDP mode. Yes, it's the same driver. Yes,
> eDP and DP share nearly the same signalling on the wire. Yes, it's
> easily possible to make a single controller that supports DP and eDP.
> ...but the rules around detection and power sequencing are simply
> different for the two cases.

I just hope that during refactoring this can be expressed in a more 
natural way.

> The controller simply _cannot_ detect
> whether the panel is connected in the eDP case and it _must_ assume
> that the panel is always connected. Yes, it has an HPD pin. No, that
> HPD pin doesn't tell when the panel is present. The panel is always
> present. The panel is always present.

Yep, I remember regarding the HPD pin. And I still think that panel-edp 
(and panel bridge) should provide an overriding OP_DETECT.

> So, IMO, it is _incorrect_ to say we can support HPD and DETECT if we
> know we're in eDP mode.

I see your point. Let's do it this way. Maybe (hopefully) it will become 
more logical during refactoring. Or maybe I'll just tune myself into the 
DP/eDP logic :D

-- 
With best wishes
Dmitry
