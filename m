Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8417C1D8F6
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 23:07:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17AE910E85D;
	Wed, 29 Oct 2025 22:07:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hihwOsXl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 963CF10E85D
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 22:07:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A743F6054A;
 Wed, 29 Oct 2025 22:07:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAB5CC4CEF7;
 Wed, 29 Oct 2025 22:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761775665;
 bh=WDkOUQsc/GNM02IItNB/fO+zB61bn/RMRYCt5QAMnvM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hihwOsXllSzaiRpSiqfqNcIgwNBnOs9CSG7YYPEBxXs9DhGh2zWxbMYpKpMwsMBdo
 Q0gQo+Z4xhrSkFYvbuj+0Tw7EVnknX09mmeIHy8JAV0D8rAzuMsWGvRLJI5s2rE0lD
 At068wNIE5vnhzGqsPCA+lFSvQPgKRle3fFPmsEfsMlM2pMmxxO/MBxgS/GG8If9me
 liyr0feFzMz3NghWylYnApgI5JQo56Mm/L58El9iX+k79RBNYHzfAtZ4zFO6xGqRvJ
 UWER+WjT+5ePoeDb0ZGOweKMiN8raX6yyHt9h9DkgJy31PM+geU1K1aEVjc5xzVV6P
 gAMuYVqjIxJ+w==
Date: Wed, 29 Oct 2025 17:07:38 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 Matt Coster <matt.coster@imgtec.com>, Frank Binns <frank.binns@imgtec.com>
Subject: Re: [PATCH] dt-bindings: gpu: img,powervr-rogue: Drop duplicate
 newline
Message-ID: <176177565555.3093261.18405131754587729535.robh@kernel.org>
References: <20251029194210.129326-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029194210.129326-1-marek.vasut+renesas@mailbox.org>
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


On Wed, 29 Oct 2025 20:42:02 +0100, Marek Vasut wrote:
> Fix the following DT schema check warning:
> 
> ./Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml:103:1: [warning] too many blank lines (2 > 1) (empty-lines)
> 
> One newline is enough. No functional change.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Frank Binns <frank.binns@imgtec.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Matt Coster <matt.coster@imgtec.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

