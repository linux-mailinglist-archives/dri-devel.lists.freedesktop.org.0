Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C623D1066
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 16:00:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 242A36E96A;
	Wed, 21 Jul 2021 14:00:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E56C76E96A
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 14:00:48 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id f30so3283212lfv.10
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 07:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zsvJRDxyY5UbCVX7sGabd497i4VkHjlUGB0A4qGDBiM=;
 b=blMhE7FHuYJvQ1jjr+eBeAoe0VtX2eu7Ve2CWtDtuuospCBc5iAQLUu0A6jR/ynetF
 SPnplHFagBkDTKPQ7D4dX1CTKIT+Zpq0RGWPMEagc0uYZ66Sd+VQ35EWVZjiRNXHExOn
 FjwJcVQx6m3GkAkZdxYrV1EF0HAKW+t5CI29SFuf5n2wnFPEFo7pgOCzZLaLYJZRPMgs
 Edn645SrSlfVxr4SLzgTjeuM7Frlr+GZ5OFpRZNtLSNy4TCHJfKM0vEY3m2FfgUbP5pi
 5TmpbmrV+zyjRWlnXOYbMXbn93WMk4AWn8PwpwMOCdVj7OFWg9tcDeVD/dOp9o+DDvTM
 dvRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zsvJRDxyY5UbCVX7sGabd497i4VkHjlUGB0A4qGDBiM=;
 b=dyrQLxep/g7ZsOBZZ0e9sXgeYFbBgnBpdzWAHCFyNqMtL40rFiPXcbTqYpIAJwQxid
 RU6Nztkav/Vxv9k+RbST6PL92uFZq0UvvE/BojxiFNzpglutuqAjPPeE00RKdp3fjUHk
 nyuZgQrEFs2qUtTrYKA3BbEpnKfOiwRpJUDE5WIc+SpVNJEV8p8zvAnjUTYhO8TkyYn8
 DeddnXN/K3CDKH6XT09S0WyGSZYYe3L0uA0seoxHg85i4jUWOwbcGV53ZEsmxg2pTbSh
 bGRw2GI9YKSrlUnMAwkMLL8ZD1kyZqO8GJOhad7J75FTWzDKBbNuVbM9im4Bx0x7tGqi
 mUJw==
X-Gm-Message-State: AOAM531+yumwNlz6B3NZ3/pXOSwID8vHrhvR9sCZnhzeugN7qdhFHgK7
 DqJDsblSyN6YTH9ss/Q5ouXGxhmV4I/tPIFSJ/sBLg==
X-Google-Smtp-Source: ABdhPJxEOaTZyJ//VL0xm+qjsBbECijs8kafihDiLsk9j4fdAjhS7j5/f6rj7V9/XmHDPmtM1H58IrDvM4Y9VTGHhKs=
X-Received: by 2002:a05:6512:3f1f:: with SMTP id
 y31mr19471776lfa.29.1626876046329; 
 Wed, 21 Jul 2021 07:00:46 -0700 (PDT)
MIME-Version: 1.0
References: <1626853288-31223-1-git-send-email-dillon.minfei@gmail.com>
 <1626853288-31223-2-git-send-email-dillon.minfei@gmail.com>
In-Reply-To: <1626853288-31223-2-git-send-email-dillon.minfei@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 Jul 2021 16:00:35 +0200
Message-ID: <CACRpkdYerVu_LyNOJoxMTqhuNd9QBSFWTM7bfRnrsOyrxqE_kw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: panel: Add ilitek ili9341
 panel bindings
To: dillon min <dillon.minfei@gmail.com>
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
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Dave Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Doug Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 21, 2021 at 9:41 AM <dillon.minfei@gmail.com> wrote:

> From: Dillon Min <dillon.minfei@gmail.com>
>
> Add documentation for "ilitek,ili9341" panel.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
