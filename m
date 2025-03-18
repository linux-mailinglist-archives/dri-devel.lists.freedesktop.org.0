Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04948A678FF
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 17:19:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25C3E10E224;
	Tue, 18 Mar 2025 16:19:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="fM5q+AK1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EB8910E1DE;
 Tue, 18 Mar 2025 16:19:30 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id C251058265C;
 Tue, 18 Mar 2025 16:02:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B84CF4431C;
 Tue, 18 Mar 2025 16:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1742313755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=baOMbasIHySzN1tAztBhKFZtQWvc7C7Z2zw5B3J1lYM=;
 b=fM5q+AK1CwYjUwitI0Cpn3nkCc3ChML/bUVxQAO4WCOPMQBJbDA2kT6ZDrE3s9xL9XkiXa
 tidgSSlZ7Nupi/KYPMSJKw0HhIrPemspSi4GI5uaaPpZTDS4B3llqyLOMUbQcNXYW5zFz7
 1Zw8Tsa83IG1i1MN8kFMc86gDOEiejrvSKL9rJIASf2dGidPgfBJnUsh4sCRr1N4/zuBC/
 6BKmhNR7WCWdoPbbKnPSwIVzuA+C854HLUpohwXgGw0opkc9L0pV95P71bIHb4h+SlXDMJ
 OpYza+rkGP9mKQah9G3CMEk9LBt9a0q/gx+h5nNvkUXnL9V+z7ZwB0CYpMVKgA==
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
 Karthik Poosa <karthik.poosa@intel.com>,  Reuven Abliyev
 <reuven.abliyev@intel.com>,  Oren Weil <oren.jer.weil@intel.com>,
 linux-mtd@lists.infradead.org,  dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 00/11] mtd: add driver for Intel discrete graphics
In-Reply-To: <20250302140921.504304-1-alexander.usyskin@intel.com> (Alexander
 Usyskin's message of "Sun, 2 Mar 2025 16:09:10 +0200")
References: <20250302140921.504304-1-alexander.usyskin@intel.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 18 Mar 2025 17:02:33 +0100
Message-ID: <87frja72ee.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugedvkeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvuddprhgtphhtthhopegrlhgvgigrnhguvghrrdhushihshhkihhnsehinhhtvghlrdgtohhmpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehluhgtrghsrdguvghmrghrtghhihesihhnthgvlhdrtghomhdprhgtphhtthhopehthhhomhgrshdrhhgvlhhlshhtrhhomheslhhinhhugidrihhnthgvlhdrt
 ghomhdprhgtphhtthhopehrohgurhhighhordhvihhvihesihhnthgvlhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhg
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

On 02/03/2025 at 16:09:10 +02, Alexander Usyskin <alexander.usyskin@intel.c=
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

I need to test patch 1, sorry for the delay, I will do that and if I'm
happy with the result I'll apply this patch to mtd/next at -rc1 (better
having this kind of change early in the cycle).

The other patches can go through drm I guess, regardless of the presence
of patch 1. I'll send my acks after testing.

Thanks,
Miqu=C3=A8l
