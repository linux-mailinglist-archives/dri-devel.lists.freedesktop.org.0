Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7E9435182
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 19:41:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DB3C6E334;
	Wed, 20 Oct 2021 17:41:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F8B96E334
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 17:41:05 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id l7so9648652iln.8
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 10:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=09x1oRFaTKDmQrhlhOb9jy+N6hL8DwJNbTkF0zphjoE=;
 b=mnQOVOqgdt1WuKAT8iYksqfZizblzHqHQ0ZpeyU/Tr7i35LtYOojJ16b518ll9ZQop
 mSXIV/ojivDGtUBOWZKJAjqQpyiuL6uYQv8P1dwI4WVCWO4wf9sJhg+9F4yd4Opbq1HD
 yzO3c7Ha5/V2RuTtNP0UfuMMt6qwM6HdXnzJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=09x1oRFaTKDmQrhlhOb9jy+N6hL8DwJNbTkF0zphjoE=;
 b=EbRS2aIAtH4FYJKe3StWmbl2SkabQRdjVVxr7Y5aYmccTHyjT/sBTGQsrv/GV4oMzQ
 nhjN+SfV8BPYA1qb2LAn1tER16zBH7lsSwssdiKQ3QFhVEOVQQukJEDnnbV1HEvqzLys
 wgPYTIe8YypgOfPF8gW+FY3MRn5XEU60wjiiS0sHo1DtrWnqdBNXlj88SSXo4PkpOhwO
 99fM3uWV3beaTmKBPhwgpiPElM12nhPDnGs/qgIfiU1BQ7aiilx68eYcwLrYtS5t7C4U
 oZHMdOSejaVXwR1xIcsQtvqDxA3upuJsLaYu3Pp6Ppg+hOuCCDcrMSEXJzYe9uB8dtC1
 7hlw==
X-Gm-Message-State: AOAM531QIJBBnUF6HHxr6G2L0AsFCmLSPfpvosLnz6OxoSnaoKe/QWoN
 ydsF5vcXWuA08gA2O3Q8woPeg17tiS8P5g==
X-Google-Smtp-Source: ABdhPJwrENMFTL7plgMv5XCVtSpLsQ6IjgXK07MhfJhpWLPwXTO0ahP+pPhMz68U/bnCIpbnmiL9qQ==
X-Received: by 2002:a92:c112:: with SMTP id p18mr301690ile.61.1634751663931;
 Wed, 20 Oct 2021 10:41:03 -0700 (PDT)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com.
 [209.85.166.43])
 by smtp.gmail.com with ESMTPSA id y12sm1552334iow.2.2021.10.20.10.41.03
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 10:41:03 -0700 (PDT)
Received: by mail-io1-f43.google.com with SMTP id z69so22517233iof.9
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 10:41:03 -0700 (PDT)
X-Received: by 2002:a05:6638:2510:: with SMTP id
 v16mr514672jat.68.1634751662770; 
 Wed, 20 Oct 2021 10:41:02 -0700 (PDT)
MIME-Version: 1.0
References: <1634732051-31282-1-git-send-email-quic_sbillaka@quicinc.com>
 <1634732051-31282-3-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1634732051-31282-3-git-send-email-quic_sbillaka@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 20 Oct 2021 10:40:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U9==zFpYtiU1S=n+Ygy5Qa4xfA6GFMpHJUtkpjpNfcyw@mail.gmail.com>
Message-ID: <CAD=FV=U9==zFpYtiU1S=n+Ygy5Qa4xfA6GFMpHJUtkpjpNfcyw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: Add SC7280 compatible string
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>, 
 LKML <linux-kernel@vger.kernel.org>, 
 Sankeerth Billakanti <sbillaka@codeaurora.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <seanpaul@chromium.org>, Stephen Boyd <swboyd@chromium.org>, 
 Kalyan Thota <kalyan_t@codeaurora.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>,
 Krishna Manikandan <mkrishn@codeaurora.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Oct 20, 2021 at 5:14 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> From: Sankeerth Billakanti <sbillaka@codeaurora.org>
>
> The Qualcomm SC7280 platform supports an eDP controller, add
> compatible string for it to dp-controller.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
>  1 file changed, 1 insertion(+)

I think you ignored some of the feedback that was given on v1. Perhaps
you could go back and re-read that feedback? See the replies to:

https://lore.kernel.org/r/1628726882-27841-3-git-send-email-sbillaka@codeaurora.org/

For one, ${SUBJECT} needs updating. It's probably as simple as adding
the "msm/dp" tag, like:

dt-bindings: msm/dp: Add SC7280 compatible string

For another, Stephen requested that you add "sc7280-dp" too.
