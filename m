Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BC9BC0F73
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 12:06:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD8F910E5C5;
	Tue,  7 Oct 2025 10:06:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DsEUBx/7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 676C510E5C5;
 Tue,  7 Oct 2025 10:06:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8A35C611E2;
 Tue,  7 Oct 2025 10:06:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91702C4CEF1;
 Tue,  7 Oct 2025 10:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759831583;
 bh=j7tkM38nVGW3WCRewOGYeBE5sO6Xt6WjagJYHzeqz2o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DsEUBx/7n+kphzSY+4Pi40oJRs/ZhSRygRd68usAdcYkf8C+4hRJPDo7+L4OKUciv
 TUtNgbOY+l72870DWVJ9T1rIe5flpx75yHjpQydbwbxz29TmIVHWnqWPFIlSUwy5oX
 uOeengE9U9oUPxheESHBTWo0jjGkmrNgKWcnaOc3TA0NaV+dW5GAUpEcJV9fYrrRZq
 SxzSW82Cs8WawKBddVbFYltiTDXnaKyfqkTR+3/66b96k07ZmqFSOgBa+HvuotAKZk
 VEIY+9fHW0r9FKEWDLvunEhIKWcRLPEUqxRdIdIFd3HQleA8mk3yIHRJPhtEOGbZKQ
 EvC+qCxoOgsiA==
Date: Tue, 7 Oct 2025 12:06:19 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, 
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, 
 tursulin@ursulin.net, lyude@redhat.com, dakr@kernel.org,
 lucas.demarchi@intel.com, 
 thomas.hellstrom@linux.intel.com, jfalempe@redhat.com, javierm@redhat.com, 
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/client: Remove holds_console_lock parameter from
 suspend/resume
Message-ID: <tf6uvgxs6332cwdk53dp4nfa3yz6nvttusgs2j5pul6k3v6ja4@mbczvhauxdan>
References: <20251001143709.419736-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001143709.419736-1-tzimmermann@suse.de>
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

Hi Thomas,

On Wed, Oct 01, 2025 at 04:37:03PM +0200, Thomas Zimmermann wrote:
> No caller of the client resume/suspend helpers holds the console
> lock. The last such cases were removed from radeon in the patch
> series at [1]. Now remove the related parameter and the TODO items.
> 
> v2:
> - update placeholders for CONFIG_DRM_CLIENT=n
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Link: https://patchwork.freedesktop.org/series/151624/ # [1]

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
