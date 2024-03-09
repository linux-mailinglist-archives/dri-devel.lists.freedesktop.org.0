Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8A9877134
	for <lists+dri-devel@lfdr.de>; Sat,  9 Mar 2024 13:51:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA403112005;
	Sat,  9 Mar 2024 12:51:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xdnxjIJV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D831112005
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Mar 2024 12:50:59 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-dc74435c428so2920251276.2
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Mar 2024 04:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709988659; x=1710593459; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FpdDui4dtfTDgXa3V4vSwAx/FAfCbg9OZ3d9WLKbM+w=;
 b=xdnxjIJVCpBjboTJFY9yLNwf7Z1Q1zlu+vxo3YqyZV/paiyIMZYeQgxjqtJVUiSOIj
 QqCH2UBBkS/s/TW3qJcKDnl4OI0DO3HUcLjv30FCD1O13fkzO0LO5ODCV8BTtutIitqm
 QM++HPBUZQzicPBuG+mYDKWmCdGrZxaxLCdRDKTxq9ft/HzZOIhl4K03szYvxQk1zDJl
 V3UfBhmUJ6/OUAzySWCfdCTjdCxznmzUT+v2r3DXga+mb2DIISdkklsmiSRXgawTFzk/
 1PmY2ciktBxsa984C7AmTrEL1qwjLGpB88fMmDsWc8z4++VD99GJLyF7CV0mQMm1Tbt7
 E15Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709988659; x=1710593459;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FpdDui4dtfTDgXa3V4vSwAx/FAfCbg9OZ3d9WLKbM+w=;
 b=nVRqSOMsntz4zaViO2EvLmaCJdH1l4Gsdmna+XK/mb/7dNN9q8nWrixchBg7D9ydoj
 e5YqkKo7qdsDRySGn+25l9+MHLr9DYlIJSOOsGl4Dn8sdignmVf4XYW7bUS62dn3Ruzs
 993Vjbgb42rIhC0AcXXDbS9GqJAI/XwDK5visaAR1cpRhlrgZeYrFWYfQZLsOJHXHSAW
 jG0HrZVHg4Sd90gRkZYkQk+Zr9LaoMTBNHijTs3acaXzD03kMB1RtDBdKdTLN7iPRSIe
 tTRWoRzEOntdwWqSWB1W3sKrd1J0zkIFysLgq8T46b95BKtD3w/GBlhdhPjtyxTpkmd/
 jezQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7gtknRohAiRoZ/CmvGLcxebBo/yTc4ybh+/6bIj1VBKgKlvf0T4zoOdZf09z0o9tPdZcLW+Xu055fpPPahe+ksSU60AL5PZ+vgN/yAaNK
X-Gm-Message-State: AOJu0YwkshcIkD1a/xkII/L2TD2TI5S00ZMYP707VFQrpGmwiSWnJxmb
 HK7ntWKTxLhX7feFO/OrSW4OjFYIDKWw/bnJRgryulOOSciJo8rCNwZWA7ZZxqDRuq+SxvacjgJ
 qHdwcJ5+mM4CCuDfNFDZwsTw+LtCv97rq501DJw==
X-Google-Smtp-Source: AGHT+IGnUYF0gCMHLcf1QFwa56sieLf++DhvZeij5X23g7go7ltIIcQm14JZowxQn+1PenGYypISbvzmUaJpUZPWAgM=
X-Received: by 2002:a25:ac93:0:b0:dc7:8c3a:4e42 with SMTP id
 x19-20020a25ac93000000b00dc78c3a4e42mr1076338ybi.30.1709988658836; Sat, 09
 Mar 2024 04:50:58 -0800 (PST)
MIME-Version: 1.0
References: <20240307172334.1753343-1-sui.jingfeng@linux.dev>
 <20240307172334.1753343-2-sui.jingfeng@linux.dev>
 <CAA8EJpp8tsHi0RhsJXG+r6nOsV3AUC_n6jNHL0Cr6Ku2h3NMog@mail.gmail.com>
 <45f59f31-1f03-4a96-adb6-25c7cdd5e8a1@linux.dev>
 <CAA8EJpqq1-cEke6wEFZFDnpz4tFBcL6HF3=Qtf-8Q3WbogLS8A@mail.gmail.com>
 <c84fcdba-af50-4212-a8e3-f492c2b02ce4@linux.dev>
 <CAA8EJppTcPO3j7GpGcGbKPUjQ=3rTMMOrU1SYR3mtkWLztf2qQ@mail.gmail.com>
 <7535b3ba-6bbb-411c-82a4-cd4ac45de1a6@linux.dev>
 <CAA8EJpp3yd33pYweL_exrXMJ3g-m7-yjJrjiVMVMevOadBtt8g@mail.gmail.com>
 <b573ec32-fe07-498c-abe7-f9a16bdc1c21@linux.dev>
