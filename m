Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBB2B01F39
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 16:35:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DED610E2BD;
	Fri, 11 Jul 2025 14:35:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="p2GyEklh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE4210E2BD
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 14:35:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4CE8161132;
 Fri, 11 Jul 2025 14:34:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8C4FC4CEED;
 Fri, 11 Jul 2025 14:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752244499;
 bh=T8y2b9IaX/szFDc7U8VGYNuylQX+m4cMuRZFNmQClcA=;
 h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
 b=p2GyEklhw0aFnRY1GRyyLG3UqzgB6VhFNxeIAO+2TOa9WyKUN5QS5+nD2cdHI2pCg
 GUm4jWO0DKIACnLXjXPAp+gSlzjklpPd1dbHE9zUYgCYDxycTMYPwJHgFUW7ilDs3E
 9IMiq9dUgwC0On4IVCzhJYzHaNkQYjyLyGDnOCz9F1EacCKCycUPJ/eDAxYnim2I0d
 mItEv8Fv+Xa9x+GQ76DcO4cAGdH5enmRq+KXrir+YP0BPHzn+q7hKUL53Sjqp2bDy2
 ZMNC1w9hHZiQ2+rrv6wInb2nnWZBSs1akK5dXtElNesAesDyh5ZCnoe0H5F+j+bqH1
 b+ziXBOsiVHlA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Jul 2025 16:34:52 +0200
Message-Id: <DB9ATYWI7KLT.SKAUN4HBQBVF@kernel.org>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Dave Ertman"
 <david.m.ertman@intel.com>, "Ira Weiny" <ira.weiny@intel.com>, "Leon
 Romanovsky" <leon@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Thomas Gleixner" <tglx@linutronix.de>, "Peter
 Zijlstra" <peterz@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "FUJITA
 Tomonori" <fujita.tomonori@gmail.com>, "Bjorn Helgaas"
 <bhelgaas@google.com>, =?utf-8?q?Krzysztof_Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <netdev@vger.kernel.org>, <linux-pci@vger.kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 2/2] drm: rust: rename as_ref() to from_raw() for drm
 constructors
References: <20250711-device-as-ref-v2-0-1b16ab6402d7@google.com>
 <20250711-device-as-ref-v2-2-1b16ab6402d7@google.com>
In-Reply-To: <20250711-device-as-ref-v2-2-1b16ab6402d7@google.com>
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

On Fri Jul 11, 2025 at 10:04 AM CEST, Alice Ryhl wrote:
> The prefix as_* should not be used for a constructor. Constructors
> usually use the prefix from_* instead.
>
> Some prior art in the stdlib: Box::from_raw, CString::from_raw,
> Rc::from_raw, Arc::from_raw, Waker::from_raw, File::from_raw_fd.
>
> There is also prior art in the kernel crate: cpufreq::Policy::from_raw,
> fs::File::from_raw_file, Kuid::from_raw, ARef::from_raw,
> SeqFile::from_raw, VmaNew::from_raw, Io::from_raw.
>
> Link: https://lore.kernel.org/r/aCd8D5IA0RXZvtcv@pollux
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Applied to drm-misc-next, thanks!
