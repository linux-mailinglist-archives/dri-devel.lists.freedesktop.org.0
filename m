Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB52895E550
	for <lists+dri-devel@lfdr.de>; Sun, 25 Aug 2024 22:37:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B51210E02C;
	Sun, 25 Aug 2024 20:37:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=goldelico.com header.i=@goldelico.com header.b="Zb8TNArZ";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="lPzWUZdX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 344 seconds by postgrey-1.36 at gabe;
 Sun, 25 Aug 2024 20:37:28 UTC
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 499EE10E02C
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Aug 2024 20:37:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1724617887; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=QGActSi6qACLSVr3C1rdOZSH01YQx3mwBM4hUwV7HugBCYgcHvxkICYaIWEhrqUotW
 LHcSMWTM9bxKLHwJ62Oh6i7qGHsqHce1Sp2NB64jw8i8DNPl3izsEybzb6tcXGY6sued
 eYSwO0KvHaNJ/4UAtrO1+efxti9GqFZ+I/27r1f14oUEWihvjBf2msSY13OIHegz4pkA
 7NpjsAkhZe2d63Dgt1/mI+92L32OXrBV7+U03FbLj6hikZesLKgcX5KYcYC2svhfSgai
 DUsYhXRPLKZ8bY0qRTo4q4CZ3PvlcixQ0GkdQwQ92akMVuIWyO1l8kBwB1oOOG766ibN
 ZzZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1724617887;
 s=strato-dkim-0002; d=strato.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=Z9BLSZuwrvSDL7iQx7DGiuZzslsd2OQ+ced4zl2PIn0=;
 b=Jzsr6DiBCDhpdBafEKTNrZYVTScP3e/fj41JQys2hTehsacR6n1sTATgu5oodeGJwt
 m50nl2EDCiWtb2n8971nF+JIR7FWRyMJlVNzaf59gi5LYvbzh8h5CuyTyG9Cv0CWM8Z/
 yE6JE3x5gNSyjaQD0x4ECoCg/SwWgUwxX/U2VAMpMk5A5ihYsM2XZ5LB4O8FAH0CQoIO
 M6dRn8dAA/A6iWc3ZfZpPiyxU2jssN2DfiYrzMPq5wQTYUSeDDTuLGY1xAxgzN0rh7/m
 VMvqK9h2DfTnCI3njanWtCKWch5ivHKEdZpvUi6evdGl10YLAsTD5y9gJDUz04GMpi0o
 gWaw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1724617887;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=Z9BLSZuwrvSDL7iQx7DGiuZzslsd2OQ+ced4zl2PIn0=;
 b=Zb8TNArZt7QVpi7YMCoey7torw6UEmMOgSCcwFR6wBgxa7BMbaQR4mq3UfRwprC1VG
 krGAnidyLaD/9IJkUdgo1XC/Y0jBYtgSXnJAZVS75zRz4CpJmsMxpoWQEsII6s4/B7sg
 zY3VE5gStby4U8O/wpRHFQUIpuusDhrcdMytQ0E++3bgoyqLce7kbAtw8DzHgMrfCDyU
 gPeNhTbK1fZtPn6xosdn7UYZdlfKnie8Qwq2HDIyaQZNeusKsiU5Drt5KRPb382XxwOK
 MWF0Sj17iEJHHnBK+xmdzDOj+cHiBthHAR1ZrMOwuZyooXB/xeRx+AA33PJX4DeW6b/B
 rx+w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1724617887;
 s=strato-dkim-0003; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=Z9BLSZuwrvSDL7iQx7DGiuZzslsd2OQ+ced4zl2PIn0=;
 b=lPzWUZdXXdBLcLUMt4DRmk4VAskRCZDnyHsapP8B5gW/vlxlZQejCYNp7Po8yBPLaP
 4QsSCb5LbfhYEgF/IICA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lFzL1yfz4Z"
Received: from smtpclient.apple by smtp.strato.de (RZmta 51.2.3 DYNA|AUTH)
 with ESMTPSA id Q984c207PKVQkZz
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Sun, 25 Aug 2024 22:31:26 +0200 (CEST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: [PATCHv2 0/6] drm/omap: hdmi: improve hdmi4 CEC, add CEC for hdmi5
From: H. Nikolaus Schaller <hns@goldelico.com>
In-Reply-To: <20210302162403.983585-1-hverkuil-cisco@xs4all.nl>
Date: Sun, 25 Aug 2024 22:31:15 +0200
Cc: linux-media@vger.kernel.org, Sekhar Nori <nsekhar@ti.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Andreas Kemnade <andreas@kemnade.info>
Content-Transfer-Encoding: quoted-printable
Message-Id: <43F64377-8394-448F-A6F0-4DA11DB9AEF5@goldelico.com>
References: <20210302162403.983585-1-hverkuil-cisco@xs4all.nl>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3776.700.51)
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
CEC features are useful to e.g. control HDMI monitor standby.

But I wonder what happened to this series?=20

I could find some reviewed-by: and acked-by: in [1] but it wasn't merged =
upstream
for unidentifiable reasons.

We apparently had merged this series some years ago into our LetuxOS =
distro kernel
and now we found it to be broken (NULL dereference) at least for =
omap5uevm
(and likely Pyra Handheld) after rebasing to v6.11-rc (it was already =
broken
since v6.9-rc1). Fixes were not difficult, but it would be better if it =
were
part of upstream.

BR and thanks,
Nikolaus

[1] =
https://lore.kernel.org/r/all/20210302162403.983585-4-hverkuil-cisco@xs4al=
l.nl/T/

> Am 02.03.2021 um 17:23 schrieb Hans Verkuil =
<hverkuil-cisco@xs4all.nl>:
>=20
> This series improves the drm_bridge support for CEC by introducing two
> new bridge ops in the first patch, and using those in the second =
patch.
>=20
> This makes it possible to call cec_s_conn_info() and set
> CEC_CAP_CONNECTOR_INFO for the CEC adapter, so userspace can associate
> the CEC adapter with the corresponding DRM connector.
>=20
> The third patch simplifies CEC physical address handling by using the
> cec_s_phys_addr_from_edid helper function that didn't exist when this
> code was originally written.
>=20
> The fourth patch adds the cec clock to ti,omap5-dss.txt.
>=20
> The fifth patch the missing cec clock to the dra7 and omap5 device =
tree,
> and the last patch adds CEC support to the OMAP5 driver.
>=20
> Tested with a Pandaboard and a Beagle X15 board.
>=20
> Regards,
>=20
> Hans
>=20
> Changes since v1:
>=20
> - as per suggestion from Laurent, changed cec_init/exit to
>  connector_attach/_detach which are just called for all
>  bridges. The DRM_BRIDGE_OP_CEC was dropped.
>=20
> - added patch to add the cec clock to ti,omap5-dss.txt
>=20
> - swapped the order of the last two patches
>=20
> - incorporated Tomi's suggestions for the hdmi5 CEC support.
>=20
> Hans Verkuil (6):
>  drm: drm_bridge: add connector_attach/detach bridge ops
>  drm/omapdrm/dss/hdmi4: switch to the connector bridge ops
>  drm/omapdrm/dss/hdmi4: simplify CEC Phys Addr handling
>  dt-bindings: display: ti: ti,omap5-dss.txt: add cec clock
>  dra7.dtsi/omap5.dtsi: add cec clock
>  drm/omapdrm/dss/hdmi5: add CEC support
>=20
> .../bindings/display/ti/ti,omap5-dss.txt      |   4 +-
> arch/arm/boot/dts/dra7.dtsi                   |   5 +-
> arch/arm/boot/dts/omap5.dtsi                  |   5 +-
> drivers/gpu/drm/drm_bridge_connector.c        |   9 +
> drivers/gpu/drm/omapdrm/Kconfig               |   8 +
> drivers/gpu/drm/omapdrm/Makefile              |   1 +
> drivers/gpu/drm/omapdrm/dss/hdmi.h            |   1 +
> drivers/gpu/drm/omapdrm/dss/hdmi4.c           |  40 ++--
> drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c       |  13 +-
> drivers/gpu/drm/omapdrm/dss/hdmi4_cec.h       |  12 +-
> drivers/gpu/drm/omapdrm/dss/hdmi5.c           |  63 +++++-
> drivers/gpu/drm/omapdrm/dss/hdmi5_cec.c       | 209 ++++++++++++++++++
> drivers/gpu/drm/omapdrm/dss/hdmi5_cec.h       |  42 ++++
> drivers/gpu/drm/omapdrm/dss/hdmi5_core.c      |  35 ++-
> drivers/gpu/drm/omapdrm/dss/hdmi5_core.h      |  33 ++-
> include/drm/drm_bridge.h                      |  27 +++
> 16 files changed, 453 insertions(+), 54 deletions(-)
> create mode 100644 drivers/gpu/drm/omapdrm/dss/hdmi5_cec.c
> create mode 100644 drivers/gpu/drm/omapdrm/dss/hdmi5_cec.h
>=20
> --=20
> 2.30.1
>=20

