Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D85A4C01DA
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 20:12:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7518910E178;
	Tue, 22 Feb 2022 19:12:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F7A510E157;
 Tue, 22 Feb 2022 19:12:49 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2d07ae0b1c4so185965167b3.11; 
 Tue, 22 Feb 2022 11:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MIuf7B6ggNpBhnBC4BV4Wx/yI126tWB3veseg963gIw=;
 b=oO4DLFIdF57cng91nz+ABsKhV3TEZMT4YH2lr4gu+QyKiHY/p9DVOaozbT73qgUo+w
 xQ27MwmBRWjReen46DDOboOnddmO9/G+2my87QZxKBkXv4l+/ZIkzCE+YibDvGS82tr0
 HZoBeNSLHqIdxa1Bqoclcc2rWWVKuuZ97ifQkHXI6/n3++k7W9wF8snW9tx1VykggiAd
 hu4BJF221YTv/PUYb8MOBSrE1s9NmmfgNSMv7MEWWG2IgolZVZtOzOZbfb9F9dGBcui2
 No4HnBw2U9LDz6tICVmKGe/4TXVP/KGT/hXXO865Xl+3ZFSgHikjXcCE37PmLXsefax7
 bpcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MIuf7B6ggNpBhnBC4BV4Wx/yI126tWB3veseg963gIw=;
 b=rP7T0ZJllAXez5K1CJG+NsWid6xuDxog9DWuupibq7CnYB43CXf+UQ2EdA3NJ2ym0c
 mQjEctxyLPS5HeZGee0fFm26gvrcGMc3hHYrL5tuhAZwJ/Oy8ynI1uJAUkOMOU3E0S+h
 ltWSChG9yikjbNPJn2oouA8d8YRJ2GH3it16WCfBYdSetwETbCNRm6R/RMJZeyKYx5sH
 8jbj5UzmCOW6eyctHfT9dmGZOmkWehw/fpz/KMNa0kpQ+8vgPkh0cItu+9w80PHHFvr5
 9sYPgphjel6qU7EjD/MVKdCEbla/uoS1zgKixu7rIY0QENG5T9cccKKvX9mDKyGgA1G8
 X6qA==
X-Gm-Message-State: AOAM530WIy10XyuwZzSjBotKHJ3nRC6WwrdWdihPAvsnk7M5AuoY+/j/
 N3gUlOeCnbadBwJou+ZDwmwm1wW39DCFDK2MNxE=
X-Google-Smtp-Source: ABdhPJwogRs4v3RoIbi9LLn5frjoRnppXVlb2XUr+i5bRqLbpZZJ4wuR98W0v903ktfUAXqLtpj99zYOXAJ1elSwzCI=
X-Received: by 2002:a81:184f:0:b0:2d0:e2b1:1995 with SMTP id
 76-20020a81184f000000b002d0e2b11995mr24474079ywy.364.1645557168674; Tue, 22
 Feb 2022 11:12:48 -0800 (PST)
MIME-Version: 1.0
References: <20220217153842.3252424-1-trix@redhat.com>
 <51018469-3bab-e56d-7407-b16170b5d74c@amd.com>
 <CADnq5_OGEURo76mzc4Sb2Jar465Xt4vkSMECDi5jCMH332zUAg@mail.gmail.com>
 <CAKwvOdnYTC7mku1=eVaDLGQFHdoN3u8Afoo582OAQ+ApJmfhQQ@mail.gmail.com>
 <CADnq5_PniW+-8G5AhOSwuovESpfeMxL4r6P30b3F1coa_NmMEQ@mail.gmail.com>
In-Reply-To: <CADnq5_PniW+-8G5AhOSwuovESpfeMxL4r6P30b3F1coa_NmMEQ@mail.gmail.com>
From: Kenny Ho <y2kenny@gmail.com>
Date: Tue, 22 Feb 2022 14:12:37 -0500
Message-ID: <CAOWid-cXYze56YmUACWP4emNeGHXMFf4q5aZfFGUwVXWNFAvSg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix amdgpu_ras_block_late_init error handler
To: Alex Deucher <alexdeucher@gmail.com>
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
Cc: "Joshi, Mukul" <mukul.joshi@amd.com>, llvm@lists.linux.dev,
 Dennis Li <Dennis.Li@amd.com>, Dave Airlie <airlied@linux.ie>,
 Tom Rix <trix@redhat.com>, Tao Zhou <tao.zhou1@amd.com>,
 Nick Desaulniers <ndesaulniers@google.com>, xinhui pan <Xinhui.Pan@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nirmoy Das <nirmoy.das@amd.com>, "Stanley.Yang" <Stanley.Yang@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, "Chai, Thomas" <YiPeng.Chai@amd.com>,
 John Clements <john.clements@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 17, 2022 at 2:06 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Thu, Feb 17, 2022 at 2:04 PM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> >
> > Alex,
> > Has AMD been able to set up clang builds, yet?
>
> No.  I think some individual teams do, but it's never been integrated
> into our larger CI systems as of yet as far as I know.

I have just added clang build to our CI last night so hopefully we
should be catching these now.

Kenny

>
> Alex
>
>
> >
> > --
> > Thanks,
> > ~Nick Desaulniers
