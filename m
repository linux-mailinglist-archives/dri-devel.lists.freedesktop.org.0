Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 144028617E1
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 17:28:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5192610EC5C;
	Fri, 23 Feb 2024 16:28:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SkYRUySC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A70A10EC5D
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 16:28:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B0C2963574;
 Fri, 23 Feb 2024 16:28:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 203AAC43390;
 Fri, 23 Feb 2024 16:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708705729;
 bh=wEGHK2WBxOjfXbevpTQb3aIk60mWJqBlr3ZiHUy36VM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=SkYRUySC7rIkFog+P2vIgPZHmirWaNLzsVE0UJf5iJ3cwiTt8uvDiENx72N+umzwI
 7+LpOSjln0PwmN+WL+WJsNu9O54/1X+4a2Efdt6pwBgSdyEzVf4Z2MhV+yypmC3SFx
 pFGEi1SyLtad8/y+2LEQ+PWe+aC2rJHYaYWN4nxvOv0Yc95mbWb/VfZhCH4WR3yLHO
 gUiKSg78OTlnbEr8Lg15KyOEyAmA5unW7M0YUxmCU24Or7ZsU7kbVW4GBRc5fvNNA2
 MigHG6/ia+IBaOYVyqirFWnnIzM9ERex4xaaVYv2Xa1jEmH/NKIjeKcCdd5mV52iv7
 MbHyGG4dbBDsg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
 Daniel Thompson <daniel.thompson@linaro.org>
Cc: Luca Weiss <luca@z3ntu.xyz>, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240220153532.76613-5-daniel.thompson@linaro.org>
References: <20240220153532.76613-1-daniel.thompson@linaro.org>
 <20240220153532.76613-5-daniel.thompson@linaro.org>
Subject: Re: (subset) [PATCH RESEND 4/4] backlight: mp3309c: Fully
 initialize backlight_properties during probe
Message-Id: <170870572786.1740438.15453067020985270956.b4-ty@kernel.org>
Date: Fri, 23 Feb 2024 16:28:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4
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

On Tue, 20 Feb 2024 15:35:27 +0000, Daniel Thompson wrote:
> props is stack allocated and, although this driver initializes all the
> fields that are not "owned" by the framework, we'd still like to ensure
> it is zeroed to avoid problems from this driver if the fields change.
> 
> 

Applied, thanks!

[4/4] backlight: mp3309c: Fully initialize backlight_properties during probe
      commit: 50a2c0aee92699ed47076636b652f9d27a20fbef

--
Lee Jones [李琼斯]

