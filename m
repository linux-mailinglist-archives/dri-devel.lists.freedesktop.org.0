Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F98796F385
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 13:48:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0009610EA24;
	Fri,  6 Sep 2024 11:48:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=dolcini.it header.i=@dolcini.it header.b="Oy9QaNOD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 325 seconds by postgrey-1.36 at gabe;
 Fri, 06 Sep 2024 11:48:46 UTC
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE47D10EA24
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 11:48:46 +0000 (UTC)
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
 by mail11.truemail.it (Postfix) with ESMTPA id 5A6361FBFB;
 Fri,  6 Sep 2024 13:43:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
 s=default; t=1725622997;
 bh=zHtMclKF/ryXLIb1oo9T38iNo/P84poCTmamh3tRO3k=; h=From:To:Subject;
 b=Oy9QaNOD6Pyg9+W5FW/VBPabb2wFRnEq7FACgHXChK6/W3nG7zGOA7TUpb0rqS1bu
 pUXOv0ZrRLB0ixZLU7oUszsVDguTEmNF0iFOAlmd1GsltJ2LS6nzYmIicosXJi8Swc
 jZaSllKAk8C7QN7tLo8s8u3l8zkX0fk4O99W7Ea7iEAL217gN5cicVcFpdQojsiHbs
 gNFk6z68L2USSpod9Ms5ltgCrWVImP1AgCBImNSncONRhaXFBmMQzvl0lrIbiq9yLf
 PM4LM6K8XbgIFE0CJImR+wC1DQ/q13JivFxiDAtuhFEksT5RjwvBKPB/k+YvS8mkfw
 oa1aSKx1S+UOQ==
Date: Fri, 6 Sep 2024 13:43:11 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Aradhya Bhatia <a-bhatia1@ti.com>, max.krummenacher@toradex.com
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Devicetree List <devicetree@vger.kernel.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>,
 Francesco Dolcini <francesco@dolcini.it>,
 Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 Randolph Sapp <rs@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Jayesh Choudhary <j-choudhary@ti.com>, Jai Luthra <j-luthra@ti.com>
Subject: Re: [PATCH v3 0/4] drm/tidss: Add OLDI bridge support
Message-ID: <20240906114311.GA32916@francesco-nb>
References: <20240716084248.1393666-1-a-bhatia1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240716084248.1393666-1-a-bhatia1@ti.com>
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

+Max

Hello Aradhya,

On Tue, Jul 16, 2024 at 02:12:44PM +0530, Aradhya Bhatia wrote:
> The addition of the 2nd OLDI TX (and a 2nd DSS in AM62Px) creates a need
> for some major changes for a full feature experience.
> 
> 1. The OF graph needs to be updated to accurately show the data flow.
> 2. The tidss and OLDI drivers now need to support the dual-link and the
>    cloned single-link OLDI video signals.
> 3. The drivers also need to support the case where 2 OLDI TXes are
>    connected to 2 different VPs - thereby creating 2 independent streams
>    of single-link OLDI outputs.

Have you considered/tested the use case in which only single link is used?
You do not mention it here and to me this is a relevant use case.

There is a workaround for this (use option 2, cloned, even if nothing is
connected to the second link), but this seems not correct.

We (Max in Cc here) noticed that this specific use case is broken on
your downstream v6.6 TI branch.

Francesco

