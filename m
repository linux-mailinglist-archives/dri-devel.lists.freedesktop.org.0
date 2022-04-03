Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC69A4F0CB1
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 00:02:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D8FE10E1BE;
	Sun,  3 Apr 2022 22:02:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD1D10E1BE
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Apr 2022 22:02:38 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id 125so9199759iov.10
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Apr 2022 15:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=XvddmfT4a2HVPWF6X0IpVZhaWCSVGlRBoq/hxtOitb0=;
 b=F5SaZzcYqcnWpCY5YIxxKaq+5lrNjM2WQTY/vwh4tputCF7qO/hma3N2+FikGfhqpW
 gfwHYuBWbq9ieJcJ/ptBul0b763dPprxL7nRjnhfKwT0cl4jUvbz9QExkP20+120f5qF
 50UjhgxGpwdxlvoW7oal9IwU4Jqu70uQLcjpo0VSQ4ZCI5+WFTWHcXiAjnzEY2I/Xthi
 XiAyRiigS/uTOWjRz2VR/MceAcXPP378YXlOMCPSGO43Sjj6g812K2OVdGzO4l9qxiog
 RC415f1p4oGGIiCZX+EFgfu5L6tU7wbSoZdB4n+3ef0lZo4bfDg6sb2PL1DZgbqAX0oR
 47zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=XvddmfT4a2HVPWF6X0IpVZhaWCSVGlRBoq/hxtOitb0=;
 b=BaQMnGlKMP710m+/nm+SceMWTf+9AgRTvQf6AJF+15HkZAdVq/kUv3oTk+cmANVam8
 dhOj91hrFg/GO7c5+twrXQMQVHCq/M4yNebV8lgX74F1VP2R5cMUhO8rqjkeTBMrkSsS
 1acaeSmNF53F3JKJys1Zxf1ZoaMjvVDamxBgbFfJ/gJEOGgxSTkRRPKvStCeHRkHqZyx
 jgwiJAS8CFEbHYWpBCA1cgmvgrxXvPtAOPAUQb7icM4DpJj2FioZsFKf8n2If5RC2bAG
 xr3192nOO07tiSG6kKg8DI/Ie/KqkSJzoXryMsTIMs+IjtYToAVhYz40a0wWLtwUYDE7
 qMHg==
X-Gm-Message-State: AOAM533S4NMdiJJfrXsE/SvdwHV+gXbu/FGBV4s5a8kDuZs3ZKrL8dn2
 qSgvEsO7piZYFeeusZWUkQu3/tPLr5EJJZBe0L9vK8UowUP24A==
X-Google-Smtp-Source: ABdhPJze+4g0HI1sDC3FNc/rLfhpSLWhV0IK/9GJPag8xP7zlK6F71T4edLm1HmR+uBF1lyfoXWVIMQgGa1Yt5uQD/0=
X-Received: by 2002:a05:6638:14d0:b0:323:c1de:b77a with SMTP id
 l16-20020a05663814d000b00323c1deb77amr5396583jak.303.1649023357750; Sun, 03
 Apr 2022 15:02:37 -0700 (PDT)
MIME-Version: 1.0
From: Chris Rankin <rankincj@gmail.com>
Date: Sun, 3 Apr 2022 23:02:26 +0100
Message-ID: <CAK2bqVJ3e1Xp3fEwg_QaJw0D1nWQZYHY+ShN++6y03_zrQ-Xsw@mail.gmail.com>
Subject: RE: [WARNING] [AMDGPU] Linux 5.16.18 warning about ttm_bo_release
 with R7 360
To: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
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

Ah yes, here it is:

https://lore.kernel.org/lkml/CAK2bqVJo8TZUwu4-5VcY0MEezM7gJJq77prMpCB=FdA24Fe7MA@mail.gmail.com/

It looks like this warning  started with the 5.14.x kernels.

Cheers,
Chris
