Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87491A5874B
	for <lists+dri-devel@lfdr.de>; Sun,  9 Mar 2025 19:40:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0597F10E046;
	Sun,  9 Mar 2025 18:40:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Fou6gAfH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 313E210E046;
 Sun,  9 Mar 2025 18:40:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0B2CF5C06AC;
 Sun,  9 Mar 2025 18:38:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2EC8C4CEEC;
 Sun,  9 Mar 2025 18:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741545632;
 bh=wxAdK4cesWjR2yjL5pnLFSlTuVjdMgVxI0GcMjaQjAM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Fou6gAfHQJ/gv2gkxO3GKSNmNnTelGd0UGlZ0La4k5xj7+GaGkNbLcrT+lss2BKig
 MC+nG+PWVvPMBrjyPwYpI4FOg+iC4AtZ9/61nFacfOq0jPVxS1b9FJ7V4333QNGJcP
 JpWpPp6jkI6CUcNuDON/pAwUeFh76rcGpKynltJm/lso0kRYrf0NbQ6mmoNzi4IOiT
 c+he/4n6ZPXoL5xdXLQxBMOpdlbnJmd+7MfhnVctCnABWbvEatqaIe/bTgaOWIQ9AA
 ZRwMoZjSnV0rlLKFR9TeuhMEHYmNvXCSxVSD3efx3w7BxWuQyMfxnRxYj9Gf9jgkVP
 3gDNAzSDnvjsw==
Date: Sun, 9 Mar 2025 19:40:24 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: airlied@gmail.com, simona@ffwll.ch, corbet@lwn.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, ajanulgu@redhat.com, lyude@redhat.com,
 pstanner@redhat.com, zhiw@nvidia.com, cjia@nvidia.com,
 jhubbard@nvidia.com, bskeggs@nvidia.com, acurrid@nvidia.com
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 gregkh@linuxfoundation.org, mcgrof@kernel.org,
 russ.weight@linux.dev, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v6 0/5] Initial Nova Core series
Message-ID: <Z83gmL38o8BsQKUi@cassiopeiae>
References: <20250306222336.23482-1-dakr@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306222336.23482-1-dakr@kernel.org>
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

On Thu, Mar 06, 2025 at 11:23:26PM +0100, Danilo Krummrich wrote:
> This is the initial series for the nova-core stub driver.

Applied to nova-next, thanks!
