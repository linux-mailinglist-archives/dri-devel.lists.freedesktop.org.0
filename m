Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 614ED5896EE
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 06:25:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED8898ABE1;
	Thu,  4 Aug 2022 04:24:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com
 [IPv6:2607:f8b0:4864:20::a2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7530E11ABCA
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 04:24:39 +0000 (UTC)
Received: by mail-vk1-xa2d.google.com with SMTP id q14so8175668vke.9
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Aug 2022 21:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=lcJgZtls2CTirMKeOXiFocO+aRaEekUb/H2SoND/Yd4=;
 b=i1KHvKFaa8ngFoTixU4mlnYzNxdw+de1oW9vryq05o4rZpYSCSEi8CAON7NjnUFdSD
 KRFG/cfqhaWA4aQFC7YNTABDVetWeAeoFDTLQuPjiabvUA1A2R4bA4uL+Ap4Plg8jWIT
 91UzBBctxMZqhlQNJo3Rykm//O8Yuh8EqudlMsEhtT52rtO+pzBYpEVm6ZUaNW3itEJX
 MlOzx1sRyXlyVWHepBmzCWOT+t79Nc05LUEAndQKVVbKb8rzM3r8xiGJAXpgPS0dVR0V
 i5iEuPDt34A6/6lc0HMmxgo1XyUnMKB6xJX9uiU/LWQHKL34HO3gXB04rjkbSYUr4iF7
 ZZMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=lcJgZtls2CTirMKeOXiFocO+aRaEekUb/H2SoND/Yd4=;
 b=GhTKB5FbDNapXRzF77Epsj764utgum4KxODAyMBJNDlvjHsDHPWnJVMfAMcSpS5vo8
 or7SrsmWMF2PWXHJYNTyB4stuNcvvpbHO2BtHa3KxoB2ikibH9t63QuBmFD/XvJwlw5F
 JZpumhmOWpkSUqP0LHn8QCJ55EDtHwVzQkwilA7h3V6HiTrDbN+feNRJGu63nPo2bnXq
 OSlGPBq1aU835t+lDbRqyGyu8Tkq9F8xoZQxCN+IC/nchcIXSgh5zi6kKkXovvJuc1fO
 cglg4MtYVTDVikA1S3mgBsAQ0DqonM43DaVONAQXWgYG88Wb6hxZFWEMyxLMBzprvwdI
 xnpQ==
X-Gm-Message-State: AJIora/x0yMuH3+Y3BSPae9tbt8CHU0zkPML4C6fJVWotrBk3yJoK/cQ
 bZtHp26ps244Idi3G48QQCFFm+ri4gDWHl9Vb00=
X-Google-Smtp-Source: AGRyM1t1e2zapiNYQ/JIIzS87OOq3/E7MJAYPwL5oMiuvgU1Y8LCnID6eVs2gdFIlnUBC7JIzD1iP5yUMLkyoiOtoZo=
X-Received: by 2002:a1f:2bc8:0:b0:375:21ea:25ca with SMTP id
 r191-20020a1f2bc8000000b0037521ea25camr11174701vkr.37.1659587078212; Wed, 03
 Aug 2022 21:24:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9twFEv8AcRQG-WXg5owy_Xhxy3DqnvVCFHgtd4TYCcKWEQ@mail.gmail.com>
 <CAHk-=whXSt2N0GcoPC6XxXXLMpXm-34ua+X4AhPsLoqBcF6Xqg@mail.gmail.com>
 <CAHk-=wj8UHvjsVPohpRA1RJo1upyKoSnjcsys+=vbRVbpPvBMg@mail.gmail.com>
 <CAPM=9txsYE1zFDW+ehHQv138DoeT1Fw6hfzfPa4czvXGSjefjw@mail.gmail.com>
 <CAHk-=wj+yzauNXiEwHfCrkbdLSQkizdR1Q3YJLAqPo6AVq2_4Q@mail.gmail.com>
 <CAPM=9txkjJg5uArn1ann7Hf+JFCukQFGwqv+YHAx97Cdxezs_Q@mail.gmail.com>
 <CAHk-=whWcektQzPJgSPa2DC3wMPxgLh8fJVQWeo8i99XMXPjfg@mail.gmail.com>
In-Reply-To: <CAHk-=whWcektQzPJgSPa2DC3wMPxgLh8fJVQWeo8i99XMXPjfg@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 4 Aug 2022 14:24:26 +1000
Message-ID: <CAPM=9twUvRoVcWHhBH7yuDDVj8K8aM0APQ8Yx3cx19keLJP8Gg@mail.gmail.com>
Subject: Re: [git pull] drm for 5.20/6.0
To: Linus Torvalds <torvalds@linux-foundation.org>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 4 Aug 2022 at 14:02, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, Aug 3, 2022 at 8:53 PM Dave Airlie <airlied@gmail.com> wrote:
> >
> > > It works on my intel laptop, so it's amdgpu somewhere.
> >
> > I'll spin my ryzen up to see if I can reproduce, and test against the
> > drm-next pre-merge tree as well.
>
> So it's not my merge - I've had a bad result in the middle of the DRM
> history too.
>
> On a positive note, my arm64 machine works fine, but that's just using
> fbdev so ...
>
> But another datapoint to say that it's amdgpu-specific. Not that that
> was really in doubt.

I've reproduced it, I'll send you a revert pile when I confirm it is
the buddy allocator.

Dave.
