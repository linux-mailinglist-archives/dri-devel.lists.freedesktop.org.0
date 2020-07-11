Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CFE21C411
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jul 2020 13:49:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB3D56E1F9;
	Sat, 11 Jul 2020 11:49:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60B8C6E1F9
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jul 2020 11:49:07 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id e8so9364382ljb.0
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jul 2020 04:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XtfKot8ZssXyPkPO+I+4ExwhCSPuFUl0sOsDrmkzlC8=;
 b=YtE/Av3bVbWUb1Iwokjhs3fiSvRQhLlfVYgp/g+LQvy4d1OYBXcE63gXGMOzz574Ot
 PUMdmLBd6z6GvBfYr91kbor5HYfdQsENqFiK7APq0QwO8lSHcsrcnfA7BDE/2UqLY2CT
 3BfyOUSumHxubjzqcC9uuxxttUexSVN67Cc+VTcuelCjZKcRdUgdv3oaQxFx3joG/XyI
 9avcLEjRIpQ9AKIMaqp1cG8s0mnFkZvG3XBtJ29FsoJzpV3R8y1861DGlRrZRwiXcGtb
 cYEvRsBhVJHaZG2+v4Wh5Ur9pbx5Nzal8KCiODnZYinrki/jYJIp1HLWRC0LXlvysmI4
 tATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XtfKot8ZssXyPkPO+I+4ExwhCSPuFUl0sOsDrmkzlC8=;
 b=lMdj+QGcOckThg4KFshYrf6ogW5Vi0XmOTP0F+guWfoglVvtTS2VZq5uD9t3wXstv5
 fBBntOT7AA824K+7fBmzimKv2mBEwFQ6E/z8KBfgDkxbgVsFgttv6HlJuzj/VNRYoyQN
 RWe5jTBkLo4J+SRvfozmt4X2sa9z/9LWRgZsw/uFmrJoQlEYBKgxaMwzg7JUpgztTFd4
 65kCKlM3L/0KUUBocx1o0z2dmGdFLgquWhx/pDJz4fp6aIwncYzXLluzo/HHLsvVkOqP
 JPN/Nc1OduSHwOgCOyzU5zDYgLN90e9vCtUb0+xRtLYg5ZqnpbvtKkXavVCgwyfR0e2j
 IDkQ==
X-Gm-Message-State: AOAM5319SIhMGkgRj92qbqsolsyLDAWpl34/EZpcCqNRGcHBQthfGayo
 ZKRw2DxZExCetBOeYB3eJlWuQaXWNSERZOBWel1UCA==
X-Google-Smtp-Source: ABdhPJxxFmrJz7/vRwpDkqiIuwv2rWq4N6yDKkszqYRfmcjiTZlBxgzh+2T4uIrxNxpy8O4zOPyOVBKyMRyXLYBeKnw=
X-Received: by 2002:a2e:7a1a:: with SMTP id v26mr26485425ljc.104.1594468145646; 
 Sat, 11 Jul 2020 04:49:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200707203529.2098979-1-robdclark@gmail.com>
 <20200707203529.2098979-2-robdclark@gmail.com>
In-Reply-To: <20200707203529.2098979-2-robdclark@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 11 Jul 2020 13:48:54 +0200
Message-ID: <CACRpkdb0+V7AmvG0JXXETzayr4Q785OLhBWjU414tUJo1toJOQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm: sync generated headers
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, Jonathan Marek <jonathan@marek.ca>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>, Sharat Masetty <smasetty@codeaurora.org>,
 Harigovindan P <harigovi@codeaurora.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, zhengbin <zhengbin13@huawei.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 7, 2020 at 10:36 PM Rob Clark <robdclark@gmail.com> wrote:

> From: Rob Clark <robdclark@chromium.org>
>
> We haven't sync'd for a while.. pull in updates to get definitions for
> some fields in pkt7 payloads.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Out of curiosity : where are the syncs coming from? Mesa?

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
