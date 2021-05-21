Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7229E38D19C
	for <lists+dri-devel@lfdr.de>; Sat, 22 May 2021 00:35:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1899B6E898;
	Fri, 21 May 2021 22:35:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A5766E888
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 22:35:48 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id i5so14164237qkf.12
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 15:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WEqIhehtX3XDC7PP2eVobDGRw6p6kTjaOI2qEmTi9LY=;
 b=JuWjpEhic+xV1ZNrO7nGh7+zj/LoH1+GnTZhdGcEFUKEx3kh89A9Gbnykica6aRKHx
 YHO4f626GsAaCScaIHoGQzsXlhk5ZUuyj5XUAzDPZJ73XA5aXQeviDZF9fzCVIrJgc0R
 j6Kxwmj/OOdTTyL2+ZNMLOdRqMdTCn3PJ2+Wc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WEqIhehtX3XDC7PP2eVobDGRw6p6kTjaOI2qEmTi9LY=;
 b=s2B1goaLtfbOqh/rH7dpJh/0fUXPFO/8ufmpNwZ1SpHLf2LJCyWc4PnEhf8cH0YZfo
 aMTJCnnquJvukyoY5gcYwJ4M8AmjQaDfm8ChxVW0RFVt6h15Szfhnp9VNOyLdRmro8j4
 cOufdqRpCU8EuUC5SvHs4S4aVLceRN7iw53akABHkllesstvK4aX1mGC6Y3GwXIjkidV
 ygFIeJkYvdUmc5paN6b0C7O4VP0H1Wk4ebqEt0aW5eu04BhGSb7hb6oVTZs3qxA/HEZo
 B1+coaO8qnZ2WfICiTQY3X1mZFmuGsi7LWTLbkhk5fFMPxWImc55ixIYGq1zN6yeSJih
 Dbmg==
X-Gm-Message-State: AOAM532u4XXZRato2IuFCst1tc+QAsBtRv9x7/q2VtHzwpHw9s8Dsbk2
 a0Yy9jQXensJGkjpO3J/e9WAiFl1mDXEhg==
X-Google-Smtp-Source: ABdhPJwLr4u5j3MenpoHnEWZ4yeYXziwFXoOHDExkHZnAxYeWqeKn5DJx0sGFySsE1XV8PGUdAtBZw==
X-Received: by 2002:a05:620a:16d8:: with SMTP id
 a24mr161131qkn.34.1621636546767; 
 Fri, 21 May 2021 15:35:46 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com.
 [209.85.219.173])
 by smtp.gmail.com with ESMTPSA id k10sm5210415qtm.73.2021.05.21.15.35.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 May 2021 15:35:45 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id y2so29468791ybq.13
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 15:35:45 -0700 (PDT)
X-Received: by 2002:a25:80d4:: with SMTP id c20mr19007986ybm.345.1621636545135; 
 Fri, 21 May 2021 15:35:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210521134516.v2.1.Id496c6fea0cb92ff6ea8ef1faf5d468eb09465e3@changeid>
 <CAE-0n52xEDak4-vuJQ6SQz83F54-oTm+TjeVJ_0GoezG8O_M5Q@mail.gmail.com>
In-Reply-To: <CAE-0n52xEDak4-vuJQ6SQz83F54-oTm+TjeVJ_0GoezG8O_M5Q@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 21 May 2021 15:35:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XfwoNZ13TAq=vd1Am8jLwOS5c3R0z_wsydL4NLo7WtkA@mail.gmail.com>
Message-ID: <CAD=FV=XfwoNZ13TAq=vd1Am8jLwOS5c3R0z_wsydL4NLo7WtkA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm: Use nvmem_cell_read_variable_le_u32() to read
 speed bin
To: Stephen Boyd <swboyd@chromium.org>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, YongQin Liu <yongqin.liu@linaro.org>,
 Sean Paul <sean@poorly.run>, LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, May 21, 2021 at 3:02 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Douglas Anderson (2021-05-21 13:45:50)
> > Let's use the newly-added nvmem_cell_read_variable_le_u32() to future
> > proof ourselves a little bit.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > The patch that this depends on is now in mainline so it can be merged
> > at will. I'm just sending this as a singleton patch to make it obvious
> > that there are no dependencies now.
> >
> > Changes in v2:
> > - Rebased
> >
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > index b4d8e1b01ee4..a07214157ad3 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -1403,10 +1403,10 @@ static int a6xx_set_supported_hw(struct device *dev, struct a6xx_gpu *a6xx_gpu,
> >  {
> >         struct opp_table *opp_table;
> >         u32 supp_hw = UINT_MAX;
> > -       u16 speedbin;
> > +       u32 speedbin;
> >         int ret;
> >
> > -       ret = nvmem_cell_read_u16(dev, "speed_bin", &speedbin);
> > +       ret = nvmem_cell_read_variable_le_u32(dev, "speed_bin", &speedbin);
>
> I missed the review of this API, sorry.

You commented on the patch that added it, though? Oddly I can't find
your commit on lore.kernel.org (?), but it's in my inbox...


> I wonder why it doesn't return
> the value into an __le32 pointer. Then the caller could use
> le32_to_cpu() like other places in the kernel and we know that code is
> properly converting the little endian value to CPU native order. Right
> now the API doesn't express the endianess of the bits in the return
> value because it uses u32, so from a static checker perspective (sparse)
> those bits are CPU native order, not little endian.

I think it's backwards of what you're saying? This function is for
when the value is stored in nvram in little endian but returned to the
caller in CPU native order. It would be really awkward _not_ to
convert this value from LE to native order in the
nvmem_cell_read_variable_le_u32() function because that functions
handles the fact that the cell could be specified as several different
sizes (as long as it's less than 32-bits).

-Doug


-Doug
