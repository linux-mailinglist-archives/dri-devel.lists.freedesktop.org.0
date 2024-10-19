Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C11B9A4AF9
	for <lists+dri-devel@lfdr.de>; Sat, 19 Oct 2024 04:44:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7554C10E0B0;
	Sat, 19 Oct 2024 02:44:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MWL2/C1k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9268310E0B0
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2024 02:44:36 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-6e214c3d045so22379837b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 19:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729305875; x=1729910675; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=miaF/bzpaXxt5iwAcqBRvDZdA63BMI9c1o0s4Dvr9rc=;
 b=MWL2/C1kkPiVcWvBoF+aYBfNB8mxWIoO3SZEUq9BJr8m88MOPxUE4kt+9PzgwgDJ4G
 PThog0wnGEHmB7ZPIRDP6stV9GSBFRBDd2u2UimPgIhjQVZ6eA/fD7B1FRIEiHhj93SG
 zreojeSp3CEbBOpo92ssMwLEvNpP+pHcgBhwCWloT36SnsxxGIkqQ/jq/XAvDFa+Cccj
 5fFmNyWW3X7kcmiDEdOVisSJJ0G7bz/msipD93oaGo6f4quGx5XXZlZ/YemsbiivISNK
 tFHTm1+MU00SqtFuBYQH18vBa5+0ghs8IOHwU0FCLjnoc6iAmz5A1SoPusfmXJe5YDc8
 N+yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729305875; x=1729910675;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=miaF/bzpaXxt5iwAcqBRvDZdA63BMI9c1o0s4Dvr9rc=;
 b=bqq3gJi3phfGudJcI0Do1oJwzv5/woJBJhuwQtXpQlGK9oNtRF0/ATVzfud9jvFu16
 DjcA7WJrv8pEgHIFwk8dtGzeuoGMICqX7anm2Es6/5JkPNB6VXdzBBJDUn9GPdy6hdJp
 3V89P0wXZeq5yYtXAEd9BBRZZbYzsdyfFgU7r3flBUH14WfJEy2leGgXk/18ze10J9lJ
 z+Eh0hsvCZ9ogVMn72wAM2FD5hVi4FbTpHfEQpQ13cJRl+3ps63Z/o08ADPUlHNIlbR9
 GwrgOv8cKkisWB+tDNPty4A6LtgGB1uWLAQBOhS533QoZ/dvri1Esv0A1+DN2m7Tv9q2
 UbZQ==
X-Gm-Message-State: AOJu0Yw44Cs6qb+cW5sZPgNWtmk1I6f8JEmNc1l/wzhK8LK5/eMsDQ2O
 2B+ECJ1FqHzE/ZSPdjYIPuM7RqUHfqIhpAoZZkr13EhbuIQz0C9BEiyL6uLc+MvDTzyBVAzDaXx
 zEn5JAVcCPtb0fKnWMkfUTJrur8CmP9IO1AkTsA==
X-Google-Smtp-Source: AGHT+IET/AXMNwoRFwVXHuhBACWA9SQCiFexSXwoY0rVTaRw1no0IViR/dKMbVXvof5PtqZm9DbMaQZ30RW3YSLJrLM=
X-Received: by 2002:a05:690c:ecc:b0:65f:a0e5:8324 with SMTP id
 00721157ae682-6e5bf72bf64mr50318227b3.4.1729305875248; Fri, 18 Oct 2024
 19:44:35 -0700 (PDT)
MIME-Version: 1.0
References: <20241012073543.1388069-1-victor.liu@nxp.com>
 <20241012073543.1388069-6-victor.liu@nxp.com>
 <4a7rwguypyaspgr5akpxgw4c45gph4h3lx6nkjv3znn32cldrk@k7qskts7ws73>
 <07b47f70-5dab-4813-97fa-388a0c0f42e9@nxp.com>
 <dvcdy32dig3w3r3a7eib576zaumsoxw4xb5iw6u6b2rds3zaov@lvdevbyl6skf>
 <90e0c4ac-1636-4936-ba40-2f7693bc6b32@nxp.com>
 <lcogrc6uztckwwwsuag5tlk5otidmo7rudsl7zshe3wpfot3wc@ziljns5phhfe>
 <d5d62f61-808f-4c40-bc71-4e168baf4b1b@nxp.com>
In-Reply-To: <d5d62f61-808f-4c40-bc71-4e168baf4b1b@nxp.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 19 Oct 2024 05:44:23 +0300
Message-ID: <CAA8EJpqcm66+3d6Qi02pjmiBipFeV7dDdY8m=NR2Q=L9EgRVcA@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] dt-bindings: display: bridge: Add ITE IT6263 LVDS
 to HDMI converter
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, catalin.marinas@arm.com, 
 will@kernel.org, quic_bjorande@quicinc.com, geert+renesas@glider.be, 
 arnd@arndb.de, nfraprado@collabora.com, o.rempel@pengutronix.de, 
 y.moog@phytec.de, marex@denx.de, isaac.scott@ideasonboard.com, 
 biju.das.jz@bp.renesas.com
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

