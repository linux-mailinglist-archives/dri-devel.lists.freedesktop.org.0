Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3054ACCBD
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 01:19:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FCA810E3B7;
	Tue,  8 Feb 2022 00:18:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5617010E2E6
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 00:18:56 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id f13so360479ilq.5
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Feb 2022 16:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vScBC3jkunPuKV71bwmpHxOhrGxKlBbuYe/cqBu7qF8=;
 b=TV/KEXy0SdalYrBG9vcyQo4ANXKRqQZpfsevkQCRvDDS3QkNqsAVFK3CiXgrn7BhEC
 lQZP1zue6xcSxErPJDsPnbnJ7NzZaPCUltMJoeN9SGtNIMM3tb2qVUWD6hCx2/5gvyQb
 4WVzprlonmdeJ8JUjSQiAOvjj5o67UrS7+Dfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vScBC3jkunPuKV71bwmpHxOhrGxKlBbuYe/cqBu7qF8=;
 b=lD0zba4IYblew18l8NK1LI0XN2gAQnmTvTLk9522AkmJnLTQp3NxNWuedBzWwFV5J/
 fq6C0yItccDi2udhOmOEHsGr0v7fgr/XK9b9CH3/3kO5eujYSYM0TH66bDZIsPOHmFmA
 8TuZ8M7Xe8ST9DlCPcQ97umOtvZ7s7irvlOPWE0YDKxaBQkE3sQ9prZ56bkAwFnxpjgh
 KiTiqlar7PDgOHlkoXl9nYuR/y4bwNFT7tlmcpoNbjMHQDki61GefRyiJZbGSGyGjmjq
 cAkj9dYX08wgkzrwfhcDZ50VF2/Im2ljngpPxMbvU5GAMdNUKWRYoXvveRydQehsWEAb
 i8fQ==
X-Gm-Message-State: AOAM531OieSdxNyZdUmO7+XHneLJ2J+IXbfHlKCxZ0dvEBMN20YO3cIx
 kFUP8yJoDhF3iqPhiAUnTbCADP9sIp613Q==
X-Google-Smtp-Source: ABdhPJyFo+EGHw2JdZxtc0nj3GC2Xiet9QXy/LDFUYq2VqDtGW53ajtbYr/VOUM44NFqyhXjkqHToQ==
X-Received: by 2002:a05:6e02:20cd:: with SMTP id
 13mr889578ilq.225.1644279535451; 
 Mon, 07 Feb 2022 16:18:55 -0800 (PST)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com.
 [209.85.166.42])
 by smtp.gmail.com with ESMTPSA id s12sm6658682ilv.40.2022.02.07.16.18.54
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Feb 2022 16:18:54 -0800 (PST)
Received: by mail-io1-f42.google.com with SMTP id 9so19204288iou.2
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Feb 2022 16:18:54 -0800 (PST)
X-Received: by 2002:a05:6638:168d:: with SMTP id
 f13mr980261jat.44.1644279533953; 
 Mon, 07 Feb 2022 16:18:53 -0800 (PST)
MIME-Version: 1.0
References: <1637046458-20607-1-git-send-email-quic_sbillaka@quicinc.com>
 <CAE-0n50sONq+URcWwvDH=UPshgy6+XZEB3sK_4n+5jNktHsEhg@mail.gmail.com>
In-Reply-To: <CAE-0n50sONq+URcWwvDH=UPshgy6+XZEB3sK_4n+5jNktHsEhg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 7 Feb 2022 16:18:40 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VwrO9fpOtpjrsbjkmucvL6NbHMc3jLtjsiRJD6aG0Hkg@mail.gmail.com>
Message-ID: <CAD=FV=VwrO9fpOtpjrsbjkmucvL6NbHMc3jLtjsiRJD6aG0Hkg@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] Add support for eDP PHY on SC7280 platform
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
Cc: quic_kalyant@quicinc.com, Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 quic_abhinavk@quicinc.com, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Sean Paul <seanpaul@chromium.org>, linux-phy@lists.infradead.org,
 quic_mkrishn@quicinc.com, quic_khsieh@quicinc.com,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Feb 2, 2022 at 1:54 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Sankeerth Billakanti (2021-11-15 23:07:35)
> > This series adds support for the eDP PHY on Qualcomm SC7280 platform.
> > The changes are dependent on v4 of the new eDP PHY driver introduced by Bjorn:
> > https://patchwork.kernel.org/project/linux-arm-msm/list/?series=575135
> >
> > Sankeerth Billakanti (3):
> >   dt-bindings: phy: Add eDP PHY compatible for sc7280
> >   phy: qcom: Add support for eDP PHY on sc7280
> >   phy: qcom: Program SSC only if supported by sink
>
> This series was sent to the wrong maintainers. It's in the phy
> framework, not the drm framework. Please use scripts/get_maintainers.pl
> to find the right email addresses and send this series again.

To help out, I've re-posted this myself, hopefully getting all the
correct maintainers.

https://lore.kernel.org/r/20220208001704.367069-1-dianders@chromium.org
