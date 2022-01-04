Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B2B48413F
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 12:57:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4E3D10E22B;
	Tue,  4 Jan 2022 11:57:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B53EF10E22B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 11:57:02 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id 200so32539629pgg.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jan 2022 03:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7qz4IOP4tQz6MVqNRs763jv/JpxIVCzSerIqjO9KVko=;
 b=akyWELdrqaMAzl+2u09k1siH03kmBuljuWevsTKn1MKWsv4RxLbC91yNXgeVnihFLy
 BZl9MxSdEKAJb61U47jRSZil0FvHd0Us300+yNsKCroJ0s7xApGir6uFNjmBed8Lrs0W
 nSTHtffY1vSOjK92/eysLhB+fiFm2KITapxdhIscazqv61h7luzo1YtcOE2Xrdmjq6vo
 ZnBIE7IUodgKn/aSLdvM0aZQNCtU9eKq1m9pbzTyDMdviSDcY+bCXwgKsoxbuBs5NpyF
 /fYOrJIatvWrwMi+hdohh2rQ6Sdy94B3O4hEpIl/GJXO6q3cKcEq0bF/dOfHGe5TpayW
 XzOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7qz4IOP4tQz6MVqNRs763jv/JpxIVCzSerIqjO9KVko=;
 b=tfJPl7IesxKjcdgusRWOZ+M/kRzkd/rwsvqyIcsh+gdesHnIkoSjfzEx7wyFKoCjzP
 Ouy3X2tsSD41wPTjydnveAfkzIgDDY25lAZx7kegf7awbKZGvtKMAPGGV66wUTlJUzcI
 +iS+kcqUTGBZ/7ADN+B/DgLOnoLw6Uo9CEYgZvQBCkVe4gQ9LrY+EeaqGIHGU6V0lqq9
 LglaA6Z52rQ9K6RD3cU3HN+cTFrSOTG4WjMIcE72QM29DECXNiH7DqjKCJvK3SeZTIie
 0KWZsFiAka+U4l2vlLVuOSkfiYBJLBfZxl4nXMIPDvE9awf6tJP7E8E5i0CB9ajgUw0z
 TPmQ==
X-Gm-Message-State: AOAM533Cm1hhhtCrEAu8W8AtNrzhCD22Umzx4sFyIdCuRi5FonygLyMF
 tDPBpjoBQxjTLAME0ZoURfOn0ZxBFE/bRIdPA9DfMw==
X-Google-Smtp-Source: ABdhPJzMeT/jerydzvJxQ9/6wchNhHmZXkPXPOHChg26wvS1FiPbEWYjw7SN+cUnWOvaq/P4AkteJjt6VgH0XBpaArQ=
X-Received: by 2002:aa7:8f37:0:b0:4bb:a19:d3aa with SMTP id
 y23-20020aa78f37000000b004bb0a19d3aamr50952958pfr.1.1641297422211; Tue, 04
 Jan 2022 03:57:02 -0800 (PST)
MIME-Version: 1.0
References: <20211218215055.212421-1-antonio.borneo@foss.st.com>
 <20c77dc1-7e7e-ec0e-f545-593d1cfeb3b3@foss.st.com>
In-Reply-To: <20c77dc1-7e7e-ec0e-f545-593d1cfeb3b3@foss.st.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 4 Jan 2022 12:56:51 +0100
Message-ID: <CAG3jFyu-btTaP+6YFTzPi13jD3RyqAWQq1QJUk3A_dVKjT4T4w@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/stm: dsi: move lane capability detection in
 probe()
To: Philippe CORNU <philippe.cornu@foss.st.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Antonio Borneo <antonio.borneo@foss.st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Yannick Fertre <yannick.fertre@foss.st.com>, Jonas Karlman <jonas@kwiboo.se>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 4 Jan 2022 at 11:47, Philippe CORNU <philippe.cornu@foss.st.com> wrote:
>
>
>
> On 12/18/21 10:50 PM, Antonio Borneo wrote:
> > There is no need to re-compute the dsi lane capability because it
> > only depends on dsi hw version.
> > Since dsi hw version is detected at probe(), move there also the
> > assignment of dsi lane capability.
> >
> > Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> > ---
> > To: David Airlie <airlied@linux.ie>
> > To: Daniel Vetter <daniel@ffwll.ch>
> > To: Andrzej Hajda <a.hajda@samsung.com>
> > To: Neil Armstrong <narmstrong@baylibre.com>
> > To: Robert Foss <robert.foss@linaro.org>
> > To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > To: Jonas Karlman <jonas@kwiboo.se>
> > To: Jernej Skrabec <jernej.skrabec@gmail.com>
> > To: Yannick Fertre <yannick.fertre@foss.st.com>
> > To: Philippe Cornu <philippe.cornu@foss.st.com>
> > To: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> > To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> > To: Alexandre Torgue <alexandre.torgue@foss.st.com>
> > To: Philipp Zabel <p.zabel@pengutronix.de>
> > To: dri-devel@lists.freedesktop.org
> > To: linux-stm32@st-md-mailman.stormreply.com
> > To: linux-arm-kernel@lists.infradead.org
> > Cc: linux-kernel@vger.kernel.org
> > ---
> >   drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 16 ++++++++--------
> >   1 file changed, 8 insertions(+), 8 deletions(-)
> >
>
> Hi Antonio,
> many thanks for your patch.
> Acked-by: Philippe Cornu <philippe.cornu@foss.st.com>
> Reviewed-by: Philippe Cornu <philippe.cornu@foss.st.com>
> Philippe :-)

Thanks for the series and the Acks.

Applied series to drm-misc-next
