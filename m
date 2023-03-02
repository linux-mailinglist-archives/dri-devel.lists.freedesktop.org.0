Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6A36A87D7
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 18:26:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A0A510E27E;
	Thu,  2 Mar 2023 17:26:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8809210E102
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Mar 2023 17:26:01 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id g9so102809ila.8
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Mar 2023 09:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VaTqYDyLafiZL0B3tSJBwk7qRC++RXXMoAq4jrwnI7o=;
 b=C826dozkSH2GhW7IjIMlV8In/06pLnzjwoHZB+d+h/IYrBwP0YZqr/fF9tgX08GhF6
 rZLr3jiUcxiSCRgDVaX+2PqjWd99zGCQLT+nq3vj5P/GQ08fy/JwwaElBZ9jHnBQM9qM
 6pjrbGtsEd/78qwHv5h9HrKcYWNVf/uZuGwW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VaTqYDyLafiZL0B3tSJBwk7qRC++RXXMoAq4jrwnI7o=;
 b=v6mTGH7t7o8atjQ8w1bzn+F1u+aJt3MrF1eif9E7tIQFRl4wyYiM1o+jHpzLGX6QqE
 vmDuyMw0hBn3t+Nyq0zF4BO3Ao/Uv0WoCsqUBVnzDJlu++vAnqsY2S/91j9YnCbQcWSb
 hhJ3UDV0vBEgUJdzcJWX44WDj36T26nIccGjWL7pkJv4zypG8MDt+pbqlj2k6XUTohMn
 rnjtDtuyEMtW5jL9YNrxR+do9P+XVr7QTS6dxHBGRcyfnwd0JAnNMH7pVlPJh9wg8dKm
 AdOFPWtM4ciEPWCwP0Yfn5D7UUmQI60TQtdUWzgYf+DidEtoGmiIGa1spVEbFg+erzjj
 0j4Q==
X-Gm-Message-State: AO0yUKXzU9RVTdU0/Zylip0hs01geXIUPhN0R2trHXTRyS9J/tD6dPQq
 bfUuHsVqyDwRfF1WFdfDUrZR1Onr/P29oueN
X-Google-Smtp-Source: AK7set+ssVUV6JenxXGe0prpLGOcY39C0FQ+Axi/EhEO8++sW6vjnrxvjNUxGScOo+F/bOik1wesiA==
X-Received: by 2002:a05:6e02:1527:b0:316:fcbe:397c with SMTP id
 i7-20020a056e02152700b00316fcbe397cmr8837721ilu.27.1677777960314; 
 Thu, 02 Mar 2023 09:26:00 -0800 (PST)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com.
 [209.85.166.181]) by smtp.gmail.com with ESMTPSA id
 u19-20020a02aa93000000b003e4a3c070adsm11288jai.133.2023.03.02.09.25.59
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 09:25:59 -0800 (PST)
Received: by mail-il1-f181.google.com with SMTP id p13so90689ilp.11
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Mar 2023 09:25:59 -0800 (PST)
X-Received: by 2002:a92:a005:0:b0:316:ff39:6bbf with SMTP id
 e5-20020a92a005000000b00316ff396bbfmr4912637ili.6.1677777959145; Thu, 02 Mar
 2023 09:25:59 -0800 (PST)
MIME-Version: 1.0
References: <20230131141756.RFT.v2.1.I723a3761d57ea60c5dd754c144aed6c3b2ea6f5a@changeid>
 <CAPY8ntAUhVB6UtQTeHAcxNW950Ou+NcEoGwk3JnVWLay89_0Nw@mail.gmail.com>
 <CAD=FV=UNx7ivymvpGKcuyvvepvo-T2B2aREJy2GyawTHCnazsw@mail.gmail.com>
 <e077d60d-5881-1ccc-a17a-fbe64392e29d@linaro.org>
