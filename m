Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD7284DE64
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 11:35:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D34310E0FC;
	Thu,  8 Feb 2024 10:35:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GKfJoNlh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F7EC10E0FC
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 10:35:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C975861BBD;
 Thu,  8 Feb 2024 10:35:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 677AAC433F1;
 Thu,  8 Feb 2024 10:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707388512;
 bh=0/YRNuXxZuldgKvPMxkRGmiUNw3aBOqxeqR1S9uQF6c=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=GKfJoNlhG3qi82SM3lHOL568A/rTjCfDxuu50jgDXdzpa7fiqU9TxMpmWkSYg0gzb
 SuK5lDR0uBnkmhHkW4++pICqKFBVSsLD/k9MHhKtSNtSHmqjeYcGd1QuyzIXsCaC4k
 GZ89XWlVft+XhdQhYRevc6iiYd5teL6dkgt6yTIkdlf8VIh7yamwP4iin2EoZdsqNI
 n80wFKOrgdor2Gz8QHuvXr5ma2Fis5MEIoqS59VQ/cNCILvaITalu2UA3HpnLEN6+x
 In5sjmWLYr/se5q8eFMalz9eJ5dBtcYBiknyZqt+1R4wTunFz3aSzqs0FLpU29Q6nF
 fBniF7l+3lm4w==
From: Lee Jones <lee@kernel.org>
To: Flavio Suligoi <f.suligoi@asem.it>, Lee Jones <lee@kernel.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Sean Young <sean@mess.org>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
In-Reply-To: <20240128154905.407302-1-sean@mess.org>
References: <20240128154905.407302-1-sean@mess.org>
Subject: Re: (subset) [PATCH] backlight: mp3309c: Use pwm_apply_might_sleep()
Message-Id: <170738851016.914450.4228723185612575654.b4-ty@kernel.org>
Date: Thu, 08 Feb 2024 10:35:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 28 Jan 2024 15:49:04 +0000, Sean Young wrote:
> pwm_apply_state() is deprecated since commit c748a6d77c06a ("pwm: Rename
> pwm_apply_state() to pwm_apply_might_sleep()"). This is the final user
> in the tree.
> 
> 

Applied, thanks!

[1/1] backlight: mp3309c: Use pwm_apply_might_sleep()
      commit: 7feb4ec8ec900daf29602bcdf7c04178c63205ac

--
Lee Jones [李琼斯]

