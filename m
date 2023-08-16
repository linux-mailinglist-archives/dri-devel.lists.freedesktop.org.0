Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFC777DBC6
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 10:10:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FA2210E150;
	Wed, 16 Aug 2023 08:10:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D39610E292
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 08:10:29 +0000 (UTC)
Date: Wed, 16 Aug 2023 08:10:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1692173427; x=1692432627;
 bh=DYIzz/ErtRC5bqephndJgT6xvwQ4M38Mdtu+V8XH/9M=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=iaErdAFSLNHU/PGq2qy+83M0xvrntQdn5tiAcG0i0wafy/avVCuzyIy7ZbFLiOv2W
 W0pIG4kzvuHDK8y7sIfjUapF8vhygnjHBKaBB4zdtzTy4FzSccJ4h/8juXfvTBzqyP
 RVpQhqGV3OxNsLkTGdiY5O6IEiuPKRNWVfOy9LySsnxGf+h+1wyFdlVIySRz4DZjmS
 D+OMmpwLCFhtSMYjNeBVTa3kKjyZTTTDxqRZv53MrldT7OK5WyLVOheGHuONw6R/Gd
 RWTSShDwehfAkZURKdKoHgCtCGsiKzWPTX2W4hfjzHuAqU2oMAygayDVZLMLATO81T
 hlRLkvH4n+qBA==
To: Erik Kurzinger <ekurzinger@nvidia.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/syncobj: fix DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE
Message-ID: <nt9XCjBOR9jJaV3ISbEdAhT0uMqJu-DEWfOr3M8wW-5hjVsgyuXxqpxOI3SLm7HO1KaYoqVj1lv1uR4n4rsIKnE7Momt08TC3nYfrzGRp8E=@emersion.fr>
In-Reply-To: <h5javWWoWX16S8nN5VOasUwJQahAJ3WU5LTMAHtPrCvigqObIpip3t__AvBAanLMVeAo578jHTZUHrj3HPyG8EvP9xi21w_07jDyZmeEYCM=@emersion.fr>
References: <7121004b-65b5-691e-c73f-67bebacd6074@nvidia.com>
 <h5javWWoWX16S8nN5VOasUwJQahAJ3WU5LTMAHtPrCvigqObIpip3t__AvBAanLMVeAo578jHTZUHrj3HPyG8EvP9xi21w_07jDyZmeEYCM=@emersion.fr>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: faith@gfxstrand.net, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Maybe a Fixes tag can be added, so that this propagates into the stable
trees?

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#usin=
g-reported-by-tested-by-reviewed-by-suggested-by-and-fixes
