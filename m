Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DD571A354
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 17:55:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3B8110E573;
	Thu,  1 Jun 2023 15:55:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78C3810E573
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jun 2023 15:55:28 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-33baee0235cso127085ab.1
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Jun 2023 08:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1685634927; x=1688226927;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EsHsbgqQuvkE13E+e8VjItpscwfgrZGQXzD0CfoYBYQ=;
 b=G1Wi4/3LTV4HkdQGEsyUF5UfKmkEUEpM0w+7QAXsaouVozADnYTYfu1VYvOe6qvRd8
 ymjIaWsNr+VM93P4sY2VnvegUpR6ftJIlOkssGvKNV1CMIyscSYZtjxGCYjJH6fAwXcK
 x1lGr6ZVRVMm0OViB6uJ88jThpxBZHPt85QTHXDPlIbGBb5nIxAMVMYsoOn5w2qOAeMR
 0tGUljSQRIdefLooiETFwftKjPtQIEavSY1P0s9gM+TdEK7TO5VByhvzV3b+1XNIb1P8
 jRiLC+DiJ0rfO9EvLNKP+Ods7YySavaf6X7UOvlarv/iQ/fsvsNzw5UZ69DYMLsMZmnV
 LeMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685634927; x=1688226927;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EsHsbgqQuvkE13E+e8VjItpscwfgrZGQXzD0CfoYBYQ=;
 b=gepRixidRSGC31kKc6X2lxd8cM1ePzxxusyyelGD6qBfO6Kpg0/rxvnRCrKg2Ril4q
 NyJ9JESslZMkRbrIfaDEIF9MZ40LrwmSjoS3/aXItnU0XVkps0Nlh6XtgI3ETulIo0sL
 bD/WibFOBT2L1ZojKtYEWGl8AllMeeMFJRNAgGhiEhmsYO59RPJbsu4t+md3eclZyjDt
 HwHGkFoYpR8W6Xv7cPOTP+qwUNVL+HqlpO++cyDPM+WzGJTmoUeyhB6niStE/nkYwbng
 TidVVNdrrMDwRFLcKdagpgOjHwWyWNubZr5Czw/XkcbjH1VxaCnf36k0ofiVXEuDLY60
 wyjA==
X-Gm-Message-State: AC+VfDzn5vQnl+DCt/FqsTcNScQ993CecJH+RCvu3T30eqCwLwWd+p0q
 M31jUMrMzofGIeRgAyU2CyXnkXgMEsHPLqY82aO3Bw==
X-Google-Smtp-Source: ACHHUZ4ihBDDV8KMBS8t5HnIs334oF8TNSFTWesIFt5YLcc6oyApAaXJeZp4DmW2lzbgpaPp7XxzYhInyVCMqlBTNz8=
X-Received: by 2002:a05:6e02:20c6:b0:338:3b6a:4719 with SMTP id
 6-20020a056e0220c600b003383b6a4719mr170365ilq.17.1685634927132; Thu, 01 Jun
 2023 08:55:27 -0700 (PDT)
MIME-Version: 1.0
References: <1adda828-cf35-fb2c-6db5-f9ca91b5b62a@linaro.org>
 <20230525093151.2338370-1-yangcong5@huaqin.corp-partner.google.com>
 <20230525093151.2338370-3-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20230525093151.2338370-3-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Thu, 1 Jun 2023 08:55:15 -0700
Message-ID: <CAD=FV=XpHJVEpG5HcKroyGX7XMj1RwpNWQ1hbdDgnfBeAxECzg@mail.gmail.com>
Subject: Re: [v4 2/4] drm/panel: Support for Starry-himax83102-j02 TDDI
 MIPI-DSI panel
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
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
 sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, hsinyi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, May 25, 2023 at 2:32=E2=80=AFAM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> The Starry-himax83102-j02 is a 10.51" WUXGA TFT panel. which fits in nice=
ly
> with the existing panel-boe-tv101wum-nl6 driver. From the datasheet[1], M=
IPI
> needs to keep the LP11 state before the lcm_reset pin is pulled high, so
> increase lp11_before_reset flag.
>
> [1]: https://github.com/HimaxSoftware/Doc/tree/main/Himax_Chipset_Power_S=
equence
>
> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
>  .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 100 ++++++++++++++++++
>  1 file changed, 100 insertions(+)

Applied to drm-misc-next:

1bc2ef065f13 drm/panel: Support for Starry-himax83102-j02 TDDI MIPI-DSI pan=
el
