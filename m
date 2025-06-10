Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1701FAD377B
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 14:56:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37D6810E53A;
	Tue, 10 Jun 2025 12:56:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iGzKdesq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3DEE10E303;
 Tue, 10 Jun 2025 12:56:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2ACE7A51266;
 Tue, 10 Jun 2025 12:56:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EB62C4CEEF;
 Tue, 10 Jun 2025 12:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749560162;
 bh=ymdmRNA1an7znV7VwE8aKDdd9upCMjadrk7wwCN+JS0=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=iGzKdesqdm1MrpyWKVIbnnnTO2O5kjtU0RWXuPsX72qmoBIf1+QGRaRjgZ2tudgyJ
 r066JMd+OFmUd03hH7AREG3eFtPRIYeT5fffPBhRHTDNsYzZrn6GSXuoczYlB+tFEM
 Xv83cl923uHkQY0nVAc6FsJLFl6Xy4uunqWmjZpzls9Pcz/9aoH+/TifQuZ8u0DNrI
 nrPNp24G+J/OqKYjScTqVdrdyOBtof8CkpfQeM/WEzZpnj9R7LbpZfTUgnHFRF9Fse
 9ejaWmya7EgYDDrJ7BRajiE9GTVPe8gd8UDUzd+NxnZW5xx5LIyQvYxetZHzMia4dg
 ACzOo9EY8FAwQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Jun 2025 14:55:55 +0200
Message-Id: <DAIVBBJADWNR.1LLZJ6YWV8IN2@kernel.org>
Cc: <a.hindborg@kernel.org>, <airlied@gmail.com>, <alex.gaynor@gmail.com>,
 <aliceryhl@google.com>, <anisse@astier.eu>, <bjorn3_gh@protonmail.com>,
 <boqun.feng@gmail.com>, <dakr@kernel.org>, <david.m.ertman@intel.com>,
 <dri-devel@lists.freedesktop.org>, <fujita.tomonori@gmail.com>,
 <gary@garyguo.net>, <gregkh@linuxfoundation.org>,
 <igor.korotin.linux@gmail.com>, <ira.weiny@intel.com>, <leitao@debian.org>,
 <leon@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <maarten.lankhorst@linux.intel.com>,
 <mcgrof@kernel.org>, <mripard@kernel.org>, <nouveau@lists.freedesktop.org>,
 <ojeda@kernel.org>, <rafael@kernel.org>, <russ.weight@linux.dev>,
 <rust-for-linux@vger.kernel.org>, <simona@ffwll.ch>, <tamird@gmail.com>,
 <tmgross@umich.edu>, <tzimmermann@suse.de>, <viresh.kumar@linaro.org>,
 <walmeida@microsoft.com>
Subject: Re: [PATCH] rust: module: remove deprecated author key
From: "Benno Lossin" <lossin@kernel.org>
To: "Guilherme Giacomo Simoes" <trintaeoitogc@gmail.com>,
 <miguel.ojeda.sandonis@gmail.com>
X-Mailer: aerc 0.20.1
References: <CANiq72kORZjTe3tPEBueDi57TGF7KfxgTSw4Tn0DQeK_X5hi5A@mail.gmail.com>
 <20250610123731.194853-1-trintaeoitogc@gmail.com>
In-Reply-To: <20250610123731.194853-1-trintaeoitogc@gmail.com>
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

On Tue Jun 10, 2025 at 2:37 PM CEST, Guilherme Giacomo Simoes wrote:
> Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrotes:
>> On Tue, Jun 10, 2025 at 12:12=E2=80=AFPM Benno Lossin <lossin@kernel.org=
> wrote:
>> >
>> > Hmm, I guess a checkpatch lint fits better then?
>>=20
>> Yeah, that would work.
>>=20
>> Probably for the C side too -- from a quick grep I don't see it.
> Maybe, after this patch we can make a checkpatch change for check the `au=
thors`
> key (and MODULE_AUTHOR for C side), and throw a WARN if the author is a n=
ame
> (not a url, or "rust for linux") and don't have a email address.=20

Most other authors fields that don't list explicit names use "Rust for
Linux Contributors", so we should probably scan for that instead.

But I think that we should no longer add any author fields using that.
Things with that are from way back in the day (when RfL was still out of
tree) where many people contributed to a single file, hence the use of
that phrase.

> Unless you guys tell me otherwise, I guess this is not so priority.

Yeah this isn't high priority. We can just make this into a
good-first-issue, then someone can eventually pick it up.

---
Cheers,
Benno
