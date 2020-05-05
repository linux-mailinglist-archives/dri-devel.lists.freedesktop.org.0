Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CCB1C5044
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 10:28:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11A706E529;
	Tue,  5 May 2020 08:28:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 006556E142
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 08:28:05 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id b2so703864ljp.4
 for <dri-devel@lists.freedesktop.org>; Tue, 05 May 2020 01:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bgM1z0W3jC692xWkgi3/Y+e2n/nzkwaSzFa78vdYF0E=;
 b=DIWu5shlATY4PZunGAKyb/Z+n2zkJihLqazePZ4n/k6j5RCVLrLJOPjtisCmJ8+trj
 /jCI1TplrSRfpZ5kH53qorDrheIpgsvZmn6FcroYQoDm5fn+1FLbBBDr72W4k8wY3OVB
 oP681xMKnTOAASBA2YOqIwqrGCoLIboWhJoH6lGdTMUzvdFTmx0PSELZsW/M50f3dgAy
 Dvxb+NmVgrs1GIGHpvW12W0Rsfa3soOn9dYUbzFobQPhbBJKn3mRg7aivW4Pww+9Jtxh
 0hsIpSJz1JdCxorD1s+WITyExRl8HmHDaaFS3WDusH4MYrxLQ+cH9kSN4LWThyf4wjd2
 GJvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bgM1z0W3jC692xWkgi3/Y+e2n/nzkwaSzFa78vdYF0E=;
 b=muQ0G4QSE77e9REUcLRcdhTal+pdgwtq2YwaaD+IcRlsV0Dzx3USgKDih3Vnpkg2k1
 m+zbhMSEJEidBcVGAJOy/Li/NfyeW3Wa40US6xIPIg3M8kOWAdkkU2KHZ3sBsWhzoHfU
 8a6bDFls3VdcFDka+DD2fIGkIXP8z5yzzbWlzX9zMqqrwHipUyBdyw5zpz/JNZOxnddv
 hfR6ASi8FpDF7whs85q7/qn3UX1feBi2jjffYjkqHlqSNtv1SUc3zXzwmCb1GfSaCWEM
 TP8D4Ou5jpIiKwU9MTcUXAbyjdBD6lil5doIjVKltPsKwZV3Tp1a0p8Z7uEBPuMRTkZj
 lBNA==
X-Gm-Message-State: AGi0PuY5vdp/LS5Ivoe9Y3pfqez8OLym8j+eQW4pHB+o3U4mesz2iVKs
 AoAFObIKkX4KlAsVxNZAf/QUzYA78Xp/5LnJht3hsQ==
X-Google-Smtp-Source: APiQypIIQGGErF0RDv5sRtJ2GxzvtG0I7XM5imQkPX+aeO8aBHMbbijsr0Vbdq7RLakWK+shJtSNW2tUidRKojT/TqI=
X-Received: by 2002:a2e:8087:: with SMTP id i7mr993585ljg.99.1588667284186;
 Tue, 05 May 2020 01:28:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200408191458.1260397-1-arnd@arndb.de>
In-Reply-To: <20200408191458.1260397-1-arnd@arndb.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 5 May 2020 10:27:52 +0200
Message-ID: <CACRpkdYQJocN_-i07J0fFC16pDUfb9o0mzRF0YRO8UMrE=Suxw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: fix link error without CONFIG_DEBUG_FS
To: Arnd Bergmann <arnd@arndb.de>
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
 freedreno <freedreno@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, MSM <linux-arm-msm@vger.kernel.org>,
 "Kristian H. Kristensen" <hoegsberg@gmail.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 8, 2020 at 9:15 PM Arnd Bergmann <arnd@arndb.de> wrote:

> I ran into a randconfig link error with debugfs disabled:
>
> arm-linux-gnueabi-ld:
> drivers/gpu/drm/msm/msm_gpu.o: in function `should_dump': msm_gpu.c:(.text+0x1cc): undefined reference to `rd_full'
>
> Change the helper to only look at this variable if debugfs is present.
>
> Fixes: e515af8d4a6f ("drm/msm: devcoredump should dump MSM_SUBMIT_BO_DUMP buffers")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

This fixes a compilation error for me on the APQ8060.
Tested-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
