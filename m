Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E80AD357C
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 14:01:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C60C910E522;
	Tue, 10 Jun 2025 12:01:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Z9tRgoD8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C5B910E537;
 Tue, 10 Jun 2025 12:01:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A4FAD61165;
 Tue, 10 Jun 2025 12:01:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 089D4C4CEF1;
 Tue, 10 Jun 2025 12:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749556915;
 bh=pk09LYYEdlrVo6kK789C/3YxPuKVk8SxG0KSg2d683I=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=Z9tRgoD8CgBTzhPEuD/PBagcEJj8Hu1uaKHYImsC+bfZpqvj6FNTqwKXFR9tlEZIW
 VZPAqcCpZeCgjUkI6jovapJd73o0QmeCA5H/iQwCda8/PlDlHeGFnmNfk4u8fsMlzB
 F+Obvwivsy6qChHp/UmN3w0Vg/g3ZLaasPEW02/9j2o7dUdrY/AMM46j7LV42sQQno
 v0Rr8dEN+LC6hHRc/oxqZoPKDUyzJpzAYci/ZJlGy7UTXZCTVA4Qfuq61c+NrpsVLq
 lpwbxGVyOa8g8ISEMJLzTUrFGaVutFo3CFHrRQq4LZp7ms5xDjfqmedXaMExPp3ug7
 IxJry+2nMO+8g==
Message-ID: <a6ed0ba580854864e7281dda38489ced@kernel.org>
Date: Tue, 10 Jun 2025 12:01:52 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Subject: Re: [PATCH 3/4] drm/i915/panel: register drm_panel and call
 prepare/unprepare for ICL+ DSI
In-Reply-To: <13d15c1414e65ffb21944d66e2820befdab54e98.1749199013.git.jani.nikula@intel.com>
References: <13d15c1414e65ffb21944d66e2820befdab54e98.1749199013.git.jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, simon1.yang@intel.com, "Doug
 Anderson" <dianders@chromium.org>,
 "Heikki Krogerus" <heikki.krogerus@linux.intel.com>, "Lee
 Shawn C" <shawn.c.lee@intel.com>, "Maxime Ripard" <mripard@kernel.org>,
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

On Fri, 6 Jun 2025 12:05:11 +0300, Jani Nikula wrote:
> Allocate and register a drm_panel so that drm_panel_followers can find
> the panel. Pass the drm_connector::kdev device to drm_panel allocation
> for matching. That's only available after drm_sysfs_connector_add(), so
> we need to postpone the drm_panel allocation until .late_register()
> hook.
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
