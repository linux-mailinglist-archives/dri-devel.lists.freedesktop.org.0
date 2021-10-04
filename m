Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6066E42140D
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 18:26:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E147A6E1CE;
	Mon,  4 Oct 2021 16:26:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8ED56E1CE
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Oct 2021 16:26:21 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id j2so6439630ilo.10
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Oct 2021 09:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zwhqowoXzJuFipJCtXxoOJgFbLCEZ6oYYj5nkHsrECU=;
 b=MjEdSbK7Tf/fjpwb7Yk8F5uzjjTjzIGJNCAM0AEiXbPEAqmsbThEErq1rFhLkU0Pta
 d5vOOgij05XSR2qDWiwkwKR3oszOUa03sJ7u/knuZOTnSnBXzQwUSxHHz65obtXMIARC
 64mx8oYDuueywYKk07LC4kFvOT9gQI7XVr05I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zwhqowoXzJuFipJCtXxoOJgFbLCEZ6oYYj5nkHsrECU=;
 b=mPZS9At0et9kQkEY8oCA8Gh+P6UadbGnY4esNEQhtV7bOJYNvMcQzZ11vASrYZI1HC
 bWpT9aHslOvus2MdO01RwzbZ4BQ3ZYHPvvuCInyj+/akDb43FhVrtyg4ZecpR0j2+xMv
 FeA6VYjJ9tzn03ZbvovzKQKJFxC0blbiNPSYDsT8Uvp+Evy0nY6Jo6PJJFTX+EyPoTZk
 zl7Ws6lJaASP90KsMnGqOFIU7mDFpmOMS+eaheY3wLUW1zfLOu5lZfP+HBlrpZo9ibLL
 278IHwMCTmU4NclSnsB92d8b/hkjPzsmoVyA4oanzFyXQHon9tZRvTZGA4r36u0Koukz
 PKOQ==
X-Gm-Message-State: AOAM532iLZEsS8tkaT32LnD/Hx4+iRjKk9dP2D3XYztz2KHa4LYt1r2N
 HtLUyDdB8l3wa9qcJnM0AZVQrnXMp+mg9A==
X-Google-Smtp-Source: ABdhPJwRr0FgMH11viEo5SE6+Cjj/COm1yQcAB+0qFt7Dz1bqIDKi8ZHFFoiksa0JuaMHS1Fp0ZsMQ==
X-Received: by 2002:a05:6e02:2167:: with SMTP id
 s7mr10787325ilv.113.1633364780700; 
 Mon, 04 Oct 2021 09:26:20 -0700 (PDT)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com.
 [209.85.166.46])
 by smtp.gmail.com with ESMTPSA id f16sm1994021ilr.2.2021.10.04.09.26.19
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 09:26:19 -0700 (PDT)
Received: by mail-io1-f46.google.com with SMTP id y197so20958767iof.11
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Oct 2021 09:26:19 -0700 (PDT)
X-Received: by 2002:a6b:6a0c:: with SMTP id x12mr9867780iog.177.1633364778729; 
 Mon, 04 Oct 2021 09:26:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210914202202.1702601-1-dianders@chromium.org>
 <20210914132020.v5.2.I62e76a034ac78c994d40a23cd4ec5aeee56fa77c@changeid>
 <CAMuHMdWy+aASNevg8nc9LTvR9QNrGYZQnB3sYYLDRfEU1w_idg@mail.gmail.com>
In-Reply-To: <CAMuHMdWy+aASNevg8nc9LTvR9QNrGYZQnB3sYYLDRfEU1w_idg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 4 Oct 2021 09:26:06 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W07iZigvNaxv1WodhQZVm8hD-1NxTuBuapJYifi6ROng@mail.gmail.com>
Message-ID: <CAD=FV=W07iZigvNaxv1WodhQZVm8hD-1NxTuBuapJYifi6ROng@mail.gmail.com>
Subject: Re: [PATCH v5 02/15] drm/edid: Break out reading block 0 of the EDID
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Steev Klimaszewski <steev@kali.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Linus W <linus.walleij@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard <mripard@kernel.org>, 
 Jani Nikula <jani.nikula@intel.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Oct 4, 2021 at 8:42 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> > -       if ((edid = kmalloc(EDID_LENGTH, GFP_KERNEL)) == NULL)
> > +       edid = (u8 *)drm_do_get_edid_base_block(get_edid_block, data,
> > +                                               &connector->edid_corrupt,
> > +                                               &connector->null_edid_counter);
> > +       if (IS_ERR_OR_NULL(edid)) {
> > +               if (IS_ERR(edid))
>
> So edid is an error code, not a valid pointer...
>
> > +                       connector_bad_edid(connector, edid, 1);
>
> ... while connector_bad_edid() expects edid to be a valid pointer,
> causing a crash:
>
> Unable to handle kernel NULL pointer dereference at virtual address

Sigh. Thanks for the report and analysis. I guess I don't have any
displays reporting invalid EDIDs to test with. Hopefully this will
help:

https://lore.kernel.org/r/20211004092100.1.Ic90a5ebd44c75db963112be167a03cc96f9fb249@changeid/

-Doug
