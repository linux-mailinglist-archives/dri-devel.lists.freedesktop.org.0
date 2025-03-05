Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A10E6A50C07
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 20:56:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D30610E0DD;
	Wed,  5 Mar 2025 19:56:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Tu5QG/9S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2983410E0DD;
 Wed,  5 Mar 2025 19:56:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 464F75C6C5B;
 Wed,  5 Mar 2025 19:54:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22DF0C4CED1;
 Wed,  5 Mar 2025 19:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741204610;
 bh=tHSKWwl3ha1y5igXyzymqDuF6lQTvM1zbhu3+g/qgJU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Tu5QG/9SpMYQUa8MRGPA1RC06rAh3B2yWsKvKOW6ZLAIskB5bxCBOtbALANu1yasf
 HYl/les0LAJ4JEmz1RjiywpgHYGSdT69S8mndOhTDZG24B5dO8+udH5OKg+3/3sqSl
 hen0e7YDXp8E/7WAHKQ3K9xtr3aeUrlCz2Zp0gtrmcuThe7MtC/ZxYOTMqo5kM+VB2
 wtls0g3r6q23U4b7/okLTDV2a9EUyJkI58qkBBXIIcI71FZeQr9D8DI9t2ua0ZbKUA
 Y6KBe24O6hH8uZ3nGGCUsxRs4Oe6BUoPvSeuzj4+VMWvLqiCcPoi8pWWLkT3c3Q579
 ZDdOqcxazc3dw==
Date: Wed, 5 Mar 2025 20:56:42 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org, mcgrof@kernel.org, russ.weight@linux.dev
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 airlied@gmail.com, simona@ffwll.ch, corbet@lwn.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, ajanulgu@redhat.com, lyude@redhat.com,
 pstanner@redhat.com, zhiw@nvidia.com, cjia@nvidia.com,
 jhubbard@nvidia.com, bskeggs@nvidia.com, acurrid@nvidia.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v5 0/5] Initial Nova Core series
Message-ID: <Z8isev0gwQJPs7S9@cassiopeiae>
References: <20250304173555.2496-1-dakr@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304173555.2496-1-dakr@kernel.org>
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

On Tue, Mar 04, 2025 at 06:34:47PM +0100, Danilo Krummrich wrote:
> Danilo Krummrich (5):
>   rust: module: add type `LocalModule`
>   rust: firmware: introduce `firmware::ModInfoBuilder`
>   rust: firmware: add `module_firmware!` macro

Greg, Luis, Russ, any objections on me taking the two firmware patches through
the nova tree?

>   gpu: nova-core: add initial driver stub
>   gpu: nova-core: add initial documentation
