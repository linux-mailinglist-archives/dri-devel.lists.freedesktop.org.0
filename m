Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDB35B5C37
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 16:30:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44DD110E587;
	Mon, 12 Sep 2022 14:30:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5354510E587
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 14:30:08 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id s11so4610638ilt.7
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 07:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=Gma6d5BlyXEKnjQsnnu5KmSUsV/V+0uYpySeCVOzahM=;
 b=mb1F1tRoLU+2X2uBFEA5tHgs0j28pnRartJzBt0Ow8kcF8BxzHePc/0cnIxzE6PYv1
 RDNTI7aA4u0OaXC1ns9sywci1oQ3dibmRtBsRyeAGvxUzduBPeKzXsmZtCbH+MnitP4u
 SA7NHFNHWRU6quzuVh+Fc2m2BmYzPa9EhiVNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=Gma6d5BlyXEKnjQsnnu5KmSUsV/V+0uYpySeCVOzahM=;
 b=14AhXT8b8Qdncy14PgPDKCm4wIvMtlh5xcxGfBYCrSPh79MpZHuGLHWmwSoY1k1e0x
 oFMuU1f2ntRwBoadGFWu3FdqsUP4otXDIHuEUXnAQdcEmLhg4EzGqIkIgrhOGuhgP+JF
 ceoGLU4YhJp/fJeLJHF7IFAQbNvkQzQwgllL7wcCwAcElJB03eXwxSmbUJmwnUnk0Xh1
 PD6FDUeIOJ/2Y2ZfGCyT5CqIQ18etcfaHOCDlnWhDgCXslK7NZ3t9zvSwFA8kzQYiBpc
 RVEAIWTjq8nfgN4JHwoeHMAzl56hEUfKtfv4O2FMbeZeuca4v6LCGFUuD94WHuaRUOoi
 tPIA==
X-Gm-Message-State: ACgBeo3+hzKPqrECsTkzcKcJ91Iw/+KcrrapC2YMK/oovHEHgFo89xgl
 no/dMXaPZMwOAK5QO2/axYkjq0c7gLSTtmpu
X-Google-Smtp-Source: AA6agR42HSYaLMkqMKcZgFJPS0Jq2yrpCaXWkrTaz7uzv7z7FZ+o1gR0IxIg21YDwvLf90gKSi4JOQ==
X-Received: by 2002:a05:6e02:194a:b0:2eb:7105:dd65 with SMTP id
 x10-20020a056e02194a00b002eb7105dd65mr10492008ilu.20.1662993006985; 
 Mon, 12 Sep 2022 07:30:06 -0700 (PDT)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com.
 [209.85.166.46]) by smtp.gmail.com with ESMTPSA id
 k5-20020a0566022d8500b006a0d4a46588sm4257289iow.49.2022.09.12.07.30.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Sep 2022 07:30:04 -0700 (PDT)
Received: by mail-io1-f46.google.com with SMTP id h194so5286914iof.4
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 07:30:04 -0700 (PDT)
X-Received: by 2002:a05:6638:1c17:b0:35a:151b:c726 with SMTP id
 ca23-20020a0566381c1700b0035a151bc726mr6077471jab.66.1662993004103; Mon, 12
 Sep 2022 07:30:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220912113856.817188-1-robert.foss@linaro.org>
 <20220912113856.817188-3-robert.foss@linaro.org>
In-Reply-To: <20220912113856.817188-3-robert.foss@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 12 Sep 2022 15:29:52 +0100
X-Gmail-Original-Message-ID: <CAD=FV=WrH2AAFxV72FZqk-=xU8jzCn6KtcbZRYJAaCwhmvSWmg@mail.gmail.com>
Message-ID: <CAD=FV=WrH2AAFxV72FZqk-=xU8jzCn6KtcbZRYJAaCwhmvSWmg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] Revert "drm/bridge: ti-sn65dsi86: Implement bridge
 connector operations for DP"
To: Robert Foss <robert.foss@linaro.org>
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
 <devicetree@vger.kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Chris Morgan <macromorgan@hotmail.com>, LKML <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Robert,

On Mon, Sep 12, 2022 at 12:43 PM Robert Foss <robert.foss@linaro.org> wrote:
>
> As reported by Laurent in response to this commit[1], this functionality should
> not be implemented using the devicetree, because of this let's revert this series
> for now.
>
> This reverts commit c312b0df3b13e4c533743bb2c37fd1bc237368e5.
>
> [1] https://lore.kernel.org/all/20220902153906.31000-2-macroalpha82@gmail.com/
>
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 28 ---------------------------
>  1 file changed, 28 deletions(-)

Any chance you got confused and reverted the wrong patch? This
ti-sn65dsi86 patch doesn't seem relevant to the problems talked about
in the commit or the cover letter. Maybe I'm missing something?

-Doug
