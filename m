Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E67A90C554
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 11:29:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7157810E5FD;
	Tue, 18 Jun 2024 09:29:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gjMkxWe4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A15F110E5FF
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 09:29:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CF782CE195B;
 Tue, 18 Jun 2024 09:29:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE05AC3277B;
 Tue, 18 Jun 2024 09:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718702978;
 bh=ZREG/HUpkUMVk1td6VgwnGnxsmci1Cf1u6Qk6QCivos=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=gjMkxWe4oPF+FKhtQJ3h8n58vaiHOyKmxqZTTGWuqq/s1aWUGU/Ym6JxQz75tuIWQ
 cshvqqzKSmRFv4dBPpZ4Ko3KbvYV8fj6WcImnO04iskqzc9IuAOgEGAgCl/ULvF6iE
 RYmXB5Pu9pYCJ68SIC52ZTkZyvJsjTiuW6V8yEUnXDRgAiWBwa6mS5FpVasr7Kzn5G
 /U7ns9kkQmxmS8OVVJxiMmtFSF4bOhRmiPJk8BmGSnVpfsyXJe77nm3Rt+UWKWk94u
 w1/iLXaFpShjoIj+QreOdcsi0Jj8ro7QIAzABm8c5DlRV5XpZYoC4AbeIeFfgwclQz
 sZ7CjQO/PV3EQ==
Message-ID: <419d290ebe132712ae7231cf2709137f@kernel.org>
Date: Tue, 18 Jun 2024 09:29:35 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dave Stevenson" <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 3/3] drm/vc4: vec: Add the margin properties to the
 connector
In-Reply-To: <20240216184857.245372-4-dave.stevenson@raspberrypi.com>
References: <20240216184857.245372-4-dave.stevenson@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
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

On Fri, 16 Feb 2024 18:48:57 +0000, Dave Stevenson wrote:
> All the handling for the properties was present, but they
> were never attached to the connector to allow userspace
> to change them.
> 
> Add them to the connector.
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
