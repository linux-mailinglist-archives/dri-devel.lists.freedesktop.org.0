Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FD838A685
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 12:28:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D680689C2A;
	Thu, 20 May 2021 10:28:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3447689296
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 10:28:20 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 gb21-20020a17090b0615b029015d1a863a91so5201447pjb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 03:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/KWRCsGKMUP2JAZnha37ZjnkZMEQx6lVgM8h9scsc7w=;
 b=M3oXNQTwNcGsOs/VcEwNm2YeWm8XEow0w8yaKf4YpYNeFKLqQ0CBuipLIHVMMtxvs1
 taHLYVgcwgF3jcmdZd0/7xu7fPfolPRJ+tBzKaAKK4QTsG+YA1mZCKL8XtVw863SDnGd
 KzS/R62sjDv+NoUXZLKiP6RhE72Vwa2H2Ykk0a31x55+KETfxmoyVaMWv9OSYP+hCtza
 M82MFJO3Y1N3dFB7nIbrzhtPQBmdGnKR+p2YYzW6fyOqqOwj01ALIzvi7BqS4aytqI19
 Sv/CPFsHlW4OJIqie9WpaYumocGMixGeDmmOVctYNNSbvH2Nr2RLlsW32Dk5Zq3ZAuSO
 G47A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/KWRCsGKMUP2JAZnha37ZjnkZMEQx6lVgM8h9scsc7w=;
 b=E4B7lxjCO1d/j1EXYLALCU6p8cbpRx06kYWuE2dTJ++E1yhUgdQYwViQio6ShW5V95
 1FmvDk2V1aE3m+1wx1RxzUw2WMSx/3ucnbDXrFdQFXUDvDsv5Km7WKQ6nBPjXjPJmrwO
 U/rgJzsGIPhKo/J8z4nljpzeIFmnJcz/ZtotZ52PJ+lNVMORt8lZT1tNCME2CDmm7eet
 eTJ5ChOzdpEPewQ6napgS7MnCymiWPucsyAQX4d9NKkrMLLsTHztisbaOcxHUCo3dTwA
 oq9/BdQHtvK4r6ojw8pizEDHSTQ5WHfm2pfuVpciN9fvv0687M0DUFgEqIWS+p+qmz8Q
 BOqQ==
X-Gm-Message-State: AOAM532/HjlONRB/wfqlV7KLSWpy2hltBfr6nP/rvWstN6mMKaCoXf3f
 OoZqNDmCnzAxsPLPj608VDCYWbfvnXHS1+Z9Zlo3Ag==
X-Google-Smtp-Source: ABdhPJz1Akg6leOAzD4rkKpl4SGUm+AMhGdX93niDWgYb1yUT0yQdQZbKeu60FjyaAaofzU3zQf07zJ6P3gIOwA+rNE=
X-Received: by 2002:a17:90a:7e8f:: with SMTP id
 j15mr4233113pjl.19.1621506499815; 
 Thu, 20 May 2021 03:28:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210520064508.3121211-1-pihsun@chromium.org>
 <CA+Px+wXnMsLbEhpwEPpkDar+6RT+jT3YPnkFDKB1wFaLn12jRw@mail.gmail.com>
 <CAG3jFyt9j0B_VNvDtu_App_4+uZDHqLEYAjA-FYDoNQribZ+JQ@mail.gmail.com>
In-Reply-To: <CAG3jFyt9j0B_VNvDtu_App_4+uZDHqLEYAjA-FYDoNQribZ+JQ@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 20 May 2021 12:28:08 +0200
Message-ID: <CAG3jFyvyGrxcv8sLvjEhrQva0c3KHxU4g5LDnM=ZC8JvVL2Jjw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: anx7625: Synchronously run runtime suspend.
To: Tzung-Bi Shih <tzungbi@google.com>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 open list <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Pi-Hsun Shih <pihsun@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied to drm-misc-next

On Thu, 20 May 2021 at 12:25, Robert Foss <robert.foss@linaro.org> wrote:
>
> On Thu, 20 May 2021 at 12:12, Tzung-Bi Shih <tzungbi@google.com> wrote:
> >
> > On Thu, May 20, 2021 at 2:45 PM Pi-Hsun Shih <pihsun@chromium.org> wrote:
> > > Fixes: 60487584a79a ("drm/bridge: anx7625: refactor power control to use runtime PM framework")
> > > Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
> >
> > Tested-by: Tzung-Bi Shih <tzungbi@google.com>
>
> Reviewed-by: Robert Foss <robert.foss@linaro.org>
