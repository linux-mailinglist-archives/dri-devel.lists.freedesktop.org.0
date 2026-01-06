Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CED6FCFAD76
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 20:59:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EB3B10E549;
	Tue,  6 Jan 2026 19:59:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qlUBYoDX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A333510E549;
 Tue,  6 Jan 2026 19:59:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B4E0B60007;
 Tue,  6 Jan 2026 19:59:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6232DC116C6;
 Tue,  6 Jan 2026 19:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767729586;
 bh=+uMYO8Zcxy/LKS7iUfEqcKI8uYdKCiFIFxLZuU6quyA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qlUBYoDX2H5vGWPhhRP5iKMQNMSQFaSgK2LSocZgkXFoNlCCS1a4bXhawNCqOVQR5
 yNZ9TBZJTZL4PR7RI7Lav2FYx2JrIuv2LqtMgRFIKYbshtc9kxjFpBxTr9ViLP+L1B
 RJeSQuicpHAl2E5ENTalteggB0l2BuUGJJAuQ71g9uTBWR310CLQCfP1Ap869NQcTV
 pARBkjDOmpgFQMmF1dOUCRN0CPylEZTIhjwuOgIsut/3FClTe4GqOS6wgDToF0qdqT
 hCpBJvbmDx7fG+rHQ4SSNRPjfQqH8Vw9S3+uad0AE6x8E3YawazWhfXAvwCEeO8mkW
 bRny5qLWG86Uw==
From: Kees Cook <kees@kernel.org>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Kees Cook <kees@kernel.org>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3][next] drm/nouveau: fifo: Avoid
 -Wflex-array-member-not-at-end warning
Date: Tue,  6 Jan 2026 11:59:43 -0800
Message-Id: <176772957954.1530485.4582284327428826161.b4-ty@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <aJ17oxJYcqqr3946@kspp>
References: <aJ17oxJYcqqr3946@kspp>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Thu, 14 Aug 2025 15:01:07 +0900, Gustavo A. R. Silva wrote:
> -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
> getting ready to enable it, globally.
> 
> Use the new TRAILING_OVERLAP() helper to fix the following warning:
> 
> drivers/gpu/drm/nouveau/nvif/fifo.c:29:42: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] drm/nouveau: fifo: Avoid -Wflex-array-member-not-at-end warning
      https://git.kernel.org/kees/c/2d4909bae919

Take care,

-- 
Kees Cook

