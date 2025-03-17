Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F929A66262
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 00:06:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 444DB10E0C8;
	Mon, 17 Mar 2025 23:06:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lwn.net header.i=@lwn.net header.b="ZGTF1Rxa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 026E810E0C8
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 23:06:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 50F4B41061
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1742252788; bh=jxWAeHs2T6y/dyxhwehtyNGGW4rGNYSTPFRvM8paFq8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ZGTF1RxaEISHMn33V3qy/DZG6r59ZW8CZQRYD8yeWnpcDhkif0xZriDqznveSnCrs
 DqwaGV3WTT4ocsLpvxn/JK3/waNqjRV45RdA1oYUzJK0bWoLw+o60t3jsrq3Y0BBqz
 4Bvo9xYMNkPU+7nbWI6OWFaTiKcQzuEAq1oz4qZNP5WoIfxXH2g9hUC6/lko6AhZL5
 u17aD3CwiWVbJbgEQOFlS6dPCdO4+ipV1QW91rGY0ZsnlZ2g7XJRqbX7uHOwfw22Qh
 QpzyuzYH6RXCqBvJ82J6acP9o85RCt1oUjEbcvoXC6jYVwT2kfgxnWri3bL0txIjxf
 OwcaUZEtPttbw==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 50F4B41061;
 Mon, 17 Mar 2025 23:06:28 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Dave Airlie <airlied@gmail.com>
Cc: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, simona.vetter@ffwll.ch
Subject: Re: [PATCH] docs: driver-api: firmware: clarify userspace requirements
In-Reply-To: <CAPM=9tzv+=+ZGRtHgapUVAiDjHn=Bp33BqyLLQKDuKsR-AoC7A@mail.gmail.com>
References: <20250314100137.2972355-1-jacek.lawrynowicz@linux.intel.com>
 <874izre0aq.fsf@trenco.lwn.net>
 <CAPM=9tzv+=+ZGRtHgapUVAiDjHn=Bp33BqyLLQKDuKsR-AoC7A@mail.gmail.com>
Date: Mon, 17 Mar 2025 17:06:27 -0600
Message-ID: <87v7s7cl58.fsf@trenco.lwn.net>
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

Dave Airlie <airlied@gmail.com> writes:

>> Dave, you're the only one with fingerprints on this document; is the
>> change OK with you?
>
> LGTM,
>
> Acked-by: Dave Airlie <airlied@redhat.com>

OK, applied - thanks.

jon
