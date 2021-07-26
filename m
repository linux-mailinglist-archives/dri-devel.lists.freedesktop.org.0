Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CCA3D549E
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 09:51:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C476E7F1;
	Mon, 26 Jul 2021 07:51:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 770C76E7F1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 07:51:52 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id h2so13904618lfu.4
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 00:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tl2Qb0EKguXyf5h8TxK4SArC6xikKxHnxlhb/8NDBjU=;
 b=SJHjCQuZMhGwfSeBQR4L3rLs4VKbZBIccH4gbeOpHW/BVx9udpZqj3o5j4DamFiThs
 bL3DoUZ+QIe+BBc8VIGzcnq9VL9tZwhOFjJQ0ct/oBnk6IBt2m8uNn3ij/V4uVTCbB/I
 a2oKvN6mtEMrrv7I6NDBFPxM6M0GYo6j1AidMxfK/PI2ZHyQ9YTLjQpjb/rVju8Jzlm5
 o4LcynEEzM6JW4JdO7q869QoR6NlATPMYcx+0ry/dEm2tp4+dFJm3XbbuTvudA3x4OoT
 il/ybokPAQM1uspu1uQHrT8Ey5CTSZd6Qy4HULrad+F3jUw7XtoAZOZmlmTuuZzCkzlQ
 pbNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tl2Qb0EKguXyf5h8TxK4SArC6xikKxHnxlhb/8NDBjU=;
 b=D6ykN8psJEfzVevIJ1vwKk8/TuoJvvlkNIrDH8dTjSGekLLp5gJbFPsoYW1cDtr8aK
 GPbxgCSuNZcXNRtyPMAu42I9+6A7b+0/WGVfYlrc3G3PHrAHonJjYWUCzXUTDeE+I727
 sbyy10iLxIy8Ms19SQT+bVtA5D0Bdnkzo5XcrQ3Thv+a01I/3tAOiwvfW1z5oDFEQbQr
 ZWPhSpmgmlly2RseNMOVMaOVHNcxJ6xWZ5DyklXQ/5U2asfLWQs0XKhGP4NXUuEZ9kfU
 e1vlSSP63jv6C7LLLGVdrdZvkfZpCU/0oFgasgu6LeGAdyoSgmTM5JAfswCCA29s+f+3
 kzcg==
X-Gm-Message-State: AOAM5316kgjn/qKo0hMngosxGGz7v7VuUot3IFBLnWad9hRv8v5eYUV2
 o0ElBxF8aAGN8dIQy6yF9nRgl/zPA+WkoIDt+/diKg==
X-Google-Smtp-Source: ABdhPJwFuU0c5xqlk1yTtibDz1IgPDEmmXCYuw65z4qIHjRgBY4Kzw60Mk8OvTtY2M2qeI14uN2CY31KocEm2fVHUis=
X-Received: by 2002:a05:6512:3696:: with SMTP id
 d22mr12343175lfs.586.1627285910999; 
 Mon, 26 Jul 2021 00:51:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210725140339.2465677-1-alexeymin@postmarketos.org>
In-Reply-To: <20210725140339.2465677-1-alexeymin@postmarketos.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 26 Jul 2021 09:51:40 +0200
Message-ID: <CACRpkdaaQeuVqJbczHndsgmmMv0NycwRDdzFTDwM=BJnc7SseQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: panel: Add Samsung S6E3FA2 panel
To: Alexey Minnekhanov <alexeymin@postmarketos.org>
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
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
 <devicetree@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 " <~postmarketos/upstreaming@lists.sr.ht>, phone-devel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jul 25, 2021 at 4:04 PM Alexey Minnekhanov
<alexeymin@postmarketos.org> wrote:

> The Samsung S6E3FA2 AMOLED cmd LCD panel is used on Samsung Galaxy
> S5 (klte) phone.
>
> Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>

Grr gmail put this in my spam folder, sorry for confused mails.

With Sam's comments addressed:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
