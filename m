Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 570B6C1F11D
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 09:49:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 906CF10E920;
	Thu, 30 Oct 2025 08:48:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="m40U02gj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com
 [74.125.224.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC8F710E24C
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 06:13:33 +0000 (UTC)
Received: by mail-yx1-f47.google.com with SMTP id
 956f58d0204a3-63e336b1ac4so1224845d50.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 23:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761804813; x=1762409613; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3rF4eMVmZqF08Uiy4ZG4pr/6crlsmzGRDhN+59lsH5Y=;
 b=m40U02gjKeVjNQOXqdO0So+K2EtFcLOOomG5x6t32ya/q5EyELsv73Q/5khAhho/rU
 7hxDI1kxh9/5vlpWQ+S5vqCoAxNSSGB2DxVQ7z5BxSP1ONDpynOkqBdDwJerN1bXV3O0
 JZ/HHeCVQ0jWMbpQGWfU3aff3v93tH1ATe9xUl8wnRFxV4YQfCiawFWFy4n8ZnfVs5Gp
 JWvdB2TCqxI/Tx2plAM8CAiixim/03KfrQcmn5epYQeJnnj/maIogoDHqqCNGQChcBFR
 sbD8qQvDeMy9ffiyKpKKazygfA9xcSSsJmRVqz7Ok6J9bpLBj/RYXZsAJPYV8Pb+/iEX
 QzMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761804813; x=1762409613;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3rF4eMVmZqF08Uiy4ZG4pr/6crlsmzGRDhN+59lsH5Y=;
 b=b53PvpTM6jKRQ3mBxax5bNy/a6qkdQQRJJxOicEXJMSkjWlfn1XOQEMTB4b1c74u0O
 nhrA0cusdDcOnNm0OL1ltFL+sUBb+h6/BXC4QDW8TDLeL0fyvStMEvDcRM5ZNqMJx+tB
 Nj3fjvWbBzLUhg6ue5WvqAg81B/qDme/KJf2QPqm6Ad/rI9fFADjKZAonUpTsENDWcdC
 EoMX4yHRpUt9InUqDNUTbBTGkPE/qn6JAuxlgEaScTGeE07ocinm4fhyrnrBSsy74i0v
 2z0a28YHY+pVdYeWrO7UqFpSM32j7BAqGxAlT8BVNptFXujpYZdPJPsf/bjtJduAGrRJ
 Dw3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXS+gF05oAzAjhGC0Id9R9QQHCu9mC+NoKR6C7ze889M7hfqequkNleAh+kZcQx4EK6rcSFCAfN4ps=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywo8R4rhNuyZsmSADBl8kq1IsqtwoCIgWzw3/vjHXv1b5N270SY
 bNheZ4VhAJIBWCtsiF9w/DjeK0mC1AqAldqefHHx5Q5UeKq+vTIDpoA0w202XAta8vGIyGI7sbj
 OilRuiQVG5FneLpdK4Sd2UIluqhAO/9k=
X-Gm-Gg: ASbGncsRqf9UrtgEMdm15B9flttkgmgTzCcDP4sUhZ1ba0mphWayCYgai+ddP1/Bdhh
 q7lh6USENnQna91Wydg+aDtw+pVKXboS9/Mh98BKd+TvzWmIPunu7be2UneyPshnpqym8cafGsW
 /DNLgYhNjqNxdjPslOVZk/actEMbbkt50ylu4sbN+mqYaVBKrnKRT515huDOsIl2mbFu8hzGfvJ
 EJZ9wbTxTVHnN99fkROwjTTZlYJ6S3I832x12MVBNQnYb0KuMDRD8iTButiHzAM350Uvw==
X-Google-Smtp-Source: AGHT+IGNukfCrjaksH3Umzb+6A3Q6R4gH1hMz3jAmphM+O0AwBZJ/TjCDOWOuiqRoFX9uHUrvtIVlMk1omsejKcgRqU=
X-Received: by 2002:a05:690e:14c6:b0:63e:2b9e:1462 with SMTP id
 956f58d0204a3-63f829a66admr1708439d50.22.1761804812638; Wed, 29 Oct 2025
 23:13:32 -0700 (PDT)
MIME-Version: 1.0
References: <20251029071435.88-1-kernel@airkyi.com>
 <20251029071435.88-11-kernel@airkyi.com>
 <CAL411-o6mF71oBeRsJ-OPZNbLegn4iJ_ELN9xVdppTM3ssUPOw@mail.gmail.com>
 <cc8b583a-77ec-4a7f-97cc-2d148f7fee9f@rock-chips.com>
 <e0c5bda3-7428-49e0-9955-fa23f1e4f35d@rock-chips.com>
 <CAL411-oXfvp-iqN+uRmFHijdmW=1omKwozKOoZ2shxukMHmwPg@mail.gmail.com>
 <C6253E8254C80B0F+839b71d0-1bd8-40b7-9515-7ce4a1eb8673@airkyi.com>
 <CAL411-pULVu4AYybW9oW7kmr4M_kJhdytgBjLPb4y6w_2dj+0w@mail.gmail.com>
 <7853bbf0-34e5-4880-a2f4-2d73f25cd5e6@rock-chips.com>
In-Reply-To: <7853bbf0-34e5-4880-a2f4-2d73f25cd5e6@rock-chips.com>
From: Peter Chen <hzpeterchen@gmail.com>
Date: Thu, 30 Oct 2025 14:13:21 +0800
X-Gm-Features: AWmQ_bnKM651Al7hBqe9TPet6QHNgDQAymVR1zTv3jbaP-L2YDnRDbwZ2qTLHzg
Message-ID: <CAL411-rFK0o_cxBO_yJFHWurGFKxZGxw6=kpqxRipMetJskTaQ@mail.gmail.com>
Subject: Re: [PATCH v8 10/10] arm64: dts: rockchip: rk3399-evb-ind: Add
 support for DisplayPort
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Chaoyi Chen <kernel@airkyi.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Sandy Huang <hjc@rock-chips.com>, 
 Andy Yan <andy.yan@rock-chips.com>, Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Amit Sunil Dhamne <amitsd@google.com>, Dragan Simic <dsimic@manjaro.org>,
 Johan Jonker <jbx6244@gmail.com>, 
 Diederik de Haas <didi.debian@cknow.org>, Peter Robinson <pbrobinson@gmail.com>,
 linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 30 Oct 2025 08:48:47 +0000
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

On Thu, Oct 30, 2025 at 11:14=E2=80=AFAM Chaoyi Chen <chaoyi.chen@rock-chip=
s.com> wrote:
>
> On 10/30/2025 10:50 AM, Peter Chen wrote:
>
> >>> Okay.  My question is basic: USB2 PHY supplies DP/DM, and the DP/DM i=
s
> >>> short for Type-C connector,
> >>> and no control is needed for Type-C application.
> >>> Why is there a remote-endpoint connection between USB2 PHY and Type-C=
 connector?
> >>   From the perspective of Type-C, this should not be added.  Is the ap=
proach in v2 correct [0] ?
> >>
> > Have you tried debugging based on upstream code?
>
> Yes, I have tried both the v2 and v8 approaches, and both can work.
>
>
> > v2 is correct, but the dts needs to improve.
> > - There is a remote-endpoint connection for USB role switch between
> > Type-C connector
> > device and USB controller device
> > - There is a remote-endpoint connection for orientation and lane config=
uration
> > between Type-C connector device and USB/DP PHY device.
>
> In v8 patch5, we implemented typec_mux and typec_switch in the USB/DP PHY=
.
>
> I think the current remote-endpoint connections are all child node of the=
 USB/DP PHY. That is:
>
>
> &tcphy0_dp {
>      mode-switch;
>      ...
> };
>
>
> &tcphy0_usb3 {
>      orientation-switch;
>      ...
> };
>
>
> Does this still need to be improved? Thank you.
>

Hi Chaoyi,

There are two questions I have still not seen the answer to:
- Why USB2 PHY is related to your Type-C patch?
- How does the USB role switch event notify the USB controller driver, eg d=
wc3?

Peter
>
> >
> > Peter
> >
> >> [0]: https://lore.kernel.org/all/20250715112456.101-6-kernel@airkyi.co=
m/
> >>
> >> Or is the following approach correct?
> >>
> >>
> >> port@0 {
> >>       reg =3D <0>;
> >>
> >>       usbc_hs: endpoint {
> >>           remote-endpoint =3D <&tcphy0>;
> >>       };
> >> };
> >>
> >> port@1 {
> >>       reg =3D <1>;
> >>
> >>       usbc_ss: endpoint {
> >>           remote-endpoint =3D <&tcphy0>;
> >>       };
> >> };
> >>
> >> port@2 {
> >>       reg =3D <2>;
> >>
> >>       usbc_dp: endpoint {
> >>           remote-endpoint =3D <&tcphy0_typec_dp>;
> >>       };
> >> };
> >>
> >>
> >>>>>>> +                               port@1 {
> >>>>>>> +                                       reg =3D <1>;
> >>>>>>> +
> >>>>>>> +                                       usbc_ss: endpoint {
> >>>>>>> + remote-endpoint =3D <&tcphy0_typec_ss>;
> >>>>>>> +                                       };
> >>>>>>> +                               };
> >>>>>>> +
> >>>>>>> +                               port@2 {
> >>>>>>> +                                       reg =3D <2>;
> >>>>>>> +
> >>>>>>> +                                       usbc_dp: endpoint {
> >>>>>>> + remote-endpoint =3D <&tcphy0_typec_dp>;
> >>>>>>> +                                       };
> >>>>>>> +                               };
> >>>>>>> +                       };
> >>>>>>> +               };
> >>>>>>> +       };
> >>>>>>> +};
> >>>>>>> +
> >>>>>> .....
> >>>>>>>     &u2phy0 {
> >>>>>>>            status =3D "okay";
> >>>>>>> +
> >>>>>>> +       port {
> >>>>>>> +               u2phy0_typec_hs: endpoint {
> >>>>>>> +                       remote-endpoint =3D <&usbc_hs>;
> >>>>>>> +               };
> >>>>>>> +       };
> >>>>>>>     };
> >>>>>>>
> >>>>>> There is no switch and mux, how to co-work with Type-C?
> >>>>> I checked the phy-rockchip-inno-usb2.c but did not find any switch =
or mux. Does this mean that we need to implement them? Thank you.
> >>>> Wait a minute, actually we have multiple hardware interfaces, one of=
 which is Type-C, eventually connected to USBDPPHY, and the other is micro-=
usb connected to U2PHY.
> >>> I assume the Micro-USB connector does not use Type-C/PD IC, is it
> >>> right? Does it relate to this patch?
> >>>
> >>> Best regards,
> >>> Peter
> >>>
> >
> --
> Best,
> Chaoyi
>
