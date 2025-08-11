Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE37B20FDA
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 17:34:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E5A810E2A4;
	Mon, 11 Aug 2025 15:34:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Yi92qlt3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FC9610E2A4
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 15:34:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 70576A56D7E;
 Mon, 11 Aug 2025 15:34:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 313C0C4CEED;
 Mon, 11 Aug 2025 15:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754926480;
 bh=b+CtGPWnyV0+pPc9/6HHuFwoMZ+ZtvyIYiKK+XG6h5k=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=Yi92qlt3N9HhwGd59rlbZ+nzPmM6J2yGsbYmW79ZlhOb3kRIuWBuD2fyEQ685iodf
 zOgIEVdl93AD/ekJhNpRgXtrP4SISzJjSeL2LxYAANOtamqqvaKN9d4QIdeBIeECU9
 dbNAyUBlPl1ai6UQM1lXnC0O5iyACMdLIm4vH9gOkBUyNGfZUWhyrVjQAR1wj+IcLg
 c0l7JnAMtOyO3oj5cFiSyRrzsiaHodHtyn+NA62eD/E6m40X/OCkHjUwbu3x51yFNj
 c0lA4zIKpKKCVvAiRgYToNh5sPIv844UCmQfN7P/Gx1b+ifdqIu9mrY/Ipo6OqPF3+
 M5etnV6svCzTQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 11 Aug 2025 17:34:36 +0200
Message-Id: <DBZPILHT9NCS.BKD2RJX01TK6@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: entry for DRM GPUVM
Cc: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>
To: <boris.brezillon@collabora.com>, <matthew.brost@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250808092432.461250-1-dakr@kernel.org>
In-Reply-To: <20250808092432.461250-1-dakr@kernel.org>
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

On Fri Aug 8, 2025 at 11:20 AM CEST, Danilo Krummrich wrote:
> GPUVM deserves a bit more coordination, also given the upcoming Rust
> work for GPUVM, hence add a dedicated maintainers entry for DRM GPUVM.
>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Applied to drm-misc-fixes, thanks!
