Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 738F89AD925
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 03:22:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D447810E24F;
	Thu, 24 Oct 2024 01:22:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="FIZYV72Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 614E010E24F;
 Thu, 24 Oct 2024 01:22:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F229B5C58FB;
 Thu, 24 Oct 2024 01:22:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7F86C4CEC6;
 Thu, 24 Oct 2024 01:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1729732938;
 bh=oCdhpVoh/SNCNsR3EypH5LjarVuXAX+BjqQknwkXXxw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FIZYV72Qor/TzhluoP6m8ZPtQTci4oXMo9aqaHe9N+7RZtEmo7/UFi41TSKi+eqXY
 lqOuuDO3VjsDI0q96CgcwxPZGpw2dRT7PQoAyTLTvf68sg3+c2TiCyOPGz4FJeMRB7
 LgyfY9NmdWTyY7okPWVZR/KGcU3jM5uJyv9Fa2Z8=
Date: Wed, 23 Oct 2024 18:22:17 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, apopple@nvidia.com
Subject: Re: [PATCH v3 1/1] mm/migrate: Add migrate_device_pfns
Message-Id: <20241023182217.147ee87197b53d47057a4c06@linux-foundation.org>
In-Reply-To: <20241023233944.1798835-2-matthew.brost@intel.com>
References: <20241023233944.1798835-1-matthew.brost@intel.com>
 <20241023233944.1798835-2-matthew.brost@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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

On Wed, 23 Oct 2024 16:39:43 -0700 Matthew Brost <matthew.brost@intel.com> wrote:

> Part of series [1]. Sending as individual patch ahead of that series as
> this is a prerequisite for merging.

That's news to me - singleton patches are perfectly OK?

On Wed, 23 Oct 2024 16:39:44 -0700 Matthew Brost <matthew.brost@intel.com> wrote:

> Implement migrate_device_pfns to prepare an array of PFNs for migration.
> Handles non-contiguous ranges of device pages that require migration.

OK, that's "what".  We're more interested in "why".

> +EXPORT_SYMBOL(migrate_device_pfns);

And it's exported to modules, which adds to the significance.

Please fully describe the reasons for proposing this change.
