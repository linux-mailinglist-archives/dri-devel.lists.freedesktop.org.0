Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B7F3CA023
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 15:54:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CC466E85C;
	Thu, 15 Jul 2021 13:54:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B75226E85C
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 13:53:59 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id f30so10073836lfj.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 06:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JGYF8hWgVNMB+PzE6zb3NE1EFBYIqKKq2vW7O89OdZA=;
 b=bF9C3Q5mYm4kfjJwI5xS+MFtfDk6LLmGorM3K5qQdXo8b8ICf4k1tNusnYebKhb5cr
 UhI/IpBbJYQooi1/4LIK7O6JmC1BWnvbztwuGcYP11z1ApSZC6ozyojDINnKAcaw1hz6
 F/SFQqawa3OuvPcpojI6yamGNDwkc0Dh4JQ3Asl8plDKGBqwE1LwUg6HsXmDVy+GQUYv
 SIgpAN4Lc95zxVKVRQiSQnHhzi9/PEaH3C1C9ZYOsVq7fT7JvxedmQfX27pDb+6lo764
 rR6V1eediZqj6XFN4hvlMeVYXgczzd1glhdKWR42Z5uzmIf1gOL95wOvRzMi5Qs6ii+l
 fvPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JGYF8hWgVNMB+PzE6zb3NE1EFBYIqKKq2vW7O89OdZA=;
 b=LRLXIfFNHcEHoWap52eSL75hsxcmeKQfeZD+gtPL1/YZ51mPVvVtLMBxsND5cDh5qP
 ioHrwZPH/bt93fPreAaR281/xrvWboLcgRx9f2Xgo4r+JflS0oLhhuEXhoDCMou60gPI
 cd1vxZOI9hBzRxE26l05v1AhGL/3W1pIfuzpNz82oyEntABkSyghHhmBLyfUKV0ciryI
 DdmLnF102CGeqx2eFZEGUquP/zcSTS+fb6TWHU9HuRtlAtxxE6EPetDLaJcusWKQyfae
 O8iSfWgN4WxEy3QnOmXRvI4HpWizimSPJddmKUsp/99vcpvdFn58UYvFZqiJfUckjHS4
 LcAg==
X-Gm-Message-State: AOAM531RtqEWLFTaYI9KFRmM5Paq+x8Ami4koCvY+E6UAkXS/jA16GMi
 ip1SI+y3qwGNNeyVo6buABY=
X-Google-Smtp-Source: ABdhPJwCAYxv3fWLrJDR/7ML0iAUkHDR/18K1sCJ4H4j/2nj3/y61mdj4YGxVjZlwuvk8PVUSoqjuA==
X-Received: by 2002:ac2:5588:: with SMTP id v8mr3505435lfg.213.1626357238236; 
 Thu, 15 Jul 2021 06:53:58 -0700 (PDT)
Received: from [192.168.2.145] (94-29-37-113.dynamic.spd-mgts.ru.
 [94.29.37.113])
 by smtp.googlemail.com with ESMTPSA id i13sm417617lfc.111.2021.07.15.06.53.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jul 2021 06:53:57 -0700 (PDT)
Subject: Re: [PATCH v8 00/14] drm/tegra: Introduce a modern UABI
To: Mikko Perttunen <cyndis@kapsi.fi>,
 Thierry Reding <thierry.reding@gmail.com>
References: <20210709193146.2859516-1-thierry.reding@gmail.com>
 <42252a14-f6b8-7e1b-90c2-1c741ba8223f@gmail.com>
 <YO6gm0PgMGNovk+4@orome.fritz.box>
 <56ca1626-37b6-5888-bc83-51433da7b26c@gmail.com>
 <e5158cfd-dbff-68c5-c54b-932c5d35f074@kapsi.fi>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1d6d89aa-3779-d749-74ae-739c77664d75@gmail.com>
Date: Thu, 15 Jul 2021 16:53:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <e5158cfd-dbff-68c5-c54b-932c5d35f074@kapsi.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

14.07.2021 18:26, Mikko Perttunen пишет:
...
> While my goal of course is to enable proper use of Host1x on the newer
> SoCs, there is absolutely no intention to forget about the older SoCs.
> Observably, to me at least, GR2D and GR3D are working -- the test suites
> are passing (though I did not port/try mesa). We are also not regressing
> anything, and I do not think after this series we are worse (at least in
> any fundamental manner) than the downstream software stack that these
> chips were originally productized with.

> As such I have a hard time
> understanding the doom and gloom about the driver's state and needing
> grand overarching re-architectures.

You need to work with a real consumer device and use it everyday to feel
all those problems. But problems always exist, we will fix them
eventually and then have new problems. We also have an alternative
experimental driver that solves the problems for the time being, so it's
not really that bad.

I may sound a bit too negative, but that's because you're are already
doing this work and I want to get your attention to a core problems that
in my opinion should be solved first to avoid a need to re-do the work
later on.

...
> I have a long TODO list of improvements to work on. Admittedly, I won't
> have as much time to work on it as I would have before since I need to
> start working on other projects in parallel as well. And things will
> need to be agreed on

A slow pace parallel work is a normal thing, that's exactly what me and
everyone else are doing in regards to having fun with Tegra development.
We already managed to achieve a lot this way and it's only getting
better every day.

> (e.g. as alluded to earlier I still don't know of
> any concrete reason why we would need to add a software scheduler. I can
> only make guesses. It probably makes sense for the old SoCs, but I don't
> know why we now need one and downstream never did)

Scheduler is needed for running jobs in a correct order. You don't feel
like it's needed because you use only a single h/w engine and haven't
seen places where it's needed.

DRM scheduler also has a much cleaner code, has more features, it's
optimized, well thought, uses modern upstream concepts and successfully
used by multiple drivers in comparison to what we have in the Host1x driver.

We will discuss it in a more details.
