Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D99CB7C56F5
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 16:36:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CD1210E8ED;
	Wed, 11 Oct 2023 14:36:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AF7D10E8ED
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 14:36:11 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-534694a9f26so11805a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 07:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1697034969; x=1697639769;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fRia8k+03Oqwx1GX3n4lKL8Fmr4eu0Kd6W6Uh3EpGVs=;
 b=bSFKtyEh35086CeE7fqU/5C1YqyaSysUIzHgXX7AbzZTi2BcP6Iag6UVJBqIv0vHIk
 YjLDbgC6XlkPJh+9zEtV6n6i1SdFb4jrBuHjPRPSGZozTBIpC6E7tDOp5/KyLHkfzpch
 m7+YpyuBxAHrVQEWasqX8RIs6QxwsUQAAq7oCI7r2G42Y0AoOJmQJjTkhtSFUnyu/X+Q
 SvmxZzYiy5ok6+s7uy82aOYsEWkOm2pV0vQkrFhu9I/UbtJA5YoC/iwv0CGmexJltlAb
 UHVjYGRSJ5J82Yeev7s06HmZvmOWJOvrsaY2MSAQAYRmWT543bsXoGtAF0IpOTrdYqGs
 0FUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697034969; x=1697639769;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fRia8k+03Oqwx1GX3n4lKL8Fmr4eu0Kd6W6Uh3EpGVs=;
 b=hRxFhu5XUjbFxklAKknMiwP/uXhC/BtT/gsijDMYiMKQ8+0n6UrBZQ8EEAnfFLSpb8
 czCV7iclYyWd8p/Ov5WzasNs6yuL4OGl5pnsKRGQOHwRQjOvgvMOjShACNQmt0zpboh8
 3FIhpyTHkwkFyAgMd+iSLp1ktsK1GAzSGxo3Tt4Q8iRGs2KYZmk/Ltt2u4omG20Qe5T1
 TPmsBAfHY67cJ2sZdnRBZIBRKl77mR62h+c5Eq7JP0LyPQmK5ZRucsP1wHalhwgXIxJV
 rOpihYmnBCPldji5mitTRNqN/rg1POQExkdVu4STMfjMZ5NQxgFvJer5oUIJ4xjTy6EL
 +1sA==
X-Gm-Message-State: AOJu0YxlVKlKYk0QhuWzmtC/p2fOfNRuLB7+u/OfxyGaZewO4zl+XzTn
 eXjAtWAqTF5nDp7p+EV2CPeaT3P25KsLeeuIXD+VEQ==
X-Google-Smtp-Source: AGHT+IGp0aCbVch3aWSyH7cHVNbtanzJle7cJ1cAmpcUd/wMeHz4+z/v7vHIwU0O/XV3e1Y9FOEIZ+CBjOydn+x9eiA=
X-Received: by 2002:a50:8ad1:0:b0:538:5f9e:f0fc with SMTP id
 k17-20020a508ad1000000b005385f9ef0fcmr158758edk.0.1697034969289; Wed, 11 Oct
 2023 07:36:09 -0700 (PDT)
MIME-Version: 1.0
References: <20231010121402.3687948-1-yangcong5@huaqin.corp-partner.google.com>
 <20231010121402.3687948-2-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=VsjB-gsqXyAs+G8DpHJqHNTxeFXwbpgt20-Wgb757z1w@mail.gmail.com>
 <CAHwB_NKVSOLwBttWG9GQMvKEFGzuGeE6ukR=vNDNLpdVjjohng@mail.gmail.com>
In-Reply-To: <CAHwB_NKVSOLwBttWG9GQMvKEFGzuGeE6ukR=vNDNLpdVjjohng@mail.gmail.com>
From: Doug Anderson <dianders@google.com>
Date: Wed, 11 Oct 2023 07:35:53 -0700
Message-ID: <CAD=FV=WFkRqkp8wcGG5uxE+7RqAQ40rSU-12Zig1R--ykcO8ZA@mail.gmail.com>
Subject: Re: [v2 1/3] drm/panel: ili9882t: Break out as separate driver
To: cong yang <yangcong5@huaqin.corp-partner.google.com>
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
Cc: neil.armstrong@linaro.org, will@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, catalin.marinas@arm.com, hsinyi@google.com,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Oct 10, 2023 at 10:42=E2=80=AFPM cong yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> Hi,
>
> On Wed, Oct 11, 2023 at 3:11=E2=80=AFAM Doug Anderson <dianders@google.co=
m> wrote:
> >
> > Hi,
> >
> > On Tue, Oct 10, 2023 at 5:14=E2=80=AFAM Cong Yang
> > <yangcong5@huaqin.corp-partner.google.com> wrote:
> > >
> > > diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c b/drivers/=
gpu/drm/panel/panel-ilitek-ili9882t.c
> > > new file mode 100644
> > > index 000000000000..e095ad91c4bc
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
> > > @@ -0,0 +1,762 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Panels based on the Ilitek ILI9882T display controller.
> > > + */
> > > +#include <linux/delay.h>
> > > +#include <linux/gpio/consumer.h>
> > > +#include <linux/module.h>
> > > +#include <linux/of.h>
> > > +#include <linux/of_device.h>
> >
> > nit: remove include of linux/of_device.h since you don't use any of
> > the functions declared there.
>
> It seems that of_device_get_match_data will be used.

Right... ...and of_device_get_match_data() is declared in...
<linux/of.h>. :-) See commit 82174a0a9c5c ("of: Move
of_device_get_match_data() declaration") and commit 722d4f06e560
("drm: Explicitly include correct DT includes").

We'll probably need to handle that when picking to downstream, but for
upstream you shouldn't be re-introducing of_device.h.


-Doug
