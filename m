Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D78A35D3A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 13:00:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A602A10E29F;
	Fri, 14 Feb 2025 12:00:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LVahOXQP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C47310E29F
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 12:00:20 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-ab744d5e567so363215866b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 04:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739534419; x=1740139219; darn=lists.freedesktop.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GI3W9qR1fQieAycCsuIaEjCDuBJjNXKEwknKksP2WWw=;
 b=LVahOXQP6fk3tVQQKJEH3n234/iIvu/PlwRrJYW0TPehUfyon+lW4apT8xdyL96hzB
 KtBubMM0NyQnjyDDS1DTO8xHa3CLET/ustsl2JdWZ9Nbl/6vAhjQgcCJYjPJHR+E0LEJ
 0vhZGw85e1iT1shpD7/Hhf3mW6p38d9MfvTtCwUcIu8RLuznq8NT6WthMlrU7GloFKi3
 n/3kbiiFXlps7ap1AN9zRfKngUZmBfVFRnpAkzUnPZjDW5/3NI5cRoG5Avq+H6QsxWCJ
 6jG9fJuI3SrLAuWbqY9sJ/ML0AwGar/A7DKJn2Mj26EQHKpPCSXWNTBCzzTdy5OHMI0g
 XVdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739534419; x=1740139219;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GI3W9qR1fQieAycCsuIaEjCDuBJjNXKEwknKksP2WWw=;
 b=WMC8NMZqk/elIQrHk1fRUjuAPdnHg4XoLhnTjoif4WdETxxEMmdp6arQstaSWmB7d3
 STzdI/o17SZgo/XiojIBTk8gDYGa/ipezz7fwiy8Xbq7gwqVWnVqVlAJDi8dwrjIJjVG
 eY4vc0Oc/0E/XiJ1eStphm9TysCgwyZLGl5Xf/uECLkcU+jI9THH6Qpo914fNSXaxECy
 gm/J7xGVWi2/ZmIJx9Yn62WImUGtonl1HqGSKS7nKdw030Afby6e7UJbHHNbraE2iJ0a
 CXyqrl3nlXOpPihML1BcWbtuJi6jcg6/kqmJKpwnRNimO2ZIGmonwA9VDiApn8sLHMD0
 krFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVU8wohbQ2C5N+OFEKBbFILy3jZSiqlzcCTzY5w/lQhxwQZpbMz3xHEEb8dCQibOI11hlLdPn2EJFE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxU2pHeFkI2bi9AOxwZz7nifISMEaSSOVSjFGLxmEASbplzsX7x
 RTPjiHVfnpzMhht6Lf7aXySESTHWwURgfUgCxc+sgJAO8Wm4EndK
X-Gm-Gg: ASbGnct0FiDlqKkrusiXEnHmMn1S9KTm193ejz01QrsM2t8UFzvqjBOLbyPTCD3y0CJ
 U1c3ExDOuTQF0puw7mHu4IkgAlprk/dyjIQ1XvDBBPYkU9dd9NVgUxeZNqdWZhrUC/vvwnWsTDN
 DemppqlnoUVq8ZNSnZTzy1zIRun/HQRbf6XU0wLO0xJ8Dcer/pbxDveLpF5a8INR/yTfg3e356g
 h68nqHF4gmLY8iB+IdbJayr+IjvHWdY3GrYs/TvMfj60gzIaRdtPpX4KZTtd909sYVwoiqrqSk9
 RjMYVwpP/nqJDl63bfLL/fZGiVv2EX8sH3vEW7rB021Ay4EMg05yyPK21MMBs/i1JZ2K8A0A
X-Google-Smtp-Source: AGHT+IEuZ76Lk8B5kT7BpvuBO88bUmgM7KzRYxZvjjTT1LTHSgCtEgbI85Tx+usx0aBQ6F7U8VS0vA==
X-Received: by 2002:a17:906:fe02:b0:ab7:c11:a980 with SMTP id
 a640c23a62f3a-aba510aecf0mr643697766b.17.1739534416957; 
 Fri, 14 Feb 2025 04:00:16 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl.
 [89.66.237.154]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dece1c416asm2819667a12.18.2025.02.14.04.00.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Feb 2025 04:00:15 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH v6 00/14] Add eDP support for RK3588
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <tg6eyew4qahuxqakmmejne7xx2rkouj6htp55acun4ajz2irz2@vlmvqv3zc5vc>
Date: Fri, 14 Feb 2025 13:00:03 +0100
Cc: Damon Ding <damon.ding@rock-chips.com>, heiko@sntech.de, robh@kernel.org,
 conor+dt@kernel.org, algea.cao@rock-chips.com, rfoss@kernel.org,
 devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hjc@rock-chips.com,
 kever.yang@rock-chips.com, dmitry.baryshkov@linaro.org, vkoul@kernel.org,
 andy.yan@rock-chips.com, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, l.stach@pengutronix.de
