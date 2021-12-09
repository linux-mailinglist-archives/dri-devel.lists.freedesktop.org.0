Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B50846EEE4
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 17:59:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 289F110E166;
	Thu,  9 Dec 2021 16:53:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1287589E57
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Dec 2021 15:37:44 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id r25so20423848edq.7
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Dec 2021 07:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8lxkFDRMwg8pNfKVoAyUh19eKSO8wmq+MV5O7kUhYxI=;
 b=esWLlSPHynxWr5honL+GAEx/gqvDANyWuVRIgrW1bOxZBXPPpdzkngm0lr3iTi31DN
 taGQfbAYqHrKHjUhKXSMXiU9OZoBhG7h+0YIYUBmWV6MBnoEHyK72T0MJnQu93fGrQF/
 A9bXGbUTXq5mENYIV3z2bA93OHTcySlsg3LWFqGQuLj16ZIMJ5FaUHlw4jYj5dxFmFwR
 Ehh9Q9b3zbJlHwxaWmX9UNO7aREverDxv/1pcPAmXbdqyZDscw3Njt8a/fcAyp5Dm+WU
 jqsoCBAo2UnZKc9hd8Qsu2Hv+tGSaHlD31TP/LCI7md1zpzZ1o/mKBQaimhi0G8/JLby
 cEQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8lxkFDRMwg8pNfKVoAyUh19eKSO8wmq+MV5O7kUhYxI=;
 b=OJnQKWhx9iobxKHoe2qshJYyNCeeRTi3LwBcrk5F+Q/T1fL9YqUDZRwlcMwRATHp/P
 9iVgLsP8EeQLwe9tfJq+gtG+AzM+RFKX81cZR0RqV3KToALeFl3aoPNtOC/IWHV1Ou67
 nGdGOunInLHuj5GzfUbZ5fhOgd4oG/xCZyuX3IpOyZ6/4OTOVKXiCxQ6sc3zTYqUZcAn
 zVmoKQ8EdeGWj2HRMmAuOrA3e3s2WHPfLJJSCilEeHL9/pJDft0F0C2xmE5xm3w9Kb5l
 1RWoDk28diiXSSxhXzsFS2yupWR0CB0y/N+0wzcw/AmxgjVa/4CKA7BQ3WtuaoglcM1O
 VB1w==
X-Gm-Message-State: AOAM5301p1u9bIQHeN9uiGsL3Lc5BfcrgL1RL9DuQWv0gVzHgJf2giP6
 Rv8H5i9HRmLpAY0MEF7OevlNR0+mLIjJoABSpw5C43pJ6ajSLA==
X-Google-Smtp-Source: ABdhPJyMKzJQYJxTsKbBv+y62UDyk4QFBVKlhVjI7qC3dvWq418bPqN5fQgjAP7p0KHuljU4XKmV8Y+t89+fa5Sh8eA=
X-Received: by 2002:aa7:d0d1:: with SMTP id u17mr29711824edo.135.1639064121144; 
 Thu, 09 Dec 2021 07:35:21 -0800 (PST)
MIME-Version: 1.0
References: <1639062321-18840-1-git-send-email-akhilrajeev@nvidia.com>
 <1639062321-18840-3-git-send-email-akhilrajeev@nvidia.com>
 <976c8d73-d137-2050-ca82-18326456c9e8@gmail.com>
In-Reply-To: <976c8d73-d137-2050-ca82-18326456c9e8@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 9 Dec 2021 17:33:46 +0200
Message-ID: <CAHp75VdzrT5z13qx-mMRdrS2=GrMOv87WaEPL5eoPO5cBiqjDg@mail.gmail.com>
Subject: Re: [PATCH 2/2] i2c: tegra: Add SMBus block read and SMBus alert
 functions
To: Dmitry Osipenko <digetx@gmail.com>
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
Cc: devicetree <devicetree@vger.kernel.org>, Akhil R <akhilrajeev@nvidia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jon Hunter <jonathanh@nvidia.com>,
 linaro-mm-sig@lists.linaro.org, Rob Herring <robh+dt@kernel.org>,
 Laxman Dewangan <ldewangan@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-i2c <linux-i2c@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 9, 2021 at 5:30 PM Dmitry Osipenko <digetx@gmail.com> wrote:
> 09.12.2021 18:05, Akhil R =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > +static int tegra_i2c_setup_smbalert(struct tegra_i2c_dev *i2c_dev)
> > +{
> > +     struct tegra_i2c_smbalert *smbalert =3D &i2c_dev->smbalert;
> > +     struct gpio_desc *alert_gpiod;
> > +     struct i2c_client *ara;
> > +
> > +     alert_gpiod =3D devm_gpiod_get(i2c_dev->dev, "smbalert", GPIOD_IN=
);
> > +     if (IS_ERR(alert_gpiod))
> > +             return PTR_ERR(alert_gpiod);
> > +
> > +     smbalert->alert_data.irq =3D gpiod_to_irq(alert_gpiod);
> > +     if (smbalert->alert_data.irq <=3D 0)
> > +             return smbalert->alert_data.irq;
>
> 0 is the error condition.

I'm not sure what you implied here. gpiod_to_irq() returns 0 if and
only if it goes to the architectures where it might be possible to
have valid vIRQ 0, but this is not the case (at least I never heard of
a such) for GPIO controllers on such platforms. So, looking at the
above code I may tell that the '=3D' part is redundant.

--=20
With Best Regards,
Andy Shevchenko
