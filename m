Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEA653E50A
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 16:22:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEEDF11B5A6;
	Mon,  6 Jun 2022 14:22:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 903E211B5A6
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 14:22:36 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id x62so19036899ede.10
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 07:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HR9ZimCCmd1j/amkGhRbfPT914SxfF+DwhvAMa7hG8s=;
 b=Be/WplNQmJ47YORrypJyjDO3xZsi5v0eEVHzRhHm2XQqN5zxhzrkg7g+OKgS/P4kbm
 ZEtsFw6L3iaoh/1K2n7/XQ0Km74kYu+r1oguG6izyr2gCro2CAG9vbUsiuQS1PwXTH5n
 FrBly5SHx9gQH+Pb60Yer4UrxS7ftU1j4CmJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HR9ZimCCmd1j/amkGhRbfPT914SxfF+DwhvAMa7hG8s=;
 b=idyF9aH9sudVFQeMKekPS0XmoRK8FDatMbnWH6pu1MTH1deCts/jlSXXlxgKQEnkI9
 +Fb0bNMn1GtBWZQsa4TJ462NLlBIWFGzdb0XjsxpUjE2Zs+AJC4J2Lz5A7GrlQLfPwbd
 mFiGVNdWPVd+k9DzhU8vwvUKFkTFWhU16aS4yETlhMTihjfpGk1OXOhQp/QDuJAwzG4s
 CabAXlYOSE2ZZHIcQ9ZgKSbKzLXXjJUPioV825jdZgWIhmjhB93NHWn62uYq9Ny+IF1a
 qLsRs/PcdPyjoJH5PeeTFlvFla7C+SgjootTJMJpLJjV21UyLQ6bMIzuEeMwW8l7UNnj
 Y3rw==
X-Gm-Message-State: AOAM532o4vVqITQvLyPUIF6ec68LcNFoIIuw1nHamaAJBh5AwggHyg6R
 LcszBZcguRL1kJirMtqu0MIj1ZHiQjZorWUB
X-Google-Smtp-Source: ABdhPJxdNhWdtDSvxRqStBr22C7EOFagyL5GOu2FMXYGnEYEC8FCo8A7dhZ/ZkpceNI5gv31CXGK1A==
X-Received: by 2002:a05:6402:1857:b0:42d:bcd6:3a88 with SMTP id
 v23-20020a056402185700b0042dbcd63a88mr27489555edy.6.1654525354906; 
 Mon, 06 Jun 2022 07:22:34 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com.
 [209.85.221.51]) by smtp.gmail.com with ESMTPSA id
 i12-20020a1709064ecc00b00704b196e59bsm6232041ejv.185.2022.06.06.07.22.32
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 07:22:33 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id q15so12043808wrc.11
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 07:22:32 -0700 (PDT)
X-Received: by 2002:a5d:6483:0:b0:20f:d046:6382 with SMTP id
 o3-20020a5d6483000000b0020fd0466382mr21837218wri.342.1654525352126; Mon, 06
 Jun 2022 07:22:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220606044720.945964-1-hsinyi@chromium.org>
 <20220606044720.945964-5-hsinyi@chromium.org>
In-Reply-To: <20220606044720.945964-5-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 6 Jun 2022 07:22:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XQbXK13M_X_AsqSPS+D_zQqLtAGFGz=YbHoPu3bcvhZQ@mail.gmail.com>
Message-ID: <CAD=FV=XQbXK13M_X_AsqSPS+D_zQqLtAGFGz=YbHoPu3bcvhZQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/8] drm/panel: lvds: Implement .get_orientation
 callback
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>, Thierry Reding <thierry.reding@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sun, Jun 5, 2022 at 9:47 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> To return the orientation property to drm/kms driver.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> ---
> v2->v3: add comments for notice.
> ---
>  drivers/gpu/drm/panel/panel-lvds.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
> index 27a1c9923b09..239527409b00 100644
> --- a/drivers/gpu/drm/panel/panel-lvds.c
> +++ b/drivers/gpu/drm/panel/panel-lvds.c
> @@ -102,15 +102,29 @@ static int panel_lvds_get_modes(struct drm_panel *panel,
>         connector->display_info.bus_flags = lvds->data_mirror
>                                           ? DRM_BUS_FLAG_DATA_LSB_TO_MSB
>                                           : DRM_BUS_FLAG_DATA_MSB_TO_LSB;

Can you rebase your patch and send again? There's a context conflict
with the above line because your tree is lacking commit 83c784e70036
("drm/panel: lvds: Use bus_flags from DT panel-timing property")

In any case:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
