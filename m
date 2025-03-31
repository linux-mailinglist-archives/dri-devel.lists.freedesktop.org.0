Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC70A770F5
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 00:40:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33FEA10E050;
	Mon, 31 Mar 2025 22:40:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="nzjfvzMg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E1910E4B0
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 22:40:48 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-30c461a45f8so51442551fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 15:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1743460841; x=1744065641;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FLO6XpWwJP6wry6Kl4202qxPqF3pJF3nyfU3KzxEbD0=;
 b=nzjfvzMgbMTBEnwjG2fAowAxYIA8sc55R87hO0DSSNjxptbDbpzN5TDs9FVg/Ym/O6
 zw0Ap+6bYrVOvqelPgY6PGlV+4ox9QY+QQfBeTMbLZuI7sOKUAsiNz0k/wQbb4xhRwm8
 aMQjmMAlF/V4thAlDGgVD9JNKZfJJrhs3WbzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743460841; x=1744065641;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FLO6XpWwJP6wry6Kl4202qxPqF3pJF3nyfU3KzxEbD0=;
 b=M4QOJXUZmzw9ZQoIpPo5NA3MURZIQhDs02XEius+lZ+rsXKEBby9g3+0f48vc/DjiK
 XtxoZxjsEHQLZdaXoFk1Ij1a/p8+CulN4UlqVCCKRpDJRZYtALUdjKL9gS/CbRjOGkGa
 Of6U4Ra44beHoPnqGXm8c8exRugQoiakZKwZCIZ9sIWayWtymuJMW20q6hL7MLuj6Rw3
 yS45xnGTikiR/U/UtppHO6YfgeOtcL+/CFatOTNIVvNBrsqS2gyC9IgepnbfGb3p+nDm
 5DOgOZNRrXAN90BZXxaJK6DtnCrOQk1ZQ8mNy+blCHEkKX95b+dboU0SQpCaNvD6uK3s
 opWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXosx0xcv5/gpdgD4mqclTOlQBCl7Sl/tk+WssG9T7cm3QK/C/Egqb5WARUKeVVdueaZnWxAYoSwI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/nE4JJBCSaJyIhr50C4aYDjpal4gx+joH70e1LCQ800cr9DN7
 ee1b9wDqM76N2XiqnIp6HtucMi97i/FmjNaTyYsvQ/qLn19duGpd8LbfM4TSkk44O2ySmxjcN8H
 rqg==
X-Gm-Gg: ASbGncvKlVfT+v14O5ddeJF+HO099aTXAq20ZeLVAOxVeb+RMhxQuuGhgjmrny+KfYp
 AdFe/nDmr7rNQseIj7XTbyCrAwRIRv2vfghuN0fvimWDXGwFdgCj5GtZ1uRxdrzOeC7mxdCFQjg
 2aSwmGtHZ6AoQpbUrxP2n2tsuYeSB/lR9fKyE6HDtWeQJip/6R0q4g4/KPIIzr9Cz8/yefDmWeT
 uF89NhO+HQ1qbvg7CeeeWE1IHiCciVFDAl87qxQz1/MCGyZJlwtcNWXIr0gGOy/SaNOdEK0qLgj
 nn86VCxOrkZ2eqHavNVeCQiNYVBeX5tniOkNBw9rwGyg6w1qBIjvi3Ou28FURQUcUspWJZOVUvr
 1os/cElqIYPJ6
