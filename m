Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D32D66BA596
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 04:29:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A11E10E8F3;
	Wed, 15 Mar 2023 03:28:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67A6E10E8CD
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 03:28:54 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id s4so134631ioj.11
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 20:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1678850933;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KHJv8+oprMyTG8LLowWuTDSnzgqZct/FrXmCJG1m1N8=;
 b=E9y0viNou8XTccqIF7nChT4t+S/RO+S43g8Yi6qhmRl67Mc8Jp2q0qh02d3Zj6ltm7
 3++Hj2kFeVOM8T0bceft9TDEYRcPUwEJw3FIyloAw0Lk35wqe2+hnNQm0zGCcn229Fk0
 eOanbixHkHR++JqIkACWcNjYBlI/BxKBQxWms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678850933;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KHJv8+oprMyTG8LLowWuTDSnzgqZct/FrXmCJG1m1N8=;
 b=IBXbrw7u/aKNjB4XIXqUgiUsqljLv87o9guD6GuLK56E5EcDTK8VuCfl5F8nc2A/p/
 yQ+cW4yLsvgHYVpqb03YwI9UJK4R7j/ch4TWpWjUl7TUz9BwS216yBBThTARw5PER8Xo
 gY5yYe7FEAcdIQyf2VfoDmu1NtDJpOIZdLoBNiGy41PoXtBs0ii72WmjM6Lj4HVioQnD
 IrSmQZwnAaoiQHPZ9kiVnwa8OCCPhVsvNrOweYlu4h3G7A9SyzEknP9om1f/G3D+C6Fq
 lVRS592e0pkfMbcFD538kPxZ0cJl3ThUrqI/8iA2Hz3Dt1iOlP1vAPNj1JKXTchMxQzX
 O93Q==
X-Gm-Message-State: AO0yUKVuKq2hXDNJk9PH5zsC2W2CXDIVDORmrZs7epuqt+JtH9oEb5iV
 arZPsJPEmrFAnagx5DDVwIwsCAek3YHn3VMYGpnUvw==
X-Google-Smtp-Source: AK7set+K7jxkr7x8BZk6qGVZSfKCUnhLEKrVm/pbz3cErtANxa+XHpoQoJ+pTsmTBi35XTKMaOL6QXGQ+aywcAvRAUo=
X-Received: by 2002:a6b:6a0a:0:b0:745:b287:c281 with SMTP id
 x10-20020a6b6a0a000000b00745b287c281mr17750961iog.2.1678850933695; Tue, 14
 Mar 2023 20:28:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230314110043.2139111-1-treapking@chromium.org>
 <CAD=FV=W=jVsvD620wWKfniRYQNJnb7goDUKb_HhL_qVxLYGZOA@mail.gmail.com>
In-Reply-To: <CAD=FV=W=jVsvD620wWKfniRYQNJnb7goDUKb_HhL_qVxLYGZOA@mail.gmail.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Wed, 15 Mar 2023 11:28:42 +0800
Message-ID: <CAEXTbpe6EyukjKfgaVtHdMK2Ppw715kUUnOqvFa+tEX913p9aQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/bridge: ps8640: Skip redundant bridge enable
To: Doug Anderson <dianders@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug,

On Wed, Mar 15, 2023 at 5:31=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Tue, Mar 14, 2023 at 4:00=E2=80=AFAM Pin-yen Lin <treapking@chromium.o=
rg> wrote:
> >
> > Skip the drm_bridge_chain_pre_enable call when the bridge is already
> > pre_enabled. This make pre_enable and post_disable (thus
> > pm_runtime_get/put) symmetric.
> >
> > Fixes: 46f206304db0 ("drm/bridge: ps8640: Rework power state handling")
> > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> > ---
> >
> >  drivers/gpu/drm/bridge/parade-ps8640.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/b=
ridge/parade-ps8640.c
> > index 4b361d7d5e44..08de501c436e 100644
> > --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> > +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> > @@ -557,7 +557,8 @@ static struct edid *ps8640_bridge_get_edid(struct d=
rm_bridge *bridge,
> >          * EDID, for this chip, we need to do a full poweron, otherwise=
 it will
> >          * fail.
> >          */
> > -       drm_atomic_bridge_chain_pre_enable(bridge, connector->state->st=
ate);
> > +       if (poweroff)
> > +               drm_atomic_bridge_chain_pre_enable(bridge, connector->s=
tate->state);
>
> It always seemed weird to me that this function was asymmetric, so I
> like this change, thanks!
>
> I also remember wondering before how this function was safe, though.
> The callpath for getting here from the ioctl is documented in the
> function and when I look at it I wonder if anything is preventing the
> bridge from being enabled / disabled through normal means at the same
> time your function is running. That could cause all sorts of badness
> if it is indeed possible. Does anyone reading this know if that's
> indeed a problem?

If the "normal mean" is disabling the bridge, then we are probably
disabling the whole display pipeline. If so, is the EDID still
relevant in this case?

drm_get_edid returns NULL whenever error happens, and the helpers seem
to handle this case properly.
>
> I suppose that, if this is unsafe, it's no more unsafe now than it was
> before your patch, so I guess:
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> If there are no issues, I'll plan to land this patch and the next one
> to drm-misc-next sometime late-ish next week.

Thanks for the review. I'll submit a v2 to collect the review tags and
fix up the nit in patch 2/2.

Best regards,
Pin-yen
