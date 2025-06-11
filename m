Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB9AAD5599
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 14:32:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3477410E656;
	Wed, 11 Jun 2025 12:32:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="u0d/gfxY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36FA610E658
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 12:32:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4E2F261F1D;
 Wed, 11 Jun 2025 12:32:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3EBAC4CEEE;
 Wed, 11 Jun 2025 12:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749645172;
 bh=xXbDETXV9P2TQ8Hk+RzVJWyGilwzx00rjuV1wn6moq8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=u0d/gfxYNjYe31j14wN9yQ1ULGLtkhrWESjrT5n1XQceSpyDXxps0B85mo90Z05uR
 fKxwO37ChBB5CSk7kB14TgjEiePw49jCLtLjw6Wucp1SQ96xVyOIS89j7neIs2f3Pv
 IGG9dIaDSa1nz8PLJ3zFOJGhjiO6kjqsBXqZ+ULTCNEWZvAMhLriTVVgDjHezjoOpr
 zAxgjx+tZ5Tfqa7RYg59IeUbKu0RLO0jG8vABN2QGBp/uouZwcC1JrLGg2/XGSlVpL
 z4+QF9KJetR7gmBTLnI/69uElmFuwAkUfWp8S+PMIGP9oOfd0x7+axAVKR4ic+QGXh
 aWXO8AH2aeACg==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 patches@lists.linux.dev
Subject: Re: [PATCH drm-misc-fixes] drm/sitronix: st7571-i2c: Select
 VIDEOMODE_HELPERS
Date: Wed, 11 Jun 2025 14:32:47 +0200
Message-ID: <174964516465.47655.6350077670059712740.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610-drm-st7571-i2c-select-videomode-helpers-v1-1-d30b50ff6e64@kernel.org>
References: <20250610-drm-st7571-i2c-select-videomode-helpers-v1-1-d30b50ff6e64@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Tue, 10 Jun 2025 12:40:38 -0700, Nathan Chancellor wrote:
> This driver requires of_get_display_timing() from
> CONFIG_VIDEOMODE_HELPERS but does not select it. If no other driver
> selects it, there will be a failure from the linker if the driver is
> built in or modpost if it is a module.
> 
>   ERROR: modpost: "of_get_display_timing" [drivers/gpu/drm/sitronix/st7571-i2c.ko] undefined!
> 
> [...]

Applied to misc/kernel.git (drm-misc-fixes).

Thanks!
Maxime
