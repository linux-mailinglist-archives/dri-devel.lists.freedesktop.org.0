Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66156120291
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 11:31:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38ECD6E49D;
	Mon, 16 Dec 2019 10:31:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 511326E49A
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 10:31:00 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id a13so6175288ljm.10
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 02:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R2CAqD7yphVxKpqpK+F/eAr7MRlAfENWVqw0CFqAnoY=;
 b=F98ofzZswi1ON1bAKTPSWd5+Icm6mrMRcWlGoNTeahpUdZxvSM6qFcZqGN4zAN4Osp
 NdlLEy7XHE0zbPmUPi2zZq5/U5/a9Ue2B+XfIh+EluUE+NoHaOMSjoxvxpExuwNfwwOs
 2oTEoPYR/rTYGmGXHzgc0Pr/FAj3QmcuhcAhTsRGt6RmxDIqCHgnOQMkUTOAHb4I3u1R
 m/2YQVrcDL+DR1UUH/SkmD8dEzpXTM4KzvF07eOk6LXi/nqEznJiz6kcl0yeiO3Lfg0O
 dcea358D79Zrq3wRs5ExA4+mnB0OVo8ZagEMOi3YmF/JKgrNYhNQ40lRqBXcsKfb/BZy
 RfWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R2CAqD7yphVxKpqpK+F/eAr7MRlAfENWVqw0CFqAnoY=;
 b=ODcVxUTGK92CvAevs0ykiwe1iXz+M4gFIRWkzOxTs2w0HAjR9cvnrq4Nlla45MVntt
 Aqj219utJ9O/Gz2ufNtDQs4LYC1tIQKbsTeQOscFD6zsUy/mPcjgOPuT0PqAOSD3Lky0
 s07NChQNDd7E599KxSkoP8zc7UqVMRYxMn5jzbIEiTd15UYeY/PruSQ9LuE4Vkz9G3Ci
 hknmj0eN7U94DUmlCyuTJnASgQJGwQx0i08SH/XKvUJgmBJsoKhPEfC78duBHsyTjOXP
 ctmAIPYJATCIoIxOLPz+RhmqZ+Mlu9Ed4tiP6CwBiQn3x24forMHQ4A1Ew8SOh/xxLvO
 wPCw==
X-Gm-Message-State: APjAAAWi8kQ2vA3pSSzqbNcoz/cOvwGyN1nqPrDTkNnWqtoGB1kQEBFu
 0V7DDlWYgRHCabA1KnHSsSPCeqjPId3+FIcqU7fIvg==
X-Google-Smtp-Source: APXvYqycu9hlE1s4S+Sge2Bqv8D+k87tga/cDOXtTcuobEYzip+IsUlyb9ENhVmckOFQwM0Ke6RmQOIym8zJ1np0yPg=
X-Received: by 2002:a05:651c:1049:: with SMTP id
 x9mr18594833ljm.233.1576492258842; 
 Mon, 16 Dec 2019 02:30:58 -0800 (PST)
MIME-Version: 1.0
References: <20191215163810.52356-1-hdegoede@redhat.com>
 <20191215163810.52356-5-hdegoede@redhat.com>
In-Reply-To: <20191215163810.52356-5-hdegoede@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 16 Dec 2019 11:30:46 +0100
Message-ID: <CACRpkdYLXU9SmrNZfk9vrJuai9O-evAoq_c1oPJ7Q=NQU8=gng@mail.gmail.com>
Subject: Re: [PATCH 4/5] drm/i915/dsi: Move Crystal Cove PMIC panel GPIO
 lookup from mfd to the i915 driver
To: Hans de Goede <hdegoede@redhat.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Dec 15, 2019 at 5:38 PM Hans de Goede <hdegoede@redhat.com> wrote:

> Move the Crystal Cove PMIC panel GPIO lookup-table from
> drivers/mfd/intel_soc_pmic_core.c to the i915 driver.
>
> The moved looked-up table is adding a GPIO lookup to the i915 PCI
> device and the GPIO subsys allows only one lookup table per device,
>
> The intel_soc_pmic_core.c code only adds lookup-table entries for the
> PMIC panel GPIO (as it deals only with the PMIC), but we also need to be
> able to access some GPIOs on the SoC itself, which requires entries for
> these GPIOs in the lookup-table.
>
> Since the lookup-table is attached to the i915 PCI device it really
> should be part of the i915 driver, this will also allow us to extend
> it with GPIOs from other sources when necessary.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Looks OK to me
Acked-by: Linus Walleij <linus.walleij@linaro.org>

But Lee & Andy should have a final word on this.

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
