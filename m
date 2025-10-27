Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C234C119D0
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 23:06:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C99610E1AD;
	Mon, 27 Oct 2025 22:06:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dfTJ+Z7I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3235310E1AD
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 22:06:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CD91848742;
 Mon, 27 Oct 2025 22:05:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CCCAC4CEF1;
 Mon, 27 Oct 2025 22:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761602759;
 bh=NWOobQrN/SWWEQbE94p5Q3NBEbr+1fRps0CEyyIa9NQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dfTJ+Z7IrEERjK25NOFLlX+5bmFNEVpgyk/Y1ELBp2lVjckr4WtHD43rFkM29Druj
 LszesxKwjXaqjJiC0b3JRlwDM3VpMd7rUMUCn4cHhX9TLGkMGyJCt84+upytUP4Zfi
 q8gUAX4p7uXZz6AvZQyiR+xd2kPt7evbSM8xBdJhGKajU0w01BMpHPH440ZK7M3gPu
 zAQC31bcU5373YhXF7M9gBRK0t0mPnvGW202nra8mht0ymFLMGvWQ6eCP33vtj5C4N
 sZLCqkoYswiul3mHNkd8P8E8WtTpawI4QUq59lyN6JY1I2e0l0+OGeVD/ZPa2rKLZm
 0cjxqcJ/QzW3A==
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Arnd Bergmann <arnd@arndb.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] kbuild: Rename Makefile.extrawarn to Makefile.warn
Date: Mon, 27 Oct 2025 22:59:28 +0100
Message-ID: <176160225481.2834943.9284627955715309233.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251023-rename-scripts-makefile-extrawarn-v1-1-8f7531542169@kernel.org>
References: <20251023-rename-scripts-makefile-extrawarn-v1-1-8f7531542169@kernel.org>
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

On Thu, 23 Oct 2025 22:01:36 +0200, Nathan Chancellor wrote:
> Since commit e88ca24319e4 ("kbuild: consolidate warning flags in
> scripts/Makefile.extrawarn"), scripts/Makefile.extrawarn contains all
> warnings for the main kernel build, not just warnings enabled by the
> values for W=. Rename it to scripts/Makefile.warn to make it clearer
> that this Makefile is where all Kbuild warning handling should exist.
> 
> 
> [...]

Applied to kbuild-next, thanks!

[1/1] kbuild: Rename Makefile.extrawarn to Makefile.warn
      https://git.kernel.org/kbuild/c/24722b62

Please note that commit hashes might change in case of issues with
kbuild-next.

Best regards,
-- 
Nicolas

