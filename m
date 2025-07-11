Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB31B02406
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 20:46:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90DD210EAC6;
	Fri, 11 Jul 2025 18:46:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CLtVZ9Ra";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F420610EAB6
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 18:46:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B38E5440E1;
 Fri, 11 Jul 2025 18:46:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51366C4CEED;
 Fri, 11 Jul 2025 18:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752259603;
 bh=0TkEIXf++g99C3zeGWDyX2nQea6CDn0SC/EAE+N4esw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CLtVZ9RaATumi99vK1TwLAUyC3evJEVu45rsgw26SqLhupzDXjPoGnokgCZVVT3t7
 t0fX+pPPgIVAz5F+VPJnwppL4u+Cmex1b1ldxbioJmvbZZBybMceAu4JxAWLB32tTl
 8/lqHQnmVoaBmRwxO0vAynKg9BMaVpUJS6aSYNjpQtFxv5qAxQ8Vl/WefYKVpQNQPY
 TGUfOlB+VVURQgWl0niDDnzEQnhmI94dkD4qhtC8z3n1G6JR+2cZ5VkrNIYX/BSqzs
 OJP4X7Q44YMTMTHCOEaZVlkKzCwX/4nfptVFGtOEbIx4DpmdSU1MZERnD8TudaSRsT
 yRwuM4cBTyC7Q==
Date: Fri, 11 Jul 2025 11:46:42 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter
 <simona@ffwll.ch>, Dave Airlie <airlied@gmail.com>, davem@davemloft.net,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, pabeni@redhat.com,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: [GIT PULL] Networking for v6.16-rc6 (follow up)
Message-ID: <20250711114642.2664f28a@kernel.org>
In-Reply-To: <CAHk-=wj1Y3LfREoHvT4baucVJ5jvy0cMydcPVQNXhprdhuE2AA@mail.gmail.com>
References: <20250711151002.3228710-1-kuba@kernel.org>
 <CAHk-=wj1Y3LfREoHvT4baucVJ5jvy0cMydcPVQNXhprdhuE2AA@mail.gmail.com>
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

On Fri, 11 Jul 2025 11:33:10 -0700 Linus Torvalds wrote:
> Because this "emergency PR" does seem to have turned my "annoying
> problem with timeouts at initial login" into "now it doesn't boot at
> all".

Hm. I'm definitely okay with reverting. So if you revert these three:

a3c4a125ec72 ("netlink: Fix rmem check in netlink_broadcast_deliver().")
a3c4a125ec72 ("netlink: Fix rmem check in netlink_broadcast_deliver().")
ae8f160e7eb2 ("netlink: Fix wraparounds of sk->sk_rmem_alloc.")

everything is just fine?