In-Reply-To: <e077d60d-5881-1ccc-a17a-fbe64392e29d@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 2 Mar 2023 09:25:47 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W_FVUOD6T0Lx-JTqrqaP9gPgb4R-2TaSqKwkaBkqHJmQ@mail.gmail.com>
Message-ID: <CAD=FV=W_FVUOD6T0Lx-JTqrqaP9gPgb4R-2TaSqKwkaBkqHJmQ@mail.gmail.com>
Subject: Re: [RFT PATCH v2 1/3] drm/bridge: tc358762: Set pre_enable_prev_first
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: Sean Paul <sean@poorly.run>, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-kernel@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-arm-msm@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Vinod Koul <vkoul@kernel.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, freedreno@lists.freedesktop.org,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Feb 27, 2023 at 5:24=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 28/02/2023 02:26, Doug Anderson wrote:
> > Hi,
> >
> > On Wed, Feb 1, 2023 at 1:51=E2=80=AFAM Dave Stevenson
> > <dave.stevenson@raspberrypi.com> wrote:
> >>
> >> On Tue, 31 Jan 2023 at 22:22, Douglas Anderson <dianders@chromium.org>=
 wrote:
> >>>
> >>> Set the "pre_enable_prev_first" as provided by commit 4fb912e5e190
> >>> ("drm/bridge: Introduce pre_enable_prev_first to alter bridge init
> >>> order"). This should allow us to revert commit ec7981e6c614
> >>> ("drm/msm/dsi: don't powerup at modeset time for parade-ps8640") and
> >>> commit 7d8e9a90509f ("drm/msm/dsi: move DSI host powerup to modeset
> >>> time").
> >>
> >> I see no reference in the TC358762 datasheet to requiring the DSI
> >> interface to be in any particular state.
> >> However, setting this flag does mean that the DSI host doesn't need to
> >> power up and down for each host_transfer request from
> >> tc358762_pre_enable/tc358762_init, so on that basis I'm good with it.
> >>
> >> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >>
> >>> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >>> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >>> ---
> >>>
> >>> (no changes since v1)
> >>>
> >>>   drivers/gpu/drm/bridge/tc358762.c | 1 +
> >>>   1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/brid=
ge/tc358762.c
> >>> index 0b6a28436885..77f7f7f54757 100644
> >>> --- a/drivers/gpu/drm/bridge/tc358762.c
> >>> +++ b/drivers/gpu/drm/bridge/tc358762.c
> >>> @@ -229,6 +229,7 @@ static int tc358762_probe(struct mipi_dsi_device =
*dsi)
> >>>          ctx->bridge.funcs =3D &tc358762_bridge_funcs;
> >>>          ctx->bridge.type =3D DRM_MODE_CONNECTOR_DPI;
> >>>          ctx->bridge.of_node =3D dev->of_node;
> >>> +       ctx->bridge.pre_enable_prev_first =3D true;
> >>>
> >>>          drm_bridge_add(&ctx->bridge);
> >
> > Abhinav asked what the plan was for landing this [1]. Since this isn't
> > urgent, I guess the plan is to land patch #1 in drm-misc-next. Then we
> > sit and wait until it percolates into mainline and, once it does, then
> > patch #2 and #3 can land.
> >
> > Since I have Dave's review I can commit this to drm-misc-next myself.
> > My plan will be to wait until Thursday or Friday of this week (to give
> > people a bit of time to object) and then land patch #1. Then I'll
> > snooze things for a while and poke Abhinav and Dmitry to land patch #2
> > / #3 when I notice it in mainline. If, at any point, someone comes out
> > of the woodwork and yells that this is breaking them then, worst case,
> > we can revert.
>
> This plan sounds good to me.

Pushed to drm-misc-next:

55cac10739d5 drm/bridge: tc358762: Set pre_enable_prev_first

If my math is right then I'd expect that to get into mainline for
6.4-rc1. I guess that means it'll be in Linus's tree mid-May. I'll
schedule a reminder to suggest landing at patches #2 and #3 again in
late May.

-Doug
