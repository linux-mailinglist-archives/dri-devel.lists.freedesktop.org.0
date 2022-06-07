Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C368153FF8C
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 14:59:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A20BB10E4D3;
	Tue,  7 Jun 2022 12:59:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 306C510E4D3
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 12:59:00 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id u18so14773836plb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jun 2022 05:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lDtXYp3fqP9C71L4lDk/xlr3jxWkEpVJr+KnqNG4y7E=;
 b=K90qEHu0azHSHu2mOI/stRPDYrcuxcyCEFw1AMnirN2f0G71zutWWNnloA3GlxvQOQ
 xWsKraE+lZ25HczKKrKK7w2x9n7xuENo0TxW2z4j70T/UwwmhNHpZI2wunLzRrHhuADb
 4QvAomrTpPbwCIdUKPVGJYM7iypuonqnEdl1KPR/zIem+WdbqnNMyqnwOcDPRacshMsS
 iFhaVVvSgJ22oqgR+eqo+o1C8baqY6byzkiZHEehP3uc5RcO7tBiR2TSAzG2QWKezj1O
 ewjI2VXumahjBGKRs7NjofsnyPK1BKNc2WSiztSudBdoqAoj7+JTV43OfoLfy3nHVV0A
 7LeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lDtXYp3fqP9C71L4lDk/xlr3jxWkEpVJr+KnqNG4y7E=;
 b=EWYyQmYLJvWVS+mWQY6NpWr5+2a3ESbQtXvR773QOvawJnCc+jaxNuYb8rs/oOkq2G
 y9e0aavN2hCdMbKsp560OItTQJEJz68/sPEaDl17J3szTT6cQLFQRhZoJwg5wLR0jEkb
 4giN2jERwih2eiAEnZsjtsH5o83sCABNrHxo2UfEJiYIgrZ9gMm9H6szk/qu9fwxmKtR
 3xTBpyEbfJY1crR/yWUjny6dbG7y5APIM2+Fj9tkCxO2STD1BEsnPDQ+2BpLwhhmybki
 KHGvfZKr52HUO0QZjMRBJd7iA4fZMSUxYcEmmNZY6IGOrZSdf9e5IYyuP2hai+x4Kmn1
 tcrg==
X-Gm-Message-State: AOAM532gXCuhGoVWznZbwLWrkvsu3HaeH5GGjCUdv9PhkCJednJxwqtr
 1vWWcPoaOw8pD7U1ESfYUN2oFKT/9WMyZx5GfLEMbg==
X-Google-Smtp-Source: ABdhPJzcJQafpZkJeNY+yifsfYjttv26Nfb/21vVes5wyxo2mbx6fcRcdIFZS6FHMfgvoZV/ItHhisempzlmgAMrG4E=
X-Received: by 2002:a17:902:f353:b0:167:7bc1:b1b9 with SMTP id
 q19-20020a170902f35300b001677bc1b1b9mr10880509ple.117.1654606739759; Tue, 07
 Jun 2022 05:58:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220601233818.1877963-1-bjorn.andersson@linaro.org>
 <3e51df22-5747-7536-257a-77d279c57254@baylibre.com>
In-Reply-To: <3e51df22-5747-7536-257a-77d279c57254@baylibre.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 7 Jun 2022 14:58:48 +0200
Message-ID: <CAG3jFyuvW2ZHRZ4AgMe8k88fOnkxNLXfxR2hC_X6t_P9TA=HJQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: lt9611uxc: Cancel only driver's work
To: Neil Armstrong <narmstrong@baylibre.com>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 7 Jun 2022 at 14:32, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On 02/06/2022 01:38, Bjorn Andersson wrote:
> > During device remove care needs to be taken that no work is pending
> > before it removes the underlying DRM bridge etc, but this can be done on
> > the specific work rather than waiting for the flush of the system-wide
> > workqueue.
> >
> > Fixes: bc6fa8676ebb ("drm/bridge/lontium-lt9611uxc: move HPD notification out of IRQ handler")
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >   drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> > index 3d62e6bf6892..310b3b194491 100644
> > --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> > +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> > @@ -982,7 +982,7 @@ static int lt9611uxc_remove(struct i2c_client *client)
> >       struct lt9611uxc *lt9611uxc = i2c_get_clientdata(client);
> >
> >       disable_irq(client->irq);
> > -     flush_scheduled_work();
> > +     cancel_work_sync(&lt9611uxc->work);
> >       lt9611uxc_audio_exit(lt9611uxc);
> >       drm_bridge_remove(&lt9611uxc->bridge);
> >
>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

Applied to drm-misc-next.
