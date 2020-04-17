Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD401AEB41
	for <lists+dri-devel@lfdr.de>; Sat, 18 Apr 2020 11:27:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 507956EC6F;
	Sat, 18 Apr 2020 09:26:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FF326E3F5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 12:33:26 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id 19so2074905ioz.10
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 05:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R/DFFcAX16DLaq9WdO2qiN8rBml+MJK+Egu3pWqI85c=;
 b=rKrnZ/ZIdm1aeUPIX2i7Z77058PYDAyNI6+iFrsFSDl7Je/8OlgZDCy9z5ii3rx9bw
 gLH9lHRSc7kG5idpQgApSohV1Wts12wfoCocXqxJ7RGXlYL7wXut+NkfjnWBjxe+c84P
 5zbwC5uXVCo23D5lkdwM6MYjBe7JgeBmr1VycqpHixyxRgUohE5P4qRn7FnQl4If7cRQ
 VFaunHobZ42q9csRi2N7XlnSGOOLQgrEBaDnNLJqS+jo3hykyly0n0zAaPDNZu8TFf/f
 pxenS/GTz2RYzFkthc5Q2EsN3kzDihUUVfhVnJQkb7OqJ+3FdagJ8GRpyNSlS2DFJdh2
 gGcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R/DFFcAX16DLaq9WdO2qiN8rBml+MJK+Egu3pWqI85c=;
 b=KjAjsTAMtzBmsy5hZUzbikdZLcbthgyaJyK1A9RYsZOgcGc5h5F7ljs932SIYWUQfv
 lhxrSHnGjb/hLrni73llJ8ieAcs+jqENiRFfsUnwYuPwAUwYWcGKV6uiVem9LdufklQh
 +kuTsOFe54VIiVdwfwyfVRSJSqEJzql/y2nA+6ygMkPn7nGgnFIF8KclP6FJsDmZDvky
 G+8P8Q0zGQezsy4hZM138vPwW5uSi/jJ2+AZQhoqWoS2uuspzWj4wieY9CZqaeiYB+Gs
 yZ2INNvHjnQj1r1ZmvV5Utpafjjei9Dh9W8sV8nQmQJfIAeeaAb5mSH9Fhnu9r1yT/a4
 XOnA==
X-Gm-Message-State: AGi0PuZFLzWJ6zSqT31cixjxOZTXrOzayjJVrviRET9pFoh7TYsXQX94
 D0PGrA5j9Fsgb7WZK3Q7gb/pKGxlGHG4twv/vYc=
X-Google-Smtp-Source: APiQypIMz5q9puyyBCHECnAJTResjfLLf+aqAmOmoCL1sM4QnW8xe6r7rdXvDq1VFz83xdHIPkyef4LGIVeKFPSENdQ=
X-Received: by 2002:a5d:9494:: with SMTP id v20mr2793842ioj.101.1587126805638; 
 Fri, 17 Apr 2020 05:33:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200411200632.4045-1-peron.clem@gmail.com>
 <20200411200632.4045-2-peron.clem@gmail.com>
 <c96f31a2-6ff4-31aa-aaac-2ce9eafb3bfe@arm.com>
 <CAJiuCcegkNGQ7j4jcT1rBpSLqG1c-nb8g0wq+Nbvt-dGj7am2Q@mail.gmail.com>
 <CAJiuCceU662o7QGJ=mmT3pzVWK7uJUN=6+NKQnZ=Cfj9c2nw7A@mail.gmail.com>
 <d6465e7e-8e05-8b7d-16bd-f40877969089@arm.com>
 <CAJiuCccv2XPLY6sjcgvvrG5a8ONYHa_xn9i-YUDKUDK5a0DY=A@mail.gmail.com>
 <CAJiuCcfa9ro1V4nBzfD48cCuHpEsLaNA5P0bb-tQ3hcWUCtpkA@mail.gmail.com>
 <000f26f4-3640-797f-c7f6-4b31a5e2669e@arm.com>
 <CAJiuCccF3tmbmMWNh0nC5WRJ1_iPdj6f1oH1zYMSue_pFrXsPQ@mail.gmail.com>
 <20200414185523.GO5412@sirena.org.uk>
 <CAJiuCce5ekAed6RF8+x_ehruCXW3900wkFNKRXN_Xo_62MPXew@mail.gmail.com>
 <5e15e7ac-1d9c-d614-8fd9-27525c88cafb@arm.com>
 <5290a7a8-2a0a-cb89-9d62-270393123054@arm.com>
In-Reply-To: <5290a7a8-2a0a-cb89-9d62-270393123054@arm.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Fri, 17 Apr 2020 14:33:14 +0200
Message-ID: <CAJiuCccm4gTAUWhTy+gK0kt4of=8yWcz2n_JtnmeAJofcpBKeQ@mail.gmail.com>
Subject: Re: Multiple regulators for one device [was drm/panfrost: add devfreq
 regulator support]
To: Robin Murphy <robin.murphy@arm.com>
X-Mailman-Approved-At: Sat, 18 Apr 2020 09:26:15 +0000
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
Cc: Nishanth Menon <nm@ti.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Mark Brown <broonie@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Robin,

On Fri, 17 Apr 2020 at 13:10, Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2020-04-16 2:42 pm, Steven Price wrote:
> [...]
> > Perhaps a better approach would be for Panfrost to hand over the struct
> > regulator objects it has already got to the OPP framework. I.e. open
> > code dev_pm_opp_set_regulators(), but instead of calling
> > regulator_get_optional() simply populate the regulators we already have?
> >
> > The other benefit of that is it would provide a clear hand-over of
> > responsibility between Panfrost handling it's own regulators and the OPP
> > framework picking up the work. The disadvantage is that Panfrost would
> > have to track whether the regulators have been handed over or not.
>
> Sounds like the most logical thing to do is to shuffle things around so
> we start by trying to set up an OPP table, then fall back to explicitly
> claiming clocks and regulators if necessary. Then we can easily make the
> devfreq decision later in probe based on how that turned out.

Ok I will propose a new serie with this behavior,

Thanks
Clement

>
> Robin.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
