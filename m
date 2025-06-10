Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1217BAD3EB2
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 18:22:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA0C410E00D;
	Tue, 10 Jun 2025 16:22:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="n8GI86/2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2CE010E5A5
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 16:22:38 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-742c7a52e97so4875910b3a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 09:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1749572555; x=1750177355;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+MkV/lIBNtXhNBujMG9Z7i6F6IxQ5xfqe1rAYT6Q4Xc=;
 b=n8GI86/2HYXUAwhAUcNCPV2Kbyrxl3dukIiwr6jbyaz0oG2xptd+QbubekVLLNND5i
 afFvalwSZk95Hkvag8roThbqpdXdKNcElqENFPBPXTTjq3ko8lAfwZbhNgiLyffxO5Yu
 7O0Qge8NjWc8981l1Fm8S9euISXguCxJKm/9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749572555; x=1750177355;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+MkV/lIBNtXhNBujMG9Z7i6F6IxQ5xfqe1rAYT6Q4Xc=;
 b=i9tdftlSyyCBJnn7caIDcqbR2JtkNqE14jnx7QymuRI3t/pQOJDkNvorGOZngBhXyn
 JfGEZqZvvwPlr9ubszB5shFZSEYqg5SlGXfrnQOIS3CkoXXWTg53LAXjYWwrUMkFbRTb
 nhs6PetBxUNA8XtD/9BOB6s5uYIktthhhhiZ/s4rvxH7MjPLR1H58h0qo5Hc+NaM+ADV
 w9QE+fdd1jTq2U2xg8F/UYw26KH4NCHqs2WKWveg6g+Ho6huVqqlr1KgHl5uNeZzTLID
 r1BwMdPpnT/JwkRfpGzz8zgq1oL2tl/EEbBFk4E0kS+zogYVb9TPkyOkb10HaiHkfREM
 gx/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBszjk4eXuGnfFu71GLeH3Dh5puVOAFY35jzIoOO1NT7S38N4X+yTu0V4eU1U3gGKfIp5rJrQU6uA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywd2+YbbphXieCzpcH4SLgEtVeBNnEEqK9U3JrjQ+SXk+bokiTk
 O36SIZkh8c0JgzuaThRlRT+1odM6qcdrED8g+luDWJUCPW2Bggwfa1FA/3g+O11Nn1JqoTeztLG
 6xcz0wg==
X-Gm-Gg: ASbGnctb6pF4LkXMG7MwAJdC6oRACPGaDBkZsC8Hz59JLxB5nC7bt9/sl4RCsD9BVTq
 YOQ/EPF/b6pBQvSPL8rbQ0XPX9OtMOulqw8EPtMkFsRl9hKEMDLNqDqWZKStdeA/nJXta2u6tiS
 irdQf7gkFuyFCgiWis1qC0mWsU+fvSuJ2MpYcDHjjz71SyNNoqKT/3Qe1RXDeXTlZPBqoOdtf29
 0N2MzZWKgHcY1gNaQL4xpZm80y5ubJnkV1F3mbgfleuJPcxdsch0f+B11wi1yeorNIds+1eaFzR
 cHbT4+V42WoX58MDh2PSvDYjbsmeLowwa+M4YZauxxQM+Wpv6ZMuuRlBbg/ltiOxFw2bhErMI8p
 l2kBtSPjeZF/wmwtf7RvaGfpIU0T935ROrrno
X-Google-Smtp-Source: AGHT+IFiqXNMabSCMWkDZkJYe5WiZWGs4zWZIgPLcsclFZkQqu1YU/Ox9kdb5+QjZJSig0y6MC2Q4w==
X-Received: by 2002:a05:6a20:9f86:b0:1f5:8622:5ecb with SMTP id
 adf61e73a8af0-21f8673dac3mr332624637.34.1749572555173; 
 Tue, 10 Jun 2025 09:22:35 -0700 (PDT)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com.
 [209.85.216.50]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2f5ed58e9bsm7056934a12.10.2025.06.10.09.22.32
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 09:22:33 -0700 (PDT)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-31393526d0dso1187927a91.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 09:22:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV1CqOCySYpHUAq/pGyVZK9lqBw2QQMz+VCD60U8fy63r/8UBoc5FVDoT9S4FvJDGwfyB54aEwQmBU=@lists.freedesktop.org
X-Received: by 2002:a17:90b:2ecb:b0:311:c1ec:7d03 with SMTP id
 98e67ed59e1d1-313af213ad2mr200487a91.32.1749572552155; Tue, 10 Jun 2025
 09:22:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250529110418.481756-1-j-choudhary@ti.com>
 <2baf3c31-3edf-4c26-bd44-1d0560134871@ti.com>
 <CAMuHMdUi7pf1YfKRjMv_7VuKwjR5XekRXfcEzuPScGzHraGjyQ@mail.gmail.com>
 <84fdbd23-d694-453f-a225-dbac19b34719@ti.com>
 <CAD=FV=XaR6Pq7E-13zR5PC_u=3SD=sc05_TzxWJR2FS040zESg@mail.gmail.com>
 <71c41c44-1c2e-4fee-a1a8-31472c9f838d@ti.com>
