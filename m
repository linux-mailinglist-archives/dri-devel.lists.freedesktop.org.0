Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A76C835DA12
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 10:29:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B836E226;
	Tue, 13 Apr 2021 08:29:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E09C36E226
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 08:29:24 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id b17so11407668pgh.7
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 01:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xIRFgbgJI0avBUCCEiD/4GGK39mTH+z4x0E9i17yICc=;
 b=KsBqPwIzxEERTMv9YbFd5DK4k0IWdG0zYg0AIOD4ramDWOwjjpaHMRZ8r7zqtOFu1s
 BtpuA4jMX0CSOeND9H2+crkj/+ItRiqlX5zbhUDKXkdyq9ZFThfTsn0zP7EE1UceUrcD
 d4RhTQvq94uqOOjbomw03G5EfrdHMSiA71QlEkCQUEHtp7n1GMzobwUgldpFRkGQkQ5E
 8580Xc1hVk30MPPmo7/wKS7bDWKYsKKvB6q7ZyEaV2XuL4KQ4pFP48BGjYWq3z1Pu5gC
 Vy4cRb2zlrH7ll92cBfmvNT5t3Fmc52ha6/LQGxCwbKLWOqnWoGFcXbLXgW0JkF8bxLB
 VsCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xIRFgbgJI0avBUCCEiD/4GGK39mTH+z4x0E9i17yICc=;
 b=ZA0bcxoQO6jzo3I+MJNydjk16YdS/Yfqt2d+SN/IV8u7EMIn5Cfchw89kVYdPz0HKj
 0qmq98oTsKIQncQgy22yh4+8e09tKCGtTwr0Uf1t1GsPVuUhQs1hrgytts8dr3bA249+
 f7PdM1fhVzCnyDYyDWdsPhpv5OYv60X5U2jj5CpdT9xJv7lYZlsHk9DIgKOinrZOXt+I
 pT3hQrGH8h2R88EyK+x/kalXzAShA1wNnJO+JJR6WTTdQQ7og0DuLZur6IvMGptv8QHe
 6cgS2b2sHkLAsJDF82dFTB8C46WbRvXj19f3kdPkpOJrroQL7u961HOwThIubRep/xkU
 tSZQ==
X-Gm-Message-State: AOAM5311q3Ku2hBW2OhckKAriQzGT8RFkj4XUFm6yaArcHphpJYbAbTb
 ckeGdXplYQvMR5EUR/P+2zCa+Nxhzd2q18yNv/5kEw==
X-Google-Smtp-Source: ABdhPJxxTx2mlrpT069JMOM2uSKY6V/riYaDus0gsTM/kV5aEQplb2gd+Rt0HMWsBG207SNvmNAcit1GAlrzw56DCnM=
X-Received: by 2002:a65:5c42:: with SMTP id v2mr31548252pgr.339.1618302564473; 
 Tue, 13 Apr 2021 01:29:24 -0700 (PDT)
MIME-Version: 1.0
References: <1618078449-28495-1-git-send-email-pthombar@cadence.com>
In-Reply-To: <1618078449-28495-1-git-send-email-pthombar@cadence.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 13 Apr 2021 10:29:13 +0200
Message-ID: <CAG3jFyufvN8j9seSETnbrq9vkoZY7Xw_b7Lm7gUZhPd5LifH+Q@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] enable HDCP in Cadence MHDP bridge driver
To: Parshuram Thombare <pthombar@cadence.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, kishon@ti.com,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, sjakhade@cadence.com,
 nikhil.nd@ti.com, mparab@cadence.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Merged series.

https://cgit.freedesktop.org/drm/drm-misc/commit/?id=6a3608eae6d33a478a29348eb5e9ca330a528ae6

On Sat, 10 Apr 2021 at 20:14, Parshuram Thombare <pthombar@cadence.com> wrote:
>
> This patch series enables HDCP in Cadence MHDP DPI/DP bridge driver.
>
> Changes since v1:
> - Move sapb reg block right after apb reg block
> - Corresponding changes in binding and example
>
> Changes since v2:
> - Revert reg resource sequence in binding and
>   use resource mapping by name
> - Remove hdcp_config from binding and use
>   DRM HDCP Content Type property to select
>   HDCP version
>
> Changes since v3:
> - Fix kernel test robot warning
>
> Changes since v4:
> - Fix binding issue
>
> Changes since v5:
> - Maintain backward compatibility of driver on platforms
>   without SAPB port by allowing driver to continue without
>   HDCP feature instead of returning error
>
>
> Parshuram Thombare (2):
>   dt-bindings: drm/bridge: MHDP8546 bridge binding changes for HDCP
>   drm: bridge: cdns-mhdp8546: Enable HDCP
>
>  .../display/bridge/cdns,mhdp8546.yaml         |  15 +-
>  drivers/gpu/drm/bridge/cadence/Makefile       |   2 +-
>  .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 128 +++-
>  .../drm/bridge/cadence/cdns-mhdp8546-core.h   |  22 +
>  .../drm/bridge/cadence/cdns-mhdp8546-hdcp.c   | 570 ++++++++++++++++++
>  .../drm/bridge/cadence/cdns-mhdp8546-hdcp.h   |  92 +++
>  6 files changed, 812 insertions(+), 17 deletions(-)
>  create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
>  create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.h
>
> --
> 2.25.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
