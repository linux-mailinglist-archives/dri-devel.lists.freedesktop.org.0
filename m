Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4504CAAFA
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 18:01:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC2C410ED4A;
	Wed,  2 Mar 2022 17:00:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B08C810ED4A
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 17:00:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 30FEFB820F9;
 Wed,  2 Mar 2022 17:00:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C66DC340ED;
 Wed,  2 Mar 2022 17:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646240451;
 bh=/gWvP2vsXd8rkLtqrnHFSfxrMj9k6L9zIS6GLOLcGZg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ihaxAi5YdgX++mOBAWXxCQiSAgVpJ1bm319KXG1/l9w5dIEJ8a49WBAF0bnnhJHwe
 OFWyNQYEzX7m15f5Ps7Lg/sz5VKQzjHbIajYbHKu4sArBHTdEioYzPR4rteswDlU0x
 xwY5zGHUzdv07pXhhBNzZvhl1HN69wbhWvKYN1Sa3Kg7hfzcZAoMXh1U2YdQ1TLco5
 qLIVTWM44ydf7rF4+SSZWTXfkDZ45GSyhidRet+RmpxNsjwaCgqBCrpLe9RrxuIvQr
 YmMfZwPbRoY1FMx7syHCdW6/V+IGZgcJ8QfCtpAtc2D/FtrhuaXq8vOuB91hG71BY/
 /lvtCeFIJ5BvA==
From: Mark Brown <broonie@kernel.org>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220301081104.GB17375@kili>
References: <20220301081104.GB17375@kili>
Subject: Re: [PATCH] ASoC: qcom: Fix error code in lpass_platform_copy()
Message-Id: <164624044896.1145067.17126236966898923867.b4-ty@kernel.org>
Date: Wed, 02 Mar 2022 17:00:48 +0000
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
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, dri-devel@lists.freedesktop.org, Christian König <christian.koenig@amd.com>, linaro-mm-sig@lists.linaro.org, Jaroslav Kysela <perex@perex.cz>, Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 1 Mar 2022 11:11:04 +0300, Dan Carpenter wrote:
> The copy_to/from_user() functions return the number of bytes remaining
> to be copied.  This function needs to return negative error codes
> because snd_soc_pcm_component_copy_user() treats positive returns as
> success in soc_component_ret().
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: Fix error code in lpass_platform_copy()
      commit: d5dd781bcc81aa31b62310927f25cfa2574450f1

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
