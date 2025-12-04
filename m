Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08276CA4819
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 17:31:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76DBF10E107;
	Thu,  4 Dec 2025 16:31:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="vJr2oJHf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6378C10E107
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 16:31:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 15E45601FD;
 Thu,  4 Dec 2025 16:31:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22421C4CEFB;
 Thu,  4 Dec 2025 16:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764865911;
 bh=7xyZc9+BmbOgEn7wwK+/kd3lA1bF7ElNnkCDaoIwq2E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vJr2oJHfoMpmnVlSPDNGZndUE9v7sXIPEMDSXYxLNqVakYY38u5jij3hZ2LZzz2Ya
 OeemcpMAH1myIthILN5vTemU8Knf8x9kB0wZF+abeOI+vLSjUplh11/NdwWaD3MoDU
 FoZan6cHgJXzf18PH8pDSvJ6cyLiDdhIaM7Tf1nFN28RyqsLGx5jG9O5hyxvdckKi5
 5RkAXPrOuseQr8MCSCBQbOkXf0NGRe7lUbIy1fctKsBcnSgW377w2VXHHmKVZsC5mh
 kSR643CFCy/6/ttRpq/2Ue33qJToQLgCcAa+vV2cLkwzYsZkEQRmlx2ECXUr45+Qq2
 1A5sz3Haxc7/w==
Date: Thu, 4 Dec 2025 16:31:47 +0000
From: Daniel Thompson <danielt@kernel.org>
To: petri.karhula@novatron.fi
Cc: Thomas Richard <thomas.richard@bootlin.com>, Lee Jones <lee@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v5 1/2] backlight: Add Congatec Board Controller (CGBC)
 backlight support
Message-ID: <aTG3c0Ey2DWwa-T1@aspen.lan>
References: <20251204-cgbc-backlight-v5-0-26f1be6a69c3@novatron.fi>
 <20251204-cgbc-backlight-v5-1-26f1be6a69c3@novatron.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204-cgbc-backlight-v5-1-26f1be6a69c3@novatron.fi>
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

On Thu, Dec 04, 2025 at 02:35:26PM +0000, Petri Karhula via B4 Relay wrote:
> From: Petri Karhula <petri.karhula@novatron.fi>
>
> This driver provides backlight brightness control through the Linux
> backlight subsystem. It communicates with the board controller to
> adjust LCD backlight using PWM signals. Communication is done
> through Congatec Board Controller core driver.
>
> Signed-off-by: Petri Karhula <petri.karhula@novatron.fi>

Didn't I already share a Reviewed-by: for this?

Unless you have made changes big enough to invalidate the review then
you should collect tags offered on previous versions (if you do ever
disregard a tag there should be a note about why). For details see:
https://docs.kernel.org/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes

Please don't forget to collect the tags if there is a v6 but, for now:
Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.
