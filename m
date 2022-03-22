Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D814E3B30
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 09:52:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 208D210E53C;
	Tue, 22 Mar 2022 08:52:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE30110E538
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 08:52:20 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id h23so23285643wrb.8
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 01:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zq9OA5jF5EJtQjULWMX9R5+C3ktkDDoBC5HCaRF17Gs=;
 b=ZAwLHC2i/rp8MSAK1bkjmZORoPzVnPazmnmRTI7SU0/1hUZ5x3fpsHVORP9yIDbV3O
 2FdRphnHZbkiMQEQUB39g8nD8ZdD+GHdXP81Tuzvoh8lvwQ5k8qYPZHRzQNTsNzVr+tw
 EjKskTOkkyW7aXZWDH0YIk5+RIkwIiPtvf59Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zq9OA5jF5EJtQjULWMX9R5+C3ktkDDoBC5HCaRF17Gs=;
 b=ZlJyH6PGRh65pEa3I6jFUIhcu//iajoA7cGsevX3EUG+RpGWWNkKnThiS+egNXLJ18
 or4iNUwJGrNMV3rqezCrOpPv/bfCRueaQt1qXd1Q0pnRO+VoeCVXoCXJxVYNM0hX7T5L
 KSjptb2KX4ZZH+1/xSR7wHiFQEEJUTmYzKmI2M4MavC0zbOHkCHXM0BvYMvbxA0hBiLV
 o4JHLvDZ0SwxtToR481gNv7ykRDORPF0C/5GkcxNa63aPkW1lJDuKh4x8vBLTmPgKxDH
 soIgXBoTNkTfHDwFiTNm8knEiqcbDBCvuqAFDLKjDqL/BG+Zi2rpiF7RI/f5oqQm1BbR
 i1oQ==
X-Gm-Message-State: AOAM531m7slYEd3lycTUZNaSK7rOgfqw0Lzj6ZUZpSYm/nfcaAZ6MNYy
 uuwg9LIn61AqIxflH82RdUv8MpxLodSVgc1mCWz5hA==
X-Google-Smtp-Source: ABdhPJzMSH5CseguBpvPLp5eAYnBHCBroj8HEpPt0qVmUNVxUXLzExr/SkTT5kMAsOuxc2KWnaWj0LDWcNAdKkoARls=
X-Received: by 2002:adf:eb81:0:b0:1e3:2bf5:132 with SMTP id
 t1-20020adfeb81000000b001e32bf50132mr21256230wrn.246.1647939139335; Tue, 22
 Mar 2022 01:52:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220322080213.1487134-1-xji@analogixsemi.com>
 <CAJMQK-j+PhB6dZBuKG3NtW94oT0bVkp9G1bXhmyZLgYOmTCgog@mail.gmail.com>
In-Reply-To: <CAJMQK-j+PhB6dZBuKG3NtW94oT0bVkp9G1bXhmyZLgYOmTCgog@mail.gmail.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Tue, 22 Mar 2022 16:52:08 +0800
Message-ID: <CAEXTbpc2zFmKWGtP-fDa=96rwGWjKT7YJOMRceBbrbTsGvzOGQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: anx7625: Set downstream sink into normal
 status
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
Cc: dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 qwen@analogixsemi.com, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 tzungbi@google.com, pihsun@chromium.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, bliang@analogixsemi.com,
 Xin Ji <xji@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DRM_DEV_* macros have been deprecated:
https://www.kernel.org/doc/html/latest/gpu/drm-internals.html#c.DRM_DEV_DEBUG_DRIVER

On Tue, Mar 22, 2022 at 4:43 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> On Tue, Mar 22, 2022 at 4:02 PM Xin Ji <xji@analogixsemi.com> wrote:
> >
> > As downstream sink was set into standby mode while bridge disabled,
> > this patch used for setting downstream sink into normal status
> > while enable bridge.
> >
> > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > Reviewed-by: Pin-Yen Lin <treapking@chromium.org>
> >
> > ---
> > V1 -> V2: use dev_dbg replace of dev_info
> > ---
> >  drivers/gpu/drm/bridge/analogix/anx7625.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > index 9a2a19ad4202..dcf3275a00fe 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > @@ -924,12 +924,20 @@ static void anx7625_dp_start(struct anx7625_data *ctx)
> >  {
> >         int ret;
> >         struct device *dev = &ctx->client->dev;
> > +       u8 data;
> >
> >         if (!ctx->display_timing_valid) {
> >                 DRM_DEV_ERROR(dev, "mipi not set display timing yet.\n");
> >                 return;
> >         }
> >
> > +       dev_dbg(dev, "set downstream sink into normal\n");
> > +       /* Downstream sink enter into normal mode */
> > +       data = 1;
> > +       ret = anx7625_aux_trans(ctx, DP_AUX_NATIVE_WRITE, 0x000600, 1, &data);
> > +       if (ret < 0)
> > +               dev_err(dev, "IO error : set sink into normal mode fail\n");
> > +
>
> The driver uses DRM_DEV_* for logs. Can we use this?
>
> >         /* Disable HDCP */
> >         anx7625_write_and(ctx, ctx->i2c.rx_p1_client, 0xee, 0x9f);
> >
> > --
> > 2.25.1
> >
