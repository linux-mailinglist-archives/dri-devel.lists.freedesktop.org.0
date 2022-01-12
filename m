Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 270FE48BBBB
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 01:16:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 634C910E25C;
	Wed, 12 Jan 2022 00:16:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C83A10E1D2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 00:16:09 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id b11so1161764qtk.12
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 16:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2K2UmC0bP9JvpFDK04lp6Br3RCH+4+xuKKLFFxC44Qc=;
 b=sLhDfmerJHymKuwC7MWW1onmvUqyDBSn34sAbwLLErcQWF8noxHwCpo/NakwDUCgDV
 V9WiaRTnmMvkyWgtfPj2V/YcAY0R6Daoia5IQH6g7mRiA4p1vopMnVSvciq5spVz8JAf
 YKsfTFkynU+8VX37eu6RepnptK/1qnHQcwIrf4AiyrGh62iVWIZ6j/zXsHVXrN7O7+Bn
 smEyb3bl9+CcTiMJ6mUoiHIt4D9dPdSOj1AY/bYV6Wdx39Wus2QCTaAhGEuIa0iTHmaa
 i0IWDD+olVn2CTIczv8t1P1NbTewRParDs92hvEzvlunWzLWxt3ux7ejwa9fCY8NdZX/
 bmAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2K2UmC0bP9JvpFDK04lp6Br3RCH+4+xuKKLFFxC44Qc=;
 b=uhaXfW5+EE1edfgLuVIqRy8oNY5HLAxWg8GEQJiBK6/szK6YycjPvzLTooAJOF4BSE
 js2WhlM1GzTrSMd91CrxoEd+G7gvycZ+YfOriyyyYGBUUSSBad/BvWsPyTpPhdGU8ZHC
 3eBNIBJbH0pa9WSguP4C0B0rKtFxZ/Gjt7+NUkBRgqX7nx636kKyQXQI6mtOn1aiEUw/
 gPc3WECjbG/HHYu7gqA+m9p0jPyR96qH8WLJxjzIytgTvOOO1DQENhJYbN7dAEPMQdLo
 ZHdgPzVWMYunq/HZC9IokNexPqw2ohe2GGHOGPLAYubbpSetULlt4LdSL7JJkHCZjRlg
 j34w==
X-Gm-Message-State: AOAM5318Ha1W2/kMYmnkWMI3RegxPPmrId/tdSKO4FFjNgyjpiSoOsaK
 OSSLgOzCsPQXkBcwf/gxBAJjrbdHYg13m/sb0FGHSA==
X-Google-Smtp-Source: ABdhPJxeYcI0NBlx89MzlrVr8mcH9E/Ufg76NQoVax/bIpVFJaWuKzmekEyAayfuCtRsQhCzGgo8AUvs9kFVgykkrDo=
X-Received: by 2002:a05:622a:11d4:: with SMTP id
 n20mr5762816qtk.295.1641946568545; 
 Tue, 11 Jan 2022 16:16:08 -0800 (PST)
MIME-Version: 1.0
References: <20220107020132.587811-1-dmitry.baryshkov@linaro.org>
 <20220107020132.587811-3-dmitry.baryshkov@linaro.org>
 <CAE-0n51XaV1+rh4CZKz7gMZBPkpq+wHcbNbgHFxoC1ikoDLkhQ@mail.gmail.com>
 <a97cec56-5a8d-2b92-2850-af2a6d3fbf09@linaro.org>
 <7ce0750b-2e0a-1036-f156-3cc8212e6099@quicinc.com>
