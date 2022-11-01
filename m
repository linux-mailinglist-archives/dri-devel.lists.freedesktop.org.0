Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A84614C31
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 15:05:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67D6510E3CB;
	Tue,  1 Nov 2022 14:05:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC9910E3D4
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Nov 2022 14:04:57 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id d26so37212390eje.10
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Nov 2022 07:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dbwy8ITCoA5pOVbLQJbEcT2GDetN5uvf+3GbTAUDrCE=;
 b=miyy9c9glmyzfufEN5otSKVrH8Sh29yFZ1xv03E4kPsejTjmnT272cRWCp5OvjvP4x
 MphFAonTt/sh2ROc7RuhjUQRf+ujJcwu0Pl9aUGMLh8HqQWh8CVBUd/eNRFGvpTppP6F
 yCGeN+9xLm/BJ/yaOc7eAIpzWCLrMTgvgu1AHRYZXyZkc0RHbI4a2IVVsngKmgUF70Wa
 lHP4JpVBq3+VSpKO7sTGyWDwruOcC03qrcdq19rHA2booqkm1A7FqFkW4b/gIGb9MxXC
 18Oq0CpjitQmwHPVq1WJ35uwTaExIjMooXlfHdHjBZopoWXVM7V7fGG4e0V7Wl0dXLRb
 6DCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dbwy8ITCoA5pOVbLQJbEcT2GDetN5uvf+3GbTAUDrCE=;
 b=3xmpHcm8N6KekfF2igC2X5h8MeBDyFDiVs8cv5s4qVC/pOO4U2ffJjVcOnae4sEs6B
 9gHWh4opbgzb4odeZYiVEyJ/HJW4CBtF8dZgJMq3q71eF+xwFPgf0oI3aSgcDISroTL/
 28nHgwCs6ssI+rEcSZ/2fJOIss1TrmtRu7Tdo01D8ZRg/jwKnhxl/9efY4HvyP+Ur67t
 Au+EnEIuV3n4qqImfYxrMLujNEjImM6DU0zAF8HFSeRbkJ+RX75Ff6J5YaSJ2uW6Oj+n
 hQ/FG2H2ygQIhW2VqWgIcqJ6ITxkCIQqoO0ekInp1dxlb3yhx6ExcT1BqP8n3JLVzZZ9
 ISrQ==
X-Gm-Message-State: ACrzQf0POlf91dyVD4w9/MxuWf7eX3gCt/Fkw/8My45mpz0sbgfVutIb
 oXskkJnRri0UkWYmjhsID9IBCybuYwcXqBLe3HTTaw==
X-Google-Smtp-Source: AMsMyM7RW6jeJsoZd4AqGMeCd5kgJTnDjjqPbSsmg4NAhClfu6VJBlQwlILNHLvLzV1lKjtc1/O0DJXswzJDkG1MZ8k=
X-Received: by 2002:a17:907:74a:b0:77e:9455:b4e1 with SMTP id
 xc10-20020a170907074a00b0077e9455b4e1mr18364523ejb.462.1667311495135; Tue, 01
 Nov 2022 07:04:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220829000920.38185-1-isabbasso@riseup.net>
 <20220829000920.38185-5-isabbasso@riseup.net>
 <Yyl3UXvLd3Jyr9uP@platvala-desk.ger.corp.intel.com>
 <20221101135425.3ee12c9c@maurocar-mobl2>
 <Y2EcEnAzkt1Qn341@platvala-desk.ger.corp.intel.com>
 <20221101145333.5960e6e7@maurocar-mobl2>
In-Reply-To: <20221101145333.5960e6e7@maurocar-mobl2>
From: Daniel Latypov <dlatypov@google.com>
Date: Tue, 1 Nov 2022 07:04:43 -0700
Message-ID: <CAGS_qxr+xzr1Ea6Y+xr+hBrGqx6rFSh_Q3xHi=ND1aPoQd+jtA@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 4/4] tests: DRM selftests: switch to
 KUnit
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
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
Cc: Shuah Khan <skhan@linuxfoundation.org>,
 Petri Latvala <petri.latvala@intel.com>,
 KUnit Development <kunit-dev@googlegroups.com>,
 Magali Lemes <magalilemes00@gmail.com>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <maira.canal@usp.br>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <n@nfraprado.net>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 leandro.ribeiro@collabora.com, igt-dev@lists.freedesktop.org,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Tales Aparecida <tales.aparecida@gmail.com>, David Gow <davidgow@google.com>,
 Isabella Basso <isabbasso@riseup.net>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 1, 2022, 6:53 AM Mauro Carvalho Chehab
<mauro.chehab@linux.intel.com> wrote:
> > Ah, the selection is in kunit.ko itself. kunit.filter_glob, set from
> > kunit.py with
> >
> > positional arguments:
> >   filter_glob           Filter which KUnit test suites/tests run at boot-time, e.g. list* or list*.*del_test
> > \
>
> Gah, permissions are 0:
>
>         module_param_named(filter_glob, filter_glob_param, charp, 0);
>
> You can't even see what filters were set via sysfs:
>
>         $ ls /sys/module/kunit/parameters/
>         stats_enabled
>
> So, once set, there's no way to change it.
>
> I wonder why this isn't 0x644.
>
> It sounds that, if we want to control it at runtime, we'll need to
> build with kunit as module, and unload/reload it every time if/when
> we want to run IGT with a different filtering ruleset.

kunit.filter_glob only works on built-in tests, which is why you can
only set it once atm.
There is no currently no way for KUnit to run a subset of tests in modules.

The module init code is here:
https://elixir.bootlin.com/linux/v6.0/source/lib/kunit/test.c#L620
As you can see, that func it calls just initializes and runs all the
suites: https://elixir.bootlin.com/linux/v6.0/source/lib/kunit/test.c#L589

This can of course be changed, just needs some work on the KUnit-side.

Daniel
