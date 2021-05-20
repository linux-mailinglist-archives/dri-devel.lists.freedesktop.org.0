Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5912138B8C2
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 23:08:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35E806E448;
	Thu, 20 May 2021 21:08:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 124EC6F553;
 Thu, 20 May 2021 21:08:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C2AA61355;
 Thu, 20 May 2021 21:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621544891;
 bh=H7ZfwO4IfCnbHEF5X3ES+OwNO0JxFidxqAcRhoy1y0g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BS8tgm9J3xS84whoeVUVHmDfLRUr3aQbOeKkn61j+zmipQT4Dlnz1/HEQgM7ecKCl
 Dx9ISoib4CQHC6g93UWb35Vc6AgPFLm7niEtaHh0H+fUVO2ZQegy03C/aDjhRMESFf
 on4QiOtFZIInKMTBZ6OVRScg1ISP9YSetKNuSy4hP5t6dlTcNEDNA8xVSH5g8lla/G
 pCYLrUP6wqBaQ/8qynGBEYvVOLTlHqhrr/Cv0FwA8jE2Ri3zEE/ibubqmRbLI6Y5WT
 W2oxdv8KCZnye0fmzXT3hlh52ukjyOEQispEDKLz33LFAZL84BzU2WyAvaEuxUE3IC
 3DJRHMbiitgcg==
From: Mark Brown <broonie@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 David Airlie <airlied@linux.ie>
Subject: Re: (subset) [PATCH 1/3] gpu: drm: replace occurrences of invalid
 character
Date: Thu, 20 May 2021 22:08:00 +0100
Message-Id: <162154480154.5312.6523511718252427852.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <e606930c73029f16673849c57acac061dd923866.1621412009.git.mchehab+huawei@kernel.org>
References: <e606930c73029f16673849c57acac061dd923866.1621412009.git.mchehab+huawei@kernel.org>
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
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Mark Brown <broonie@kernel.org>,
 amd-gfx@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 intel-gfx@lists.freedesktop.org, Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 19 May 2021 10:15:35 +0200, Mauro Carvalho Chehab wrote:
> There are some places at drm that ended receiving a
> REPLACEMENT CHARACTER U+fffd ('�'), probably because of
> some bad charset conversion.
> 
> Fix them by using what it seems	to be the proper
> character.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[2/3] spi: fix some invalid char occurrences
      commit: 6328caf043208556e782a53a284c9acfcf6be3b0

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
