Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B54B5BD8C6
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 02:26:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C555A10E132;
	Tue, 20 Sep 2022 00:25:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD0B910E216
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 00:25:51 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id r18so2383692eja.11
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 17:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=SHdx658d5eJ351SjXpaHoy80sr1PT1pZTwcVFt7b0mg=;
 b=HwAixdnC9CUd2kg5QsHataIn9+QH16TpCdsKCvu0q/lLdxtFdLWarK6r1H0gR6nMiW
 Vh9SEE8QJmiF9y3f+efEC0ftqVFriICksaG48w2bYr2n8LQiLKpbrzpgZMgZsaRQeGnR
 2OBu/WTyX3ob2AgR1lxX4YHzAu6yVClizQeEUfOZWjR5JZR806GfLDZIntU/7apRjnA3
 /VCTcmkX3WTtObbp+9G9hFwHRtup8HsGoaWGpJWgaCb6wjGxRIzCE4FYB9/yX+1y3m9Z
 f0JRuvLYV6NzDJ5rlGAltQgNLzRfDbii1kRw73ZT66FDqJfo8SITlUBzEXmv6OLLde97
 xVYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=SHdx658d5eJ351SjXpaHoy80sr1PT1pZTwcVFt7b0mg=;
 b=SDHHmTE1cDxOgKLVWdeM4rTi/u2SnQYyG+BZbS7rLM1ddleHKSfuN0hLwj3nf6WzdQ
 9KRdKCfBmMMLWZsJ39r2cbY2kpzhlrY1PTF5TRmmE13M9xl1PcPL+WOIxmX0CdEIjrUU
 5m+/q8IuwsdEJLF6HhM6BG/ScZNG8A48hoGwDDPqzlOPl9qTS6p7WOHi/zfbsGg2X7+O
 h0L6DOxRgFfCn9pxaI+k1ULnsOlNzD+olympHaSsnIT8gC0fm1KgHKvCXOrkapm0BCNw
 BI1o9bKIUojPkzCy+PnH/bH6t+USBXmc5oxBRRQL523D/4wBVGFGTtTXGTfmh326fJW/
 wDYw==
X-Gm-Message-State: ACrzQf1aHxmdGqerIy1peYArah5r0AsxiRmercmQcI2qYWyv1BgT2uno
 6C3dkK7/1d7hx5HVYH6efWCT7EcSt3zj5EsbozaNuw==
X-Google-Smtp-Source: AMsMyM5LfXWMfPIHyTKPDxqr7169qvp6q0WVgzWsqn3e8lNhyGjlmWBdSWM1D3lwLZUbG04lMEXYvyir96YkW9H2QpE=
X-Received: by 2002:a17:907:94ca:b0:780:12fb:3c7c with SMTP id
 dn10-20020a17090794ca00b0078012fb3c7cmr14487810ejc.650.1663633550030; Mon, 19
 Sep 2022 17:25:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220829000920.38185-1-isabbasso@riseup.net>
 <20220829000920.38185-4-isabbasso@riseup.net>
 <CABVgOS=HO9XAf8C5X7ZD6aTW37r06ify==7AW9a8cpKsgLVfFw@mail.gmail.com>
 <D53B4EB1-1A95-48F1-BF49-8EC0CC7B5418@riseup.net>
In-Reply-To: <D53B4EB1-1A95-48F1-BF49-8EC0CC7B5418@riseup.net>
From: Daniel Latypov <dlatypov@google.com>
Date: Mon, 19 Sep 2022 17:25:38 -0700
Message-ID: <CAGS_qxpCPTSRNAyejL0gS0pZAoVNp9SdFwPFkHRyn5yMuPGkLw@mail.gmail.com>
Subject: Re: [PATCH i-g-t v2 3/4] lib/igt_kmod: add compatibility for KUnit
To: Isabella Basso <isabbasso@riseup.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Melissa Wen <mwen@igalia.com>, linux-kselftest@vger.kernel.org,
 KUnit Development <kunit-dev@googlegroups.com>,
 Magali Lemes <magalilemes00@gmail.com>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <maira.canal@usp.br>, n@nfraprado.net,
 Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
 kernel list <linux-kernel@vger.kernel.org>, leandro.ribeiro@collabora.com,
 igt-dev@lists.freedesktop.org, ML dri-devel <dri-devel@lists.freedesktop.org>,
 David Gow <davidgow@google.com>, Tales Aparecida <tales.aparecida@gmail.com>,
 Shuah Khan <skhan@linuxfoundation.org>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@riseup.net>,
 Brendan Higgins <brendanhiggins@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 19, 2022 at 1:43 PM Isabella Basso <isabbasso@riseup.net> wrote=
:
> >> +        * "(K)TAP version XX" should be the first line on all (sub)te=
sts as per
> >> +        * https://www.kernel.org/doc/html/latest/dev-tools/ktap.html#=
version-lines
> >> +        * but actually isn't, as it currently depends on whoever writ=
es the
> >> +        * test to print this info
> >
> > FYI: we're really trying to fix cases of "missing version lines",
> > largely by making the kunit_test_suites() macro work in more
> > circumstances.
> >
> > So while it may be worth still handling the case where this is
> > missing, I don't think there are any tests in the latest versions of
> > the kernel which should have this missing.
>
> I=E2=80=99m not sure if I totally get how these work. Every time I run a =
KUnit test I
> get something like this: https://pastebin.com/7Ff31PMC
>
> As you can see it has been loaded as a module, just like we intend to do =
it
> from IGT, and I see no version lines whatsoever. Am I doing something wro=
ng?

You're doing everything right.

The problem is we only print the version line for the *built-in* tests.
It never gets printed for tests in loadable modules.

Some more details below, if interested.
Specifically, it happens in
https://elixir.bootlin.com/linux/latest/C/ident/kunit_print_tap_header

What David is referring to is we had tests that weren't in modules,
but didn't use the normal built-in code path. Those were also missing
TAP version lines.
But KUnit needs to do better here in the case of modules.

The goal was that you'd be able to parse the result of module based
tests by something like
$ cat /sys/kernel/debug/kunit/*/results | ./tools/testing/kunit/kunit.py pa=
rse
but this doesn't work because of the lack of a version line.

If we add it to each module's test results, then we'll need to update
the parse to allow multiple verison lines, I think.

Daniel
