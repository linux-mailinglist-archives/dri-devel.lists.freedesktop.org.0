Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C907AD292E
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 00:09:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E754E10E1A6;
	Mon,  9 Jun 2025 22:09:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="C+mrltTf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C99B810E1A6
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 22:09:41 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id
 d9443c01a7336-23636167b30so2892565ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 15:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1749506978; x=1750111778;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lo+xuu6/evF7Kj69JUrQ4+v7ESydcrUGBnfBq/70hhU=;
 b=C+mrltTfcX9ISuvEmi8Vw7mM3e/fphr66RP38cjHZ71mHv9t28sAaS8A0NpUsU6mOR
 ffTj5iBykCotyfn5zWSiEe08m9dT5M/yNq2UoEf4wKipxO+fY1Uvpuzv1++xnB1jvqHA
 b5eRWq/2+bEalvv1QESzitHPLinKjGtaRFXnQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749506978; x=1750111778;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lo+xuu6/evF7Kj69JUrQ4+v7ESydcrUGBnfBq/70hhU=;
 b=GA5823SELvFUiRqrISqmW/h5T4jlXIIKLtFyuo7ti16lfz2hvktGSiC8ZkODMtqqlw
 T9rwLUeLDPve6NYB377Vzv4r47WT8pQBV9L9Uf9ZjGMnE9UuStk5LGIbY4DBrdqm0Lq3
 f7QOM/NfznMndopUmQZTLQz5MbTJjpdTkt2JCQXjiwsrmiBkqMPTkz2KysGoStGimReN
 FX8N0XJsUfJzX/278dakF32myZT8b+e3FWvQvIswfANVvrUSa6EARUwEY7eKJN6vjqct
 dV49twBPi0iwdPPDF4ZPERvT75Hc8AikCXHe7lpskpMQnPVFNyt8GFXJBoOG7FkZgzqg
 BRfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmntIK5BZPm8vI9P2HO+ByJz9D3U8txXTRyEw/wabTYO8ryHcMhgcTgDE4d2Uu2I442oMD5Rkx9pU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5+4cuD7YN+2/b5F0plc9m6fyVcuPo3xvXi/vef0PCqQboA4Ty
 McAeK12T8ds1OTTNwBi1/JJCuldCClafKw8bGsWgc2X4usIoW11RJSyK4bHO3JgPtDLTH7xMDVr
 rg69rir6K
X-Gm-Gg: ASbGncstednJ04iVpQ7mj4nQq65LUIQnUfgPnG5u6nACy+15mCvB1PGT6xWrFvyDzsZ
 LVf7XzWbJY9ErvLcJMydKRldES2zRwXtwyhMP0b2THcgeNSoIP0m6+ox8dtbwzwx9ANEam9a5/c
 YhsWUk6LjkPE7vfKTxDjBqiZYrkdhXUlDuVy6lAUBh9H6/w//Ls85jlEU24k2rZ/LZn0Zhd7qXN
 4kEcq8Yufg1MRb6KNulgdUDYXIUMuExfTKqA+EBfvln1Ucp6Jdn7DRCG7gkaDJ8klpR7yLPN3cJ
 mBajmxN75r9iJGeHFmh6lUaBTOAMBB7ZeVMf5IXX2aa+t3PKJxlvp4rZGJapyHfecs4o8dZe0NH
 jxYDUiuQYhIGqig7kPALg74gaOSsPqQ==
X-Google-Smtp-Source: AGHT+IFAcD9DDgL9e9McE+6cMEGh4HmMHMHxsy79Mi78bC4sdzg/piaVhMr6clxVN7yhFRBgSgotlQ==
X-Received: by 2002:a17:902:da82:b0:235:c9a7:d5f5 with SMTP id
 d9443c01a7336-23601d01f72mr178516435ad.13.1749506978174; 
 Mon, 09 Jun 2025 15:09:38 -0700 (PDT)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com.
 [209.85.214.178]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2360340fa57sm59018365ad.196.2025.06.09.15.09.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jun 2025 15:09:37 -0700 (PDT)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2353a2bc210so41444805ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 15:09:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUI6aAHrgml1sHw2dvnidpXDoaFUbsHqJS1goIzIgY3fi3LL05bdkDBVu6ITxGo61u+Ml4/VpmreTQ=@lists.freedesktop.org
