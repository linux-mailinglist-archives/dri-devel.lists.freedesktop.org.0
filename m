Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F53B244FF
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 11:07:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB1F710E6A6;
	Wed, 13 Aug 2025 09:07:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VW4HIn/L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB73F10E6A6;
 Wed, 13 Aug 2025 09:07:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5FBF55C6545;
 Wed, 13 Aug 2025 09:07:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5893CC4CEF5;
 Wed, 13 Aug 2025 09:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755076050;
 bh=Xbf1FDxbQ/qRvhhN1Z5oTn4sAbhr4F55+ThZxmjLwko=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=VW4HIn/Lpne9MfGqe54rPEZ12mib5gy4liVyd+esatGj5PHpXoyIJKRNEHjzRs5kO
 ic3RMQhvDr2JIdvnXTT1SuymXML353qI237vplRz3dDGvOozjT/vEpomSjzRtSUGP9
 xOgRY6njZiAse8mBtnxmoOtOIMG9Lzbw1JNbegnbjpqMmutJxeuBVlFZ3C/gZ6ojCQ
 CG3sPPvmiM3YxIxZTJO3gLRJ4ZFUsPlu3RaNZj4shiXrg9hlB8WqwKluTi5vLJFJRQ
 F/3T0sWgY88bUdXnwL3XJrafxYHhczO/qsK38T63TF6B9HLfA/rlogSGaqmW0yIRWG
 /KEcg3hCmbntw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 13 Aug 2025 11:07:26 +0200
Message-Id: <DC16J93QUQGV.4Z8STIPX6MGM@kernel.org>
Subject: Re: linux-next: manual merge of the mm-unstable tree with the
 drm-misc-fixes tree
Cc: "Stephen Rothwell" <sfr@canb.auug.org.au>, "Simona Vetter"
 <simona.vetter@ffwll.ch>, "Vitaly Wool" <vitaly.wool@konsulko.se>, "Intel
 Graphics" <intel-gfx@lists.freedesktop.org>, "DRI"
 <dri-devel@lists.freedesktop.org>, "Linux Kernel Mailing List"
 <linux-kernel@vger.kernel.org>, "Linux Next Mailing List"
 <linux-next@vger.kernel.org>
To: "Andrew Morton" <akpm@linux-foundation.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250813111151.6a261ca1@canb.auug.org.au>
 <20250812205946.2db0d8645f3c2ed6c8828ae2@linux-foundation.org>
In-Reply-To: <20250812205946.2db0d8645f3c2ed6c8828ae2@linux-foundation.org>
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

On Wed Aug 13, 2025 at 5:59 AM CEST, Andrew Morton wrote:
> Thanks.
>
> Well that's messy.

I think it's not too bad, the changes are just too close to each other -- n=
o
semantic conflict.

As a general heads-up, Rust code is a bit more prone to conflicts.

On one hand this is due to the more powerful type system and components of
different subsystems being a bit closer connected to each other to provide
additional safety guarantees.

On the other hand, there's simply a lot of foundational work going on in
parallel.

For the Rust parts that are maintained under your mm tree, I think it shoul=
d
generally stay well within limits though.

> Is it intended that the containing series ("Alloc and drm::Device
> fixes") be merged into 6.17-rcX?

Yes, not sure if it will be in -rc2 already, but should be in -rc3. So, the
conflict in -next should vanish in case you backmerge the corresponding -rc=
.
