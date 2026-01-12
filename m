Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68631D12534
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 12:33:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B19A10E3A2;
	Mon, 12 Jan 2026 11:33:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="c0IXWhxe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A632910E3B4;
 Mon, 12 Jan 2026 11:33:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 45C9E43B8B;
 Mon, 12 Jan 2026 11:33:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B51EBC16AAE;
 Mon, 12 Jan 2026 11:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768217625;
 bh=gewNW9JfOu+wmTeMqWf/D1iX1aeq3pa4b5o6CPOafNg=;
 h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
 b=c0IXWhxeuCF+OyQaC2AIspZ3WuoilRsLIYZSy/hMcduANQB5xgWOLKcQUZAQ7yVFv
 FsYA7BMGWx/PVQa5vvKWGjX/GXOLi5u3AhYKH+3BV6qH/ZzJMF3LRqzQ50wrt+WhBi
 dtpWFgzBw8X7l07UYzb6YTH1fYNv7sp3ADNSG0lKHP2jVnItR/q3UwWYNGz1mmjXAh
 6O58N4kwElLaemzKoyg61kVmuMfXFeGzidbWiWKZTkS+r6AttKeojhsqdH/GBJdjaX
 s+14oFIiTInrV5OzEKYS/vNRyFZuEaJrPgA8+Nb82TgpKvF5f2cUGAsGs07AZOX9G9
 oWXerIZh9E1Bg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Jan 2026 12:33:40 +0100
Message-Id: <DFMKU0Z8EO0Q.2YBWNYTCETHVY@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [RFC 3/3] drm/sched: Disallow initializing entities with no
 schedulers
Cc: <phasta@kernel.org>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <kernel-dev@igalia.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Matthew
 Brost" <matthew.brost@intel.com>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
References: <20260107124351.94738-1-tvrtko.ursulin@igalia.com>
 <20260107124351.94738-4-tvrtko.ursulin@igalia.com>
 <a763700944ed4ccfe2f36ae805e4a348dd3fd10f.camel@mailbox.org>
 <340d0ce2-85e6-4fd8-992c-c35dda9b0cbb@igalia.com>
In-Reply-To: <340d0ce2-85e6-4fd8-992c-c35dda9b0cbb@igalia.com>
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

On Mon Jan 12, 2026 at 11:29 AM CET, Tvrtko Ursulin wrote:
> It looks completely logical to me to have both lines dealing with the=20
> same scheduler list, accessing the same input parameter even, next to=20
> each other:
>
>    entity->num_sched_list =3D num_sched_list;
>    entity->sched_list =3D num_sched_list > 1 ? sched_list : NULL;
>
> No?

Agreed! Yet, please don't add unrelated changes to patches.
