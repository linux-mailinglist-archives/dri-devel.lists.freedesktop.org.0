Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A04C23DB9
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 09:41:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C0D810EAC1;
	Fri, 31 Oct 2025 08:41:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AhcosB6C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A936F10EAC1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 08:41:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 25D1E4067C;
 Fri, 31 Oct 2025 08:41:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECEE5C4CEF1;
 Fri, 31 Oct 2025 08:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761900064;
 bh=F3j39oJbXU3umTSW8/NwYKbpJJNxA+bQF8oyIAUEz/s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AhcosB6COhNN71rH1zooDoygyNOurkc49J6U77+07gpGpjrrBErHTw+iNba8ywD8n
 P3mu8WVGRCqmzKJz5EUgXgBABMlHgdpNtE2OjFz7XQpmLi+/dDAZbrKyYvyXUSbktg
 xxkYABNhsJ+t4fpabd2N6XB1wAQmpDnxEZwd3MaBUaDpO+f3Pv06FDhVoKZd3Q9a3a
 VgFouAPQSiUEKOS85otyAEKgzHlg/piLMAb5C4zcfKyyA5l8MBHsJxr/g5mZaexgp4
 56+I50xYBtWbXjOfFtlt2aoGHcXjPKxAD7lHE3ZnmCTjN6OJ3sDxhkVRl/MDA1gx3r
 xUZYg6zVvMNWw==
Received: from johan by xi.lan with local (Exim 4.98.2)
 (envelope-from <johan@kernel.org>) id 1vEkh6-00000000330-2YFH;
 Fri, 31 Oct 2025 09:41:12 +0100
Date: Fri, 31 Oct 2025 09:41:12 +0100
From: Johan Hovold <johan@kernel.org>
To: David Airlie <airlied@linux.ie>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: Re: [GIT PULL] mediatek drm fixes - 20251028
Message-ID: <aQR2KOvMxghFgQXl@hovoldconsulting.com>
References: <20251028151548.3944-1-chunkuang.hu@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028151548.3944-1-chunkuang.hu@kernel.org>
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

On Tue, Oct 28, 2025 at 03:15:48PM +0000, Chun-Kuang Hu wrote:

> ----------------------------------------------------------------
> Mediatek DRM Fixes - 20251028
> 
> 1. Fix device use-after-free on unbind
> 
> ----------------------------------------------------------------
> Johan Hovold (1):
>       drm/mediatek: Fix device use-after-free on unbind

Note that this fixes a regression in 6.17-rc4 which have since been
reported to cause boot failures. The offending commit has also been
backported to the stable trees so it would be good to get this one into
6.18-rc4.

Johan
