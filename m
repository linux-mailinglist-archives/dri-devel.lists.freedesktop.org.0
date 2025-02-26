Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6319CA45C73
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 12:02:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5523610E8BF;
	Wed, 26 Feb 2025 11:01:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=louisalexis.eyraud@collabora.com header.b="Pqnuy1cd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (unknown [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD3AC10E8BF
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 11:01:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1740567688; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=OHsDb7qi1Q6V5cXXa+YwxRDw8cJL6/TX5DzDe+cmvdZmYIUxkaQlNlknKCAZYLlALZqtbBA67LDbcR8LX0SfCCV9GF3bbiDMCfulZHfpK9K+Rg/zb8OIyjTBVaIJ7awcqkjSmrcb4khM3tIKQaAJTeIwtUXLrSG7v9FEaZJncS8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1740567688;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=PFQ+EYK/8O8aCGX6DneukYkRMliA11MfeP0OGf/4Nhc=; 
 b=EbOZIp7auPL055mgS9OAypJ0Me3pj7acA7q6jcB2A5IadsDoALo/FLmB/w3f9mnXL6ajBSPqevKRNUYf7VoOvenM31LimL8CNpIXtA5aPwm7+K9zQUQcP32dmtGgWqLoogINjpETwjYFp7Ie64tNDij6VOqdPrprlEqSVNkUMCo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=louisalexis.eyraud@collabora.com;
 dmarc=pass header.from=<louisalexis.eyraud@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740567688; 
 s=zohomail; d=collabora.com; i=louisalexis.eyraud@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=PFQ+EYK/8O8aCGX6DneukYkRMliA11MfeP0OGf/4Nhc=;
 b=Pqnuy1cdlVxfvgCICDSklrgS9RX7RbAtLq6CNEwg0w7lWu1hVbp11s2h9Gp7+n1u
 pBDTlMExaN1+A1dUef26MN0FZ6wXWlh4Bd5k1aj+oeZ6GQHX38JUK4k4bImN0dxsWbN
 99H4QJjcunoe7QNcf/etCvN/Vb5cCx1IbIYmbMUs=
Received: by mx.zohomail.com with SMTPS id 1740567685853948.6812241070395;
 Wed, 26 Feb 2025 03:01:25 -0800 (PST)
Message-ID: <3ec81e9083afae19f672afed3809ad5db20f7d9a.camel@collabora.com>
Subject: Re: [PATCH v2 0/2] Add driver for Himax HX8279 DriverIC panels
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 neil.armstrong@linaro.org
Cc: quic_jesszhan@quicinc.com, airlied@gmail.com, simona@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, pablo.sun@mediatek.com,
 christophe.jaillet@wanadoo.fr
Date: Wed, 26 Feb 2025 12:01:20 +0100
In-Reply-To: <20250218143952.84261-1-angelogioacchino.delregno@collabora.com>
References: <20250218143952.84261-1-angelogioacchino.delregno@collabora.com>
Organization: Collabora Ltd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
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

On Tue, 2025-02-18 at 15:39 +0100, AngeloGioacchino Del Regno wrote:
> Changes in v2:
> =C2=A0- Removed unneeded mipi_dsi_device_unregister() call for secondary
> =C2=A0=C2=A0 DSI: as the driver is using devm, that's not necessary (CJ)
> =C2=A0- Removed superfluous if branch as pointed out by CJ
>=20
> This series adds a driver for DSI panels using the Himax HX8279 and
> HX8279-D DriverICs, and introduces one panel using such a
> configuration,
> the Startek KX070FHFID078.
>=20
> This panel is found on the latest hardware revisions of some MediaTek
> Genio Evaluation Kits, and specifically, at least:
> =C2=A0- Genio 510 EVK
> =C2=A0- Genio 700 EVK
> =C2=A0- Genio 1200 EVK
>=20
> This driver was tested on all of the aforementioned boards.
>=20
> AngeloGioacchino Del Regno (2):
> =C2=A0 dt-bindings: display: panel: Add Himax HX8279/HX8279-D
> =C2=A0 drm: panel: Add driver for Himax HX8279 and Startek KD070FHFID078
>=20
> =C2=A0.../bindings/display/panel/himax,hx8279.yaml=C2=A0 |=C2=A0 74 ++
> =C2=A0drivers/gpu/drm/panel/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 11 +
> =C2=A0drivers/gpu/drm/panel/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0drivers/gpu/drm/panel/panel-himax-hx8279.c=C2=A0=C2=A0=C2=A0 | 905
> ++++++++++++++++++
> =C2=A04 files changed, 991 insertions(+)
> =C2=A0create mode 100644
> Documentation/devicetree/bindings/display/panel/himax,hx8279.yaml
> =C2=A0create mode 100644 drivers/gpu/drm/panel/panel-himax-hx8279.c
>=20
Tested-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com> # on
Genio 510 EVK and Genio 1200 EVK

