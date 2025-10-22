Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5414EBF9A59
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 03:51:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FFE610E682;
	Wed, 22 Oct 2025 01:51:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YUChTIFK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC7AD10E0C4;
 Wed, 22 Oct 2025 01:51:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 318B3627C4;
 Wed, 22 Oct 2025 01:51:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4EC1C4CEF1;
 Wed, 22 Oct 2025 01:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761097869;
 bh=M6c8HbksTy9YaQrooyjRe4bq+q1w4ySMC3x/H0yPBFQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YUChTIFK+sL3dyNfeemA8WRYJ74gjM8V4MWxPhiGYGZPxYH9PSu8WebtjCC6Hp8Us
 XNRqEM474sk5siDtcmM3tidhfix3D/2vovlZ8wnFekJt+FZMnvVa/k9zeTspxuFlgA
 7tIZnL0WGPktlhF94bGJxHyR0UOY0TQWIE5PXmv2e0i+oe8+1zu3vcB8DHfGpTw/WZ
 HGwhurx6ht5ZlqSxudLqL0zIiJT3REm3DwWE+kHffFf+S9Hje6DXnTpdnsrc/CJRQ8
 PJnNx9LoCb9sSlae60SFwyOlGZtVW6WDbgOOsSNXzfW5hZg+6lBCxmirVcGG4d9t9p
 SL0MnpWNH/gAQ==
Date: Tue, 21 Oct 2025 15:51:08 -1000
From: Tejun Heo <tj@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jiangshanlai@gmail.com,
 simona.vetter@ffwll.ch, christian.koenig@amd.com,
 pstanner@redhat.com, dakr@kernel.org
Subject: Re: [RFC PATCH 1/3] workqueue: Add an interface to taint workqueue
 lockdep with reclaim
Message-ID: <aPg4jKrlYajO7jd_@slm.duckdns.org>
References: <20251021213952.746900-1-matthew.brost@intel.com>
 <20251021213952.746900-2-matthew.brost@intel.com>
 <aPgBjmIm6n9H-R_u@slm.duckdns.org>
 <aPgDXsQY5qAfU0Tv@lstrano-desk.jf.intel.com>
 <aPgXH_JjkmKO5_a_@slm.duckdns.org>
 <aPgxy3lIqW1rUGsx@lstrano-desk.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aPgxy3lIqW1rUGsx@lstrano-desk.jf.intel.com>
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

On Tue, Oct 21, 2025 at 06:22:19PM -0700, Matthew Brost wrote:
> > please update the patch so that WQ_MEM_RECLAIM implicitly enables the
> > checking?
> 
> Sure, but a bunch of things immediately break—including a convoluted
> case in my driver. I can fix the kernel to the extent that my CI catches
> issues, and fix any obvious cases through manual inspection. However,
> I suspect that if we merge this, we'll be dealing with fallout
> throughout a kernel RC cycle.

Sure, we're still early in this cycle and can try to resolve as much as
possible and if there's just too much, we can make it optional and so on.

Thanks.

-- 
tejun
