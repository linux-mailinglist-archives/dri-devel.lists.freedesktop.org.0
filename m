Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A10489759AE
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 19:47:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF31010EA2F;
	Wed, 11 Sep 2024 17:46:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RUXBj1q+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89DD610EA60;
 Wed, 11 Sep 2024 17:46:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 247705C031A;
 Wed, 11 Sep 2024 17:46:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15002C4CEC0;
 Wed, 11 Sep 2024 17:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726076816;
 bh=gmqOGLm0OZGcL+znqyR5wEO+HiAhfmQO/SZmOhbvHTY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RUXBj1q+hGKavIEy++hSuAbVH/1LtHH91TLQJgIu+y6wdGQ07CWw/l3S50JW1RZmu
 u7ikYMgmxlF60NvyDWDlJxgUiIXzM9E/0CQ0IoVh+7SeSKRV4a6JmnFVrnVjtl9tqd
 6yV8D6FlqxofTnsngqPk8CFg73d9tbAUj0LDqB3WbkRv3g/EvK5jIbazDug8EF8OZj
 7DjnpGLcEBrxy8PDrXUVReXOEZ8QktMxRvoJ1vJv2I0BROF9zUk09K5n4xGgQNtjRz
 B7vkI93dnl3JTaSDnZuOXzIskOqAhEROfnraElps3td6SemllsKe31BM3q+/Fz8yA2
 no5x3Z8PwtS9A==
Date: Wed, 11 Sep 2024 10:46:54 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 0/8] drm: fix and enable warnings on unused static inlines
Message-ID: <20240911174654.GA2209716@thelio-3990X>
References: <cover.1725962479.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1725962479.git.jani.nikula@intel.com>
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

On Tue, Sep 10, 2024 at 01:03:36PM +0300, Jani Nikula wrote:
> Follow-up to [1].
> 
> Annotate unused static inlines with __maybe_unused. In some cases it
> might be better to remove them, but it's really up to the maintainers
> what to do. Then enable the warning on default across subsystem.

I merged drm-misc-next into next-20240910 and applied this series on top
of the result and it looks like all of the instances are fixed.

Tested-by: Nathan Chancellor <nathan@kernel.org> # build

Cheers,
Nathan
