Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C0AA3E1B8
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 18:03:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64FE410E1CB;
	Thu, 20 Feb 2025 17:03:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="NELb89ZN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D540610E1CB
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 17:03:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1740070995; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=H89tZtPw7hGWA9a6QAt88m0WFcYXkG5Shk09kN07BWC4axWYt9GNDZVOo9cm8gqKdIuyxlp+eTDURTlCIanQuanEpv+yche0oDkjwz5c6eP0IQgbahG4lJxd694XY98EFGKvJchBOPyvsHbveZCZFX5JEsc7jNsldWYVrK/dYyk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1740070995;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=w2pzTobpi9TjSTtQRUPn0hmQfMoOEaBAec03sFh2SIY=; 
 b=M3OpeGvfafnAuq6NV8y0Hhz6ZUI1aOEGkTngOe0sXIMQ4y7O4i5GresbkUnyO35KEt+eduI3r1HyHjKANSuBnn/8+PeY5v6fes2GuWOk7M1O59qsBIOnZdI6h7/2rssPSLwql77vZ0ao5qMazDEgfTS76c1UCIsRUbRLMiX2ty0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
 dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740070995; 
 s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=w2pzTobpi9TjSTtQRUPn0hmQfMoOEaBAec03sFh2SIY=;
 b=NELb89ZNA/vXF0KU9d+s8iAZUlWP1ItsG7o0stqFKUD5nWiCOsTLt9XovGPpdD/h
 S+UrbkLBOPJawvm7CbURNWQk5ZNHga+QTdqIjkp7h5Pju5Se+rXy9RG6I0SY7wkyWIi
 jxGaj47YWQDXlIlaxnKbaa63k5yd81xmDyncUIs4=
Received: by mx.zohomail.com with SMTPS id 1740070993591486.8817863804003;
 Thu, 20 Feb 2025 09:03:13 -0800 (PST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Cc: linux-kernel@vger.kernel.org, Algea Cao <algea.cao@rock-chips.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 dri-devel@lists.freedesktop.org, Niklas Cassel <cassel@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, kernel@collabora.com,
 David Airlie <airlied@gmail.com>, Dragan Simic <dsimic@manjaro.org>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sugar Zhang <sugar.zhang@rock-chips.com>, linux-rockchip@lists.infradead.org, 
 Chen-Yu Tsai <wens@csie.org>, FUKAUMI Naoki <naoki@radxa.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Johan Jonker <jbx6244@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Alexey Charkov <alchark@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v7 0/3] Add HDMI audio on the rk3588 SoC
Date: Thu, 20 Feb 2025 12:03:09 -0500
Message-ID: <2357838.ElGaqSPkdT@earth>
In-Reply-To: <B8EF5196-55FB-44EC-B93C-E327C791225B@gmail.com>
References: <20250217215641.372723-1-detlev.casanova@collabora.com>
 <B8EF5196-55FB-44EC-B93C-E327C791225B@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External
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

Hi Piotr,

