Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F87C4EE4B4
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 01:23:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 183C910E334;
	Thu, 31 Mar 2022 23:23:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD27010E32E
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 23:23:40 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id c62so1032664edf.5
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 16:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LLB/4ErH2KmNX4icsPtz8gcVd91Ba8xsooM5WCEu/To=;
 b=nO2IsBJyBf/P3KA7s8QuuGM6xFZSrWZovU/MfhkXj0KUNNuFJ3JGAq+Rs/3rX52qsY
 7P5N2AMJME5FGhl9OxAp3JLusS1z1TEB+mUKXGDbBLppxe902V/8Zo5Zc7k50FYB1oxq
 GxXAOnEIWO1JRgUrPmufk1e5oNiZETTlMRBzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LLB/4ErH2KmNX4icsPtz8gcVd91Ba8xsooM5WCEu/To=;
 b=aA+1mcq4GDMlMPwScbPtzhBgJAtAv1EPEY/4ZYZ051GgvSuzt1S7upZACYumZYO7gi
 l5LVpmYSwbrjfwj83U490ozsb5YTS6y54iIoODp+XGILiL1UXNE6chIgrI2NyARm/Ph6
 wYk8SZR2UMRi6Nzn8XHP+VsjBGMK9L57uGxxQG8eepcjWT9pZ9HrA7O0NrpF10Umizmh
 3FOnXCWky4ZXcH+iQXQKVaDpSoREbXZlsDv1BBKzh6GIEwhU68MeKbQWXm1CoBWNdZ/c
 IAkiXRyUNy0Sc4mdQHmMeaiiXzLMk8/cG7xBlOGohQW4I64uPy/gwPiASZU3HLTBSRb6
 WmVA==
X-Gm-Message-State: AOAM532bx4LGFmBh+ShalgGP2pqZS5wxJqDwIXbRJvGiejWFz+s2dYpP
 XN7dKGOCU/jZrv+O61Zi2LhIeK6Zfs52JEmR
X-Google-Smtp-Source: ABdhPJx7Nxh1wxFMwJpzxh8b57a4k37AG76W6CpmpGlATEVvRbPMqoM07aQnjGB2KN1lpnh7jbN1ig==
X-Received: by 2002:aa7:c30f:0:b0:419:2af:4845 with SMTP id
 l15-20020aa7c30f000000b0041902af4845mr18825495edq.296.1648769019078; 
 Thu, 31 Mar 2022 16:23:39 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com.
 [209.85.128.53]) by smtp.gmail.com with ESMTPSA id
 x12-20020aa7d6cc000000b00419812ecd2csm358756edr.74.2022.03.31.16.23.36
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 16:23:37 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id n35so680475wms.5
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 16:23:36 -0700 (PDT)
X-Received: by 2002:a1c:7518:0:b0:37c:7eb:f255 with SMTP id
 o24-20020a1c7518000000b0037c07ebf255mr6394707wmc.29.1648769016448; Thu, 31
 Mar 2022 16:23:36 -0700 (PDT)
MIME-Version: 1.0
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-7-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1648656179-10347-7-git-send-email-quic_sbillaka@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 31 Mar 2022 16:23:23 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UX9Mg71EKvgNp_wNG5q7_ugBgVPbcFWFX5XBG+cQCi8Q@mail.gmail.com>
Message-ID: <CAD=FV=UX9Mg71EKvgNp_wNG5q7_ugBgVPbcFWFX5XBG+cQCi8Q@mail.gmail.com>
Subject: Re: [PATCH v6 6/8] drm/msm/dp: remove unnecessary delay during boot
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
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
 <devicetree@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Sean Paul <seanpaul@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, quic_aravindh@quicinc.com,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Mar 30, 2022 at 9:04 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> Remove the unnecessary delay in executing the EV_HPD_INIT_SETUP event.

Tell me more and put it in the commit message! Why did it used to be
necessary and why is it no longer necessary? Inquiring minds want to
know.

-Doug
