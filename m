Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E009471A357
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 17:55:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFD2610E570;
	Thu,  1 Jun 2023 15:55:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C151610E576
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jun 2023 15:55:45 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-33b7f217dd0so157045ab.0
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Jun 2023 08:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1685634945; x=1688226945;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uApS0AB+KUqwH2mw5UL4mdLHnyPDTmyOVgSJDqeRPaQ=;
 b=y5BR8FXbezVtxErlOjqqGKRAJTB9J95itZDa1tseyYftY+Gf+XQYKzD6KoEck/jdkm
 ZoVNis5cPOexjakvLKY0EI0DTbikKPDl/ZvtfWU0hB1daeDRS/YaWkVaQh2w0xvJ4gY6
 gvH9dprFwLSDJvPpwl5n+zwlY/nOsSaB1cNUm1eQFdyst8KAOKXO1134VXhEyflY3diV
 vAi+Zy4KmyqfJRSL3IjspIlKYXZqZWH9MmnR5xCHGrCtt9bTUU6M2BjBKOjmW3lCrGJU
 90ceMJys0Gy5NH6i0WEsvfkhtVgG73mUwRCA5wsCXldA5sTjObwnSXgm+NCoUqFGty9X
 eZhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685634945; x=1688226945;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uApS0AB+KUqwH2mw5UL4mdLHnyPDTmyOVgSJDqeRPaQ=;
 b=JkfkAOn55OG8RgW4ATSpoRfhaxgo3NYCMbut7FpJHgXPWOT0E934TflO5fIoKuFrCz
 zbTIzh9I6DRYeAtBSlVrIITnsagbNVz/sCpnklU9EqaC402qSzmfzEDz+k62g9rbBf+y
 LIm3FU9u06ohqUt0Jn2dsXFgbbP+rii7+T/bLYqcelCcI25wQWlUEcTIld8oi4d5psRF
 Zz/227eTZuv2FTxJGP3UA+BE33/IY7PJplWJTbFZlM4u8ErS5X1ITknGQsj/QjBYJvyy
 9ZretIl6I3v997X4rWYKKcDrdipAPVqOV35OuMeJzEFnBVtseEuuItZGBNhwhDxt8b9Q
 yh2w==
X-Gm-Message-State: AC+VfDyEMmfKO3liLaAJA2roAxALCxneSamnRY/X8FlpeFvEJjhdr8AW
 kH6dKRDE+NGTDrV4HfFHdQZlbQ88vS/YIaHqAW4e7w==
X-Google-Smtp-Source: ACHHUZ5fq3JioldW7xhRbYNQAjKs/px/pm2qGdKgn4OzPmtAXvaz+G27ZQEqZ03qI2j8UCtxfAZGvE6m8QXSxh0qHiM=
X-Received: by 2002:a05:6e02:1a01:b0:320:9759:bf6b with SMTP id
 s1-20020a056e021a0100b003209759bf6bmr186805ild.3.1685634944981; Thu, 01 Jun
 2023 08:55:44 -0700 (PDT)
MIME-Version: 1.0
References: <1adda828-cf35-fb2c-6db5-f9ca91b5b62a@linaro.org>
 <20230525093151.2338370-1-yangcong5@huaqin.corp-partner.google.com>
 <20230525093151.2338370-5-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20230525093151.2338370-5-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Thu, 1 Jun 2023 08:55:33 -0700
Message-ID: <CAD=FV=W_Vw=WTuap60PtzU8Jc58T1PsEhJfY96NmFFgmC1DB9w@mail.gmail.com>
Subject: Re: [v4 4/4] drm/panel: Support for Starry-ili9882t TDDI MIPI-DSI
 panel
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
> The Starry-ili9882 is a 10.51" WUXGA TFT panel. which fits in nicely with
> the existing panel-boe-tv101wum-nl6 driver. From the datasheet,MIPI need
> to keep the LP11 state before the lcm_reset pin is pulled high. So add
> lp11_before_reset flag.
>
> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
>  .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 371 ++++++++++++++++++
>  1 file changed, 371 insertions(+)

Applied to drm-misc-next:

8716a6473e6c drm/panel: Support for Starry-ili9882t TDDI MIPI-DSI panel
