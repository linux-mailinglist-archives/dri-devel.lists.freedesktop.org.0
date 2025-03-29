Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 461EEA75686
	for <lists+dri-devel@lfdr.de>; Sat, 29 Mar 2025 14:59:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD36310E241;
	Sat, 29 Mar 2025 13:59:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="cGcTw6BN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com
 [95.215.58.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 705AC10E241
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Mar 2025 13:59:35 +0000 (UTC)
Message-ID: <2909146e-dffa-400b-b3ae-c0432c4a0bae@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1743256771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=36gri5fD2xCnOVAPYs/LSgPPkt9zRhINUlQM2IDvXSc=;
 b=cGcTw6BNm1vP1awkZJO0tJCiwL1WMjvxz9EzJ59JDqvhKT/bp4L4+24TbnlVTNZwghSAFh
 WAFY9+S82iTQP53LoSM+bttb7IAdSWSDELJGbkfKq0ASyOuFZPTDl+hnUzOtDmHQpGOtd4
 ujnPPHdaPxKvUNPrtnlS7+lsigmP+v4=
Date: Sat, 29 Mar 2025 19:28:39 +0530
MIME-Version: 1.0
Subject: Re: [PATCH v6 0/4] drm/tidss: Add OLDI bridge support
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Simona Vetter <simona@ffwll.ch>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>,
 Jayesh Choudhary <j-choudhary@ti.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Devicetree List <devicetree@vger.kernel.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>
References: <20250226181300.756610-1-aradhya.bhatia@linux.dev>
 <20250328124413.GA44888@francesco-nb>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <20250328124413.GA44888@francesco-nb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

Hi Francesco,

On 28/03/25 18:14, Francesco Dolcini wrote:
> Hello Aradhya,
> 
> On Wed, Feb 26, 2025 at 11:42:56PM +0530, Aradhya Bhatia wrote:
>> The AM62Px SoC has 2 OLDI TXes like AM62x SoC. However, the AM62Px SoC also has
>> 2 separate DSSes. The 2 OLDI TXes can now be shared between the 2 VPs of the 2
>> DSSes.
> 
> Do we have support for 2 independent single link LVDS/OLDI display + 1 x DSI
> display? From my understanding the SoC should support it, but it's not
> clear if the SW does support it.

The AM62Px SoC does indeed support the configuration that you mention,
but the mainline tidss driver does not support AM62Px DSSes yet.

This series only adds support for the OLDI TXes found in TI's DSS
hardware.

-- 
Regards
Aradhya

