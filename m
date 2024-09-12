Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FCF9762C5
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 09:34:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C186B10E1D2;
	Thu, 12 Sep 2024 07:34:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="FuHs4p1t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B0710E1D2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 07:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1726126446;
 bh=g6vFtMxsNNnJMTyegb+rGIyJVH+sur23XlK8Y7iVnjA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FuHs4p1tShXVR8OphkC6Q1wLPIc3N1QUXvrU39llu9WG7SbofuSYOHUhNCXKihfFP
 cAJahuzrGsn45St8WQwTR42xjGCcH8ECNVbChBLAmDceFEqvAJTRh2/9vLjOVGNUJS
 F+R1u7RrjobaL4k73jG7z+b+voyC5QzQ3QcMkcatS2jP7b0G0jPRKWTcPTDphBh3oi
 XNFHnQ34NG6jTTEOmdh68vZp6JGsskUi0PMMpk+58Ig0l+F4MJ/s0deHYENv5DyLrC
 1bZs0e/yLAOQ5uN1s/rIxX1hoXNwxceeQYNu706z7Ja7JoCF7SoVBPctSxSvnKRx2t
 zt8F3i7Lh8pZw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3F25717E0FC4;
 Thu, 12 Sep 2024 09:34:06 +0200 (CEST)
Date: Thu, 12 Sep 2024 09:34:01 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Christopher Healy <healych@amazon.com>
Subject: Re: [PATCH v2] drm/panthor: Display FW version information
Message-ID: <20240912093401.348229bf@collabora.com>
In-Reply-To: <20240906094025.638173-1-steven.price@arm.com>
References: <20240906094025.638173-1-steven.price@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri,  6 Sep 2024 10:40:25 +0100
Steven Price <steven.price@arm.com> wrote:

> The version number output when loading the firmware is actually the
> interface version not the version of the firmware itself. Update the
> message to make this clearer.
> 
> However, the firmware binary has a git SHA embedded into it which can be
> used to identify which firmware binary is being loaded. So output this
> as a drm_info() so that it's obvious from a dmesg log which firmware
> binary is being used.
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>

Queued to drm-misc-next.

Thanks!

Boris
