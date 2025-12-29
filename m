Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FE4CE7B71
	for <lists+dri-devel@lfdr.de>; Mon, 29 Dec 2025 18:14:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F0710E5C6;
	Mon, 29 Dec 2025 17:14:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SplWRb82";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D22510E5C6;
 Mon, 29 Dec 2025 17:14:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 875306000A;
 Mon, 29 Dec 2025 17:14:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E9D5C116C6;
 Mon, 29 Dec 2025 17:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767028482;
 bh=70pMF0tZvi759bz+6lPYglJc2rW36kpCOk/59CwJpzE=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=SplWRb82hNcFOrWMWTkdGeqI1hoUIZbek6s4kRvBOl75NqFm2HtADcsYTff4BjKWD
 /7ChNZYAOnPb9a36NlMIF4ZHC4Q1VS5M7LlZntPkd8dbe2aEUSO42M/XQsvCqY+Vvw
 jtF5RODOztaj2o7otoPFuLjO70XXiNpLXnS0V7YLqHY0eY/27tBz3XbhHNaGUg/MkZ
 N6BHT59Pry/m3mVphPuoWgznr9OL4vd1LxggREQuXJCocYMlp+x1l3WASR9Fc2xh3u
 w8X5orI1RKqnDHIRHRP6h1cigZM/b03Z1uSjuLaGxkhzmr8kIlP0hMXCkZToBb6DJC
 qnqrDm/JHoG2g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Dec 2025 18:14:38 +0100
Message-Id: <DFAVBGKJA41I.2UAE74BOHKUSS@kernel.org>
Subject: Re: [PATCH 0/4] nova-core Improve pin initializer code
Cc: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: <acourbot@nvidia.com>, <jhubbard@nvidia.com>, <apopple@nvidia.com>,
 <joelagnelf@nvidia.com>, <aliceryhl@google.com>, <lossin@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251218155239.25243-1-dakr@kernel.org>
In-Reply-To: <20251218155239.25243-1-dakr@kernel.org>
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

On Thu Dec 18, 2025 at 4:50 PM CET, Danilo Krummrich wrote:
> This is a minor series to improve some of the pin initializer code to:
>
> 1. Reduce redundancy caused by Result<impl PinInit<T, Error>> return
> values with pin_init_scope().
>
> 2. Relocate code that technically fits in the pin initializer into the
> initializer itself.

Applied to drm-rust-next, thanks!
