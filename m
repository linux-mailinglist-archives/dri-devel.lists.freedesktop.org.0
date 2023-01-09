Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CE1662200
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 10:47:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23A2A10E3A2;
	Mon,  9 Jan 2023 09:47:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com
 [IPv6:2607:f8b0:4864:20::929])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C63210E3A2
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 09:47:38 +0000 (UTC)
Received: by mail-ua1-x929.google.com with SMTP id l13so1851744uai.8
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 01:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yJBLzPMDm5Q01iXB5Sz5L7WTxl86lVDIt70z6KlR+Fw=;
 b=HF4vGRVX4KrX+Buk98OORMVOApzR1ZVhIZG6Z/HtmES/yCtZYx7hnX6SYer6Z4YTAz
 cjSrcCBXFKxA//IC8yY8sz3kKi0LgCvBY3Q7kDlpNsWn7JMgogCtok+avfIe4kkZaoVB
 e8nnGFC6Tz/w2uu/cS3fe6XpYKhq/DIl0p8q8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yJBLzPMDm5Q01iXB5Sz5L7WTxl86lVDIt70z6KlR+Fw=;
 b=1n3UaTcWQQNzLyYLj5Xp9VmWkoTRuKxCyzZaj3LlBeMRhi/4aoeEwsrKY9U8rfHhTv
 IZm6jEpQVYJPXooKI7qcq5ClAwRmtP8GIFzUOlABkPMP2CPon/jz0qtUXWnlogObTgj1
 8wLUOdI7E12FNp+vS4vcR7wH9M47gZn/S7/XHccslshAgDhJKC6Gq/ch8x3ulFlMtJ6Z
 w6/1irOqcC0dsvcghuTxw8nNE0mUk2sAYnPBr8lEkqRo/HWqxjGl7+36P/aNCBCBx6ll
 EPFIBpN/vKcRFrTMEHui+m/mxzGx+Pf+qBde6edz0RZf/OnKtxZhLLRTeQMku8f0M0BT
 JHcQ==
X-Gm-Message-State: AFqh2kpnkVYhwPkNXz7KFN1NKt/DO4U3VreM+0MPYtGwQWFqK98q45sE
 jYriDZImVFO7KsZ6TluhnKFsI7150a0RV/rlHVTZOQ==
X-Google-Smtp-Source: AMrXdXtrQtHYDxHPRjbH8w7qNhx5RWtnRaWn9ssgWPVavMNEUU5tSZg8SwoLKK8t83WFP7pMb0p2UP5jikrNxqjZXkY=
X-Received: by 2002:a9f:3189:0:b0:4c7:b2c7:d054 with SMTP id
 v9-20020a9f3189000000b004c7b2c7d054mr5823348uad.97.1673257657210; Mon, 09 Jan
 2023 01:47:37 -0800 (PST)
MIME-Version: 1.0
References: <20230109084101.265664-1-treapking@chromium.org>
 <20230109084101.265664-3-treapking@chromium.org>
In-Reply-To: <20230109084101.265664-3-treapking@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 9 Jan 2023 17:47:26 +0800
Message-ID: <CAGXv+5FVfSUo6aTfS6tGPZLT3gqBRj5i0h0gKk5EdifPj-4L8w@mail.gmail.com>
Subject: Re: [PATCH v9 2/9] platform/chrome: cros_ec_typec: Purge blocking
 switch devlinks
To: Pin-yen Lin <treapking@chromium.org>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Guenter Roeck <groeck@chromium.org>, Marek Vasut <marex@denx.de>,
 chrome-platform@lists.linux.dev, Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-acpi@vger.kernel.org,
 devicetree@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Allen Chen <allen.chen@ite.com.tw>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Daniel Scally <djrscally@gmail.com>,
 Prashant Malani <pmalani@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 9, 2023 at 4:41 PM Pin-yen Lin <treapking@chromium.org> wrote:
>
> From: Prashant Malani <pmalani@chromium.org>
>
> When using OF graph, the fw_devlink code will create links between the
> individual port driver (cros-ec-typec here) and the parent device for
> a Type-C switch (like mode-switch). Since the mode-switch will in turn
> have the usb-c-connector (i.e the child of the port driver) as a
> supplier, fw_devlink will not be able to resolve the cyclic dependency
> correctly.
>
> As a result, the mode-switch driver probe() never runs, so mode-switches
> are never registered. Because of that, the port driver probe constantly
> fails with -EPROBE_DEFER, because the Type-C connector class requires all
> switch devices to be registered prior to port registration.
>
> To break this deadlock and allow the mode-switch registration to occur,
> purge all the usb-c-connector nodes' absent suppliers. This eliminates
> the connector as a supplier for a switch and allows it to be probed.
>
> Signed-off-by: Prashant Malani <pmalani@chromium.org>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>


Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>

on MT8192 based Hayato (ASUS Chromebook Flip CM3200).