X-Received: by 2002:a17:903:1b45:b0:234:c2e7:a103 with SMTP id
 d9443c01a7336-23601d82e8bmr214458545ad.33.1749506977132; Mon, 09 Jun 2025
 15:09:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250529110418.481756-1-j-choudhary@ti.com>
 <2baf3c31-3edf-4c26-bd44-1d0560134871@ti.com>
 <CAMuHMdUi7pf1YfKRjMv_7VuKwjR5XekRXfcEzuPScGzHraGjyQ@mail.gmail.com>
 <84fdbd23-d694-453f-a225-dbac19b34719@ti.com>
In-Reply-To: <84fdbd23-d694-453f-a225-dbac19b34719@ti.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 9 Jun 2025 15:09:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XaR6Pq7E-13zR5PC_u=3SD=sc05_TzxWJR2FS040zESg@mail.gmail.com>
X-Gm-Features: AX0GCFuY9zmj0FHZgee9_PnbGi-N3ssFASItEBDN5ajNB22ll-m4fMNSbkRbwcE
Message-ID: <CAD=FV=XaR6Pq7E-13zR5PC_u=3SD=sc05_TzxWJR2FS040zESg@mail.gmail.com>
Subject: Re: [PATCH v3] drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort
 connector type
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org, 
 tomi.valkeinen@ideasonboard.com, max.krummenacher@toradex.com, 
 jonas@kwiboo.se, jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 kieran.bingham+renesas@ideasonboard.com, linux-kernel@vger.kernel.org, 
 max.oss.09@gmail.com, devarsht@ti.com, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, ernestvanhoecke@gmail.com
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

On Mon, Jun 2, 2025 at 4:05=E2=80=AFAM Jayesh Choudhary <j-choudhary@ti.com=
> wrote:
>
> Hello Geert, Krzysztof,
>
> (continuing discussion from both patches on this thread...)
>
> On 30/05/25 13:25, Geert Uytterhoeven wrote:
> > Hi Jayesh,
> >
> > CC devicetree
> >
> > On Fri, 30 May 2025 at 04:54, Jayesh Choudhary <j-choudhary@ti.com> wro=
te:
> >> On 29/05/25 16:34, Jayesh Choudhary wrote:
> >>> By default, HPD was disabled on SN65DSI86 bridge. When the driver was
> >>> added (commit "a095f15c00e27"), the HPD_DISABLE bit was set in pre-en=
able
> >>> call which was moved to other function calls subsequently.
> >>> Later on, commit "c312b0df3b13" added detect utility for DP mode. But=
 with
