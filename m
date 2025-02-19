Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BCFA3C102
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 15:02:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 289D010E09C;
	Wed, 19 Feb 2025 14:02:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QrMrzmT6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93ED710E09A;
 Wed, 19 Feb 2025 14:02:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 60A875C58DC;
 Wed, 19 Feb 2025 14:02:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1C55C4CED1;
 Wed, 19 Feb 2025 14:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739973767;
 bh=Zti3H5sZRXPrT/wgsFtd7JosJu7DWgxLjY1/qLK8CAI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QrMrzmT6/Ttxw+lY5X5liP3ZDX6ejkZBxuz/lGmpZGqbwip9NN10iMpwRvaflgzRa
 tWdglfSTcSLji0kw5orVPYOUDGM/9P51NmBNjy4AkUPKNxnWHqoTSHzLOUlKfnXiXh
 RrlblesBsQgwpGOHTqcfL7HnB2QrxbA72zVqo9CSERMPxJbMz6+ExoavDfnk8tEmQi
 6HrZskyWLtmww6efpGT7GMdgyQ3CS+NUTCxQGTJknkKv1iuC63SPvS/LncZ7W7cW3C
 zjZzevxDBBkcnvhrE8Lxrzbq6ip/0IJZ/b/DnUsUxKtRL1qn7aNgqwfc4laoMCiuef
 X2eIEvx8Av5GA==
Date: Wed, 19 Feb 2025 15:02:42 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Zhi Wang <zhiw@nvidia.com>, Lyude Paul <lyude@redhat.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Timur Tabi <ttabi@nvidia.com>, Dave Airlie <airlied@redhat.com>,
 Ben Skeggs <bskeggs@nvidia.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/nouveau: Fix error pointer dereference in
 r535_gsp_msgq_recv()
Message-ID: <Z7Xkgr5zP23VRhx1@polis>
References: <b7052ac0-98e4-433b-ad58-f563bf51858c@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7052ac0-98e4-433b-ad58-f563bf51858c@stanley.mountain>
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

On Mon, Feb 17, 2025 at 10:31:21AM +0300, Dan Carpenter wrote:
> If "rpc" is an error pointer then return directly.  Otherwise it leads
> to an error pointer dereference.
> 
> Fixes: 50f290053d79 ("drm/nouveau: support handling the return of large GSP message")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Applied to drm-misc-next, thanks!
