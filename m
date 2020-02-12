Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F7A15BA8E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 09:12:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F27D6E196;
	Thu, 13 Feb 2020 08:12:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85D976EA1B
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 09:06:43 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id a142so1327679oii.7
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 01:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KdiHyv1C8Z3O51Il2rRtKfTPYZzHq2aAiI21t6YVfMs=;
 b=cte8xNkI44GgsFD77ysg/J0+ROdUNaqr+8/qMeiMSvUTstItSyKa+1zbC936kxrWBR
 cv0glfQP1KHjjzFbxYSTJao3VNZztB19IYH2m+ItrGt5d0F6SOq5qdEuZx+drk27kCpQ
 pGKZokcJiORu3/nxErNnRCWc+jHy2i0FoqBD0TpcDWp5R1nSQkYEKW1obTRdpv3yIaqX
 g60WNW95r77sjFcgekae14GjYakaPLg0/z8gOgdEpXQvSsttsRAlnOLg3/ke3ZtUw0Bg
 VsFxYg0aJZifwjQBgCa0LFsXmndcr6s4ag/0rW6/l/G1dQ1/RmSEQj672xfEbY+TveLV
 SC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KdiHyv1C8Z3O51Il2rRtKfTPYZzHq2aAiI21t6YVfMs=;
 b=FEdF9D3xz0u+4TH750LhMR28GDttxt8sSJWX9+6ewn31imwpLcBkOsT9PFpUKqD9nS
 rZIJR3ToGKT9qsawgm3UuG78EVAS1DwqvFu/+lSwrGH8HrZHP6VnnZ9nT1m7spSclsE1
 s/bCad+U71YpFGZrMsP4WGwDbWJop/N0W5imY8wQjke4mZbjr4BpPZbRj+/I1cr5ufJt
 0koCYEmQWeTWAbcK1TXXx0wswYPBR/cxhU5rDmWK+NSQ635oBziS/m0h+KYucO1a4Oiv
 bSAnEdKJYmEHvB81BcjbEPcAxaNd0gO0K+Glix4Nyw1coTzAW4tEjcYMymehKJ/XF/EH
 4F2w==
X-Gm-Message-State: APjAAAWRXeGkJT3Y2gm7kOIobMbw8Nu47glflFcuwGTdXg8DltwUqSk1
 4x7K9YJS6t1Gtmuc4SS64Orsd1nN7qdT0OMYWgc=
X-Google-Smtp-Source: APXvYqz8LnWunxxKZNW1cjt4ireZgvOfph0KWPT5e7ByuK9ekEqH5ZKVzzbSPgDtk7Xf0cv7GXM0tk/J2jgQ4cISQQk=
X-Received: by 2002:aca:3114:: with SMTP id x20mr5662123oix.121.1581498402770; 
 Wed, 12 Feb 2020 01:06:42 -0800 (PST)
MIME-Version: 1.0
References: <20200207052627.130118-1-drinkcat@chromium.org>
 <20200207052627.130118-8-drinkcat@chromium.org>
 <CANMq1KBL-S2DVKbCB2h_XNpfUro+pZ96-C5ft0p-8GX_tbXELQ@mail.gmail.com>
In-Reply-To: <CANMq1KBL-S2DVKbCB2h_XNpfUro+pZ96-C5ft0p-8GX_tbXELQ@mail.gmail.com>
From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Wed, 12 Feb 2020 14:36:31 +0530
Message-ID: <CAOh2x=kS_X-zmwWKfm2CAHAjuLqEcOZ61gkCLKKi8webmpLTOw@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] RFC: drm/panfrost: devfreq: Add support for 2
 regulators
To: Nicolas Boichat <drinkcat@chromium.org>, sboyd@kernel.org
X-Mailman-Approved-At: Thu, 13 Feb 2020 08:12:52 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 lkml <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 vireshk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 12, 2020 at 2:19 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> +Viresh Kumar +Stephen Boyd for clock advice.

You missed adding us in the cc list of the email, fixed that now :)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