In-Reply-To: <71c41c44-1c2e-4fee-a1a8-31472c9f838d@ti.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 10 Jun 2025 09:22:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X2npwru2=2XYpzbvMTc-jFAGzG3xVDRuCp1_D=QoRWcQ@mail.gmail.com>
X-Gm-Features: AX0GCFvFpx0zG4Qs1kd0_XBriaPr08VtGCdfFDF-WmL85SRtc32MwKBnYrqm0zE
Message-ID: <CAD=FV=X2npwru2=2XYpzbvMTc-jFAGzG3xVDRuCp1_D=QoRWcQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort
 connector type
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: ernestvanhoecke@gmail.com, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, 
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, 
 dri-devel@lists.freedesktop.org, tomi.valkeinen@ideasonboard.com, 
 max.krummenacher@toradex.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, kieran.bingham+renesas@ideasonboard.com, 
 linux-kernel@vger.kernel.org, max.oss.09@gmail.com, devarsht@ti.com, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
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

Hi,

On Tue, Jun 10, 2025 at 12:43=E2=80=AFAM Jayesh Choudhary <j-choudhary@ti.c=
om> wrote:
>
> Hello Doug,
>
> On 10/06/25 03:39, Doug Anderson wrote:
> > Hi,
> >
> > On Mon, Jun 2, 2025 at 4:05=E2=80=AFAM Jayesh Choudhary <j-choudhary@ti=
.com> wrote:
> >>
> >> Hello Geert, Krzysztof,
> >>
> >> (continuing discussion from both patches on this thread...)
> >>
> >> On 30/05/25 13:25, Geert Uytterhoeven wrote:
> >>> Hi Jayesh,
> >>>
> >>> CC devicetree
> >>>
> >>> On Fri, 30 May 2025 at 04:54, Jayesh Choudhary <j-choudhary@ti.com> w=
rote:
> >>>> On 29/05/25 16:34, Jayesh Choudhary wrote:
> >>>>> By default, HPD was disabled on SN65DSI86 bridge. When the driver w=
as
> >>>>> added (commit "a095f15c00e27"), the HPD_DISABLE bit was set in pre-=
enable
> >>>>> call which was moved to other function calls subsequently.
> >>>>> Later on, commit "c312b0df3b13" added detect utility for DP mode. B=
ut with
> >>>>> HPD_DISABLE bit set, all the HPD events are disabled[0] and the deb=
ounced
> >>>>> state always return 1 (always connected state).
> >>>>>
> >>>>> Set HPD_DISABLE bit conditionally based on "no-hpd" property.
> >>>>> Since the HPD_STATE is reflected correctly only after waiting for d=
ebounce
> >>>>> time (~100-400ms) and adding this delay in detect() is not feasible
> >>>>> owing to the performace impact (glitches and frame drop), remove ru=
ntime
> >>>>> calls in detect() and add hpd_enable()/disable() bridge hooks with =
runtime
> >>>>> calls, to detect hpd properly without any delay.
> >>>>>
> >>>>> [0]: <https://www.ti.com/lit/gpn/SN65DSI86> (Pg. 32)
> >>>>>
> >>>>> Fixes: c312b0df3b13 ("drm/bridge: ti-sn65dsi86: Implement bridge co=
nnector operations for DP")
> >>>>> Cc: Max Krummenacher <max.krummenacher@toradex.com>
> >>>>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> >>>>> ---
> >>>>>
> >>>>> Changelog v2->v3:
> >>>>> - Change conditional based on no-hpd property to address [1]
> >>>>> - Remove runtime calls in detect() with appropriate comments
> >>>>> - Add hpd_enable() and hpd_disable() in drm_bridge_funcs
> >>>>> - Not picking up "Tested-by" tag as there are new changes
> >>>>>
> >>>>> v2 patch link:
> >>>>> <https://lore.kernel.org/all/20250508115433.449102-1-j-choudhary@ti=
.com/>
> >>>>>
> >>>>> [1]: <https://lore.kernel.org/all/mwh35anw57d6nvre3sguetzq3miu4kd43=
rokegvul7fk266lys@5h2euthpk7vq/>
> >>>
> >>> Thanks for your patch!
> >>>
> >>>>> This would also require dts changes in all the nodes of sn65dsi86
> >>>>> to ensure that they have no-hpd property.
> >>>>
> >>>> DTS patch is posted now:
> >>>> <https://lore.kernel.org/all/20250529112423.484232-1-j-choudhary@ti.=
com/>
> >>>
> >>> On all Renesas platforms handled by that patch, the DP bridge's HPD p=
in
> >>> is wired to the HPD pin on the mini-DP connector.  What am I missing?
> >>
> >> If the bridge's HPD is connected to that of the connector, then I am
> >> pretty certain HPD will not work for renesas platform. The detect hook
> >> always gives "connected" state in the driver (even if it is unplugged)=
.
> >> Do you have different observation on your end?
> >> If not, then we do need something like this patch while addressing the
> >> backwards-compatibility concerns.
> >>
> >> During v1 RFC[2], I did observe that renesas also have DisplayPort
> >> connector type and might require hpd, but since the support was
> >> already there and no issue was raised, I assumed it does not require
> >> HPD.
> >>
> >> [2]:
> >> https://lore.kernel.org/all/01b43a16-cffa-457f-a2e1-87dd27869d18@ti.co=
m/
> >>
> >>
> >>>
> >>> Regardless, breaking backwards-compatibility with existing DTBs is
> >>> definitely a no-go.
> >
> > FWIW, we are in a little bit of a sticky situation here. We were in a
> > bit of a bad place from the start because the Linux driver ignored HPD
> > from the beginning but we didn't actually document that people should
> > be setting the "no-hpd" property until a little bit later. You can see
> > some discussion about this in commit 1dbc979172af ("dt-bindings:
> > drm/bridge: ti-sn65dsi86: Document no-hpd") where I noted "this is
> > somewhat of a backward-incompatible change." ...but, at the time, it
> > wasn't really a big deal because there were very few users (the one in
> > tree at the time was cheza, which was a dev board used internally at
> > Google).
> >
> > ...so, as of that change in May of 2020, it was documented that eDP
> > users were _supposed_ to be setting NO_HPD. I even remember Bjorn
> > requesting the "or is otherwise unusable" phrasing because we pretty
> > much wanted to set this property on everyone using sn65dsi86 as eDP
> > (even if they have HPD hooked up) because the debouncing time is so
> > long that it was better to hardcode the max delay instead of reading
> > the HPD line. Of course, even though we documented that they were
> > supposed to have the "no-hpd" property didn't necessarily mean that
> > everyone did. The code has never enforced it. I don't believe it even
> > checks the property...
> >
> > So if there are dts files out there that don't set the property and
> > they were submitted after the bindings change in 2020, _technically_
> > they've been wrong the whole time. We're not changing history by
> > adding a new requirement so much as fixing broken DTS files. Although
> > the Linux driver always allowed them to get away with being broken,
> > technically DTS is separate from Linux so if they've been violating
> > the bindings then they've been wrong. :-P That being said, they've
> > been working and it would be nice to keep them working if we can, but
> > one could make an argument that maybe it would be OK to require them
> > to change...
> >
> >
> >> Got it.
> >> Let me try to figure out a way to fix it without messing it up.
> >
> > While a bit on the ugly side, it seems like perhaps you could just do t=
his:
> >
> > 1. If enable_comms is called before the bridge probe happens, just go
> > ahead and disable HPD.
> >
> > 2. When the bridge probe happens, if you notice that HPD should be
> > enabled and comms are on you can just enable HPD then (grabbing the
> > comms_mutex while doing it).
> >
> > 3. Any subsequent enable_comms called after the bridge probe happens
> > shouldn't disable HPD.
> >
> > ...you'd probably want a comment about the fact that "no-hpd" property
> > is unreliable, which is why we can't figure this out in a better way.
> >
> >
>
>
> Ernest mentioned in v2[3] that when pdata->bridge.type is not
> set, the type field is 0 causing issue for eDP when enable_comms
> is called before auxiliary_driver probe.
>
> So it should be okay to check the bridge type for
> DRM_MODE_CONNECTOR_Unknown (0) OR DRM_MODE_CONNECTOR_eDP (14) and
> disable HPD in both case?
> Or equivalently using !(DRM_MODE_CONNECTOR_DisplayPort) as this bridge
> would support only these 2 connector types???

Yeah, I'd check for "not displayport".


> Then for DP case, it should behave like you mentioned: First disabling
> HPD till types is set in auxiliary_driver probe. And once set to 10,
> (for DRM_MODE_CONNECTOR_DisplayPort) enabling it for DisplayPort
> connector type.

Sounds reasonable to me.

-Doug
