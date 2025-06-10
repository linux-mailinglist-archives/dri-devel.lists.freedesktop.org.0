Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2DAAD30FE
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 10:56:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9688210E4A0;
	Tue, 10 Jun 2025 08:56:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MpwKaJms";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F141710E49F;
 Tue, 10 Jun 2025 08:56:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 21BA3A5101B;
 Tue, 10 Jun 2025 08:56:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 907D6C4CEED;
 Tue, 10 Jun 2025 08:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749545768;
 bh=FDylNM5QiKDVslap+v69luYbNSSeUxYW7i/sVB1GflI=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=MpwKaJmscN1m61JeMuiBSNXN04P15jq1shwdEt0PGS9cTHeGx6whJWd9idQvI5qF0
 Y1HX7p8J8Yk9n8V3hxj9UwSRBQwRVTz4DIpRSqpaDlGRmZ2vEQ5BdnvDLiAXJkv1iD
 rL2lfRcKhaVmjG4DJyjH8ARKr7s5FD5OEBbmnakyhltz1OH09yj2yanzliL4BcQWLG
 dPpjlqKoyxWOzO48ba76ZkrJflVMutLfxa5W7mnViJu7ocCb2Y3Kl8z2yftNwENtMM
 VjAd73v8nyQsg9PlDv8pz/Az+2on8uxvxC+2/niv60Uos6Tp3bsdk8IlpeVY3JqJVn
 rXd5xQpKDqt3w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Jun 2025 10:56:00 +0200
Message-Id: <DAIQ7MZ4BJN8.3QO6IHT7OPWFS@kernel.org>
Cc: <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: module: remove deprecated author key
From: "Benno Lossin" <lossin@kernel.org>
To: "Guilherme Giacomo Simoes" <trintaeoitogc@gmail.com>,
 <rafael@kernel.org>, <viresh.kumar@linaro.org>, <dakr@kernel.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <mcgrof@kernel.org>, <russ.weight@linux.dev>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>, <leitao@debian.org>,
 <gregkh@linuxfoundation.org>, <david.m.ertman@intel.com>,
 <ira.weiny@intel.com>, <leon@kernel.org>, <fujita.tomonori@gmail.com>,
 <tamird@gmail.com>, <igor.korotin.linux@gmail.com>,
 <walmeida@microsoft.com>, <anisse@astier.eu>
X-Mailer: aerc 0.20.1
References: <20250609122200.179307-1-trintaeoitogc@gmail.com>
In-Reply-To: <20250609122200.179307-1-trintaeoitogc@gmail.com>
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

On Mon Jun 9, 2025 at 2:22 PM CEST, Guilherme Giacomo Simoes wrote:
> Commit 38559da6afb2 ("rust: module: introduce `authors` key") introduced
> a new `authors` key to support multiple module authors, while keeping
> the old `author` key for backward compatibility.
>
> Now that all in-tree modules have migrated to `authors`, remove:
> 1. The deprecated `author` key support from the module macro
> 2. Legacy `author` entries from remaining modules
>
> Signed-off-by: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
> ---
>  drivers/cpufreq/rcpufreq_dt.rs        | 2 +-
>  drivers/gpu/drm/nova/nova.rs          | 2 +-
>  drivers/gpu/nova-core/nova_core.rs    | 2 +-
>  rust/kernel/firmware.rs               | 2 +-
>  rust/macros/module.rs                 | 6 ------
>  samples/rust/rust_configfs.rs         | 2 +-
>  samples/rust/rust_driver_auxiliary.rs | 2 +-
>  7 files changed, 6 insertions(+), 12 deletions(-)

Reviewed-by: Benno Lossin <lossin@kernel.org>

---
Cheers,
Benno
