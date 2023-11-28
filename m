Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 139B97FBAB3
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 14:01:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E40810E513;
	Tue, 28 Nov 2023 13:01:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C58F10E50A
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 13:00:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BBA7561726;
 Tue, 28 Nov 2023 13:00:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD0C4C433BB;
 Tue, 28 Nov 2023 13:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701176458;
 bh=j0jjiheRS7DE4WAr5PkTVziGAOVyNRK3hhCMBZKajFQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=KsA17b8aS4/+1pg5VQU/LfyGUw3AvwNKG2YGY4FjRvPseS/hqw1bnYZU+S3kj21jL
 VySGwwKL6qviId39WIIoFtnasevNjDMyjFFnumG/E1dzgju+Uc1m15mD7cG8xi2r1B
 1Yc/5Nenp57PXCqWwQcdex3JCbq2wSws+W1SgEFZU/qi4+3d0hTRnGPvQHGTAdnm0L
 U9opjRtLPpGXu/B/SN/7LBdjUyF625+fCgrziXkAWeqy4Gln3+GEqQaiymJAafcEtu
 cucA/iulmA/oCQ1ONv7w6nO/mrkA/VpRFWgt9iwU7Xw5Jy+ywFx8wyfUC+pFlHNrnE
 fLDYYzvvHbw3w==
From: Maxime Ripard <mripard@kernel.org>
To: airlied@gmail.com, daniel@ffwll.ch, frank.binns@imgtec.com, 
 donald.robson@imgtec.com, matt.coster@imgtec.com, sarah.walker@imgtec.com, 
 Danilo Krummrich <dakr@redhat.com>
In-Reply-To: <20231124233650.152653-2-dakr@redhat.com>
References: <20231124233650.152653-1-dakr@redhat.com>
 <20231124233650.152653-2-dakr@redhat.com>
Subject: Re: (subset) [PATCH drm-misc-next 1/5] drm/imagination: vm:
 prevent duplicate drm_gpuvm_bo instances
Message-Id: <170117645564.2825698.1827367300735783510.b4-ty@kernel.org>
Date: Tue, 28 Nov 2023 14:00:55 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 25 Nov 2023 00:36:36 +0100, Danilo Krummrich wrote:
> Use drm_gpuvm_bo_obtain() instead of drm_gpuvm_bo_create(). The latter
> should only be used in conjunction with drm_gpuvm_bo_obtain_prealloc().
> 
> drm_gpuvm_bo_obtain() re-uses existing instances of a given VM and BO
> combination, whereas drm_gpuvm_bo_create() would always create a new
> instance of struct drm_gpuvm_bo and hence leave us with duplicates.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

