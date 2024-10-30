Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AB39B5A44
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 04:20:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A37B10E198;
	Wed, 30 Oct 2024 03:20:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GQ5gVcMH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8621C10E198
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 03:20:54 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-6e5b7cd1ef5so56432197b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 20:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730258453; x=1730863253; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=T9iHB+TnDUm4jF2fdOU5XWejl3GGCTCDW+b12N/hHY0=;
 b=GQ5gVcMHTMNeqP31Vc+CxttIgwKqHp+w6zuxxlfB8zkmaBLjP5A5lYeTpYTiaGUn7M
 y9Id7nyk6+uyi+gA6CfbINb05hT+EimCWL1/Vuk4vAr4O/2VLanC+jHlYbFyLzlV/7zL
 qTx0PxdCetcjTFLgu+vaugUv3KNOjvGaoGzpEVycj+Rv13YdX2QVadR7MdVF/ANE2vr2
 LphcawwAL+hbUv4ipJ3mlihjXJUI8K0bhbVykn44jthfHpQay2EUXZ0EDorILHZt8I2x
 ckUsltZTpM+N4bBNF0feLub9S02D1OS8eG5ktLMJy3DW5DILEBYdBse4/seMmVyDzDxv
 9mEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730258453; x=1730863253;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T9iHB+TnDUm4jF2fdOU5XWejl3GGCTCDW+b12N/hHY0=;
 b=oIY7OwWNbfXi3EbG6O3A/gofcBDh21SEsIM42ff+SjuYQLuBpjM+bPAUfEim5/tJd4
 eoG3MeJQmVgn/Yloj2KhrMmuqO1K6qMqpGL5zLOkKkCy0tm4CGltj+0/2N0GH/X/yTXv
 f/88RezWgf3zhqxe7bSS2EdCofLo11dptjuIUHZmyguYbPmEm1GKXREQgxXd276raAD9
 Wr33Z0mloxVM0wNxr0ggVKdrqoAGJ7oZwl5b7gXVH7CgKop+mcmW57EjdsRmYloPUmIJ
 fR5c/GDj89TM1xkjAzzkd7JF9gP67ezp/Qd8RB8WOOeJxzeCcyS/ztky/BrwkTcFactD
 H4zA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJ1UkHnMAiENOx5NaxTYPY5zlPjRb6/nTyf5avKgfftZ4+LRZDlY76a3Z/DuHgTWgiDAxLxjsC9IQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyY/WTI0sj5noY6O5mEwyL2bPi6ywnrq1BfoVpeoBxSNUFbGT6L
 svDJHZTzuDifteQI0dcRefdBe+d4EO4qDj6PPu6D5LerxFemFrb4iScpRJ77mIiQq/9PgfDD9t7
 LOrX79ci1keOOyulYzhQvJMAZBGRC78w3EB92pQ==
X-Google-Smtp-Source: AGHT+IFP18Fs2tm+rkcoRcGuOjeKCtHmaRhumXjK8HFzyE2dMFMrDGTjZVI7r8/PZwnSMuCmogkovvlmIbOEJH7HW6w=
X-Received: by 2002:a05:690c:6402:b0:6e3:32e2:ecbf with SMTP id
 00721157ae682-6e9d89951a7mr151053517b3.24.1730258453510; Tue, 29 Oct 2024
 20:20:53 -0700 (PDT)
MIME-Version: 1.0
References: <20241028023740.19732-1-victor.liu@nxp.com>
 <CAA8EJprFBbC_=kBHi86j-nE_K68QeG+c2OBzJCbUyNWs5zQK0Q@mail.gmail.com>
 <TY3PR01MB11346F956733032EC10E997AF864A2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <5ycxltnw3vhik3iype6ncuh4nelwwtom745o5dlf32qyiqh5bv@yjj5l6kb2psm>
 <1e8526e5-d9b7-42ac-9db3-13b42ccc4fbe@nxp.com>
