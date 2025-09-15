Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B64B57F0E
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 16:33:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C2D110E4CD;
	Mon, 15 Sep 2025 14:33:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Nkg0+dU5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43ABD10E4CD
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 14:33:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D257643EE2;
 Mon, 15 Sep 2025 14:33:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D9DFC4CEF1;
 Mon, 15 Sep 2025 14:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757946811;
 bh=XnxETN3pQB03+YuQRoYCXb3VddRPV+i6oTI+z8dKemA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Nkg0+dU5gBuQ3T4IqcH/TC8AknBhqV89aiPa2hjrC1DpRLGKSiypWZp9Bimdt8ZOX
 E2hGQz5D1qQxg/sj5fpu/cT7OJ6oYvSt/JyOViArNc64ez3sb5cspyztEmuDHuFAQL
 k7qMJEUXCydEHOlCFd33W1Me+hy4gSdGzJU9mW4yzOrTrIFEdVKCQ84hpN2dBpETQR
 Ihh8OB/QV0j3p944u0dKTpUiFz+WpeHtVTd4EyzZYBKPAgqbEBZnaixRitLJnhc5aZ
 7L8HSjmzIDdOKjkxmn4CO12B1iXhvkLa/5M0mWVigJgCmnIBpCDFTPohuFvS9OONHu
 mWuVvDuq6GbEQ==
Date: Mon, 15 Sep 2025 15:33:27 +0100
From: Daniel Thompson <danielt@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] video: backlight: lp855x_bl: set correct eprom
 start for LP8556
Message-ID: <aMgjt1g9C782ELBQ@aspen.lan>
References: <20250909074304.92135-1-clamor95@gmail.com>
 <20250909074304.92135-2-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909074304.92135-2-clamor95@gmail.com>
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

On Tue, Sep 09, 2025 at 10:43:04AM +0300, Svyatoslav Ryhel wrote:
> According to LP8556 datasheet eprom region starts at 0x98 so adjust value
> in the driver accordingly.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.
