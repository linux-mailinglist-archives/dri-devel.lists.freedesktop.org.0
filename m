Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE604C69735
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 13:44:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 019B210E497;
	Tue, 18 Nov 2025 12:44:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sPxbOZ0A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7B8D10E497
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 12:44:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 38661601AA;
 Tue, 18 Nov 2025 12:44:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 224E1C2BCB0;
 Tue, 18 Nov 2025 12:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763469855;
 bh=JFel7QS65CRKVdPsbNXeIPVP9Db8TOMlcmWxvKKzGCI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sPxbOZ0AcpPN4mKTHM8Tn9IO9o6eCr/e64ot3nnQ2tk2qITPpga6oUDFR0dkk9hit
 aP8xfhHyYKOgpGyWopMM3vnjsofPImmVCpmrK6KGu+bNNX/ZfsEYSsKdv5touwDbKO
 i9NrbIvuvWl2CYa4PtWtuFL6TeOOBg5wlp2mG3i7imsXJSuFD3tIKkbx+3jnghZDO+
 DN9FnPCCjVXzB0JtTF7YkD2kY0csMp2kBcQLyw5gFT4cFQGZsYHSOBOeaV/ie8tBDx
 0Qpw3S24onIEvEm+rnEjUOz2/jpXE3wAVWFS5nio7NzdNdHKwMDb5wRKAxk2/CIVlA
 J1dMkHGwYyXRQ==
Date: Tue, 18 Nov 2025 12:47:15 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] backlight: lp855x: fix lp855x.h kernel-doc warnings
Message-ID: <aRxq00MuwVw_pfbW@aspen.lan>
References: <20251111060916.1995920-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111060916.1995920-1-rdunlap@infradead.org>
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

On Mon, Nov 10, 2025 at 10:09:16PM -0800, Randy Dunlap wrote:
> Add a missing struct short description and a missing leading " *" to
> lp855x.h to avoid kernel-doc warnings:
>
> Warning: include/linux/platform_data/lp855x.h:126 missing initial short
>  description on line:
>  * struct lp855x_platform_data
> Warning: include/linux/platform_data/lp855x.h:131 bad line:
>    Only valid when mode is PWM_BASED.
>
> Fixes: 7be865ab8634 ("backlight: new backlight driver for LP855x devices")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.
