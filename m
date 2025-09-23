Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E5DB968E3
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 17:23:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10FA710E202;
	Tue, 23 Sep 2025 15:23:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="mYUvajAU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B7210E202
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 15:23:32 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-76e6cbb991aso4750057b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 08:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1758641011; x=1759245811;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oOzyUryAW2PcUwkR2rwYRfULL04GmVoUwMgRRRRXNBY=;
 b=mYUvajAU/v1EKK01juKzxU+AfXLDkQpxMbbuResoLwZzg5Ed6ahiz7HvJjkQkIr5wm
 11lzQDpmNu/mIVacPJT8uOR2aHA7IxYiYj4u8REdyLFZO4NvytwM9G4eOedQ2ELLmej9
 6ZzvcwqQLAhhiSCu/0AXFeNMAZ5J3MVmsoIU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758641011; x=1759245811;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oOzyUryAW2PcUwkR2rwYRfULL04GmVoUwMgRRRRXNBY=;
 b=MDLvMCb5r4Q5HHR1S1Fkid2clxbNIQdKw9fEu1XweLsUo14NLgOwjOQU0bjQtvAi30
 FONZBQcB9Uy45ENebLxjWEiqjUjyyKqcmmx9zwY8FHZlp3kLvcH+VSoWuDgh6l5J5S60
 jRWr7E5FwSBest55X4U9TTwtosihrE9D7lxIGlZGCr1fefxXkcAJEpOCLUtd8lPjOt5i
 WTkJHc1SzBZo9nrGEBLjeUlKyVqWMAw6qye8cKeQm3HytwnYmtHm4GAn8e42YV+qlmhW
 p/MbNAqJUms7tuI+tk17SlTDrOGrhiMHO64LnqfKBKcSDA+ZQyxwvMXORdOACXL5jqq5
 VHmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVv+CyiuO+tMCvCplQnhfIGfHdmKZv+n8dDDzd7+kMKV2lrZr6LAaC87hOolZRaUX2o/zrfs0BoyIY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YylWmDq7m8T1WRnR4r+elQwh0PgItb2uZ/lW7Q+tWFpsrvGpP14
 EqBH5sz78dG3uEIVGjQ/D0ydLcgdAX5xNikZDyCK95R8O1pgIVGf5VgwBc4+wQD/5TJlwGvUToJ
 P7f0=
X-Gm-Gg: ASbGncssIuGd0EbWNGjrNC8oN3KAocUijz+dl7sAafAfpno8m1MHcxvCQ2Bx2QCSHSL
 DxBisxK26lzHEMY31E+ykJ/Ydf/HVokF78KRbzbuetIrtS+WQ3WWmFfLcVRPnrFA87W7HbHbcnl
 dZt2Sb1EIvehIHO71/YI2fowCEnYiiEQcRQT/P8AMlhBnhPvqpo+zzU8/JTgl8g6zvqZ6woJ4o5
 LCdsK+jvbGBTj9n9YUyeCVnGbMK5LXN+YyZJRkRgr1O2UvvUs/+Dscm/l63H0d2CXj2MH4JgwNo
 PXRwuWJgh5Jz4a6E5n146oGAH+unU0TLbhbfXXbhtUYIyrRIApym2fix7wdHoaHJCnAyhcV8Akl
 9wBwmPobC9SGXfFfT7FTgaI1NX+2bFykEOovP+A5qwF8j69iGECZp0DyhfNa+vGNDYqI6XqVTI2
 fy
X-Google-Smtp-Source: AGHT+IHscDVMhUtQF9IB0M3PVGUCsDj4EPD96DRVqjU6cqLwo8rNKMznW12GJ5N7QhXfvjHG+vPPXg==
X-Received: by 2002:a05:6a00:2da5:b0:77f:4a83:8f9 with SMTP id
 d2e1a72fcca58-77f53858a44mr3866626b3a.2.1758641010898; 
 Tue, 23 Sep 2025 08:23:30 -0700 (PDT)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com.
 [209.85.215.178]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77f5eb087b4sm1123695b3a.76.2025.09.23.08.23.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Sep 2025 08:23:29 -0700 (PDT)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-b4c1fc383eeso3833481a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 08:23:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVoxxB+jFhE4tvXaN2j43LJL13JlgZR2gv+8qS6f03PWuYG2nDzdFVFw4Gm2QBmR85xnIjG0scL9Gs=@lists.freedesktop.org
