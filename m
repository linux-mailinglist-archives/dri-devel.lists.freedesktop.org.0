Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 293AFB21797
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 23:41:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08DDC10E556;
	Mon, 11 Aug 2025 21:41:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="d08hTycy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC5FE10E556
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 21:41:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E278141A3A;
 Mon, 11 Aug 2025 21:41:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D36F8C4CEED;
 Mon, 11 Aug 2025 21:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754948493;
 bh=Ungo+NnRAZf/EAq354p5AhwXeye7iWIYrrlXQ1vPjzU=;
 h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
 b=d08hTycypJL97e8NpVGgXTMvNC3VrkLHgeoS+9KIC2ZhALavryKMN0jTshf8Sa3s1
 OAI3QtX/wjPypytDut/oM7kQ93/AzsVbYIy4RvcFb/D9OR5S4Y+V3ciRWy9SxfI6rt
 lD9ortz8nXXzz5z7gL4J2G2j7f5svAIjfXl5jA6iu2RW+88MzL1PzAvtqtab21NMYC
 cL8P5nXYenvIPFiN7/idmJz6uyuak3jTljddr1XjpvouzKwIEbbZUyFwaAp1644taT
 xSeerAcW3yzcXeJPeKQU65DdTf/dU0sv/4UTjzxjavdTp0VWabh4UzzL3UuhQB1/4P
 e/L1KD0HLZEjg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 11 Aug 2025 23:41:27 +0200
Message-Id: <DBZXBHHHV0LO.3DDZ48G45ZWET@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 0/4] Alloc and drm::Device fixes
Cc: <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
To: <lorenzo.stoakes@oracle.com>, <vbabka@suse.cz>,
 <Liam.Howlett@oracle.com>, <urezki@gmail.com>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>
References: <20250731154919.4132-1-dakr@kernel.org>
In-Reply-To: <20250731154919.4132-1-dakr@kernel.org>
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

On Thu Jul 31, 2025 at 5:48 PM CEST, Danilo Krummrich wrote:
> This patch series replaces aligned_size() with Kmalloc::aligned_layout(),=
 which
> is subsequently used to obtain a kmalloc() compatible Layout for
> __drm_dev_alloc() in drm::Device::new().
>
> It also contains two additional drm::Device fixes; the commits are based =
on
> next-20250731.

Applied to drm-misc-fixes, thanks!
