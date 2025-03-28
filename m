Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F939A74A23
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 13:52:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1172410E9F9;
	Fri, 28 Mar 2025 12:52:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=dolcini.it header.i=@dolcini.it header.b="flfuBTc8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 492 seconds by postgrey-1.36 at gabe;
 Fri, 28 Mar 2025 12:52:41 UTC
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F04810E9F9
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 12:52:41 +0000 (UTC)
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
 by mail11.truemail.it (Postfix) with ESMTPA id 500241F93B;
 Fri, 28 Mar 2025 13:44:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
 s=default; t=1743165858;
 bh=wegXwhmpEO39gi7WyoocQ2XUlelcvMW0ifZq3KqBSPQ=; h=From:To:Subject;
 b=flfuBTc8xCv6X7IKyP4kp7T5LPFKSFGLH68bbXi9iq1Y+E5wfdcB30Bg6r0t8Ec77
 3nkX99hfvoOEw86ht7d9Icudy4s96NjyZmfME79kXRN1agqfz3dzPVTCmiBoqMrbYZ
 zf0qnR3xT0sR8o92cyN4SHLBmj7a5RWhVxfFp84I3Y4qcpb3gQWA7N7QhmpOcI2B9g
 Im8IcXiSB0gcGZz9F38vIZsx20Mmpt59RhHXdguPjrgpyC4k/OrJxMI63Mcz5Eq+IA
 qAOrZThGBbQAB3tk2CGkBWb79k/KsSUWgLU0hqqD9WWDyqlgoltwXZaXgKzPaI0/1R
 M6H1Rd1KAOGhA==
Date: Fri, 28 Mar 2025 13:44:13 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Simona Vetter <simona@ffwll.ch>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>,
 Jayesh Choudhary <j-choudhary@ti.com>,
 Francesco Dolcini <francesco@dolcini.it>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Devicetree List <devicetree@vger.kernel.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 0/4] drm/tidss: Add OLDI bridge support
Message-ID: <20250328124413.GA44888@francesco-nb>
References: <20250226181300.756610-1-aradhya.bhatia@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226181300.756610-1-aradhya.bhatia@linux.dev>
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

Hello Aradhya,

On Wed, Feb 26, 2025 at 11:42:56PM +0530, Aradhya Bhatia wrote:
> The AM62Px SoC has 2 OLDI TXes like AM62x SoC. However, the AM62Px SoC also has
> 2 separate DSSes. The 2 OLDI TXes can now be shared between the 2 VPs of the 2
> DSSes.

Do we have support for 2 independent single link LVDS/OLDI display + 1 x DSI
display? From my understanding the SoC should support it, but it's not
clear if the SW does support it.

Thanks,
Francesco

