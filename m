Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C50093E376E
	for <lists+dri-devel@lfdr.de>; Sun,  8 Aug 2021 00:41:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECEC689C37;
	Sat,  7 Aug 2021 22:41:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2797389C37
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Aug 2021 22:41:43 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id h11so2643079ljo.12
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Aug 2021 15:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6hVw1r1xpEEInLXXoh33JupWqqEySNuELXLxCfeyrys=;
 b=RcsslV0xypOfQvV0lHtWdMMrmMoto9aibjGdTKlZ6OdVZsgthRLJWU3VBcar1WBu+4
 4WNOvmiLtnedt0KjCDiLGHCiTAYaHWeAy3WzUhsOAHFMgQ4Too5QCUh/bvkR6NhoA5Fd
 LV1ILblpt2cVewmiYg1QYCSstJjV44chQKGk5SqAAQu8Tf3cf4DIuYTf7wQaJH738Pi7
 zJdbwmXNUrknrCJJUUSZBTqyyNJYPbshkfB+aGmZpC584KtfGFHijNmxng9tENAQ7P23
 CNnM8jDfIwB2A3eY1JCSZi26mba09h4ol+UnZluoX0KCHKCK0Qw6eCpDrM76M3h5ucFD
 vrDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6hVw1r1xpEEInLXXoh33JupWqqEySNuELXLxCfeyrys=;
 b=nZ/E0yuzwbo7z0E96D+7/gSgMwhRUUexUJvIU/bT3g9WGHcG9WI/M+Dyy94GsubHci
 Vh8za/gE7FSVKBzjTBgBkUmrIjVW7dfSsquNxhi3PVb9DXq2ie6QL0Fc93Vv+HUTNFpM
 7yARhvn+85PANZg3DPPWq4QyeI0mUuGDpaxfeURu8EYaduLcJiilL4mmcoGvtaMf1/18
 WD5jq1AzNYAsbpMMLk31ogtcLmpWqfksYFVq9QAQDSQNoLcennrWScmZMR3OUGhqa17V
 KwkMNx0HQLkRcz7ZrNA6p+nVt9YWAuru+r3waQEKSVCTlXj9sKL4XzDSHwwCftLRbiqN
 1uAg==
X-Gm-Message-State: AOAM532/k5c2QW52mNIlkoKBjyBJwJka3hXOdD72sVN/oe+Wf2D3agAv
 UuggtzqWw7bTjm+CBAXkZVt2OhJj2BSshHr6WdmF4A==
X-Google-Smtp-Source: ABdhPJwJvd9YehjH3Z7NxGJZ4qtVeQRm9MP0I86bEkJjIUPV/Ii2uwT9draQbeHYvx/NrjwYUO1yGuqblYUBqBwqnxw=
X-Received: by 2002:a05:651c:1318:: with SMTP id
 u24mr10696662lja.200.1628376101474; 
 Sat, 07 Aug 2021 15:41:41 -0700 (PDT)
MIME-Version: 1.0
References: <YQw7M7OF6OZLcLjk@ravnborg.org>
 <20210807133111.5935-1-markuss.broks@gmail.com>
 <20210807133111.5935-2-markuss.broks@gmail.com>
In-Reply-To: <20210807133111.5935-2-markuss.broks@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 8 Aug 2021 00:41:30 +0200
Message-ID: <CACRpkda5CX2AVh4=Kt7Fn_6TrW7btX0Vqb30-60SMG5u05JBgg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/panel: Add DT bindings for Samsung S6D27A1
 display panel
To: Markuss Broks <markuss.broks@gmail.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, 
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 Dave Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, phone-devel@vger.kernel.org
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

On Sat, Aug 7, 2021 at 3:31 PM Markuss Broks <markuss.broks@gmail.com> wrote:

> This adds device-tree bindings for the Samsung S6D27A1 RGB
> DPI display panel.
>
> Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
>
> v1 -> v2:
> changed additionalProperties to unevaluatedProperties;
> added vci-supply and vccio-supply as required;

These bindings look good to me:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Will give DT reviewers some slack before applying the patches.

Yours,
Linus Walleij
