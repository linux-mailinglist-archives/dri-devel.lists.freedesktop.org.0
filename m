Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C64AD3578
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 14:01:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD1A210E51C;
	Tue, 10 Jun 2025 12:01:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WP7OjwET";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D69D10E51C;
 Tue, 10 Jun 2025 12:01:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 81D275C53A2;
 Tue, 10 Jun 2025 11:59:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81C0DC4CEED;
 Tue, 10 Jun 2025 12:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749556883;
 bh=zOgJpXJoSz3JYOCCNzqPQiBvsa7ML7WTLCuwh4wNHxI=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=WP7OjwETqKJz+zVNJJ3SDYswyzvxTsrt0LVdCXdrElb63Kkxdo/JfdTR0rZ9TObNO
 PvDnXhean/D0x2Txp0CAD93FVsRFGuQwYSj1WTJ6yH09/3P+k0uziqS/rH9s2m+b1g
 neYzBaZhkfeAZX91vkthlYQ94bumBtQeqVqRmJeMgUq1PHHvADaPJsn0oC6CoS/dDx
 UF2yv9XqqKCdjTxZpwxXDtDbPFQt53PdOnCnOrd8mvw6YAkYGFBy49zHbwn0OihZ0u
 KbT1eK3oZ2E/eFYhwJLaOBrf/lgKLvOlJ2EWrfp5PdWLxN/qOrrajwM940O8S4QaqV
 ykE0aF7n0DxXw==
Message-ID: <695f242fcb44a4a64116e24667b2b718@kernel.org>
Date: Tue, 10 Jun 2025 12:01:21 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Subject: Re: [PATCH 2/4] drm/i915/panel: add panel register/unregister
In-Reply-To: <b737d4bc8b91df630cd4db4648f3a3571989cfd8.1749199013.git.jani.nikula@intel.com>
References: <b737d4bc8b91df630cd4db4648f3a3571989cfd8.1749199013.git.jani.nikula@intel.com>
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

On Fri, 6 Jun 2025 12:05:10 +0300, Jani Nikula wrote:
> Add panel register/unregister functions, and handle backlight
> register/unregister from there. This is in preparation for adding more
> panel specific register/unregister functionality.
> 
> Cc: Lee Shawn C <shawn.c.lee@intel.com>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
