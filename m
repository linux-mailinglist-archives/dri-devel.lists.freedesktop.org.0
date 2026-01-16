Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8FFD2F86D
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 11:26:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E61E110E853;
	Fri, 16 Jan 2026 10:26:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UsZann3g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E3410E853
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 10:26:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2612C60160;
 Fri, 16 Jan 2026 10:26:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A962C116C6;
 Fri, 16 Jan 2026 10:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768559203;
 bh=qfp7Ur/bnxqvF2Err/rpfkSDRZZPSrFRxIl4oN/ARLQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UsZann3gs/kmfe3qQdwd9i1Q0SKXmANTerW5t2HK8QgbLHMONDuVHT0n5Bnxzst/3
 sFUYmPyelHkhcYWBIq8wtcJshSiyx6NOO+Hd7rsDfqUc3c8x1LzG3wndp+NLgBA3w8
 aBn/UOT5Mjn7SsplN6lFBk/tphQkML8m3xTF7TZS8+AZo5OtqySHQnYJ6neOS7yBz9
 85kny/g6/3Fgts3IUQtFAwQ7tui4RfaGFLBHiJRUvQpZl/5POFgt5rDCgrcAdOX6zt
 o/tWXXcJyyIDleBGPjBdd96g0WFkTCIC9cWGgxxL70OnsrE7DpsuvetqJuZYfNPx6i
 5u1V0MtytQ3iQ==
From: Maxime Ripard <mripard@kernel.org>
To: maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Xiao Kan <814091656@qq.com>
Cc: Maxime Ripard <mripard@kernel.org>, w@1wt.eu, security@kernel.org,
 kanxiao666@gmail.com, xiao.kan@samsung.com
Subject: Re: [PATCH v3] drm: Account property blob allocations to memcg
Date: Fri, 16 Jan 2026 11:26:34 +0100
Message-ID: <176855919221.1290479.4679401019876597826.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <tencent_D12AA2DEDE6F359E1AF59405242FB7A5FD05@qq.com>
References: <20260113-kickass-sensible-basilisk-66d487@houat>
 <tencent_D12AA2DEDE6F359E1AF59405242FB7A5FD05@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Wed, 14 Jan 2026 08:22:26 -0500, Xiao Kan wrote:
> DRM_IOCTL_MODE_CREATEPROPBLOB allows userspace to allocate arbitrary-sized
> property blobs backed by kernel memory.
> 
> Currently, the blob data allocation is not accounted to the allocating
> process's memory cgroup, allowing unprivileged users to trigger unbounded
> kernel memory consumption and potentially cause system-wide OOM.
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime
