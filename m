Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6534F1A4B
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 23:13:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F0A910E3DC;
	Mon,  4 Apr 2022 21:13:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAA6110E3DC
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 21:13:15 +0000 (UTC)
Received: by mail-qv1-xf36.google.com with SMTP id kc20so8532703qvb.3
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Apr 2022 14:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u+Jl9J4Gm7LRQGPX5xoLGqpAHPcvyGzQPr6d5j6QMTw=;
 b=TSVbunOXvXaI2j2cflfId/dz86MOvQN6HmifvKQzyMoyxFrWDUVNTxEyuubl+ejr4R
 zA9m49+KVYvUsOMAta6F+9tdVJZ/vKCkbS8xyhpV0n/uVXtOO/UsV4qYC3Kr/oOI7Xr5
 3wfySfQxeOD/O4I7pReuqjLOKIvlS+Ml8h7zo8aYZA80gVZzBSUl5WyfC9CR7sCGpM6u
 He2I+Fl9jeEQbU7mNZemR/K1VxoCzZUDn9O1zI27hzFdksqd1in94CCmiOnmrqNGd/8W
 X9E9lNYcqdYSrMDM/PfEkmMqPgEkIYuusTAJ8Gl4KN3ZhvfYFhmQYNC7JqIDuVW3qbB1
 XfSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u+Jl9J4Gm7LRQGPX5xoLGqpAHPcvyGzQPr6d5j6QMTw=;
 b=3M2rJbBpVxzPsFYqUXaHYU+4J5SoOmtonjHnBL+eAIEMrcqMClHbYGw/1Rucxl8ptW
 k47mb6IZOBLZy/xdOSNyO84UO796zQ72a3WBJEoXZ7Qbdub944J3PZx7HfOBKkMuXQ8o
 rhAEy26pxxorRE6ynN0lUYRRJOS4OG9i3+T304Vxib1TCp1xh39kc9rK/Zy6wr5VpH/j
 iY75O+24tDe3LsdJ57PvDpcpIi9ttCM9+xPGXnbCKyN7wjLBK+kIOma0iusUCGp01uSl
 +OqBMRK68G9r/JkCRtuC28k1cScHJddcXH1jtgBPnOOjyXyZlZvF/rm9F55VTU145qfu
 2apw==
X-Gm-Message-State: AOAM532M5DSeWY19aCTllHjBdRzOu2GAFDL/7fS1Moe858+qM4o7mhvE
 FfV8RM64v1ZVM0oTsae4lWAG68fVmRpygWYNsegKUg==
X-Google-Smtp-Source: ABdhPJwxrjD9HfPuwGXMP4Ljy/6xQzhveU0JXd34jHXZBeF11vt01nwh3cDZ3iNbPGbLP6JSVzGT4riqsvKmCJkH474=
X-Received: by 2002:a05:6214:20e4:b0:441:7bed:5ccd with SMTP id
 4-20020a05621420e400b004417bed5ccdmr1456463qvk.119.1649106794685; Mon, 04 Apr
 2022 14:13:14 -0700 (PDT)
MIME-Version: 1.0
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-7-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=UX9Mg71EKvgNp_wNG5q7_ugBgVPbcFWFX5XBG+cQCi8Q@mail.gmail.com>
 <MW4PR02MB718631182DC72076DC794C1DE1E59@MW4PR02MB7186.namprd02.prod.outlook.com>
In-Reply-To: <MW4PR02MB718631182DC72076DC794C1DE1E59@MW4PR02MB7186.namprd02.prod.outlook.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 5 Apr 2022 00:13:03 +0300
Message-ID: <CAA8EJpqOzn4xh1N9GhEbH6YY5uHPdeqhiDnSNMM+ZQ3GdaWFrA@mail.gmail.com>
Subject: Re: [PATCH v6 6/8] drm/msm/dp: remove unnecessary delay during boot
To: "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
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
 <devicetree@vger.kernel.org>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 Doug Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Sean Paul <seanpaul@chromium.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 4 Apr 2022 at 16:53, Sankeerth Billakanti (QUIC)
<quic_sbillaka@quicinc.com> wrote:
>
> Hi Doug,
>
> > On Wed, Mar 30, 2022 at 9:04 AM Sankeerth Billakanti
> > <quic_sbillaka@quicinc.com> wrote:
> > >
> > > Remove the unnecessary delay in executing the EV_HPD_INIT_SETUP
> > event.
> >
> > Tell me more and put it in the commit message! Why did it used to be
> > necessary and why is it no longer necessary? Inquiring minds want to know.
> >
>
> Okay. I will add proper description. The DP phy is shared with usb and executing the
> dp phy_init before the usb phy_init was causing usb devices to not function.

I always wondered, how does this work for the 4-lane DP dongles, where
there is no USB mode/lanes?

> Earlier, enabling phy_init was done when the EV_HPD_INIT_SETUP event was executed.
> So, we had scheduled it to execute after 10 second to let the usb driver complete the phy_init first.
>
> Kuogee made the below change to move the DP phy_init to execute after the DP is connected
> https://patchwork.kernel.org/project/linux-arm-msm/patch/1642531648-8448-2-git-send-email-quic_khsieh@quicinc.com/
>
> So, there is no need for the DP driver to wait 10 seconds for the phy initialization anymore.
>
> eDP PHY is not shared with usb. So, it can be programmed anytime, hence not needing any delay.



-- 
With best wishes
Dmitry
