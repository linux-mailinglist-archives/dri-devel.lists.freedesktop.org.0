Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AFB150252
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2020 09:11:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84A7A6EB4B;
	Mon,  3 Feb 2020 08:11:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D183C6E165
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2020 02:52:07 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id q81so13410690oig.0
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Feb 2020 18:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessm-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=m3kqulB4MngJzin9Ox3IxUFiL7JWpnNyf3px828cI9I=;
 b=WEhZuzpr0zqxBfAdiMmo162jSEqkoSPQCtQuglEDK3KGMmdwPzUm1EVEpFSQJV/TYK
 khAAcxJF12aBLZ15oVreQ3WGBX/w01hiOfzQnqib+qgPv1VBnD6obDkblfyFz6Xjil++
 6dBXh0hXcpgEklWwGR+UxDP281nE4bF0MEBf3cM5M0inRnsckAxKqNeGAm+R+Zr5DAhO
 PaK56MTU3m5lIhoO7PKFxnwG/rZaVVs5tSotC+o/W4nlPKsUvNvC7f0yY8iH/gjo5oaI
 OjBRxeki0bssuup7c+Xcn8CKZwv6GdmGpQjZy7wWFCCycVAhUamsyVPuyMaPZvR7d6/g
 EtSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=m3kqulB4MngJzin9Ox3IxUFiL7JWpnNyf3px828cI9I=;
 b=OyLXWTsWKEq+wxbp/0tKvkhtMx296L95XZkb+pxyV/1vlWVmgkhgKy5H0h1MnyNIer
 Wujg9Cdw5yk2aOsQV+/mc2kg2W2Dh7wrxScy5P58pf7rydxb6xKXIK35Etl8pe348iS4
 4B3wZkDnziMsu85dIqXHGnKFGgkp79opieY2dTMGoL96HkU++D/+qXV1J6NTmMdu18H3
 sSfM+XtERhiEr9pCC8t8r0kBDAkj/6ghOgeGr4nPS4jUnSKeG6+JD3T0pi6/sJCruNQQ
 Lp/GQWullATuqR73TJJm3CmpKrBf3hjvmgF4P3SsqfWqqKCmFW6C/dl5jYlACR1CEC5k
 y9ZQ==
X-Gm-Message-State: APjAAAVwa4DHFC3ixDU8V+0VQvr6IPzWhCt/hsJ+TVFVyVgi84w4cSqh
 D9OsB7r5USiQbAKCyFp8KcvG7U1Kkp/SZOoNxEG4XA==
X-Google-Smtp-Source: APXvYqzR4MJugY/OI14PtGDvJ0VO8gTgpvqDvh02A7Zez1TARi1UwJAAHQMpF36qjXeS4roAF5y840azkKd0Mk6+wHw=
X-Received: by 2002:aca:3017:: with SMTP id w23mr12757003oiw.152.1580698326953; 
 Sun, 02 Feb 2020 18:52:06 -0800 (PST)
MIME-Version: 1.0
From: Chris Chiu <chiu@endlessm.com>
Date: Mon, 3 Feb 2020 10:51:56 +0800
Message-ID: <CAB4CAwd6AanNEMyKDmkEPREbqUA_Q_iQ2oJ_UUw7rhFvk5eWfg@mail.gmail.com>
Subject: Fails to lauch X on laptop with Ryzen 7 4700U
To: Alexander.Deucher@amd.com, christian.koenig@amd.com, David1.Zhou@amd.com, 
 amd-gfx@lists.freedesktop.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Linux Upstreaming Team <linux@endlessm.com>
X-Mailman-Approved-At: Mon, 03 Feb 2020 08:10:41 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We are working with new laptops that have the Ryzen 7 4700U.

It fails to launch X so I can only access via the virtual terminal.
I tried with the latest mainline kernel and kernel from
https://cgit.freedesktop.org/~agd5f/linux but no luck. I also boot
the kernel with parameter amdgpu.exp_hw_support=1, but
the system freezes after loading amdgpu and I can't even switch
to the virtual terminal.

I post the bug description and related information on
https://gitlab.freedesktop.org/drm/amd/issues/1031.

Please kindly advise what I should do next.

Thanks
Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
