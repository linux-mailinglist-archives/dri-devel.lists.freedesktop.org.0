Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CFB9590F6
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 01:16:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56185892C8;
	Tue, 20 Aug 2024 23:16:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NSQyLNjH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 431 seconds by postgrey-1.36 at gabe;
 Tue, 20 Aug 2024 23:16:39 UTC
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B09892C8
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 23:16:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A5B09A4046B;
 Tue, 20 Aug 2024 23:09:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62708C4AF09;
 Tue, 20 Aug 2024 23:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724195366;
 bh=Lbysj9KIY04ej/2hs+jHz/a8O+t1h3ua+LPYuOV2ITY=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=NSQyLNjH/SWpYV7mSIKlhENVXiYwzu4ehkaC87JRAScFbzqcuMo4PGMXf1B4lC4Ao
 cv0fE0Dp1z+t0WhDvqaojIBgeUiYqtEJOSSAhvv8RxzEHDiZEGrQ1fx8DWV+l3QOuU
 IRfESkzSfH5UJvgizll7XWU6m4hoNRihL9+oxgwsf0rfDfa9scqgzAxJg4Je76sCCa
 BfFq9Hao9XBHJ+f7zURXgXZjWJ3FqPfv7zZOJpnPvkxCRs3rM3/VQ6JIIrmZmIa6Xs
 Q9LdMwtiMLo8ofzHHnffkUXfcIShMdamFdSyY1db3NcyylFeg52xMJt4qcjKYZY1U4
 pWI8G5/PWHeXg==
Date: Wed, 21 Aug 2024 01:09:24 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
cc: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com, 
 deller@gmx.de, bonbons@linux-vserver.org, bentiss@kernel.org, 
 shc_work@mail.ru, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 shawnguo@kernel.org, festevam@gmail.com, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH 25/28] HID: picoLCD: Replace check_fb in favor of struct
 fb_info.lcd_dev
In-Reply-To: <20240820093452.68270-26-tzimmermann@suse.de>
Message-ID: <nycvar.YFH.7.76.2408210109090.12664@cbobk.fhfr.pm>
References: <20240820093452.68270-1-tzimmermann@suse.de>
 <20240820093452.68270-26-tzimmermann@suse.de>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Tue, 20 Aug 2024, Thomas Zimmermann wrote:

> Store the lcd device in struct fb_info.lcd_dev. The lcd subsystem can
> now detect the lcd's fbdev device from this field.
> 
> This makes the implementation of check_fb in picolcd_lcdops obsolete.
> Remove it.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Jiri Kosina <jkosina@suse.com>

-- 
Jiri Kosina
SUSE Labs

