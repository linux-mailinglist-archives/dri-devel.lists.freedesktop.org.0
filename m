Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7D5B32556
	for <lists+dri-devel@lfdr.de>; Sat, 23 Aug 2025 01:14:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D245410E002;
	Fri, 22 Aug 2025 23:14:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="u29cAhBs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F055910E002;
 Fri, 22 Aug 2025 23:14:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 47D28A58BBD;
 Fri, 22 Aug 2025 23:14:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55D75C4CEED;
 Fri, 22 Aug 2025 23:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755904446;
 bh=FW2UlUHWBGIjYX/nRcZEwXb3PwT/VeIoEnBl3k5Bj5I=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=u29cAhBs+icIFmHq/CrbnR4BFguZMLeFfdShAziZuWk40Jw4Ijn2FcdgD3HgfknUV
 qaidWALIH5FlovLlKxft/O2Q1j/DG6G64PXYjjcQ0DOljfYPbMeF8vGCBeqKvJDjpR
 IIvl/rABJs0ZAgZBSuCd9Mo9yP+kaL0k9lpmN/2neiaSLY/XvMqFREs7KZWoALup5H
 w+P08YwTK9id1mBZyuB/jr/mJcs859WR8IMO+uFdGDPflgmZJbt/hLG4iG+cUPE8YK
 kFgi6QCGrIxAogGtw7fgnj9r6rc2zq1D3JSsPyd/gyxXLj0PuULVYT1Hd0PFYiLq2t
 jEkTroc8UNXfg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 23 Aug 2025 01:14:03 +0200
Message-Id: <DC9C6DFLG1PE.1AWR6TCF6800W@kernel.org>
Subject: Re: [PATCH 2/3] drm/nouveau/disp: Always accept linear modifier
Cc: "Lyude Paul" <lyude@redhat.com>, "Faith Ekstrand"
 <faith.ekstrand@collabora.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Joel
 Fernandes" <joelagnelf@nvidia.com>
To: "James Jones" <jajones@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250811220017.1337-1-jajones@nvidia.com>
 <20250811220017.1337-3-jajones@nvidia.com>
In-Reply-To: <20250811220017.1337-3-jajones@nvidia.com>
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

On Tue Aug 12, 2025 at 12:00 AM CEST, James Jones wrote:
> On some chipsets, which block-linear modifiers are
> supported is format-specific. However, linear
> modifiers are always be supported. The prior
> modifier filtering logic was not accounting for
> the linear case.
>
> Fixes: c586f30bf74c ("drm/nouveau/kms: Add format mod prop to base/ovly/n=
vdisp")
> Signed-off-by: James Jones <jajones@nvidia.com>

Applied to drm-misc-fixes, thanks!
