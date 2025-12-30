Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1FBCE8F6F
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 09:03:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ACA410E854;
	Tue, 30 Dec 2025 08:03:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gUJx4hTS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D64110E851
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 08:03:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BE8F16000A;
 Tue, 30 Dec 2025 08:03:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AF5FC4CEFB;
 Tue, 30 Dec 2025 08:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767081802;
 bh=MnoVGy5Tz+lUwmL6CZGk3fOQGjOOkJNy2JVQWRXNHVw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gUJx4hTSWFRRsSlOL8Z7Vo8XO8XNCdeYUGXsGdHi+2wpydMT1xsFsGlvvep6ut5Ik
 4fMrYviaETqevMxQUspTBn73pM9HVnVw8u3I4D2y0AmVrW0xpIUwGbV6QLrOHoUGEQ
 o2xaey82bIk502tsW5kUeNsUv1nvjXjqvjkJlqgMhxYXAkekRKs17tiQh0M0pZMW0Y
 jacHW2mqCKjB75KCkrAaXTeQMj+rXm2vKezngJYM4NhbxPvFrniSEpupfcSuhrdR4+
 nvc2VeV9grZXUTmcI/u/7sXYIXXLkhdoGQdNxqvJgWelTMxzjy1+ly7S6alA+V1ZBJ
 GgIgORWttG/mA==
Date: Tue, 30 Dec 2025 09:03:17 +0100
From: Helge Deller <deller@kernel.org>
To: Chintan Patel <chintanlike@gmail.com>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 2/4] staging: fbtft: Make FB_DEVICE dependency optional
Message-ID: <aVOHRVoFvTKtwl_I@carbonx1>
References: <20251230052827.4676-1-chintanlike@gmail.com>
 <20251230052827.4676-3-chintanlike@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230052827.4676-3-chintanlike@gmail.com>
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

* Chintan Patel <chintanlike@gmail.com>:
> fbtft provides sysfs interfaces for debugging and gamma configuration,
> but these are not required for the core driver.
> 
> Drop the hard dependency on CONFIG_FB_DEVICE and make sysfs support
> optional by using dev_of_fbinfo() at runtime. When FB_DEVICE is disabled,
> sysfs operations are skipped while the code remains buildable and
> type-checked.
> 
> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Suggested-by: Helge Deller <deller@gmx.de>
> Signed-off-by: Chintan Patel <chintanlike@gmail.com>

Reviewed-by: Helge Deller <deller@gmx.de>

