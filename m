Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 916844721CB
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 08:34:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C011A10E2E7;
	Mon, 13 Dec 2021 07:34:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64BAF10E2E7
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 07:34:43 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id a11so14211352ilj.6
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Dec 2021 23:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pN73UJTcYa5JOMyuK9jaetarpbkD/7IbNdXwxXj6+68=;
 b=cgjLob2ExtmzQgI8lE2pZ6tGgPX19y/hv8KNnoFSmCp0r9RjcHeTd2QSsKuKNt5Nq6
 VJX2PjHvIOzpTKzrxkWN05NX0bV5P1jhFbZjGTlzKixL8K1QBfd32V7i5CDhjL90Qjyh
 tpHI0VDFtYLu9vr+Mn7+o8teHVQl1zfyrqhz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pN73UJTcYa5JOMyuK9jaetarpbkD/7IbNdXwxXj6+68=;
 b=sgBg7pdOl+th95ZG4OAykQQ7DMqvYawe4HKXJoBwx0menlXBVcSlHxivTVZBd5wsx7
 tvfK26270mMfQqO+dUXmWLHsntBIgGqxftkobM24VBk2Q+pzZyAmg//yzykulyUNOwFS
 W7vd7x4qeK6p72f0qEMKWAOHtKDR1pWIaQ/fh74xEu47olAx1IUeS+IzV6bcuBkPMo5r
 nsL9iCjb8xiRc6/pFwOiJbeqKGo418UvogZmW6YiZwOl73Wkbv/T9329zKUWyg6YNv5i
 37HyjSN6j5s3U6OqwcgnnLMaccc/2zH6hqU6UmyxFzfQ8RY3d/wRMvby2eGP+7mg+oah
 vXKQ==
X-Gm-Message-State: AOAM530e10EYH5JLgkmnNodtyqZ/3HA4Y54zNEWPde2uXjggERH66bDq
 XuUO5Jkpw0gO6aolpvsa6LtKItqfxfk4ClzoX1O8Gg==
X-Google-Smtp-Source: ABdhPJxw/ioRoR157XgseUrw3c7HP3415u2sCKveQYQIo5zuO0Szx6eTkqgdfeHqipoMc7JlvROjw072kWhrEWww0PA=
X-Received: by 2002:a92:c64f:: with SMTP id 15mr31217790ill.231.1639380882685; 
 Sun, 12 Dec 2021 23:34:42 -0800 (PST)
MIME-Version: 1.0
References: <20211108100608.22401-1-xiazhengqiao@huaqin.corp-partner.google.com>
In-Reply-To: <20211108100608.22401-1-xiazhengqiao@huaqin.corp-partner.google.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 13 Dec 2021 15:34:16 +0800
Message-ID: <CAJMQK-jTRt7OSkfCEmUBvC=2_dDo8vRC0awjJ4Jc+rzHFRUqzg@mail.gmail.com>
Subject: Re: [RESEND] drm/panel: Add inx Himax8279d MIPI-DSI LCD panel driver
To: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 8, 2021 at 10:06 AM xiazhengqiao
<xiazhengqiao@huaqin.corp-partner.google.com> wrote:
>
> Add STARRY 2081101QFH032011-53G 10.1" WUXGA TFT LCD panel
>
> Signed-off-by: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>

Tested-by: Hsin-Yi Wang <hsinyi@chromium.org>

Tested with a mt8183 katsu board [1] which uses this panel.

[1] https://patchwork.kernel.org/project/linux-mediatek/patch/20211213072355.4079568-1-hsinyi@chromium.org/

> ---
>  drivers/gpu/drm/panel/Kconfig                 |   9 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  .../gpu/drm/panel/panel-innolux-himax8279d.c  | 515 ++++++++++++++++++
>  3 files changed, 525 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-innolux-himax8279d.c
>
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 2cb8eba76af8..dcf04c32f6ae 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -167,6 +167,15 @@ config DRM_PANEL_INNOLUX_EJ030NA
>            320x480 3.0" panel as found in the RS97 V2.1, RG300(non-ips)
>            and LDK handheld gaming consoles.
>
<snip>
