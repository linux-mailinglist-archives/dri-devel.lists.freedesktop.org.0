Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B84DF808CC0
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 16:55:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFA0010E8E8;
	Thu,  7 Dec 2023 15:55:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DA9510E8E8
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 15:55:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 952C7B81C1D;
 Thu,  7 Dec 2023 15:55:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F340C433C9;
 Thu,  7 Dec 2023 15:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701964516;
 bh=RezsXkf9hYQwmGQ/9NyUkwIQPcZ/vB0PRe+slSqTby4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=vRi9EvAlGAkipSYeoJsU8Z/HTcr3SWZbzoCW2YHmBs9c6i82Et+jQg3jJ7HEa7rZd
 3tUa4qNIA6WR6oTRQR83NCkAGmDYb5cvCnVi4U/XqqyS5KDw0bBhhIUKm4ZAEfReEQ
 SQiCJI0SpC2drPTxJidCnLw1IySGBbE+y+c40QD18M4QPxxFJgrFtcDYKqM6aq/XTb
 mkE6u7PCueBgjuHjaV7BpE81tkSWaIhKnyvXTHgKE0x5+bRZqXjxXP6fjSJG6QZMLv
 muNX5tFwYmlDM1Y8NNhpMHJQpSn1/2pPozfGi8/ENmnVqZ5QP2KCFfHk8RUGwFbrhW
 EoXngyQktORNQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com, 
 deller@gmx.de, nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com, 
 Su Hui <suhui@nfschina.com>
In-Reply-To: <20231130051155.1235972-1-suhui@nfschina.com>
References: <20231130051155.1235972-1-suhui@nfschina.com>
Subject: Re: (subset) [PATCH] backlight: ili922x: add an error code check
 in ili922x_write
Message-Id: <170196451303.113624.6951927696205742670.b4-ty@kernel.org>
Date: Thu, 07 Dec 2023 15:55:13 +0000
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
Cc: linux-fbdev@vger.kernel.org, llvm@lists.linux.dev,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 30 Nov 2023 13:11:56 +0800, Su Hui wrote:
> Clang static analyzer complains that value stored to 'ret' is never read.
> Return the error code when spi_sync() failed.
> 
> 

Applied, thanks!

[1/1] backlight: ili922x: add an error code check in ili922x_write
      commit: 769ff5283f0d7edc819743f183d51af077411107

--
Lee Jones [李琼斯]

