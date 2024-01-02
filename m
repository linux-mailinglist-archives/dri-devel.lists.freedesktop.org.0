Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6704D821B4D
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jan 2024 13:02:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DF7E10E18C;
	Tue,  2 Jan 2024 12:02:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 707E810E18D
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jan 2024 12:02:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 079A0CE0E1A;
 Tue,  2 Jan 2024 12:01:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A42DC433CB;
 Tue,  2 Jan 2024 12:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704196917;
 bh=QjQEzQkw6LmcRSDsk3eROUbpKXPD+NGppOQzbGKzZyI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=iRdzGVbKXGnSaZ4M4GsVeOpooIk5rbgI3Njsa9WKDa0BypIyoJw/mlLnKaDuQMqtt
 90eF8YJH9/k7zEOghnbwB8FVkRSVCrxSB1+NedGPKQ3TD3GM0W/1gKgNYxhLM0HF5L
 TsDUOF+5zDnS04Ly8TsTYfp440cHQDGAbAYdkpDHhJcrolFVVWD9l/1JQg4nQKnsOu
 wX2VYz03JBhjM22uW53zw4XFFkwQzr5L09kPM5Qq566daUUyxnl5wnPl3WUXq+bioB
 6VC+q5KCdvXdP7f7Wn3axPnImJE+7GkAkM3jPxnHtQj0CsEp9XzBDGrni+CociTuBP
 qrnrnxOpq6kRw==
From: Maxime Ripard <mripard@kernel.org>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20231231054910.31805-1-rdunlap@infradead.org>
References: <20231231054910.31805-1-rdunlap@infradead.org>
Subject: Re: (subset) [PATCH] drm/imagination: pvr_device.h: fix all
 kernel-doc warnings
Message-Id: <170419691484.40444.13264823314981119386.b4-ty@kernel.org>
Date: Tue, 02 Jan 2024 13:01:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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
Cc: Vegard Nossum <vegard.nossum@oracle.com>, Jonathan Corbet <corbet@lwn.net>,
 dri-devel@lists.freedesktop.org, Matt Coster <matt.coster@imgtec.com>,
 Donald Robson <donald.robson@imgtec.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 30 Dec 2023 21:49:10 -0800, Randy Dunlap wrote:
> Correct all kernel-doc notation on pvr_device.h so that there are no
> kernel-doc warnings remaining.
> 
> pvr_device.h:292: warning: Excess struct member 'active' description in 'pvr_device'
> pvr_device.h:292: warning: Excess struct member 'idle' description in 'pvr_device'
> pvr_device.h:292: warning: Excess struct member 'lock' description in 'pvr_device'
> pvr_device.h:292: warning: Excess struct member 'work' description in 'pvr_device'
> pvr_device.h:292: warning: Excess struct member 'old_kccb_cmds_executed' description in 'pvr_device'
> pvr_device.h:292: warning: Excess struct member 'kccb_stall_count' description in 'pvr_device'
> pvr_device.h:292: warning: Excess struct member 'ccb' description in 'pvr_device'
> pvr_device.h:292: warning: Excess struct member 'rtn_q' description in 'pvr_device'
> pvr_device.h:292: warning: Excess struct member 'rtn_obj' description in 'pvr_device'
> pvr_device.h:292: warning: Excess struct member 'rtn' description in 'pvr_device'
> pvr_device.h:292: warning: Excess struct member 'slot_count' description in 'pvr_device'
> pvr_device.h:292: warning: Excess struct member 'reserved_count' description in 'pvr_device'
> pvr_device.h:292: warning: Excess struct member 'waiters' description in 'pvr_device'
> pvr_device.h:292: warning: Excess struct member 'fence_ctx' description in 'pvr_device'
> pvr_device.h:292: warning: Excess struct member 'id' description in 'pvr_device'
> pvr_device.h:292: warning: Excess struct member 'seqno' description in 'pvr_device'
> pvr_device.h:292: warning: Excess struct member 'lock' description in 'pvr_device'
> pvr_device.h:292: warning: Excess struct member 'active' description in 'pvr_device'
> pvr_device.h:292: warning: Excess struct member 'idle' description in 'pvr_device'
> pvr_device.h:292: warning: Excess struct member 'lock' description in 'pvr_device'
> pvr_device.h:292: warning: Excess struct member 'work' description in 'pvr_device'
> pvr_device.h:292: warning: Excess struct member 'old_kccb_cmds_executed' description in 'pvr_device'
> pvr_device.h:292: warning: Excess struct member 'kccb_stall_count' description in 'pvr_device'
> pvr_device.h:292: warning: Excess struct member 'ccb' description in 'pvr_device'
> pvr_device.h:292: warning: Excess struct member 'rtn_q' description in 'pvr_device'
> pvr_device.h:292: warning: Excess struct member 'rtn_obj' description in 'pvr_device'
> pvr_device.h:292: warning: Excess struct member 'rtn' description in 'pvr_device'
> pvr_device.h:292: warning: Excess struct member 'slot_count' description in 'pvr_device'
> pvr_device.h:292: warning: Excess struct member 'reserved_count' description in 'pvr_device'
> pvr_device.h:292: warning: Excess struct member 'waiters' description in 'pvr_device'
> pvr_device.h:292: warning: Excess struct member 'fence_ctx' description in 'pvr_device'
> pvr_device.h:292: warning: Excess struct member 'id' description in 'pvr_device'
> pvr_device.h:292: warning: Excess struct member 'seqno' description in 'pvr_device'
> pvr_device.h:292: warning: Excess struct member 'lock' description in 'pvr_device'
> 
> [...]

Applied to drm/drm-misc (drm-misc-next-fixes).

Thanks!
Maxime

