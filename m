Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E41B5B01C66
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 14:52:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 152F810EA43;
	Fri, 11 Jul 2025 12:52:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lwn.net header.i=@lwn.net header.b="NiRaG5fK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B697310EA43
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 12:51:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 621E740AAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1752238314; bh=pvRnJ6fGOQ7F967zLvEgbnXWICTTFrxnNk+K97WLwE8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=NiRaG5fKsjN7WffXbrhAuhdRprY1EBIqGa1L83BZwvFypcbZrp+r3mPQ0hywM8vjo
 +cx4yzl7BGI0TuM4Pa7Pb1PiJjRO2jaTwlHGnsU7tKeUs8Fq5Xgl5OaOUh4Zt/c/hV
 0uA+3oP57e4ewPqzGNF+FWCQDHzCtosTGscCRzYF7rZf1gj2lbHEosU+Y2KgN5m+Qd
 xSChMHMt1YlFC9OPHLMO8xd00zPUk/HOMkRjfgSKcXOorCPCzgsTUsjLxohfgsrGY5
 l/JixLrhTLWp2kb2VqstwbFsZwCDOI+3+MF5fjnv1NJaDVMghYk/a5UnwQVAE4Vild
 zyZupmv2jCjvw==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 621E740AAB;
 Fri, 11 Jul 2025 12:51:54 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Brigham Campbell <me@brighamcampbell.com>, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>, "open list:DOCUMENTATION"
 <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: Re: [PATCH RESEND] drm: docs: Fix typo in introduction.rst
In-Reply-To: <20250711030157.124778-1-me@brighamcampbell.com>
References: <20250711030157.124778-1-me@brighamcampbell.com>
Date: Fri, 11 Jul 2025 06:51:53 -0600
Message-ID: <87tt3ix53q.fsf@trenco.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
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

Brigham Campbell <me@brighamcampbell.com> writes:

> Fix typo in Documentation/gpu/introduction.rst
>
> Link: https://lore.kernel.org/all/20250620180258.132160-1-me@brighamcampbell.com/
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
>
> This patch has received no response as of June 20th. If it's
> unacceptable for whatever reason, please let me know and I'll drop it.
> This is the only typo I happened across while reading the document. I
> scanned it for more typos when I prepared this patch, but found none.

The patch seems fine, though I wouldn't put a Link: tag for a previous
version like that.

I didn't apply it because the DRM folks generally handle their own
documentation patches.  I'm assuming this one just fell through the
cracks; resending it was the right thing to do.

Thanks,

jon