Content-Transfer-Encoding: quoted-printable
Message-Id: <C81810F2-6E9B-4DCC-85D1-CCB63CBFBFEA@gmail.com>
References: <20250123100747.1841357-1-damon.ding@rock-chips.com>
 <5044FFCB-B325-40D0-BA82-03AF64EAF029@gmail.com>
 <tg6eyew4qahuxqakmmejne7xx2rkouj6htp55acun4ajz2irz2@vlmvqv3zc5vc>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: Apple Mail (2.3826.400.131.1.6)
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



> Wiadomo=C5=9B=C4=87 napisana przez Sebastian Reichel =
<sebastian.reichel@collabora.com> w dniu 13 lut 2025, o godz. 18:26:
>=20
> Hello Piotr,
>=20
>=20
> The RK3588 has two different DP controllers. The one handled in this
> series should get the eDP port running, which is routed to the
> "eDP Panel" in the block diagram on page 3 of the Rock 5 ITX =
schematics.
> So this series adds support for using "HDMI/eDP TX0" and "HDMI/eDP =
TX1"
> in DP mode.
>=20
> The port routed to HDMI0 via RA620 is the other DP controller, which
> also exists twice: "TYPEC0/DP0" and "TYPEC1/DP1". This DP controller
> is not yet supported upstream and there is no pending patchset. As far
> as I know Rockchip plans to work on preparing upstream support for =
that
> soon.
>=20

Oh - this is very valuable info and explains a lot.
Thx.=20

> Note, that the two DisplayPort controllers are completely different.
> The HDMI/eDP controller is a design from Analogix and the TypeC/DP
> controller is a design from Synopsys.
>=20
> P.S.: Heiko merged support for HDMI1 (RK3588 SoC level) recently. So =
you
> should be able to get that running by some DT additions to the Rock 5
> ITX board DT with the latest linux-next code :)
>=20

And it works perfectly on all my 3588 bards (including audio and my cec =
addition)
But only on boards using both hdmi tx0 and tx1 to hdmi0/hdmi1 ports.

on rock5 itx: =20

With both hdmi tx0 and tx1 enabled in dts it looks like kernel detects =
hdmi tx0 as connected and tries read edid.=20
As nothing is connected to J11 (eDP con) - i=E2=80=99m getting i2c ddc =
timeouts=20
[   54.188880] dwhdmiqp-rockchip fde80000.hdmi: i2c read timed out
[   54.292207] dwhdmiqp-rockchip fde80000.hdmi: i2c read timed out
[   54.395554] dwhdmiqp-rockchip fde80000.hdmi: i2c read timed out


disabling hdmi0 makes kernel talking to hdmi1 but with issues:=20
[    0.540446] dwhdmiqp-rockchip fdea0000.hdmi: registered DesignWare =
HDMI QP I2C bus driver
[    0.541230] rockchip-drm display-subsystem: bound fdea0000.hdmi (ops =
dw_hdmi_qp_rockchip_ops)
[    0.542285] [drm] Initialized rockchip 1.0.0 for display-subsystem on =
minor 0
[    0.542933] rockchip-drm display-subsystem: [drm] Cannot find any =
crtc or sizes
[    0.543605] rockchip-drm display-subsystem: [drm] Cannot find any =
crtc or sizes

and here i=E2=80=99m a bit puzzled as on other 3588 boards (i.e. rock5b) =
- when i connected monitor to hdmi1 - all works perfectly
(kernel, OS and app nicely skipping hdmi0 and talking to actually =
connected hdmi1 port. all works)=20

on rock5 itx this not works.

my observations so far are:
-on rock5 itx hdmi0 is falsely detected as connected - even when eDP =
connector (J11) has nothing connected
-on rock5 itx disabling hdmi0 in dts breaks hdmi1=20
-on other 3588 (e.g. rock 5b) disabling hdmi0 in dts NOT breaks hdmi1 =20=


strange=E2=80=A6.

  =20

> Greetings,
>=20
> -- Sebastian
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

