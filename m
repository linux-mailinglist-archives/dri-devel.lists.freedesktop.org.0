Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A67746EE3B
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 17:55:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5750B10E30B;
	Thu,  9 Dec 2021 16:53:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46ABC10E116
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Dec 2021 07:07:45 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id v1so16425489edx.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Dec 2021 23:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NW4Te5KT8RywZLAuo2ZfeBAFffXT3U9YKMlaGLK1mhI=;
 b=Q88N14t0tBnLbGIq3e/NPlPtuFANXa6rJURj0gRGgPqfSaOB7tSEOPqld30GzxDv81
 aBOxp2GhUcyBkaqNfZNn4E6drFm2t1GtRxN4Ms78Qz0eaoptMOVuJYloQZg0F+bI77ZF
 N94SB4kUcC8W86uXarfk90mwFfhHVQIWH5CuU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NW4Te5KT8RywZLAuo2ZfeBAFffXT3U9YKMlaGLK1mhI=;
 b=NMsIrhAJJ6s2IbQgZ4Tdwv1phBjtBg6UX3Lz97+aIZsZ9vh/T4nrLVWGttfjiBKLXP
 n5UfzFvxG3c4BN3jgOYOvrRnbbwNw4198Cu3M1Wu/EIBUu0SdlfUz9NnX2WVFUlyo3TW
 dFtng/UzUif3FqvdpN7J3XhYi+ZZC0MWcOvAqgH/uJ06pVWPse5M9jWfunU5BMVv2+BE
 koUBLBSPDktpgwu8d57maJFRZgX33x+o0Scg2/nquLxjWC4DgjUpBvhEf4VHv436Uhkd
 0Ov2rj7VlmvOEIYWgitJcNzPEmOQtdd+c9tDaN+ilMczYpdTPeEz2Orx0oTqn77H18hz
 rPAg==
X-Gm-Message-State: AOAM5338xRPAszMZQ0qaHGvo8bUxvfLKUmllnQyWxThPeV/L1xhV1zJ2
 j16lQJkgVXfwrq4B8XrEQjeh+i3FhkpaA4VOcmPAcQ==
X-Google-Smtp-Source: ABdhPJwY+75DQZYXB+oeBio1GxAeI2nXtnrDaL/tLtJd3UFELFDSODnnKe8N0hbncOE9M1IDExKcWekXwrLqDw3e358=
X-Received: by 2002:a05:6402:1768:: with SMTP id
 da8mr27012500edb.252.1639033663999; 
 Wed, 08 Dec 2021 23:07:43 -0800 (PST)
MIME-Version: 1.0
References: <20211118091955.3009900-1-alexander.stein@ew.tq-group.com>
 <20211118091955.3009900-2-alexander.stein@ew.tq-group.com>
In-Reply-To: <20211118091955.3009900-2-alexander.stein@ew.tq-group.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 9 Dec 2021 12:37:33 +0530
Message-ID: <CAMty3ZA7d9bSvmG4nGd9Lncw9wm6wiAq1pKSOFX03h_BU7JR-A@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: display: bridge: sn65dsi83: Make
 enable GPIO optional
To: Alexander Stein <alexander.stein@ew.tq-group.com>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 18, 2021 at 2:50 PM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> The SN65DSI8x EN signal may be tied to VCC, or otherwise controlled by
> means not available to the kernel. Make the GPIO optional.

Sorry, I couldn't understand what it means. Does it mean VCC enabled
designs no need to enable GPIO? I've a design that do support both EN
and VCC.

Jagan.
