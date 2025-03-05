Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED07A4FA33
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 10:35:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F0F610E246;
	Wed,  5 Mar 2025 09:35:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="qZeJLqd+";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="rN9bkF/6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87AB310E246
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 09:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1741167345; x=1772703345;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Jyc0o/VMOXI30xo+J36YcCxvEuBKWlv1PliS5DKyB2A=;
 b=qZeJLqd+9JafMLdvUcZBXBAHyfVhHjsj/t3xEk45uy/Vxs53subxAXYg
 6E0G2qz91PGWRS+VehDbFNtTJEM5uA4OXpMPIxCeQ9sUlubhmWRvhHg2I
 hl8LHqgSu7hw5iKtqZqxJ0WuTTS/u4QbeyTotOabUOgaS884F7wzb1GHR
 0n9VaIIMNGD9zraf90bfML+exCcLDl6M/EfYRe5W6QWXW3j5hvUwrwm8I
 8vGuiwtumnmt8y5xlU/lLZ2UzGAU2Bk6gMUljs3yESQnd/m263y+Gem2X
 qEQfWgmboDBBVygb390cNKhUziHIZCM6ytVSPaxDAlOxmCYV0b8l/MZ7P Q==;
X-CSE-ConnectionGUID: Eay/tyQ3TEGpHgghp7C/4A==
X-CSE-MsgGUID: vxq+5lkuQv2w7HG+jB/54A==
X-IronPort-AV: E=Sophos;i="6.14,222,1736809200"; d="scan'208";a="42303871"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 05 Mar 2025 10:35:39 +0100
X-CheckPoint: {67C81AEB-E-B1D34AC3-DEA5B19F}
X-MAIL-CPID: E9EC19DC2DEB38BC23034233209DF469_4
X-Control-Analysis: str=0001.0A00636A.67C81AEB.0146, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 67C14170FF5; Wed,  5 Mar 2025 10:35:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1741167334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jyc0o/VMOXI30xo+J36YcCxvEuBKWlv1PliS5DKyB2A=;
 b=rN9bkF/64KDDTPYAyySZk0Mm0QNhup6z5oj0FdVBAJZjJE3bsTsZc4IrHgusmWoLXEdRfI
 3moeKx8BUzdxufYlLxK9uTJJSD/f9UHhUodtpxkAiiS7fVcDdR8uVIXxMP4nsm7g+/F6iG
 tzLt7nOzX/+NGGSUBHDVSeIEdT8qNofcL/iM+VJL58YtoyYKDQo53dXBR1O/aQ6cUwWXRB
 mxzHyJ3JzEcS1mHeZDs5kHKI529jrZoYjponLS7KZRBlJr55rx2GM+q8uGrt61SVqmRcyk
 E+2Ppd1dlHzFasqxvSSGWtwtXEzDSVxlS8pRk6nQeDzSFOz5UQRx2lMwF3mmkg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/5] dt-bindings: display: simple-bridge: Document DPI
 color encoder
Date: Wed, 05 Mar 2025 10:35:26 +0100
Message-ID: <1891036.atdPhlSkOF@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250304152320.GA2630063-robh@kernel.org>
References: <20250304101530.969920-1-victor.liu@nxp.com>
 <20250304101530.969920-4-victor.liu@nxp.com>
 <20250304152320.GA2630063-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
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

Am Dienstag, 4. M=E4rz 2025, 16:23:20 CET schrieb Rob Herring:
> On Tue, Mar 04, 2025 at 06:15:28PM +0800, Liu Ying wrote:
> > A DPI color encoder, as a simple display bridge, converts input DPI col=
or
> > coding to output DPI color coding, like Adafruit Kippah DPI hat[1] which
> > converts input 18-bit pixel data to 24-bit pixel data(with 2 low padding
> > bits in every color component though). Document the DPI color encoder.
>=20
> Why do we need a node for this? Isn't this just wired how it is wired=20
> and there's nothing for s/w to see or do? I suppose if you are trying to=
=20
> resolve the mode with 24-bit on one end and 18-bit on the other end, you=
=20
> need to allow that and not require an exact match. You still might need=20
> to figure out which pins the 18-bit data comes out on, but you have that=
=20
> problem with an 18-bit panel too. IOW, how is this any different if you=20
> have an 18-bit panel versus 24-bit panel?

Especially panel-simple.c has a fixed configuration for each display, such =
as:
> .bus_format =3D MEDIA_BUS_FMT_RGB666_1X18

How would you allow or even know it should be addressed as
MEDIA_BUS_FMT_RGB888_1X24 instead? I see different ways:
1. Create a new display setting/compatible
2. Add an overwrite property to the displays
3. Use a (transparent) bridge (this series)

Number 1 is IMHO out of question. I personally don't like number 2 as this
feels like adding quirks to displays, which they don't have.
Number 3 actually describe the hardware connection. The only impact for
software is to know which bus format it should use.

Best regards
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


