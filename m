Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D29D638A65F
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 12:25:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32FEB6F3C0;
	Thu, 20 May 2021 10:25:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD2856F3C0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 10:25:23 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id v13so8750987ple.9
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 03:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vzcCMdn7AWAOzOW85sX9PhoEpIf+O0kjM4jka7jzb/E=;
 b=Pbf9x3xzIaUirTOlH3BIWfV/MkY24clUI1riLlGFGq8JMA6stksgxshyVGUYnKcxtI
 dGxP+GfGQ3gRNiAxwpm39uTt/X+1gL4CS3DwKlR+Yn94H/KrBeZcC+Qiie9fCh4ZZ0er
 0YzofFRyhkn44h1FWmUhyXcPUlHJqq1FPnnLWnPHN1YrfsmT/9FqU0BlD56jlijIiGjV
 ZHFpSxG5EOqGAl1urkrJIWO1fvqh4YsVSFR4h9SesXpsSFcPoRQVBf7HgQ620chOHF35
 L2ICKkol5SqrxnQuMdBq38/elfZw7ojRNh3oFWOSkDmZU6Ro7IhI1O8QBvL8bsux1W4n
 tgmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vzcCMdn7AWAOzOW85sX9PhoEpIf+O0kjM4jka7jzb/E=;
 b=H5GnqkFnK9qxpJc71Fd18MGyBeaeb3Q42fmf7xv3RoAg09ZjrdQ4DoUm5blU2ySWf4
 gF2p3nZAVpVp3j48SXi5cktq3uW/9+8WQ8Nn3n87f7CNvI8fXsu/b1B7dSnCAyYTA4dv
 EIqshWsXjTTOrMFLGf9deyQcIq5NP3cWt25AUq3FB0WAT4q6ubjyd+pSA/BF6KCnjmd0
 xknYovM5XWFxyZ+Fu+gJkf1a4I8AGkT+q6nSNdfeasvw2M1Gkv4ZewnhYDmCDCZTotIq
 zLnH4Gn+bX3hXrzg36D0dDGTuX6odzvATkO3uvikKUaj3emmwvNnyaJwZ1RqqNSs8Qm5
 zbbw==
X-Gm-Message-State: AOAM531jCOS1NcaCeR/V5DwIWqWJRsoYF9MAOSp6mDytwVRx55rqV9DX
 gaKlqZYOhSJQhdnjr/7saZ4+nnLFBsO/gVRYpTr4tQ==
X-Google-Smtp-Source: ABdhPJxUDB2Glgp87vkEVGP5IiXVx/gimyk58B60TNfXb6X0gR2NtYKOYoFyuSL52I22cyOY7hCHAL23y/lTqcdoWEE=
X-Received: by 2002:a17:90a:7e8f:: with SMTP id
 j15mr4221550pjl.19.1621506323290; 
 Thu, 20 May 2021 03:25:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210520064508.3121211-1-pihsun@chromium.org>
 <CA+Px+wXnMsLbEhpwEPpkDar+6RT+jT3YPnkFDKB1wFaLn12jRw@mail.gmail.com>
In-Reply-To: <CA+Px+wXnMsLbEhpwEPpkDar+6RT+jT3YPnkFDKB1wFaLn12jRw@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 20 May 2021 12:25:12 +0200
Message-ID: <CAG3jFyt9j0B_VNvDtu_App_4+uZDHqLEYAjA-FYDoNQribZ+JQ@mail.gmail.com>
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

On Thu, 20 May 2021 at 12:12, Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> On Thu, May 20, 2021 at 2:45 PM Pi-Hsun Shih <pihsun@chromium.org> wrote:
> > Fixes: 60487584a79a ("drm/bridge: anx7625: refactor power control to use runtime PM framework")
> > Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
>
> Tested-by: Tzung-Bi Shih <tzungbi@google.com>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
