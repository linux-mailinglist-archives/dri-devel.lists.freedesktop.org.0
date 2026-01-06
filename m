Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C952ACFAE55
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 21:21:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A22F10E54D;
	Tue,  6 Jan 2026 20:21:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cxB15hbU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9479510E54D;
 Tue,  6 Jan 2026 20:21:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 461D5416C5;
 Tue,  6 Jan 2026 20:21:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1741DC116C6;
 Tue,  6 Jan 2026 20:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767730889;
 bh=6GymsSAJrMjlRhgGj673uy56XTGzYQmCI3sPLDhWRlg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cxB15hbUwXzN9cJRtD1xTuBJosvLrbTIfgPCQf7gYa6tjI6u1IfBGUtNSSDG64wOm
 o/8YuOAJqiOxUYR4jpglpx5BIq/Yg1do4jX1qYjAGxQ+dMn1M8ijTiVPVOzcvOku3e
 fUB5qAsw3B4U6PPdcE7j+wlBXqgGMbyk5y/aljODx6Fq5Hxlcoc/6MKShaoqlK9o3h
 Pf5RVEpEPCqvgG7Bq/lkg38nfMV9kQRgdYu34eDf9FI6R8QaC0pPPHzZwgDARJBcpF
 +lEoGdK+14id5uZqBmWtYnOwYXD8wwgDwYsCaUD3I0qFmLvIwRjdYCGQkHbGqtpdwt
 OeClmWJQxAe4A==
Date: Tue, 6 Jan 2026 12:21:28 -0800
From: Kees Cook <kees@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3][next] drm/nouveau: fifo: Avoid
 -Wflex-array-member-not-at-end warning
Message-ID: <202601061220.EDD0476@keescook>
References: <aJ17oxJYcqqr3946@kspp>
 <e1009d16-cadb-4446-aef5-4a52197551a4@embeddedor.com>
 <b4e596b0-4e6d-40b8-933c-f407f2cc0980@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4e596b0-4e6d-40b8-933c-f407f2cc0980@kernel.org>
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

On Tue, Jan 06, 2026 at 09:14:36PM +0100, Danilo Krummrich wrote:
> On 1/6/26 7:08 AM, Gustavo A. R. Silva wrote:
> > Friendly ping: who can take this, please?
> For some reason this patch wasn't tagged for applying in my inbox -- seems like
> it slipped through.
> 
> I was about to pick it up, but recognized just in time that Kees already took it
> through his hardening tree.

Ah great!

> Sorry for the delay; thanks Kees for picking it up. Even though already applied,
> please consider this patch:
> 
> 	Acked-by: Danilo Krummrich <dakr@kernel.org>

Thanks! I had figured it was slipping through the cracks so I snagged
it. I'll add your Ack. :) If you'd rather take it, just say the word and
I can drop it from my tree.

-Kees

-- 
Kees Cook
