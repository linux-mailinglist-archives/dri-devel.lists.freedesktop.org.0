Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE523A9E75
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 17:02:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A60FD89FA6;
	Wed, 16 Jun 2021 15:02:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EBA389E86
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 15:02:24 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id f5so1688633qvu.8
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 08:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j51VtbWEsPmNthXDSqqlA/0JAvr0xhkR2POpSAUOx9c=;
 b=ZUIi2qzqYGHwJx+79Fc4944r16x9UMQqqYLtcBz8HCOT0nsZkxfGcmRp23lvyNfAP+
 2knAodSGIE5+PM0wcoqn9rQAvNIbG2+5Sas5+iUH6G+5iioPe8sGy4aqBr4h9MHBFQLA
 j4DhsbCGODeTQCqVCt1gM8KYJ3xJ2R6oiax+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j51VtbWEsPmNthXDSqqlA/0JAvr0xhkR2POpSAUOx9c=;
 b=t1CWr29AoV0Cz1+48RdMVkBcbfMZlQr+CehqIL8dqTVWYiCDBzd9erQGhqWqF1j4XR
 NAlexKmE9892HmpYKFOFBz507XBnWzLj0zfC4QzzkSW/3tzieRF1BYPiNm2Mhpz9jhKJ
 MZOkrZww3sppwd39aQ/ZhYhWCpJeWyUnFjGN2gZrwfZsvAQeTTI/PX2tqH1VzKlp4GS3
 0E7bTioVLORO7tFqwNVWOiB+dYeYmrXVTTZkTEqtWuOkDAV5ZMXEfciuJ6UMVTaVnW+6
 KnS2jBrxJnpjFnna+/12tCBrbqONS4E2hkwG/usxNwRi4+QdhrSB7Eu9sDqAXyGgHkrr
 nOvA==
X-Gm-Message-State: AOAM531/NnXhedm6H0I0kDNuV9lLuC/dPXcjKHGYzdya9VpM1ikzCFFX
 9KnvXRM9KtPgLFOULiAUVeGRiurQvUeLdA==
X-Google-Smtp-Source: ABdhPJxiVLxCtZDovdmpy4OnlxGWui2LBimwWQxNHC992HIjkBY0pYRuvOh9N1c00fkWhsHW6U3yoA==
X-Received: by 2002:ad4:4631:: with SMTP id x17mr474635qvv.28.1623855742470;
 Wed, 16 Jun 2021 08:02:22 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com.
 [209.85.219.170])
 by smtp.gmail.com with ESMTPSA id t11sm1372287qta.8.2021.06.16.08.02.19
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 08:02:21 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id m9so3477086ybo.5
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 08:02:19 -0700 (PDT)
X-Received: by 2002:a5b:54a:: with SMTP id r10mr207252ybp.476.1623855739461;
 Wed, 16 Jun 2021 08:02:19 -0700 (PDT)
MIME-Version: 1.0
References: <1623499682-2140-1-git-send-email-rajeevny@codeaurora.org>
 <1623499682-2140-6-git-send-email-rajeevny@codeaurora.org>
In-Reply-To: <1623499682-2140-6-git-send-email-rajeevny@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 16 Jun 2021 08:02:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V2_LJkXX-9v2ArSspKHy6PABn1E-hkCOeT=Dk5R0CQ+Q@mail.gmail.com>
Message-ID: <CAD=FV=V2_LJkXX-9v2ArSspKHy6PABn1E-hkCOeT=Dk5R0CQ+Q@mail.gmail.com>
Subject: Re: [v6 5/5] drm/panel-simple: Add Samsung ATNA33XC20
To: Rajeev Nandan <rajeevny@codeaurora.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Krishna Manikandan <mkrishn@codeaurora.org>, Sam Ravnborg <sam@ravnborg.org>,
 Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Clark <robdclark@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sat, Jun 12, 2021 at 5:09 AM Rajeev Nandan <rajeevny@codeaurora.org> wrote:
>
> +static const struct panel_desc samsung_atna33xc20 = {
> +       .modes = &samsung_atna33xc20_mode,
> +       .num_modes = 1,
> +       .bpc = 10,
> +       .size = {
> +               .width = 294,
> +               .height = 165,
> +       },
> +       .delay = {
> +               .disable_to_power_off = 150,
> +               .power_to_enable = 150,

As per <https://crrev.com/c/2966167> it's apparently been discovered
that these should be:

.disable_to_power_off = 200,
.power_to_enable = 400,
