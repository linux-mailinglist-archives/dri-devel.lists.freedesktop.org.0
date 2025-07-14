Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C16B03C7E
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 12:52:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 187B510E45A;
	Mon, 14 Jul 2025 10:51:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ayNdhBb6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A73310E459;
 Mon, 14 Jul 2025 10:51:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B8D366141F;
 Mon, 14 Jul 2025 10:51:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CD5CC4CEED;
 Mon, 14 Jul 2025 10:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752490316;
 bh=NzSjl/05WZKp/TIPLA6jzybk7hA5tSKg1rNVsJpc5ek=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=ayNdhBb6LyhPo3Ji0W92NfYmQ1myKEXwccEkSPhK/UvrRQXG4a0uoLsz1i2bwCP1Z
 uj//FhekwOZHW8o7fCIKbfU9m/rWcaOgG+6+dOiaH/Ei+X9n2h/4uGGz8Jld7n1sli
 kGMpM52lE6KIwUqY8Y5dWuzwauj+jnW2vQ+KQedJxHv/6aV/EIqACi72qlOWI5DCMc
 k4W8CYiQOd4oNULFF/L3FiV40p8kZtjJMvMVSU8cBMg5XKK+fxBIfbNR6Tr1lknZHj
 rMfN9M5X1Zz/LSRlHU9zkPQftdkdv1PFa1BLpBMO6fGjocTbrLEqn4OmQtwyBEeUVy
 5TFRZ2FzQZZ2g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Jul 2025 12:51:52 +0200
Message-Id: <DBBPYV1YV97X.OT2SPH3R67RS@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] gpu: nova-core: vbios: change PmuLookupTableEntry to
 relax alignment
From: "Benno Lossin" <lossin@kernel.org>
To: "Rhys Lloyd" <krakow20@gmail.com>, <acourbot@nvidia.com>, <dakr@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250714104322.100511-1-krakow20@gmail.com>
In-Reply-To: <20250714104322.100511-1-krakow20@gmail.com>
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

On Mon Jul 14, 2025 at 12:43 PM CEST, Rhys Lloyd wrote:
> +
> +    /// Construct a u32 from `self.data`.
> +    fn get_data(&self) -> u32 {

Getters in Rust usually don't start with `get_`. Using `data(&self)`
here also looks better IMO.

---
Cheers,
Benno

> +        u32::from_le_bytes(self.data)
> +    }
>  }