On Thursday, 20 February 2025 06:16:20 EST Piotr Oniszczuk wrote:
> > Wiadomo=C5=9B=C4=87 napisana przez Detlev Casanova <detlev.casanova@col=
labora.com> w
> > dniu 17 lut 2025, o godz. 22:47:
> >=20
> > To support HDMI audio on the rk3588 based devices, the generic HDMI
> > Codec framework is used in the dw-hdmi-qp DRM bridge driver.
> >=20
> > The implementation is mainly based on the downstream driver, ported to =
the
> > generic HDMI Codec framework [1] recently merged in the master branch.
> > The parameters computation has been kept as is and the data stored in t=
he
> > dw_hdmi_qp struct as been cleaned up.
> >=20
> > The table for the N values has been edited to reflect N recommended val=
ues
> > as well as CTS recommended values.
> >=20
> > The downstream kernel also implements a machine driver for HDMI audio b=
ut
> > it is doing exactly what the simple-audio-card driver does, so use that
> > instead in the RK3588 SoC device tree.
> >=20
> > This adds HDMI audio support for both HDMI TX ports.
> >=20
> > *** Dependencies ***
> >=20
> > Based on Linus' master branch, but also needs Cristian's dts patches for
> > HDMI1 support [2], which depends on Heiko's patchset for
> > phy-rockchip-samsung-hdptx [3]. Patches will apply without [3], but HDMI
> > will not work (at all).
> >=20
> > [1]:
> > https://lore.kernel.org/all/20241224-drm-bridge-hdmi-connector-v10-0-dc=
89
> > 577cd438@linaro.org [2]:
> > https://lore.kernel.org/linux-rockchip/20241211-rk3588-hdmi1-v2-0-02cdc=
a2
> > 2ff68@collabora.com [3]:
> > https://lore.kernel.org/lkml/20241206103401.1780416-3-heiko@sntech.de/
> >=20
> > Changes since v6:
> > - Fix arguments alignement (checkpatch --strict warnings)
> > - Add hdmi1 audio support too
> > - Move hdmi0_sound node under hdmi0_out_con
> >=20
> > Changes since v5:
> > - Simplify audio math computation for N
> > - Move hdmi0-sound node up with other address-less nodes
> >=20
> > Changes since v4:
> > - Moved hdmi0_audio node the rk3588-base.dtsi
> > - Enable hdmi0_audio in rk3588-rock-5b.dts
> >=20
> > Changes since v3:
> > - Renamed function to start with dw_hdmi_qp
> >=20
> > Changes since v2:
> > - Also clear the audio infoframe
> > - Write AUDI_CONTENTS0 to its default value in case it gets overwritten.
> > - Store tmds_char_rate in the dw_hdmi_qp struct in atomic_enable
> > - Clear tmds_char_rate in atomic_disable and only write registers when
> >=20
> >   tmds_char_rate is not 0.
> >=20
> > - Do not use connector_state duplicates
> >=20
> > Changes since v1:
> > - Remove useless audio_mutex (was used downstream for multiple drivers
> > access>=20
> >   to audio functions)
> >=20
> > - Let hdmi_codec build and setup audio infoframes
> > - Only access audio registers when connector is connected
> > - Rebased on master branch
> >=20
> > Detlev Casanova (2):
> >  arm64: dts: rockchip: Add HDMI audio outputs for rk3588 SoC
> >  arm64: dts: rockchip: Enable HDMI audio outputs for Rock 5B
> >=20
> > Sugar Zhang (1):
> >  drm/bridge: synopsys: Add audio support for dw-hdmi-qp
> >=20
> > arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |  17 +
> > .../arm64/boot/dts/rockchip/rk3588-extra.dtsi |  17 +
> > .../boot/dts/rockchip/rk3588-rock-5b.dts      |  16 +
> > drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c  | 489 ++++++++++++++++++
> > 4 files changed, 539 insertions(+)
>=20
> Detelv,
>=20
> Just curious of your opinion:
>=20
> I=E2=80=99m on 6.14-rc3 and using
> https://gitlab.collabora.com/cristicc/linux-next/-/commits/rk3588-hdmi-br=
id
> ge + this v7 series.

Do you have the branch available somewhere ?

> On mine rock5b all works nicely but - at boot time - i=E2=80=99m getting =
some oops
> in kernel like this:
> https://gist.github.com/warpme/e1668acbef7817e5d2a88a6840328722

I did notice that at one point but it disappeard after a rebase on the the=
=20
latest master so I didn't look further into that.
Could it be related to 2518a0e1b878042f9afa45ae063e544a16efc1a3 "ASoC: simp=
le-
card: use __free(device_node) for device node" ?

I'm not exactly sure how __free(device_node) works though, but reverting th=
at=20
commit could fix the issue.

> I=E2=80=99m not sure where issue is but it looks to me like kind of inter=
ference
> between analog audio and hdmi audio as commenting analog audio in dts (
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arc=
h/
> arm64/boot/dts/rockchip/rk3588-rock-5b.dts?h=3Dv6.14-rc3#n24 ) stops kern=
el
> from oops=E2=80=99ing=E2=80=A6.

I cannot reproduce anymore, so if you have a branch/config that you use, I=
=20
could try, looking into that.
I don't see any relevant commits that would change this behavior on master=
=20
since v6.14-rc3, so I'm not sure what is going on.

>  rock5b dts i=E2=80=99m using is like this:
> https://gist.github.com/warpme/a8a32afd4a05d4b7f25d2808984b05ac

Regards,
Detlev.


