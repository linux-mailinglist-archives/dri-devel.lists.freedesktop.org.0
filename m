Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 490C0B247DD
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 13:02:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99BBA10E6F4;
	Wed, 13 Aug 2025 11:02:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nqgPrqkA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D16710E6F4;
 Wed, 13 Aug 2025 11:02:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 317E3A57C6F;
 Wed, 13 Aug 2025 11:02:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2839C4CEEB;
 Wed, 13 Aug 2025 11:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755082922;
 bh=7YbELCjb51P2Om8mI3uQ8h1CufdMDKxXXOjRp9ywryU=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=nqgPrqkAbwBgVMdL5bsNJgaWBzGnZfhBhi729kTMoKgbvncBLz3oA0yOwss9xxIlI
 X9ZdLwYV/l5RIvLM67nSQolEdrl5uutTw5bJ8nP7ReUuFjNkCLgH719SPORJdPppjV
 JZafvpxzouV81aM/ykcfJaOFXx/U7K+sO+eAkOF96Pjs7HZlnyjzbQ3iD5LU/K5etN
 RBb+hsp8j9FdHLPZOz5DwIqwJscUPSWY41U0ozP5is4Y9CSWCLd9p8ktidbPBgqUtX
 VmWga6BNkOGLdT86giifihUv1jPXRg5YEf+otTkzF5Iuhj5bUBQJgSxDKMGrbMFLyM
 0shcNnZ2UZCyg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 13 Aug 2025 13:01:58 +0200
Message-Id: <DC18YY6U37ZD.16KGMXOUG43RO@kernel.org>
Subject: Re: [PATCH] drm/nouveau/gsp: fix mismatched alloc/free for kvmalloc()
Cc: "Qianfeng Rong" <rongqianfeng@vivo.com>, "Lyude Paul"
 <lyude@redhat.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Dave Airlie" <airlied@redhat.com>, "Ben Skeggs"
 <bskeggs@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
To: "Zhi Wang" <zhiw@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250811091910.404659-1-rongqianfeng@vivo.com>
 <20250813134622.000069a0@nvidia.com>
In-Reply-To: <20250813134622.000069a0@nvidia.com>
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

On Wed Aug 13, 2025 at 12:46 PM CEST, Zhi Wang wrote:
> On Mon, 11 Aug 2025 17:19:00 +0800
> Qianfeng Rong <rongqianfeng@vivo.com> wrote:
>
> Acked-by: Zhi Wang <zhiw@nvidia.com>
>
> Please add a Fixes: tag.

And please also add "Cc: stable@vger.kernel.org", thanks!
