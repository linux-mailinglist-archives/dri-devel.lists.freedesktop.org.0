Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD7CC1FDED
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 12:46:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC55E10E95C;
	Thu, 30 Oct 2025 11:46:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Hz2a8B2n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2DC710E95C
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 11:46:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 702B34417F;
 Thu, 30 Oct 2025 11:46:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D92BC4CEFF;
 Thu, 30 Oct 2025 11:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761824783;
 bh=reiNpeqTPEeJU6gOHFXRhPO54XWsRkqnewY5o9KMMDQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Hz2a8B2nAz+J+MqNj3XJWzeVhFnHgmnKxDMGrxgKNJHwV9Zt0Sl2LJYbw9jTJzwcq
 j5Vdd/3qwXooUYn4PtiKS0USib3p1lY1QHAj0r4TRFxThcAqyO+1RozVogiGKS+wav
 M4/63umk7L2ayO8Yh4Vn++Xy++tM3wZxFu3TaNkwSytRL19wlvdxh5iuXQFkfGeomq
 oy4rnPAOceDk63XM1KYxjtqJokm1wqgTwfp1vDT33eZeCc2yh9flgYvvVobw4r9cU6
 mr9hswKxc9hAvcyd6aHovQaIdCs9zVQ8Ka1KiXWX+49qARSBxpQyXh3x0BksTJrXl2
 CrqTV588Bt/lQ==
Date: Thu, 30 Oct 2025 11:47:26 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Randy Dunlap <rdunlap@infradead.org>, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 1/2] leds: Drop duplicate LEDS_EXPRESSWIRE config
Message-ID: <aQNQTlGed2XCY0lH@aspen.lan>
References: <20250729-expresswire-dep-fix-v1-0-635cd4cc746b@dujemihanovic.xyz>
 <20250729-expresswire-dep-fix-v1-1-635cd4cc746b@dujemihanovic.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250729-expresswire-dep-fix-v1-1-635cd4cc746b@dujemihanovic.xyz>
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

On Tue, Jul 29, 2025 at 07:18:29PM +0200, Duje Mihanović wrote:
> While moving said config symbol out of the "if NEW_LEDS" block, I
> accidentally left a copy inside that block. Remove it.
>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Link: https://lore.kernel.org/all/b6c481bb-e854-405e-a428-90301789fe20@infradead.org/
> Fixes: 2cd0d1db31e7 ("leds: expresswire: Don't depend on NEW_LEDS")
> Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.
