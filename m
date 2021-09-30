Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6454541D207
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 05:56:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 458336EB16;
	Thu, 30 Sep 2021 03:56:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6F52887C7
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 03:56:33 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 d12-20020a05683025cc00b0054d8486c6b8so5703036otu.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 20:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=pbICwdgUqYk+MY3CjajdFyZDTldPCutWBH9nPk1NU9M=;
 b=dYYg+xr2qgVzVQpnw1vKySEYeTZUMyLCO3IjCFtkwCbD9pKzqZBm0wXSYwHIqbVnZB
 j6j/az0gTXbKp/PPg7uz9Ed09jHYplqn0gK7ylwDo/7ULm7qTckwzVEwAQxTaMQ02IEW
 qPujZVK/wt6fs6hmVDo6J410aSqfL7yzXjTro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=pbICwdgUqYk+MY3CjajdFyZDTldPCutWBH9nPk1NU9M=;
 b=C+cj38BKiaF9oJrx6gNcpm5kvDHU+msl/ju7whpKkEkVgz2f37Hn9w7qF7C+EK1ZVi
 HANWstJOr5T0lIrFW/NPmpttsdxThQGV65b2OKuPX2us6Z2j/pqGhVBNm9P1+d23Oizy
 WW0E8uwdbN+qE+CyepqvfJl2ydO8n+I9PCeaT37XUy6B56P+AR7n9O1rXTQE0oiw0JaW
 hE7WJfMuJI/q2aNzVK5VF2SQRgDG+OdoSZdzrXwKOnSN13hApCJd3/SipB+aRm5FnHXY
 iDxmn0k1NXCFuZQm3MTUaVAhS1fgh1+BBMl5YFdapSh8yEKsM751gN9LBhzgD7AEkUJF
 FZHg==
X-Gm-Message-State: AOAM532TxcolHgUhjrYUjgG9d6qcUA0uTsi9HnGCLxEkZ8ltMWBYEzci
 5dGr3yK7N+ISvQ1HhqLFTsNaYqux8bv2GiVjNHcpVA==
X-Google-Smtp-Source: ABdhPJyg5d3ErOcJIXToSHSHSONJcSYacRkFBefewskavVwKz804P1gLqh9+QSY2AHtW62MgsT4klS34ZxzhA+GxzKA=
X-Received: by 2002:a05:6830:358:: with SMTP id
 h24mr3010200ote.159.1632974193021; 
 Wed, 29 Sep 2021 20:56:33 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 29 Sep 2021 20:56:32 -0700
MIME-Version: 1.0
In-Reply-To: <20210929173343.v2.2.I6050ba184b24d887e92692a72ee3054d643d6091@changeid>
References: <20210929173343.v2.1.Ib7e63ae17e827ce0636a09d5dec9796043e4f80a@changeid>
 <20210929173343.v2.2.I6050ba184b24d887e92692a72ee3054d643d6091@changeid>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 29 Sep 2021 20:56:32 -0700
Message-ID: <CAE-0n51sDbBfS82K7pY_yvWEQYdBVheqtzZcNVm16AZxaFMTng@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: drm/bridge: ps8640: Add aux-bus child
To: LKML <linux-kernel@vger.kernel.org>, Philip Chen <philipchen@chromium.org>
Cc: dianders@chromium.org, Balletbo i Serra <enric.balletbo@collabora.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Lee Jones <lee.jones@linaro.org>, 
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Sam Ravnborg <sam@ravnborg.org>, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
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

Quoting Philip Chen (2021-09-29 17:34:57)
> dp-aux-bus.yaml says we can list an eDP panel as a child of
> an eDP controller node to represent the fact that the panel
> is connected to the controller's DP AUX bus.
>
> Let's add it to the ps8640 bindings.
>
> Signed-off-by: Philip Chen <philipchen@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