> >>> HPD_DISABLE bit set, all the HPD events are disabled[0] and the debou=
nced
> >>> state always return 1 (always connected state).
> >>>
> >>> Set HPD_DISABLE bit conditionally based on "no-hpd" property.
> >>> Since the HPD_STATE is reflected correctly only after waiting for deb=
ounce
> >>> time (~100-400ms) and adding this delay in detect() is not feasible
> >>> owing to the performace impact (glitches and frame drop), remove runt=
ime
> >>> calls in detect() and add hpd_enable()/disable() bridge hooks with ru=
ntime
> >>> calls, to detect hpd properly without any delay.
> >>>
> >>> [0]: <https://www.ti.com/lit/gpn/SN65DSI86> (Pg. 32)
> >>>
> >>> Fixes: c312b0df3b13 ("drm/bridge: ti-sn65dsi86: Implement bridge conn=
ector operations for DP")
> >>> Cc: Max Krummenacher <max.krummenacher@toradex.com>
> >>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> >>> ---
> >>>
> >>> Changelog v2->v3:
> >>> - Change conditional based on no-hpd property to address [1]
> >>> - Remove runtime calls in detect() with appropriate comments
> >>> - Add hpd_enable() and hpd_disable() in drm_bridge_funcs
> >>> - Not picking up "Tested-by" tag as there are new changes
> >>>
> >>> v2 patch link:
> >>> <https://lore.kernel.org/all/20250508115433.449102-1-j-choudhary@ti.c=
om/>
> >>>
> >>> [1]: <https://lore.kernel.org/all/mwh35anw57d6nvre3sguetzq3miu4kd43ro=
kegvul7fk266lys@5h2euthpk7vq/>
> >
> > Thanks for your patch!
> >
> >>> This would also require dts changes in all the nodes of sn65dsi86
> >>> to ensure that they have no-hpd property.
> >>
> >> DTS patch is posted now:
> >> <https://lore.kernel.org/all/20250529112423.484232-1-j-choudhary@ti.co=
m/>
> >
> > On all Renesas platforms handled by that patch, the DP bridge's HPD pin
> > is wired to the HPD pin on the mini-DP connector.  What am I missing?
>
> If the bridge's HPD is connected to that of the connector, then I am
> pretty certain HPD will not work for renesas platform. The detect hook
> always gives "connected" state in the driver (even if it is unplugged).
> Do you have different observation on your end?
> If not, then we do need something like this patch while addressing the
> backwards-compatibility concerns.
>
> During v1 RFC[2], I did observe that renesas also have DisplayPort
> connector type and might require hpd, but since the support was
> already there and no issue was raised, I assumed it does not require
> HPD.
>
> [2]:
> https://lore.kernel.org/all/01b43a16-cffa-457f-a2e1-87dd27869d18@ti.com/
>
>
> >
> > Regardless, breaking backwards-compatibility with existing DTBs is
> > definitely a no-go.

FWIW, we are in a little bit of a sticky situation here. We were in a
bit of a bad place from the start because the Linux driver ignored HPD
from the beginning but we didn't actually document that people should
be setting the "no-hpd" property until a little bit later. You can see
some discussion about this in commit 1dbc979172af ("dt-bindings:
drm/bridge: ti-sn65dsi86: Document no-hpd") where I noted "this is
somewhat of a backward-incompatible change." ...but, at the time, it
wasn't really a big deal because there were very few users (the one in
tree at the time was cheza, which was a dev board used internally at
Google).

...so, as of that change in May of 2020, it was documented that eDP
users were _supposed_ to be setting NO_HPD. I even remember Bjorn
requesting the "or is otherwise unusable" phrasing because we pretty
much wanted to set this property on everyone using sn65dsi86 as eDP
(even if they have HPD hooked up) because the debouncing time is so
long that it was better to hardcode the max delay instead of reading
the HPD line. Of course, even though we documented that they were
supposed to have the "no-hpd" property didn't necessarily mean that
everyone did. The code has never enforced it. I don't believe it even
checks the property...

So if there are dts files out there that don't set the property and
they were submitted after the bindings change in 2020, _technically_
they've been wrong the whole time. We're not changing history by
adding a new requirement so much as fixing broken DTS files. Although
the Linux driver always allowed them to get away with being broken,
technically DTS is separate from Linux so if they've been violating
the bindings then they've been wrong. :-P That being said, they've
been working and it would be nice to keep them working if we can, but
one could make an argument that maybe it would be OK to require them
to change...


> Got it.
> Let me try to figure out a way to fix it without messing it up.

While a bit on the ugly side, it seems like perhaps you could just do this:

1. If enable_comms is called before the bridge probe happens, just go
ahead and disable HPD.

2. When the bridge probe happens, if you notice that HPD should be
enabled and comms are on you can just enable HPD then (grabbing the
comms_mutex while doing it).

3. Any subsequent enable_comms called after the bridge probe happens
shouldn't disable HPD.

...you'd probably want a comment about the fact that "no-hpd" property
is unreliable, which is why we can't figure this out in a better way.


-Doug
