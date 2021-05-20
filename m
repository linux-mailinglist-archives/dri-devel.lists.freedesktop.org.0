Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F69E38A527
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 12:12:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20B7C6F3CE;
	Thu, 20 May 2021 10:12:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D836F3CE
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 10:12:13 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id h15so11970728ilr.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 03:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hM9iWHQw8llRbnnbpFxr+yRm64ZVy+q1ZE0MMw/cpmY=;
 b=GeBzHXR2RcwkBbBvN9dKO+0RWo4eNKFGpi1tU9lKPekIem6dxP3/52yhjMRD/Oidcq
 zZavPug6l5BXmxDgui4b789qBPszWqOV+6l8iREx5MoVPzOp3n3pgn22DX3qzUATsGxo
 rks/P1XAW7x1p4AOMBxvszjx4BJ0i6XAtg749OFi5mqONDqF0/WMz9g4cORdVB7bdsWc
 Bwy4bKNMD/LjExq50rxEk2b/AmZKRPd9rDDWMDlfwmLiMGF53PkorP5fpuVSiByhJHpI
 4VapdKMTTQBWMHbFB/R3WKbhgsR1XXvisGx7DPGBpY7Nhm4+nNxnnF2gSfF3zD0ZSmGl
 v9eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hM9iWHQw8llRbnnbpFxr+yRm64ZVy+q1ZE0MMw/cpmY=;
 b=j/F/pVdXzyPqrGjlqM03qecoQFR25lXrpiMH56O4rTkX54q3Hbc+cR34RRM5V8QZ/b
 4RHZOyZIMTx5WNSiM+CGz5BOOuWCBFv7PCkkRm/Z8ZlDcTO11cMgORthB6/1rBoAWyQn
 noQGNRu+eexy0P0yV7L5fzncJWjq6PHgkpYdKVsfqRitNGEhve5+qS0viSqd2WB6GEd2
 jZd+5+YYLV6zLIalEYEQqARVkIUKzBbr9xB4ApClSyCx4wp4Y7qO+9TGrCmpCcFv1Ucg
 YeNGTZsVgW5ygYlVNLnjAJ8Dj/HAxG65ZFVhTQjBukxqXaYar+l7bRrDNkBtY3817ZWg
 HwwQ==
X-Gm-Message-State: AOAM532TG0GpG55Xv+9wpPLt9yD84dUGX6H2yPv/UETIpNo4egQEgUDV
 KjqwL1nlXdZ9tabf53+MrzmDFfXCFzoh5p3QennVQg==
X-Google-Smtp-Source: ABdhPJz2wgYK5wtzmQSOAagwO9bVo75O8m6IquGkE4Ecf2XrkgakHVTo8l14fAfQGKSdQ65mecXLc9MikZT1ap2eQuc=
X-Received: by 2002:a05:6e02:92f:: with SMTP id
 o15mr4811751ilt.127.1621505533011; 
 Thu, 20 May 2021 03:12:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210520064508.3121211-1-pihsun@chromium.org>
In-Reply-To: <20210520064508.3121211-1-pihsun@chromium.org>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Thu, 20 May 2021 18:12:02 +0800
Message-ID: <CA+Px+wXnMsLbEhpwEPpkDar+6RT+jT3YPnkFDKB1wFaLn12jRw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: anx7625: Synchronously run runtime suspend.
To: Pi-Hsun Shih <pihsun@chromium.org>
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
 Robert Foss <robert.foss@linaro.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 open list <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Xin Ji <xji@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 20, 2021 at 2:45 PM Pi-Hsun Shih <pihsun@chromium.org> wrote:
> Fixes: 60487584a79a ("drm/bridge: anx7625: refactor power control to use runtime PM framework")
> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>

Tested-by: Tzung-Bi Shih <tzungbi@google.com>
