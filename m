Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F377378E6F9
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 09:12:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C02E210E570;
	Thu, 31 Aug 2023 07:12:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com
 [IPv6:2607:f8b0:4864:20::e2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A829310E570
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 07:12:34 +0000 (UTC)
Received: by mail-vs1-xe2e.google.com with SMTP id
 ada2fe7eead31-44eb98a2da3so284209137.1
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 00:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693465953; x=1694070753;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ReysCIs7gq0oi5nUfD4Oni43aeEvSwKZl5a77+O+C1o=;
 b=KhPqSBrKO/RkvZB6IYaOFi7oZskF3fA3S+WEaHtWChTccCQRWgKmwK6d3jbdgGytUn
 DYIgGmJu+Xuuv9bgDdIsSnVheJc8BVDfem8KdcGtzpqzCmKHvBtxFduCSWIVV8ihqJLx
 DANK564Yg8yLz4wEH8qwsGv9RYwrFpmXf7xA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693465953; x=1694070753;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ReysCIs7gq0oi5nUfD4Oni43aeEvSwKZl5a77+O+C1o=;
 b=fp7foES9majs1thUFOpwqG3hlkSclpYVYXno1WjaI/q1qRwUEwjFOOJG0N8xM+Hjwz
 amTEUSSfNaoqUUokdKTpSlRHYYvR8Jg4mF0BgfjpS4ChnFx3yIXkuPMrsuxwkURXeNw4
 dy33MHgrTO/duSujyI2YnZbaea9+USZmKTailbi4taNg2WE7I2KlOxYDkUJKT4kH8lw2
 M7wx2UbCHPivodvPLFjwFjjiX4OyHo6Ec6StpggfqdFBhtTzqTJuiWMU585aNhQlzXPK
 ZcoogkuUoL108oEIpnexs/uTGFUzch4jrMvPqDI/nGN0v6iGg5qm2t4Vxtc83yL25MKH
 blOQ==
X-Gm-Message-State: AOJu0YypUdaxkgKFPvh4alViWl83K0D+PHF0krU2zS/iddZ/KdNeG7rs
 crUybkAH3DueldJOyf6iOayA9tHIcGIHOmIQ3XsmvQ==
X-Google-Smtp-Source: AGHT+IEneBwezWd78+nn9jl49tfxl8BZvYZXgWguzLYuo4e9Q+XIEon8QDAlyMWu54MCqddD8Jskma2vLyFTYNb89kU=
X-Received: by 2002:a67:cd11:0:b0:44e:dd14:24a4 with SMTP id
 u17-20020a67cd11000000b0044edd1424a4mr4319898vsl.29.1693465953651; Thu, 31
 Aug 2023 00:12:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230725073234.55892-10-angelogioacchino.delregno@collabora.com>
 <20230825120109.3132209-1-mwalle@kernel.org>
 <5b438dba-9b85-4448-bc89-08a11ddb822a@notapiano>
 <fc6c054941420ac2d016496ccbeecad4@kernel.org>
 <00f65d49-497c-4ade-a2f3-7a5b7ad803b6@notapiano>
 <18bfffdd7ce3bd7693c8362b28651b49@kernel.org>
 <cce6f9c2-e0b6-47e4-ae1c-9a3d8a4e4b02@notapiano>
 <7a3257dddac78c46408341253a3286f4@kernel.org>
In-Reply-To: <7a3257dddac78c46408341253a3286f4@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 31 Aug 2023 15:12:22 +0800
Message-ID: <CAGXv+5E4nWSuZdHmRhgYDUG4WhYs5o+-ZQBh3pnd2T_fdf9Edg@mail.gmail.com>
Subject: Re: [PATCH v7 09/11] drm/mediatek: dp: Add support for embedded
 DisplayPort aux-bus
To: Michael Walle <mwalle@kernel.org>
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
Cc: chunkuang.hu@kernel.org,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 amergnat@baylibre.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, ehristev@collabora.com,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 30, 2023 at 7:11=E2=80=AFPM Michael Walle <mwalle@kernel.org> w=
rote:
>
> >> While digging through the code I realized that all the outputs and
> >> pipelines
> >> are harcoded. Doh. For all the mediatek SoCs. Looks like major
> >> restriction
> >> to
> >> me. E.g. there is also DSI and HDMI output on the mt8195. I looked at
> >> the
> >> downstream linux and there, the output is not part of the pipeline.
> >> Are you
> >> aware of any work in that direction?
> >
> > I'm not sure I get what output and pipelines are hardcoded that you're
> > referring
> > to (besides the one in the mtk-dsi/dpi driver that you already sent the
> > patch
> > fixing).
>
> Have a look at [1]. That main path ends with the DP_INTF0 which is the
> eDP output. But from what I understand that path can also use the DSI
> output. But that is a pattern for all the paths in that file. Looks like
> all supported boards in the kernel will have the output type for a given
> SoC/path (or maybe the mt8195 is the first one which supports different
> output interfaces).
>
> If you have a look at the mediatek kernel instead [2], there the last
> part of the path is not fixed, but there is also a .conn_routes property
> by which you seem to be able to choose the actual output interface.
>
> I was just curious if you know of any development for that (or similar)
> in the kernel.

This is probably because support for this SoC began with Chromebooks,
which have fixed and defined uses for the pipelines. I suspect that
what you are working on is much more flexible.

The driver should be made to allow dynamic selection of outputs, as
is commonly seen with other drivers, but I don't know if that's on
anyone's TODO list.

ChenYu

> > And I'm not familiar with the DSI and HDMI output support on MT8195, so
> > I can't
> > help with that.
> >
> > Thanks,
> > N=C3=ADcolas
>
> [1]
> https://elixir.bootlin.com/linux/v6.5/source/drivers/gpu/drm/mediatek/mtk=
_drm_drv.c#L210
> [2]
> https://gitlab.com/mediatek/aiot/bsp/linux/-/blob/mtk-v5.15-dev/drivers/g=
pu/drm/mediatek/mtk_drm_drv.c?ref_type=3Dheads#L425
