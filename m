Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BEC746AFF
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 09:47:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABA3A10E15B;
	Tue,  4 Jul 2023 07:47:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD8510E15B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 07:47:01 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-bff27026cb0so5876725276.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jul 2023 00:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688456820; x=1691048820;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mRkvpRfMuOlSLRipkiu8Jze1f6nATDLcC9Hl3jUoeDQ=;
 b=Cqx18F0N47ar3DMEAXrXv9rl0+r4nk7G3XIVZRj+2UatRbWk2pkiJ9fKNXd1oP8qjq
 4XGs4CS5/ocs96OdReTui+io6Q2RUlZ2xxAxeEfoNbFw56P4i3S1lZhx6voqo8pd4ZdQ
 b/z4MqyLg8Lk25P+fCUbRY5CLKhcdCYyP1VaofG31awCT1pligE7xlPpR9vrV2FAtAB8
 hrTY3OLE3iGxJDe19xFGHJKZrbGQbgeVnZQZ1LO88hXcP8k+t1rKS1uSbiU2YmEBku1z
 zhrV/EdGR6Ifa04qAC0UcP4bA69IZzAjaNuqfw6hl7caT3ETmaYRF7TCVLwGVDifp70u
 65rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688456820; x=1691048820;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mRkvpRfMuOlSLRipkiu8Jze1f6nATDLcC9Hl3jUoeDQ=;
 b=fh+wISU2QESxLimllQko50AES0+uYnjWshnapTC8CTVydkiwqZT3NxnkNMy/FO4HBL
 QoP/tCdtvXMWJdMO8o7bI54iK8/EQoQiEwfp7rWMxDh0pXpWAoKj1/Y/VeVUaurDyhzu
 E6+Wg3AH8JHveIMicuE+Oa/PqWXa9gnLAWT0SESWXKHPXWxKyoPYR5Uf9tT00RfpkDuU
 sQtkmToKu5MXCJXOfVqJ57xXRttyVA6bHmFun4qF+ZK9RibvdJLko1z+sjWzr0WxbvSZ
 +nVo/nuKLL/UCuDGbYAfaYkwLWg1ZB6Yh8i9mDGnrylIZvVlfKH89rMqBiBmTpRtbu2M
 7Ohw==
X-Gm-Message-State: ABy/qLaPnnTcv9TD4wYr7dC6lJwaErj2XpRJqSK2a7sOKcQDyLFPBcsf
 iPRyCSGXiqzOuBW7BgRyySl9uZKSH9LsWOk6Smr0Ng==
X-Google-Smtp-Source: APBJJlEOVYLwvS3+qiYbXUZ3wW+zZMGMoOzX9B+2fCT/SfdKHpfvSIDaTLdVEL1H0hSnyYGdkqZBANWlryRDoYIKA2I=
X-Received: by 2002:a25:a8a:0:b0:bcb:9b43:5a89 with SMTP id
 132-20020a250a8a000000b00bcb9b435a89mr11258112ybk.61.1688456820597; Tue, 04
 Jul 2023 00:47:00 -0700 (PDT)
MIME-Version: 1.0
References: <1adda828-cf35-fb2c-6db5-f9ca91b5b62a@linaro.org>
 <20230525093151.2338370-1-yangcong5@huaqin.corp-partner.google.com>
 <20230525093151.2338370-5-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=W_Vw=WTuap60PtzU8Jc58T1PsEhJfY96NmFFgmC1DB9w@mail.gmail.com>
In-Reply-To: <CAD=FV=W_Vw=WTuap60PtzU8Jc58T1PsEhJfY96NmFFgmC1DB9w@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Jul 2023 09:46:49 +0200
Message-ID: <CACRpkdZkNio99zS+ttEXncOtS1TcYbfunKSKddErRDV1gTY43w@mail.gmail.com>
Subject: Re: [v4 4/4] drm/panel: Support for Starry-ili9882t TDDI MIPI-DSI
 panel
To: Doug Anderson <dianders@google.com>
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, hsinyi@google.com,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 1, 2023 at 5:55=E2=80=AFPM Doug Anderson <dianders@google.com> =
wrote:
> On Thu, May 25, 2023 at 2:32=E2=80=AFAM Cong Yang
> <yangcong5@huaqin.corp-partner.google.com> wrote:
> >
> > The Starry-ili9882 is a 10.51" WUXGA TFT panel. which fits in nicely wi=
th
> > the existing panel-boe-tv101wum-nl6 driver. From the datasheet,MIPI nee=
d
> > to keep the LP11 state before the lcm_reset pin is pulled high. So add
> > lp11_before_reset flag.
> >
> > Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >  .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 371 ++++++++++++++++++
> >  1 file changed, 371 insertions(+)
>
> Applied to drm-misc-next:
>
> 8716a6473e6c drm/panel: Support for Starry-ili9882t TDDI MIPI-DSI panel

Sorry for noticing too late and coming after the fact and complaining.

We must stop using the panel-boe-tv101wum-nl6.c driver as a
one-stop-shop for Chromium panels. The Starry panel in particular
hardware-wise has nothing in common with the other panels in this
driver and I'm suspicious about patch 3/4 as well.

Please check my patch breaking it out to a separate driver, and
if you could check internally if you have a datasheet for Ilitek
ILI9882t or can use your vendor leverage to get one to improve
on the driver (such as define the DCS commands...) that would
be great.

There are good reasons for grouping the panel drivers into
respective display controller such as fixing bugs in one place
and if we ever want to properly support things such as
gamma correction it will provide the proper per-display-controller
approach.

Yours,
Linus Walleij
