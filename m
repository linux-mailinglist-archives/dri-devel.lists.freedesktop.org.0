Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F10CE62078D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 04:34:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E1F110E362;
	Tue,  8 Nov 2022 03:34:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E06A10E219;
 Tue,  8 Nov 2022 03:34:25 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-12c8312131fso14972959fac.4; 
 Mon, 07 Nov 2022 19:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BDw3Gg68r1mAo82wyeCHUt98gJiZsSI0ml7JTaDn03s=;
 b=QOkIOZbqsVhd+vTtWIJAAoUhey3ujk0tDMJGx62ppq7jEsavzriI0c7g/bAzp9oG5A
 yIePbu4jLTiq0zBKlATb6sPP0ZzuNa2fiP+805uK899nh287O5rShjXSobnbT8vg/xQm
 5VI3mbbI55PhVqLAS+A2QifGt07WVcvdo3IHimJ1k+xU4oeM8hRy8gCHrovt/X+Mp0JL
 yvsUx69uPQhlaJqjWn8WG7xi4LSTb8WrxO2RIAdi/2i/3WpECx8Xtwggwa/0adgikGEX
 nvOHhX2sU00rFkftHW0skUxGNEtIMfaCtX9/Da71ClBW5IAWJ7iT0Rt79wSWqOhNe+La
 U90w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BDw3Gg68r1mAo82wyeCHUt98gJiZsSI0ml7JTaDn03s=;
 b=uKIPpPwf4saxW1Rab8ljQnuR3zqYd1iQ4/12Pp84z6h3yhlgtBvCd7DcfleSJtsO3w
 nl/By+9z0JIJuJNqMwTiGNvu1B4LKD6LQFDUzIpR4XX0b4/akGYz2UXMunWbWWFC7KSH
 cB7N0nP61qRjynWGAu6WuBop7HpmTABh557z+FWxxowCUN143Q0tEhrT3FRrMQIf/Cah
 MnCMYQbj9rxLgsbAv16LvGVW61fcg8Tgs4QLYCbKa2mfivbMZsd9iCkATZKVFrik+dcb
 XCkIfUigEcQbABekvUt/BcTUORxsFpTfPm7Uqc7q6VudSsetZZoTpSq7AxMiGP9xtcr2
 AU/w==
X-Gm-Message-State: ACrzQf0ffvuJtV6MfahaLPrK+oz5uIUiFeAfaylEMCgRlISTBlc6pJ8U
 LRuVhw6Atmepwmlzs9xpw+ajRWxNww+l406Cji1UTvcj
X-Google-Smtp-Source: AMsMyM6ic9iVzhaVGRyEno7zttlTNzS/Qd1k0Nk9bzSpHReLupGdrIOatJuMj7zFolXXNFdzxWKjblGETD0oeLTFtI4=
X-Received: by 2002:a05:6871:6a4:b0:13b:a056:f97f with SMTP id
 l36-20020a05687106a400b0013ba056f97fmr31413824oao.38.1667878464722; Mon, 07
 Nov 2022 19:34:24 -0800 (PST)
MIME-Version: 1.0
References: <20221028225952.160-1-quic_jesszhan@quicinc.com>
 <Y2leZDfLj/5963wl@intel.com>
 <5a9167d5-f88d-ed6b-abff-8ae39117feb1@quicinc.com>
 <CAF6AEGtbwsvr5A+mX7BxP95u3RyRiUFzE6dfiZacS96WVBhuvw@mail.gmail.com>
 <c196f010-34e7-4c1c-4ca6-852a4c32b154@quicinc.com>
In-Reply-To: <c196f010-34e7-4c1c-4ca6-852a4c32b154@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 7 Nov 2022 19:34:43 -0800
Message-ID: <CAF6AEGtJcz6dK-vgnYuJsBqm2tDRUYB7Tg2jtQm1-KuTi+z8ZA@mail.gmail.com>
Subject: Re: [Freedreno] [RFC PATCH 0/3] Support for Solid Fill Planes
To: Jessica Zhang <quic_jesszhan@quicinc.com>
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
Cc: daniel.vetter@ffwll.ch, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com, linux-arm-msm@vger.kernel.org,
 dmitry.baryshkov@linaro.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 7, 2022 at 4:22 PM Jessica Zhang <quic_jesszhan@quicinc.com> wr=
