Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 245C74E3B92
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 10:17:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 381A910E1A8;
	Tue, 22 Mar 2022 09:16:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8B6410E1A8
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 09:16:55 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-2e5969bdf31so182904097b3.8
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 02:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qBo572xYxqKTaI7lpxz6okPw5Dq0guno4lBVKRNZQ/A=;
 b=WWB8emCtss3irAeHLhh34BqngG7N6Em0pESEW5mZSmaLFmMVCjPSTEdYvW0PPGByYQ
 CWymPaVG1aWq+YgWMqMq92aGTNcile6wp/e1UG5RMywSvkHh/zJoT1q1mQObt6KRR1Um
 eMCEEeKoqbE9hyhq07qhHR3fabTcqjWmo1Fs4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qBo572xYxqKTaI7lpxz6okPw5Dq0guno4lBVKRNZQ/A=;
 b=tMMlCWb+qn1hWGgIYZgm8WoXIYtnlrilE13eJ8GhAQ2qfdfBVY3YQ1EbkCi5fp7UdA
 2sR1VJDJId3EjuWyBkUmsGVc0Wl21DcatAv+jcGSSmfGnlaoy2OpmHsjWNxXFE65JvXt
 erRl9n5Qi2iIbjYZ3T7lSoOqBmPDVgTvq8yfOZuqHWPBe8xrPPB8vYfzK+8ipkW37Rq0
 NILYeSYvJphWmgnJxyg7BKU2kcGgsB8yjphbCIVn6nPcweXqCaGb+Vo6XUpqQQVD0la6
 xZKU3zlXBBuHlqXdGu9pLtVrR4p81Z6hOt3muR3wGrEWkDS3C+4CLXpTt2cvu2U5kcqr
 osWw==
X-Gm-Message-State: AOAM533T7bhWpvqSuTQPSPDkd9GL6DuiOouymDG0h4ZLQPSqAbH2Eafo
 FvAahEdPAn6RS8/vORvZ+FL2cdX/TzdiL30p33zQbg==
X-Google-Smtp-Source: ABdhPJwNO0vnyYt7H/o8k79ta7Lhum+mKBkTV9F1PVSuv9BvIwWbWZNFxtmU7SgMq6HBTpTHeeV9x4XEq1Tkvib4VC4=
X-Received: by 2002:a81:be05:0:b0:2e5:6c26:59fb with SMTP id
 i5-20020a81be05000000b002e56c2659fbmr28941957ywn.94.1647940614769; Tue, 22
 Mar 2022 02:16:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220322080213.1487134-1-xji@analogixsemi.com>
 <CAJMQK-j+PhB6dZBuKG3NtW94oT0bVkp9G1bXhmyZLgYOmTCgog@mail.gmail.com>
 <20220322085208.GA1487511@anxtwsw-Precision-3640-Tower>
In-Reply-To: <20220322085208.GA1487511@anxtwsw-Precision-3640-Tower>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 22 Mar 2022 17:16:43 +0800
Message-ID: <CAGXv+5Gddu8VU7xjX-r2=u85i7Ut=_6JpQV6py52OyzEkpezTg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: anx7625: Set downstream sink into normal
 status
To: Xin Ji <xji@analogixsemi.com>
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, qwen@analogixsemi.com,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, treapking@chromium.org,
 dri-devel@lists.freedesktop.org, pihsun@chromium.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, tzungbi@google.com,
 bliang@analogixsemi.com, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 22, 2022 at 4:52 PM Xin Ji <xji@analogixsemi.com> wrote:
>
> On Tue, Mar 22, 2022 at 04:43:20PM +0800, Hsin-Yi Wang wrote:
> > On Tue, Mar 22, 2022 at 4:02 PM Xin Ji <xji@analogixsemi.com> wrote:
> > >
> > > As downstream sink was set into standby mode while bridge disabled,
> > > this patch used for setting downstream sink into normal status
> > > while enable bridge.
> > >
> > > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > > Reviewed-by: Pin-Yen Lin <treapking@chromium.org>
> > >
> > > ---
> > > V1 -> V2: use dev_dbg replace of dev_info
> > > ---
> > >  drivers/gpu/drm/bridge/analogix/anx7625.c | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > index 9a2a19ad4202..dcf3275a00fe 100644
> > > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > @@ -924,12 +924,20 @@ static void anx7625_dp_start(struct anx7625_data *ctx)
> > >  {
> > >         int ret;
> > >         struct device *dev = &ctx->client->dev;
> > > +       u8 data;
> > >
> > >         if (!ctx->display_timing_valid) {
> > >                 DRM_DEV_ERROR(dev, "mipi not set display timing yet.\n");
> > >                 return;
> > >         }
> > >
> > > +       dev_dbg(dev, "set downstream sink into normal\n");
> > > +       /* Downstream sink enter into normal mode */
> > > +       data = 1;
> > > +       ret = anx7625_aux_trans(ctx, DP_AUX_NATIVE_WRITE, 0x000600, 1, &data);
> > > +       if (ret < 0)
> > > +               dev_err(dev, "IO error : set sink into normal mode fail\n");
> > > +
> >
> > The driver uses DRM_DEV_* for logs. Can we use this?
> Hi Hsin-Yi, as comment in drm/drm_print.h:
> "NOTE: this is deprecated in favor of drm_dbg". DRM bridge driver not
> use DRM_DEV_* any more. I'll send a patch to replace all of DRM_DEV_*
> later.

drm_dbg is better than dev_dbg though. With the former, you still get the
option to control it with the drm.debug module parameter, unlike the latter
which normally gets compiled out.

Please use drm_dbg*.

ChenYu

> Thanks,
> Xin
> >
> > >         /* Disable HDCP */
> > >         anx7625_write_and(ctx, ctx->i2c.rx_p1_client, 0xee, 0x9f);
> > >
> > > --
> > > 2.25.1
> > >
