Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA97BFD1D9
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 18:19:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 726E410E805;
	Wed, 22 Oct 2025 16:19:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KytjhFJm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E04A10E805;
 Wed, 22 Oct 2025 16:19:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C844163D2B;
 Wed, 22 Oct 2025 16:19:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D781C4CEFD;
 Wed, 22 Oct 2025 16:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761149993;
 bh=42fW/kZrr7BAeXGQ9pIcfCjCgAKlhltOQhbQ5NwKFZ4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KytjhFJmz+NwT7vLnGoAUvA8UOgaeNvczUV0a5q2YXRYrM3qVU9349+jWh7PoJLQQ
 9xaTG0FXqPhrKP4J6uKZroAA4IcjrjjP4pG87GMAInlv5PJ1nETouhvC6xHpICJMEM
 DWHpp6QVCHu6VC70h3HHySkJIW/ffZLSX2NCUolNxcPUhiEKNAEk7UbtCa1LCc+V6L
 gI4XSeg0ulfy5aN/cMEbgvSZiKy2KODjOQTA7T/FjXw5xhr1dmQ3VxFXZnp+noUFtx
 5g0LOsM4HN8ICbo6c98clOJSTGF3mJWurY7oFZzr2z2YHXfHPtKBg0IqLsQAD88M9A
 +e++hXwVorCQA==
Message-ID: <508ba490-9591-400a-a216-55a69b78c660@kernel.org>
Date: Wed, 22 Oct 2025 18:19:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] gpu: nova-core: various bitfield fixes
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Edwin Peer <epeer@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20251022-nova-bitfield-v1-0-73bc0988667b@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20251022-nova-bitfield-v1-0-73bc0988667b@nvidia.com>
Content-Type: text/plain; charset=UTF-8
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

On 10/22/25 12:50 PM, Alexandre Courbot wrote:
> These trivial patches fix a few issues reported by Edwin in [1].
> 
> [1] https://lore.kernel.org/rust-for-linux/F3853912-2C1C-4F9B-89B0-3168689F35B3@nvidia.com/
> 
> To: Danilo Krummrich <dakr@kernel.org>
> To: Alice Ryhl <aliceryhl@google.com>
> To: Edwin Peer <epeer@nvidia.com>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: Joel Fernandes <joelagnelf@nvidia.com>
> Cc: Timur Tabi <ttabi@nvidia.com>
> Cc: nouveau@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: rust-for-linux@vger.kernel.org
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Danilo Krummrich <dakr@kernel.org>
