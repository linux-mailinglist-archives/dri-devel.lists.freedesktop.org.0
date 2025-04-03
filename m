Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F14A7A782
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 18:05:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57E7010E23D;
	Thu,  3 Apr 2025 16:05:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="skrtmWUi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2839D10E23D;
 Thu,  3 Apr 2025 16:05:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4ABA85C6B09;
 Thu,  3 Apr 2025 16:03:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D61BC4CEE3;
 Thu,  3 Apr 2025 16:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743696326;
 bh=5oFcHW6fLd29eIcRqoPsjzMZUmyrM09yRwvZ8iioyDM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=skrtmWUihNf/PqlZuGanZNZp+U/xAbelfEDrx5yFHpDigUt/ASIliJMxTyfbzOlNb
 d6Hu2wGkLaRsNdJKSDYsbB9GECdTqPnwdWExUIez2hGEc85NpgCRmPUhzDqsUWR3Q3
 BciXmPjcBh1rZKm/FZSBPnRTiU/+MdKIfOfq+HWO/cXTqt/bvLJ44zLVrIs8uwdzjh
 mJzR8o+joVhWP7tm8dAfmN1yjIr5elAsFle7KT0xu17MDl6i/us3yHqy+haRgIefym
 BDK735N9AvySC7wI8Yn1sRmqeUDUm9XfUmVfeAYlaw0ZQHjPtekaXTv5Qc+/ccraq0
 kQ8pyER1N87hA==
Date: Thu, 3 Apr 2025 18:05:21 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2][next] drm/nouveau: disp: Avoid
 -Wflex-array-member-not-at-end warning
Message-ID: <Z-6xwS3qXIyxE05G@pollux>
References: <Z-2zI55Qf88jTfNK@kspp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-2zI55Qf88jTfNK@kspp>
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

On Wed, Apr 02, 2025 at 03:58:59PM -0600, Gustavo A. R. Silva wrote:
> -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
> getting ready to enable it, globally.
> 
> Use the `DEFINE_RAW_FLEX()` helper for an on-stack definition of
> a flexible structure where the size of the flexible-array member
> is known at compile-time, and refactor the rest of the code,
> accordingly.
> 
> So, with these changes, fix the following warning:
> 
> drivers/gpu/drm/nouveau/dispnv50/disp.c:779:47: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Applied this one (as well as the svm and fence one) to drm-misc-next, thanks!
