Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B78979E7C
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 11:28:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37E3D10E326;
	Mon, 16 Sep 2024 09:28:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="o2V+2BTJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D65610E324;
 Mon, 16 Sep 2024 09:28:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C1F7C5C461D;
 Mon, 16 Sep 2024 09:28:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79E4BC4CECD;
 Mon, 16 Sep 2024 09:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726478924;
 bh=HHUgW1boYFxsRq7ez/mJftbzVuWDocQVG+uAfB4jUpg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o2V+2BTJYV3NhsJTPZR0edYF0TIE5JqINAzERFaJWLuAbj1GVVCzzHgW7e21Bs9MS
 MW50QT88ifdVFoDKkDgEH9ksLco0WTiM4uXWVwcvwjQlFRf4vVfeni/ijF2pPjjo0B
 H6Rtu4Ew0GRAGsYxfjfKkhg5IcNXOb0t4GXDKXiUMt6ABfQNHtdo9tSIZso3qNt9dn
 zPsFgF5uqq9JeCnvPlDjCBHuurszTYKSljTOwWbeEjpse9OsONC+gigw+HlPqElOB4
 1nLnTj912VaGn0jHMUqvY3NyuBL+iF4W9LAWvOU4RdwnUsCW8Cl8I+87Nl+tlr7UOQ
 mus1sRdlVEwww==
Date: Mon, 16 Sep 2024 11:28:38 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Yan Zhen <yanzhen@vivo.com>
Cc: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com, 
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, airlied@gmail.com,
 simona@ffwll.ch, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 opensource.kernel@vivo.com, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1] drm/i915/display: fix typo in the comment
Message-ID: <hl7izclcyvkwi3z42iud3fv6aolzrmvilcd6gt4f2uyf7cefdz@2wswztqazz3g>
References: <20240913061727.170198-1-yanzhen@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913061727.170198-1-yanzhen@vivo.com>
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

Hi Yan,

On Fri, Sep 13, 2024 at 02:17:27PM GMT, Yan Zhen wrote:
> Correctly spelled comments make it easier for the reader to understand
> the code.
> 
> Replace 'platformas' with 'platforms' in the comment &
> replace 'prefere' with 'prefer' in the comment &
> replace 'corresponsding' with 'corresponding' in the comment &
> replace 'harizontal' with 'horizontal' in the comment.
> 
> Signed-off-by: Yan Zhen <yanzhen@vivo.com>

reviewed and merged to drm-intel-next.

Thanks,
Andi
