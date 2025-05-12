Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB25AB44C6
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 21:18:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9224010E1E4;
	Mon, 12 May 2025 19:18:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DBx4N7fU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AFCA10E14F;
 Mon, 12 May 2025 19:18:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 400D8A4C829;
 Mon, 12 May 2025 19:18:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C638C4CEEF;
 Mon, 12 May 2025 19:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747077517;
 bh=XOHvEQa7U216c0WoSRd6/3fB2wSroS71mMJOWWLQAa8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DBx4N7fUXn8H7/SQ8Lg1EFwlZm3r8QmanQa9M3twS+ECuKhW/bg/5Wix10q/CdqRy
 BA9RMoFV7/FVqC7nr3ir98Cr2Y8rc//X8kZk8Y5LXdoy8w1tDIHUzcTp0yGs1+ddUy
 2NIW2cY3DM7DS2pGJ4WIrNHiJrj8G58s2N9duNUQWzggx/amsEZtdWCJZuF4f5YFXT
 R0gCbqNYijtIDxz0i+UEdUYTvVLM6/MbmW3Q9B/BEN5t15BE4Xa3lfkS42yBRbVThn
 cGwgrnJr/sfFgJqzLlLWYgZJosB/NgnIUhs4Q4WXYPOlpfkyFHgy5LgTNjEKUZ1BN5
 5p7xVKrgFg3pg==
Date: Mon, 12 May 2025 21:18:29 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, ajanulgu@redhat.com,
 lyude@redhat.com, pstanner@redhat.com, zhiw@nvidia.com,
 cjia@nvidia.com, jhubbard@nvidia.com, bskeggs@nvidia.com,
 acurrid@nvidia.com, joelagnelf@nvidia.com, ttabi@nvidia.com,
 acourbot@nvidia.com
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Nova DRM skeleton driver
Message-ID: <aCJJheFGR0TMN5ha@pollux>
References: <20250424160452.8070-1-dakr@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424160452.8070-1-dakr@kernel.org>
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

On Thu, Apr 24, 2025 at 06:02:48PM +0200, Danilo Krummrich wrote:
> This patch series adds the nova-drm skeleton driver.

Applied to nova-next, thanks!
