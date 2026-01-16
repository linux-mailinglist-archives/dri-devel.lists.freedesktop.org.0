Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FA2D385F9
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 20:36:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D470810E91D;
	Fri, 16 Jan 2026 19:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ispras.ru header.i=@ispras.ru header.b="eipR8nkF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 076B910E91D
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 19:36:09 +0000 (UTC)
Received: from localhost (unknown [79.139.240.21])
 by mail.ispras.ru (Postfix) with ESMTPSA id 13AE8406E9AC;
 Fri, 16 Jan 2026 19:36:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 13AE8406E9AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1768592167;
 bh=OQSJm71mqejadmYLuc9oR3EA6Ci2x9fyJh28nlhxIAk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eipR8nkFgonMZ0n64yvPbJX/6Wgk9zLkrakH217z2AeUnob+YL12wincysZJ5kGhB
 q5ksCVN4Z+o/RJ1bYIl/rj8j2rgi7fMxBwIFH+e/1OgNVAhp8f5/5mESegzUUqR5jY
 qD8/d+p0Gkstvqu+/KrVM1iwqMXIoNZLpt2SqvUo=
Date: Fri, 16 Jan 2026 22:36:06 +0300
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	stable@vger.kernel.org
Cc: Christian Koenig <christian.koenig@amd.com>, 
 Matthew Brost <matthew.brost@intel.com>,
 Simon Richter <Simon.Richter@hogyros.de>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org
Subject: Re: [PATCH 6.1] drm/ttm: fix up length check inside ttm_bo_vm_access()
Message-ID: <aWqS00tHXSsh_rwL@fedora>
References: <20260116185007.1243557-1-pchelkin@ispras.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260116185007.1243557-1-pchelkin@ispras.ru>
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

On Fri, 16. Jan 21:50, Fedor Pchelkin wrote:
> The backport of 491adc6a0f99 ("drm/ttm: Avoid NULL pointer deref for
> evicted BOs") is currently in 5.10-5.15 queues and it may be fixed up in
> place.

That's actually in queue for 5.15 only, not 5.10.
