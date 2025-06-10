Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AAAAD3308
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 12:02:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2F2F10E4DE;
	Tue, 10 Jun 2025 10:02:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TyNXnWp/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4068D10E4D8;
 Tue, 10 Jun 2025 10:02:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 928495C3B9A;
 Tue, 10 Jun 2025 10:00:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4620C4CEED;
 Tue, 10 Jun 2025 10:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1749549768;
 bh=10QgRGlAdUB6j196B6SS3g0F3Ydy3EG+vkL/4Ux7/yU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TyNXnWp/XjQS6G0rz7cg62OU0fVgQI9t7GZyP3AL8lXjRSLvNNWVvo1Z+C1Px+G7C
 bfqql6lAhNvSWb97v6YVR9KqPc3dTHQ0C28RU9QR3dM9hWRLhKix+ccrwYeW3O2O5D
 aTb/expteWzTEbdnUl7Um7Q3L0vVug/814OLGsXE=
Date: Tue, 10 Jun 2025 12:02:46 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, rafael@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 mcgrof@kernel.org, russ.weight@linux.dev, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, leitao@debian.org, david.m.ertman@intel.com,
 ira.weiny@intel.com, leon@kernel.org, fujita.tomonori@gmail.com,
 tamird@gmail.com, igor.korotin.linux@gmail.com, anisse@astier.eu,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: module: remove deprecated author key
Message-ID: <2025061038-trash-clammy-6e49@gregkh>
References: <20250609122200.179307-1-trintaeoitogc@gmail.com>
 <CANiq72==Xybm956Ete95e3YH7MTresNd3szxLg7GdzvhW1O+jg@mail.gmail.com>
 <826956a9-6a43-404a-8130-11a4a3dc663a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <826956a9-6a43-404a-8130-11a4a3dc663a@kernel.org>
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

On Mon, Jun 09, 2025 at 07:47:55PM +0200, Danilo Krummrich wrote:
> On 09.06.2025 19:39, Miguel Ojeda wrote:
> > On Mon, Jun 9, 2025 at 2:22 PM Guilherme Giacomo Simoes
> > <trintaeoitogc@gmail.com> wrote:
> >>
> >> Now that all in-tree modules have migrated to `authors`, remove:
> > 
> > Nit: I would have said "most modules", since we have new/remaining
> > ones (no need for a new version for this).
> > 
> > I think this patch is OK -- we could wait to do this more cycles, but
> > if we are doing it, then probably the sooner we do it, the simpler.
> > 
> >>  drivers/cpufreq/rcpufreq_dt.rs        | 2 +-
> >>  drivers/gpu/drm/nova/nova.rs          | 2 +-
> >>  drivers/gpu/nova-core/nova_core.rs    | 2 +-
> >>  rust/kernel/firmware.rs               | 2 +-
> >>  samples/rust/rust_configfs.rs         | 2 +-
> >>  samples/rust/rust_driver_auxiliary.rs | 2 +-
> > 
> > Andreas, Danilo, Greg, Viresh: if nobody is against it, I will apply
> > it this cycle. Acked-by's for your bits appreciated, of course.
> 
> Acked-by: Danilo Krummrich <dakr@kernel.org>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
