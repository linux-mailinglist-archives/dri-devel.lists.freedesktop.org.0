Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9904E7B09
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 23:45:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE4010E14A;
	Fri, 25 Mar 2022 22:45:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE33410E14A
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 22:44:59 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id bg10so18026982ejb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 15:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k1sB3W5P7kfkX5Y6+wgKyaJsMVtca1i3NA1yidjhIyc=;
 b=M1AW+EKiR5QUfG4lC4tW1M1+VJglcIMEanycGJO9gfy0rY9dP40g8xffWcS5hQVs6l
 VuxoQP2Tuo9gnXfE7ApCTK0mHJzyEtRUInECdx1JfTUkj6Zjht2kI8RZ0lx8CI3g3DWa
 6W5r+5ZYDJEGeMtGz0xH5dnh7YquKnCLnKiARcqPEo2cBJ3m7mTg3gEL572VPbBGqTJJ
 2WmCk0qQ1VmMzdRWiWU0sKgvDhLM7guvuAQY87ziH4hAIiH9FaRun/k3FhzqbSu9FLQK
 px4Cf6jIWFaSuH0WnmNT9tECkjAcDGE7enjH1yzezxEo/07EE5fAx+JAsPyl7gj2hiZo
 uF8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k1sB3W5P7kfkX5Y6+wgKyaJsMVtca1i3NA1yidjhIyc=;
 b=ZLB/18TaS5+5zf4siCTCT3fUfpMBw495HCPTlzBrh4qqozLnIQyixoI72YmMbCZEnS
 KL46RQQbX6xAJRHZjzYoux4fDDHCcQlg8ZvswzZjpd0EQntF5gZVzfo7HsBprruU3xin
 tVt6Lm6Rh703RugUr8DcdAS/1nf4whRz7ig3vxt7uJqHd/PwCKC52AFXCL8HKDBHHxNA
 Rn4H1jd8K6iss64WYAZMZd/EbeLoMEBWSy5SjaCkQrrL8xWgjjbe1Zl2BjKZFduAkpqt
 VWDWQ3lr9gFRKtL5aRmxoYDfji6Rs37Bu/lM2MZfTDcyziDnrpwt/rXY4qXJCePTJuE7
 KDtA==
X-Gm-Message-State: AOAM532y6HXyaBUXRzc2O24v6IaRRduBYvzVieT2WKXJd7NR7EkH9cY9
 CmvGnJqLpPa+eooIzSF7x6tPtNic8TzZFo7NV9BFkg==
X-Google-Smtp-Source: ABdhPJxZOx7msGiBvM6UU3aV8NTwAHeYNWpylGCBVzOUf0ySSC/sM7uMMlfg/Ism4TemTQElCbwVMHiokV01PksPyUY=
X-Received: by 2002:a17:906:6a27:b0:6e0:3017:d3c2 with SMTP id
 qw39-20020a1709066a2700b006e03017d3c2mr14512163ejc.358.1648248298071; Fri, 25
 Mar 2022 15:44:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220223105600.1132593-1-maxime@cerno.tech>
 <20220223105600.1132593-3-maxime@cerno.tech>
 <CAGS_qxqNU+rGFuALEpmqqmtD+LsTQ4R3_WWL3M70Ar-_af6OnA@mail.gmail.com>
 <20220224225422.98298C340E9@smtp.kernel.org>
 <CAGS_qxrDs5RYa4nxNR2ghsyBhgVyMHApi+GJKzGxF7FvNHe9dQ@mail.gmail.com>
 <20220325211949.77643C004DD@smtp.kernel.org>
In-Reply-To: <20220325211949.77643C004DD@smtp.kernel.org>
From: Daniel Latypov <dlatypov@google.com>
Date: Fri, 25 Mar 2022 17:44:46 -0500
Message-ID: <CAGS_qxrtAMcTfkFDJFZryz5fvJ2o=FbXOg+cjL-SQFX+-ETZeA@mail.gmail.com>
Subject: Re: [PATCH v6 02/12] clk: Introduce Kunit Tests for the framework
To: Stephen Boyd <sboyd@kernel.org>
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
 Mike Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
 Phil Elwell <phil@raspberrypi.com>, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 25, 2022 at 4:19 PM Stephen Boyd <sboyd@kernel.org> wrote:
>

<snip>

> > >
> > > This is cool. Thanks! Is it possible to add some 'coverage' command to
> > > kunit so we don't have to recall this invocation?
> >
> > This is documented at
> > https://www.kernel.org/doc/html/latest/dev-tools/kunit/running_tips.html#generating-code-coverage-reports-under-uml
> > It also includes pointers on how to use lcov to process the .gcda files.
> > I wrote it before --kconfig_add existed, so it just looks a bit different.
> >
> > The main blockers to directly supporting this in kunit.py are
> > 1.) this only works on UML
> > 2.) it needs gcc-6 or lower (and the kernel's min version is 5.1, iirc)...
> > 3.) in kernels older than 5.14, this requires some more hacks to get
> > working. So for the large portion of us stuck dealing with somewhat
> > older kernels, we'd have to do stuff manually anyway.
> >
> > For #1, we'd need different kconfig options and kunit.py's QEMU would
> > need some sort of userspace (busybox should be sufficient).
> > For #2, I don't recall what the precise issues were anymore. But I
> > think there were some more issues in gcc 8 or 9... :(
> >
> > >
> > > >
> > > > 3) intersected that with the total diff
> > >
> > > This would also be cool to do automatically with a revision range.
> >
> > Hmm, can you elaborate?
> > I assume you mean other revision ranges beyond this patch set?
>
> I mean somehow to tell kunit.py that I want incremental coverage
> information for a git revision range so that I can say something like
>
>         kunit.py incremental HEAD~3..HEAD
>
> and have it tell me the line coverage.

Yes, this is doable.

The steps I did were
1. generate coverage.info file per steps above
2. git diff HEAD~ > /tmp/inc.diff
3. <my personal script> --info=coverage.info --diff=/tmp/inc.diff

We'd just change step #2 to be `git diff HEAD~3..HEAD > /tmp/inc.diff`

As mentioned upthread, unfortunately my personal script in step #3
isn't open source or open sourceable atm.
I wrote it using some internal company code for parsing LCOV .info
files out of expediency, but there's nothing too complicated about it.
Just need to find what lines were "added" and intersect that w/ the
coverage data.
