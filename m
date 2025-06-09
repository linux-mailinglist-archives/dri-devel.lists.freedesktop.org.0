Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 388C6AD2531
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 19:48:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABF7410E146;
	Mon,  9 Jun 2025 17:48:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="e01OPl9T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4D8010E158;
 Mon,  9 Jun 2025 17:48:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B51F8614BD;
 Mon,  9 Jun 2025 17:48:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A63AC4CEF2;
 Mon,  9 Jun 2025 17:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749491285;
 bh=JqpU/ej16AJn7xKB2PN3FrlNtcJWEFUnBgx1d0TLyms=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=e01OPl9TtAqR/dXkMERAodgXUvag9wOXfxQV+HFm2EMDJm2bm9yiLs6gZUetSNgG+
 e39/z3Dyu3bKnMa0R1ENgsL3MTcPOJmoJ8hRe8VzEcfVWFBqVlGcDaMNt+thbcGRHv
 N6rTKe4ITBULkGEsFEXW0Dd2NTHuYNTkfbxMLf1Jp35/pmAXd1zUg+JYWXdqcLLDop
 t/sUCcWKwh+EhnPgP53sNOtX1ZkhhI8c+yPkFOhpExRzJz/vjtbnGKkKQQP96QtQkm
 0n4eL+VS/Lmmys4kIyBmrV1xLAv+3A2kxZFrr/jc5+DZBo8dCkAQzsBeXwo7Fix4D7
 kG1AqkSf8ny5g==
Message-ID: <826956a9-6a43-404a-8130-11a4a3dc663a@kernel.org>
Date: Mon, 9 Jun 2025 19:47:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: module: remove deprecated author key
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>, Viresh Kumar
 <viresh.kumar@linaro.org>, rafael@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, mcgrof@kernel.org,
 russ.weight@linux.dev, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 leitao@debian.org, david.m.ertman@intel.com, ira.weiny@intel.com,
 leon@kernel.org, fujita.tomonori@gmail.com, tamird@gmail.com,
 igor.korotin.linux@gmail.com, anisse@astier.eu, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
References: <20250609122200.179307-1-trintaeoitogc@gmail.com>
 <CANiq72==Xybm956Ete95e3YH7MTresNd3szxLg7GdzvhW1O+jg@mail.gmail.com>
Content-Language: en-US
From: Danilo Krummrich <dakr@kernel.org>
In-Reply-To: <CANiq72==Xybm956Ete95e3YH7MTresNd3szxLg7GdzvhW1O+jg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 09.06.2025 19:39, Miguel Ojeda wrote:
> On Mon, Jun 9, 2025 at 2:22 PM Guilherme Giacomo Simoes
> <trintaeoitogc@gmail.com> wrote:
>>
>> Now that all in-tree modules have migrated to `authors`, remove:
> 
> Nit: I would have said "most modules", since we have new/remaining
> ones (no need for a new version for this).
> 
> I think this patch is OK -- we could wait to do this more cycles, but
> if we are doing it, then probably the sooner we do it, the simpler.
> 
>>  drivers/cpufreq/rcpufreq_dt.rs        | 2 +-
>>  drivers/gpu/drm/nova/nova.rs          | 2 +-
>>  drivers/gpu/nova-core/nova_core.rs    | 2 +-
>>  rust/kernel/firmware.rs               | 2 +-
>>  samples/rust/rust_configfs.rs         | 2 +-
>>  samples/rust/rust_driver_auxiliary.rs | 2 +-
> 
> Andreas, Danilo, Greg, Viresh: if nobody is against it, I will apply
> it this cycle. Acked-by's for your bits appreciated, of course.

Acked-by: Danilo Krummrich <dakr@kernel.org>

