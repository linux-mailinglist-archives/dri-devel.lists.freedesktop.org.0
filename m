Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E81774C50B8
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 22:29:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC91310E95A;
	Fri, 25 Feb 2022 21:29:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2521410E95A
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 21:29:16 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id s14so9229795edw.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 13:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bJMSJztcyvLoxtow0XyAeaQGFm481N5pIXgrowsUISw=;
 b=r7r3KX4u6nAR5PqV1oT+anywV15IdXHYSF4ra2WHVLAa4gjMvV/1SBu/yioOqjhjQc
 d0z9lwuywAwSKjKM7DSXKmaXKA72ydqiAY6yu3Inlo/Fkuwfz1dOmcBnOWXZSm8p+4jE
 pfZyuHpLvJWLISF5/SVwIz/X7NHi6vrhoks5fEJagF8gApffaoqMRv7Y0pSKGOq9RrcX
 qrpR/1GzEsqEBlqE5wEi4pwwnJ+kJlaeEN25aKDEkNiHMTr3jqH6VaghtvXP67FV3kuZ
 dRN9vmZSUSpWrHpUNr5RzV/f5xBxTv17PQHeDv+r+S4aQCnYbq8e5wGr3x5059Ac+J5W
 vofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bJMSJztcyvLoxtow0XyAeaQGFm481N5pIXgrowsUISw=;
 b=B76AZJzqihzYf2bZNluFt9MrlMHrFpefAX5j2yEbpbcYCj7Qx7QqRsG1/FZE20MT1c
 UsvSTdhw4kWldZBD6BYBHtTkhAG14bXkXTCunOl8f70TrWoMklm6TuiP4EFyOO+NHFzR
 t/NHtKkp6kNhF+jbyWTCfR4bJaDajmS8VZNQEEa5M/tTKccaQPlpQsojpGccqUhvpdgW
 IGDuJLze8WjsItE/XCd+kfHtreeTtNY4KWu3fatlHZzbICqhaPt1ZG5CKDffgCKXoZy+
 jY/TmqmodonpfLcQ45rerPWandDed1l2DHxTtIHCL574zhkPMEBeImNEkhgOGTAa4UWS
 9pug==
X-Gm-Message-State: AOAM531yI5ERzRMC9OD979/vP5K2wOQM3j4kz47zh4myCkDaYVEPwXRC
 Gz1+UK/j8TgsLYNTDwUpyl+m+QAL7cC6MCWvFdY2eg==
X-Google-Smtp-Source: ABdhPJzTpdDC2RGPYvZlxFpRJzPf3pwM1WZoJ1jMgBJfcs54l75bjiD63Gf63/FS8RLZzsrJgN67D4j+QYrIG5d/L/A=
X-Received: by 2002:a50:fd97:0:b0:410:c0be:f4c1 with SMTP id
 o23-20020a50fd97000000b00410c0bef4c1mr8788096edt.313.1645824554408; Fri, 25
 Feb 2022 13:29:14 -0800 (PST)
MIME-Version: 1.0
References: <20220223105600.1132593-1-maxime@cerno.tech>
 <20220223105600.1132593-3-maxime@cerno.tech>
 <CAGS_qxqNU+rGFuALEpmqqmtD+LsTQ4R3_WWL3M70Ar-_af6OnA@mail.gmail.com>
 <20220225132258.55yh537iknxh72vw@houat>
In-Reply-To: <20220225132258.55yh537iknxh72vw@houat>
From: Daniel Latypov <dlatypov@google.com>
Date: Fri, 25 Feb 2022 13:29:03 -0800
Message-ID: <CAGS_qxpzWE8DYVVj-pzvMgJqA25cwNh7wsP8nnUkMcZVyUF2Yg@mail.gmail.com>
Subject: Re: [PATCH v6 02/12] clk: Introduce Kunit Tests for the framework
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Stephen Boyd <sboyd@kernel.org>, Mike Turquette <mturquette@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 Phil Elwell <phil@raspberrypi.com>, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 25, 2022 at 5:23 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi Daniel,
>
> On Wed, Feb 23, 2022 at 02:50:59PM -0800, Daniel Latypov wrote:
> > On Wed, Feb 23, 2022 at 2:56 AM Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > Let's test various parts of the rate-related clock API with the kunit
> > > testing framework.
> > >
> > > Cc: kunit-dev@googlegroups.com
> > > Suggested-by: Stephen Boyd <sboyd@kernel.org>
> > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >
> > Tested-by: Daniel Latypov <dlatypov@google.com>
> >
> > Looks good to me on the KUnit side.
> > Two small nits below.
> >
> > FYI, I computed the incremental coverage for this series, i.e.:
> > 1) applied the full series
> > 2) computed the absolute coverage
> >
> > $  ./tools/testing/kunit/kunit.py run  --kunitconfig=drivers/clk
> > --make_options=CC=/usr/bin/gcc-6 --kconfig_add=CONFIG_DEBUG_KERNEL=y
> > --kconfig_add=CONFIG_DEBUG_INFO=y --kconfig_add=CONFIG_GCOV=y
>
> I built a docker container based on ubuntu 18.04 to have gcc6 and
> python3.7, but this doesn't seem to be working, I'm not entirely sure why:
>
> [13:11:22] Configuring KUnit Kernel ...
> Regenerating .config ...
> Populating config with:
> $ make ARCH=um olddefconfig CC=/usr/bin/gcc-6 O=.kunit
> ERROR:root:Not all Kconfig options selected in kunitconfig were in the generated .config.
> This is probably due to unsatisfied dependencies.
> Missing: CONFIG_DEBUG_INFO=y, CONFIG_GCOV=y
> Note: many Kconfig options aren't available on UML. You can try running on a different architecture with something like "--arch=x86_64".

Did you perhaps drop CONFIG_DEBUG_KERNEL=y?
Need to add 3 config options in total for coverage.

If I tweak the command I ran above but drop CONFIG_DEBUG_KERNEL=y, I
get the error message you get:

$  ./tools/testing/kunit/kunit.py run  --kunitconfig=drivers/clk
--make_options=CC=/usr/bin/gcc-6  --kconfig_add=CONFIG_DEBUG_INFO=y
--kconfig_add=CONFIG_GCOV=y
...
Missing: CONFIG_DEBUG_INFO=y, CONFIG_GCOV=y
Note: many Kconfig options aren't available on UML. You can try
running on a different architecture with something like
"--arch=x86_64".

>
> Thanks,
> Maxime
