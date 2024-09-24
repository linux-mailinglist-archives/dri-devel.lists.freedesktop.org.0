Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 704B7984763
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 16:13:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE35B10E6F8;
	Tue, 24 Sep 2024 14:13:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="f1cCaQfz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05D0810E6F6
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 14:13:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8C2F35C5C84;
 Tue, 24 Sep 2024 14:13:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEF6AC4CECD;
 Tue, 24 Sep 2024 14:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727187191;
 bh=Ove6qA9Uz/Pwc/8UDs6UkdWbzk3LrAkv03HZ9MpURmg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=f1cCaQfzj9yf9Jls9lys+/W835C5/lgW/6mB3B8XUeucAH1QG1QnwuJXqdDXOQAt2
 X01T00TkkFpL6HWFwgCCpx9tc0pHMOFMbNGuLm2EJAF73sord2VNArloQ+VexeGxtQ
 bjNRuNv/F7YR8O4AlyZ6zb+I+GZsYEYbekDBqyRyvzvdpgS+j2iWxZzh/HD/48fWCI
 pNzOAIrknk6a9yh6oudEvRkur8PakTWwMO1Vo2f9iED/mzGPaRUBAhnt5tNk4UTIvW
 REOxQXeyu+91/qUCfzlh0HMlWFeRwvFIbh9sNWv3U/m4Id97AprvZgXIxdtb/Z8dis
 9O2ep7fy6KLeg==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org, 
 Derek Foreman <derek.foreman@collabora.com>
Cc: kernel@collabora.com, Jani Nikula <jani.nikula@linux.intel.com>, 
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org
In-Reply-To: <20240827163918.48160-1-derek.foreman@collabora.com>
References: <20240827163918.48160-1-derek.foreman@collabora.com>
Subject: Re: [PATCH v4] drm/connector: hdmi: Fix writing Dynamic Range
 Mastering infoframes
Message-Id: <172718718877.90582.18381097503447839347.b4-ty@kernel.org>
Date: Tue, 24 Sep 2024 16:13:08 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1
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

On Tue, 27 Aug 2024 11:39:04 -0500, Derek Foreman wrote:
> The largest infoframe we create is the DRM (Dynamic Range Mastering)
> infoframe which is 26 bytes + a 4 byte header, for a total of 30
> bytes.
> 
> With HDMI_MAX_INFOFRAME_SIZE set to 29 bytes, as it is now, we
> allocate too little space to pack a DRM infoframe in
> write_device_infoframe(), leading to an ENOSPC return from
> hdmi_infoframe_pack(), and never calling the connector's
> write_infoframe() vfunc.
> 
> [...]

Applied to misc/kernel.git (drm-misc-fixes).

Thanks!
Maxime