In-Reply-To: <7ce0750b-2e0a-1036-f156-3cc8212e6099@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 12 Jan 2022 03:15:57 +0300
Message-ID: <CAA8EJpoy-qY9xE5dQReWuk09jojLxs-VddX9GwmqmC-Rdx-PCg@mail.gmail.com>
Subject: Re: [RFC PATCH 2/7] drm/msm/dp: support attaching bridges to the DP
 encoder
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 12 Jan 2022 at 02:12, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
>
> On 1/6/2022 9:26 PM, Dmitry Baryshkov wrote:
> > On 07/01/2022 06:42, Stephen Boyd wrote:
> >> Quoting Dmitry Baryshkov (2022-01-06 18:01:27)
> >>> Currently DP driver will allocate panel bridge for eDP panels.
> >>> Simplify this code to just check if there is any next bridge in the
> >>> chain (be it a panel bridge or regular bridge). Rename panel_bridge
> >>> field to next_bridge accordingly.
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>>   drivers/gpu/drm/msm/dp/dp_display.c |  2 +-
> >>>   drivers/gpu/drm/msm/dp/dp_display.h |  2 +-
> >>>   drivers/gpu/drm/msm/dp/dp_drm.c     |  4 ++--
> >>>   drivers/gpu/drm/msm/dp/dp_parser.c  | 26 ++++++++------------------
> >>>   drivers/gpu/drm/msm/dp/dp_parser.h  |  2 +-
> >>>   5 files changed, 13 insertions(+), 23 deletions(-)
> >>
> >> I like this one, it certainly makes it easier to understand.
> >>
> >>> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c
> >>> b/drivers/gpu/drm/msm/dp/dp_parser.c
> >>> index a7acc23f742b..5de21f3d0812 100644
> >>> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> >>> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> >>> @@ -307,11 +299,9 @@ static int dp_parser_parse(struct dp_parser
> >>> *parser, int connector_type)
> >>>          if (rc)
> >>>                  return rc;
> >>>
> >>> -       if (connector_type =3D=3D DRM_MODE_CONNECTOR_eDP) {
> >>
> >> It feels like this is on purpose, but I don't see any comment so I hav=
e
> >> no idea. I think qcom folks are concerned about changing how not eDP
> >> works. I'll have to test it out locally.
> >
> > Ah, another thing that should go into the commit message.
> >
> > Current situation:
> > - DP: no external bridges supported.
> > - eDP: only a drm_panel wrapped into the panel bridge
> >
> > After this patch:
> > - both DP and eDP support any chain of bridges attached.
> >
> >
> > While the change means nothing for the DP (IIUC, it will not have any
> > bridges), it simplifies the code path, lowering the amount of checks.
> >
> > And for eDP this means that we can attach any eDP-to-something bridges
> > (e.g. NXP PTN3460).
> >
> >
> > Well... After re-checking the source code for
> > devm_drm_of_get_bridge/drm_of_find_panel_or_bridge I should probably
> > revert removal of the check. The function will return -ENODEV if
> > neither bridge nor panel are specified.
> >
> I am new to drm and  confusing with bridge here.
>
> Isn't bridge used to bridging two different kind of interface together?
>
> for example, dsi <--> bridge <--> dp.
>
> why edp need bridge here?
>
> Can you give me more info regrading what bridge try to do here.

First, there are bridges converting the eDP interface to another
interface. The mentioned NXP PTN3460 converts (embedded) DisplayPort
to LVDS.

Second (and this is the case here) drm_bridge can be used to wrap
drm_panel (panel-bridge), so that the driver doesn't have to care
about the drm_panel interface.

Last, but not least, external display connectors can also be
abstracted as bridges (see display-connector.c).

This becomes even more appealing as the driver can then switch to
drm_bridge_connector, supporting any kinds of pipelines attached to
the encoder, supporting any kind of converters, panel or external
connector pipelines.Think about the following (sometimes crazy, but
possible) examples. With
drm_bridge/panel-bridge/display-connector/drm_bridge_connector there
is no difference for the driver at all:
- DP encoder =E2=87=92 DP port =E2=87=92 DP monitor
- DP encoder =E2=87=92 DP connector supporting generic GPIO as HPD =E2=87=
=92 DP port =E2=87=92
DP monitor
- eDP encoder =E2=87=92 eDP panel
- eDP encoder =E2=87=92 ptn3460 =E2=87=92 fixed LVDS panel
- eDP encoder =E2=87=92 ptn3460 =E2=87=92 LVDS connector with EDID lines fo=
r panel autodetect
- eDP encoder =E2=87=92 ptn3460 =E2=87=92 THC63LVD1024 =E2=87=92 DPI panel.
- eDP encoder =E2=87=92 LT8912 =E2=87=92 DSI panel

> >>
> >>> -               rc =3D dp_parser_find_panel(parser);
> >>> -               if (rc)
> >>> -                       return rc;
> >>> -       }
> >>> +       rc =3D dp_parser_find_next_bridge(parser);
> >>> +       if (rc)
> >>> +               return rc;
> >>>
> >>>          /* Map the corresponding regulator information according to
> >>>           * version. Currently, since we only have one supported
> >>> platform,
> >
> >



--=20
With best wishes
Dmitry
