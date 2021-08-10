Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C18813E5934
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 13:39:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B24989D7C;
	Tue, 10 Aug 2021 11:38:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC1E89D7C
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 11:38:57 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id m13so31663169iol.7
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 04:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kUwXDTn/nEQtIoTdsB5jMGa7v/7U/IC/RlJbSIvkA1c=;
 b=HQZMelUdqTZxUf3JkxmmsVTFmC1Mdz68Keh3lO5z0POpnpnucoqqg7rkVnDLJEDQ6d
 IrWRH/zoUzNO2TcjqvLRRagTN37zva1aLLs8hJw7RE/EuZuteefOiZKVnIsvShS7ng9D
 iDwqDIak8IyzBAFWDd6vDqEHQ0XNZYlAH4qWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kUwXDTn/nEQtIoTdsB5jMGa7v/7U/IC/RlJbSIvkA1c=;
 b=eY3y+IpkINS9w6zGK4n4zopQ/qJ8gaan6MYBN77hpcGsDj6DcxK4NKDqYW0cBr62N3
 uG4OFyrp42zWWOSiAOl+Zsce4dyL/TVHyZyWEF0/9I6a6fSZGxTq9cJbMQbHJfMKCwHf
 k5OUhjcokXsGVh+Tz1+pG3bCKUMlSoVoQipJGlkBDXkl0CRdPiVUn0/nFHMgyVtg7e0I
 8x0SXt9KoNRMf0iJfpccWTfo6dANRbyrtaojlu0z0/63hMXp8AuvNGTygUMN51bSXE9A
 eY3inVsfvlnFCfGXcdI2pVVvKDuWDT/sAxo/i4LQeAZTbnugfqK2cpMbiST3KOgs72gE
 QdEw==
X-Gm-Message-State: AOAM532W3yqJm6REOLAX6Vo8DO52J5SFPlA452I6+1eOuCPl2TKPILao
 Bl5jsRZCPUCFoPcTxAUYiJILp6sNR58N/JtZo5IMuA==
X-Google-Smtp-Source: ABdhPJyWjNvIInY7E8yPGRGtVh57QG1QSVK8P+R3j/fA9L2Xby5Bs4c9n+zM0z8jClvd941GJvNiXO8tquBwf6KQReE=
X-Received: by 2002:a02:cc21:: with SMTP id o1mr27001854jap.114.1628595536700; 
 Tue, 10 Aug 2021 04:38:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210810111124.247838-1-allen.chen@ite.com.tw>
In-Reply-To: <20210810111124.247838-1-allen.chen@ite.com.tw>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 10 Aug 2021 19:38:30 +0800
Message-ID: <CAJMQK-g9=7o750t4ZAyND7nqrRvx=tMqUs+-=1--M1CqGXvAdw@mail.gmail.com>
Subject: Re: [PATCH v8] drm/bridge: add it6505 driver
To: allen <allen.chen@ite.com.tw>
Cc: Hsin-Yi Wang <hsinyi@google.com>, Kenneth Hung <Kenneth.Hung@ite.com.tw>, 
 Hermes Wu <Hermes.Wu@ite.com.tw>,
 Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>, 
 Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong <narmstrong@baylibre.com>, 
 Robert Foss <robert.foss@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 open list <linux-kernel@vger.kernel.org>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
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

On Tue, Aug 10, 2021 at 7:31 PM allen <allen.chen@ite.com.tw> wrote:
>
> This adds support for the iTE IT6505.
> This device can convert DPI signal to DP output.
>
> From: Allen Chen <allen.chen@ite.com.tw>
> Tested-by: Hsin-yi Wang <hsinyi@chromium.org>
> Signed-off-by: Hermes Wu <hermes.wu@ite.com.tw>
> Signed-off-by: Allen Chen <allen.chen@ite.com.tw>
>
---  <-- Add this line next time.
Add the change logs below this line so that they're not mixed with
commit messages.

> v7->v8:
> fixed "checkpatch --strict" error
> remove unused variable *edid
> remove mode_set() callback
> Documenting the individual bits of the interrupt mask values
> change it6505_dpcd_write parameter from unsigned long to u8
>
> This patch depends on https://patchwork.kernel.org/project/linux-mediatek/patch/20210722062246.2512666-4-sam@ravnborg.org/
> ---
>  drivers/gpu/drm/bridge/Kconfig      |    8 +
>  drivers/gpu/drm/bridge/Makefile     |    1 +
>  drivers/gpu/drm/bridge/ite-it6505.c | 3333 +++++++++++++++++++++++++++
>  3 files changed, 3342 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/ite-it6505.c
>
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index 431b6e12a81fe..e1afe171075f5 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -74,6 +74,14 @@ config DRM_DISPLAY_CONNECTOR
>           on ARM-based platforms. Saying Y here when this driver is not needed
>           will not cause any issue.
>
<snip>

> +
> +       /* Register aux channel */
> +       it6505->aux.name = "DP-AUX";
> +       it6505->aux.dev = dev;
> +       it6505->aux.transfer = it6505_aux_transfer;
> +
> +       err = drm_dp_aux_register(&it6505->aux);

drm_dp_aux_register() checks if aux->drm_dev is null. Assign this
otherwise you'll see warnings.

> +       if (err < 0) {
> +               dev_err(dev, "Failed to register aux: %d", err);
> +               return err;
> +       }
<snip>