In-Reply-To: <1e8526e5-d9b7-42ac-9db3-13b42ccc4fbe@nxp.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 30 Oct 2024 05:16:30 +0200
Message-ID: <CAA8EJppAnfiVqNYN6CxaU1Q5fMwDgWhSsPU9qQz7KHb6px=grA@mail.gmail.com>
Subject: Re: [PATCH v4 00/13] Add ITE IT6263 LVDS to HDMI converter support
To: Liu Ying <victor.liu@nxp.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>, 
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "rfoss@kernel.org" <rfoss@kernel.org>, 
 "laurent.pinchart" <laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, 
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, 
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "robh@kernel.org" <robh@kernel.org>, 
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, 
 "quic_jesszhan@quicinc.com" <quic_jesszhan@quicinc.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>, 
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>, 
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>, 
 "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
 "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, 
 "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>, 
 "quic_bjorande@quicinc.com" <quic_bjorande@quicinc.com>, 
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "arnd@arndb.de" <arnd@arndb.de>, 
 "nfraprado@collabora.com" <nfraprado@collabora.com>, 
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>, 
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 "sam@ravnborg.org" <sam@ravnborg.org>, "marex@denx.de" <marex@denx.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 29 Oct 2024 at 04:41, Liu Ying <victor.liu@nxp.com> wrote:
>
> On 10/28/2024, Dmitry Baryshkov wrote:
> > On Mon, Oct 28, 2024 at 11:12:00AM +0000, Biju Das wrote:
> >> Hi Dmitry, Liu,
> >>
> >>> -----Original Message-----
> >>> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> Sent: 28 October 2024 10:20
> >>> Subject: Re: [PATCH v4 00/13] Add ITE IT6263 LVDS to HDMI converter support
> >>>
> >>> Hi,
> >>>
> >>> On Mon, 28 Oct 2024 at 04:37, Liu Ying <victor.liu@nxp.com> wrote:
> >>>>
> >>>> Hi,
> >>>>
> >>>> This patch series aims to add ITE IT6263 LVDS to HDMI converter on
> >>>> i.MX8MP EVK.  Combined with LVDS receiver and HDMI 1.4a transmitter,
> >>>> the IT6263 supports LVDS input and HDMI 1.4 output by conversion
> >>>> function.  IT6263 product link can be found at [1].
> >>>>
> >>>> Patch 1 is a preparation patch to allow display mode of an existing
> >>>> panel to pass the added mode validation logic in patch 3.
> >>>>
> >>>> Patch 2 allows i.MX8MP LVDS Display Bridge(LDB) bridge driver to find
> >>>> the next non-panel bridge, that is the IT6263 in this case.
> >>>>
> >>>> Patch 3 adds mode validation logic to i.MX8MP LDB bridge driver
> >>>> against "ldb" clock so that it can filter out unsupported display
> >>>> modes read from EDID.
> >>>>
> >>>> Patch 4 adds MEDIA_BUS_FMT_RGB101010_1X7X5_{SPWG,JEIDA} support, as
> >>>> they are supported by IT6263(with LVDS data bit reversed order).
> >>>>
> >>>> Patch 5 makes drm_of.c use MEDIA_BUS_FMT_RGB101010_1X7X5_{JEIDA,SPWG}.
> >>>>
> >>>> Patch 6 supports getting dual-link LVDS pixel order for the sink side
> >>>> as needed by IT6263 driver.
> >>>>
> >>>> Patch 7 documents jeida-30 and vesa-30 data mappings in
> >>>> lvds-data-mapping.yaml, as needed by IT6263 DT binding.
> >>>>
> >>>> Patch 8 extracts common dual-link LVDS display properties into new
> >>>> lvds-dual-ports.yaml so that IT6263 DT binding can reference it.
> >>>>
> >>>> Patch 9 adds DT binding for IT6263.
> >>>>
> >>>> Patch 10 adds IT6263 bridge driver.  Only video output is supported.
> >>>>
> >>>> Patch 11 adds DT overlays to support NXP adapter cards[2][3] with
> >>>> IT6263 populated.
> >>>>
> >>>> Patch 12 enables the IT6263 bridge driver in defconfig.
> >>>>
> >>>> Patch 13 updates MAINTAINERS to add maintainer for IT6263 driver.
> >>>
> >>> This has pretty complicated structure from the merging point of view.
> >>>
> >>> I propose we take patches 6, 8, 9 (without 30-bit formats, they can be dropped while applying), 11, 12
> >>> (?) and 13 through drm-misc in one batch (once DT maintainers review the binding parts). This looks
> >>> like a minimal set, having no extra dependencies.
> >>
> >>>
> >>> The second set might be 4, 5 + new patch, re-adding 30-bit formats to
> >>> IT6263 binding (no driver changes are necessary). This can go in separately, after an Ack from media
> >>> maintainers.
> >>>
> >>> Of course both sets can go together if linux-media maintainers reacts quickly and ack merging media-
> >>> formats patch through drm-misc tree.
>
> I'm fine with merging the two sets through drm-misc tree as long
> as linux-media and dri-devel maintainers accept this.  Up to them.
>
> >>>
> >>> The rest of the patches don't have such strong dependencies and go in once ready / reviewed.
> >>>
> >>> WDYT?
> >>
> >> I guess, 6,8,9(without 30-bit formats), 10, 12 and 13.
> >>
> >> 11 may have dependency on 1, 2 and 3 as it is SoC specific.
> >
> > Yes, of course, 10, not 11.
> >
> >> Then 4, 5 + new patch, re-adding 30-bit formats to IT6263 binding.
>
> I think it would be good to directly support 30-bit formats in
> IT6263 DT binding, not re-add them to it.  This way, we'll have one
> version of the binding, not two.  So, a better first set would
> contain patch 6, 7(one existing A-b from Krzysztof), 8, 9, 10, 12
> and 13.

I'm not sure that 7 can go without an ack from linux-media maintainers.

-- 
With best wishes
Dmitry
