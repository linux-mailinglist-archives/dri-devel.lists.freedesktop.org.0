Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA129405E38
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 22:48:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9DDC6E90D;
	Thu,  9 Sep 2021 20:48:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7F046E90D
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 20:48:43 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id f6so4134561iox.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Sep 2021 13:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FTXjmRnVh0AWFmD0C2i93mdE+aZFUcGRZVLlt4s8n9Y=;
 b=OhG+pWKst3E+Zw2mm2Uo8a8KMFQHCgO3R4jnMcjUih6JySF2ZFiRErhvUxZnuAJeXL
 nKjfbx9KitEtX2Y/fw4VacFgmEiuATD0w/3bVvTLI953fbyet2G/v6ZcKKb3tZgtvpNx
 m4R+dXz/Qa4SeGnhthj47CHw7d5Qbp8Ba0apo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FTXjmRnVh0AWFmD0C2i93mdE+aZFUcGRZVLlt4s8n9Y=;
 b=SuYLKhLcxynIPsqw5IDw23ltHj+w/jK7E7slba2ej2wWAb4XAIRXZK1aoIWcsfjYoI
 KcLMP0VVKcRAb7moRCmxtcxXlU2HKxFxhGJ6ZI1h4brLAXuKwdWBQ1zEk9MHFK67Nwkx
 qEn7EnykQMQ4x5sASydM3IAfFgBK6v2wQfNwfIYg0ExORoy2Y1ZjwL1gz0Cd4ps7nshZ
 m6G8z755WXHR4BgLQUlaNeXAI6UUYWCI1pcqhWWljmJjs5dtdniB1GSbZawcOPBEP0nu
 hTpcUWjPCOH1Y+SS1BbWkf11BL0YkC7TALlk0jZXYRM3i0xPFEC/xQThNuuKKwv8UIhk
 SUSw==
X-Gm-Message-State: AOAM532quQsPUJhjBr4a/I00cdAkkmibo+qvLGxuAykUG8HWZDriikdN
 aUohj8thwMn9DL1cbYKliveDHQtkp7qz6w==
X-Google-Smtp-Source: ABdhPJzQzFc0E3KRMjT7bpPUFQFnJTIAYx7TTpSY4WzUrewfpFMkxGXo/JWdycgITmY6h5BbaUqUcQ==
X-Received: by 2002:a02:9082:: with SMTP id x2mr1574241jaf.44.1631220522771;
 Thu, 09 Sep 2021 13:48:42 -0700 (PDT)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com.
 [209.85.166.44])
 by smtp.gmail.com with ESMTPSA id a16sm1471110ili.64.2021.09.09.13.48.40
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Sep 2021 13:48:41 -0700 (PDT)
Received: by mail-io1-f44.google.com with SMTP id j18so4073938ioj.8
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Sep 2021 13:48:40 -0700 (PDT)
X-Received: by 2002:a05:6602:1346:: with SMTP id
 i6mr4202804iov.128.1631220520134; 
 Thu, 09 Sep 2021 13:48:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210901201934.1084250-1-dianders@chromium.org>
 <20210901131531.v3.4.Ib2bdeceb8ce45d36c09f5d1ae62a2263276a0605@changeid>
In-Reply-To: <20210901131531.v3.4.Ib2bdeceb8ce45d36c09f5d1ae62a2263276a0605@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 9 Sep 2021 13:48:28 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XuABPeHXaCrSb+KDX-5CEgnmZFJSJF8nGg5b58-ySWkw@mail.gmail.com>
Message-ID: <CAD=FV=XuABPeHXaCrSb+KDX-5CEgnmZFJSJF8nGg5b58-ySWkw@mail.gmail.com>
Subject: Re: [PATCH v3 04/16] drm/panel-simple: Reorder logicpd_type_28 /
 mitsubishi_aa070mc01
To: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Linus W <linus.walleij@linaro.org>, Daniel Vetter <daniel@ffwll.ch>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Steev Klimaszewski <steev@kali.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>, 
 LKML <linux-kernel@vger.kernel.org>
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

On Wed, Sep 1, 2021 at 1:20 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> The "logicpd_type_28" panel data was splitting up the
> mitsubishi_aa070mc01 panel data. Reorganize it so that the panel descs
> and modes are kept together.
>
> This is a no-op code-cleanup change, found by code inspection.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v3:
> - ("Reorder logicpd_type_28...") patch new for v3.
>
>  drivers/gpu/drm/panel/panel-simple.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)

I've pushed just this one patch (with Sam's Ack from the cover letter)
just to simplify future posts. It's pretty much a no-brainer patch and
there are no dependencies anywhere for it.

c8527b9ad3cf (drm-misc/drm-misc-next) drm/panel-simple: Reorder
logicpd_type_28 / mitsubishi_aa070mc01


-Doug
