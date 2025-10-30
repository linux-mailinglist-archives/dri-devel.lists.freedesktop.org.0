Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCE3C1F10B
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 09:49:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 911CD10E256;
	Thu, 30 Oct 2025 08:48:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ivz68d6U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com
 [74.125.224.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3120310E87B
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 01:34:43 +0000 (UTC)
Received: by mail-yx1-f53.google.com with SMTP id
 956f58d0204a3-63e1b52b452so646954d50.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 18:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761788082; x=1762392882; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QSYKQjyLLpQ9U6VgF/+NC7c9Vfg3d8+LTPH7512lTcw=;
 b=Ivz68d6USxz5KrwgkbfRiSvTBhRV+i3p5pt4VRhuN6BgOn1j1ChGF+hJYCdkqo+jpB
 N7H27oFRfWTRhieHrGs9SBInZDHNN0AmdtaZkVoItD+eyb+7CirwgZLjUfUvv5bn6VX8
 em8IruT/6un0a7toWtPJX37ai282uRzBMBrlLp9xx53OJiAz1fyz4WiP9ZYE3g4fWiha
 7JDp3b/4En1owMFhHsrq6L0hXVCsVhP+lNj/Ogzzgr23jZ4R+sAQL5ppELKXaMJhjEel
 9ckKHov1fOENrC0z/KpkWow2nXBvlVArat1+UOtzeKFz+r+G3rWXuNC/1dc7DUYmSbk9
 YJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761788082; x=1762392882;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QSYKQjyLLpQ9U6VgF/+NC7c9Vfg3d8+LTPH7512lTcw=;
 b=qgdKBbNrzhHG7ls00yh27PuMmh0mwTjiqSEeBm7BTdmQbnFykP4zVtQPVFRv114EzE
 OuTABU93otZgZmFI/fz4yNgqxy/MAGX1zNZxsIDNaqgIgElNBfSAR0wpVuLybUKDFyng
 CH5fR14GVr/foexeGxp+Dw/3RDbozb+gWxj22LPkfjjoMh40Zrr7KZmMTsy9lqI39sTl
 HkW2apgx/4k5SCjFYWc/3AG+4wSNw5pSSBotuFzzhr72EuR2WkU5V8dhpxUfdQrtKa4V
 TNTQWK24jZg/fRWApjom87oSftwrRjITugURzU0kugYu6Q+PF2ZH8wez7zcKmCeLx7uO
 H3qw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnOxk5LxUHsQvLp+s1kVDiicr70af9UIIsbk3kep7hegveKeT+u7WoS/RmEGIJ8nHhYG6L4OiUXe0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHyApLMfpajD6Ab4wUQ+N2SfTlZgLp95/wJr4azczlgk4u/75+
 C4mthW1d9hqOOrV5kS4a7I36fnQC//No1RD0mBHf+WRg18mE947zNIreMRGtOhC4wc70o2pK7No
 o+CdMUEb+l6zhJOBaWU5HCmAFDVtyl8Q=
X-Gm-Gg: ASbGncuAP5IPgzLV+pcwrZ123bHUZ8KpCqI0ECAEwbLh+ofV2H8Fb75x/lGGv+dvmSW
 5ldH03VmPA7dNiG7HxW5fdrGhJyGGxawMs1gRRhcbEYNGzvziy1Ch7BtYgXeDINAckR2cYjIzpV
 3stD04k6UOlKo4uhKCOkYF+48r/hcvwXyGXZBrUMvfmY0x90cNK82oqP8R1wG3JY0cRrQoQCQJ7
 HlsKWVeDEu0mjodoJEbf1wFrxtab+nYycTxvyvLxMSEaugTrW3ZYtodFMA=
X-Google-Smtp-Source: AGHT+IHMgJ4rKBE3uO85FiTJlzlAN942wrm4DmLjbiS0N7/wUCXXDdFNOdlxyLWqUIKEUXLtWtfDUoP0SJbFBB5hViQ=
X-Received: by 2002:a05:690c:6a89:b0:784:841e:c03c with SMTP id
 00721157ae682-7863903404amr16292487b3.15.1761788081875; Wed, 29 Oct 2025
 18:34:41 -0700 (PDT)
MIME-Version: 1.0
References: <20251029071435.88-1-kernel@airkyi.com>
 <20251029071435.88-11-kernel@airkyi.com>
 <CAL411-o6mF71oBeRsJ-OPZNbLegn4iJ_ELN9xVdppTM3ssUPOw@mail.gmail.com>
 <cc8b583a-77ec-4a7f-97cc-2d148f7fee9f@rock-chips.com>
 <e0c5bda3-7428-49e0-9955-fa23f1e4f35d@rock-chips.com>
In-Reply-To: <e0c5bda3-7428-49e0-9955-fa23f1e4f35d@rock-chips.com>
From: Peter Chen <hzpeterchen@gmail.com>
Date: Thu, 30 Oct 2025 09:34:30 +0800
X-Gm-Features: AWmQ_bnwd-FVfcBS5MP2Q8qG3_b5HlIQQto3HU-lVRe3FvjLA4i8HmYCB1URRXQ
Message-ID: <CAL411-oXfvp-iqN+uRmFHijdmW=1omKwozKOoZ2shxukMHmwPg@mail.gmail.com>
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

On Wed, Oct 29, 2025 at 6:32=E2=80=AFPM Chaoyi Chen <chaoyi.chen@rock-chips=
.com> wrote:
>
> On 10/29/2025 6:21 PM, Chaoyi Chen wrote:
>
> > Hi Peter,
> >
> > On 10/29/2025 5:45 PM, Peter Chen wrote:
> >>> +&i2c4 {
> >>> +       i2c-scl-rising-time-ns =3D <475>;
> >>> +       i2c-scl-falling-time-ns =3D <26>;
> >>> +       status =3D "okay";
> >>> +
> >>> +       usbc0: typec-portc@22 {
> >>> +               compatible =3D "fcs,fusb302";
> >>> +               reg =3D <0x22>;
> >>> +               interrupt-parent =3D <&gpio1>;
> >>> +               interrupts =3D <RK_PA2 IRQ_TYPE_LEVEL_LOW>;
> >>> +               pinctrl-names =3D "default";
> >>> +               pinctrl-0 =3D <&usbc0_int>;
> >>> +               vbus-supply =3D <&vbus_typec>;
> >>> +
> >>> +               usb_con: connector {
> >>> +                       compatible =3D "usb-c-connector";
> >>> +                       label =3D "USB-C";
> >>> +                       data-role =3D "dual";
> >>> +                       power-role =3D "dual";
> >>> +                       try-power-role =3D "sink";
> >>> +                       op-sink-microwatt =3D <1000000>;
> >>> +                       sink-pdos =3D
> >>> +                               <PDO_FIXED(5000, 2500, PDO_FIXED_USB_=
COMM)>;
> >>> +                       source-pdos =3D
> >>> +                               <PDO_FIXED(5000, 1500, PDO_FIXED_USB_=
COMM)>;
> >>> +
> >>> +                       altmodes {
> >>> +                               displayport {
> >>> +                                       svid =3D /bits/ 16 <0xff01>;
> >>> +                                       vdo =3D <0x00001c46>;
> >>> +                               };
> >>> +                       };
> >>> +
> >>> +                       ports {
> >>> +                               #address-cells =3D <1>;
> >>> +                               #size-cells =3D <0>;
> >>> +
> >>> +                               port@0 {
> >>> +                                       reg =3D <0>;
> >>> +
> >>> +                                       usbc_hs: endpoint {
> >>> + remote-endpoint =3D <&u2phy0_typec_hs>;
> >>> +                                       };
> >>> +                               };
> >>> +
> >> Why USB2 PHY needs to be notified for Type-C connection?
> >
> > I think the USB-connector binding require a port@0 for High Speed.  So =
I filled in USB2 PHY here. And I have looked up boards with the same usage,=
 and some of the results are as follows:
> >
> > - rk3399-firefly.dts
> >
> > - rk3399-pinebook-pro.dts
> >
> > - rk3399-eaidk-610.dts
> >

Okay.  My question is basic: USB2 PHY supplies DP/DM, and the DP/DM is
short for Type-C connector,
and no control is needed for Type-C application.
Why is there a remote-endpoint connection between USB2 PHY and Type-C conne=
ctor?

> >
> >>
> >>> +                               port@1 {
> >>> +                                       reg =3D <1>;
> >>> +
> >>> +                                       usbc_ss: endpoint {
> >>> + remote-endpoint =3D <&tcphy0_typec_ss>;
> >>> +                                       };
> >>> +                               };
> >>> +
> >>> +                               port@2 {
> >>> +                                       reg =3D <2>;
> >>> +
> >>> +                                       usbc_dp: endpoint {
> >>> + remote-endpoint =3D <&tcphy0_typec_dp>;
> >>> +                                       };
> >>> +                               };
> >>> +                       };
> >>> +               };
> >>> +       };
> >>> +};
> >>> +
> >> .....
> >>>   &u2phy0 {
> >>>          status =3D "okay";
> >>> +
> >>> +       port {
> >>> +               u2phy0_typec_hs: endpoint {
> >>> +                       remote-endpoint =3D <&usbc_hs>;
> >>> +               };
> >>> +       };
> >>>   };
> >>>
> >> There is no switch and mux, how to co-work with Type-C?
> >
> > I checked the phy-rockchip-inno-usb2.c but did not find any switch or m=
ux. Does this mean that we need to implement them? Thank you.
>
> Wait a minute, actually we have multiple hardware interfaces, one of whic=
h is Type-C, eventually connected to USBDPPHY, and the other is micro-usb c=
onnected to U2PHY.

I assume the Micro-USB connector does not use Type-C/PD IC, is it
right? Does it relate to this patch?

Best regards,
Peter
