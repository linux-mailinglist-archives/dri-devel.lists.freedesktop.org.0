Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4297055A503
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jun 2022 01:45:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C51910EBF9;
	Fri, 24 Jun 2022 23:45:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32E6410F04A
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 23:45:46 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id r138so2936306qke.13
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 16:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z3MRZDPjbjqka5SFCsRF0GaePuedl2AIb6glbaDxLPo=;
 b=T1jZ/wuAXd4vkBbmbjvR4zc2gMr+VrXytSGHLBHq2r677FwX7N3/8VRvVeku7U9PL4
 z5UOWQn1DzpuX52KtITNRF3Ywiklcq2o9+xtPOrMchkBSRMQBAh9u2490x1FYlA83+Fw
 3q7/7YYig0nseD0c+Z92CqG7EJ7irgF7zexvcR/iaNm9ym7oke5sLufp9rSdU2HBRYgn
 lFpWRdhpyb2VnBVu1ENsguh/VNuNa9AdK2OKDjFndacjelg0wh+eEtq2hlJ801HyxLXn
 OQxYh3jQLwSrcxj2ROwUU9NLUWQl/Z1tLvlA65PmyaHELR6gJsMf2lJpP1DYZsm88RIG
 kRmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z3MRZDPjbjqka5SFCsRF0GaePuedl2AIb6glbaDxLPo=;
 b=B9skvelTfhhuBPJKap6RlhqWkExL39RtXgfw2UxfBFvtRr+I6wlj+Kam3FZVvpx3TH
 WEfnR5RkSYAWzm05jU/A47mPR0Hc+DTE0D7cslKfjB1xHgJjA67ZA4epDVVcN1cqZsCc
 BNDq7YZEIC6jxG7P0c1BtDFEYdG/FpExOr0BplIBEzwE2qddlPeCThuzzebaOr85ve3F
 JkizvYUufeOPKTTKpbw6oAfCb7s/aH7Zr5eiY7TFAoGZlFlFlM4phouOvz8NkFbLd+/I
 ctsH4LiycnAke6bHcIUAX0FhVPG/IVPFOROKeoxE9fI6nNP+tnQud9NjGnV0G5Fy0akq
 AAUg==
X-Gm-Message-State: AJIora/sFiInGwOlfI704I8UzInN5lB8IgequrkodWPj2Ou/8KEA1HMe
 u2LmnhxFzKzy4XiciBWJFNcB/fgidOZhBIPQhS0XJw==
X-Google-Smtp-Source: AGRyM1v/i8BJMvLqu4IlBuePJHdL20SOPQr3QObkB7VQeNVKxSUFFYLdnJmiIKpbsI6PhCqNqVQetH1um/ElYuHDTPU=
X-Received: by 2002:a05:620a:31a0:b0:6a7:549f:a788 with SMTP id
 bi32-20020a05620a31a000b006a7549fa788mr1331198qkb.203.1656114345250; Fri, 24
 Jun 2022 16:45:45 -0700 (PDT)
MIME-Version: 1.0
References: <1656090912-18074-1-git-send-email-quic_khsieh@quicinc.com>
 <1656090912-18074-2-git-send-email-quic_khsieh@quicinc.com>
 <CAD=FV=XD0Nb8GiaqEM52rEkUeVjuo46hBv9YUizdDu9zOH6QfA@mail.gmail.com>
 <0632e72a-3bd2-6320-4a00-6d3cf7d40513@quicinc.com>
In-Reply-To: <0632e72a-3bd2-6320-4a00-6d3cf7d40513@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 25 Jun 2022 02:45:33 +0300
Message-ID: <CAA8EJpqfdzmcpGeLHr5wBA7B91rAegoJhpFG=CYyJ4C2gxVBXw@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] drm/msm/dp: move struc of msm_display_info to
 msm_drv.h
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@linux.ie>, freedreno <freedreno@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Doug Anderson <dianders@chromium.org>, Vinod Koul <vkoul@kernel.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 25 Jun 2022 at 00:51, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> On 6/24/2022 2:40 PM, Doug Anderson wrote:
> > On Fri, Jun 24, 2022 at 10:15 AM Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:

> >> +struct msm_display_info {
> >> +       int intf_type;
> >> +       uint32_t capabilities;
> >> +       uint32_t num_of_h_tiles;
> >> +       uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
> >> +       bool is_te_using_watchdog_timer;
> > ...but then when you "move" the structure to its new location, which
> > should be a noop, then <poof> the "dsc" variable vanishes (along with
> > the kernel doc description of it before the structure).
>
> Sorry, i did not resolve the conflicts correctly  when i cherry-pick
> them to msm-next tree.
>
> Will fix them.

I would strongly suggest doing development on top of msm/next or
linux-next. Using any other tree results in lots of problems starting
from the lame Fixes tags that we have been constantly seeing for the
last few months, conflicts when the patch is being rebased or
cherry-picked and ending up with the patches not being tested with the
tree that they are being applied to.

-- 
With best wishes
Dmitry
