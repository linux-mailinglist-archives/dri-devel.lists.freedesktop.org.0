Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1110A991BB
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 17:35:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4504910E6E8;
	Wed, 23 Apr 2025 15:35:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aMxcTmAy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7510B10E6E0;
 Wed, 23 Apr 2025 15:34:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A6D03A4BBB1;
 Wed, 23 Apr 2025 15:29:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C4A3C4CEE2;
 Wed, 23 Apr 2025 15:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745422497;
 bh=Xxenez25Q38AH9fsXJGnqUA44hSEjkp2u9luWlh8gCU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aMxcTmAyMctfMrtLTBBXDWVuqAU0odGiZOrObJt8nFs1ULqyHX6EOW9XJ8gAv2Al+
 ls9TW+darJzWgqXw72VXP8YFPVo11b5nb4wdSyx0Vex4KlKugMgUq5V8RrofN226//
 ayl8j6+jxM2heyBoG/PGk+5f8OrZp+icLG1b+Kf4fE4l5+A5pF11BY+MeUzLgGVVCy
 76qzKXdf6RWw1+AmLmbCxSXZ8VN2jdWqaayORF7ejuZeO+Sd5zId/QUXUdZcWzPhoG
 WoFcn6Ormbu+ol2ABSt6P+u0xGkM8tdLC4KC1OcpHXsSv0qciQfx8oAMYL3hjzjiwQ
 ZoHpE50wR/0og==
Date: Wed, 23 Apr 2025 17:34:53 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] drm/nouveau: disp: Use __member_size() helper
Message-ID: <aAkIne5RbZMoxxJV@pollux>
References: <aAe5eNDnRyGnxLMX@kspp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAe5eNDnRyGnxLMX@kspp>
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

On Tue, Apr 22, 2025 at 09:44:56AM -0600, Gustavo A. R. Silva wrote:
> Use __member_size() to get the size of the flex-array member at compile
> time, instead of the convoluted expression `__struct_size(p) - sizeof(*p)`
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Applied to drm-misc-next, thanks!
