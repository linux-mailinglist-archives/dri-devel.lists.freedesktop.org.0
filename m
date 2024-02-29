Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD7386D0EB
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 18:40:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BBBA10E0EA;
	Thu, 29 Feb 2024 17:40:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WKgMBtqc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DEFF10E0EA
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 17:39:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 07274612ED;
 Thu, 29 Feb 2024 17:39:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78901C43390;
 Thu, 29 Feb 2024 17:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709228397;
 bh=1eHwbuoPQO9yJnCSyweWe53B9YJjQl9irdUPC/l7SEo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=WKgMBtqcUPkaIb2OH/ilf1KR4j+f4mL3dHcazLA+ZhsHWgMoaHR4ysqcPDviQUO+Z
 0msTTA1gn7qFMUxeeiI5HVXuyS6MB2WJ+Yb5sO3LIt2wM8hDydHKbZE0kAjz8RHyp9
 hAfaAW1J+ylL9L/8CEGCbcsY4TGLKLJ0UI0qk8ONFghK/p2KkAvOgXDiUcQyZMF1i/
 5dxr6oKrWtkoMHDZneD/HvFLuvj1C+L3WFzPKgSLmZmEwWMzF/D70bgpBfav1lEhua
 c/6tN0CtwXlCy8aw1Mg6FpQC/6DgXNlcKbzhNGzsbxk7agvA7+1sU1Dqmld0CewfkF
 wzW4c4EGdpa9g==
From: Lee Jones <lee@kernel.org>
To: Jingoo Han <jingoohan1@gmail.com>, 
 Daniel Thompson <daniel.thompson@linaro.org>
Cc: Luca Weiss <luca@z3ntu.xyz>, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240220153532.76613-1-daniel.thompson@linaro.org>
References: <20240220153532.76613-1-daniel.thompson@linaro.org>
Subject: Re: (subset) [PATCH RESEND 0/4] Ensure all backlight drivers zero
 the properties structure
Message-Id: <170922839621.1624816.9819285232571855357.b4-ty@kernel.org>
Date: Thu, 29 Feb 2024 17:39:56 +0000
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

On Tue, 20 Feb 2024 15:35:23 +0000, Daniel Thompson wrote:
> [Sorry for the RESEND so soon... embarrassingly I got Lee's e-mail
> address wrong the first time!]
> 
> Luca Weiss recently shared a patch to zero the properties structure for
> lm3630a... and shortly afterwards I realized I should probably scan for
> a similar class of errors in other drivers.
> 
> [...]

Applied, thanks!

[1/4] backlight: da9052: Fully initialize backlight_properties during probe
      commit: fc159b40e7980e7f78dbaa72dcc4e8f523dbfd92
[2/4] backlight: lm3639: Fully initialize backlight_properties during probe
      commit: aeb7ab878e90041776eae839faa117570dbcce93
[3/4] backlight: lp8788: Fully initialize backlight_properties during probe
      commit: cd1995b6ac7384149ad755b74e3c3eb25195ab81

--
Lee Jones [李琼斯]

