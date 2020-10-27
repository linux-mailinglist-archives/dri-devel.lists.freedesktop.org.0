Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 574D829AE2A
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 14:57:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A2B56E05F;
	Tue, 27 Oct 2020 13:57:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 752FA6E05F
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 13:57:34 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 04C8321D7B
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 13:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603807054;
 bh=bCkAADwVUiL1//dh/4IT1DCgiPsfsVYvbtyHkxNq9S0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=pxWzSXit5q8lsKgYMlnrNgnW6iGOG32v0NaQ7f+8Bf+WGQtbx07toYiOMij5nIeJj
 p9MJaHbqV+lgOmJESQxz3rDWhgxwtXvybUEoXEgy/jQ4wA4pEufHdyCWQsRNQS5w/H
 eHa6qCYOk+uFgnqxM1GqVn7DDSQ+8ADvcZxkpev0=
Received: by mail-ej1-f42.google.com with SMTP id p5so2383680ejj.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 06:57:33 -0700 (PDT)
X-Gm-Message-State: AOAM533/Obna2C97mHu/azBN4DuHNZl5HcIrHD76/SfrhbHPzPWbg6pz
 3SBRYa8umMhh4Zi5HyD+lb3l95NErKp6nTXCMNE=
X-Google-Smtp-Source: ABdhPJzFiiYLDa37bXKUhu/1u6y0EtOWP6Hkh6q/LH5bFBtQdm7kyDeqRmGFv8Eb7YKgCvDDv+svj2T/9n86VE978dM=
X-Received: by 2002:a17:906:1a11:: with SMTP id
 i17mr2432900ejf.381.1603807052521; 
 Tue, 27 Oct 2020 06:57:32 -0700 (PDT)
MIME-Version: 1.0
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-32-digetx@gmail.com>
 <20201027135051.GL1822510@ulmo>
In-Reply-To: <20201027135051.GL1822510@ulmo>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Tue, 27 Oct 2020 14:57:19 +0100
X-Gmail-Original-Message-ID: <CAJKOXPeEKuYAbUh-YfXfDWamW_o6ejynq18vYNHsJ2gezpFYhw@mail.gmail.com>
Message-ID: <CAJKOXPeEKuYAbUh-YfXfDWamW_o6ejynq18vYNHsJ2gezpFYhw@mail.gmail.com>
Subject: Re: [PATCH v6 31/52] memory: tegra20-emc: Use
 devm_platform_ioremap_resource()
To: Thierry Reding <thierry.reding@gmail.com>
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
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <cyndis@kapsi.fi>, Nicolas Chauvet <kwizart@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-pm@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 27 Oct 2020 at 14:50, Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Mon, Oct 26, 2020 at 01:17:14AM +0300, Dmitry Osipenko wrote:
> > Use devm_platform_ioremap_resource() helper which makes code a bit
> > cleaner.
> >
> > Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> > ---
> >  drivers/memory/tegra/tegra20-emc.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
>
> I'm not a fan of this helper, to be honest, because I think all the
> churn that we've seen with the conversions isn't really worth the 1 or 2
> lines that it saves, but hey, looks like this is pretty broadly
> accepted, so if Krzysztof likes it:
>
> Acked-by: Thierry Reding <treding@nvidia.com>

Such changes indeed do not bring much but still less local variables
and -1 line. I am fine with them. They also save one error msg from
devm_ioremap_resource() in case of platform_get_resource() failure.

Best regards,
Krzysztof
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
