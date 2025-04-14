Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63591A8838C
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 16:00:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E7C810E0BF;
	Mon, 14 Apr 2025 14:00:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="C1/nq6Wy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com
 [95.215.58.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF7FC10E0BF
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 14:00:29 +0000 (UTC)
Date: Mon, 14 Apr 2025 10:00:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
 s=key1; t=1744639228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7FqzQMbtN46MspgzRLzfkBpN56u2tDVXmIle8ZV/dB4=;
 b=C1/nq6WyDyt7TNMgH7KSTbefu6FL6JN7S7c5drm+oll+tMtCDzPKK1inAS5C4q/j05WNkh
 +Z1RSIobxa7PQto8emmyCTikM8pCNo3BfL3SzGo+PtwH9GhqV3cJTVMACImvylU8XCCZx4
 oJKl/DbL4B1EboM13r4ozhkjOYvk1z34UUcJ1tRiwqHYZozTydi7Gtdr/yGUW19v8zfIp1
 Ou7BY+04/4z4XmaYVrF4pzFekk+CWk0IwoIYdCkyoFANBTDpMOaKQIZuN2n4iAr2OusFgX
 RcAIuSBJiS3vyXS8AJHAOo/Ho1KycbL6xE7qK6rQvXHZL8qVnlmGJm7vWUzPZg==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Danilo Krummrich <dakr@kernel.org>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, lyude@redhat.com,
 lina@asahilina.net, daniel.almeida@collabora.com, j@jannau.net,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 3/8] rust: drm: add driver abstractions
Message-ID: <Z_0U9vrSpj_sPtG8@blossom>
References: <20250410235546.43736-1-dakr@kernel.org>
 <20250410235546.43736-4-dakr@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410235546.43736-4-dakr@kernel.org>
X-Migadu-Flow: FLOW_OUT
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

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>


