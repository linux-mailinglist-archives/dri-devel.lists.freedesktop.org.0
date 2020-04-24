Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB37D1B6CAF
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 06:30:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 495776E42C;
	Fri, 24 Apr 2020 04:30:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E35DA6E430
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 04:30:04 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id n4so6476128ejs.11
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 21:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e/H74K9N2PKSeZfWU1nS1ZZfEYq52PzInjDdDIoTUeY=;
 b=KHD202xKRIJUGpWC5e5FWnwsi5K/U47xdnQ9YiRe29d/TpUugTwMx6FZ5ODFmnqmDV
 WAq1XWEYa+RrB7qaBN42zJqtMdJ4lzvkSakTopZzSC6sSKpAZ5TBHnN/AQenIcXFZQKf
 VhH7GGynTUJ4EdIIBugSiRXAqGacGkp1BJZ7vtVAN5cAFKBXwtgTYTc4CqqoS0KlI2T/
 Uk0GvUCTQG/b18t4uTUeG43RGWz2vBB3ZjqAFEgN2JEuuMoxGFyEAK80TtFovqo4w220
 nJH1FdXmVzp0NUAGQUsJQbyr6e+VaTVnRmDWgUbSnweeNPyuCtbADx5I78XRLn0jjCLO
 aXLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e/H74K9N2PKSeZfWU1nS1ZZfEYq52PzInjDdDIoTUeY=;
 b=c6RERwwcEWPERB4NGsi9ccoa1z9FXYifoblN7isW6h7AYixKdrPSLzr3wzeOPr4G0K
 UkY7RxCxQ2+qbAghRZpwhNjSE/8sgPJXV/tAEsiq05q4+IEAkMHxwKCdl4qU825Xb4MG
 XOAUIXWKuSWXaFhqUrzSQ9C/hnRTjMEUj1yx2bn/3wr5NvrBj69AJIyszC5NA7S2cqnJ
 7ynUonLje7y15zuxYjbIADeXjyFMSxAIuWxV8gd5Ssqy5EReXHipzKQ77iwwrtZAgc66
 kBCCYlcZ4+1u/ZNA3Y6GFVMzcJRRsQGrKnHWbOaC15NXVTvVklL8GRuW7Is/bwFNSkxc
 CxVg==
X-Gm-Message-State: AGi0PuZqFu/VLS0fUwNvN3XI9o6cUTSQ3QuzqhoIRBRhs28IyHp+nQLJ
 T7YV/P9YdjGq9c7BJuJUky7FV3G4uJCuCQEaTlj3Gjmu
X-Google-Smtp-Source: APiQypJCn/Q5rOwR2GHX/FobuRVaZrlJzB1Vrd0DoeiUXMRAu+YKRmePqbCsNa/J+ghiQzFQHWC+SZtrZ0sgNtl2R2M=
X-Received: by 2002:a17:906:b7da:: with SMTP id
 fy26mr5695837ejb.327.1587702603441; 
 Thu, 23 Apr 2020 21:30:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200423223459.200858-1-pcc@google.com>
In-Reply-To: <20200423223459.200858-1-pcc@google.com>
From: Eric Anholt <eric@anholt.net>
Date: Thu, 23 Apr 2020 21:29:52 -0700
Message-ID: <CADaigPUXqcWcZmvWyZM_FSw5cdTuYeyUwpcjmCawYwTXgYONtQ@mail.gmail.com>
Subject: Re: [PATCH] drm: pl111: enable render node
To: Peter Collingbourne <pcc@google.com>
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 23, 2020 at 3:35 PM Peter Collingbourne <pcc@google.com> wrote:
>
> The render node is required by Android which does not support the legacy
> drmAuth authentication process.

There's no rendering engine on pl111, so only the control node makes
sense for this HW since all this driver does is display.  Can you
clarify what you're trying to do with pl111?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