In-Reply-To: <b573ec32-fe07-498c-abe7-f9a16bdc1c21@linux.dev>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 9 Mar 2024 14:50:47 +0200
Message-ID: <CAA8EJpo1Zk5Z80Jh24ygJH-djfHrLK7wVC8AFe99AOetWpmUgw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] drm/bridge: Add fwnode based helpers to get the
 next bridge
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Phong LE <ple@baylibre.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 9 Mar 2024 at 13:25, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
>
> Hi,
>
>
> On 2024/3/9 18:39, Dmitry Baryshkov wrote:
> > On Sat, 9 Mar 2024 at 11:33, Sui Jingfeng <sui.jingfeng@linux.dev> wrot=
e:
> >> Hi,
> >>
> >>
> >> On 2024/3/8 04:40, Dmitry Baryshkov wrote:
> >>>>> But really, there is nothing so hard about it:
> >>>>> - Change of_node to fw_node, apply an automatic patch changing this=
 in
> >>>>> bridge drivers.
> >>>>> - Make drm_of_bridge functions convert passed of_node and comp
> >>>>>
> >>>>> After this we can start cleaning up bridge drivers to use fw_node A=
PI
> >>>>> natively as you did in your patches 2-4.
> >>>> Yes, it's not so hard. But I'm a little busy due to other downstream=
 developing
> >>>> tasks. Sorry, very sorry!
> >>>>
> >>>> During the talk with you, I observed that you are very good at fwnod=
e domain.
> >>>> Are you willing to help the community to do something? For example, =
currently
> >>>> the modern drm bridge framework is corrupted by legacy implement, is=
 it possible
> >>>> for us to migrate them to modern? Instead of rotting there? such as =
the lontium-lt9611uxc.c
> >>>> which create a drm connector manually, not modernized yet and it's D=
T dependent.
> >>>> So, there are a lot things to do.
> >>> Actually, lontium-lt9611uxc.c does both of that =F0=9F=98=89 It suppo=
rts
> >>> creating a connector and it as well supports attaching to a chain
> >>> without creating a connector. Pretty nice, isn't it?
> >>
> >> But why the drm_bridge_connector helpers and/or the drm_connector brid=
ge can't suit you need?
> >> Coding this way just add boilerplate into drm bridge subsystem, right?
> > Because there are platforms, like iMX LCDIF which can use the
> > lt9611uxc bridge, but do not make use of the drm_bridge_connector yet.
> >
>
> Well, I have just grepped across the drm-tip kernel branch, but I don't f=
ind
> iMX LCDIF you mentioned. See the search results pasted at bellow.

Please take a look at the commit 8ddce13ae696 ("drm/bridge: lt9611: Do
not generate HFP/HBP/HSA and EOT packet"). As you can see from the
description, Marek has been using this bridge with th iMX8MM / iMX8MP
boards. As soon as mxsfb has been updated to pass
DRM_BRIDGE_ATTACH_NO_CONNECTOR, we can drop corresponding code from
LT9611UXC driver.

> $ find . -name "*.dts" -type f | xargs grep "lontium,lt9611uxc"
> ./arm64/boot/dts/qcom/sm8450-hdk.dts:           compatible =3D "lontium,l=
t9611uxc";
> ./arm64/boot/dts/qcom/qrb5165-rb5.dts:          compatible =3D "lontium,l=
t9611uxc";
> ./arm64/boot/dts/qcom/qrb2210-rb1.dts:          compatible =3D "lontium,l=
t9611uxc";
> ./arm64/boot/dts/qcom/qrb4210-rb2.dts:          compatible =3D "lontium,l=
t9611uxc";
> ./arm64/boot/dts/qcom/sm8350-hdk.dts:           compatible =3D "lontium,l=
t9611uxc";
>
>
> So I can't see the drm driver that you refer to, can you pointed it out f=
or study
> purpose? Even it's exist, however, back to that time, why don't you posti=
ng a patch
> to switch it to the canonical design as you mentioned and give the commun=
ity a clean
> design?

If you have iMX8 hardware, please do it. I don't have these boards and
I do not have an intention of acquiring them.

> And those are just *reasons*, from the viewpoint of the *result*.
> The merged patch results in a 'side-by-side' implement and boilerplate ad=
ded
> into drm bridges subsystem, the results doesn't change no matter what the
> reason is, right?

--=20
With best wishes
Dmitry
