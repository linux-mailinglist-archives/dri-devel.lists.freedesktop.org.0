Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB0D1E36AF
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 05:49:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA596E030;
	Wed, 27 May 2020 03:49:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D5DD6E030
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 03:49:49 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id c12so8286839qtq.11
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 20:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessm-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dVMhtUwlG7AgZ0Ijz3j9HLaOpimNX6eb8QQEpufvZ6g=;
 b=sExtPwMIpav1ROWvRyoQV2sve5tEvstu/cUoWiG8YF+qvuePbma/yLZ0k8svPQhpQg
 b4zE5SnUv8LyJ/sXjy2t8wvivL6wwko8GOq6BSMx0Zu4S8is/+8gROSd9+J/EJkreJaE
 0dIpEI8jMKZOz1gNuUUDxRlpZq68hkucY9YMRiTDP4grSJsIleVRRkDO6pksVFnEhXIZ
 xhWfDqzwFOAcFFLGQNzsV3Hz/l1mHI9pk5+ZEix3zzH/uUALeraXLtiAvAGFniq2CS2t
 3LLlbEGo2DFv51LzG3hD1/mwnfS8mr864C/U+LpL3U8s0jSDsyaB3q59lH4r68bDRqt3
 WMHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dVMhtUwlG7AgZ0Ijz3j9HLaOpimNX6eb8QQEpufvZ6g=;
 b=VSkaKM1pUIacWriSz1J6b+LJxoEhOGvv4FF88aDPQo836PfQwxgrGnxt4uVtIDnFe6
 Oh8nXg9OXHLn5oO5NGgRePCutmZN+iWk4HizYOAmQiMzprefbVoYSPAGAUxQ3C+mZ2C7
 CcNmDyPdIgwg2o6NyRlbHIkoVr1kpH9FPQLIJ6FVxV7ijBDJT0UkSTmAYbs/pdMfQvY+
 OXIA0J58eXdjzy4z268FvFtYup71lIB/mi8s+NhJ1gRhrLrr1h985h0IU3GzlMdSrRIj
 VkaqhwWbETNkVSSsmJJLd3K+FTW1ytRd2d6O3CuoYcLudSiO99Xlq8qo9Q89KxNiZf9T
 Mxxg==
X-Gm-Message-State: AOAM532bQaECDz0XCpUC73u/ezD+7azoI2Lz6MKHDad6MOK6yylZLVsM
 RtOSzY/9+tHZS+o/agCp99Q85ipafWx90Cs4cgTs9w==
X-Google-Smtp-Source: ABdhPJzw/Ea21QjAz+NNc+UEvVjKgzKsu7W2vzxBdItWR7V+TRRc1JIl7TX2+ezCAqEJ32OO1Ie36scyU+a6wB1ZZqk=
X-Received: by 2002:ac8:7383:: with SMTP id t3mr2301591qtp.221.1590551388107; 
 Tue, 26 May 2020 20:49:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
 <20200427072342.5499-1-jian-hong@endlessm.com>
 <20200428162152.ztsqp7nxqbwqrm6r@gilmour.lan>
 <CAPpJ_efvtVzb_hvoVOeaePh7UdE13wOiiGaDBH38cToB-yhkUg@mail.gmail.com>
 <20200507172158.cybtakpo6cxv6wcs@gilmour.lan>
 <CAPpJ_efxenmSXt2OXkhkQ1jDJ59tyWBDUvmpyOB-bfPMDENQZg@mail.gmail.com>
 <CAPpJ_ed9TMJjN8xS1_3saf5obQhULJSLNgQSAFxgiWM2QX9A7Q@mail.gmail.com>
 <20200526102018.kznh6aglpkqlp6en@gilmour.lan>
In-Reply-To: <20200526102018.kznh6aglpkqlp6en@gilmour.lan>
From: Daniel Drake <drake@endlessm.com>
Date: Wed, 27 May 2020 11:49:36 +0800
Message-ID: <CAD8Lp467DiYWLwH6T1Jeq-uyN4VEuef-gGWw0_bBTtmSPr00Ag@mail.gmail.com>
Subject: Re: [PATCH v2 00/91] drm/vc4: Support BCM2711 Display Pipelin
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: linux-arm-kernel@lists.infradead.org,
 devicetree <devicetree@vger.kernel.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Jian-Hong Pan <jian-hong@endlessm.com>,
 Linux Upstreaming Team <linux@endlessm.com>, linux-clk@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On Tue, May 26, 2020 at 6:20 PM Maxime Ripard <maxime@cerno.tech> wrote:
> I gave it a try with U-Boot with my latest work and couldn't reproduce it, so it
> seems that I fixed it along the way

Is your latest work available in a git branch anywhere that we could
test directly?

Thanks
Daniel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