X-Received: by 2002:a17:902:da83:b0:268:5892:6a2e with SMTP id
 d9443c01a7336-27cc9f5d729mr34898035ad.56.1758641008349; Tue, 23 Sep 2025
 08:23:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250915165055.2366020-1-john.ripple@keysight.com>
 <20250915174543.2564994-1-john.ripple@keysight.com>
 <CAD=FV=Xhd+0ZsUE3pkkii-Gijrwx0_Oh6WfRKrutqPQT3Jm_rA@mail.gmail.com>
In-Reply-To: <CAD=FV=Xhd+0ZsUE3pkkii-Gijrwx0_Oh6WfRKrutqPQT3Jm_rA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 23 Sep 2025 08:23:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WkvqRwOPJE9Jnjv1Bpde_ZKQ=crPTKgZLgWrjZO=e5dg@mail.gmail.com>
X-Gm-Features: AS18NWDCNAxWqU3shx8ybqX4YZuREmtbu0ce5ordOjrPqtwQMdsjdMtRaPtv8DE
Message-ID: <CAD=FV=WkvqRwOPJE9Jnjv1Bpde_ZKQ=crPTKgZLgWrjZO=e5dg@mail.gmail.com>
Subject: Re: [PATCH V7] drm/bridge: ti-sn65dsi86: Add support for DisplayPort
 mode with HPD
To: John Ripple <john.ripple@keysight.com>
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com, 
 andrzej.hajda@intel.com, blake.vermeer@keysight.com, 
 dri-devel@lists.freedesktop.org, jernej.skrabec@gmail.com, jonas@kwiboo.se, 
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
 matt_laubhan@keysight.com, mripard@kernel.org, neil.armstrong@linaro.org, 
 rfoss@kernel.org, simona@ffwll.ch, tzimmermann@suse.de
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

On Mon, Sep 15, 2025 at 10:57=E2=80=AFAM Doug Anderson <dianders@chromium.o=
rg> wrote:
>
> Hi,
>
> On Mon, Sep 15, 2025 at 10:46=E2=80=AFAM John Ripple <john.ripple@keysigh=
t.com> wrote:
> >
> > Add support for DisplayPort to the bridge, which entails the following:
> > - Get and use an interrupt for HPD;
> > - Properly clear all status bits in the interrupt handler;
> >
> > Signed-off-by: John Ripple <john.ripple@keysight.com>
> > ---
> > V1 -> V2: Cleaned up coding style and addressed review comments
> > V2 -> V3:
> > - Removed unused HPD IRQs
> > - Added mutex around HPD enable/disable and IRQ handler.
> > - Cleaned up error handling and variable declarations
> > - Only enable IRQs if the i2c client has an IRQ
> > - Moved IRQ_EN to ti_sn65dsi86_resume()
> > - Created ti_sn65dsi86_read_u8() helper function
> > V3 -> V4:
> > - Formatting
> > - Allow device tree to set interrupt type.
> > - Use hpd_mutex over less code.
> > V4 -> V5:
> > - Formatting.
> > - Symmetric mutex use in hpd enable/disable functions.
> > - Only set and clear specific bits for IRQ enable and disable.
> > - Better error handling in interrupt.
> > V5 -> V6:
> > - Formatting.
> > - Convert pr_ to dev_ for printing.
> > - Add error check to regmap_clear_bits() call.
> > V7:
> > - Move status check in interrupt.
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 112 ++++++++++++++++++++++++++
> >  1 file changed, 112 insertions(+)
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> I'll plan to apply to drm-misc-next next week unless anything else comes =
up.

Pushed to drm-misc-next:

[1/1] drm/bridge: ti-sn65dsi86: Add support for DisplayPort mode with HPD
      commit: 9133bc3f0564890218cbba6cc7e81ebc0841a6f1
