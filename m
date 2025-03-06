Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C86A54C81
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 14:45:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C889F10E981;
	Thu,  6 Mar 2025 13:45:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LL3EFMl8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A74B10E977;
 Thu,  6 Mar 2025 13:45:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DA2685C48E2;
 Thu,  6 Mar 2025 13:42:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 936EDC4CEE4;
 Thu,  6 Mar 2025 13:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741268713;
 bh=W/pLRzzCmKndl4i2cPdDqVunl8ECSHU4worQHHjuI3g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LL3EFMl8f/nuP1WsPibX1shS/JHV+dq34WHn35A+4Ni45fh2P+7iyWgA7S6uMv4py
 JJAkRCViZogb4z0YWCYUE2Gz9V+p+FBSeo5+hNp4lSjLLbBlmsmqvRtQHlVax1Id5m
 aMjf4wvokfguXu59H4gGpryCxEyYimv4ZH58GrmTxjJrK80dCGLDjXsx97MzZ758yi
 f6dYBLIO06oExGQh/U2abS+ru99SgT8dCDY6q4q0zeaykGiwAsCPHGFn1nVU6gdrep
 RosZ/T5VgXu7VEPaRPWFrhe95rPWZM84sFzHgVAmA9JvDl5kllS88xQzeELCzTfzIe
 pqSF9MsJpMVFg==
Date: Thu, 6 Mar 2025 14:45:05 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: airlied@gmail.com, simona@ffwll.ch, corbet@lwn.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, ajanulgu@redhat.com, lyude@redhat.com,
 pstanner@redhat.com, zhiw@nvidia.com, cjia@nvidia.com,
 jhubbard@nvidia.com, bskeggs@nvidia.com, acurrid@nvidia.com,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 gregkh@linuxfoundation.org, mcgrof@kernel.org,
 russ.weight@linux.dev, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v5 5/5] gpu: nova-core: add initial documentation
Message-ID: <Z8mm4fJQxXMiN5tu@cassiopeiae>
References: <20250304173555.2496-1-dakr@kernel.org>
 <20250304173555.2496-6-dakr@kernel.org>
 <20250306.215638.838863448505767234.fujita.tomonori@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306.215638.838863448505767234.fujita.tomonori@gmail.com>
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

On Thu, Mar 06, 2025 at 09:56:38PM +0900, FUJITA Tomonori wrote:
> On Tue,  4 Mar 2025 18:34:52 +0100
> Danilo Krummrich <dakr@kernel.org> wrote:
> 
> > +Delay / Sleep abstractions
> > +--------------------------
> > +
> > +Rust abstractions for the kernel's delay() and sleep() functions.
> > +
> > +There is some ongoing work from FUJITA Tomonori [1], which has not seen any updates
> > +since Oct. 24.
> > +
> > +| Complexity: Beginner
> > +| Link: https://lore.kernel.org/netdev/20241001112512.4861-2-fujita.tomonori@gmail.com/ [1]
> 
> I posted v11 last month.
> 
> https://lore.kernel.org/netdev/20250220070611.214262-1-fujita.tomonori@gmail.com/

Thanks for letting me know.

I think I lost track of this because in v1 the series was named "add delay
abstraction (sleep functions)" and with v2 it was switched to "rust: Add IO
polling" and I was searching for subsequent patch series with the "delay"
keyword.

Anyways, AFAICS you ended up with adding fsleep(). I think nova-core will need
control over having a busy loop or actually re-schedule.

I will update this entry accordingly.
