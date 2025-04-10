Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4F7A83F08
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 11:39:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 536AF10E87D;
	Thu, 10 Apr 2025 09:39:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EH8b5En1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D4D10E87D
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 09:39:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AE29B43AEC;
 Thu, 10 Apr 2025 09:39:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85CBAC4CEDD;
 Thu, 10 Apr 2025 09:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744277964;
 bh=IwjPHhP/v/Jh7FzxSq7DMwKlrjAl3R/TQrIMGZnxKNE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=EH8b5En1kyjDWn8NgXjDu6eTxUd9P/QBMW+jxyNC/om4BSu2L8jGYoirF/s5GH4sD
 2PR7jgV7ikZTXTgNTYqS3njpSQP70ZC6IV2VH/5tks7tPOWvH7PjW19ctCCbmVDjjs
 FNrwlFCrEOLCjEol+K62Q2tkEEtrES2X8hHYSSKu4CRAFt+KWCUuLWQ5CwFavgNdZ8
 KC9h3K6gp0io88x8K87+Sq7+a2blQ0L8g7ioddYv4crYvfzrhIskVAi0essLsjrCXZ
 FRV+LMthJea08d9U/72y5Cki/PzArtIM2wUDcVX0gyAg9QV8e9ssWbID2gIt4QBuzm
 n+vp+Mk3vjuNA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, pavel@ucw.cz, danielt@kernel.org, jingoohan1@gmail.com, 
 deller@gmx.de, simona@ffwll.ch, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-leds@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org
In-Reply-To: <20250321095517.313713-1-tzimmermann@suse.de>
References: <20250321095517.313713-1-tzimmermann@suse.de>
Subject: Re: [PATCH v4 00/11] backlight, lcd, led: Remove fbdev
 dependencies
Message-Id: <174427796227.1683312.16355490136227829122.b4-ty@kernel.org>
Date: Thu, 10 Apr 2025 10:39:22 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-510f9
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

On Fri, 21 Mar 2025 10:53:53 +0100, Thomas Zimmermann wrote:
> This series removes the remaining dependencies on fbdev from the
> backlight, lcd and led subsystems. Each depends on fbdev events to
> track display state. Make fbdev inform each subsystem via a dedicated
> interface instead.
> 
> Patches 1 to 3 make fbdev track blank state for each display, so that
> backlight code doesn't have to.
> 
> [...]

Applied, thanks!

[01/11] fbdev: Rework fb_blank()
        commit: 93e41f968d7c6ea1cedc6b365917cbb787ef08f6
[02/11] fbdev: Track display blanking state
        commit: 7e3711eb87c584ed224a7ad7000eba36e6fa3a51
[03/11] fbdev: Send old blank state in FB_EVENT_BLANK
        commit: dfb4bf1ac40162ff5ea3715a10f6af2dcf3030c5
[04/11] backlight: Implement fbdev tracking with blank state from event
        commit: 726491f2038ec71122d45700f3abf36fdb277aaa
[05/11] backlight: Move blank-state handling into helper
        commit: 4bfb77f3381627640e97e0e423c93a2ea93e7de7
[06/11] backlight: Replace fb events with a dedicated function call
        commit: b01beb2f1f6bcda17634a5b529865ffc5a9b795f
[07/11] backlight: lcd: Move event handling into helpers
        commit: e98696cea7e289447a5d2328546b947629301616
[08/11] backlight: lcd: Replace fb events with a dedicated function call
        commit: bc70cc84f5a2ebfd7e7112e9b8837e0c7954fc65
[09/11] leds: backlight trigger: Move blank-state handling into helper
        commit: 28f8bab711c0984005a6dd4cc980b4ba8409b817
[10/11] leds: backlight trigger: Replace fb events with a dedicated function call
        commit: dc2139c0aa3283e5749109641af1878ed7bf7371
[11/11] fbdev: Remove constants of unused events
        commit: d32a0b567a8a8b6e677d35c4f8eb8bd32b7029a0

--
Lee Jones [李琼斯]