X-Google-Smtp-Source: AGHT+IFH8V07J0dL6TKMSvPd+lTnibD/U3E62eGcJNPR7IVw1BU7EaU5mhq1SLP8XzgVTh2205dkAQ==
X-Received: by 2002:a05:651c:1614:b0:30d:e104:b67c with SMTP id
 38308e7fff4ca-30de104b7cfmr32585521fa.39.1743460841400; 
 Mon, 31 Mar 2025 15:40:41 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com.
 [209.85.208.181]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30dd2aa9c56sm15169781fa.4.2025.03.31.15.40.39
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Mar 2025 15:40:41 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-30bfe0d2b6dso48377081fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 15:40:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVhxnP5QnWnWBbHm45KOGKGjfCRTF2tep1/HCOcUI3PtJiF0UU0PVtRj1Z03BZjNjnG9wuIEuqosOw=@lists.freedesktop.org
X-Received: by 2002:a2e:b8d2:0:b0:30b:ed8c:b1e7 with SMTP id
 38308e7fff4ca-30de0266e3bmr28654361fa.18.1743460838770; Mon, 31 Mar 2025
 15:40:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250331061838.167781-1-tejasvipin76@gmail.com>
 <CAD=FV=UbUqNf4WoWzqMe5bDQmxiT+bRG_cn0n1dBrkFRijx0Cw@mail.gmail.com>
 <jlqxx47vzlp6rmwpi3tskig4qu4bgyqd7vletxbzzn7xdpep72@42tzrjkg65lh>
In-Reply-To: <jlqxx47vzlp6rmwpi3tskig4qu4bgyqd7vletxbzzn7xdpep72@42tzrjkg65lh>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 31 Mar 2025 15:40:27 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XeHeed5KhHPVVQoF1YPS1-ysmyPu-AAyHRjBLrfqa_aA@mail.gmail.com>
X-Gm-Features: AQ5f1JpOrGXDTZ_nS7pJWSblyYvrcC_GXOuMLBACzEl5VhUwUaaZ1leG8b3O40k
Message-ID: <CAD=FV=XeHeed5KhHPVVQoF1YPS1-ysmyPu-AAyHRjBLrfqa_aA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel: boe-bf060y8m-aj0: transition to mipi_dsi
 wrapped functions
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Tejas Vipin <tejasvipin76@gmail.com>, neil.armstrong@linaro.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, quic_jesszhan@quicinc.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 asrivats@redhat.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Mar 31, 2025 at 1:28=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Mon, Mar 31, 2025 at 08:06:36AM -0700, Doug Anderson wrote:
> > Hi,
> >
> > On Sun, Mar 30, 2025 at 11:18=E2=80=AFPM Tejas Vipin <tejasvipin76@gmai=
l.com> wrote:
> > >
> > > @@ -157,7 +137,6 @@ static int boe_bf060y8m_aj0_prepare(struct drm_pa=
nel *panel)
> > >
> > >         ret =3D boe_bf060y8m_aj0_on(boe);
> > >         if (ret < 0) {
> > > -               dev_err(dev, "Failed to initialize panel: %d\n", ret)=
;
> > >                 gpiod_set_value_cansleep(boe->reset_gpio, 1);
> > >                 return ret;
> >
> > It's not new, but the error handling here looks wrong to me. Instead
> > of just returning after setting the GPIO, this should be turning off
> > the regulators, shouldn't it? That would mean adding a new error label
> > for turning off "BF060Y8M_VREG_VCI" and then jumping to that.
>
> We should not be turning off the regulator in _prepare(), there will be
> an unmatched regulator disable call happening in _unprepare(). Of course
> it can be handled by adding a boolean, etc, but I think keeping them on
> is a saner thing.

Hrmmmm.

The issue is that if we're returning an error from a function the
caller should expect that the function undid anything that it did
partially. It _has_ to work that way, right? Otherwise we've lost the
context of exactly how far we got through the function so we don't
know which things to later undo and which things to later not undo.

...although I think you said that the DRM framework ignores errors
from prepare() and still calls unprepare(). I guess this is in
panel_bridge_atomic_pre_enable() where drm_panel_prepare()'s error
code is ignored? This feels like a bug waiting to happen. Are you
saying that boe_bf060y8m_aj0_unprepare() has to be written such that
it doesn't hit regulator underflows no matter which fail path
boe_bf060y8m_aj0_prepare() hit? That feels wrong.


-Doug