ote:
>
>
>
> On 11/7/2022 2:09 PM, Rob Clark wrote:
> > On Mon, Nov 7, 2022 at 1:32 PM Jessica Zhang <quic_jesszhan@quicinc.com=
> wrote:
> >>
> >>
> >>
> >> On 11/7/2022 11:37 AM, Ville Syrj=C3=A4l=C3=A4 wrote:
> >>> On Fri, Oct 28, 2022 at 03:59:49PM -0700, Jessica Zhang wrote:
> >>>> Introduce and add support for COLOR_FILL and COLOR_FILL_FORMAT
> >>>> properties. When the color fill value is set, and the framebuffer is=
 set
> >>>> to NULL, memory fetch will be disabled.
> >>>
> >>> Thinking a bit more universally I wonder if there should be
> >>> some kind of enum property:
> >>>
> >>> enum plane_pixel_source {
> >>>        FB,
> >>>        COLOR,
> >>>        LIVE_FOO,
> >>>        LIVE_BAR,
> >>>        ...
> >>> }
> >>
> >> Hi Ville,
> >>
> >> Makes sense -- this way, we'd also lay some groundwork for cases where
> >> drivers want to use other non-FB sources.
> >>
> >>>
> >>>> In addition, loosen the NULL FB checks within the atomic commit call=
stack
> >>>> to allow a NULL FB when color_fill is nonzero and add FB checks in
> >>>> methods where the FB was previously assumed to be non-NULL.
> >>>>
> >>>> Finally, have the DPU driver use drm_plane_state.color_fill and
> >>>> drm_plane_state.color_fill_format instead of dpu_plane_state.color_f=
ill,
> >>>> and add extra checks in the DPU atomic commit callstack to account f=
or a
> >>>> NULL FB in cases where color_fill is set.
> >>>>
> >>>> Some drivers support hardware that have optimizations for solid fill
> >>>> planes. This series aims to expose these capabilities to userspace a=
s
> >>>> some compositors have a solid fill flag (ex. SOLID_COLOR in the Andr=
oid
> >>>> hardware composer HAL) that can be set by apps like the Android Gear=
s
> >>>> app.
> >>>>
> >>>> Userspace can set the color_fill value by setting COLOR_FILL_FORMAT =
to a
> >>>> DRM format, setting COLOR_FILL to a color fill value, and setting th=
e
> >>>> framebuffer to NULL.
> >>>
> >>> Is there some real reason for the format property? Ie. why not
> >>> just do what was the plan for the crttc background color and
> >>> specify the color in full 16bpc format and just pick as many
> >>> msbs from that as the hw can use?
> >>
> >> The format property was added because we can't assume that all hardwar=
e
> >> will support/use the same color format for solid fill planes. Even for
> >> just MSM devices, the hardware supports different variations of RGB
> >> formats [1].
> >
> > Sure, but the driver can convert the format into whatever the hw
> > wants.  A 1x1 color conversion is not going to be problematic ;-)
>
> Hi Rob,
>
> Hm... that's also a fair point. Just wondering, is there any advantage
> of having the driver convert the format, other than not having to
> implement an extra format property?
>
> (In case we end up wrapping everything into a prop blob or something)
>

It keeps the uabi simpler.. for obvious reasons you don't want the
driver to do cpu color conversion for an arbitrary size plane, which
is why we go to all the complexity to expose formats and modifiers for
"real" planes, but we are dealing with a single pixel value here,
let's not make the uabi more complex than we need to.  I'd propose
making it float32[4] if float weren't a pita for kernel/uabi, but
u16[4] or u32[4] should be fine, and drivers can translate that easily
into whatever weird formats their hw wants for solid-fill.

BR,
-R
