Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84134AB9E42
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 16:10:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1604D10EAD1;
	Fri, 16 May 2025 14:10:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="a9/ozvWa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D6710EACE;
 Fri, 16 May 2025 14:10:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 96D485C05CE;
 Fri, 16 May 2025 14:07:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D6B3C4CEE4;
 Fri, 16 May 2025 14:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747404614;
 bh=LYYrNFafkCxBXNIP0MdzmtAPl7HX5/WtNzfIhSCjBB4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=a9/ozvWampK7x8Pa8fAWqI6Ga5XbILUpFy4CffEmV4wJ/5hFXOF6bR+ZmdohVzsfw
 hDmowLs6VsoO51wyyeLeA0+YnoxkkdnfawaxkXrb2TZhMOU3FnD5Y9+Y/ykUQQklbE
 1H1LVfskozYBUp3bN6wY6DTydINISYiEncJZgA1ClTs3xSu8SqxvsIsBJrSFXzVGuQ
 r6qV/BWObuarevcIBboydG1WrG6PbtI8mNY2yospB8Qb1gacts/YXy10kIFsBIqS6Z
 N+5HbU/G60+9GaqlMtmpehzpmAZN8oIAS+9gt61jMAzX0dJ9QuPGIs7Od0RRWSMj0L
 Qf3K+pEAcj73A==
Message-ID: <04c07c31-6481-48da-a7a6-002acce7a3eb@kernel.org>
Date: Fri, 16 May 2025 16:10:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau/fifo: small cleanup in nvkm_chan_cctx_get()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <aBHaCM66pXaP84ei@stanley.mountain>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <aBHaCM66pXaP84ei@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 4/30/25 10:06 AM, Dan Carpenter wrote:
> "&chan->cgrp->mutex" and "&cgrp->mutex" are the same thing.  Use
> "&cgrp->mutex" consistently.  It looks nicer and it silences a
> Smatch static checker warning.

Applied to drm-misc-next, thanks!
