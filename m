Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A42A9718E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 17:49:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2FBA10E5D4;
	Tue, 22 Apr 2025 15:49:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="s2ik30OE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24A2E10E5D1;
 Tue, 22 Apr 2025 15:49:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 41427A4B51A;
 Tue, 22 Apr 2025 15:44:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2DE8C4CEE9;
 Tue, 22 Apr 2025 15:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745336974;
 bh=5GOMuvIE+7EsbF04NswrnSuLp3VvDN4BQnu1VTgx080=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s2ik30OE2PgSyHjVZ3CA+slsyUMRhiQ9+E9aOz1/kSCVSB6csdlcpr9mBOgYB0hZb
 yVwFq9w6HexungrrST9nr19K+OfpXVQnWgzJWwEOs6rtjuxEacLWrRtus8JwTt5uUv
 Iyyuxue2n5aSttEbaXPhHlwVtPludc/m+AZTpU/efh8sWyJUY7XQnxLYMBbDu4Nk2v
 d+QYLUP/5q3bJ1oG37m5HUnQMMZ95LDmKuMYheRTgeQCOXf7L7NebwoHHFARngqYCs
 Oswv0/YpKwtrq6AXlBklXOew6xhfKnaKSvW54yLjrlI/cgAVdJmBvDVbnZBZldYS8N
 Cv5VCkGSxjOMg==
Date: Tue, 22 Apr 2025 08:49:30 -0700
From: Kees Cook <kees@kernel.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] drm/nouveau: outp: Use __member_size() helper
Message-ID: <202504220849.3BDE692@keescook>
References: <aAe5o_-f5OYSTXjZ@kspp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAe5o_-f5OYSTXjZ@kspp>
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

On Tue, Apr 22, 2025 at 09:45:39AM -0600, Gustavo A. R. Silva wrote:
> Use __member_size() to get the size of the flex-array member at compile
> time, instead of the convoluted expression `__struct_size(p) - sizeof(*p)`
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook
