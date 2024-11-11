Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0443C9C4643
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 21:00:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CB6F10E534;
	Mon, 11 Nov 2024 20:00:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Uz4rrv9s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E390510E534;
 Mon, 11 Nov 2024 20:00:06 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::229])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id DE7DDC0431;
 Mon, 11 Nov 2024 20:00:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 64570FF805;
 Mon, 11 Nov 2024 19:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1731355201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/sZlCQTAFlSV3ML2XYkoLh9xs5MKTCcnmOpJ7AVIaFs=;
 b=Uz4rrv9sAP6S1v8QJIJFrVsvty0w6LV7bj8szBZ3c6JUpFfJZMqY1PY7ggwgRie8xN6OtY
 DPSXnkYejOFnRKak5R1szxwUDKqIDtzg1hzIZX6bAeA9PwYmGxGqRlxGuCTu5wVuojLLR0
 5/EKKzrKJYipEREX7mfpycg3/XKqDBkB/U47/hFOlwAN6G0lefplYzZh1RT/ghKfeaAx+G
 FebU7XtxgGauhPdMs6Ho0PNyl6Z38OWv7zh4/ioRknH7nxLvC43fd21YlFFfudVvHh10RL
 D0pckZO+obQ4tj7cdnK9tdsytdbUQHJcMJl0P2UrnR6OJjsvuwyPrW7M2ncK7A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Lucas De Marchi <lucas.demarchi@intel.com>,  Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,  Rodrigo
 Vivi <rodrigo.vivi@intel.com>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Jani Nikula
 <jani.nikula@linux.intel.com>,  Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>,  Tvrtko Ursulin <tursulin@ursulin.net>,
 Oren Weil <oren.jer.weil@intel.com>,  linux-mtd@lists.infradead.org,
 dri-devel@lists.freedesktop.org,  intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/10] mtd: add driver for Intel discrete graphics
In-Reply-To: <20241107131356.2796969-1-alexander.usyskin@intel.com> (Alexander
 Usyskin's message of "Thu, 7 Nov 2024 15:13:46 +0200")
References: <20241107131356.2796969-1-alexander.usyskin@intel.com>
User-Agent: mu4e 1.12.1; emacs 29.4
Date: Mon, 11 Nov 2024 20:59:58 +0100
Message-ID: <87y11po81t.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
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

Hello Alexander,

On 07/11/2024 at 15:13:46 +02, Alexander Usyskin <alexander.usyskin@intel.c=
om> wrote:

> Add driver for access to Intel discrete graphics card
> internal NVM device.
> Expose device on auxiliary bus by i915 and Xe drivers and
> provide mtd driver to register this device with MTD framework.
>
> This is a rewrite of "drm/i915/spi: spi access for discrete graphics"
> and "spi: add driver for Intel discrete graphics"
> series with connection to the Xe driver and splitting
> the spi driver part to separate module in mtd subsystem.
>
> This series intended to be pushed through drm-xe-next.

Overall the mtd bits look fine, I don't want to block this series
further so you can add on the mtd patches my

Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l