On Tue, 15 Oct 2024 at 09:27, Liu Ying <victor.liu@nxp.com> wrote:
>
> On 10/14/2024, Dmitry Baryshkov wrote:
> > On Mon, Oct 14, 2024 at 01:33:44PM +0800, Liu Ying wrote:
> >> On 10/14/2024, Dmitry Baryshkov wrote:
> >>> On Sat, Oct 12, 2024 at 05:14:13PM +0800, Liu Ying wrote:
> >>>> On 10/12/2024, Dmitry Baryshkov wrote:
> >>>>> On Sat, Oct 12, 2024 at 03:35:39PM +0800, Liu Ying wrote:
> >>>>>> Document ITE IT6263 LVDS to HDMI converter.
> >>>>>>
> >>>>>> Product link:
> >>>>>> https://www.ite.com.tw/en/product/cate1/IT6263
> >>>>>>
> >>>>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> >>>>>> ---
> >>>>>> v2:
> >>>>>> * Document number of LVDS link data lanes.  (Biju)
> >>>>>> * Simplify ports property by dropping "oneOf".  (Rob)
> >>>>>>
> >>>>>>  .../bindings/display/bridge/ite,it6263.yaml   | 276 ++++++++++++++++++
> >>>>>>  1 file changed, 276 insertions(+)
> >>>>>>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
> >>>>>>
> >>>>>> diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
> >>>>>> new file mode 100644
> >>>>>> index 000000000000..bc2bbec07623
> >>>>>> --- /dev/null
> >>>>>> +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
> >>>>>> @@ -0,0 +1,276 @@
> >>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>>>>> +%YAML 1.2
> >>>>>> +---
> >>>>>> +$id: http://devicetree.org/schemas/display/bridge/ite,it6263.yaml#
> >>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>>>>> +
> >>>>>> +title: ITE IT6263 LVDS to HDMI converter
> >>>>>> +
> >>>>>> +maintainers:
> >>>>>> +  - Liu Ying <victor.liu@nxp.com>
> >>>>>> +
> >>>>>> +description: |
> >>>>>> +  The IT6263 is a high-performance single-chip De-SSC(De-Spread Spectrum) LVDS
> >>>>>> +  to HDMI converter.  Combined with LVDS receiver and HDMI 1.4a transmitter,
> >>>>>> +  the IT6263 supports LVDS input and HDMI 1.4 output by conversion function.
> >>>>>> +  The built-in LVDS receiver can support single-link and dual-link LVDS inputs,
> >>>>>> +  and the built-in HDMI transmitter is fully compliant with HDMI 1.4a/3D, HDCP
> >>>>>> +  1.2 and backward compatible with DVI 1.0 specification.
> >>>>>> +
> >>>>>> +  The IT6263 also encodes and transmits up to 8 channels of I2S digital audio,
> >>>>>> +  with sampling rate up to 192KHz and sample size up to 24 bits. In addition,
> >>>>>> +  an S/PDIF input port takes in compressed audio of up to 192KHz frame rate.
> >>>>>> +
> >>>>>> +  The newly supported High-Bit Rate(HBR) audio by HDMI specifications v1.3 is
> >>>>>> +  provided by the IT6263 in two interfaces: the four I2S input ports or the
> >>>>>> +  S/PDIF input port.  With both interfaces the highest possible HBR frame rate
> >>>>>> +  is supported at up to 768KHz.
> >>>>>> +
> >>>>>> +properties:
> >>>>>
> >>>>> No LVDS data-mapping support?
> >>>>
> >>>> It is enough to document number of LVDS link data lanes
> >>>> because OS should be able to determine the data-mapping
> >>>> by looking at the number and the data-mapping capability
> >>>> of the other side of the LVDS link.
> >>>
> >>> From what I can see, data-mapping is specified on the consumer sink side
> >>> of the LVDS link. This means it should go to the bridge's device node.
> >>
> >> Then, I won't define data-lanes, because data-mapping implies it,
> >> e.g., jeida-24 implies data lanes 0/1/2/3, see lvds-data-mapping.yaml.
> >>
> >> Please let me know which one you prefer.
> >
> > I'd prefer data-mapping.
>
> Before I go ahead to use it, I'd like to get confirmation that
> it'll cover data mapping which supports 30-bit RGB pixel transmission,
> because it is something supported by IT6263 as I mentioned in v1
> dt-binding discussion.  For now, data-mapping only supports jeida-18,
> jeida-24 and vesa-24, see lvds-data-mapping.yaml.  And, I'm not
> sure the 30-bit data mappings specified in IT6263 datasheet are
> standard or not.

It is not. At the time the standards were written, nobody was actually
thinking about the 30bpp panels.

> Note that if we use data-lanes instead, then this is not a concern
> from DT PoV, as data mapping can be inferred by OS.

It can not. There is no way to determine if JEIDA or VESA / SPWG
format is being used if it is not declared.
Moreover, <uapi/linux/media-bus-format.h> doesn't declare 1X7X5
formats. If you are to support 30bpp LVDS, you'd need to define two
corresponding constants, then extend data-mapping definition and code
by documenting 5-lane LVDS as standards extension to support 30bpp
transfers.


-- 
With best wishes
Dmitry
