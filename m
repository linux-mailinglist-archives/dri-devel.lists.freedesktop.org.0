Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C02AD3576
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 14:01:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F4F10E514;
	Tue, 10 Jun 2025 12:01:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="T93oAm5X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABD4D10E51C;
 Tue, 10 Jun 2025 12:01:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 062A761127;
 Tue, 10 Jun 2025 12:01:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E786C4CEED;
 Tue, 10 Jun 2025 12:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749556863;
 bh=hYLYj1PjMDMLf7k9NtmDZopw4OPTvlCnJFgSTWNC8vI=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=T93oAm5XFcKYT1E/oV/Tz2n+NFeTBoGAK1hXke+h2VUSDs9KfEMPnC+uITS44hWXK
 rVaSaSBgs13DS9Wz99QENvu4ajFNfbN1QuVmrWqakWQTmDMLZCyWUaHvEzizT3Lg1r
 AYsg/AAM4xMtM+AyeDYVYdMY2s6SAAPwjuPdHdZZb2ghuVv0OuNWCs6BCIdeSeDsDI
 ZP2b8QIxyqHuS4iYtmAL1XbdfDymR3zt4uANNzXTYTHeHYgGbmQonI4heUEOMhyzcm
 jaVNiwkAkOHEt9Exlj/kwhoFxtQ31hX0LbXJBAYO3HGEF+JM4EfjCr1TMfxwzkwrHT
 +05wgcN6XtPsQ==
Message-ID: <d6b65b2a8b807ac5c0ce3294733631eb@kernel.org>
Date: Tue, 10 Jun 2025 12:01:00 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Subject: Re: [PATCH 1/4] drm/panel: use fwnode based lookups for panel
 followers
In-Reply-To: <1ed7cfca02f8cf14347dadfe027197dc15791383.1749199013.git.jani.nikula@intel.com>
References: <1ed7cfca02f8cf14347dadfe027197dc15791383.1749199013.git.jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, simon1.yang@intel.com, "Doug
 Anderson" <dianders@chromium.org>,
 "Heikki Krogerus" <heikki.krogerus@linux.intel.com>, "Jessica
 Zhang" <jessica.zhang@oss.qualcomm.com>, "Lee Shawn C" <shawn.c.lee@intel.com>,
 "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Wysocki Rafael J" <rafael.j.wysocki@intel.com>
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

On Fri, 6 Jun 2025 12:05:09 +0300, Jani Nikula wrote:
> Use firmware node based lookups for panel followers, to make the code
> independent of OF and device tree, and make it work also for ACPI with
> an appropriate _DSD.
> 
> ASL example:
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
