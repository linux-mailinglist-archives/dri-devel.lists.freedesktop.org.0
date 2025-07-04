Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B87AF96DD
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 17:35:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A283010E2A0;
	Fri,  4 Jul 2025 15:35:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="emz5PoLd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2877010E2A0
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 15:35:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2974460054;
 Fri,  4 Jul 2025 15:35:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13615C4CEE3;
 Fri,  4 Jul 2025 15:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751643300;
 bh=i/PYE1o9TcIAThmf/v3ptk0oOIanNyX13IGbjmgvdRQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=emz5PoLdLLOlj8sPuzgfrMguPZhZCzWKWcT9Ul5U7DV2ZmxpOxcfSp7vBxTNfwlx8
 1OCnVwKk05GC8PfLKB+tVOOwfKrWOLRipr1DRE1iCWDlu68SCpGdzRy8ZAAJ1vnaXi
 PbNlLEePQ9DFS9Ski9YHp9dug2Ln3Z5PPsNwZvRc617lEIARVEdNglbCcjAjCMbYBI
 mcsiTOTNSN/GqrA/oyEA8beunkOHPH0Q9G7VAFKTymjPfKai0F/Vrx/Cev5KbqM5l9
 tWiv21oGvrDBPSJD2dvHmqA6TeN+BPPoXPlHuDdxDANWV5Qrs/fPvKGL88fkDbG1JK
 /pcWWyxUtDHjw==
From: Mark Brown <broonie@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20250702211408.GA3406663@ZenIV>
References: <20250702211408.GA3406663@ZenIV>
Subject: Re: (subset) [PATCH 01/11] zynqmp: don't bother with
 debugfs_file_{get,put}() in proxied fops
Message-Id: <175164329981.97594.15505661775329412408.b4-ty@kernel.org>
Date: Fri, 04 Jul 2025 16:34:59 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91
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

On Wed, 02 Jul 2025 22:14:08 +0100, Al Viro wrote:
> When debugfs file has been created by debugfs_create_file_unsafe(),
> we do need the file_operations methods to use debugfs_file_{get,put}()
> to prevent concurrent removal; for files created by debugfs_create_file()
> that is done in the wrappers that call underlying methods, so there's
> no point whatsoever duplicating that in the underlying methods themselves.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-next

Thanks!

[03/11] regmap: get rid of redundant debugfs_file_{get,put}()
        commit: 9f711c9321cffe3e03709176873c277fa911c366

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

