Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF30B7DB751
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 11:02:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A96610E27A;
	Mon, 30 Oct 2023 10:02:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88CF110E277
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 10:02:03 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-5a7eef0b931so37686497b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 03:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698660122; x=1699264922; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7lO5+taRGYUV3utFVgJLnLNjNxmtaBHkPbnYDUDIen4=;
 b=DAhG0EzE8W6GRA/wb6HGg5Py18gNnCEEsbFGLXzuO31csDZSEsk64Y6eoBblTu4gDv
 4TZXkCEgBr7OtO6Qgf7yappCIVKWyKfrPPgsOgMrHgSaD9yALCBVMbzubsv//6TlTcM9
 qBSYqtmwkfKqj7z8GN2FpsMqrv0lbgpVNtUFiq9n7UZVdqxm8qpMDCJ10fZYfsRr2/lB
 jGeBmmy+PF9GiEyYCwXiNMPpPPG+8PB9b7oT9ci5rNY2EB5qpCh8zqC6Uc0TZMrlhGHK
 FHxjVpaCgTs/xM3KiT/Ep/VQkWFlY21bYxHyC92dnm1zbL7R62Ac9OnDQtmA0u0r03MI
 sL+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698660122; x=1699264922;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7lO5+taRGYUV3utFVgJLnLNjNxmtaBHkPbnYDUDIen4=;
 b=Dm/mhlW9LfwwI7NgTxXT7XRjeGuvUptHGG5rAvsvQDr6a4GMG9VmWSwzHRal7qVi+A
 LL/eiL6vVdNabyq5/Z7DPybxgYLple0E7f17Fyn1+UJ+cXf/Jmu7fX9px8QiTLt1c8na
 ohQ4HHAoY9Pd68kVuVRNa7ZwowEctX5wcrv/b0/nHocZFzh8X4yiAl52ICCLOnMF6hqp
 hxLp7WqhRas1b1bMN8qRc9cqRjVO86lK1t5tDHg/I3L6c9pYJ2R8fL8QDDVspRFS0AQR
 d379wk102Es8Kze+01vFf8A4RdYjB1WYZKZYGEJT3qa0hVtbes7JH+pcgP8GcBVyj5um
 DO1w==
X-Gm-Message-State: AOJu0YwZpqNihVjpfiR+bOY0femRo62KPaSe58HX0Ws0EVeCtLgSj2N9
 caaPVVTtF20NxNVbu0WDNnAJBCCIcHR4ZEtsNwDwSw==
X-Google-Smtp-Source: AGHT+IHMOnW5IIvkllnN98d7WTlfIttakT+UyeassCtYZ55EdxcFVw1ThJqTcmAYaOcLODaGTVh67pjcINcwpLY061A=
X-Received: by 2002:a81:4413:0:b0:59b:eab8:7ac6 with SMTP id
 r19-20020a814413000000b0059beab87ac6mr9995171ywa.42.1698660122684; Mon, 30
 Oct 2023 03:02:02 -0700 (PDT)
MIME-Version: 1.0
References: <20231029194607.379459-1-suijingfeng@loongson.cn>
 <20231029194607.379459-3-suijingfeng@loongson.cn>
 <CAA8EJprjQXcTgxnC1POaBjVBzyVBvKpmKyJcCR5ExRUhVxtYoQ@mail.gmail.com>
 <3ccb9600-6990-4ec7-81de-0d7b4e1294eb@loongson.cn>
In-Reply-To: <3ccb9600-6990-4ec7-81de-0d7b4e1294eb@loongson.cn>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 30 Oct 2023 12:01:51 +0200
Message-ID: <CAA8EJpqCe2j3GyeutnwTB0bkGXGk0az9-w3sPHLFwMVgAS=e7g@mail.gmail.com>
Subject: Re: [PATCH 2/8] drm/loongson: Introduce a drm bridge driver for
 it66121 HDMI transmitter
To: Sui Jingfeng <suijingfeng@loongson.cn>
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
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 30 Oct 2023 at 11:42, Sui Jingfeng <suijingfeng@loongson.cn> wrote:
>
> Hi,
>
>
> On 2023/10/30 06:53, Dmitry Baryshkov wrote:
> > On Sun, 29 Oct 2023 at 21:46, Sui Jingfeng <suijingfeng@loongson.cn> wrote:
> >> The IT66121 is a DVO to HDMI converter, LS3A5000+LS7A1000 ML5A_MB use this
> >> chip to support HDMI output. Thus add a drm bridge based driver for it.
> >> This patch is developed with drivers/gpu/drm/bridge/ite-it66121.c as base.
> > Please use the original bridge driver instead of adding a new one.
>
> I'm agree with the spirit of code sharing, but this is nearly impossible for non-DT system.
>
> Because the original bridge driver(say it66121.ko) is fully dependent on the DT.

I can not agree here. It doesn't depend on DT. It has fully populated
i2c_device_id structures, so it will work with bare I2C buses.
Most likely you will have to change of calls into fwnode calls, that's it.

> UEFI+ACPI based system can not use with it.
>
> Our I2C adapter is created by the drm/loongson.ko on the runtime.
> The potential problem is that *cyclic dependency* !
>
> I2C adapter driver is depend on drm/loongson
> drm/loongson depend on drm bridge driver (say it66121.ko)
> drm bridge driver (say it66121.ko) depend on I2C adapter to setup.
>
> This plus the defer probe mechanism is totally a trap,
> incurring troubles and don't work.

Welcome. We had this kind of issue for DP AUX buses.

I can suggest the following approach:
- In the root probe function you can create an i2c bus and populate it
with the i2c devices.
- I have not checked whether you use components or not. If not, please
use an auxiliary or a platform device for the main DRM functionality.
- In the subdevice probe / bind function you check for the next
bridge. Then you get one of the following:drm_bridge pointer,
-EPROBE_DEFER, or any other error case. Your driver can react
accordingly.

Basically duplicating the existing driver code is not really a way to
go. Consider somebody adding a new feature or fixing a bug in your
driver copy. Then they have to check if the fix applies to the driver
at drivers/gpu/drm/bridge/ite-it66121.c. And vice versa. After fixing
an issue in the standard driver one has to keep in mind to check your
private copy.

So, please, use the OF code as an inspiration and register all your
devices in the device tree. Yes, this requires some effort from your
side. Yes, this pays off in the longer distance.

> >   If
> > it needs to be changed in any way, please help everyone else by
> > improving it instead of introducing new driver.
> >
> >> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> >> ---
> >>   drivers/gpu/drm/loongson/Kconfig            |   1 +
> >>   drivers/gpu/drm/loongson/Makefile           |   2 +
> >>   drivers/gpu/drm/loongson/ite_it66121.c      | 749 ++++++++++++++++++++
> >>   drivers/gpu/drm/loongson/ite_it66121.h      |  19 +
> >>   drivers/gpu/drm/loongson/ite_it66121_regs.h | 268 +++++++
> >>   5 files changed, 1039 insertions(+)
> >>   create mode 100644 drivers/gpu/drm/loongson/ite_it66121.c
> >>   create mode 100644 drivers/gpu/drm/loongson/ite_it66121.h
> >>   create mode 100644 drivers/gpu/drm/loongson/ite_it66121_regs.h


-- 
With best wishes
Dmitry
