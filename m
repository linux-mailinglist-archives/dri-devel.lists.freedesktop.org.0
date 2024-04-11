Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1D68A1238
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 12:52:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E3C310EFFC;
	Thu, 11 Apr 2024 10:52:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qixGdOXI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BD4F10EFFC
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 10:51:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 87561CE282B;
 Thu, 11 Apr 2024 10:51:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 202F5C433F1;
 Thu, 11 Apr 2024 10:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712832714;
 bh=D6JMxryqqfDxqjFdDz0KsohI3fQ2DDEdBVnKin6QWQc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=qixGdOXI0gJNkpiYUoUXv3CP0K3DF+6hg/K07WmVGHFC9ZsXILb3cL8+bG4GAEIcs
 6PZ3xzj2YJuGKxlDVr5moi5gyqbLDJhyL3V4hRx9xzX7DvhYmARbYKE83RxKpaf53i
 rSUWduG3Pd0usx4EySllM2tARdS//1pq60QjEbcrrETRiZnN0m2shAbip2m6P4Phvk
 Q2EhcQ1eRYPiHiesoBe9ig57hWTlyg7OjsFRTUQX9471yUtOsyHXwhyLHED+I5zCw7
 d+Pht1PXHWHM6qjpSLkaIeqXHLPBT2t68d631E8LdeCzfK6Uhq0m4f+5AvkXNs08x5
 bqu7kfLaG58OQ==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org, 
 kernel@pengutronix.de, dri-devel@lists.freedesktop.org
In-Reply-To: <20240329133839.550065-2-u.kleine-koenig@pengutronix.de>
References: <20240329133839.550065-2-u.kleine-koenig@pengutronix.de>
Subject: Re: (subset) [PATCH v3] backlight: lp8788: Drop support for
 platform data
Message-Id: <171283271286.2290145.16947522198877039372.b4-ty@kernel.org>
Date: Thu, 11 Apr 2024 11:51:52 +0100
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

On Fri, 29 Mar 2024 14:38:39 +0100, Uwe Kleine-König wrote:
> The backlight driver supports getting passed platform data. However this
> isn't used. This allows to remove quite some dead code from the driver
> because bl->pdata is always NULL, and so bl->mode is always
> LP8788_BL_REGISTER_ONLY.
> 
> 

Applied, thanks!

[1/1] backlight: lp8788: Drop support for platform data
      commit: 150476e60a80ebb93d49aae7b636934eb04b83d2

--
Lee Jones [李琼斯]

