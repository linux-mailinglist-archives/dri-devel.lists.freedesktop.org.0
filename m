Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75917A29614
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 17:21:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9C5D10E376;
	Wed,  5 Feb 2025 16:21:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lwpRGHY/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 931FF10E371;
 Wed,  5 Feb 2025 16:21:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EDEC25C5D20;
 Wed,  5 Feb 2025 16:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03B2FC4CED1;
 Wed,  5 Feb 2025 16:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738772464;
 bh=bVtZ6k6KxStzvlvxAK3RKCr3g7nXKZiR7ZfOq4UnMBg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lwpRGHY/u9bcHtadAkaxqmIPjDQ1jdQCblmVI3v8tFCDwKmhLX0ocA1peOqumPak1
 aV886zx9kRQLBJLfmqTM5VgwED+dJyOu10nCkn+QG2+n5bksKwpErLCEHC+CC8OY0I
 Sq2uv9K/8tUGYwQmMma9B0Mq0vqaI6jU+u+AumliirziND/d+p7K5q6E9ZIt3zaZSl
 3ka+RVXQISaBJf+UZRcyqjSx1vax1aSJviEYOkHrRFSsRGqHPmsCJlb+n1rXVOSI0O
 NryprBUmaxsfxKlBmPz8UwdOH1mJ7BhQ+ex33EuuwWVQYAaNwGCzwPvdyrJ2Z19Rww
 Y39O0l+cCf6qA==
Date: Wed, 5 Feb 2025 17:20:56 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Zhi Wang <zhiw@nvidia.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: airlied@gmail.com, simona@ffwll.ch, corbet@lwn.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, ajanulgu@redhat.com, lyude@redhat.com,
 pstanner@redhat.com, cjia@nvidia.com, jhubbard@nvidia.com,
 bskeggs@nvidia.com, acurrid@nvidia.com, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 2/2] gpu: nova-core: add initial documentation
Message-ID: <Z6OP6KIIuM1gcDj9@cassiopeiae>
References: <20250204190400.2550-1-dakr@kernel.org>
 <20250204190400.2550-2-dakr@kernel.org>
 <20250205155646.00003c2f@nvidia.com>
 <CANiq72mxKhCudmRaS=gwnC=gjkCLMhZcC2ZpfzKKaGX1Hivz9g@mail.gmail.com>
 <20250205165632.000016fa@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250205165632.000016fa@nvidia.com>
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

On Wed, Feb 05, 2025 at 04:56:32PM +0200, Zhi Wang wrote:
> On Wed, 5 Feb 2025 15:13:12 +0100
> Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:
> 
> > On Wed, Feb 5, 2025 at 2:57 PM Zhi Wang <zhiw@nvidia.com> wrote:
> > >
> > > It would be also helpful to make the process explicit. E.g. sharing your
> > > command lines used to checking the patches. So folks can align with the
> > > expected outcome, e.g. command line parameters.
> > 
> > These two guidelines (and generally the few others above) are intended
> > to apply to all Rust code in the kernel (i.e. not just `rust/`) --
> > their command lines are mentioned in `Documentation/rust/`. We could
> > add a note to make that clearer if that helps. So I would suggest
> > avoiding repetition here by referencing those.

Regarding the two, for me they read more like suggestions. The few others are
indeed pretty clearly documented in "general-information".

Gonna add references instead.

> > 
> > We also mention it in our "Subsystem Profile document" at
> > https://rust-for-linux.com/contributing#submit-checklist-addendum.
> 
> I think we can refer the links so that we don't need to explain the
> process in detail. I would prefer to have the exact command lines that
> maintainer are using in the doce. E.g. I was experiencing that folks using
> different params with checkpatch.pl, the outcome, .e.g. warnings are
> different. different spell-checks backend gives different errors.
> 
> It could be nice that we put the command lines explicitly so that folks
> would save some efforts on re-spin. It also saves maintainer's efforts.

Generally, I'm fine with adding the specific command that should be run before
sending patches in a single place for convenience in this document.

But maybe it makes sense to consider whether this could go into the generic Rust
documentation too?

> 
> Z.
> > 
> > > > +The availability of proper documentation is essential in terms of scalability,
> > > > +accessability for new contributors and maintainability of a project in general,
> > 
> > Typo: accessibility?
> > 
> > Cheers,
> > Miguel
> > 
> 
