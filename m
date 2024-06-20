Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A14790FF88
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 10:53:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C69710E873;
	Thu, 20 Jun 2024 08:53:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="McMVsr6V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 774BA10E881
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 08:53:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6DCA2CE23E3;
 Thu, 20 Jun 2024 08:53:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37F0CC2BD10;
 Thu, 20 Jun 2024 08:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718873599;
 bh=4Tjh4cIDE9G7bgN3b2WOM0BLmckXw842rKeQqklvMTU=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=McMVsr6V1Eu4YCbPUwFDm/V1QVEh7xbY7IxNfMSUY5HlrI8ak0ZnLAaPMHTU91tAS
 xf7NCrtj5+7M82hsz0QAzWnllBXUS/RT6iopd2joh3FIBfa7VcFiVAOOV2uorOU3/S
 GDpVhpJ2lnwYusS6W7sLhitD/7IdvjZvLMsSeAocQz52va3755vFGU/6YOH15r2Jsq
 xeYAcpt1s8RFqbWOSXgjI2aaU81PV3rYhugy1ELJ71WNNcLub7cIECW3Ek7QSYZPB4
 pqvx3/20hjd4OmuTNjuL3MV/jyPCC2j6fYyTMaJdb/4gUZWMz8W8luCJwSryW37HBA
 VebXpAdfrl5CA==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
In-Reply-To: <20240619153913.2804051-4-dave.stevenson@raspberrypi.com>
References: <20240619153913.2804051-1-dave.stevenson@raspberrypi.com>
 <20240619153913.2804051-4-dave.stevenson@raspberrypi.com>
Subject: Re: (subset) [PATCH v2 3/3] drm/vc4: vec: Add the margin
 properties to the connector
Message-Id: <171887359715.3857922.1001689886938951088.b4-ty@kernel.org>
Date: Thu, 20 Jun 2024 10:53:17 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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

On Wed, 19 Jun 2024 16:39:13 +0100, Dave Stevenson wrote:
> All the handling for the properties was present, but they
> were never attached to the connector to allow userspace
> to change them.
> 
> Add them to the connector.
> 
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime

