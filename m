Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FCE7F631B
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 16:37:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F9E810E09E;
	Thu, 23 Nov 2023 15:37:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03F7C10E09E
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 15:37:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2F64D62048;
 Thu, 23 Nov 2023 15:37:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6CD4C433C7;
 Thu, 23 Nov 2023 15:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700753841;
 bh=ZdbFZ4KQ/gf4hgFpP8k5jG7CXEuPsV2YJfYQ0vTmdN0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=a11qGamB38fsqxGOS7OuJ6lF776gt/BNyw5ful4ALHlC1dZQRGR9FBgmWDIwLJLxr
 JbrvzdNMzZ57L2cE5WFSPe2moFLUPodUhhKQw5knlJboJqEvbg9d6efy7vQK0Jap0A
 5gj6XNRBQvuoFMbn7YXuYcKiMA04ao9bLp3oHB1PHO8CauNDi3OHXQImFF/UraDy3s
 gDFBLR0J4LLvH1qPfIrMf1hyPXCa6OJc24dyCvWOLlBIvoP1aP+yrx7D3ZzYdQIErt
 yA0QONYPVSO1vLS1LgXd+PEN7uC8t8M0G4xJjhBMbUOlUrszdqqtoQzOCAFwzHneaV
 9fex0165dtM2Q==
From: Lee Jones <lee@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
In-Reply-To: <20231117120625.2398417-1-alexander.stein@ew.tq-group.com>
References: <20231117120625.2398417-1-alexander.stein@ew.tq-group.com>
Subject: Re: (subset) [PATCH v3 1/1] backlight: pwm_bl: Use dev_err_probe
Message-Id: <170075383967.1388394.6437408799524247071.b4-ty@kernel.org>
Date: Thu, 23 Nov 2023 15:37:19 +0000
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 17 Nov 2023 13:06:25 +0100, Alexander Stein wrote:
> Use dev_err_probe to simplify error paths. Also let dev_err_probe handle
> the -EPROBE_DEFER case and add an entry to
> /sys/kernel/debug/devices_deferred when deferred.
> 
> 

Applied, thanks!

[1/1] backlight: pwm_bl: Use dev_err_probe
      commit: 58793f263abc8e5233fabf7466219202db09d048

--
Lee Jones [李琼斯]

