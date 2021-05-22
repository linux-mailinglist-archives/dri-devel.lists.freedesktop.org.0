Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D3638D539
	for <lists+dri-devel@lfdr.de>; Sat, 22 May 2021 12:38:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 947206E483;
	Sat, 22 May 2021 10:38:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D7E6E483
 for <dri-devel@lists.freedesktop.org>; Sat, 22 May 2021 10:38:34 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id i22so33226141lfl.10
 for <dri-devel@lists.freedesktop.org>; Sat, 22 May 2021 03:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YDP7cgKPnmfHekICN1ZUqXwsJ8B2vownzYJ7Goi+DeI=;
 b=YUouiI1hWFF6RhOFFEDsvCZKfzP0Q1WjQ1yTzd1Nwkd203W2WpW0KUq02UK4sUdedQ
 kPpH/9R2Q6k2oGQPU+CEKSed7RaYHMWn0moLZ9YI3w6rRSiUM2/mMP2N9rsmgA9nnCVm
 1gnymfMd5kdslq+5Zkn66CnoUwok9PHgZMpg1mgkcX+5zQSobOkxrYyooXl6ojyipcBT
 6+OjOW29bGwfLwgOddvQJ0NWfRr/yaeDtb96d6qxbc4JRBoeboLbkKbUw04AA6ZS9iwX
 G/KAWLPk72o/VDTaWt6G3nV5HDzjKW+JuVKjQf0rdJMMqxTBj+YR93IUL5XiNAg+BEfO
 nlYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YDP7cgKPnmfHekICN1ZUqXwsJ8B2vownzYJ7Goi+DeI=;
 b=XGFJVm8+Puj+EW+4TrmTNrOloq+GeGgzGBw+3uCeyg8X1SfdMmN3GS/b2ZaPMreVLa
 glZ6vUHtova1+/SvborcHdhWwIZuH37WWc/J8sS/q0q/cLJLZvrewwxGYRgiqFP9J0u6
 0tHK/ekb9hrNOsf5rMKWCEN5L92bMNWK7wFy9cj4wlG0mIsMZgMmUcJsGUlLJz4euQ8J
 rPtZArMt/25z5WsE0Doby/9hDV7qH+KHxRcGf/qwGUG1OwbGX2DURfrsXQWUjaVxfYC2
 +rmCJENxRey4zyvdjE0dk1GufJ9bdwxeKb1+8Slxuxy0V69DStxP7i6z9axHmtl5k3/O
 FhIw==
X-Gm-Message-State: AOAM530y/GNb7MI7T9NlFwjxrOHgfVHP7LWAg82figYcKv+pZT7rIlUl
 4s4C8cQ5J53AgSjRgMMjhnu0uhlm8IrW+JUUGtVzBA==
X-Google-Smtp-Source: ABdhPJw32JQfF9p8nsp7bu7cLUXb+nPLcZsZnsZN7Ja4Wkr9uNgmEYkdrOBP927EgYJCjUeMJd4/1kCAoDVWQ8D4Qmo=
X-Received: by 2002:a19:b0b:: with SMTP id 11mr4973996lfl.291.1621679913318;
 Sat, 22 May 2021 03:38:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210517200907.1459182-1-dianders@chromium.org>
 <20210517130450.v7.2.Ieb731d23680db4700cc41fe51ccc73ba0b785fb7@changeid>
 <CAL_JsqLMs10Luj7fKkNVu-BUZhpqAGJMZyUxz76N3b9Xa7EByg@mail.gmail.com>
 <CAD=FV=Xsc1noo7ZBK4_+Cty6KO5vc7Ex7G7BCg38rRu3s=fvUg@mail.gmail.com>
In-Reply-To: <CAD=FV=Xsc1noo7ZBK4_+Cty6KO5vc7Ex7G7BCg38rRu3s=fvUg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 22 May 2021 12:38:21 +0200
Message-ID: <CACRpkdabjzxSSj6PH3n+5AKU5MAnciN_yVySYWPHucEgDK4qEQ@mail.gmail.com>
Subject: Re: [PATCH v7 02/10] dt-bindings: display: simple: List hpd
 properties in panel-simple
To: Doug Anderson <dianders@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>,
 Sam Ravnborg <sam@ravnborg.org>, Steev Klimaszewski <steev@kali.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 18, 2021 at 3:58 PM Doug Anderson <dianders@chromium.org> wrote:
> On Tue, May 18, 2021 at 5:42 AM Rob Herring <robh+dt@kernel.org> wrote:
> > On Mon, May 17, 2021 at 3:09 PM Douglas Anderson <dianders@chromium.org> wrote:
> > >
> > > These are described in panel-common.yaml but if I don't list them in
> > > panel-simple then I get yells when running 'dt_binding_check' in a
> > > future patch. List them along with other properties that seem to be
> > > listed in panel-simple for similar reasons.
> >
> > If you have HPD, is it still a simple panel? I don't see this as an
> > omission because the use of these properties for simple panels was
> > never documented IIRC.
>
> I would say so. It is currently supported by panel-simple in Linux. Of
> course, you could make the argument that panel-simple is no longer
> really "simple" because of things like this...

I think it should be renamed panel-panacea at this point. I think
I pointed it out before. But not my pick so I rest my case.

Yours,
Linus Walleij
