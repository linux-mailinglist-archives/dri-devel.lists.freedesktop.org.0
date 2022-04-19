Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7335075B6
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 19:01:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE19D10F043;
	Tue, 19 Apr 2022 17:01:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 045E210F043
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 17:01:02 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 i24-20020a17090adc1800b001cd5529465aso2454832pjv.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 10:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9jOurR+gBeTzso4yvaJAHtAS98sqnrl9e0cTwGxsGI0=;
 b=E5zCqZZl5R98J3+JPforMtTZJRUIte3wm1tfA/2uivf21uWK+9MWrmrODn7aQ0kLpi
 6OdRo16lVgtm0pKfCt/vKx22BZgDhXwV4ARtMQRWqWIc62MXDTx6XJZc29PZYmb7fuV5
 fQFQdFTtSrmXUmWJyBmICA25mNPOsNQD5+15P2FZCbV74JUl/HCYebfkk0uUWIbSZpeN
 HZNP1oP6770RrKcEW1hioIPSFg4ldVg9/SOcTt6lkVaTjUENuH9lh6YXDanO9FNw3kNj
 9GosekmXXKMnTw+URy39aEeXJ9VdZYY0UWf2cTgA6ipIRSEpjaj4krP4ohQ1PJcUEYf+
 yvVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9jOurR+gBeTzso4yvaJAHtAS98sqnrl9e0cTwGxsGI0=;
 b=53UDVaJHGV1DnSybQ5YOK0JUxNNER67s+wwlait3IjziH2fcW+tW9MpM8De9KGeaFt
 O9KyZfdLzMJocfVgSLXqSts6VvBZvLJAs0FgAAXCFzReUo6fpYHf+k8g1CRSgxE9VbAT
 ZR0a1rMwtLc4kM1u9HNsHXFSd+64oB1CgsKL2LJFuObKiFm4W5kgXSbVluaZyjkm1ibl
 rVDo7rBu4SSnwUaVGTzCyCHNe9McFxDf+Mz2LsrROCCL97Cx4R2BPW3J9Mlj1la6nppf
 TKFDuZP+4AtvC1y2P9akMeSip68MfAIiYu+35cAt272Vbpka8nrNYSBwYERgLk1CQLs9
 geaQ==
X-Gm-Message-State: AOAM533kJrvBhMWBt+iYeVG7tn/B0pkqR0HxADdakPnTj95ZCVOumexg
 xkWTQEYbTKqa/oHzefvVV0etrqmYXCrzsN/a4f4BEQ==
X-Google-Smtp-Source: ABdhPJwm798+IVrQZxr/r+hyLACw0yUGxBuAo0d6wjGnSnNekXfq8Uj0LOHgkdJZ4cq0435fsCDFQ8o8c+sS+YW/ARM=
X-Received: by 2002:a17:90b:3e84:b0:1d2:c015:2182 with SMTP id
 rj4-20020a17090b3e8400b001d2c0152182mr7222190pjb.232.1650387661577; Tue, 19
 Apr 2022 10:01:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220408013034.673418-1-nfraprado@collabora.com>
 <20848108-31bc-357c-224b-9cbdd465b195@collabora.com>
In-Reply-To: <20848108-31bc-357c-224b-9cbdd465b195@collabora.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 19 Apr 2022 19:00:50 +0200
Message-ID: <CAG3jFytRcM2bnKu0gLwZ9Wyn5eRvO16+OLJHt+a=pAAM9a=vww@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: anx7625: Use uint8 for lane-swing arrays
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Pi-Hsun Shih <pihsun@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>, Xin Ji <xji@analogixsemi.com>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 8 Apr 2022 at 10:21, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 08/04/22 03:30, N=C3=ADcolas F. R. A. Prado ha scritto:
> > As defined in the anx7625 dt-binding, the analogix,lane0-swing and
> > analogix,lane1-swing properties are uint8 arrays. Yet, the driver was
> > reading the array as if it were of uint32 and masking to 8-bit before
> > writing to the registers. This means that a devicetree written in
> > accordance to the dt-binding would have its values incorrectly parsed.
> >
> > Fix the issue by reading the array as uint8 and storing them as uint8
> > internally, so that we can also drop the masking when writing the
> > registers.
> >
> > Fixes: fd0310b6fe7d ("drm/bridge: anx7625: add MIPI DPI input feature")
> > Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> >
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Applied to drm-misc-next
