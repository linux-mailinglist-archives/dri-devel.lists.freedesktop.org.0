Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EA6568661
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 13:07:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAAFB113AC1;
	Wed,  6 Jul 2022 11:07:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F266C113ABE;
 Wed,  6 Jul 2022 11:07:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 3C999CE0764;
 Wed,  6 Jul 2022 11:07:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E15CEC3411C;
 Wed,  6 Jul 2022 11:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657105670;
 bh=57+IIFMCOJgxTrNyjjSpEHzoTqQk48pg/9WlJ8B9Hss=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=HhF+epXMG8KWIa3I0W71AAmPpb0KmibjMO/OMAaGXzlffBzAFnnAjpekhOmxf5Nu2
 WSKxHfLYAMxz/Dzt9BUT275H+sh2p5/vyPz1pWAiJqYPdArVuOy+haglQDqT8VRjWG
 FKwwa6+MPhRV0zMen51CDA8IGis2lkZD48VVLe9ZxmK5TsTBCYiBI1Vrzr/QfsEc+4
 Rcqenq/nog1UndpF7kImKT/TlosE/t8REsz7M+VasqVmZ3iLsAzfIlb2Dmln9jz2Jg
 ELq63znCYbdNcgViyYWeu1Ve83+TCSfbae0WiP+ITl4xpYt15Dk/p5sXyPbQ2wBiAG
 WcF2doDIxhv2A==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Vijendar.Mukunda@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20220701114107.1105948-1-Vijendar.Mukunda@amd.com>
References: <20220701114107.1105948-1-Vijendar.Mukunda@amd.com>
Subject: Re: (subset) [PATCH V2 0/5] I2S driver changes for Jadeite platform
Message-Id: <165710566863.237380.14611432933578872657.b4-ty@kernel.org>
Date: Wed, 06 Jul 2022 12:07:48 +0100
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
Cc: Alexander.Deucher@amd.com, zhuning@everest-semi.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 1 Jul 2022 17:11:02 +0530, Vijendar Mukunda wrote:
> Jadeite(JD) platform is Stoney APU varaint which uses I2S MICSP
> instance and ES8336 Codec.
> This patch series creates I2S platform devices for JD platform,
> adds I2S MICSP instance support and Machine driver support
> 
> This patch set depends on:
>         --checkpatch warnings patch
> 	--https://patchwork.kernel.org/project/alsa-devel/patch/20220627125834.481731-1-Vijendar.Mukunda@amd.com/
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[3/5] ASoC: amd: add I2S MICSP instance support
      commit: 3eb8440d0d268437202ccbd28a3ca3212e02e57f
[4/5] ASoC: amd: add Machine driver for Jadeite platform
      commit: 02527c3f2300100a25524c8c020d98c7957e485e
[5/5] ASoC: amd: enable machine driver build for Jadeite platform
      commit: f94fa84058014f81ad526641f1b1f583ca2cf32f

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
