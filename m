Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A9D918283
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 15:33:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF6F610E272;
	Wed, 26 Jun 2024 13:33:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZZCVk4fe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E39BD10E272
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 13:33:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id ACD8BCE20DA;
 Wed, 26 Jun 2024 13:33:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D40EC2BD10;
 Wed, 26 Jun 2024 13:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719408827;
 bh=GGaohN4Y1t1MQWC0s+WjoANH6+XCJW6K74wQWCFFwPQ=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=ZZCVk4fedPg3V7UBSS4ZSdWLXk6U/v6gI0wsmwwxyX2bvz5tuTlaaMUcFMObsqvSh
 KZIht/i6ZUqA2lprf+nf2Zjkjm2WG54T+uksUD77lbwJIuq9QIs9dJeI6In/+y4wdk
 s+rXU8XQkC3nLUQD07MOicZG/M3BCNIdUF8UdvgkYsB3dwSz4wxbl1NOpo+9HFRSvE
 +J86zc7Dgy3m7TBnpuFsDNsp4n5cYHP6ukGjSdBqS4CaeSKD1Hr0U3TOAIcrHUjqUB
 bDCBCiK9UL4oSEcB05I7r/TrJUsaLu2bkeg+BjMgBsoLt9Xtf2GKg8dHltasYQ5kel
 khIk5IRoO9uWA==
Message-ID: <a28e2eb1de7e62e1516fabeff8c23164@kernel.org>
Date: Wed, 26 Jun 2024 13:33:45 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dave Stevenson" <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v2 00/31] Preparatory patches for BCM2712 (Pi5) support
In-Reply-To: <20240621152055.4180873-1-dave.stevenson@raspberrypi.com>
References: <20240621152055.4180873-1-dave.stevenson@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, "Daniel Vetter" <daniel@ffwll.ch>, "David
 Airlie" <airlied@gmail.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>,
 "Raspberry Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: quoted-printable
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

On Fri, 21 Jun 2024 16:20:24 +0100, Dave Stevenson wrote:
> Hi
>=20
> This set is a number of minor fixes that we've had downstream for a while,
> and then lays down the some infrastructure changes to facilitate adding s=
upport
> of BCM2712. I'm just finalising those patches so they should follow on fa=
irly
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
