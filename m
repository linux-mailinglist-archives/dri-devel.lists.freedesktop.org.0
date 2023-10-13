Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CCE7C8F80
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 23:44:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9653810E641;
	Fri, 13 Oct 2023 21:44:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFE8B10E641
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 21:44:23 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-405459d9a96so8405e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 14:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1697233462; x=1697838262;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6s8RLqJudPOVEKou/gNK8vkKWsF8L5oa5Kee8jgRNMQ=;
 b=sd5scL4dcLid4ev9H4xPZX7O7lYpAHcCAaRSgnJqoT/tSOz5h9tErWAhdi6gB5u4LY
 3NqY8xITFfM08zIj5y5pNW6XgWrx2iwsJVz9Vi5WMPS6QosgHB0BxBnSIptAR6GyYyS4
 HOgap/rquQLww2mDCVvYCjUo2FZKz5aXBwFnSPltvI4lHe5l8f6nhtey26QM78C3POiI
 abLxeJZBRG8nJyzb0B3UAYtbHC6yCUMNfekoA0r79MAZViaCizZhdnZ2uEPF15E6vUdw
 tRjMaqOhPM0Eu84M8lxOzigV/QT/1l24gknfrKlINfKNsEnr5K6svqelnTTYN1k+XRsN
 RblA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697233462; x=1697838262;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6s8RLqJudPOVEKou/gNK8vkKWsF8L5oa5Kee8jgRNMQ=;
 b=Gifqp1u8pzwfVcSCVSxYbGsH+dsLWvnDkdp3MjkD8v0CKN7a58BvQPfVKUBm7CtITW
 Q93L3avGl3Px8FjJVZE1x8tuNqi40MYwbIdsMd+YvrPYrFEMDdfUhh5uAx/BpQJT3iyB
 Lb98QzQqRFKGi6HSlCcDDwner22U5r5xuiW4ZWvtHrEPHFBPH5++IqiALgzuFhoz56GX
 iAMVSbYkabPIBnppKKibiC8guTo0Z5ujgN21zr7KDyNK3I1AHQeutzM/z8OW9eBO0QWb
 UuPecO9SUECrv16jqYzPWsh2LhQ6XJoEel/TszT6Zr+iOdVY0K5P918/skxGKJdmk4v+
 kmrw==
X-Gm-Message-State: AOJu0YwPG62VDhHuTGIqPFT3VTxjgUCzMHwEadLRWJjNkpPlkTXONlwT
 W4klZHWTiKHpymzHn6TBWEvXsEvQkvWMBS0j4cticw==
X-Google-Smtp-Source: AGHT+IEjFS5qOpUFylLrVrg7uywESSfY/S8UcGaU/2pbJM5f4+Msw5+qhuL3MAAU4IGBMXjmKEa1ETnPmWnmDO5b+DU=
X-Received: by 2002:a05:600c:1551:b0:400:c6de:6a20 with SMTP id
 f17-20020a05600c155100b00400c6de6a20mr4283wmg.3.1697233461839; Fri, 13 Oct
 2023 14:44:21 -0700 (PDT)
MIME-Version: 1.0
References: <20231013091844.804310-1-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20231013091844.804310-1-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Fri, 13 Oct 2023 14:44:05 -0700
Message-ID: <CAD=FV=Wu7aDaocnXiUg-5k+LodDvQQNh=noJ8s5jP3R46PBWsw@mail.gmail.com>
Subject: Re: [v4 0/3] Break out as separate driver from boe-tv101wum-nl6 panel
 driver
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: neil.armstrong@linaro.org, will@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, catalin.marinas@arm.com, hsinyi@google.com,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Oct 13, 2023 at 2:18=E2=80=AFAM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> Linus series proposed to break out ili9882t as separate driver,
> but he didn't have time for that extensive rework of the driver.
> As discussed by Linus and Doug [1], keep macro using the "struct panel_in=
it_cmd"
> until we get some resolution about the binary size issue.
>
> [1]: https://lore.kernel.org/all/20230703-fix-boe-tv101wum-nl6-v3-0-bd6e9=
432c755@linaro.org
>
> In [v1 2/2], Doug suggested move the ili9882t_enter_sleep_mode function
> to ili9882t_unprepare. I tried this scheme and the test failed. I will
> continue to investigate the rootcause with ilitek, which may take a long =
time .
> So if possible, apply this patch first. If there are new solutions later,=
 I
> will continue upstream.
>
> [v1 2/2] https://lore.kernel.org/all/CAD=3DFV=3DXtqPJ77dx8uRb0=3DtMvC3Cvg=
H5X+7mUJeXgcG228kZfUg@mail.gmail.com/
>
> Changes in v4:
> - PATCH 2/3: Change usleep_range(50000,51000) to msleep(50);.
> - Link to v3: https://lore.kernel.org/all/20231012121004.2127918-1-yangco=
ng5@huaqin.corp-partner.google.com/
>
> Changes in v3:
> - PATCH 1/3: Remove "init_cmd_length" and "linux/of_device.h" .
> - PATCH 2/3: Change usleep_range(50000,51000).
> - PATCH 3/3: Add a little background for commit.
> - Link to v2: https://lore.kernel.org/all/20231010121402.3687948-1-yangco=
ng5@huaqin.corp-partner.google.com/
>
> Changes in v2:
> - PATCH 1/3: fix Doug comments,define "_INIT_SWITCH_PAGE_CMD" and remove =
the "shutdown".
> - PATCH 2/3: Modify ili9882t_switch_page function instead of hardcoding.
> - PATCH 3/3: Enable new config in defconfig.
> - Link to v1: https://lore.kernel.org/all/20231007060639.725350-1-yangcon=
g5@huaqin.corp-partner.google.com/
>
> Cong Yang (3):
>   drm/panel: ili9882t: Break out as separate driver
>   drm/panel: ili9882t: Avoid blurred screen from fast sleep
>   arm64: defconfig: Enable ILITEK_ILI9882T panel
>
>  arch/arm64/configs/defconfig                  |   1 +
>  drivers/gpu/drm/panel/Kconfig                 |   9 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 371 ---------
>  drivers/gpu/drm/panel/panel-ilitek-ili9882t.c | 779 ++++++++++++++++++
>  5 files changed, 790 insertions(+), 371 deletions(-)
>  create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9882t.c

I think the series is well-reviewed now. I'll wait a week and target
applying next Thursday or Friday unless something comes up.

-Doug
